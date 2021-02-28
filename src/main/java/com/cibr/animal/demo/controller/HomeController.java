package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.AnimalService;
import com.cibr.animal.demo.service.FileService;
import com.cibr.animal.demo.service.ProcessTaskService;
import com.cibr.animal.demo.service.TaskService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "主页展示类")
@RestController
public class HomeController {

    @Autowired
    private AnimalService animalService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/home/preview", method = RequestMethod.POST)
    @ApiOperation(value = "首页统计项目数据")
    public String getProcess(HttpServletRequest request,
                             HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            int allStrainNumber = animalService.getAllStrainNumber();
            int stockNumber = animalService.getallstockNumber();
            int oneMonthStockNumber = animalService.getOneMonthStockNumber();
            int oneMonthStrainNumber = animalService.getOneMonthStrainNumber();
            int selfTaskNumber = taskService.findSelfTaskNumber(user.getId());
            List<Map<String, String>> userTaskCount = taskService.findUserTaskCount();
            List<Map<String, String>> animalTaskCount = taskService.findAnimalTaskCount();
            Map<String, Object> map = processTaskService.countTaskNum("all", user);
            Map<String,Object> retMap = new HashMap<>();
            retMap.putAll(map);
            retMap.put("allStrainNumber",allStrainNumber);
            retMap.put("stockNumber",stockNumber);
            retMap.put("oneMonthStockNumber",oneMonthStockNumber);
            retMap.put("oneMonthStrainNumber",oneMonthStrainNumber);
            retMap.put("selfTaskNumber",selfTaskNumber);
            retMap.put("userTaskCount",userTaskCount);
            retMap.put("animalTaskCount",animalTaskCount);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @ApiIgnore
    @RequestMapping("/home/menus")
    public String getMenus(HttpServletRequest request,
                             HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            Map<String,Object> retMap = new HashMap<>();

            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @ApiOperation(value = "获取微信群二维码")
    @RequestMapping(value = "/img/talk",method = RequestMethod.GET)
    public void getTalkImg(HttpServletResponse response) throws Exception {
        File img = fileService.getTalk();
        FileInputStream fileInputStream = new FileInputStream(img);
        ServletOutputStream outputStream = response.getOutputStream();
        //创建存放文件内容的数组
        byte[] buff = new byte[1024];
        //所读取的内容使用n来接收
        int n;
        //当没有读取完时,继续读取,循环
        while ((n = fileInputStream.read(buff)) != -1) {
            //将字节数组的数据全部写入到输出流中
            outputStream.write(buff, 0, n);
        }
        outputStream.flush();
        outputStream.close();
        fileInputStream.close();
    }
}
