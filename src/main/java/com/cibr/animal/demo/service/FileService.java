package com.cibr.animal.demo.service;

import com.alibaba.fastjson.JSONObject;
import com.cibr.animal.demo.dao.CibrSysFileMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

@Service
public class FileService {

    @Value("${animal.fileUploadPath}")
    private String filePath;

    private Logger logger = LoggerFactory.getLogger(FileService.class);

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private CibrSysFileMapper fileMapper;

    @Autowired
    private AnimalService animalService;

    @Autowired
    private StockService stockService;

    @Transactional(rollbackFor = Exception.class)
    public File saveFile(List<MultipartFile> files,String detailId,CibrSysUser user){
        File dist = null;
        for (MultipartFile file : files){
            if (file.isEmpty()){
                throw new RuntimeException("上传的文件为空！");
            }
            String fileName = file.getOriginalFilename();
            File path = new File(filePath);
            if (!path.exists()){
                path.mkdirs();
            }
            dist = new File(filePath + File.separator+ Util.getUUID() + fileName);
            logger.debug(dist.getPath());
            String md5 = null;
            try {
                md5 = DigestUtils.md5DigestAsHex(file.getInputStream());
                file.transferTo(dist);
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
            CibrSysFile cibrSysFile = new CibrSysFile();
            cibrSysFile.setId(Util.getUUID());
            cibrSysFile.setCreater(user.getId());
            cibrSysFile.setCreatetime(new Date());
            cibrSysFile.setDetailid(detailId);
            cibrSysFile.setFilestatu("00");
            cibrSysFile.setMd5(md5);
            cibrSysFile.setName(dist.getName());
            cibrSysFile.setPath(dist.getPath());
            fileMapper.insert(cibrSysFile);
        }
        return dist;
    }

    public List<CibrTaskProcessSampleinput> handleSampleInput(List<List<String>> rows, MultipartFile file, String processId, CibrSysUser user) {
        String fileName = file.getOriginalFilename();
        List<CibrTaskProcessSampleinput> list = new ArrayList<CibrTaskProcessSampleinput>();
        CibrTaskProcess process = processTaskService.getPorcessById(processId);
        logger.info(JSONObject.toJSONString(process));
        if (
                ("01".equals(process.getSampletype()) && !fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME))
                || ("02".equals(process.getSampletype()) && !fileName.contains(FileUtil.TISSUE_FILENAME))
                || ("03".equals(process.getSampletype()) && !fileName.contains(FileUtil.CELL_FILENAME))
        ){
            throw new RuntimeException("导入的文件类型与任务类型不相符");
        }

        int rowIndex = 0;
        for (List<String> row : rows){
            if (StringUtils.isEmpty(row.get(0))){
                continue;
            }
            CibrTaskProcessSampleinput input = new CibrTaskProcessSampleinput();
            input.setId(Util.getUUID());
            input.setProcessid(processId);
            input.setCreater(user.getId());
            input.setCreatetime(new Date());
            input.setRowindex(rowIndex);
            //上传文件为临时状态，等待用户确认之后再修改状态
            input.setCurrentstatu("00");
            input.setSamplename(row.get(0));
            input.setSpecies(row.get(1));
            input.setTissue(row.get(2));
            String sampleMsg = "";
            if (row.get(3) != null){
                if (fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(row.get(3),FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (fileName.contains(FileUtil.TISSUE_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(row.get(3),FileUtil.TISSUE_FILENAME);
                }
            }
            input.setSamplemsg(sampleMsg);
            String sampleStatu = "";
            if (row.get(4) != null){
                if (fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(4),FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (fileName.contains(FileUtil.TISSUE_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(4),FileUtil.TISSUE_FILENAME);
                }else if (fileName.contains(FileUtil.CELL_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(4),FileUtil.CELL_FILENAME);
                }
            }
            input.setSamplestatu(sampleStatu);
            if (fileName != null && fileName.contains(FileUtil.TISSUE_FILENAME)){
                input.setTissuenumber(row.get(5));
                input.setBloodvolume(row.get(6));
            }
            if (fileName != null && !fileName.contains(FileUtil.TISSUE_FILENAME)){
                input.setConcentration(row.get(7));
                input.setSamplevolume(row.get(8));
                input.setTotalnumber(row.get(9));
            }
            if (fileName != null && fileName.contains(FileUtil.CELL_FILENAME)){
                input.setCelllife(row.get(10));
                String cellSort = "";
                cellSort = FileUtil.getCellSortCode(row.get(11));
                input.setCellsort(cellSort);
            }

            String databaseType = "";
            if (fileName != null && fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(12),FileUtil.NUCLEIC_ACID_FILENAME);
            }else if (fileName != null && fileName.contains(FileUtil.TISSUE_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(12),FileUtil.TISSUE_FILENAME);
            }else if (fileName != null && fileName.contains(FileUtil.CELL_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(12),FileUtil.CELL_FILENAME);
            }
            input.setDatabasetype(databaseType);

            String seq = "";
            seq = FileUtil.getSeqCode(row.get(13));
            input.setSequencingplatform(seq);
            input.setRemarks(row.get(14));
            list.add(input);
            rowIndex ++;
        }
        return list;
    }

    @Transactional(rollbackFor = Exception.class)
    public void handleDrosoInput(Map<String, List<List<String>>> allWorkSheet, MultipartFile file, CibrSysUser user) throws ParseException, CloneNotSupportedException {
        List<CibrAnimalDrosophila> allDrosos = animalService.getAllDrosos();
        Map<String,CibrAnimalDrosophila> geno_droso = new HashMap<>();
        for (CibrAnimalDrosophila drosophila : allDrosos){
            geno_droso.put(drosophila.getGenotype(),drosophila);
        }
        List<CibrAnimalDrosophila> newDrosos = new ArrayList<CibrAnimalDrosophila>();
        List<CibrStockDrosophila> newStock = new ArrayList<CibrStockDrosophila>();
        for (String key : allWorkSheet.keySet()){
            if ("已有果蝇品系".equals(key)){
                List<List<String>> lists = allWorkSheet.get(key);
                boolean syFlag = false;
                boolean bzFlag = false;
                boolean hasData = false;
                for (List<String> list : lists){
                    if ("实验".equals(list.get(0))){
                        syFlag = true;
                        continue;
                    }
                    if ("保种".equals(list.get(0))){
                        syFlag = false;
                        bzFlag = true;
                        continue;
                    }
                    if ("stock ID".equals(list.get(0))){
                        hasData = true;
                        continue;
                    }
                    if (StringUtils.isEmpty(list.get(0))){
                        hasData = false;
                    }
                    if ("Phic-31".equals(list.get(0))){
                        System.out.println();
                    }
                    logger.info("======" + Arrays.toString(list.toArray()));
                    if (hasData){
                        CibrAnimalDrosophila drosophila = null;
                        if (geno_droso.get(list.get(1)) == null){
                            drosophila = new CibrAnimalDrosophila();
                            String animalId = Util.getUUID();
                            drosophila.setId(animalId);
                            drosophila.setCreatetime(new Date());
                            drosophila.setCreateuser(user.getId());
                            drosophila.setResource(list.get(2));
                            drosophila.setStockId(list.get(0));
                            drosophila.setName("果蝇");
                            drosophila.setGenotype(list.get(1));
                            newDrosos.add(drosophila);
                            geno_droso.put(drosophila.getGenotype(),drosophila);
                        }else {
                            drosophila = geno_droso.get(list.get(1));
                        }
                        CibrStockDrosophila stockDrosophila = new CibrStockDrosophila();
                        stockDrosophila.setId(Util.getUUID());
                        stockDrosophila.setCreatetime(new Date());
                        stockDrosophila.setContanertype(list.get(3));
                        stockDrosophila.setContanernmuber(new BigDecimal(list.get(4)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                        stockDrosophila.setCreateuser(user.getId());
                        stockDrosophila.setRawnumber(new BigDecimal(list.get(4)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                        stockDrosophila.setRawtype(list.get(3));
                        stockDrosophila.setDrosophilaId(drosophila.getId());
                        if (syFlag){
                            stockDrosophila.setUsagetype("stock");
                            stockDrosophila.setBirthday(Util.str2date(list.get(6),"yyyy.MM.dd"));
                            stockDrosophila.setEnvironment("sdafsdfasdfasdf");
                        }else {
                            stockDrosophila.setUsagetype("keep");
                            stockDrosophila.setBirthday(new Date());
                            CibrStockDrosophila clone = (CibrStockDrosophila)stockDrosophila.clone();
                            stockDrosophila.setEnvironment("sdafsdfasdfasdf");
                            clone.setEnvironment("sdafsdfasdfasde");
                            clone.setId(Util.getUUID());
                            clone.setContanernmuber(new BigDecimal(list.get(5)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                            newStock.add(clone);
                        }
                        newStock.add(stockDrosophila);
                    }
                }
                stockService.batchInsert(newStock);
                animalService.batchInsert(newDrosos);
            }
        }
    }
}
