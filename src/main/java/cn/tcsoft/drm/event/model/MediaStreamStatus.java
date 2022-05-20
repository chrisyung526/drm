package cn.tcsoft.drm.event.model;

import lombok.Data;

import java.io.Serializable;

/**
 * @author : hyman
 * create at:  2022/2/23  17:09
 * @description:
 */
@Data
public class MediaStreamStatus implements Serializable {

    /**
     * 转换数据的id
     */
    Long objId;
    /**
     * 状态
     */
    Integer state;
    /**
     * 原因
     */
    String msg;
}