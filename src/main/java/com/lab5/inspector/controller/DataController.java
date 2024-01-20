package com.lab5.inspector.controller;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.UpdatedApart;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.service.*;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;

@Slf4j
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/data")
public class DataController {

    @Autowired
    private IngInspectdataService ingInspectdataService;

    @Autowired
    private WaitingApartService waitingApartService;
    @Autowired
    private UpdatedApartService updatedApartService;
    @Autowired
    private Configuration configuration;
    @Autowired
    private PdfGenerationService pdfGenerationService;
    @Autowired
    private ReportService reportService;




    @PostMapping("/updateStatus")
    public ResponseEntity<?> updateStatus(@RequestBody WaitingApart waitingApart) {
        try {
            boolean success = waitingApartService.updateStatus(waitingApart.getId(), waitingApart.getStatus());
            if (success) {
                return ResponseEntity.ok("Status updated successfully");
            } else {
                return ResponseEntity.badRequest().body("Failed to update status");
            }
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error updating status: " + e.getMessage());
        }
    }

    @PostMapping("/saveInspectIng")
    public ResponseEntity<?> saveInspectData(@RequestBody ArrayList<IngInspectdata> dataList) {

        try {
            ingInspectdataService.processAndSaveData(dataList);
            return ResponseEntity.ok("Data saved successfully" + dataList);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error saving data: " + e.getMessage());
        }
    }
    @PostMapping("/moveAndDeleteData/{waitingApartId}")
    public ResponseEntity<?> moveAndDeleteData(@PathVariable Integer waitingApartId) {
        try {
            updatedApartService.moveAndDeleteData(waitingApartId);
            return ResponseEntity.ok("Data moved and deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }

    @PostMapping("/updateApart")
    public ResponseEntity<?> updateApart(@RequestBody ArrayList<UpdatedApart> dataList) {

        try {
            updatedApartService.updateAndCleanData(dataList);
            return ResponseEntity.ok("Data updated successfully");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Error saving data: " + e.getMessage());
        }
    }
   /* @PostMapping("/updateApart")
    public Integer updateApart(@RequestBody ArrayList<UpdatedApart> list) {
        return updatedApartService.updateAndCleanData(list);
    }*/


    @GetMapping("/{waitingApartId}")
    public ResponseEntity<List<IngInspectdata>> getNonEmptyDataByWaitingApartId(@PathVariable Integer waitingApartId) {
        List<IngInspectdata> data = ingInspectdataService.findNonEmptyDataByWaitingApartId(waitingApartId);
        if (data.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(data);
    }
    @PostMapping("/deleteData/{waitingApartId}")
    public ResponseEntity<?> deleteData(@PathVariable Integer waitingApartId, @RequestBody Map<String, String> compareData) {

        boolean success = ingInspectdataService.deleteData(waitingApartId, compareData);

        if (success) {
            return ResponseEntity.ok(Map.of("success", true, "message", "Data deleted successfully."));
        } else {
            return ResponseEntity.status(404).body(Map.of("success", false, "message", "Matching data not found or deletion failed."));
        }
    }

    @GetMapping("/generateReport/{waitingApartId}")
    /*public String generateReport(@RequestParam("waitingApartId") Integer waitingApartId, Model model) {
        List<UpdatedApart> updatedAparts = updatedApartService.getUpdatedApartsByWaitingApartId(waitingApartId);
        model.addAttribute("updatedAparts", updatedAparts);
        return "reportTemplate"; // Name of your FreeMarker template
    }*/
    public void generatePdfReport(@PathVariable("waitingApartId") Integer apartId, HttpServletResponse response) throws IOException, TemplateException {

        List<UpdatedApart> updatedAparts = updatedApartService.getUpdatedApartsByWaitingApartId(apartId);
        WaitingApart waitingApart = waitingApartService.getWaitingApartById(apartId);
        for (UpdatedApart updatedApart : updatedAparts) {
            if (updatedApart.getFinalImage1() != null) {
                String image1Base64 = Base64.getEncoder().encodeToString(updatedApart.getFinalImage1());
                updatedApart.setFinalImage1Base64(image1Base64);
            }
            if (updatedApart.getFinalImage2() != null) {
                String image2Base64 = Base64.getEncoder().encodeToString(updatedApart.getFinalImage2());
                updatedApart.setFinalImage2Base64(image2Base64);
            }
        }
        Map<String, Object> model = new HashMap<>();
        model.put("waitingApart", waitingApart);
        System.out.println("WaitingApart: " + waitingApart);
        model.put("updatedAparts", updatedAparts);

        Template template = configuration.getTemplate("reportTemplate.ftl");
        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template,model);

        byte[] pdfContent = pdfGenerationService.generatePdfFromHtml(html);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=report.pdf");

        response.getOutputStream().write(pdfContent);
        response.getOutputStream().flush();
    }
    @PostMapping("/uploadReport")
    public ResponseEntity<?> uploadReport(@RequestParam("file") MultipartFile file,
                                          @RequestParam("apartId") Integer apartId) {
        try {
            reportService.saveReport(file, apartId);
            return ResponseEntity.ok("Report uploaded successfully.");
        } catch (Exception e) {
            log.error("Error uploading report: ", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading report: " + e.getMessage());
        }
    }

    @GetMapping("/reports/{username}")
    public ResponseEntity<List<WaitingApart>> getFinalApartments(@PathVariable String username) {
        List<WaitingApart> finalAparts = waitingApartService.getFinalApartmentsByUsername(username);
        return ResponseEntity.ok(finalAparts);
    }



}
