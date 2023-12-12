package com.lab5.inspector.repository;

import com.lab5.inspector.entity.IngInspectdata;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IngInspectdataRepository extends JpaRepository<IngInspectdata, Integer> {
    List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId );
}
