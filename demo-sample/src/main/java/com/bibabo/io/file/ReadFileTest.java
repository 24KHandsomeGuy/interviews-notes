package com.bibabo.io.file;

import com.alibaba.fastjson.JSONObject;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author FuKuiXiang
 * @version 1.0.0
 * @date 2024/3/20 15:40
 * @Description gif 图片是否可以正常读取
 */
public class ReadFileTest {

    public final static Map<String, String> FILE_TYPE_MAP = new HashMap<>();

    static {
        getAllFileType();  //初始化文件类型信息
    }

    private static void getAllFileType() {
        FILE_TYPE_MAP.put("jpg", "FFD8FF"); //JPEG (jpg)
        FILE_TYPE_MAP.put("png", "89504E47");  //PNG (png)
        FILE_TYPE_MAP.put("gif", "47494638");  //GIF (gif)
        FILE_TYPE_MAP.put("tif", "49492A00");  //TIFF (tif)
        FILE_TYPE_MAP.put("bmp", "424D"); //Windows Bitmap (bmp)
        FILE_TYPE_MAP.put("dwg", "41433130"); //CAD (dwg)
        FILE_TYPE_MAP.put("html", "68746D6C3E");  //HTML (html)
        FILE_TYPE_MAP.put("rtf", "7B5C727466");  //Rich Text Format (rtf)
        FILE_TYPE_MAP.put("xml", "3C3F786D6C");
        FILE_TYPE_MAP.put("zip", "504B0304");
        FILE_TYPE_MAP.put("rar", "52617221");
        FILE_TYPE_MAP.put("psd", "38425053");  //Photoshop (psd)
        FILE_TYPE_MAP.put("eml", "44656C69766572792D646174653A");  //Email [thorough only] (eml)
        FILE_TYPE_MAP.put("dbx", "CFAD12FEC5FD746F");  //Outlook Express (dbx)
        FILE_TYPE_MAP.put("pst", "2142444E");  //Outlook (pst)
        FILE_TYPE_MAP.put("xls", "D0CF11E0");  //MS Word
        FILE_TYPE_MAP.put("doc", "D0CF11E0");  //MS Excel 注意：word 和 excel的文件头一样
        FILE_TYPE_MAP.put("mdb", "5374616E64617264204A");  //MS Access (mdb)
        FILE_TYPE_MAP.put("wpd", "FF575043"); //WordPerfect (wpd)
        FILE_TYPE_MAP.put("eps", "252150532D41646F6265");
        FILE_TYPE_MAP.put("ps", "252150532D41646F6265");
        FILE_TYPE_MAP.put("pdf", "255044462D312E");  //Adobe Acrobat (pdf)
        FILE_TYPE_MAP.put("qdf", "AC9EBD8F");  //Quicken (qdf)
        FILE_TYPE_MAP.put("pwl", "E3828596");  //Windows Password (pwl)
        FILE_TYPE_MAP.put("wav", "57415645");  //Wave (wav)
        FILE_TYPE_MAP.put("avi", "41564920");
        FILE_TYPE_MAP.put("ram", "2E7261FD");  //Real Audio (ram)
        FILE_TYPE_MAP.put("rm", "2E524D46");  //Real Media (rm)
        FILE_TYPE_MAP.put("mpg", "000001BA");  //
        FILE_TYPE_MAP.put("mov", "6D6F6F76");  //Quicktime (mov)
        FILE_TYPE_MAP.put("asf", "3026B2758E66CF11"); //Windows Media (asf)
        FILE_TYPE_MAP.put("mid", "4D546864");  //MIDI (mid)
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        File file = new File("/Users/fukuixiang/Downloads/2024032001.gif");
        FileInputStream inputStream = new FileInputStream(file);
        /*byte[] bytes = new byte[inputStream.available()];
        int result = inputStream.read(bytes);*/

        /*File writeFile = new File("/Users/fukuixiang/Downloads/2024032003.gif");
        FileOutputStream fos = new FileOutputStream(writeFile);
        fos.write(bytes);
        fos.flush();
        fos.close();*/

        // System.out.println(getImageWidth(bytes));
        System.out.println(getImageWidth(inputStream));
    }

    public static int getImageWidth(InputStream inputStream) {
        BufferedImage bufreader;
        try {
            bufreader = ImageIO.read(inputStream);
            System.out.println("getImageWidth 222");
            return bufreader.getWidth();
        } catch (IOException e) {
            System.out.println("getImageWidth e:" + e.getMessage());
            return 0;
        } finally {
            System.out.println("getImageWidth 333");
        }
    }

    public static int getImageWidth(byte[] imageByte) {
        if (imageByte == null) {
            return 0;
        }
        BufferedImage bufreader;
        try {
            ByteArrayInputStream arrayInputStream = new ByteArrayInputStream(imageByte);
            System.out.println("getImageWidth 111");
            bufreader = ImageIO.read(arrayInputStream);
            System.out.println("getImageWidth 222");
            return bufreader.getWidth();
        } catch (IOException e) {
            System.out.println("getImageWidth e:" + e.getMessage());
            return 0;
        } finally {
            System.out.println("getImageWidth 333");
        }

    }

    public static String getFileTypeByStream(byte[] b) {
        String filetypeHex = String.valueOf(getFileHexString(b));
        for (Map.Entry<String, String> entry : FILE_TYPE_MAP.entrySet()) {
            String fileTypeHexValue = entry.getValue();
            if (filetypeHex.toUpperCase().startsWith(fileTypeHexValue)) {
                return entry.getKey();
            }
        }
        return null;
    }

    public static String getFileHexString(byte[] b) {
        StringBuilder stringBuilder = new StringBuilder();
        if (b == null || b.length <= 0) {
            return null;
        }
        for (byte value : b) {
            int v = value & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }
}
