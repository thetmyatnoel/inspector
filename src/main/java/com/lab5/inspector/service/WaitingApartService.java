package com.lab5.inspector.service;


import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WaitingApartService {

    @Autowired
    private WaitingApartRepository waitingApartRepository;

    public List<WaitingApart> getApartmentsByStatus(String status) {
        return waitingApartRepository.findByStatus(status);
    }


    /*public List<WaitingApart> getWaitingApartments() {
        return getApartmentsByStatus("pending");
    }

    // And get apartments with status "progress"
    public List<WaitingApart> getProgressApartments() {
        return getApartmentsByStatus("progress");
    }
    public List<WaitingApart> getCompleteApartments() {
        return getApartmentsByStatus("complete");
    }*/


    @Transactional
    public boolean updateStatus(Integer id, String status) {
        WaitingApart waitingApart = waitingApartRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Entity not found"));
        waitingApart.setStatus(status);
        waitingApartRepository.save(waitingApart);
        return true;
    }


}
