package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class FileController {

    private Logger logger = LoggerFactory.getLogger(FileController.class);

    @RequestMapping("/file/upload")
    public void uploadFile(HttpServletRequest request){
        logger.debug("进入文件上传");
        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
        FileUtil.saveFile(files);
    }

    @RequestMapping("/file/import/sampleInput")
    public String uploadProcessFile(HttpServletRequest request,
                                HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            if (!FileUtil.saveFile(files)){
                ret.setCode("E500");
            }else {
                MultipartFile file = files.get(0);
                List<List<String>> rows = FileUtil.getRows(file);

                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }
}
