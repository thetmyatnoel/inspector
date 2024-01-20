package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.UpdatedApart;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.IngInspectdataRepository;
import com.lab5.inspector.repository.UpdatedApartRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
@Slf4j
public class UpdatedApartService {
    @Autowired
    private UpdatedApartRepository updatedApartRepository;

    @Autowired
    private WaitingApartRepository waitingApartRepository;

    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;

    @Transactional
    public void moveAndDeleteData(Integer waitingApartId) {
        List<IngInspectdata> dataList = ingInspectdataRepository.findByWaitingApartId(waitingApartId);

        if (dataList.isEmpty()) {
            throw new EntityNotFoundException("No data found for WaitingApart ID: " + waitingApartId);
        }

        for (IngInspectdata ingData : dataList) {
            UpdatedApart updatedData = mapIngInspectdataToUpdatedApart(ingData);
            updatedApartRepository.save(updatedData);
        }

        ingInspectdataRepository.deleteAll(dataList);
    }

    private UpdatedApart mapIngInspectdataToUpdatedApart(IngInspectdata ingData) {
        UpdatedApart updatedData = new UpdatedApart();

        updatedData.setLadonRoom(ingData.getLadonRoom());
        updatedData.setLadonPcl(ingData.getLadonPcl());
        updatedData.setFormalRoom(ingData.getFormalRoom());
        updatedData.setFormalPpm(ingData.getFormalPpm());
        updatedData.setThermalRoom(ingData.getThermalRoom());
        updatedData.setThermalStatus(ingData.getThermalStatus());
        updatedData.setPipeRoom(ingData.getPipeRoom());
        updatedData.setPipeStatus(ingData.getPipeStatus());
        updatedData.setBathRoom(ingData.getBathRoom());
        updatedData.setBathStatus(ingData.getBathStatus());
        updatedData.setBathContent(ingData.getBathContent());
        updatedData.setFinalRoom(ingData.getFinalRoom());
        updatedData.setFinalGonzone(ingData.getFinalGonzone());
        updatedData.setFinalSelbu(ingData.getFinalSelbu());
        updatedData.setFinalHaza(ingData.getFinalHaza());
        updatedData.setFinalBgo(ingData.getFinalBgo());
        updatedData.setFinalImage1(ingData.getFinalImage1());
        updatedData.setFinalImage2(ingData.getFinalImage2());

        // Assuming IngInspectdata has a waitingApart field
        updatedData.setWaitingApart(ingData.getWaitingApart());

        return updatedData;
    }

    @Transactional
    public void updateAndCleanData(ArrayList<UpdatedApart> dataList) {
        for (UpdatedApart data : dataList) {
            // Splitting the string fields into arrays
            String[] ladonRooms = data.getLadonRoom() != null ? data.getLadonRoom().split(",") : new String[0];
            String[] ladonPcls = data.getLadonPcl() != null ? data.getLadonPcl().split(",") : new String[0];
            String[] formaldehydeRooms = data.getFormalRoom() != null ? data.getFormalRoom().split(",") : new String[0];
            String[] formaldehydeValues = data.getFormalPpm() != null ? data.getFormalPpm().split(",") : new String[0];
            String[] cameraRooms = data.getThermalRoom() != null ? data.getThermalRoom().split(",") : new String[0];
            String[] cameraOptions = data.getThermalStatus() != null ? data.getThermalStatus().split(",") : new String[0];
            String[] pipeRooms = data.getPipeRoom() != null ? data.getPipeRoom().split(",") : new String[0];
            String[] pipeOptions = data.getPipeStatus() != null ? data.getPipeStatus().split(",") : new String[0];
            String[] bathRooms = data.getBathRoom() != null ? data.getBathRoom().split(",") : new String[0];
            String[] bathOptions = data.getBathStatus() != null ? data.getBathStatus().split(",") : new String[0];
            String[] bathTexts = data.getBathContent() != null ? data.getBathContent().split(",") : new String[0];
            String[] finalRooms = data.getFinalRoom() != null ? data.getFinalRoom().split(",") : new String[0];
            String[] finalGonzones = data.getFinalGonzone() != null ? data.getFinalGonzone().split(",") : new String[0];
            String[] finalSelbus = data.getFinalSelbu() != null ? data.getFinalSelbu().split(",") : new String[0];
            String[] finalHazas = data.getFinalHaza() != null ? data.getFinalHaza().split(",") : new String[0];
            String[] finalBgos = data.getFinalBgo() != null ? data.getFinalBgo().split(",") : new String[0];
            String[] finalImage1s = data.getFinalImage1Base64() != null ? data.getFinalImage1Base64().split(",") : new String[0];
            String[] finalImage2s = data.getFinalImage2Base64() != null ? data.getFinalImage2Base64().split(",") : new String[0];

            int maxLength = findMaxLength(ladonRooms, ladonPcls, formaldehydeRooms, formaldehydeValues,
                    cameraRooms, cameraOptions, pipeRooms, pipeOptions,
                    bathRooms, bathOptions, bathTexts, finalRooms, finalGonzones,finalSelbus,finalHazas,finalBgos,
                    finalImage1s, finalImage2s);
            if (maxLength > 0) {
                for (int i = 0; i < maxLength; i++) {
                    UpdatedApart newData = new UpdatedApart();

                    if (i < ladonRooms.length) newData.setLadonRoom(ladonRooms[i]);
                    if (i < ladonPcls.length) newData.setLadonPcl(ladonPcls[i]);
                    if (i < formaldehydeRooms.length) newData.setFormalRoom(formaldehydeRooms[i]);
                    if (i < formaldehydeValues.length) newData.setFormalPpm(formaldehydeValues[i]);
                    if (i < cameraRooms.length) newData.setThermalRoom(cameraRooms[i]);
                    if (i < cameraOptions.length) newData.setThermalStatus(cameraOptions[i]);
                    if (i < pipeRooms.length) newData.setPipeRoom(pipeRooms[i]);
                    if (i < pipeOptions.length) newData.setPipeStatus(pipeOptions[i]);
                    if (i < bathRooms.length) newData.setBathRoom(bathRooms[i]);
                    if (i < bathOptions.length) newData.setBathStatus(bathOptions[i]);
                    if (i < bathTexts.length) newData.setBathContent(bathTexts[i]);
                    if (i < finalRooms.length) newData.setFinalRoom(finalRooms[i]);
                    if (i < finalGonzones.length) newData.setFinalGonzone(finalGonzones[i]);
                    if (i < finalSelbus.length) newData.setFinalSelbu(finalSelbus[i]);
                    if (i < finalHazas.length) newData.setFinalHaza(finalHazas[i]);
                    if (i < finalBgos.length) newData.setFinalBgo(finalBgos[i]);
                    try {
                        if (i < finalImage1s.length ) {
                            byte[] image1 = decodeBase64Image(finalImage1s[i+1]);
                            newData.setFinalImage1(image1);
                        }
                        if (i < finalImage2s.length ) {
                            byte[] image2 = decodeBase64Image(finalImage2s[i+1]);
                            newData.setFinalImage2(image2);
                        }
                    } catch (DataIntegrityViolationException e) {
                        log.error("Data too large for database column: " +e.getMessage());
                        continue;
                    } catch (Exception e) {
                        log.error("Error saving data: " + e.getMessage(), e);

                    }
                    if (data.getWaitingApart() != null && data.getWaitingApart().getId() != null) {
                        Integer waitingApartId = data.getWaitingApart().getId();
                        WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                                .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                        newData.setWaitingApart(waitingApart);
                    }

                    updatedApartRepository.save(newData);
                }

            } else {
                IngInspectdata newData = new IngInspectdata();
                if (data.getWaitingApart() != null && data.getWaitingApart().getId() != null) {
                    Integer waitingApartId = data.getWaitingApart().getId();
                    WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                            .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                    newData.setWaitingApart(waitingApart);
                }
                ingInspectdataRepository.save(newData);

            }


        }
    }
    private byte[] decodeBase64Image(String base64Image) {
        // Check for and remove data URI scheme if present
        String base64Encoded = base64Image.startsWith("data:image")
                ? base64Image.substring(base64Image.indexOf(",") + 1)
                : base64Image;

        return Base64.getDecoder().decode(base64Encoded);
    }

    private int findMaxLength(String[]... arrays) {
        int max = 0;
        for (String[] array : arrays) {
            if (array.length > max) {
                max = array.length;
            }
        }
        return max;
    }

    public List<UpdatedApart> getUpdatedApartsByWaitingApartId(Integer waitingApartId) {
        return updatedApartRepository.findByWaitingApart_Id(waitingApartId);
    }


}




