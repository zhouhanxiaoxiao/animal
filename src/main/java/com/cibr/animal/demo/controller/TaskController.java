package com.cibr.animal.demo.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.cibr.animal.demo.entity.*;
import com.cibr.animal.demo.service.*;
import com.cibr.animal.demo.util.RedisUtil;
import com.cibr.animal.demo.util.ReturnData;
import com.cibr.animal.demo.util.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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

    @Autowired
    private ProcessTaskService processTaskService;

    @Autowired
    private MeterialService meterialService;


    @RequestMapping("/orderTask/init")
    public String initOrderTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            Map<String, Object> result = new HashMap<String, Object>();
            List<String> stockIds = (List<String>) requestBody.get("stockIds");
            Map<String, Object> retMap = personalService.stockTable(0, 0);
            List<Map<String, Object>> stockTable = taskService.getTaskStock(stockIds, (List<Map<String, Object>>) retMap.get("stockTable"));
            List<CibrSysUser> userByRole = userService.findUserByRole("01");
            List<CibrSysUser> supporters = userService.findUserByRole("02");
            List<CibrAnimalDrosophila> allDrosophila = taskService.findAllDrosophila();
            List<CibrSysMaterial> allMerial = meterialService.getAllMerial();
            result.put("stockTable", stockTable);
            result.put("researchers", userByRole);
            result.put("supporters", supporters);
            result.put("allDrosophila", allDrosophila);
            result.put("allMerial",allMerial);
            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/askTask")
    public String createAskTask(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            Map<String, Object> result = new HashMap<String, Object>();
            HashMap<String, Object> postData = (HashMap<String, Object>) requestBody.get("postData");
            List<String> selectedStudyDirector = (List<String>) postData.get("selectedStudyId");
            String remarks = (String) postData.get("remarks");
            String urgent = (String) postData.get("urgent");
            String supporter = (String) postData.get("supporter");
            Map<String, Object> detailData = (Map<String, Object>) postData.get("detailData");

            taskService.createAskTask(supporter,user, selectedStudyDirector, remarks, urgent, detailData);

            ret.setCode("200");
            ret.setRetMap(result);
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/gatAllTask")
    public String getAllTask(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String pageLocation = (String) requestBody.get("pageLocation");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
//            Map<String, Object> allTask = taskService.findAllTask(currentPage, pageSize, pageLocation, user);
            Map<String, Object> allTask = taskService.findAllTask(user,pageLocation);
            ret.setRetMap(allTask);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/askTaskDetailNew")
    public String askTaskDetail(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody) {
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
//            Map<String, Object> taskDetail = taskService.findTaskDetail(taskId);
            List<CibrTaskDetailDrosophila> details = taskService.selectAskTaskDetail(taskId);
            CibrTaskAskDrosophila ask = taskService.findaskTask(taskId);
            List<CibrAnimalDrosophila> allDrosophila = taskService.findAllDrosophila();
            List<CibrSysUser> allUsers = userService.getAllUsers();
            CibrSysTask task = taskService.findTask(taskId);
            Map retMap = new HashMap();
            retMap.put("details",details);
            retMap.put("ask",ask);
            retMap.put("task",task);
            retMap.put("animals",allDrosophila);
            retMap.put("users",allUsers);
            ret.setRetMap(retMap);
            ret.setCode("200");
        } catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/refuse")
    public String refuseAsk(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            String reason = (String) requestBody.get("reason");
            String detailId = (String) requestBody.get("detailId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<String> detailIds = JSONObject.parseArray(detailId, String.class);
            for (String id : detailIds){
                taskService.refuseAskTask(taskId,reason,id,user);
            }
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
    @RequestMapping("/task/ask/confirm")
    public String confirmAsk(HttpServletRequest request,
                            HttpServletResponse response,
                            @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String isNeedMore = (String) requestBody.get("isNeedMore");
            String startDate = (String) requestBody.get("startDate");
            String endDate = (String) requestBody.get("endDate");
            String remarks = (String) requestBody.get("remarks");
            String taskid = (String) requestBody.get("taskid");
            String detailId = (String) requestBody.get("detailId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            List<String> list = JSONObject.parseArray(detailId, String.class);
            for (String id : list){
                taskService.confirmTask(taskid,id,isNeedMore,startDate,endDate,remarks,user);
            }
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("task/ask/updateDetails")
    public String updateDetails(HttpServletRequest request,
                             HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String details = (String) requestBody.get("details");
            String token = request.getHeader("token");
            List<CibrTaskDetailDrosophila> detailList = JSONObject.parseArray(details, CibrTaskDetailDrosophila.class);
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.updateDetails(detailList,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/getAllPrepares")
    public String getAllPrepares(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
//            Map<String, Object> prepare = taskService.getPrepare(askId);
            List<CibrTaskAskPrepare> allPrepares = taskService.getAllPrepares(taskId);
            CibrSysTask task = taskService.findTask(taskId);
            CibrTaskAskDrosophila ask = taskService.findaskTask(taskId);
            Map retMap = new HashMap();
            retMap.put("prepares",allPrepares);
            retMap.put("task",task);
            retMap.put("ask",ask);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/updatePrepares")
    public String updatePrepares(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepares = (String) requestBody.get("prepares");
            List<CibrTaskAskPrepare> prepareList = JSONObject.parseArray(prepares, CibrTaskAskPrepare.class);
            taskService.updatePrepares(prepareList);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/getPrepare")
    public String prepared(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String askId = (String) requestBody.get("askId");
            Map<String, Object> prepare = taskService.getPrepare(askId);
            ret.setRetMap(prepare);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/confirmPrepare")
    public String confirmPrepare(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepares = (String) requestBody.get("prepares");
            List<CibrTaskAskPrepare> prepareList = JSONObject.parseArray(prepares, CibrTaskAskPrepare.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            for (CibrTaskAskPrepare prepare :prepareList){
                taskService.confrimPrepare(prepare.getId(), TimeUtil.date2str(prepare.getCompletetime(),"yyyy-MM-dd")
                        ,TimeUtil.date2str(prepare.getRealexptime(),"yyyy-MM-dd"),
                        prepare.getReamrks2(),Integer.parseInt(prepare.getRealage()),
                        Integer.parseInt(prepare.getRealnumber()),user);
            }
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/refusePrepare")
    public String refusePrepare(HttpServletRequest request,
                                 HttpServletResponse response,
                                 @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepares = (String) requestBody.get("prepares");
            String reason = (String) requestBody.get("reason");
            String remark = (String) requestBody.get("remark");
            List<String> ids = JSONObject.parseArray(prepares, String.class);
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.refusePrepare(ids,reason,remark,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/ask/confirmTask")
    public String createrConfirmTask(HttpServletRequest request,
                           HttpServletResponse response,
                           @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String prepareId = (String) requestBody.get("id");
            String isComplete = (String) requestBody.get("isComplete");
            String remarks = (String) requestBody.get("remarks");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.createrConfirmTask(prepareId,isComplete,remarks,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/allowTask")
    public String userAllowTask(HttpServletRequest request,
                                     HttpServletResponse response,
                                     @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            Map<String, Object> userAllowTask = taskService.getUserAllowTask(taskId);
            ret.setRetMap(userAllowTask);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        System.out.println(JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect));
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/refuseAllow")
    public String refuseAllow(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            String reason = (String) requestBody.get("reason");
            String remarks = (String) requestBody.get("remarks");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            taskService.refuseUserAllow(taskId,reason,remarks,user);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/user/allowCreate")
    public String allowCreate(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            List<String> roles = (List<String>) requestBody.get("roles");
            String taskId = (String) requestBody.get("taskId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            taskService.allowCreateUser(roles,taskId,user);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/addProcess")
    public String addProcess(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String projectName = (String) requestBody.get("projectName");
            String dataType = (String) requestBody.get("dataType");
            String principal = (String) requestBody.get("principal");
            List<String> emails = (List<String>) requestBody.get("emails");
            String sampleMsg = (String) requestBody.get("sampleMsg");
            String sampleInput = (String) requestBody.get("sampleInput");
            String samplePreparation = (String) requestBody.get("samplePreparation");
            String libraryPreparation = (String) requestBody.get("libraryPreparation");
            String dismountData = (String) requestBody.get("dismountData");
            String bioinformaticsAnalysis = (String) requestBody.get("bioinformaticsAnalysis");
            String remarks = (String) requestBody.get("remarks");
            String projectDesc = (String) requestBody.get("projectDesc");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            processTaskService.createProcessTask(user,projectName,dataType,principal,emails,sampleMsg,sampleInput,
                    samplePreparation,libraryPreparation,dismountData,bioinformaticsAnalysis,remarks,projectDesc,request);

            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/partner/init")
    public String partnerInit(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            Map<String, Object> retMap = taskService.findPartnerDetail(taskId);
            ret.setRetMap(retMap);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/partner/refuse")
    public String partnerRefuse(HttpServletRequest request,
                              HttpServletResponse response,
                              @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String partnerId = (String) requestBody.get("partnerId");
            String reason = (String) requestBody.get("reason");
            String remarks = (String) requestBody.get("remarks");

            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);

            taskService.refusePartner(partnerId,reason,remarks,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/partner/accept")
    public String partnerAccept(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String partnerId = (String) requestBody.get("partnerId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.acceptPartner(partnerId,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/partner/cancel")
    public String partnerCancel(HttpServletRequest request,
                                HttpServletResponse response,
                                @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String partnerId = (String) requestBody.get("partnerId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.cancelPartner(partnerId,user);
            ret.setCode("200");
        }catch (Exception e) {
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/import/orderTask")
    public String importOrderTask(HttpServletRequest request,
                                  HttpServletResponse response){
        ReturnData ret = new ReturnData();
        try {
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            MultipartFile file = ((MultipartHttpServletRequest) request).getFile("file");
            taskService.importOrderTask(user,file);
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }

    @RequestMapping("/task/deleteTask")
    public String deleteTask(HttpServletRequest request,
                              HttpServletResponse response,
                             @RequestBody Map requestBody){
        ReturnData ret = new ReturnData();
        try {
            String taskId = (String) requestBody.get("taskId");
            String token = request.getHeader("token");
            CibrSysUser user = JSON.parseObject(String.valueOf(redisUtil.get(token)), CibrSysUser.class);
            taskService.deleteTask(taskId,user);
            ret.setCode("200");
        } catch (Exception e) {
            response.setStatus(500);
            ret.setCode("E500");
            ret.setErrMsg("系统异常！");
            e.printStackTrace();
        }
        return JSON.toJSONString(ret, SerializerFeature.DisableCircularReferenceDetect,SerializerFeature.WriteMapNullValue);
    }
}
