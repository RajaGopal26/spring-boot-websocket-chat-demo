package com.example.websocketdemo.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "contacts")
public class ContactEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private long contactId;

	private String firstName;

	private String lastName;

	private String email;
	
	private Long phoneNo;

	private String status;
}
