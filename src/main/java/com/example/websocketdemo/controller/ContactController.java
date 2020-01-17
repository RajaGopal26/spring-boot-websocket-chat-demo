package com.example.websocketdemo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.websocketdemo.entity.ContactEntity;
import com.example.websocketdemo.model.Contact;
import com.example.websocketdemo.model.ContactForm;
import com.example.websocketdemo.repository.ContactRepository;


//@RequestMapping("/contact")
@Controller
public class ContactController {

	@Resource
	private ContactRepository contactRepo;

	private static List<Contact> contacts = new ArrayList<>();

	static {
		contacts.add(new Contact("Barack", "Obama", "barack.o@whitehouse.com", "147-852-965"));
		contacts.add(new Contact("George", "Bush", "george.b@whitehouse.com", "785-985-652"));
		contacts.add(new Contact("Bill", "Clinton", "bill.c@whitehouse.com", "236-587-412"));
		contacts.add(new Contact("Ronald", "Reagan", "ronald.r@whitehouse.com", "369-852-452"));
	}

	//	@PostConstruct
	@PostMapping
	public void saveContacts() {

		List<ContactEntity> contactList = new ArrayList<>();
		contacts.forEach(contact ->{
			ContactEntity conEntity= new ContactEntity();
			conEntity.setEmail(contact.getEmail());
			conEntity.setPhoneNo(Long.parseLong(contact.getPhone().replace("-", "")));
			conEntity.setFirstName(contact.getFirstname());
			conEntity.setLastName(contact.getLastname());
			contactList.add(conEntity);
		});
		contactRepo.saveAll(contactList);
	}

	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ModelAndView get() {
		ContactForm contactForm = new ContactForm();
		List<ContactEntity> conList=contactRepo.findAll();
		if(!conList.isEmpty()) {
			contacts.removeAll(contacts);
			conList.forEach(contactObj -> {
				Contact contactDTO= new Contact(contactObj.getFirstName(), contactObj.getLastName(), contactObj.getEmail(), contactObj.getPhoneNo().toString());
				contacts.add(contactDTO);
			});
			contactForm.setContacts(contacts);
		}else
			contactForm.setContacts(contacts);
		return new ModelAndView("add_contact" , "contactForm", contacts);
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public ModelAndView save(HttpServletRequest request, @ModelAttribute ContactForm contactForm) throws IOException {
		System.out.println(contactForm);
//		Contact contactList = contactForm.getContacts().get(0);

		if(contactForm != null ) {
			//			contacts = contactList;
			for (Contact contact : contacts) {
				System.out.printf("%s \t %s \n", contact.getFirstname(), contact.getLastname());
			}
		}
		else {
			return new ModelAndView("empty_contact", "contactForm", contactForm);
		}
		ContactForm conForm= new ContactForm();
		conForm.setContacts(contacts);
		return new ModelAndView("show_contact", "contactForm", conForm);
	}

}
