package com.lab5.inspector.controller;

import com.lab5.inspector.entity.EndInspectdata;
import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.service.EndInspectdataService;
import com.lab5.inspector.service.IngInspectdataService;
import com.lab5.inspector.service.WaitingApartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/data")
public class DataController {

    @Autowired
    private IngInspectdataService ingInspectdataService;
    @Autowired
    private EndInspectdataService endInspectdataService;
    @Autowired
    private WaitingApartService waitingApartService;



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

    @PostMapping("/saveInspectEnd")
    public Integer saveInspectEnd(@RequestBody ArrayList<EndInspectdata> list) {
        return endInspectdataService.save(list);
    }

    @GetMapping("/{waitingApartId}")
    public ResponseEntity<List<IngInspectdata>> getNonEmptyDataByWaitingApartId(@PathVariable Integer waitingApartId) {
        List<IngInspectdata> data = ingInspectdataService.findNonEmptyDataByWaitingApartId(waitingApartId);
        if (data.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(data);
    }
}
