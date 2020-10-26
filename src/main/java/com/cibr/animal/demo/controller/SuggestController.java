package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysSuggest;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.SuggestService;
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
public class SuggestController {

    @Autowired
    private SuggestService suggestService;

    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping("/about/suggest")
    public String initsuggest(HttpServletRequest request,
                                HttpServletResponse response
                               ) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            List<CibrSysSuggest> allSuggest = suggestService.getAllSuggest();
            result.put("comments",allSuggest);
            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/about/suggest/commit")
    public String commitSuggest(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            String comment = String.valueOf(requestBody.get("comment"));
            String replayId = String.valueOf(requestBody.get("replayId"));
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            suggestService.createComment(comment,replayId,user);
            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
