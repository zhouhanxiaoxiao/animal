package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import com.cibr.animal.demo.entity.CibrSysTask;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.CibrSysUserService;
import com.cibr.animal.demo.service.PersonalService;
import com.cibr.animal.demo.service.TaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class TaskController {

    @Autowired
    PersonalService personalService;

    @Autowired
    TaskService taskService;

    @Autowired
    CibrSysUserService userService;

    @Autowired
    private RedisUtil redisUtil;



    @RequestMapping("/orderTask/init")
    public String initOrderTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            List<String> stockIds = (List<String>) requestBody.get("stockIds");
            Map<String, Object> retMap = personalService.stockTable(0, 0);
            List<Map<String, Object>> stockTable = taskService.getTaskStock(stockIds, (List<Map<String, Object>>) retMap.get("stockTable"));
            List<CibrSysUser> userByRole = userService.findUserByRole("2");
            List<CibrAnimalDrosophila> allDrosophila = taskService.findAllDrosophila();
            result.put("stockTable" , stockTable);
            result.put("researchers",userByRole);
            result.put("allDrosophila",allDrosophila);
            ret.setCode("200");
            ret.setRetMap(result);
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/task/askTask")
    public String createAskTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {

            String token = request.getHeader("token");
            CibrSysUser user =  JSON.parseObject(String.valueOf(redisUtil.get(token)),CibrSysUser.class) ;

            Map<String, Object> result = new HashMap<String, Object>();
            HashMap<String,Object> postData = (HashMap<String, Object>) requestBody.get("postData");
            List<String> selectedStudyDirector = (List<String>) postData.get("selectedStudyId");
            String purpose = (String) postData.get("purpose");
            String expectedTime = (String) postData.get("expectedTime");
            String operationProcess = (String) postData.get("operationProcess");
            String remarks = (String) postData.get("remarks");
            String urgent = (String) postData.get("urgent");
            Map<String,Object> detailData = (Map<String, Object>) postData.get("detailData");

            taskService.createAskTask(user,selectedStudyDirector,purpose,expectedTime,operationProcess,remarks,urgent,detailData);

            ret.setCode("200");
            ret.setRetMap(result);
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/task/gatAllTask")
    public String getAllTask(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            Integer currentPage = (Integer)requestBody.get("currentPage");
            Integer pageSize = (Integer)requestBody.get("pageSize");

            String token = request.getHeader("token");
            CibrSysUser user =  JSON.parseObject(String.valueOf(redisUtil.get(token)),CibrSysUser.class);
            Map<String, Object> allTask = taskService.findAllTask(currentPage, pageSize, user);
            ret.setRetMap(allTask);
            ret.setCode("200");
        }
        catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }
}
