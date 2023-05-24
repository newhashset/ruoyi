package com.sc.util;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

/*
  上传和下载的工具类：适用于ssm框架 不适应于springboot
  如果换了环境 主要路径 /upload
* */
public class UpDownUtil {
    //地址
    public static String path;
    //上传文件
    public static String upload(MultipartFile myHead, HttpServletRequest req)  {
        //获取项目的真实路径 +/upload包
        String realPath = req.getServletContext().getRealPath("/upload");
        File file=new File(realPath);
        if(!file.exists()){//如果文件不存在 自动创建
            file.mkdirs();
        }
        //不上传头像 文件是空的 返回null
        if(myHead.isEmpty()){
            return "";
        }
        //获取上传的文件名
        String filename = myHead.getOriginalFilename();
        //上传的文件名 不能是存储的文件名 否则替换同名的文件
        //UUID会动态生成32位 永不重复字符串
        //1.png -->xxx.png 存储文件名=UUID+原后缀名
        String suffer=filename.substring(filename.lastIndexOf("."));//后缀
        UUID uuid = UUID.randomUUID();//前缀
        filename=uuid+suffer;//更换的文件名
        //File.separator 动态斜杠 根据操作系统的不同 自动分配
        File file1=new File(realPath+File.separator+filename);
        //文件上传的方法
        try {
            myHead.transferTo(file1); //上传的方法
        } catch (IOException e) {
            e.printStackTrace();
        }
        return filename;
    }
    //下载文件
    public static  ResponseEntity<byte[]> download(HttpServletRequest req,String filename){
        ResponseEntity<byte[]> responseEntity=null;
        try {
            //1.获取头部信息
            HttpHeaders headers=new HttpHeaders();
            //2.设置文档类型设置成流
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            //3.指定附件类型下载 附件attachment ,下载后的文件名
            //3.1封装好下载文件
            String realPath = req.getServletContext().getRealPath("/upload")+File.separator+filename;
            File file = new File(realPath);//参数：下载哪个文件的地址
            byte[] bytes = new byte[0];
            bytes = FileUtils.readFileToByteArray(file);
            //3.2如果文件名保存中文一定要处理
            filename= URLEncoder.encode(filename, "utf-8");
            headers.setContentDispositionFormData("attachment",filename);
            //4.封装ResponseEntity对象
            //参数：数据 头部信息 状态
             responseEntity = new ResponseEntity<byte[]>(bytes,headers, HttpStatus.CREATED);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return responseEntity;
    }
    //删除头像
    public static void delete(String filename){
        File file = new File(UpDownUtil.path + File.separator+filename);
        if(file.exists()){
            file.delete();
        }
    }
}
