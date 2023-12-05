package com.lab5.inspector.service;

import com.lab5.inspector.entity.LoginInspector;
import com.lab5.inspector.repository.LoginInspectorRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class LoginDbService {

    @Autowired
    private LoginInspectorRepository loginInspectorRepository;

    public boolean validateLogin(String username, String password) {
        LoginInspector LoginInspector = loginInspectorRepository.findByUsername(username);

        return LoginInspector != null && LoginInspector.getPassword().equals(password);
    }


}
