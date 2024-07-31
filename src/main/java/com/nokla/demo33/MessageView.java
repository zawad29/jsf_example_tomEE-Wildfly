package com.nokla.demo33;

import jakarta.annotation.PostConstruct;
import jakarta.ejb.EJB;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.eclipse.microprofile.metrics.annotation.Timed;

import java.io.Serializable;
import java.util.List;
import java.util.Vector;

@Named
@RequestScoped
public class MessageView {
    private Message message = new Message();
    private List<Message> messages = new Vector<Message>();
    @EJB
    MessageService messageService;

    public void setMessage(Message message) {
        this.message = message;
    }

    public Message getMessage() {
        return message;
    }

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    @PostConstruct
    public void init(){
        System.out.println("MessageView.init");
        try{
            messages =  messageService.getMessages();
            messages.forEach(System.out::println);
        } catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Timed
    public String submitMessage(){
        System.out.println("MessageView.submitMessage");
        try{
            messageService.createMessage(message);
        } catch (Exception e){
            System.out.println(e.toString());
        }
        return null;
    }
}
