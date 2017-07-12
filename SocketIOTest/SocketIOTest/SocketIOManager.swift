//
//  SocketIOManager.swift
//  SocketIOTest
//
//  Created by 鄭翔元 on 2017/7/7.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import Foundation
import SocketIO

public class SocketIOManager{
    let socket:SocketIOClient
    let uuid:String
    
    var actionQueue:String? // queue message when socketio disconnected. only queue a message.
    public weak var delegate:SocketIOManagerDelegate?
    
    init(uuid:String) {
        self.uuid = uuid
        
        let url = URL(string: APIDomain.Socket.rawValue)!
        socket = SocketIOClient(socketURL: url)
        
        // when connect, send uuid and send action in message queue(if not nil)
        socket.on(clientEvent: .connect){ data, ack in
            print("Connect")
            self.sendUUID()
            if self.actionQueue != nil{
                self.sendAction(action: self.actionQueue!)
            }
        }
        
        // listen server and send to delegate
        socket.on("RCVD", callback: sendToDelegate)
    }
    
    /**
     For user
     */
    public func start(){
        socket.connect()
    }
    
    public func close(){
        socket.disconnect()
    }
    
    public func sendAction(action:SocketIOAction){
        let action = action.rawValue
        switch socket.status {
        case .connected:
            sendAction(action: action)
        default:
            queueAction(action: action)
        }
    }
    
    /**
     For class
     */
    func sendUUID(){
        socket.emit("DEBUG", "~~UUID~~")
        let dict = [
            "device":"app",
            "qrcode": uuid
        ]
//        let str = JsonHelper.toString(dict: dict)
//        print(str)
        socket.emit("SET", dict)
    }
    
    func sendAction(action:String){
        socket.emit("DEBUG", "~~Action~~")
        let dict = [
            "device":"app",
            "type":action
        ]
//        let str = JsonHelper.toString(dict: dict)
//        print(str)
        socket.emit("SEND", dict)
    }
    
    func queueAction(action:String){
        actionQueue = action
    }
    
    func sendToDelegate(datas:[Any], ack:SocketAckEmitter){
        guard let data = datas[0] as? String ,
            let action = SocketIOAction(rawValue: data) else{
                // TODO: send error
                return
        }
        
        delegate?.socketIOManager(response: action)
    }
}

public protocol SocketIOManagerDelegate:class{
    func socketIOManager(response: SocketIOAction)
}

public enum SocketIOAction:String {
    case qr_to_ticket = "QR_TO_TICKET"
    case ticket_to_amount = "TICKET_TO_AMOUNT"
    case confirm_amount = "CONFIRM_AMOUNT"
    case dont_buy = "DONTBUY"
    case buy = "BUY"
    case sell = "SELL"
    case dont_sell = "DONTSELL"
}

public enum APIDomain: String{
    case Socket = "https://"
}

public class JsonHelper{
    private init(){
        
    }
    
    public static func toDict(text: String) -> [String: Any]?{
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    public static func toArray(text: String)->[Any]?{
        if let data = text.data(using: .utf8) {
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            let array = json as? [Any]
            return array
        }else{
            return nil
        }
        return nil
    }
    
    public static func toString(dict:[String:Any]) -> String{
        let data = try! JSONSerialization.data(withJSONObject: dict)
        let result = String(data: data, encoding: .utf8)
        return result!
    }
    
    public static func toString(dict:[String:Any], prettyPrint:Bool) -> String{
        let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
        let result = String(data: data, encoding: .utf8)
        return result!
    }
}
