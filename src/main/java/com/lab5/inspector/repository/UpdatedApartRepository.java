package com.lab5.inspector.repository;

import com.lab5.inspector.entity.UpdatedApart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UpdatedApartRepository extends JpaRepository<UpdatedApart, Integer> {
    List<UpdatedApart> findByWaitingApart_Id(Integer waitingApartId);
}
