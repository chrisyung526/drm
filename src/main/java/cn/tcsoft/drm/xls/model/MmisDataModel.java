package cn.tcsoft.drm.xls.model;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

/**
 * @author : hyman
 * create at:  2021/12/21  14:02
 * @description: mmis提供的数据模板数据
 */
@Data
public class MmisDataModel {
    /**
     * 第一列的数据
     */
    @ExcelProperty(index = 0)
    private String category;
    /**
     * 第二列的数据
     */
    @ExcelProperty(index = 1)
    private String bibNo;
    /**
     * 第三列的数据
     */
    @ExcelProperty(index = 2)
    private String metadataField;
    /**
     * 第四列的数据
     */
    @ExcelProperty(index = 3)
    private String sequence;

    /**
     * 第五列
     */
    @ExcelProperty(index = 4)
    private String value;
}