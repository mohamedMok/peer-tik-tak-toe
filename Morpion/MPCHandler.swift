//
//  MPCHandler.swift
//  Morpion
//
//  Created by Mohamed Mokhtari on 27/11/2014.
//  Copyright (c) 2014 Mohamed Mokhtari. All rights reserved.
//

import UIKit
import MultipeerConnectivity


class MPCHandler: NSObject, MCSessionDelegate {
 
    // @peerID : Id of every device connected
    // @session : game conncted session 
    var peerID: MCPeerID!
    var session: MCSession!
    var browser: MCBrowserViewController!
    var advertiser: MCAdvertiserAssistant? = nil
    
    
    func setupPeerWithDisplayName(displayName: String){
        peerID = MCPeerID(displayName: displayName)
    }
    
    func setupSession(){
        session = MCSession(peer: peerID)
        session.delegate = self
    }
    
    func setupBrowser(){
        browser = MCBrowserViewController(serviceType: "my-game", session: session)
    }
    
    func advertiseSelf(advertise:Bool){
        if advertise{
            advertiser = MCAdvertiserAssistant(serviceType: "my-game", discoveryInfo: nil, session: session)
            advertiser!.start()
        }else{
            advertiser!.stop()
            advertiser = nil
        }
    }
    
    //MCSessionDelegate function
    
    // Remote peer changed state
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState){
        let userInfo = ["peerID":peerID, "state":state.rawValue]
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName("MPC_DidChangeStateNotification", object: nil, userInfo: userInfo)
        })
        
    }
    
    // Received data from remote peer
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!){
        let userInfo = ["data":data, "peerID":peerID]
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName("MPC_DidReceiveDataNotification", object: nil, userInfo: userInfo)
        })
    }
    
    // Received a byte stream from remote peer
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!){
        
    }
    
    // Start receiving a resource from remote peer
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!){
        
    }
    
    // Finished receiving a resource from remote peer and saved the content in a temporary location - the app is responsible for moving the file to a permanent location within its sandbox
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!){
        
    }

}
