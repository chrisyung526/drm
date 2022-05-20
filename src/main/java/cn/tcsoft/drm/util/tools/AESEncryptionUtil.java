package cn.tcsoft.drm.util.tools;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.security.SecureRandom;

public class AESEncryptionUtil {

    // 偏移量
    public static final String VIPARA = "L+\\\\~f4,Ir)b$=pkf"; // AES 为16bytes. DES 为8bytes

    // 编码方式
    public static final String CODE_TYPE = "UTF-8";
    // public static final String CODE_TYPE = "GBK";

    // 填充类型
    public static final String AES_TYPE = "AES/ECB/PKCS5Padding";
    // public static final String AES_TYPE = "AES/ECB/PKCS7Padding";
    // 此类型 加密内容,密钥必须为16字节的倍数位,否则抛异常,需要字节补全再进行加密
    // public static final String AES_TYPE = "AES/ECB/NoPadding";
    // java 不支持ZeroPadding
    // public static final String AES_TYPE = "AES/CBC/ZeroPadding";

    // 私钥 (图创流媒体服务)
    private static final String AES_KEY = "dbeb0d1ff0997445d562d851bfce1af6"; // AES固定格式为128/192/256
    // bits.即：16/24/32bytes。DES固定格式为128bits，即8bytes。

    // 字符补全
    private static final String[] consult = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B",
            "C", "D", "E", "F", "G" };

    /**
     * 加密
     *
     * @param cleartext
     * @return
     */
    public static String encrypt(String cleartext) {
        // 加密方式： AES128(CBC/PKCS5Padding) + Base64, 私钥：1111222233334444
        try {
            IvParameterSpec zeroIv = new IvParameterSpec(VIPARA.getBytes());
            // 两个参数，第一个为私钥字节数组， 第二个为加密方式 AES或者DES
            SecretKeySpec key = new SecretKeySpec(AES_KEY.getBytes(), "AES");
            // 实例化加密类，参数为加密方式，要写全
            Cipher cipher = Cipher.getInstance(AES_TYPE); // PKCS5Padding比PKCS7Padding效率高，PKCS7Padding可支持IOS加解密
            // 初始化，此方法可以采用三种方式，按加密算法要求来添加。（1）无第三个参数（2）第三个参数为SecureRandom random = new
            // SecureRandom();中random对象，随机数。(AES不可采用这种方法)（3）采用此代码中的IVParameterSpec
            // 加密时使用:ENCRYPT_MODE; 解密时使用:DECRYPT_MODE;
            cipher.init(Cipher.ENCRYPT_MODE, key); // CBC类型的可以在第三个参数传递偏移量zeroIv,ECB没有偏移量
            // 加密操作,返回加密后的字节数组，然后需要编码。主要编解码方式有Base64, HEX, UUE,7bit等等。此处看服务器需要什么编码方式
            byte[] encryptedData = cipher.doFinal(cleartext.getBytes(CODE_TYPE));
            Base64.Encoder encoder = Base64.getEncoder();
            return encoder.encodeToString(encryptedData);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 解密
     *
     * @param encrypted
     * @return
     */
    public static String decrypt(String encrypted) {
        try {
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] byteMi =decoder.decode(encrypted);
            IvParameterSpec zeroIv = new IvParameterSpec(VIPARA.getBytes());
            SecretKeySpec key = new SecretKeySpec(AES_KEY.getBytes(), "AES");
            Cipher cipher = Cipher.getInstance(AES_TYPE);
            // 与加密时不同MODE:Cipher.DECRYPT_MODE
            cipher.init(Cipher.DECRYPT_MODE, key); // CBC类型的可以在第三个参数传递偏移量zeroIv,ECB没有偏移量
            byte[] decryptedData = cipher.doFinal(byteMi);
            return new String(decryptedData, CODE_TYPE);
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /**
     * 测试
     *
     * @param args
     * @throws Exception
     */
//    public static void main(String[] args) throws Exception {
//        //System.out.println(getKeyByPass("图创流媒体服务"));
//        //String content = "";
//       // test(content);
//    }

    public static void test(String content) throws UnsupportedEncodingException {
        System.out.println("加密内容：" + content);
        // 字节数
        int num = content.getBytes(CODE_TYPE).length;
        System.out.println("加密内容字节数: " + num);
        System.out.println("加密内容是否16倍数: " + (num % 16 == 0 ? true : false));

        // 字节补全
        if ("AES/ECB/NoPadding".equals(AES_TYPE)) {
            System.out.println();
            content = completionCodeFor16Bytes(content);
            System.out.println("加密内容补全后: " + content);
        }

        System.out.println();

        // 加密
        String encryptResult = encrypt(content);
        content = new String(encryptResult);
        System.out.println("加密后：" + content);

        System.out.println();

        // 解密
        String decryptResult = decrypt(encryptResult);
        content = new String(decryptResult);
        // 还原
        if ("AES/ECB/NoPadding".equals(AES_TYPE)) {
            System.out.println("解密内容还原前: " + content);
            content = resumeCodeOf16Bytes(content);
        }

        System.out.println("解密完成后：" + content);
    }

    // NoPadding
    // 补全字符
    public static String completionCodeFor16Bytes(String str) throws UnsupportedEncodingException {
        int num = str.getBytes(CODE_TYPE).length;
        int index = num % 16;
        // 进行加密内容补全操作, 加密内容应该为 16字节的倍数, 当不足16*n字节是进行补全, 差一位时 补全16+1位
        // 补全字符 以 $ 开始,$后一位代表$后补全字符位数,之后全部以0进行补全;
        if (index != 0) {
            StringBuffer sbBuffer = new StringBuffer(str);
            if (16 - index == 1) {
                sbBuffer.append("$" + consult[16 - 1] + addStr(16 - 1 - 1));
            } else {
                sbBuffer.append("$" + consult[16 - index - 1] + addStr(16 - index - 1 - 1));
            }
            str = sbBuffer.toString();
        }
        return str;
    }

    // 追加字符
    public static String addStr(int num) {
        StringBuffer sbBuffer = new StringBuffer("");
        for (int i = 0; i < num; i++) {
            sbBuffer.append("0");
        }
        return sbBuffer.toString();
    }

    // 还原字符(进行字符判断)
    public static String resumeCodeOf16Bytes(String str) {
        int indexOf = str.lastIndexOf("$");
        if (indexOf == -1) {
            return str;
        }
        String trim = str.substring(indexOf + 1, indexOf + 2).trim();
        int num = 0;
        for (int i = 0; i < consult.length; i++) {
            if (trim.equals(consult[i])) {
                num = i;
            }
        }
        if (num == 0) {
            return str;
        }
        return str.substring(0, indexOf).trim();
    }

    /*
     * 描述：随机生成秘钥
     * @Date 12:24 2021/7/22
     * @param
     * @return java.lang.String
     **/
    public static String getKey() {

        String key = "";

        try {
            KeyGenerator kg = KeyGenerator.getInstance("AES");

            kg.init(128);

            //要生成多少位，只需要修改这里即可128, 192或256
            SecretKey sk = kg.generateKey();

            byte[] b = sk.getEncoded();

            key = byteToHexString(b);
        }
        catch (NoSuchAlgorithmException e) {

            System.out.println("没有此算法:"+e);
        }
        return key;
    }
    /*
     * 描述：使用指定的字符串生成秘钥
     * @Date 12:24 2021/7/22
     * @param password
     * @return java.lang.String
     **/
    public static String getKeyByPass(String password) {

        String key = "";

        try {
            KeyGenerator kg = KeyGenerator.getInstance("AES");

            //要生成多少位，只需要修改这里即可128, 192或256
            //SecureRandom是生成安全随机数序列，password.getBytes()是种子，只要种子相同，序列就一样，所以生成的秘钥就一样。
            kg.init(128, new SecureRandom(password.getBytes()));

            SecretKey sk = kg.generateKey();

            byte[] b = sk.getEncoded();

            key = byteToHexString(b);
        }
        catch (NoSuchAlgorithmException e) {
            System.out.println("没有此算法:"+e);
        }
        return key;
    }
    /*
     * 描述：byte数组转化为16进制字符串
     * @Date 12:25 2021/7/22
     * @param bytes
     * @return java.lang.String
     **/
    public static String byteToHexString(byte[] bytes) {

        StringBuffer sb = new StringBuffer();

        for (int i = 0; i < bytes.length; i++) {

            String strHex=Integer.toHexString(bytes[i]);

            if(strHex.length() > 3) {

                sb.append(strHex.substring(6));
            } else {

                if(strHex.length() < 2) {

                    sb.append("0" + strHex);
                } else {

                    sb.append(strHex);
                }
            }
        }
        return sb.toString();
    }


}
