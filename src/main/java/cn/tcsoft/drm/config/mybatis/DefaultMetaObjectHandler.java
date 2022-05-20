package cn.tcsoft.drm.config.mybatis;

import cn.tcsoft.drm.model.dto.UserInfoDto;
import cn.tcsoft.drm.util.UserInfoHolder;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Objects;

/**
 * 元对象字段填充
 * @author hyman
 * @date 2021-10-29
 */
@Primary
@Component
public class DefaultMetaObjectHandler implements MetaObjectHandler {
  private static final String ORG_ID="orgId",ORG_NAME="orgName",
          CREATE_TIME="createDt",UPDATE_TIME="lastUpdDt",
          CREATE_BY="createBy",UPDATE_BY="lastUpdBy";
  /**
   * 获取用户信息
   * @return
   */
  private UserInfoDto getUserInfo(){
    return UserInfoHolder.get();
  }
  /**
   * 插入元对象字段填充（用于插入时对公共字段的填充）
   *
   * @param metaObject 元对象
   */
  @Override
  public void insertFill(MetaObject metaObject) {
    Date ts = new Date();
    this.setFieldValByName(CREATE_TIME, ts, metaObject);
    this.setFieldValByName(UPDATE_TIME, ts, metaObject);
    UserInfoDto userInfo=getUserInfo();
    if(Objects.nonNull(userInfo)){
      this.setFieldValByName(ORG_ID, userInfo.getOrgId(), metaObject);
      this.setFieldValByName(ORG_NAME, userInfo.getOrgName(), metaObject);
      this.setFieldValByName(CREATE_BY, userInfo.getUserName(), metaObject);
      this.setFieldValByName(UPDATE_BY, userInfo.getUserName(), metaObject);
    }
  }

  /**
   * 更新元对象字段填充（用于更新时对公共字段的填充）
   *
   * @param metaObject 元对象
   */
  @Override
  public void updateFill(MetaObject metaObject) {
    this.setFieldValByName(UPDATE_TIME, new Date(), metaObject);
    UserInfoDto userInfo=getUserInfo();
    if(Objects.nonNull(userInfo)){
      this.setFieldValByName(UPDATE_BY, userInfo.getUserName(), metaObject);
    }
  }

}
