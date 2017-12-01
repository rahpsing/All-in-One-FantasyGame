package com.allinone.util;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import javax.inject.Singleton;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

/**
 * ChatServer
 * @author Jiji_Sasidharan
 */
@ServerEndpoint(value="/chat", configurator=ChatServerEndPointConfigurator.class)
@Singleton
public class ChatServerEndPoint {
   
    Set<Session> userSessions = Collections.synchronizedSet(new HashSet<Session>());

    /**
     * Callback hook for Connection open events. 
     * 
     * This method will be invoked when a client requests for a 
     * WebSocket connection.
     * 
     * @param userSession the userSession which is opened.
     */
    @OnOpen
    public void onOpen(Session userSession) {
        System.out.println("New request received. Id: " + userSession.getId());
        userSessions.add(userSession);
    }
    
    /**
     * Callback hook for Connection close events.
     * 
     * This method will be invoked when a client closes a WebSocket
     * connection.
     * 
     * @param userSession the userSession which is opened.
     */
    @OnClose
    public void onClose(Session userSession) {
        System.out.println("Connection closed. Id: " + userSession.getId());
        userSessions.remove(userSession);
    }
    
    /**
     * Callback hook for Message Events.
     * 
     * This method will be invoked when a client send a message.
     * 
     * @param message The text message
     * @param userSession The session of the client
     */
    @OnMessage
    public void onMessage(String message, Session userSession) {
        System.out.println("Message Received: " + message);
        for (Session session : userSessions) {
            System.out.println("Sending to " + session.getId());
            session.getAsyncRemote().sendText(message);
        }
    }
}