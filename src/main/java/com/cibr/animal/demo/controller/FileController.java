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
import com.cibr.animal.demo.service.StockService;
import com.cibr.animal.demo.util.FileUtil;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.exception.CommonException;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "文件的上传与下载，解析文件")
@RestController
public class FileController {

    private Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private FileService fileService;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private StockService stockService;

    @ApiOperation(value = "导入样本录入Excel",notes = "根据导入的Excel内容，更新样本录入信息。")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "processId",value = "测序项目Id", required = true),
            @ApiImplicitParam(name = "file",value = "需要上传的Excel文件", required = true)
    })
    @RequestMapping(value = "/file/import/sampleInput",method = RequestMethod.POST)
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
            if (e instanceof CommonException){
                CommonException err = (CommonException) e;
                ret.setErrMsg(err.getErrMsg());
            }
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "上传并解析现有果蝇品系Excel")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file",value = "果蝇品系文件",required = true)
    })
    @RequestMapping(value = "/file/import/initDrop",method = RequestMethod.POST)
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

    @ApiOperation(value = "用户头像上传")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file",value = "用户头像图片",required = true)
    })
    @RequestMapping(value = "/file/import/userImage",method = RequestMethod.POST)
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

    @ApiIgnore
    @RequestMapping(value = "/file/import/makeUpload",method = RequestMethod.POST)
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

    @ApiOperation(value = "通用附件上传方法")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file",value = "需要上传的附件文件",required = true),
            @ApiImplicitParam(name = "detailId",value = "关联项目的Id", required = true, paramType = "header")
    })
    @RequestMapping(value = "/file/import/uploadFile",method = RequestMethod.POST)
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

    @ApiOperation(value = "获取附件列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "detailId", value = "关联项目的Id",required = true)
    })
    @RequestMapping(value = "/file/showFileList",method = RequestMethod.POST)
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

    @ApiOperation(value = "删除现有附件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fileId",value = "文件Id", required = true)
    })
    @RequestMapping(value = "/file/delete",method = RequestMethod.POST)
    public String deleteFile(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String fileId = (String) requestBody.get("fileId");
            fileService.deleteFile(fileId);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "获取附件数量")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "idsStr",value = "关联项目Id集合字符串",required = true,dataType = "String")
    })
    @RequestMapping(value = "/file/getFileCount", method = RequestMethod.POST)
    public String getFileCount(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String idsStr = (String) requestBody.get("idsStr");
            List<String> ids = JSONObject.parseArray(idsStr, String.class);
            Map<String, String> fileCount = fileService.getFileCount(ids);
            Map retMap = new HashMap();
            retMap.put("fileCounts",fileCount);
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

    @ApiOperation(value = "下载附件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "fileId",value = "附件Id", required = true)
    })
    @RequestMapping(value = "/file/download",method = RequestMethod.POST)
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

    @ApiOperation(value = "样本制备Excel上传，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file",value = "样本制备Excel",required = true),
            @ApiImplicitParam(name = "processId", value = "测序项目Id", required = true, paramType = "header")
    })
    @RequestMapping(value = "/file/import/makeInput", method = RequestMethod.POST)
    public String makeInput(HttpServletRequest request,
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
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.makeInput(rows,user,processId);
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

    @ApiOperation(value = "文库制备Excel导入，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "processId",value = "测序项目Id",required = true, paramType = "header"),
            @ApiImplicitParam(name = "file", value = "文库制备Excel", required = true)
    })
    @RequestMapping(value = "/file/import/libImport", method = RequestMethod.POST)
    public String libImport(HttpServletRequest request,
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
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.libImport(rows,user,processId);
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

    @ApiOperation(value = "数据交付Excel导入，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "processId",value = "测序项目Id",required = true, paramType = "header"),
            @ApiImplicitParam(name = "file", value = "数据交付Excel", required = true)
    })
    @RequestMapping(value = "/file/import/dismountImport",method = RequestMethod.POST)
    public String dismountImport(HttpServletRequest request,
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
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.dismountImport(rows,user,processId);
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

    @ApiOperation(value = "上机确认Excel导入，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "processId",value = "测序项目Id",required = true, paramType = "header"),
            @ApiImplicitParam(name = "file", value = "上机确认Excel", required = true)
    })
    @RequestMapping(value = "/file/import/confirmsImport",method = RequestMethod.POST)
    public String confirmsImport(HttpServletRequest request,
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
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.confirmsImport(rows,user,processId);
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

    @ApiOperation(value = "生信分析Excel导入，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "processId",value = "测序项目Id",required = true, paramType = "header"),
            @ApiImplicitParam(name = "file", value = "生信分析Excel", required = true)
    })
    @RequestMapping(value = "/file/import/analysisImport",method = RequestMethod.POST)
    public String analysisImport(HttpServletRequest request,
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
                List<List<String>> rows = FileUtil.getRows(dist);
                processTaskService.analysisImport(rows,user,processId);
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

    @ApiOperation(value = "果蝇现有库存Excel导入，解析，更新")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file", value = "生信分析Excel", required = true)
    })
    @RequestMapping(value = "/file/import/stockImport", method = RequestMethod.POST)
    public String stockImport(HttpServletRequest request,
                                 HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String, Object> result = new HashMap<String, Object>();
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            File dist = fileService.saveFile(files,user.getId(),user);
            if (dist == null){
                response.setStatus(500);
                ret.setCode("E500");
            }else {
                List<List<String>> rows = FileUtil.getRows(dist);
                stockService.stockImport(rows,user);
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

    @ApiIgnore
    @RequestMapping("/fileTmp/{fileId}")
    public void fileTmpDown(@PathVariable String fileId,HttpServletResponse response) throws IOException {
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

    @ApiIgnore
    @RequestMapping("/file/import/uploadAll")
    public String uploadAll(HttpServletRequest request,
                              HttpServletResponse response) {
        ReturnData ret = new ReturnData();
        try {
            String idsStr = request.getHeader("idsStr");
            List<String> ids = JSONObject.parseArray(idsStr, String.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("file");
            fileService.saveFiles(files,ids,user);
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}