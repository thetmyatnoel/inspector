package com.lab5.inspector.service;


import com.lab5.inspector.entity.LoginInspector;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.LoginInspectorRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class WaitingApartService {

    @Autowired
    private WaitingApartRepository waitingApartRepository;
    @Autowired
    private LoginInspectorRepository loginInspectorRepository;

    public List<WaitingApart> getApartmentsByStatus(String status) {
        return waitingApartRepository.findByStatus(status);
    }
    public List<WaitingApart> getProgressApartmentsByUsername(String username) {
        LoginInspector inspector = loginInspectorRepository.findByUsername(username);
        if (inspector != null) {
            return waitingApartRepository.findByStatusAndLoginInspector_Id("progress", inspector.getId());
        }
        return new ArrayList<>(); // Return an empty list if the inspector is not found
    }
    public List<WaitingApart> getPendingApartmentsByUsername(String username) {
        LoginInspector inspector = loginInspectorRepository.findByUsername(username);
        if (inspector != null) {
            return waitingApartRepository.findByStatusAndLoginInspector_Id("pending", inspector.getId());
        }
        return new ArrayList<>(); // Return an empty list if the inspector is not found
    }
    public List<WaitingApart> getCompleteApartmentsByUsername(String username) {
        LoginInspector inspector = loginInspectorRepository.findByUsername(username);
        if (inspector != null) {
            return waitingApartRepository.findByStatusAndLoginInspector_Id("complete", inspector.getId());
        }
        return new ArrayList<>(); // Return an empty list if the inspector is not found
    }
    public List<WaitingApart> getFinalApartmentsByUsername(String username) {
        LoginInspector inspector = loginInspectorRepository.findByUsername(username);
        if (inspector != null) {
            return waitingApartRepository.findByStatusAndLoginInspector_Id("final", inspector.getId());
        }
        return new ArrayList<>(); // Return an empty list if the inspector is not found
    }

    public WaitingApart getWaitingApartById(Integer id) {
        return waitingApartRepository.findById(id).orElse(null);
    }

    @Transactional
    public boolean updateStatus(Integer id, String status) {
        WaitingApart waitingApart = waitingApartRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Entity not found"));
        waitingApart.setStatus(status);
        waitingApartRepository.save(waitingApart);
        return true;
    }


}
