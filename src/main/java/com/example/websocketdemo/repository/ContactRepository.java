package com.example.websocketdemo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.example.websocketdemo.entity.ContactEntity;

public interface ContactRepository extends JpaRepository<ContactEntity, Long>{

}
