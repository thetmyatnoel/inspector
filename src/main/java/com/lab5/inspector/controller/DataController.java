package com.lab5.inspector.controller;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.service.IngInspectdataService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

/**
 * packageName : com.lab5.inspector.controller
 * fileName : DataController
 * author : goodhyoju
 * date : 12/7/23 8:48 AM
 * description :
 */
@Slf4j
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/data")
public class DataController {

    @Autowired
    private IngInspectdataService ingInspectdataService;

    /**
     *
     * @param list
     * @return
     */
    @PostMapping("/saveInspect")
    public Integer saveInventory(@RequestBody ArrayList<IngInspectdata> list) {
        return ingInspectdataService.save(list);
    }
}
