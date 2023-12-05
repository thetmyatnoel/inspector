package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.repository.IngInspectdataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class IngInspectdataService {
    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;
    public void saveIngInspectdata(IngInspectdata ingInspectdata)
    {
        ingInspectdataRepository.save(ingInspectdata);
    }
}
