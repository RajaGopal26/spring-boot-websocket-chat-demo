package com.example.websocketdemo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.envers.Audited;

import lombok.Data;

@Entity
@Data
@Table(name = "vehicle")
@Audited
public class VehicleEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private long id;

	private String vehicleIdentityNumber;

	private String make;

	private String model;

	private String status;

}