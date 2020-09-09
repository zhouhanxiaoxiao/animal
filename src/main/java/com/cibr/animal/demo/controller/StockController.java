package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrStockDrosophila;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.PersonalService;
import com.cibr.animal.demo.service.StockService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
public class StockController {

    @Autowired
    private PersonalService personalService;

    @Autowired
    private StockService stockService;

    @Autowired
    private RedisUtil redisUtil;

    private Logger logger = LoggerFactory.getLogger(StockController.class);

    @RequestMapping("/stock/allStrain")
    public String getAllstrains(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try{
            Integer pageSize = (Integer) requestBody.get("pageSize");
            Integer currentPage = (Integer) requestBody.get("currentPage");
            Map<String, Object> allStrains = stockService.findAllStrains(pageSize.intValue(), currentPage.intValue());
            ret.setRetMap(allStrains);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/stock/edit/init")
    public String stockEditInit(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try{
            String stockId = (String) requestBody.get("stockId");
            CibrStockDrosophila cibrStockDrosophila = stockService.stockEditInit(stockId);
            Map<String,Object> retMap = new HashMap<>();
            retMap.put("stock",cibrStockDrosophila);
            ret.setRetMap(retMap);
            ret.setCode("200");

        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/stock/edit/updateStock")
    public String updateStock(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try{
            String stockStr = (String) requestBody.get("stock");
            logger.info(stockStr);
            CibrStockDrosophila stock = JSONObject.parseObject(stockStr, CibrStockDrosophila.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            stockService.updateStock(stock,user);
            ret.setCode("200");
        }catch (Exception e){
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
