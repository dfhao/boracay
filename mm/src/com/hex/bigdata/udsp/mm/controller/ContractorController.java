package com.hex.bigdata.udsp.mm.controller;

import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.mm.dto.ContractorView;
import com.hex.bigdata.udsp.mm.model.Contractor;
import com.hex.bigdata.udsp.mm.service.ContractorService;
import com.hex.goframe.controller.BaseController;
import com.hex.goframe.model.MessageResult;
import com.hex.goframe.model.Page;
import com.hex.goframe.model.PageListResult;
import com.hex.goframe.util.FileUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA
 * Author: tomnic.wang
 * DATE:2017/4/12
 * TIME:19:11
 */
@RequestMapping("/mm/contractor/")
@Controller
public class ContractorController extends BaseController{
    /**
     * 日志记录
     */
    private static Logger logger = LogManager.getLogger(ContractorController.class);

    /**
     * 模型管理-模型基础信息管理服务
     */
    @Autowired
    private ContractorService contractorService;

    /**
     * 分页多条件查询
     * @param contractorView 查询参数
     * @param page 分页参数
     * @return
     */
    @RequestMapping({"/page"})
    @ResponseBody
    public PageListResult queryRtsDatasources(ContractorView contractorView, Page page) {
        List<ContractorView> list = contractorService.select(contractorView, page);
        logger.debug("selectPage search=" + JSONUtil.parseObj2JSON(contractorView) + " page=" + JSONUtil.parseObj2JSON(page));
        return new PageListResult(list, page);
    }


    /**
     * 实时流-新增服务记录
     * @param contractor
     * @return
     */
    @RequestMapping({"/insert"})
    @ResponseBody
    public MessageResult insert(@RequestBody Contractor contractor) {
        boolean status = true;
        String message = "添加成功";
        if (contractor == null) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                if (StringUtils.isBlank(contractorService.insert(contractor))) {
                    status = false;
                    message = "添加失败";
                }
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
                message = "系统异常：" + e.getMessage();
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.warn(message);
        }
        return new MessageResult(status, message);
    }

    /**
     * 检查名称唯一性
     *
     * @param name 服务名称
     * @return
     */
    @RequestMapping({"/checkName/{name}"})
    @ResponseBody
    public MessageResult checekName(@PathVariable("name") String name) {
        boolean status = true;
        String message = "检查成功";
        if (StringUtils.isBlank(name)) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                if (!contractorService.checekUniqueName(name)) {
                    status = false;
                    message = "检查完成，名称不存在！";
                }
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
                message = "系统异常：" + e.getMessage();
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.warn(message);
        }
        return new MessageResult(status, message);
    }


    @RequestMapping({"/select/{pkId}"})
    @ResponseBody
    public MessageResult select(@PathVariable("pkId") String pkId) {
        boolean status = true;
        String message = "查询成功";
        Contractor contractor = null;
        if (StringUtils.isBlank(pkId)) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                contractor = this.contractorService.select(pkId);
            } catch (Exception e) {
                status = false;
                message = "系统异常：" + e.getMessage();
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.warn(message);
        }
        return new MessageResult(status, message, contractor);
    }

    @RequestMapping({"/update"})
    @ResponseBody
    public MessageResult update(@RequestBody Contractor contractor) {
        boolean status = true;
        String message = "更新成功";
        if (contractor == null) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                if (!contractorService.update(contractor)) {
                    status = false;
                    message = "更新失败";
                }
            } catch (Exception e) {
                status = false;
                message = "系统异常：" + e.getMessage();
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.warn(message);
        }
        return new MessageResult(status, message);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public MessageResult delete(@RequestBody Contractor[] contractors) {
        boolean status = true;
        String message = "删除成功";
        if (contractors.length == 0) {
            status = false;
            message = "请求参数为空";
        }
        try {
            MessageResult messageResult=contractorService.delete(contractors);
            return messageResult;
        } catch (Exception e) {
            status = false;
            message = "系统异常：" + e.getMessage();
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.warn(message);
        }
        return new MessageResult(status, message);
    }

    /**
     * 查询模型厂商列表信息
     * @param
     * @return
     */
    @RequestMapping({"/select"})
    @ResponseBody
    public PageListResult select() {
        List<Contractor> list = null;
        try {
            list = contractorService.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("系统异常：" + e);
        }
        return new PageListResult(list);
    }


    @RequestMapping("upload")
    @ResponseBody
    public MessageResult upload(MultipartFile excelFile){
        boolean status = true;
        String message = "上传成功";

        //判断结尾是否为xl或者xlsx
        if (((CommonsMultipartFile)excelFile).getFileItem().getName().endsWith(".xls")
                || ((CommonsMultipartFile)excelFile).getFileItem().getName().endsWith(".xlsx")) {
            //将文件放到项目上传文件目录中
            String uploadFilePath = FileUtil.uploadFile(FileUtil
                    .getRealUploadPath("EXCEL_UPLOAD"), excelFile);
            Map<String,String> result = contractorService.uploadExcel(uploadFilePath);
            if("false".equals(result.get("status"))){
                status = false;
                message = result.get("message");
            }
        }else{
            status = false;
            message = "请上传正确格式的文件！";
        }
        return new MessageResult(status,message);
    }

    @ResponseBody
    @RequestMapping("/download")
    public String createExcel(@RequestBody Contractor[] contractors){
        // 写入Excel文件
        String filePath = "";
        try {
            filePath = contractorService.createExcel(contractors);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return filePath;
    }
}
