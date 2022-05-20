//package cn.tcsoft.drm.test.test;
//
//import com.alibaba.fastjson.JSON;
//import com.fasterxml.jackson.annotation.JsonProperty;
//import lombok.Data;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.apache.commons.io.FileUtils;
//import org.apache.commons.lang3.time.DurationFormatUtils;
//
//import java.io.File;
//import java.nio.charset.StandardCharsets;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import java.util.List;
//import java.util.UUID;
//
///**
// * @author : hyman
// * create at:  2021/12/31  13:57
// * @description:
// */
//@Slf4j
//public class AssTest {
//    final static String OC="[Script Info]\n" +
//            "ScriptType: v4.00+\n" +
//            "PlayResX: 852\n" +
//            "PlayResY: 480\n" +
//            "WrapStyle: 2\n" +
//            "\n" +
//            "[V4+ Styles]\n" +
//            "Format: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding\n" +
//            "Style: Original,FandolHei,37,&Hffffff,&Hffffffff,&Hntrepansra,&H000000,0,0,0,0,100,100,0.0,0,0,0,1,2,10,10,10,0\n" +
//            "\n" +
//            "[Events]\n" +
//            "Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text\n";
//    @Data
//    static class TextContent{
//        Long bg;
//        Long ed;
//        @JsonProperty("onebest")
//        String oneBest;
//        Integer speaker;
//    }
//    @SneakyThrows
//    public static void main(String[] args) {
//        String s="[{\"bg\":\"0\",\"ed\":\"2200\",\"onebest\":\"嗯\",\"speaker\":\"0\"},{\"bg\":\"4220\",\"ed\":\"12240\",\"onebest\":\"有的有些有个有用水生的水花生，\",\"speaker\":\"0\"},{\"bg\":\"12910\",\"ed\":\"21270\",\"onebest\":\"他一套要工作，呀对梦想在风速在问号安了，\",\"speaker\":\"0\"},{\"bg\":\"22610\",\"ed\":\"31250\",\"onebest\":\"我真没水，水给人老，水晶吧听呀我发抖嗯。\",\"speaker\":\"0\"},{\"bg\":\"31880\",\"ed\":\"38860\",\"onebest\":\"没听吗哈在呀吗清水吗就会心声。\",\"speaker\":\"0\"},{\"bg\":\"38860\",\"ed\":\"44740\",\"onebest\":\"小风黑洞才不计，吧\",\"speaker\":\"0\"},{\"bg\":\"44960\",\"ed\":\"52610\",\"onebest\":\"只要坚强的你多心还好，可以看很多。\",\"speaker\":\"0\"},{\"bg\":\"52610\",\"ed\":\"59110\",\"onebest\":\"嗯云涛在高速接受，\",\"speaker\":\"0\"},{\"bg\":\"59350\",\"ed\":\"66280\",\"onebest\":\"原来身边有内定一行和一号北京平手，\",\"speaker\":\"0\"},{\"bg\":\"66280\",\"ed\":\"72560\",\"onebest\":\"你好像是用头最后走走走，你自己的\",\"speaker\":\"0\"},{\"bg\":\"72840\",\"ed\":\"84350\",\"onebest\":\"曾经轻生过大水大水都好，一黑朦\",\"speaker\":\"0\"},{\"bg\":\"84350\",\"ed\":\"102220\",\"onebest\":\"嗯关关关唉唉到了到了而且是你在当马娟过\",\"speaker\":\"0\"},{\"bg\":\"102840\",\"ed\":\"109800\",\"onebest\":\"回过去吧前面高领头啊嗯啊中国不想变更啊不急，啊于是我先买本，\",\"speaker\":\"0\"},{\"bg\":\"109870\",\"ed\":\"130880\",\"onebest\":\"准备一些我们全国百人高中到马来宾，后来我给了大哥哥们，\",\"speaker\":\"0\"},{\"bg\":\"131240\",\"ed\":\"138540\",\"onebest\":\"所以呢大家都在刚去了，那个来宾呢都有几块，一块工行挺好的，那个系统会更新，\",\"speaker\":\"0\"},{\"bg\":\"138590\",\"ed\":\"150230\",\"onebest\":\"听好听好了，唉这还码头，这还有贵州马龙马马全是那个叫人家不给你找，送达就给弄是给了还还要不行，那么的打听就是一个\",\"speaker\":\"0\"},{\"bg\":\"150230\",\"ed\":\"161730\",\"onebest\":\"陈云梅呢还忙了，唉听到成功带可能也是手机不都是给以前了，京东一说行，现在在进门前口出头，语音的语嘛什么是云，所以云和规模特别重点要高，\",\"speaker\":\"0\"},{\"bg\":\"161730\",\"ed\":\"168150\",\"onebest\":\"工会委不认为就是在改革的庭审才动了，你会等一块呢还非常受不上，呀\",\"speaker\":\"0\"},{\"bg\":\"168490\",\"ed\":\"172160\",\"onebest\":\"你看看大爷，并且要磨合了这个哈，\",\"speaker\":\"0\"},{\"bg\":\"172840\",\"ed\":\"179970\",\"onebest\":\"刚才你刚刚搞一下统听讨论了，要挂了再记一下，再接着等可以现在接着要用那个三米啊300天。\",\"speaker\":\"0\"}]\n";
//
//        List<TextContent> contentList= JSON.parseArray(s, TextContent.class);
//        //log.info(OC);
//        StringBuilder fileContent=new StringBuilder(OC);
//        contentList.forEach(po->{
//            String start=DurationFormatUtils.formatDuration(po.getBg(),"HH:mm:ss.SS");
//            String end=DurationFormatUtils.formatDuration(po.getEd(),"HH:mm:ss.SS");
//            fileContent.append("Dialogue: 3,"+ start.substring(0,start.length()-1)+","+end.substring(0,end.length()-1)+",Original,,31,31,31,,"+po.getOneBest()).append("\n");
//        });
//        //FileUtils.writeStringToFile(new File(UUID.randomUUID().toString().replace("-","")+".ass"), fileContent.toString());
//        Files.write(Paths.get(UUID.randomUUID().toString().replace("-","")+".ass"),fileContent.toString().getBytes(StandardCharsets.UTF_8));
//        //log.error(JSON.toJSONString(contentList));
//    }
//}