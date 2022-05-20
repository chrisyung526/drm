package cn.tcsoft.drm.util.xfocr;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author
 * @version 1.0
 * @description 讯飞ocr通用文字识别 https://www.xfyun.cn/doc/words/universal_character_recognition/API.html
 * @updateRemark
 * @updateUser
 * @createDate 2022/5/5 18:04
 * @updateDate 2022/5/5 18:04
 **/
@NoArgsConstructor
@Data
@Component
@Slf4j
public class XunFeiOcrUtils {
    public static String getJpgContentByUrl(String imagePath) throws Exception {
        ResponseData respData = XunFeiOcrUtils.imageContrast(imagePath);
        if (respData != null && respData.getPayLoad().getRecognizeDocumentRes() != null) {
            String textBase64 = respData.getPayLoad().getRecognizeDocumentRes().getText();
            //通用文字识别结果(text)base64解码后：
            String text = new String(Base64.getDecoder().decode(textBase64));
            JSONObject jsonObject = JSONObject.parseObject(text);
            String whole_text = jsonObject.getString("whole_text");
            log.info(whole_text);
            return whole_text;
        }
        return "识别失败";
    }
    @Component
    static
    class Property {
        public  static String requestUrl;
        public  static String appid; //请填写控制台获取的APPID,
        public  static String apiSecret;  //请填写控制台获取的APISecret;
        public  static String apiKey;  //请填写控制台获取的APIKey
        //public  static String imagePath1 = "example/NPKSE19841101_01.jpg";  //请填写要检测的图片路径


        @Value("${orc.xunfei.request-url}")
        public  void setRequestUrl(String requestUrl) {
            Property.requestUrl = requestUrl;
        }
        @Value("${orc.xunfei.app-id}")
        public  void setAppid(String appid) {
            Property.appid = appid;
        }
        @Value("${orc.xunfei.api-secret}")
        public  void setApiSecret(String apiSecret) {
            Property.apiSecret = apiSecret;
        }
        @Value("${orc.xunfei.api-key}")
        public  void setApiKey(String apiKey) {
            Property.apiKey = apiKey;
        }
    }

    public static String getXParam(String imageBase641, String imageEncoding1) {
        JsonObject jso = new JsonObject();

        /** header **/
        JsonObject header = new JsonObject();
        header.addProperty("app_id", Property.appid);
        header.addProperty("status", 3);

        jso.add("header", header);

        /** parameter **/
        JsonObject parameter = new JsonObject();
        JsonObject service = new JsonObject();
        //service.addProperty("format_whole_text", 0);//选填，为1：whole_text行合并，为0，不做行合并.默认为0
        //service.addProperty("lang_opt", "zho-s,zho-t,jpn,kor");//选填，默认支持所有语言；识别语言采用ISO 639-3语言缩写标准，语言使用逗号进行拼接，例如lang_opt=zho-s,zho-t,jpn,kor

        JsonObject result = new JsonObject();
        result.addProperty("encoding", "utf8");
        result.addProperty("format", "json");
        result.addProperty("compress", "raw");
        service.add("recognizeDocumentRes", result);

        parameter.add("hh_ocr_recognize_doc", service);
        jso.add("parameter", parameter);

        /** payload **/
        JsonObject payload = new JsonObject();
        JsonObject inputImage1 = new JsonObject();
        inputImage1.addProperty("encoding", imageEncoding1);
        inputImage1.addProperty("status", 3);
        inputImage1.addProperty("image", imageBase641);
        payload.add("image", inputImage1);

        jso.add("payload", payload);
        //System.out.println(jso.toString());
        return jso.toString();
    }

    //读取image
    private static byte[] readImage(String imagePath) throws IOException {
        InputStream is = new FileInputStream(imagePath);
        byte[] imageByteArray1 = FileUtil.read(imagePath);
        //return is.readAllBytes();
        return imageByteArray1;
    }

    public static ResponseData imageContrast(String imageFirstUrl) throws Exception {

        String url = assembleRequestUrl(Property.requestUrl, Property.apiKey, Property.apiSecret);

        String imageBase641 = Base64.getEncoder().encodeToString(readImage(imageFirstUrl));
        String imageEncoding1 = imageFirstUrl.substring(imageFirstUrl.lastIndexOf(".") + 1);

        System.out.println("url:" + url);
        return handleImgContrastRes(url, getXParam(imageBase641, imageEncoding1));
    }

    public static final Gson json = new Gson();

    private static ResponseData handleImgContrastRes(String url, String bodyParam) {

        Map<String, String> headers = new HashMap<>();
        headers.put("Content-type", "application/json");
        String result = HttpUtil.doPost2(url, headers, bodyParam);
        if (result != null) {
            return json.fromJson(result, ResponseData.class);
        } else {
            return null;
        }
    }


    //构建url
    public static String assembleRequestUrl(String requestUrl, String apiKey, String apiSecret) {
        URL url = null;
        // 替换调schema前缀 ，原因是URL库不支持解析包含ws,wss schema的url
        String httpRequestUrl = requestUrl.replace("ws://", "http://").replace("wss://", "https://");
        try {
            url = new URL(httpRequestUrl);
            //获取当前日期并格式化
            SimpleDateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("GMT"));
            String date = format.format(new Date());
            //System.out.println("date:"+date);

            String host = url.getHost();
            StringBuilder builder = new StringBuilder("host: ").append(host).append("\n").//
                    append("date: ").append(date).append("\n").//
                    append("POST ").append(url.getPath()).append(" HTTP/1.1");
            //System.out.println("builder:"+builder);
            Charset charset = Charset.forName("UTF-8");
            Mac mac = Mac.getInstance("hmacsha256");
            SecretKeySpec spec = new SecretKeySpec(apiSecret.getBytes(charset), "hmacsha256");
            mac.init(spec);
            byte[] hexDigits = mac.doFinal(builder.toString().getBytes(charset));
            String sha = Base64.getEncoder().encodeToString(hexDigits);
            //System.out.println("sha:"+sha);

            String authorization = String.format("api_key=\"%s\", algorithm=\"%s\", headers=\"%s\", signature=\"%s\"", apiKey, "hmac-sha256", "host date request-line", sha);
            //System.out.println("authorization:"+authorization);
            String authBase = Base64.getEncoder().encodeToString(authorization.getBytes(charset));
            //System.out.println("authBase:"+authBase);
            return String.format("%s?authorization=%s&host=%s&date=%s", requestUrl, URLEncoder.encode(authBase), URLEncoder.encode(host), URLEncoder.encode(date));

        } catch (Exception e) {
            throw new RuntimeException("assemble requestUrl error:" + e.getMessage());
        }
    }

    public static class ResponseData {
        private Header header;
        private PayLoad payload;

        public Header getHeader() {
            return header;
        }

        public PayLoad getPayLoad() {
            return payload;
        }
    }

    public static class Header {
        private int code;
        private String message;
        private String sid;

        public int getCode() {
            return code;
        }

        public String getMessage() {
            return message;
        }

        public String getSid() {
            return sid;
        }
    }

    public static class PayLoad {
        private IDCardResult recognizeDocumentRes;

        public IDCardResult getRecognizeDocumentRes() {
            return recognizeDocumentRes;
        }

        private ImgResult crop_image;

        public ImgResult getCrop_image() {
            return crop_image;
        }
    }

    public static class IDCardResult {
        private String compress;
        private String encoding;
        private String format;
        private String text;

        public String getCompress() {
            return compress;
        }

        public String getEncoding() {
            return encoding;
        }

        public String getFormat() {
            return format;
        }

        public String getText() {
            return text;
        }
    }

    public static class ImgResult {
        private String encoding;
        private String image;

        public String getEncoding() {
            return encoding;
        }

        public String getImage() {
            return image;
        }
    }
}
