package com.sannong.presentation.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sannong.infrastructure.persistance.entity.SMS;
import com.sannong.infrastructure.persistance.entity.User;
import com.sannong.infrastructure.util.PasswordGenerator;
import com.sannong.service.ISmsService;
import com.sannong.service.IUserService;

/**
 * Created by Bright Huang on 11/9/14.
 */
@Controller
public class SmsController {
    @Resource
    private ISmsService smsService;
    @Resource
    private IUserService userService;

    @RequestMapping(value = "updatesms", method = RequestMethod.GET)
    public @ResponseBody boolean updateSMS(HttpServletRequest request) {
        return smsService.updateSMS(request);
    }

    @RequestMapping(value = "getnewsms", method = RequestMethod.GET)
    public @ResponseBody List<SMS> getNewSMS() {
        return smsService.getNewSMS();
    }

    @RequestMapping(value = "regcode", method = RequestMethod.GET)
    public @ResponseBody boolean generateCode(HttpServletRequest request) {
        return smsService.generateCode(request);
    }

    @RequestMapping(value = "validateSMSCode")
    public @ResponseBody int validateRegcode(HttpServletRequest request) {
        return smsService.validateSMSCode(request);
    }

    /**
     * From projectapplication page, user need to get a validation code to verify the cellphone is his own.
     * From myinfo page, user need to send a validation code to change his cellphone.
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "sendValidationCode", method = RequestMethod.POST)
    public @ResponseBody String sendValidationCode(HttpServletRequest request) throws Exception {
        String cellphone = request.getParameter("cellphone");
        String newCellphone = request.getParameter("newCellphone");
        String validationCode = PasswordGenerator.generateValidationCode(4);

        if (StringUtils.isNotBlank(newCellphone)){
            return smsService.sendValidationCode(newCellphone, validationCode);
        } else{
            return smsService.sendValidationCode(cellphone, validationCode);
        }
    }

    /**
     * From projectapplication page, after user signed up, a login message will be sent to user.
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "sendLoginMessage", method = RequestMethod.POST)
    public @ResponseBody String sendLoginMessage(HttpServletRequest request) throws Exception {
        String password = PasswordGenerator.generateValidationCode(6);
        String cellphone = request.getParameter("cellphone");
        return smsService.sendLoginMessage(cellphone, password);
    }

    /**
     * From forgotpassword page, user try to get a new password to login.
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "sendNewPasswordMessage", method = RequestMethod.POST)
    public @ResponseBody boolean sendNewPasswordMessage(HttpServletRequest request) throws Exception{
        String cellphone = request.getParameter("cellphone");
        String realName = request.getParameter("realName");

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("cellphone", cellphone);
        paramMap.put("realName", realName);

        List<User> users = userService.getUserByCondition(paramMap);
        if (users.isEmpty()) {
            return false;
        } else {
            User user = users.get(0);
            if (!(user.getCellphone().equals(cellphone) && user.getRealName().equals(realName))) {
                return false;
            }
            String password = PasswordGenerator.generatePassword(6);
            String smsResponse = smsService.sendNewPasswordMessage(cellphone, password);
            if (StringUtils.isNotBlank(smsResponse)){
                user.setPassword(PasswordGenerator.encryptPassword(password, user.getUserName()));
                user.setUpdateTime(new Timestamp(System.currentTimeMillis()));
                
                return userService.updatePassword(user);
            } else {
                return false;
            }
        }
    }
}
