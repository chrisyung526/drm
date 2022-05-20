package cn.tcsoft.drm.enums;

/**
 * Batch Job Status 12 way
 * @author hyman
 * @date 2022-03-28
 */
public enum JobStatusEnum {

    NEW(1, "New","新建"),
    IN_PROGRESS(2, "In Progress","进行中"),
    PROCESSING(3, "Processing","处理"),
    PROCESSED(4, "Processed","已处理"),
    UNDER_VERIFICATION(5, "Under Verification","核查中"),
    FOR_VERIFICATION(6,"For Verification","关于核查"),
    UNDER_REVISION(7, "Under Revision","修订中"),
    FOR_REVISION(8, "For Revision","关于修订"),
    VERIFIED(9, "Verified","已验证"),
    UNDER_APPROVAL(10, "Under Approval","审核中"),
    FOR_APPROVAL(11, "For Approval","待审核"),
    APPROVED(12, "Approved","已审核"),
    PUBLISHED(13, "Published","已发布"),
    UNPUBLISHED(14, "Unpublished","未发布"),
    FAILED(15, "Failed","失败");

    private Integer code;
    private String status;
    private String msg;


    JobStatusEnum(final Integer code, final String status, final String msg) {
        this.code = code;
        this.status = status;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public String getStatus() {
        return status;
    }
}
