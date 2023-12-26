package com.lab5.inspector.service;

import com.lab5.inspector.entity.UpdatedApart;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.IngInspectdataRepository;
import com.lab5.inspector.repository.UpdatedApartRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
public class UpdatedApartService {
    @Autowired
    private UpdatedApartRepository updatedApartRepository;

    @Autowired
    private WaitingApartRepository waitingApartRepository;

    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;

    @Transactional
    public Integer updateAndCleanData(ArrayList<UpdatedApart> list) {
        Integer result = 0;
        try {
            for (UpdatedApart updatedApart : list) {
                Integer waitingApartId = updatedApart.getWaitingApart().getId(); // Assuming you have a getter for ID
                if (waitingApartId != null) {
                    WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                            .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                    updatedApart.setWaitingApart(waitingApart);
                    ingInspectdataRepository.deleteByWaitingApartId(waitingApartId);
                }
            }
            result = updatedApartRepository.saveAll(list).size();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    return  result;

    }
}




