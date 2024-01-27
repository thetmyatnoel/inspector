package com.lab5.inspector.service;

import com.lab5.inspector.entity.Report;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.ReportRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Optional;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ReportRepository reportRepository;
    @Autowired
    private WaitingApartRepository waitingApartRepository;
    public void sendReportEmail(int waitingApartId) throws MessagingException {
        Optional<WaitingApart> waitingApartOptional = waitingApartRepository.findById(waitingApartId);

        if (waitingApartOptional.isPresent()) {
            WaitingApart waitingApart = waitingApartOptional.get();
            String recipientEmail = waitingApart.getEmail();
            String subject = "하자 점검 리포트";
            String content = "안녕하십니까 고객님? "+"\n"+"입사 축하드립니다. 아래에 점검한 내용을 확인하실 수 있습니다." +"\n"+
                    "즐거운 하루 되십시오.";


            Optional<Report> reportOptional = reportRepository.findByWaitingApartId(waitingApart.getId());
            if (reportOptional.isPresent()) {
                Report report = reportOptional.get();
                sendEmailWithAttachment(recipientEmail, subject, content, report.getContent(), "report.pdf");
            } else {
                throw new RuntimeException("Report not found for WaitingApartId: " + waitingApartId);
            }
        } else {
            throw new RuntimeException("WaitingApart not found for Id: " + waitingApartId);
        }
    }

    private void sendEmailWithAttachment(String to, String subject, String text, byte[] attachment, String attachmentName) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text);

        if (attachment != null) {
            InputStream attachmentStream = new ByteArrayInputStream(attachment);
            helper.addAttachment(attachmentName, () -> attachmentStream);
        }

       mailSender.send(message);
    }
}
