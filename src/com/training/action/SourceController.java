package com.training.action;

import com.training.model.PageInfo;
import com.training.model.Source;
import com.training.model.User;
import com.training.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/source")
public class SourceController {

    @Autowired
    SourceService sourceService;

    @RequestMapping("/uploadpage")
    public String page(){
        return "file/fileupoad";
    }


    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam(value = "file",required = false) CommonsMultipartFile file, @RequestParam(value = "bgpath",required = false) CommonsMultipartFile bgpath,HttpServletRequest request,HttpServletResponse response) throws IOException {
        cross(response);
        if (file.isEmpty()||bgpath.isEmpty()){
            return "please select file";
        }
        Source source=new Source();
        //获取页面表单提交的数据
        source.setTitle(request.getParameter("title"));
        source.setExplain(request.getParameter("explain"));
        source.setUploadby(request.getParameter("uploadby"));
        source.setDeptname(request.getParameter("deptname"));
        source.setShow(request.getParameter("show"));

        //时间模板
        source.setUploadtime(String.valueOf(new Date()));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String res = sdf.format(new Date());
        // uploads文件夹位置
       // String rootPath = request.getSession().getServletContext().getRealPath("WEB-INF/upload");
        /*String rootPath ="E:\\project\\Train\\Train\\WebContent\\upload";*/
        String rootPath ="E:\\upload";
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        String originalImageName = bgpath.getOriginalFilename();
        source.setType(originalFileName.substring((originalFileName.lastIndexOf("."))+1));
        System.out.println("******************"+originalFileName+"******"+source.getType());
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        String newImageName = "image" +res+originalImageName.substring(originalImageName.lastIndexOf("."));
        // 创建年月文件夹
//        Calendar date = Calendar.getInstance();
//        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH)+1));
        File dateDirs = new File(source.getUploadby());

        // 新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        File newImage = new File(rootPath + File.separator + dateDirs + File.separator + newImageName);

        //数据库url
        String newFile1 = "http://10.120.7.221:8080/train" + "/"+ dateDirs + "/" + newFileName;
        String newImage1 = "http://10.120.7.221:8080/train" + "/" + dateDirs + "/"+ newImageName;


        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        System.out.println(newFile);
        System.out.println(newImage);
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        bgpath.transferTo(newImage);
        //将保存的磁盘路径写入数据库
        source.setReallocation(newFile.toString());
        source.setRealbgpath(newImage.toString());
        // 完整的url
        //String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
        source.setUploadtime(sdf1.format(new Date()));
        source.setLocation(newFile1.toString());
        source.setBgimage(newImage1.toString());
        //计算文件大小，以M为单位
        DecimalFormat df = new DecimalFormat( "0.## ");
        Float si=file.getSize()/1024f/1024f;
        System.out.println(df.format(si)+"M");
        source.setSize(si+"M");

        sourceService.add(source);
        System.out.println("上传文件成功！");
        return "success!";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String delete(long id,HttpServletResponse response){
        cross(response);
        Source source =sourceService.getSourceById(id);
        File location =new File(source.getReallocation());
        File bgpath = new File(source.getRealbgpath());
        location.delete();
        bgpath.delete();
        sourceService.delete(id);
        return "success!";
    }

    @RequestMapping("/listjson")
    @ResponseBody
    public List<Source> listjson(HttpServletResponse response){
        cross(response);
        List<Source> sources=sourceService.list();
        return sources;
    }

    @RequestMapping("/listSourceByPage")
    @ResponseBody
    public PageInfo<Source> listByPage(Integer currentPage,Integer pageSize,HttpServletResponse response){
        cross(response);
        return sourceService.listSourceByPage(currentPage,pageSize);
    }

    @RequestMapping("/listSourceByDept")
    @ResponseBody
    public PageInfo<Source> listByDept(Integer currentPage,Integer pageSize,String deptname,HttpServletRequest request,HttpServletResponse response){
        cross(response);
        return sourceService.listSourceByDept(currentPage,pageSize,deptname);
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Source source,HttpServletResponse response,@RequestParam(value = "newImage",required = false) CommonsMultipartFile newImage) throws IOException {
        cross(response);
        if (newImage.isEmpty()||newImage.getSize()==0){
            sourceService.update(source);
            return "change without bgimage success!";
        }else {
            Source source1 =sourceService.getSourceById(source.getId());
            File bgpath = new File(source1.getRealbgpath());
            bgpath.delete();
            newImage.transferTo(new File(source1.getRealbgpath()));
            sourceService.update(source);
            return "success!";
        }

    }

    @RequestMapping("/getSourceById")
    @ResponseBody
    public Source update(long id,HttpServletResponse response){
        cross(response);
        Source source=sourceService.getSourceById(id);
        return source;
    }

    @RequestMapping("/test")
    @ResponseBody
    public User test(String a){
        System.out.println(a);
        User user=new User();
        user.setUsername(a);
        return user;
    }

    public List<String> find(File file) {
        File[] file1 = file.listFiles();
        List<String> filename=new ArrayList<>();
        for (File f : file1) {
            if (f.isDirectory()) {
                System.out.println(f.getName());
                //filename.add(f.getName());
                find(f);
            } else {
                System.out.println(f.getName());
                filename.add(f.getName());
            }
        }
        return filename;
    }

    public void cross(HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Credentials", "true");
    }
}
