package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrRecordMeterial;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.entity.CibrTaskProcessSamplemake;
import com.cibr.animal.demo.service.ResourceService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.TimeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@RestController
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private RedisUtil redisUtil;

    private Logger logger = LoggerFactory.getLogger(RestController.class);

    @RequestMapping("/task/resource/init")
    public String resourceInit(HttpServletRequest request,
                           HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> allResource = resourceService.getAllResource();
            ret.setRetMap(allResource);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/resource/getRecords")
    public String getRecords(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String recordId = (String) requestBody.get("recordId");
            Map<String,Object> retMap = new HashMap<>();
            List<CibrRecordMeterial> allRecords = resourceService.getAllRecords(recordId);
            retMap.put("records",allRecords);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/resource/currentDate")
    public String currentDate(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String currentDate = (String) requestBody.get("currentDate");
            String resource = (String) requestBody.get("resource");
            Map<String,Object> retMap = new HashMap<>();
            List<CibrRecordMeterial> records = resourceService.findCurrentDate(TimeUtil.str2date(currentDate,"yyyy-MM-dd"), resource);
            retMap.put("records",records);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/resource/commitTask")
    public String commitTask(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String resourceId = (String) requestBody.get("resourceId");
            String str = (String) requestBody.get("times");
            List<Date> times = JSON.parseArray(str,Date.class);
            Map<String,Object> retMap = new HashMap<>();
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            resourceService.commitTimes(resourceId,times,user);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
