package cn.tcsoft.drm.util;

import cn.tcsoft.drm.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.util.Objects;

/**
 * @author : hyman
 * create at:  2022/2/11  17:37
 * @description: request工具类
 */
public class RequestUtils {
    /**
     * 获取B端token值
     * @param request
     * @return
     */
    public static String getAdminTokenValue(HttpServletRequest request){
        String tokenValue =request.getHeader(Constants.ADMIN_TOKEN);
        if(Objects.isNull(tokenValue)){
            tokenValue=request.getParameter(Constants.ADMIN_TOKEN);
        }
        return tokenValue;
    }

    /**
     * 获取C端token值
     * @param request
     * @return
     */
    public static String getClientTokenValue(HttpServletRequest request){
        String tokenValue =request.getHeader(Constants.CLIENT_TOKEN);
        if(Objects.isNull(tokenValue)){
            tokenValue=request.getParameter(Constants.CLIENT_TOKEN);
        }
        return tokenValue;
    }

    /**
     * 文件下载时用于写文件头部信息
     * @param request http请求
     * @param response http响应
     * @param fileName 文件名
     */
    public static void setFileDownloadHeader(HttpServletRequest request,
                                             HttpServletResponse response, String fileName) {
        try {
            String encodedFileName = null;
            String agent = request.getHeader("USER-AGENT");
            if (null != agent && -1 != agent.indexOf("MSIE")) {
                encodedFileName = URLEncoder.encode(fileName, "UTF-8");
            } else if (null != agent && -1 != agent.indexOf("Mozilla")) {
                encodedFileName = new String(fileName.getBytes("UTF-8"),
                        "iso-8859-1");
            } else {
                encodedFileName = URLEncoder.encode(fileName, "UTF-8");
            }

            response.setHeader("Content-Disposition", "attachment; filename=\""
                    + encodedFileName + "\"");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static final String UN_KNOWN = "unknown";
    public static final String LOCAL = "127.0.0.1";
    public static final String LOCAL_STR = "0:0:0:0:0:0:0:1";

    /**
     * 获取当前网络ip
     * @param request
     * @return
     */
    public static String getIpAddress(HttpServletRequest request){
        String ipAddress = request.getHeader("x-forwarded-for");
        if (ipAddress == null || ipAddress.length() == 0 || UN_KNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || UN_KNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.length() == 0 || UN_KNOWN.equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
            if (LOCAL.equals(ipAddress) || LOCAL_STR.equals(ipAddress)) {
                //根据网卡取本机配置的IP
                InetAddress inet=null;
                try {
                    inet = InetAddress.getLocalHost();
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                }
                ipAddress= inet.getHostAddress();
            }
        }
        //对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
        int i = 15;
        if (ipAddress != null && ipAddress.length() > i) {
            String str = ",";
            if (ipAddress.indexOf(str) > 0) {
                ipAddress = ipAddress.substring(0,ipAddress.indexOf(","));
            }
        }
        return ipAddress;
    }

    /**
     * 获得MAC地址
     * @param ip
     * @return
     */
    public static String getMacAddress(String ip){
        String str = "";
        String macAddress = "";
        try {
            Process p = Runtime.getRuntime().exec("nbtstat -A " + ip);
            InputStreamReader ir = new InputStreamReader(p.getInputStream());
            LineNumberReader input = new LineNumberReader(ir);
            int j = 100;
            for (int i = 1; i < j; i++) {
                str = input.readLine();
                if (str != null) {
                    if (str.indexOf("MAC Address") > 1) {
                        macAddress = str.substring(str.indexOf("MAC Address") + 14, str.length());
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace(System.out);
        }
        return macAddress;
    }
}