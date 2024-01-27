package com.lab5.inspector.service;

import com.lab5.inspector.entity.Report;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.ReportRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ReportService {
    @Autowired
    private ReportRepository reportRepository;

    @Autowired
    private WaitingApartService waitingApartService;

    public Report saveReport(MultipartFile file, Integer apartId) throws Exception {
        WaitingApart waitingApart = waitingApartService.getWaitingApartById(apartId);
        if (waitingApart == null) {
            throw new Exception("Invalid WaitingApart ID.");
        }

        String customerName = waitingApart.getCustomer_name();

        Report report = new Report();
        report.setName(customerName);
        report.setWaitingApart(waitingApart);
        System.out.println("Report : "+file.getBytes());
        report.setContent(file.getBytes());


        return reportRepository.save(report);
    }
    public byte[] getReportContentByName(String name) {
        Report report = reportRepository.findByName(name)
                .orElseThrow(() -> new EntityNotFoundException("Report not found"));
        return report.getContent();
    }
}
