package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.service.PersonalService;
import com.cibr.animal.demo.service.StockService;
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
public class StockController {

    @Autowired
    private PersonalService personalService;

    @Autowired
    private StockService stockService;

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
}
