package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.IngInspectdataRepository;
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
import java.util.Map;

@Service
@Slf4j
public class IngInspectdataService {
    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;
    @Autowired
    private WaitingApartRepository waitingApartRepository;

    /**
     * @return
     */
    @Transactional
    public void processAndSaveData(ArrayList<IngInspectdata> dataList) {
        for (IngInspectdata data : dataList) {
            // Splitting the string fields into arrays

            String[] ladonRooms = processField(data.getLadonRoom()).split(",");
            String[] ladonPcls = processField(data.getLadonPcl()).split(",");
            String[] formaldehydeRooms = processField(data.getFormalRoom()).split(",");
            String[] formaldehydeValues = processField(data.getFormalPpm()).split(",");
            String[] cameraRooms = processField(data.getThermalRoom()).split(",");
            String[] cameraOptions = processField(data.getThermalStatus()).split(",");
            String[] pipeRooms = processField(data.getPipeRoom()).split(",");
            String[] pipeOptions = processField(data.getPipeStatus()).split(",");
            String[] bathRooms = processField(data.getBathRoom()).split(",");
            String[] bathOptions = processField(data.getBathStatus()).split(",");
            String[] bathTexts = processField(data.getBathContent()).split(",");
            String[] finalRooms = processField(data.getFinalRoom()).split(",");
            String[] finalGonzones = processField(data.getFinalGonzone()).split(",");
            String[] finalSelbus = processField(data.getFinalSelbu()).split(",");
            String[] finalHazas = processField(data.getFinalHaza()).split(",");
            String[] finalBgos = processField(data.getFinalBgo()).split(",");
            String[] finalImage1s = processField(data.getFinalImage1Base64()).split(",");
            String[] finalImage2s = processField(data.getFinalImage2Base64()).split(",");

            int maxLength = findMaxLength(ladonRooms, ladonPcls, formaldehydeRooms, formaldehydeValues,
                    cameraRooms, cameraOptions, pipeRooms, pipeOptions,
                    bathRooms, bathOptions, bathTexts, finalRooms, finalGonzones,finalSelbus,finalHazas,finalBgos,
                    finalImage1s, finalImage2s);
            if (maxLength > 0) {
                for (int i = 0; i < maxLength; i++) {
                    IngInspectdata newData = new IngInspectdata();

                    // Ladon
                    if (isValid(ladonRooms, i)) {
                        newData.setLadonRoom(ladonRooms[i]);
                        newData.setLadonPcl(getValueOrDefault(ladonPcls, i));
                    }

                    // Formaldehyde
                    if (isValid(formaldehydeRooms, i)) {
                        newData.setFormalRoom(formaldehydeRooms[i]);
                        newData.setFormalPpm(getValueOrDefault(formaldehydeValues, i));
                    }

                    // Thermal (Camera)
                    if (isValid(cameraRooms, i)) {
                        newData.setThermalRoom(cameraRooms[i]);
                        newData.setThermalStatus(getValueOrDefault(cameraOptions, i));
                    }

                    // Pipe
                    if (isValid(pipeRooms, i)) {
                        newData.setPipeRoom(pipeRooms[i]);
                        newData.setPipeStatus(getValueOrDefault(pipeOptions, i));
                    }

                    // Bath
                    if (isValid(bathRooms, i)) {
                        newData.setBathRoom(bathRooms[i]);
                        newData.setBathStatus(getValueOrDefault(bathOptions, i));
                        newData.setBathContent(getValueOrDefault(bathTexts, i));
                    }

                    // Final
                    if (isValid(finalRooms, i)) {
                        newData.setFinalRoom(finalRooms[i]);
                        newData.setFinalGonzone(getValueOrDefault(finalGonzones, i));
                        newData.setFinalSelbu(getValueOrDefault(finalSelbus, i));
                        newData.setFinalHaza(getValueOrDefault(finalHazas, i));
                        newData.setFinalBgo(getValueOrDefault(finalBgos, i));
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

                    }


                    if (data.getWaitingApart() != null && data.getWaitingApart().getId() != null) {
                        Integer waitingApartId = data.getWaitingApart().getId();
                        WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                                .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                        newData.setWaitingApart(waitingApart);
                    }

                    ingInspectdataRepository.save(newData);
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
    private boolean isValid(String[] array, int index) {
        return index < array.length && array[index] != null && !array[index].trim().isEmpty() && !"-".equals(array[index].trim());
    }

    private String getValueOrDefault(String[] array, int index) {
        return (index < array.length && !"-".equals(array[index].trim())) ? array[index] : "-";
    }
    private String processField(String input) {
        return (input == null || input.trim().isEmpty()) ? "-" : input;
    }
    private byte[] decodeBase64Image(String base64Image) {

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


    public List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId)
    {
        return ingInspectdataRepository.findNonEmptyDataByWaitingApartId(waitingApartId);
    }
    public boolean deleteData(Integer waitingApartId, Map<String, String> compareData) {
        List<IngInspectdata> dataList = ingInspectdataRepository.findByWaitingApartId(waitingApartId);
        boolean dataUpdated = false;
        System.out.println("First time Data fetched from DB: " + dataList);
        for (IngInspectdata data : dataList) {
            System.out.println("Data fetched from DB: " + data);
            if (matchesCompareData(data, compareData)) {
                switch (compareData.get("type")) {
                    case "ladon":
                        if (compareData.containsKey("room") && compareData.containsKey("pcl")) {
                            data.setLadonRoom(null);
                            data.setLadonPcl(null);
                        }
                        break;
                    case "formal":
                        if (compareData.containsKey("room") && compareData.containsKey("ppm")) {
                            data.setFormalRoom(null);
                            data.setFormalPpm(null);
                        }
                        break;
                    case "thermal":
                        if (compareData.containsKey("room") && compareData.containsKey("status")) {
                            data.setThermalRoom(null);
                            data.setThermalStatus(null);
                        }
                        break;
                    case "pipe":
                        if (compareData.containsKey("room") && compareData.containsKey("status")) {
                            data.setPipeRoom(null);
                            data.setPipeStatus(null);
                        }
                        break;
                    case "bath":
                        if (compareData.containsKey("room") && compareData.containsKey("status")) {
                            data.setBathRoom(null);
                            data.setBathStatus(null);

                            if (compareData.containsKey("content") && data.getBathContent() != null && data.getBathContent().equals(compareData.get("content"))) {
                                data.setBathContent(null);
                            } else if (!compareData.containsKey("content") && "-".equals(data.getBathContent())) {
                                data.setBathContent(null);
                            }
                        }
                        break;
                    case "final":
                        if (compareData.containsKey("room") && compareData.containsKey("gonzone") && compareData.containsKey("selbu") &&
                                compareData.containsKey("haza") && compareData.containsKey("bgo")) {
                            data.setFinalRoom(null);
                            data.setFinalGonzone(null);
                            data.setFinalSelbu(null);
                            data.setFinalHaza(null);
                            data.setFinalBgo(null);

                        }
                        if (compareData.containsKey("deleteImage1") && Boolean.parseBoolean(compareData.get("deleteImage1"))) {
                            data.setFinalImage1(null);
                        }
                        if (compareData.containsKey("deleteImage2") && Boolean.parseBoolean(compareData.get("deleteImage2"))) {
                            data.setFinalImage2(null);
                        }

                        break;
                }

                ingInspectdataRepository.save(data); // Update the entity in the database
                dataUpdated = true;

                break;
            }
            else
            {
                System.out.println("Current data does not match compareData, checking next row");
            }
        }

        return dataUpdated;
    }


    private boolean matchesCompareData(IngInspectdata data, Map<String, String> compareData) {
        System.out.println("Comparing database data with compareData: " + compareData);
        switch (compareData.get("type")) {
            case "ladon":
                return (data.getLadonRoom() != null && data.getLadonRoom().equals(compareData.get("room"))) &&
                        (data.getLadonPcl() != null && data.getLadonPcl().equals(compareData.get("pcl")));

            case "formal":
                return (data.getFormalRoom() != null && data.getFormalRoom().equals(compareData.get("room"))) &&
                        (data.getFormalPpm() != null && data.getFormalPpm().equals(compareData.get("ppm")));

            case "thermal":
                return (data.getThermalRoom() != null && data.getThermalRoom().equals(compareData.get("room"))) &&
                        (data.getThermalStatus() != null && data.getThermalStatus().equals(compareData.get("status")));

            case "pipe":
                return (data.getPipeRoom() != null && data.getPipeRoom().equals(compareData.get("room"))) &&
                        (data.getPipeStatus() != null && data.getPipeStatus().equals(compareData.get("status")));

            case "bath":
                boolean roomMatch = data.getBathRoom() != null && data.getBathRoom().equals(compareData.get("room"));
                boolean statusMatch = data.getBathStatus() != null && data.getBathStatus().equals(compareData.get("status"));
                boolean contentMatch = true;

                if (compareData.containsKey("content")) {
                    contentMatch = data.getBathContent() != null && data.getBathContent().equals(compareData.get("content"));
                } else {
                    contentMatch = data.getBathContent() == null || "-".equals(data.getBathContent());
                }

                return roomMatch && statusMatch && contentMatch;

            case "final":
                return (data.getFinalRoom() != null && data.getFinalRoom().equals(compareData.get("room"))) &&
                        (data.getFinalGonzone() != null && data.getFinalGonzone().equals(compareData.get("gonzone"))) &&
                        (data.getFinalSelbu() != null && data.getFinalSelbu().equals(compareData.get("selbu"))) &&
                        (data.getFinalHaza() != null && data.getFinalHaza().equals(compareData.get("haza"))) &&
                        (data.getFinalBgo() != null && data.getFinalBgo().equals(compareData.get("bgo")));
                /*&&
                        (compareData.get("image1") == null ||
                                (data.getFinalImage1() != null && data.getFinalImage1().equals(compareData.get("image1")))) &&
                        (compareData.get("image2") == null ||
                                (data.getFinalImage2() != null && data.getFinalImage2().equals(compareData.get("image2")))*/

            default:
                return false;
        }
    }

}


