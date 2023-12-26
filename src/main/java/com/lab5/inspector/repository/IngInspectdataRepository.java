package com.lab5.inspector.repository;

import com.lab5.inspector.entity.IngInspectdata;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface IngInspectdataRepository extends JpaRepository<IngInspectdata, Integer> {
    List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId );

    Optional<IngInspectdata> findByWaitingApartId(Integer waitingApartId);
    @Transactional
    void deleteByWaitingApartId(Integer waitingApartId);


}
