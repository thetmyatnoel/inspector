package com.lab5.inspector.entity;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Blob;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "updated_apart")
public class UpdatedApart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ladon_room")
    private String ladonRoom;

    @Column(name = "ladon_pcl")
    private String ladonPcl;

    @Column(name = "formal_room")
    private String formalRoom;

    @Column(name = "formal_ppm")
    private String formalPpm;

    @Column(name = "thermal_room")
    private String thermalRoom;

    @Column(name = "thermal_status")
    private String thermalStatus;

    @Column(name = "pipe_room")
    private String pipeRoom;

    @Column(name = "pipe_status")
    private String pipeStatus;

    @Column(name = "bath_room")
    private String bathRoom;

    @Column(name = "bath_status")
    private String bathStatus;

    @Column(name = "bath_content", columnDefinition = "TEXT")
    private String bathContent;

    @Column(name = "final_room")
    private String finalRoom;

    @Column(name = "final_gonzone")
    private String finalGonzone;

    @Column(name = "final_selbu")
    private String finalSelbu;

    @Column(name = "final_haza")
    private String finalHaza;

    @Column(name = "final_bgo")
    private String finalBgo;

    @Lob
    @Column(name = "final_image1")
    private Blob finalImage1;

    @Lob
    @Column(name = "final_image2")
    private Blob finalImage2;

    @ManyToOne
    @JoinColumn(name = "waiting_apart_id", referencedColumnName = "id")
    private WaitingApart waitingApart;

}

