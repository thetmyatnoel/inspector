package com.lab5.inspector.repository;

import com.lab5.inspector.entity.WaitingApart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WaitingApartRepository extends JpaRepository<WaitingApart, Integer> {

}
