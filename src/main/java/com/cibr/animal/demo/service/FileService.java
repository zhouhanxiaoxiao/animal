package com.cibr.animal.demo.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cibr.animal.demo.dao.CibrSysFileMapper;
import com.cibr.animal.demo.dao.CibrSysSampleindexMapper;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.*;

@Service
public class FileService {

    @Value("${animal.fileUploadPath}")
    private String filePath;

    public static final String USER_HEAD_DIR = "userhead";

    private Logger logger = LoggerFactory.getLogger(FileService.class);

    @Value("${img.path}")
    private String imgPath;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private CibrSysFileMapper fileMapper;

    @Autowired
    private AnimalService animalService;

    @Autowired
    private StockService stockService;

    @Autowired
    private UserService userService;

    @Autowired
    private CibrSysSampleindexMapper sampleindexMapper;


    @Transactional(rollbackFor = Exception.class)
    public File saveFiles(List<MultipartFile> files,List<String> detailIds,CibrSysUser user){
        File dist = null;
        List<CibrSysFile> list = new ArrayList<>();
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
            for (String detailId : detailIds){
                CibrSysFile cibrSysFile = new CibrSysFile();
                cibrSysFile.setId(Util.getUUID());
                cibrSysFile.setCreater(user.getId());
                cibrSysFile.setCreatetime(new Date());
                cibrSysFile.setDetailid(detailId);
                cibrSysFile.setFilestatu("00");
                cibrSysFile.setMd5(md5);
                cibrSysFile.setName(dist.getName());
                cibrSysFile.setPath(dist.getPath());
                cibrSysFile.setRealname(fileName);
                list.add(cibrSysFile);
            }
        }
        if (list.size() > 0){
            fileMapper.batchInsert(list);
        }
        return dist;
    }

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
            Util.replaceSpecialChar(dist.getName());
            CibrSysFile cibrSysFile = new CibrSysFile();
            cibrSysFile.setId(Util.getUUID());
            cibrSysFile.setCreater(user.getId());
            cibrSysFile.setCreatetime(new Date());
            cibrSysFile.setDetailid(detailId);
            cibrSysFile.setFilestatu("00");
            cibrSysFile.setMd5(md5);
            cibrSysFile.setName(Util.replaceSpecialChar(dist.getName()));
            cibrSysFile.setPath(Util.replaceSpecialChar(dist.getPath()));
            cibrSysFile.setRealname(Util.replaceSpecialChar(fileName));
            fileMapper.insert(cibrSysFile);
        }
        return dist;
    }

    @Transactional(rollbackFor = Exception.class)
    public List<CibrTaskProcessSampleinput> handleSampleInput(List<List<String>> rows, MultipartFile file, String processId, CibrSysUser user) {
        String fileName = file.getOriginalFilename();
        List<CibrTaskProcessSampleinput> list = new ArrayList<CibrTaskProcessSampleinput>();
        CibrTaskProcess process = processTaskService.getPorcessById(processId);

        CibrTaskProcessSampleinputExample sampleinputExample = new CibrTaskProcessSampleinputExample();
        sampleinputExample.createCriteria().andProcessidEqualTo(processId);
        sampleinputExample.setOrderByClause("rowIndex");


        logger.info(JSONObject.toJSONString(process));
//        if (
//                ("01".equals(process.getSampletype()) && !fileName.contains(FileUtil.NUCLEIC_ACID_FILENAME))
//                || ("02".equals(process.getSampletype()) && !fileName.contains(FileUtil.TISSUE_FILENAME))
//                || ("03".equals(process.getSampletype()) && !fileName.contains(FileUtil.CELL_FILENAME))
//        ){
//            throw new RuntimeException("导入的文件类型与任务类型不相符");
//        }
        Map<String, CibrSysSampleindex> currentIndexs = processTaskService.getCurrentIndex();
        int rowIndex = 0;
        for (List<String> row : rows){

            CibrTaskProcessSampleinput input = new CibrTaskProcessSampleinput();
            input.setId(Util.getUUID());
            input.setProcessid(processId);
            input.setCreater(user.getId());
            input.setCreatetime(new Date());
            input.setRowindex(rowIndex);
            //上传文件为临时状态，等待用户确认之后再修改状态
            input.setCurrentstatu("00");
            String initSample = row.get(0);
            input.setInitsample(FileUtil.getInitSampleType(initSample));
            input.setArrindex(row.get(1));
            input.setSamplename(row.get(2));
            input.setSpecies(row.get(3));
            input.setTissue(row.get(4));
            String sampleMsg = "";
            if (row.get(5) != null){
                if (initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(row.get(5),FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (initSample.contains(FileUtil.TISSUE_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(row.get(5),FileUtil.TISSUE_FILENAME);
                }else if (initSample.contains(FileUtil.CELL_FILENAME)){
                    sampleMsg = FileUtil.getSampleMsgCode(row.get(5),FileUtil.CELL_FILENAME);
                }
            }
            input.setSamplemsg(sampleMsg);
            String sampleStatu = "";
            if (row.get(6) != null){
                if (initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(6),FileUtil.NUCLEIC_ACID_FILENAME);
                }else if (initSample.contains(FileUtil.TISSUE_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(6),FileUtil.TISSUE_FILENAME);
                }else if (initSample.contains(FileUtil.CELL_FILENAME)){
                    sampleStatu = FileUtil.getSampleStatuCode(row.get(6),FileUtil.CELL_FILENAME);
                }
            }
            input.setSamplestatu(sampleStatu);
            if (initSample != null && initSample.contains(FileUtil.TISSUE_FILENAME)){
                input.setTissuenumber(row.get(7));
                input.setBloodvolume(row.get(8));
            }
            if (initSample != null && !initSample.contains(FileUtil.TISSUE_FILENAME)){
                input.setConcentration(row.get(9));
                input.setSamplevolume(row.get(10));
                input.setTotalnumber(row.get(11));
            }
            if (initSample != null && initSample.contains(FileUtil.CELL_FILENAME)){
                input.setCelllife(row.get(12));
                String cellSort = "";
                cellSort = FileUtil.getCellSortCode(row.get(13));
                input.setCellsort(cellSort);
            }
            String databaseType = "";
            if (initSample != null && initSample.contains(FileUtil.NUCLEIC_ACID_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(14),FileUtil.NUCLEIC_ACID_FILENAME);
            }else if (initSample != null && initSample.contains(FileUtil.TISSUE_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(14),FileUtil.TISSUE_FILENAME);
            }else if (initSample != null && initSample.contains(FileUtil.CELL_FILENAME)){
                databaseType = FileUtil.getDatabaseType(row.get(14),FileUtil.CELL_FILENAME);
            }
            input.setDatabasetype(databaseType);
            String seq = "";
            seq = FileUtil.getSeqCode(row.get(15));
            logger.info(JSON.toJSONString(input));
            String selfNum = Util.getSelfNum(input.getInitsample(), sampleMsg, databaseType);
            CibrSysSampleindex sampleindex = currentIndexs.get(selfNum);
            sampleindex.setCurrentindex(sampleindex.getCurrentindex() + 1);
            input.setSampleindex(sampleindex.getSelfNum());
            input.setSequencingplatform(seq);
            input.setRemarks(row.get(16));
            list.add(input);
            rowIndex ++;
        }
        processTaskService.updateSampleIndex(currentIndexs);
        return list;
    }

    @Transactional(rollbackFor = Exception.class)
    public void handleDrosoInput(Map<String, List<List<String>>> allWorkSheet, MultipartFile file, CibrSysUser user) throws ParseException, CloneNotSupportedException {
        List<CibrAnimalDrosophila> allDrosos = animalService.getAllDrosos();
        Map<String,CibrAnimalDrosophila> geno_droso = new HashMap<>();
        for (CibrAnimalDrosophila drosophila : allDrosos){
            geno_droso.put(drosophila.getSelfindex(),drosophila);
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
                    if ("stock ID".equals(list.get(0)) || "编号".equals(list.get(0))){
                        hasData = true;
                        continue;
                    }
                    if (StringUtils.isEmpty(list.get(0))){
                        hasData = false;
                    }
                    logger.info("======" + Arrays.toString(list.toArray()));
                    if (hasData && bzFlag){
                        CibrAnimalDrosophila drosophila = null;
                        if (geno_droso.get(list.get(0)) == null){
                            drosophila = new CibrAnimalDrosophila();
                            String animalId = Util.getUUID();
                            drosophila.setId(animalId);
                            drosophila.setCreatetime(new Date());
                            drosophila.setCreateuser(user.getId());
                            drosophila.setResource(list.get(3));
                            drosophila.setStockId(list.get(1));
                            drosophila.setName("果蝇");
                            drosophila.setGenotype(list.get(2));
                            drosophila.setSelfindex(list.get(0));
                            drosophila.setCurstatu("01");
                            newDrosos.add(drosophila);
                            geno_droso.put(drosophila.getSelfindex(),drosophila);
                        }else {
                            drosophila = geno_droso.get(list.get(0));
                        }
                        CibrStockDrosophila stockDrosophila = new CibrStockDrosophila();
                        stockDrosophila.setId(Util.getUUID());
                        stockDrosophila.setCreatetime(new Date());
                        stockDrosophila.setContanertype(list.get(4));
                        stockDrosophila.setContanernmuber(new BigDecimal(list.get(5)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                        stockDrosophila.setCreateuser(user.getId());
                        stockDrosophila.setRawnumber(new BigDecimal(list.get(5)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                        stockDrosophila.setRawtype(list.get(4));
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
                            clone.setContanernmuber(new BigDecimal(list.get(6)).setScale(0,BigDecimal.ROUND_HALF_UP).intValue());
                            newStock.add(clone);
                        }
                        newStock.add(stockDrosophila);
                    }
                }
                if (newStock.size() > 0){
                    stockService.batchInsert(newStock);
                }
                if (newDrosos.size() > 0){
                    animalService.batchInsert(newDrosos);
                }
            }
        }
    }

    public void saveUserHeader(MultipartFile file, Object o, CibrSysUser user) throws IOException {
        File path = new File(filePath + File.separator+ USER_HEAD_DIR + File.separator);
        if (!path.exists()){
            path.mkdirs();
        }
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String userHead = filePath + File.separator+ USER_HEAD_DIR + File.separator + user.getId() + suffix;
        File dist = new File(userHead);
        file.transferTo(dist);
        user.setUserdesc(userHead);
        userService.updateUserById(user);
    }

    public File getUserHead(String userId) throws FileNotFoundException {
        CibrSysUser user = userService.getUserById(userId.substring(0,userId.indexOf(".")));
        try {
            File img = new File(user.getUserdesc());
            return img;
        }catch (Exception e){
            int i = new Random().nextInt(4) + 1;
            File file = ResourceUtils.getFile("classpath:templates/" + i + ".png");
            return file;
        }
    }

    @Transactional(rollbackFor = Exception.class)
    public void saveMakeUploadFile(CibrSysUser user, String makeId, MultipartFile file) {
        List<MultipartFile> files = new ArrayList<>();
        files.add(file);
        saveFile(files,makeId,user);
    }

    public HSSFWorkbook exportExcel(List<List<String>> excleRows,CibrSysUser user) {
        return FileUtil.write(excleRows);
    }

    public List<CibrSysFile> getfileList(String detailId) {
        CibrSysFileExample fileExample = new CibrSysFileExample();
        fileExample.createCriteria().andDetailidEqualTo(detailId).andFilestatuEqualTo("00");
        fileExample.setOrderByClause("createTime desc");
        List<CibrSysFile> cibrSysFiles = fileMapper.selectByExample(fileExample);
        for (CibrSysFile file : cibrSysFiles){
            file.setPath("");
            file.setMd5("");
        }
        return cibrSysFiles;
    }

    public CibrSysFile getFileObject(String id){
        return fileMapper.selectByPrimaryKey(id);
    }

    public File getFileById(String fileId) {
        CibrSysFile file = fileMapper.selectByPrimaryKey(fileId);
        File dbfile = new File(file.getPath());
        return dbfile;
    }

    /*通用上传文件*/
    public void commonUploadFile(CibrSysUser user, String detailId, MultipartFile file) {
        List<MultipartFile> files = new ArrayList<>();
        files.add(file);
        saveFile(files,detailId,user);
    }

    public File getTalk() {
        File img = new File(imgPath + "talk.jpg");
        return img;
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteFile(String fileId) {
        CibrSysFile cibrSysFile = fileMapper.selectByPrimaryKey(fileId);
        cibrSysFile.setFilestatu("09");
        fileMapper.updateByPrimaryKey(cibrSysFile);
    }

    public Map<String ,String> getFileCount(List<String> ids) {
        List<Map<String, String>> maps = fileMapper.selectMapIdWithCount(ids);
        Map<String ,String > retMap = new HashMap<>();
        if (maps != null){
            for (Map<String, String> tmp : maps){
                retMap.put(tmp.get("detailId"),tmp.get("num"));
            }
        }
        return  retMap;
    }
}
