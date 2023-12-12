package com.lab5.inspector.repository;

import com.lab5.inspector.entity.WaitingApart;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WaitingApartRepository extends JpaRepository<WaitingApart, Integer> {
    List<WaitingApart> findByStatus(String status);
}
