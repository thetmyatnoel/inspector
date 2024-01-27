package com.lab5.inspector.service;

import com.lab5.inspector.entity.LoginInspector;
import com.lab5.inspector.repository.LoginInspectorRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class LoginDbService implements UserDetailsService {

    @Autowired
    private LoginInspectorRepository loginInspectorRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    public void encodeAndSavePhoneNumbersAsPasswords() {
        List<LoginInspector> inspectors = loginInspectorRepository.findAll();

        for (LoginInspector inspector : inspectors) {
            String encodedPassword = passwordEncoder.encode(inspector.getPassword());
            inspector.setPassword(encodedPassword);
            loginInspectorRepository.save(inspector);
        }
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        LoginInspector loginInspector = loginInspectorRepository.findByUsername(username);

        if (loginInspector == null) {
            throw new UsernameNotFoundException("User not found with username: " + username);
        }

        return loginInspector;
    }
}
