package com.training.web.controller.common;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.training.common.core.domain.AjaxResult;
import com.training.common.utils.file.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @Description
 * @Author sgl
 * @Date 2018-05-15 14:04
 */
@Controller
public class UploadController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UploadController.class);

   // @Value("${upload.file-path}")
    private String filePath="D:\\EHS\\uploadPath";

//    @GetMapping("/upload")
//    public String upload() {
//        return "upload";
//    }


    @RequestMapping("/upload")
    @ResponseBody
    public AjaxResult upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return AjaxResult.error("无上传文件，请选择文件后上传");
        }

        String fileName = file.getOriginalFilename();
        String uuid = UUID.randomUUID().toString();
        String ext = FileUtils.getExtention(fileName);

//        if(!ext.toLowerCase().equals(".xls")) {
//            return AjaxResult.error("文件格式不是 .xls，请选择正确文件");
//        }

        LOGGER.info("上传文件：" + fileName + ",uuid:" + uuid);

        File dest = new File(filePath + uuid + ext);
        try {
            file.transferTo(dest);
            LOGGER.info("上传成功, 文件名：" + uuid + ext);
            return AjaxResult.success("上传成功", uuid + ext);
        } catch (IOException e) {
            LOGGER.error(e.toString(), e);
        }
        return AjaxResult.error("上传失败！");
    }



}