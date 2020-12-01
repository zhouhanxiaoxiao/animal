package com.cibr.animal.demo.service;

import com.cibr.animal.demo.dao.CibrSysSuggestMapper;
import com.cibr.animal.demo.dao.CibrSysUserMapper;
import com.cibr.animal.demo.entity.CibrSysSuggest;
import com.cibr.animal.demo.entity.CibrSysSuggestExample;
import com.cibr.animal.demo.entity.CibrSysUser;
import com.cibr.animal.demo.util.TimeUtil;
import com.cibr.animal.demo.util.Util;
import freemarker.template.utility.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SuggestService {

    @Autowired
    private CibrSysSuggestMapper suggestMapper;

    @Autowired
    private LoginService loginService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private CibrSysUserMapper userMapper;

    @Value("${animal.authorEmail}")
    private String projectEmail;

    public List<CibrSysSuggest> getAllSuggest(String flag){
        List<CibrSysSuggest> suggests = suggestMapper.selectAllReply(flag);
        Map<String,CibrSysUser> uuid_user = new HashMap<String,CibrSysUser>();
        List<CibrSysUser> allUsers = loginService.findAllUsers();
        for (CibrSysUser user : allUsers){
            uuid_user.put(user.getId(),user);
        }
        for (CibrSysSuggest suggest : suggests){
            if (suggest.getReplys() != null && suggest.getReplys().size()>0){
                for (CibrSysSuggest reply : suggest.getReplys()){
                    reply.setUser(uuid_user.get(reply.getCreater()));
                }
            }
        }
        return suggests;
    }

    @Transactional(rollbackFor = Exception.class)
    public void createComment(String comment,String replayId,String flag, CibrSysUser user) {
        CibrSysSuggest suggest = new CibrSysSuggest();
        suggest.setId(Util.getUUID());
        suggest.setCreater(user.getId());
        suggest.setComments(comment);
        suggest.setCreatetime(new Date());
        suggest.setReplyto(replayId);
        suggest.setFlag(flag);
        suggestMapper.insert(suggest);
        String email = Util.EMAIL_PREFIX;
        email += comment;
        email += Util.EMAIL_SUFFIX;
        if ("system".equals(flag)){
            if (StringUtils.isEmpty(replayId)){
                emailService.simpleSendEmail(email,projectEmail,Util.EMAIL_SUB_SUGGEST);
            }else {
                CibrSysSuggest old = suggestMapper.selectByPrimaryKey(replayId);
                if (!user.getId().equals(old.getCreater())){
                    String contxt = Util.EMAIL_PREFIX + "您于【" + TimeUtil.date2str(old.getCreatetime(),"yyyy-MM-dd HH:mm:ss")
                            + "】提出的建议已有新的回复：【" + comment + "】" + Util.EMAIL_SUFFIX;
                    CibrSysUser creater = userMapper.selectByPrimaryKey(old.getCreater());
                    emailService.simpleSendEmail(contxt,creater.getEmail(),"建议回复");
                }
            }
        }
    }
}
