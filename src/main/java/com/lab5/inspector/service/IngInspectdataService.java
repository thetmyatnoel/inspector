package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.repository.IngInspectdataRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@Slf4j
public class IngInspectdataService {
    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;

    /**
     *
     * @param list
     * @return
     */
    public Integer save(ArrayList<IngInspectdata> list){
        Integer result = 0;
        try {
            result = ingInspectdataRepository.saveAll(list).size();
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return result;
    }
}
