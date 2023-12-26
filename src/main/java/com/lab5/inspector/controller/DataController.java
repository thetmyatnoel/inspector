package com.lab5.inspector.controller;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.UpdatedApart;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.service.IngInspectdataService;
import com.lab5.inspector.service.UpdatedApartService;
import com.lab5.inspector.service.WaitingApartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public Integer saveInspectIng(@RequestBody ArrayList<IngInspectdata> list) {
        return ingInspectdataService.save(list);
    }
    @PostMapping("/updateApart")
    public Integer updateApart(@RequestBody ArrayList<UpdatedApart> list) {
        return updatedApartService.updateAndCleanData(list);
    }


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


}
