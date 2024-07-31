package com.nokla.demo33;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateless
public class MessageService {
    @PersistenceContext
    private EntityManager em;

    public List<Message> getMessages() {
        return em
                .createQuery("SELECT m FROM Message m", Message.class)
                .getResultList();
    }
    public void createMessage(Message message){
        em.persist(message);
    }

}
