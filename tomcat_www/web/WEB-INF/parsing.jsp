<%--https://www.cnblogs.com/code-duck/p/13744888.html  참고 --%>
<%-- https://poi.apache.org/text-extraction.html 참고 --%>
<%--https://jar-download.com/ 참고 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.apache.poi.hwpf.extractor.WordExtractor"%>
<%@ page import="java.io.*" %>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="org.apache.poi.sl.extractor.SlideShowExtractor"%>
<%@ page import="org.apache.poi.hslf.usermodel.HSLFSlideShow" %>
<%@ page import="kr.dogfoot.hwplib.object.HWPFile"%>
<%@ page import="kr.dogfoot.hwplib.reader.HWPReader"%>
<%@ page import="kr.dogfoot.hwplib.tool.textextractor.TextExtractMethod"%>
<%@ page import="kr.dogfoot.hwplib.tool.textextractor.TextExtractOption"%>
<%@ page import="kr.dogfoot.hwplib.tool.textextractor.TextExtractor"%>
<%@ page import="java.awt.*" %>
<%@ page import="org.apache.poi.hslf.usermodel.HSLFSlide" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.awt.geom.Rectangle2D" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.awt.Font" %>
<html>
<!-- head -->
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {background-color: #5f4d93;}
        * {text-align: center;}
        #text {margin: 0 auto; color: white; animation: 1s mark infinite;}
        @keyframes mark {
            to {color: #935d8c;}
        }
        dd {color: white;}
        .spinner-border {
            position: absolute;
            top: 50%;
            left: 48%;
            z-index: 1;
            width: 4em;
            height: 4em;
        }
    </style>
    <script>
        function showLoading(){

            var maskHeight = $(document).height();
            var maskWidth = window.document.body.clientWidth;

            var mask = "<div id='mask' style='position: absolute; z-index: 1000; background-color: #000000; left: 0; top: 0;'></div>";

            $('body')
                .append(mask)

            $('#mask').css({
                'width' : maskWidth,
                'height' : maskHeight,
                'opacity' : '0.3'
            });
            $("#loading").show();
        }
    </script>
</head>
<!-- body -->
<body class="is-preload">
    <div class="spinner-border" role="status" id="loading" onclick="showLoading()">
        <span class="sr-only"></span>
    </div>
    <h1 id="text">Converting...</h1>
</body>
</html>
<%
    String fullFile = "";
    String fileName = "";
    //String saveFolder = "파일경로";
    String saveFolder = application.getRealPath("/filestorage");
    String encType = "EUC-KR";
    int maxSize = 5 * 1024 * 1024;
    try {
        MultipartRequest multi = null;
        multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());

        fileName = multi.getFilesystemName("uploadFile");

        fullFile = saveFolder +"/"+ fileName;

    } catch (IOException ioe) {
        System.out.println(ioe);
    } catch (Exception ex) {
        System.out.println(ex);
    }

    /* 파일 이름 .doc -> .txt 변환 */


    /* 파일 이름 .doc -> .mp3 변환 */
//    String mp3Name = fileName.replace(".doc", ".mp3");
    String mp3Name;
    String txtFile;
    if(fullFile.endsWith(".doc")){
        mp3Name = fileName.replace(".doc", ".mp3");
        txtFile = fileName.replace(".doc", ".txt");
    }else if(fullFile.endsWith(".ppt")){
        mp3Name = fileName.replace(".ppt", ".mp3");
        txtFile = fileName.replace(".ppt", ".txt");
    }else{
        mp3Name = fileName.replace(".hwp", ".mp3");
        txtFile = fileName.replace(".hwp", ".txt");
    }

    /* 저장 Full 경로 */
    /** /home/hw/tomcat_www/web/WEB-INF/filestorage/text1.doc **/
    String src = fullFile;

    /* text 변수 초기화 (doc 파일의 글자 저장) */
    String text = null;
    HSLFSlide[] slide = null;
    try {
        File file = new File(src);

        InputStream is = new FileInputStream(file);
        FileInputStream fis = new FileInputStream(file);

        if(fullFile.endsWith(".doc")){  /************ doc 파일 **********/
            WordExtractor wd = new WordExtractor(is);
            text = wd.getText();
        }else if(fullFile.endsWith(".ppt")){  /************ ppt 파일 **********/
            HSLFSlideShow hs = new HSLFSlideShow(is);
            SlideShowExtractor sd = new SlideShowExtractor(hs);
            text = sd.getText();
            /**************************** PPT -> Image ***************************/
            HSLFSlideShow ppt = new HSLFSlideShow(fis); /**/
            fis.close();

            /* ppt 화면 크기 */
            Dimension pageSize = ppt.getPageSize();
            /* 슬라이드 갯수 메타데이터 */
            slide = ppt.getSlides().toArray(new HSLFSlide[0]);


            for(int i=0; i<slide.length; i++){
                BufferedImage image = new BufferedImage(pageSize.width, pageSize.height, BufferedImage.TYPE_INT_RGB);

                Graphics2D graphics = image.createGraphics();

                Font font = new Font("NanumGothic", Font.PLAIN, 13);
                graphics.setFont(font);


                graphics.setPaint(Color.white); //이미지 영역을 클리어
                graphics.fill(new Rectangle2D.Float(0, 0, pageSize.width, pageSize.height));

                slide[i].draw(graphics);

                File dir = new File("/home/hw/tomcat_www/web/WEB-INF/tempImg/" + "pptCapturedImage");

                FileOutputStream fos = new FileOutputStream(dir + "" + (i+1) + ".png");
                ImageIO.write(image, "png", fos);
            }

        }else if (fullFile.endsWith(".hwp")) {
            HWPFile hwpFile = HWPReader.fromFile(fullFile);
            TextExtractOption option = new TextExtractOption();
            option.setMethod(TextExtractMethod.InsertControlTextBetweenParagraphText);
            option.setWithControlChar(false);
            option.setAppendEndingLF(true);
            text = TextExtractor.extract(hwpFile, option);

        }


        /**** txt 파일 생성 **********************************************************************************/
        File wFile = new File("/home/hw/tomcat_www/web/WEB-INF/creationData/" + txtFile);
        FileWriter fw = new FileWriter(wFile, true);

        /* txt 파일에 글자 쓰기 */
        fw.write(text);
        fw.flush();
        fw.close();
        /***************************************************************************************************/

        }catch (FileNotFoundException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
    String fileType = fullFile.substring(fullFile.length()-4);
%>
<form action="http://49.238.167.72:5000" method="post" id="form">
    <input type="hidden" name="text" value="<% out.print(text); %>">
    <input type="hidden" name="mp3Name" value="<% out.print(mp3Name); %>">
    <input type="hidden" name="fileType" value="<%= fileType %>">
    <%
        if(slide != null){
    %>
        <input type="hidden" name="slideLength" value="<% out.print(slide.length); %>">
    <%
        }else{
    %>
        <input type="hidden" name="slideLength" value="<% out.print("null"); %>">
    <%
        }
    %>
</form>
<script>
    this.document.getElementById("form").submit();
</script>