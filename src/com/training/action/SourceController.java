package com.training.action;

import com.training.model.Source;
import com.training.service.SourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
    public String upload(@RequestParam(value = "file",required = false) CommonsMultipartFile file, @RequestParam(value = "bgpath",required = false) CommonsMultipartFile bgpath,HttpServletRequest request) throws IOException {
        System.out.println("666");
        Source source=new Source();
        ModelAndView modelAndView=new ModelAndView();
        source.setTitle(request.getParameter("title"));
        source.setType(request.getParameter("type"));
        source.setExplain(request.getParameter("explain"));
        source.setUploadby(request.getParameter("uploadby"));
        source.setUploadtime(String.valueOf(new Date()));
        System.out.println(source);
        //sourceService.add(source);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String res = sdf.format(new Date());
        // uploads文件夹位置
       // String rootPath = request.getSession().getServletContext().getRealPath("WEB-INF/upload");
        String rootPath ="E:\\project\\Train\\Train\\WebContent\\upload";
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        String originalImageName = bgpath.getOriginalFilename();
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
        // 完整的url
        //String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
        source.setUploadtime(sdf1.format(new Date()));
        source.setLocation(newFile.toString());
        source.setBgimage(newImage.toString());
        sourceService.add(source);
        System.out.println("上传文件成功！");
        return "success";
    }

    @RequestMapping("/list")
    public void list(){
        List<Source> sources=sourceService.list();
        for (Source s:sources){
            System.out.println(s);
        }
       List<String> filename= find(new File("E:\\project\\Train\\Train\\WebContent\\upload"));

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
}
