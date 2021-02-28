package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.CibrSysSuggest;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.service.SuggestService;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "建议页面Controller")
@RestController
public class SuggestController {

    @Autowired
    private SuggestService suggestService;

    @Autowired
    private RedisUtil redisUtil;

    @ApiOperation(value = "获取所有建议信息")
    @ApiImplicitParam(name = "flag", value = "建议关联项目Id", required = true, defaultValue = "system")
    @RequestMapping(value = "/about/suggest", method = RequestMethod.POST)
    public String initsuggest(HttpServletRequest request,
                                HttpServletResponse response,
                              @RequestBody Map requestBody
                               ) {
        ReturnData ret = new ReturnData();
        try {
            String flag = (String) requestBody.get("flag");
            if (flag == null){
                flag = "system";
            }
            Map<String, Object> result = new HashMap<String, Object>();
            List<CibrSysSuggest> allSuggest = suggestService.getAllSuggest(flag);
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

    @ApiOperation(value = "提交或回复建议")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "comment", value = "建议文本", required = true),
            @ApiImplicitParam(name = "flag", value = "建议关联项目Id", required = true, defaultValue = "system"),
            @ApiImplicitParam(name = "replayId", value = "回复某个建议的Id", required = false, defaultValue = "")
    })
    @RequestMapping(value = "/about/suggest/commit", method = RequestMethod.POST)
    public String commitSuggest(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            String comment = String.valueOf(requestBody.get("comment"));
            String flag = String.valueOf(requestBody.get("flag"));
            String replayId = String.valueOf(requestBody.get("replayId"));
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            suggestService.createComment(comment,replayId,flag,user);
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
