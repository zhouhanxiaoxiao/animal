package com.cibr.animal.demo.service;

import com.alibaba.fastjson.JSONObject;
import com.cibr.animal.demo.dao.CibrSysFileMapper;
import com.cibr.animal.demo.entity.CibrSysFile;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcess;
import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FileService {

    @Value("${animal.fileUploadPath}")
    private String filePath;

    private Logger logger = LoggerFactory.getLogger(FileService.class);

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private CibrSysFileMapper fileMapper;

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
}
