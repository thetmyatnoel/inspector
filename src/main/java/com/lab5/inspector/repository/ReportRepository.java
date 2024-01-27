package com.lab5.inspector.repository;

import com.lab5.inspector.entity.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ReportRepository extends JpaRepository<Report, Integer> {
    List<Report> findAll();
    Optional<Report> findByName(String name);
}
