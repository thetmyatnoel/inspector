package com.lab5.inspector.service;


import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.WaitingApartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WaitingApartService {

    @Autowired
    private WaitingApartRepository waitingApartRepository;

    public List<WaitingApart> findAllWaitingAparts() {
        return waitingApartRepository.findAll();
    }

    // Additional business logic can be added here
}
