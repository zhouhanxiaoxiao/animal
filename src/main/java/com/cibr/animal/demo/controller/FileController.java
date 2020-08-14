package com.cibr.animal.demo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;

@RestController
public class FileController {

    @Value("${animal.fileUploadPath}")
    private String filePath;

    private Logger logger = LoggerFactory.getLogger(FileController.class);

    @RequestMapping("/file/upload")
    public void uploadFile(HttpServletRequest request){
        logger.debug("进入文件上传");
        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
        for (MultipartFile file : files){
            if (file.isEmpty()){
                throw new RuntimeException("上传的文件为空！");
            }
            String fileName = file.getOriginalFilename();
            File dist = new File(filePath + File.separator+ fileName);
            logger.debug(dist.getPath());
            try {
                file.transferTo(dist);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

    }
}
