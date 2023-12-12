package com.lab5.inspector.service;

import com.lab5.inspector.entity.EndInspectdata;
import com.lab5.inspector.repository.EndInspectDataRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@Slf4j
public class EndInspectdataService {
   @Autowired
   private EndInspectDataRepository endInspectDataRepository;

    /**
     *
     * @param list
     * @return
     */
    public Integer save(ArrayList<EndInspectdata> list){
        Integer result = 0;
        try {
            result = endInspectDataRepository.saveAll(list).size();
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return result;
    }
}
