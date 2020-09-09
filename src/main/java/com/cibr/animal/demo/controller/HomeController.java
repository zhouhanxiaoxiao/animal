package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.AnimalService;
import com.cibr.animal.demo.service.TaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RestController
public class HomeController {

    @Autowired
    private AnimalService animalService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping("/home/preview")
    public String getProcess(HttpServletRequest request,
                             HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            int allStrainNumber = animalService.getAllStrainNumber();
            int selfTaskNumber = taskService.findSelfTaskNumber(user.getId());
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("allStrainNumber",allStrainNumber);
            retMap.put("selfTaskNumber",selfTaskNumber);
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
