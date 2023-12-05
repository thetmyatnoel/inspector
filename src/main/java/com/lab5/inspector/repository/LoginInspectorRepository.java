package com.lab5.inspector.repository;

import com.lab5.inspector.entity.LoginInspector;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoginInspectorRepository extends JpaRepository <LoginInspector, Integer>{
    LoginInspector findByUsername(String username);
}
