package com.lab5.inspector.service;

import com.lab5.inspector.entity.IngInspectdata;
import com.lab5.inspector.entity.WaitingApart;
import com.lab5.inspector.repository.IngInspectdataRepository;
import com.lab5.inspector.repository.WaitingApartRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Slf4j
public class IngInspectdataService {
    @Autowired
    private IngInspectdataRepository ingInspectdataRepository;
    @Autowired
    private WaitingApartRepository waitingApartRepository;

    /**
     *
     * @param list
     * @return
     */
    public Integer save(ArrayList<IngInspectdata> list){
        Integer result = 0;
        try {
            for (IngInspectdata ingInspectdata : list) {
                Integer waitingApartId = ingInspectdata.getWaitingApart().getId(); // Assuming you have a getter for ID
                if (waitingApartId != null) {
                    WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId)
                            .orElseThrow(() -> new EntityNotFoundException("WaitingApart not found with ID: " + waitingApartId));
                    ingInspectdata.setWaitingApart(waitingApart);
                }
            }
            result = ingInspectdataRepository.saveAll(list).size();
            ingInspectdataRepository.flush();
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return result;
    }
    public List<IngInspectdata> findNonEmptyDataByWaitingApartId(Integer waitingApartId)
    {
        return ingInspectdataRepository.findNonEmptyDataByWaitingApartId(waitingApartId);
    }
    public boolean deleteData(Integer waitingApartId, Map<String, String> compareData) {
        Optional<IngInspectdata> dataOptional = ingInspectdataRepository.findByWaitingApartId(waitingApartId);

        if (dataOptional.isPresent()) {
            IngInspectdata data = dataOptional.get();
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
                        if (compareData.containsKey("room") && compareData.containsKey("status") && compareData.containsKey("content")) {
                            data.setBathRoom(null);
                            data.setBathStatus(null);
                            data.setBathContent(null);
                        }
                        break;
                    case "final":
                        if (compareData.containsKey("room") && compareData.containsKey("gonzone") && compareData.containsKey("selbu") &&
                                compareData.containsKey("haza") && compareData.containsKey("bgo") && compareData.containsKey("image1") &&
                                compareData.containsKey("image2")) {
                            data.setFinalRoom(null);
                            data.setFinalGonzone(null);
                            data.setFinalSelbu(null);
                            data.setFinalHaza(null);
                            data.setFinalBgo(null);
                            data.setFinalImage1(null);
                            data.setFinalImage2(null);
                        }
                        break;

                }

                ingInspectdataRepository.save(data); // Update the entity in the database
                return true;
            }

        }

        return false;
    }

    private boolean matchesCompareData(IngInspectdata data, Map<String, String> compareData) {
        System.out.println("Comparing database data with compareData: " + compareData);
        switch (compareData.get("type")) {
            case "ladon":
                return data.getLadonRoom().equals(compareData.get("room")) &&
                        data.getLadonPcl().equals(compareData.get("pcl"));
            case "formal":
                return data.getFormalRoom().equals(compareData.get("room")) &&
                        data.getFormalPpm().equals(compareData.get("ppm"));
            case "thermal":
                return data.getThermalRoom().equals(compareData.get("room")) &&
                        data.getThermalStatus().equals(compareData.get("status"));
            case "pipe":
                return data.getPipeRoom().equals(compareData.get("room")) &&
                        data.getPipeStatus().equals(compareData.get("status"));
            case "bath":
                return data.getBathRoom().equals(compareData.get("room")) &&
                        data.getBathStatus().equals(compareData.get("status")) &&
                        (compareData.get("content") == null || data.getBathContent().equals(compareData.get("content")));
            case "final":
                return data.getFinalRoom().equals(compareData.get("room")) &&
                        data.getFinalGonzone().equals(compareData.get("gonzone")) &&
                        data.getFinalSelbu().equals(compareData.get("selbu")) &&
                        data.getFinalHaza().equals(compareData.get("haza")) &&
                        data.getFinalBgo().equals(compareData.get("bgo")) &&
                        (compareData.get("image1") == null || data.getFinalImage1().equals(compareData.get("image1"))) &&
                        (compareData.get("image2") == null || data.getFinalImage2().equals(compareData.get("image2")));
            default:
                return false;
        }
    }


}
