package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
import com.cibr.animal.demo.service.FileService;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private FileService fileService;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping("/file/upload")
    public void uploadFile(HttpServletRequest request){
        logger.debug("进入文件上传");
        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
        fileService.saveFile(files);
    }

    @RequestMapping("/file/import/sampleInput")
    public String uploadProcessFile(HttpServletRequest request,
                                HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            String processId = request.getHeader("processId");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                MultipartFile file = files.get(0);
                List<List<String>> rows = FileUtil.getRows(dist);
                if (file.getOriginalFilename().startsWith("样本录入-")){
                    List<CibrTaskProcessSampleinput> list = fileService.handleSampleInput(rows, file, processId, user);
                    processTaskService.batchInsert(list);
                }
                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }
}
