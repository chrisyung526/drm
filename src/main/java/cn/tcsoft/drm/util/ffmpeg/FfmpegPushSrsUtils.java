package cn.tcsoft.drm.util.ffmpeg;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Objects;

/**
 * ffmpeg 推流到Srs
 */
public class FfmpegPushSrsUtils {
    private static String SRS_SERVICE_URL="rtmp://10.10.6.58:1935/live/";
    public static void pushSrs(String filePath,String livestreamName) throws IOException, InterruptedException {
        String command="ffmpeg -re -i "+filePath+" -c copy -f flv -y "+SRS_SERVICE_URL+livestreamName;
        System.out.println(command);
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec(command);
        InputStream stderr = proc.getErrorStream();
        InputStreamReader isr = new InputStreamReader(stderr);
        BufferedReader br = new BufferedReader(isr);
        StringBuilder sb=new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            sb.append(line);
        }
        if(Objects.nonNull(sb.toString())){
            System.out.println(sb.toString());
        }
        int exitVal = proc.waitFor();
        stderr.close();
        isr.close();
        br.close();
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        FfmpegPushSrsUtils.pushSrs("D://video/meeting_01.mp4","meting");
    }
}
