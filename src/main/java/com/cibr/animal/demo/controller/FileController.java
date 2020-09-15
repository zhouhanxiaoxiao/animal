package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysFile;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcessSampleinput;
import com.cibr.animal.demo.entity.CibrTaskProcessSamplemake;
import com.cibr.animal.demo.service.FileService;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
import java.io.*;
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
            File dist = fileService.saveFile(files,processId,user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                MultipartFile file = files.get(0);
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.handleSampleInput(rows, file, processId, user);
                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/initDrop")
    public  String uploadDrop(HttpServletRequest request,
                              HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files,null,user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                MultipartFile file = files.get(0);
                Map<String, List<List<String>>> allWorkSheet = FileUtil.getAllWorkSheet(dist);
                fileService.handleDrosoInput(allWorkSheet,file,user);
            }
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/userImage")
    public String uploadUserImage(HttpServletRequest request,
                                  HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            MultipartFile files = ((MultipartHttpServletRequest) request).getFile("file");
            fileService.saveUserHeader(files,null,user);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }

        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/makeUpload")
    public String uploadFile(HttpServletRequest request,
                             HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String make = request.getHeader("make");
            MultipartFile file = ((MultipartHttpServletRequest) request).getFile("file");
            fileService.saveMakeUploadFile(user,make,file);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/uploadFile")
    public String commonUploadFile(HttpServletRequest request,
                             HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            String detailId = request.getHeader("detailId");
            MultipartFile file = ((MultipartHttpServletRequest) request).getFile("file");
            fileService.commonUploadFile(user,detailId,file);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/showFileList")
    public String showFileList(HttpServletRequest request,
                             HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String detailId = (String) requestBody.get("detailId");
            List<CibrSysFile> cibrSysFiles = fileService.getfileList(detailId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("fileList",cibrSysFiles);
            ret.setRetMap(retMap);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/download")
    public void downloadSampleInput(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody Map requestBody) throws IOException {
        String fileId = (String) requestBody.get("fileId");
        File file = fileService.getFileById(fileId);
        response.setHeader("Content-disposition", "attachment; filename=" + file.getName());
        response.setContentType("application/txt");
        OutputStream outputStream = response.getOutputStream();
        InputStream input=new FileInputStream(file);
        //3、 写出文件--输出流
        byte[] buff =new byte[1024];
        int index=0;
        //4、执行 写出操作
        while((index= input.read(buff))!= -1){
            outputStream.write(buff, 0, index);
            outputStream.flush();
        }
        outputStream.close();
        input.close();
    }

    @RequestMapping("/file/import/makeInput")
    public String makeInput(HttpServletRequest request,
                                    HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            String subId = request.getHeader("subId");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files,subId,user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.makeInput(rows,user,subId);
                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/dismountImport")
    public String dismountImport(HttpServletRequest request,
                            HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            String subId = request.getHeader("subId");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files,subId,user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.dismountImport(rows,user,subId);
                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/file/import/analysisImport")
    public String analysisImport(HttpServletRequest request,
                                 HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            String subId = request.getHeader("subId");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files,subId,user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.analysisImport(rows,user,subId);
                ret.setCode("200");
                ret.setRetMap(result);
            }
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
