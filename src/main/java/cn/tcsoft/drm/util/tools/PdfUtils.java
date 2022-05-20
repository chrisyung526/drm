package cn.tcsoft.drm.util.tools;

import lombok.extern.slf4j.Slf4j;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.rendering.PDFRenderer;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;

/**
 * @author : hyman
 * create at:  2022/2/25  13:42
 * @description: pdf操作相关
 */
@Slf4j
public class PdfUtils {
    static final int DPI=200;

//    public static void main(String[] args) throws Exception {
//        String src="/Users/hyman/Desktop/图书馆/香港中央图书馆玩具图书馆运行机制及启示研究_黄曼丽.pdf";
//        File file=convertPdfToImage(new File(src),"png",3);
//        //file.delete();
//    }
    /**
     * pdf转图片
     * @param file 源文件地址
     * @param formatName 转换的格式 png|jpg
     * @param no 从0开始
     * @return
     */
    public static File convertPdfToImage(File file,String formatName,Integer no) throws Exception{
        PDDocument doc = PDDocument.load(file);
        int pages=doc.getNumberOfPages();
        log.info(file.getName()+"文档共"+pages+"页");
        if(no>(pages-1)){
            throw new Exception("转换页码超标了");
        }
        PDFRenderer renderer = new PDFRenderer(doc);

        File fileTemp = new File("cover_"+no+"."+formatName); // jpg or png
        BufferedImage image = renderer.renderImageWithDPI(no, DPI);
        // 200 is sample dots per inch.
        ImageIO.write(image, formatName, fileTemp); // JPEG or PNG
        doc.close();
        return fileTemp;
    }

    /**
     * pdf转图片
     * @param inputStream 流
     * @param formatName 图片格式
     * @param no 页码
     * @return
     * @throws Exception
     */
    public static File convertPdfToImage(InputStream inputStream, String formatName, Integer no) throws Exception{
        PDDocument doc = PDDocument.load(inputStream);
        int pages=doc.getNumberOfPages();
        log.info("文档共"+pages+"页");
        if(no>(pages-1)){
            throw new Exception("转换页码超标了");
        }
        PDFRenderer renderer = new PDFRenderer(doc);

        File fileTemp = new File("cover_"+no+"."+formatName); // jpg or png
        BufferedImage image = renderer.renderImageWithDPI(no, DPI);
        // 200 is sample dots per inch.
        ImageIO.write(image, formatName, fileTemp); // JPEG or PNG
        doc.close();
        inputStream.close();
        return fileTemp;
    }


}