package com.eMotion.team.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileController {

    @Value("${file.upload.path}")
    private String CURR_IMAGE_PATH;

    @Value("${file.download.path}")
    private String WEB_PATH;

    // 파일 다운로드 메서드
    @RequestMapping("/download")
    public void download(String imageFileName, HttpServletResponse response) throws IOException {
        OutputStream out = response.getOutputStream();
        String downloadFile = CURR_IMAGE_PATH + File.separator + imageFileName;
        File file = new File(downloadFile);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        String encodedFileName = URLEncoder.encode(imageFileName, StandardCharsets.UTF_8.name()).replace("+", "%20");
        String contentDisposition = "attachment; filename*=UTF-8''" + encodedFileName;

        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Content-Disposition", contentDisposition);
        response.setContentLengthLong(file.length());

        try (FileInputStream in = new FileInputStream(file)) {
            byte[] buffer = new byte[1024 * 8];
            int count;
            while ((count = in.read(buffer)) != -1) {
                out.write(buffer, 0, count);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // 멀티 이미지 업로드 메서드
    @RequestMapping("/multiImgUpload")
    public void multiImgUpload(HttpServletRequest req, HttpServletResponse res) {
        try {
            String sFileInfo = "";
            String fileName = req.getHeader("file-name");
            String prefix = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            String path = CURR_IMAGE_PATH;

            File dir = new File(path);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String realName = UUID.randomUUID().toString() + "." + prefix;
            try (InputStream is = req.getInputStream();
                 OutputStream os = new FileOutputStream(new File(path + File.separator + realName))) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
            }

            sFileInfo += "&bNewLine=true";
            sFileInfo += "&sFileName=" + fileName;
            sFileInfo += "&sFileURL=" + WEB_PATH + realName;

            PrintWriter print = res.getWriter();
            print.print(sFileInfo);
            print.flush();
            print.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
