package com.sc.controller;

import com.github.pagehelper.PageInfo;
import com.sc.pojo.OAdmin;
import com.sc.service.OAdminService;
import com.sc.service.OMenuService;
import com.sc.service.ORoleService;
import com.sc.util.CodeUtil;
import com.sc.util.MD5;
import com.sc.util.UpDownUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class OAdminController {
    //依赖于业务层(可以写多个)
    @Autowired
    @Qualifier("oas")
    OAdminService oas;

    @Autowired
    ORoleService ors;

    @Autowired
    OMenuService oms;

    @RequestMapping("/login")
    public String login(OAdmin a,String code, HttpSession session){
        a.setPassword(MD5.MD5Code(a.getPassword()));
        //admin(role(list(Menu)))
        OAdmin admin = oas.login(a);
        String randomCode=(String)session.getAttribute("randomCode");
        if(code.equalsIgnoreCase(randomCode)) {
            if (admin != null) {
                /*将之前上传的去除*/
                UpDownUtil.path=session.getServletContext().getRealPath("/upload");

                session.setAttribute("admin", admin);
                session.setAttribute("roles",ors.queryAll());
                session.setAttribute("menus",oms.queryAll());
                return "redirect:/toHome";
            }
        }
        return "redirect:/toLogin";
    }
    @RequestMapping("/getCode")
    public void getCode(HttpSession session,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CodeUtil.processRequest(req,resp);
    }
    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue="1")Integer pageNum, Map map){
        PageInfo<OAdmin> p=oas.show(pageNum);
        map.put("p",p);
        return "/admin/list";
    }

    @RequestMapping("/toList")
    public String toList(){
        return "/admin/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "/admin/add";
    }

    @RequestMapping("/add")
    public String add(OAdmin a, MultipartFile myHead,HttpServletRequest req){
        String fileName= UpDownUtil.upload(myHead,req);
        a.setHeadPic(fileName);
        a.setPassword(MD5.MD5Code(a.getPassword()));
        oas.add(a);
        return "redirect:/admin/show";
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("admin");
        return "redirect:/toLogin";
    }

    @RequestMapping("/editPwd")
    public String editPwd(OAdmin admin){
        admin.setPassword(MD5.MD5Code(admin.getPassword()));
        oas.editPwd(admin);
        return "redirect:/toLogin";
    }

    @RequestMapping("/profile")
    public String profile(OAdmin admin,MultipartFile myHead,HttpServletRequest request){
        /*设置头像*/
       /* admin.setHeadPic(UpDownUtil.upload(myHead, request));*/
        oas.profile(admin);
        return "redirect:/admin/show";
    }
    /*判断密码是否存在 */
    @RequestMapping("/checkPwd")
    @ResponseBody
    public boolean checkPwd(HttpSession session,String pwd){
        OAdmin a=(OAdmin)session.getAttribute("admin");
        if(MD5.MD5Code(pwd).equals(a.getPassword())){
            return true;
        }
        return false;
    }

    @RequestMapping("/queryById")
    public String queryById(Integer id,Map map){
        OAdmin admin=oas.queryById(id);
        map.put("a",admin);
        return "/admin/update";
    }

    @RequestMapping("/update")
    public String update(OAdmin admin,MultipartFile myHead,HttpServletRequest request){
        /*设置头像*/
        admin.setHeadPic(UpDownUtil.upload(myHead, request));
        /*设置密码*/
        if(admin.getPassword()!=null && admin.getPassword().equals("")) {
            admin.setPassword(MD5.MD5Code(admin.getPassword()));
        }
        oas.update(admin);
        return "redirect:/admin/show";
    }


    @RequestMapping("/delete")
    public String delete(Integer id){
        oas.delete(id);
        return "redirect:/admin/show";
    }

    @RequestMapping("/enableAll")
    public String enableAll(Integer[] ids){
        oas.enableAll(ids);
        return "redirect:/admin/show";
    }

    @RequestMapping("disableAll")
    public String disableAll(Integer[] ids){
        oas.disableAll(ids);
        return "redirect:/admin/show";
    }

    @RequestMapping("/deleteAll")
    public String deleteAll(Integer[] ids){
        oas.deleteAll(ids);
        return "redirect:/admin/show";
    }

    @RequestMapping("/select")
    public String select(OAdmin admin){
        oas.select(admin);
        return "redirect:/admin/show";
    }
}
