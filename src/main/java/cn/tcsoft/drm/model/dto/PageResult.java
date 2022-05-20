package cn.tcsoft.drm.model.dto;

import cn.tcsoft.drm.model.QueryPageDO;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author ZYS 2022-05-12 多表查询分页对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageResult<T> extends QueryPageDO {
    @ApiModelProperty(value = "当前页",example = "2")
    private Long current;
    @ApiModelProperty(value = "每页页数",example = "1")
    private Long size;

    @ApiModelProperty(value = "数据集合",example = "List<T> data")
    private List<T> data;
    @ApiModelProperty(value = "数据总量",example = "10")
    private Long totalCount;

    @ApiModelProperty(value = "总页数",example = "1")
    private Long totalPage;
    @ApiModelProperty(value = "上一页页数",example = "1")
    private Long prevPage;
    @ApiModelProperty(value = "下一页页数",example = "3")
    private Long nextPage;


    public PageResult(Long current, Long size, Long count, List<T> data)
    {
        this.current = current;
        this.size = size;

        this.data = data;
        this.totalCount = count;

        this.totalPage = this.totalCount % this.size == 0
                ? this.totalCount / this.size : this.totalCount / this.size + 1;
        this.nextPage = this.current + 1 <= this.totalPage ? this.current + 1 : this.totalPage;
        this.prevPage = this.current - 1 >= 1 ? this.current - 1 : 1;
    }

}