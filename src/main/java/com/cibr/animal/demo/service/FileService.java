package com.cibr.animal.demo.service;

import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.Util;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
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

    public File saveFile(List<MultipartFile> files){
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
            try {
                file.transferTo(dist);
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }
        return dist;
    }

    public List<CibrTaskProcessSampleinput> handleSampleInput(List<List<String>> rows, MultipartFile file, String processId, CibrSysUser user) {
        String fileName = file.getOriginalFilename();
        List<CibrTaskProcessSampleinput> list = new ArrayList<CibrTaskProcessSampleinput>();
        for (List<String> row : rows){
            CibrTaskProcessSampleinput input = new CibrTaskProcessSampleinput();
            input.setId(Util.getUUID());
            input.setProcessid(processId);
            input.setCreater(user.getId());
            input.setCreatetime(new Date());
            //上传文件为临时状态，等待用户确认之后再修改状态
            input.setCurrentstatu("00");
            input.setSamplename(row.get(0));
            input.setSpecies(row.get(1));
            input.setTissue(row.get(2));
            input.setSamplemsg(row.get(3));
            input.setSamplestatu(row.get(4));
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
                input.setCellsort(row.get(11));
            }
            input.setDatabasetype(row.get(12));
            input.setSequencingplatform(row.get(13));
            input.setRemarks(row.get(14));
            list.add(input);
        }
        return list;
    }
}
