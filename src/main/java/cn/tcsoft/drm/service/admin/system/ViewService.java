package cn.tcsoft.drm.service.admin.system;

import cn.tcsoft.drm.entity.admin.system.View;
import cn.tcsoft.drm.model.vo.ViewQueryVO;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.IOException;
import java.util.List;
import cn.tcsoft.drm.model.QueryPageDO;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author CodeGenerator
 * @since 2022-05-07
 */
public interface ViewService extends IService<View> {
    /**
     * 根据View的id获取当前对象
     * @param id
     * @return View
     */
    View getInfoById(Long id);



    /**
    * 修改
    * @param view
    * @return  true代表更新成功  false代表更新失败
    */
    boolean updateView(View view);

    /**
    * 新增
    * @param view
    * @return true代表新增成功  false代表新增失败
    */
    boolean insertView(View view);

    /**
    * 删除
    * @param id 要删除的对象主键
    * @return true代表删除成功  false代表删除失败
    */
    boolean delete(Long id);

    /**
    * 批量删除
    * @param ids 要删除的集合列表
    * @return true代表删除成功  false代表删除失败
    */
    boolean deleteList(List<Long> ids);

    /**
    * 分页查询
    * @param query  分页参数
    * @return  Page<View>
    */
    Page<View> getViewPage(ViewQueryVO query);

    /**
     * 文件导入
     * @param file
     * @return
     * @throws IOException
     */
    String inputFile(MultipartFile file) throws IOException;
}
