package com.lab5.inspector.service;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.layout.font.FontProvider;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.charset.StandardCharsets;

@Service
public class PdfGenerationService {

    /*public byte[] generatePdfFromHtml(String html) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            HtmlConverter.convertToPdf(new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)), outputStream);
            return outputStream.toByteArray();
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);

        }
    }*/
    public byte[] generatePdfFromHtml(String html) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            ConverterProperties properties = new ConverterProperties();

            FontProvider fontProvider = new DefaultFontProvider(false, false, false);
            String[] fontFiles = {
                    "NotoSansKR-Black.ttf",
                    "NotoSansKR-Bold.ttf",
                    "NotoSansKR-ExtraBold.ttf",
                    "NotoSansKR-ExtraLight.ttf",
                    "NotoSansKR-Light.ttf",
                    "NotoSansKR-Medium.ttf",
                    "NotoSansKR-Regular.ttf",
                    "NotoSansKR-SemiBold.ttf",
                    "NotoSansKR-Thin.ttf"
            };
            for (String fontFileName : fontFiles) {
                File fontFile = new ClassPathResource("fonts/" + fontFileName).getFile();
                fontProvider.addFont(FontProgramFactory.createFont(fontFile.getAbsolutePath()));
            }
            properties.setFontProvider(fontProvider);

            HtmlConverter.convertToPdf(new ByteArrayInputStream(html.getBytes(StandardCharsets.UTF_8)), outputStream, properties);
            return outputStream.toByteArray();
        } catch (Exception e) {
            throw new RuntimeException("Error generating PDF", e);
        }
    }
}

