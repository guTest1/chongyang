package com.guql.cy.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.guql.cy.page.Page;
import com.guql.cy.service.DynamicCYService;
import com.guql.cy.service.QuestionCYService;
import com.guql.cy.service.RecommendedCYService;
import com.guql.cy.service.UserCYService;
import com.guql.cy.service.ViewCYService;
import com.guql.cy.util.StaticDefaultValue;
import com.guql.cy.util.VerificationCode;
import com.guql.cy.vo.DateVo;
import com.guql.cy.vo.DynamicVo;
import com.guql.cy.vo.LoginReturns;
import com.guql.cy.vo.QuestionVo;
import com.guql.cy.vo.RecommendedVo;
import com.guql.cy.vo.UserVo;
import com.guql.cy.vo.ViewVo;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@Controller
@RequestMapping("/cy")
public class AboutCYController {
    
    private static final Log log = LogFactory.getLog(AboutCYController.class);
    
    /**
     * 
     */
    private final static String LOGCONTROLLERCLASS = "AboutCYController";
    /**
     * 每页显示条数
     */
    private final static int pageCount = 2;
    /**
     * 首页显示项
     */
    private final static int startPage = 1;
    /**
     * 首页显示项
     */
    private final static int pageSize = 11;
    /**
     * 首页显示重阳荐文
     */
    private final static int recommendedPageSize = 8;
    /**
     * 服务与支持验证标示
     */
    private final static String VALIDATIONFLAG = "validationFlag";
    /**
     * 服务与支持验证标示通过
     */
    private final static String VALIDATIONFLAGTRUE = "true";
    /**
     * 用户名
     */
    private final static String USERLOGIN = "currentUser";
    /**
     * 重阳动态
     */
    @Autowired
    private DynamicCYService dynamicCYService;
    /**
     * 重阳问答
     */
    @Autowired
    private QuestionCYService questionCYService;
    /**
     * 重阳视点
     */
    @Autowired
    private ViewCYService viewCYService;
    /**
     * 重阳推荐
     */
    @Autowired
    private RecommendedCYService recommendedCYService;
    /**
     * user
     */
    @Autowired
    private UserCYService userCYService;
    
    private static String validationCode = "";
    
    /**
     * 
     * 功能描述: <br>
     * 〈功能详细描述〉
     *
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/homecy")
    public ModelAndView homeCY(HttpServletRequest request,HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("homecy");
        //重阳动态
        Page<DynamicVo> dynamic_page = new Page<DynamicVo>();
        dynamic_page.setPageNo(startPage);
        dynamic_page.setPageSize(pageSize);
        dynamicCYService.findAll(dynamic_page);
        if(dynamic_page.getResults() != null && dynamic_page.getResults().size() > 0){
            DynamicVo first_dynamic = dynamic_page.getResults().get(0);
            first_dynamic.setContent(dealString(first_dynamic.getContent()));
            List<List<?>> dynamics = getPagingFormat(dynamic_page.getResults());
            modelAndView.addObject("first_dynamic", first_dynamic);
            modelAndView.addObject("dynamics", dynamics);
        }
        //重阳问答
        Page<QuestionVo> question_page = new Page<QuestionVo>();
        question_page.setPageNo(startPage);
        question_page.setPageSize(pageSize);
        questionCYService.findAll(question_page);
        if(question_page.getResults() != null && question_page.getResults().size() > 0){
            QuestionVo first_question = question_page.getResults().get(0);
            first_question.setContent(dealString(first_question.getContent()));
            List<List<?>> questions = getPagingFormat(question_page.getResults());
            modelAndView.addObject("first_question", first_question);
            modelAndView.addObject("questions", questions);
        }
        //重阳视点
        Page<ViewVo> view_page = new Page<ViewVo>();
        view_page.setPageNo(startPage);
        view_page.setPageSize(pageSize);
        viewCYService.findAll(view_page);
        if(view_page.getResults() != null && view_page.getResults().size() > 0){
            ViewVo first_view = view_page.getResults().get(0);
            first_view.setContent(dealString(first_view.getContent()));
            List<List<?>> views = getPagingFormat(view_page.getResults());
            modelAndView.addObject("first_view", first_view);
            modelAndView.addObject("views", views);
        }
        //重阳荐文
        Page<RecommendedVo> recommended_page = new Page<RecommendedVo>();
        recommended_page.setPageNo(startPage);
        recommended_page.setPageSize(recommendedPageSize);
        recommendedCYService.findAll(recommended_page);
        if(recommended_page.getResults() != null && recommended_page.getResults().size() > 0){
            modelAndView.addObject("recommendedList", recommended_page.getResults());
        }
        
        return modelAndView;
    }
    /**
     * 
     * 功能描述: <br>
     * 走近重阳
     *
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("/aboutcy")
    public ModelAndView aboutCY(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("aboutcy");
        return modelAndView;
    }

    @RequestMapping("/map")
    public ModelAndView adderMap(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("map");
        return modelAndView;
    }

    /**
     * 
     * 功能描述: <br>
     * 重阳动态
     *
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/dynamiccy")
    public ModelAndView dynamicCY(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request,
            HttpServletResponse response) {
        log.info(LOGCONTROLLERCLASS + "select all dynamiccy start");
        List<Integer> pageRolling = new ArrayList<Integer>();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("dynamiccy");
        
        Page<DynamicVo> page = new Page<DynamicVo>();
        page.setPageNo(currentPage);
        page.setPageSize(pageCount);
        dynamicCYService.findAll(page);
        if(page.getTotalPage() >= 8){
            for(int i = 0;i < 15;i++){
                pageRolling.add(currentPage + i - 7);
            }
        }else{
            for(int i = 0;i < page.getTotalPage();i++){
                pageRolling.add(i + 1);
            }
        }
        modelAndView.addObject("page", page);
        modelAndView.addObject("pageRolling", pageRolling);
        log.info(LOGCONTROLLERCLASS + "select all dynamiccy end");
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈功能详细描述〉
     *
     * @param id
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/dynamicInfocy")
    public ModelAndView dynamicInfoCY(@RequestParam int id, HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("dynamicInfocy");
        
        DynamicVo dynamic = dynamicCYService.findById(id);
        DateVo dateVo = getDateFormat(dynamic);
        modelAndView.addObject("dynamic", dynamic);
        modelAndView.addObject("dateVo", dateVo);
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈思享重阳〉
     *
     * @param currentPage
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/enjoycy")
    public ModelAndView enjoyCY(@RequestParam(value="currentPage", required=false, defaultValue="1") int currentPage, HttpServletRequest request,
            HttpServletResponse response) {
        log.info(LOGCONTROLLERCLASS + "select all enjoycy start");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("enjoycy");
        
        //重阳问答
        Page<QuestionVo> question_page = new Page<QuestionVo>();
        List<Integer> question_pageRolling = new ArrayList<Integer>();
        question_page.setPageNo(currentPage);
        question_page.setPageSize(pageCount);
        questionCYService.findAll(question_page);
        if(question_page.getTotalPage() >= 8){
            for(int i = 0;i < 15;i++){
                question_pageRolling.add(currentPage + i - 7);
            }
        }else{
            for(int i = 0;i < question_page.getTotalPage();i++){
                question_pageRolling.add(i + 1);
            }
        }
        modelAndView.addObject("question_page", question_page);
        modelAndView.addObject("question_pageRolling", question_pageRolling);
        
        //重阳视点
        Page<ViewVo> view_page = new Page<ViewVo>();
        List<Integer> view_pageRolling = new ArrayList<Integer>();
        view_page.setPageNo(currentPage);
        view_page.setPageSize(pageCount);
        viewCYService.findAll(view_page);
        if(view_page.getTotalPage() >= 8){
            for(int i = 0;i < 15;i++){
                view_pageRolling.add(currentPage + i - 7);
            }
        }else{
            for(int i = 0;i < view_page.getTotalPage();i++){
                view_pageRolling.add(i + 1);
            }
        }
        modelAndView.addObject("view_page", view_page);
        modelAndView.addObject("view_pageRolling", view_pageRolling);
        
        //重阳推荐
        Page<RecommendedVo> recommended_page = new Page<RecommendedVo>();
        List<Integer> recommended_pageRolling = new ArrayList<Integer>();
        recommended_page.setPageNo(currentPage);
        recommended_page.setPageSize(pageCount);
        recommendedCYService.findAll(recommended_page);
        if(recommended_page.getTotalPage() >= 8){
            for(int i = 0;i < 15;i++){
                recommended_pageRolling.add(currentPage + i - 7);
            }
        }else{
            for(int i = 0;i < recommended_page.getTotalPage();i++){
                recommended_pageRolling.add(i + 1);
            }
        }
        modelAndView.addObject("recommended_page", recommended_page);
        modelAndView.addObject("recommended_pageRolling", recommended_pageRolling);

        log.info(LOGCONTROLLERCLASS + "select all enjoycy end");
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈重阳问答描述〉
     *
     * @param id
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/questionInfocy")
    public ModelAndView questionInfoCY(@RequestParam int id, HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("questionInfocy");
        
        QuestionVo question = questionCYService.findById(id);
        modelAndView.addObject("question", question);
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈重阳视点描述〉
     *
     * @param id
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/viewInfocy")
    public ModelAndView viewInfoCY(@RequestParam int id, HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("viewInfocy");
        
        ViewVo view = viewCYService.findById(id);
        modelAndView.addObject("view", view);
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈重阳建文描述〉
     *
     * @param id
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/recommendedInfocy")
    public ModelAndView recommendedInfoCY(@RequestParam int id, HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("recommendedInfocy");
        
        RecommendedVo recommended = recommendedCYService.findById(id);
        modelAndView.addObject("recommended", recommended);
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈产品与服务〉
     *
     * @param k
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/productscy")
    public ModelAndView productsCY(@RequestParam(value="k", required=false, defaultValue="1") int k, 
            HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        //获取session
        HttpSession session = request.getSession(true);
        String validation = (String)session.getAttribute(VALIDATIONFLAG);
        if(!StringUtils.isEmpty(validation) && VALIDATIONFLAGTRUE.equals(validation)){
            modelAndView.setViewName("productscy");
        }else{
            modelAndView.setViewName("validationcy");
            modelAndView.addObject("k", k);
        }
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈用户登陆〉
     *
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/logincy")
    @ModelAttribute
    public ModelAndView loginCY(LoginReturns loginReturns, HttpServletRequest request, 
            HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        //获取session
        HttpSession session = request.getSession(true);
        UserVo user = (UserVo)session.getAttribute(USERLOGIN);
        if(user != null){
            modelAndView.addObject("user", user);
            modelAndView.setViewName("userinfocy");
        }else{
            log.info(LOGCONTROLLERCLASS + "--------登陆");
            String loginError = loginReturns.getReturns_msg();
            if(!StaticDefaultValue.SUCCESS.equals(loginError) && !StringUtils.isEmpty(loginError)){
                try {
                    loginError = new String(loginError.getBytes("ISO8859_1"),"utf-8");
                } catch (UnsupportedEncodingException e) {
                    log.error(LOGCONTROLLERCLASS,e);
                    e.printStackTrace();
                }
                modelAndView.addObject("loginError", loginError);
            }
            modelAndView.setViewName("logincy");
        }
        return modelAndView;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈退出登陆〉
     *
     * @param url
     * @param query
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/exitcy")
    public String exitCY(@RequestParam(value="url", required=false, defaultValue="logincy") String url, @RequestParam(value="query", required=false, defaultValue="") String query, HttpServletRequest request, 
            HttpServletResponse response) {
        //获取session
        HttpSession session = request.getSession(true);
        session.removeAttribute(USERLOGIN);
        
        return "redirect:/cy/" + url + ".asp?" + query;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈忘记密码〉
     *
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/forgetpwdcy")
    public ModelAndView forgetpwdCY(HttpServletRequest request, HttpServletResponse response) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("forgetpwdcy");
        //获取session
        HttpSession session = request.getSession(true);
        session.removeAttribute(USERLOGIN);
        
        return modelAndView;
    }
    
    @RequestMapping(value = "/toLogincy")
    public String toLoginCY(HttpServletRequest request, HttpServletResponse response) {
        String returns = StaticDefaultValue.SUCCESS;
        String returns_msg = StaticDefaultValue.SUCCESS_MSG;
        int temp = 0;
        //登陆方式
        String longinWay = request.getParameter("longinWay");
        //证件类型
        String certificateType = request.getParameter("certificateType");
        //证件号码
        String custID = request.getParameter("custID");
        //密码
        String pwd = request.getParameter("pwd");
        //验证码
        String captcha = request.getParameter("captcha_response");
        
        if(temp == 0){
            if(!validationCode.toLowerCase().equals(captcha.toLowerCase())){
                //验证码错误
                returns = StaticDefaultValue.CAPTCHA_ERROR;
                returns_msg = StaticDefaultValue.CAPTCHA_ERROR_MSG;
                temp = 1;
            }
        }
        if(temp == 0){
            if(StringUtils.isEmpty(longinWay) || StringUtils.isEmpty(certificateType)){
                //证件类型或者登陆方式错误
                returns = StaticDefaultValue.CUSTOMERIDTYPE_ERROR;
                returns_msg = StaticDefaultValue.CUSTOMERIDTYPE_ERROR_MSG;
                temp = 1;
            }
        }
        if(temp == 0){
            if(StringUtils.isEmpty(custID) || StringUtils.isEmpty(pwd)){
                //用户名或者密码错误
                returns = StaticDefaultValue.ACCOOUNT_ERROR;
                returns_msg = StaticDefaultValue.ACCOOUNT_ERROR_MSG;
                temp = 1;
            }
        }
        if(temp == 0){
            UserVo user = new UserVo();
            user.setPassword(pwd);
            switch (certificateType) {
                case "idcard":
                    user.setIdcard(custID);
                    break;
                case "passport":
                    user.setPassport(custID);
                    break;
                case "come":
                    user.setCome(custID);
                    break;
                case "soldiers":
                    user.setSoldiers(custID);
                    break;
                case "returncard":
                    user.setReturncard(custID);
                    break;
                case "register":
                    user.setRegister(custID);
                    break;
                case "civiliancard":
                    user.setCiviliancard(custID);
                    break;
                case "policecard":
                    user.setPolicecard(custID);
                    break;
                case "other":
                    user.setOther(custID);
                    break;
            }
            user = userCYService.getUser(user);
            if(user == null){
                //用户名或者密码错误
                returns = StaticDefaultValue.ACCOOUNT_ERROR;
                returns_msg = StaticDefaultValue.ACCOOUNT_ERROR_MSG;
                temp = 1;
            }else{
                //获取session
                HttpSession session = request.getSession(true);
                session.removeAttribute(USERLOGIN);
                session.setAttribute(USERLOGIN, user);
                returns = StaticDefaultValue.SUCCESS;
                returns_msg = StaticDefaultValue.SUCCESS_MSG;
            }
        }
        
        String url = "redirect:/cy/logincy.asp?returns=" + returns + "&returns_msg=" + returns_msg;
        try {
            url = new String(url.getBytes("utf-8"),"ISO8859_1");
        } catch (UnsupportedEncodingException e) {
            log.error(LOGCONTROLLERCLASS, e);
            e.printStackTrace();
        }
        return url;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈产生验证码〉
     *
     * @param request
     * @param response
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/verificationCode")
    public void getVerificationcodeCY(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("image/jpeg");
        //获取验证码
        BufferedImage image = VerificationCode.getVerificationCode();
        validationCode = VerificationCode.verificationCode;
        ServletOutputStream outStream = null;
        try {
            outStream = response.getOutputStream();
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(outStream);
            encoder.encode(image);
            outStream.close();
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈功能详细描述〉
     *
     * @param k
     * @param request
     * @param response
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping(value = "/getvalidation")
    public String getValidation(@RequestParam(value="k", required=false, defaultValue="1") int k, HttpServletRequest request, HttpServletResponse response) {
        //获取session
        HttpSession session = request.getSession(true);
        session.setAttribute(VALIDATIONFLAG, VALIDATIONFLAGTRUE);
        
        return "redirect:/cy/productscy.asp?k=" + k;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈格式化时间〉
     *
     * @param dynamic
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public DateVo getDateFormat(DynamicVo dynamic){
        if(dynamic == null || StringUtils.isEmpty(dynamic.getPublicdate())){
            log.info(LOGCONTROLLERCLASS + " dynamic is null");
            return null;
        }
        String publicdate = dynamic.getPublicdate();
        publicdate = publicdate.replaceAll("\\.", "-");
        publicdate = publicdate.replaceAll("/", "-");
        String []datetemp = publicdate.split("-");
        if(datetemp.length == 3){
            return new DateVo(datetemp[0],datetemp[1],datetemp[2]);
        }
        log.error(LOGCONTROLLERCLASS + " dynamic is error");
        return null;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈处理结果集〉
     *
     * @param list
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public List<List<?>> getPagingFormat(List<?> list){
        List<List<?>> paging = new ArrayList<List<?>>();
        List<Object> subPaging = new ArrayList<Object>();
        if(list.size() <= 1){
            return paging;
        }
        for(int i = 1;i < list.size();i++){
            subPaging.add(list.get(i));
            if(i % 2 == 0){
                paging.add(subPaging);
                subPaging = new ArrayList<Object>();
            }
        }
        if(subPaging.size() > 0){
            paging.add(subPaging);
        }
        return paging;
    }
    
    /**
     * 
     * 功能描述: <br>
     * 〈截取字符串，如果长度超过66截取，否则直接返回〉
     *
     * @param str
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    public String dealString(String str){
        if(str == null){
            return "";
        }
        if(str.length() <= 66){
            return str;
        }
        str = str.substring(0, 65) + "...";
        return str;
    }
}
