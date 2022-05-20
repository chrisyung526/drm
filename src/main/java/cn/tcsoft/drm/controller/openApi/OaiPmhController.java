package cn.tcsoft.drm.controller.openApi;

import cn.tcsoft.drm.model.OaiPhmQuery;
import cn.tcsoft.drm.model.ResultEntity;
import cn.tcsoft.drm.model.ResultFactory;
import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author : laimin
 * create at:  2022/5/17  17:08
 * @description: OAI-PMH
 */
@Slf4j
@RestController
@RequestMapping("/open-api/oaipmh")
@Api(tags = "OAIPMH书目信息收割")
public class OaiPmhController {

    @RequestMapping(method = {RequestMethod.POST,RequestMethod.GET}, produces = MediaType.APPLICATION_XML_VALUE)
    @ApiOperation("oaipm客户端接口")
    public ResultEntity requestClient(OaiPhmQuery query){
        log.debug(JSON.toJSONString(query));
        return ResultFactory.success(null);
    }
}