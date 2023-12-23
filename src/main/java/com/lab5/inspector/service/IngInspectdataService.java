package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.IngInspectdataRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class IngInspectdataService {
    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;
    @Autowired
    private WaitingApartRepository waitingApartRepository;

    /**
     *
     * @param list
     * @return
     */
    public Integer save(ArrayList<IngInspectdata> list){
        Integer result = 0;
        try {
            for (IngInspectdata ingInspectdata : list) {
                Integer waitingApartId = ingInspectdata.getWaitingApart().getId(); // Assuming you have a getter for ID
                if (waitingApartId != null) {
                    WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                            .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                    ingInspectdata.setWaitingApart(waitingApart);
                }
            }
            result = ingInspectdataRepository.saveAll(list).size();
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return result;
    }
    public List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId)
    {
        return ingInspectdataRepository.findNonEmptyDataByWaitingApartId(waitingApartId);
    }

}
