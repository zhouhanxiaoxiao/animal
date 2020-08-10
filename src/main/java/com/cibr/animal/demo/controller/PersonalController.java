package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrAnimalDrosophila;
import com.cibr.animal.demo.entity.CibrSysEnvironment;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.EnviromentService;
import com.cibr.animal.demo.service.PersonalService;
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
public class PersonalController {

    @Autowired
    private EnviromentService enviromentService;

    @Autowired
    private PersonalService personalService;

    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping("/personal/environment")
    public String getEnviroment(){
        ReturnData ret = new ReturnData();
        try{
            Map retMap = new HashMap();
            List<CibrSysEnvironment> envs = enviromentService.getEnvs();
            retMap.put("envs",envs);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret);
    }

    @RequestMapping("/stock/add")
    public String stockAdd(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody
    ){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user =  JSON.parseObject(String.valueOf(redisUtil.get(token)),CibrSysUser.class) ;
            String animalName = (String) requestBody.get("animalName");
            String useType = (String) requestBody.get("useType");
            String birthday = (String) requestBody.get("birthday");
            String location = (String) requestBody.get("location");
            String stockID = (String) requestBody.get("stockID");
            String genotype =(String)  requestBody.get("genotype");
            String resource =(String)  requestBody.get("resource");
            String container =(String)  requestBody.get("container");
            String number = "";
            try {
                number = (String)  requestBody.get("number");
            }catch (Exception e){
                number = String.valueOf((Integer) requestBody.get("number"));
            }
            String environmentId = (String) requestBody.get("environmentId");
            personalService.stockAdd(animalName,useType,birthday,location,
                    stockID,genotype,resource,container,number,environmentId,user);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret);
    }

    @RequestMapping("/stock/getAll")
    public String getAllStack(HttpServletRequest request,
                           HttpServletResponse response,
                              @RequestBody Map requestBody
    ){
        Integer pageSize = (Integer) requestBody.get("pageSize");
        Integer currentPage = (Integer) requestBody.get("currentPage");

        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> retMap = personalService.stockTable(currentPage.intValue(), pageSize.intValue());
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }

    @RequestMapping("/personal/checkGenTypeExist")
    public String checkGenTypeExist(HttpServletRequest request,
                                    HttpServletResponse response,
                                    @RequestBody Map requestBody
    ){
        ReturnData ret = new ReturnData();
        try {
            Map retMap = new HashMap();
            Object gentype = requestBody.get("gentype");
            List<CibrAnimalDrosophila> cibrAnimalDrosophilas = personalService.findanimalByGen(String.valueOf(gentype));
            if (cibrAnimalDrosophilas != null && cibrAnimalDrosophilas.size()>0){
                retMap.put("hasExist",true);
            }else {
                retMap.put("hasExist",false);
            }
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect);
    }
}
