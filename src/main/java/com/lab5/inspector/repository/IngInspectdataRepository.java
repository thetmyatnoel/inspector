package com.lab5.inspector.repository;

import com.lab5.inspector.entity.IngInspectdata;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IngInspectdataRepository extends JpaRepository<IngInspectdata, Integer> {
    List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId );

    List<IngInspectdata> findByWaitingApartId(Integer waitingApartId);


}
