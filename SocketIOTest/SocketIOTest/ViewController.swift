//
//  ViewController.swift
//  SocketIOTest
//
//  Created by 鄭翔元 on 2017/7/7.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit
import SocketIO

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var socket:SocketIOClient?
    
    

    @IBAction func oneClick(_ sender: Any) {
        if socket != nil{
            go()
        }else{
            initSocket()
        }
    }
    
    func initSocket(){
        let url = URL(string: "https://dev.socket.uchange2.com")!
        socket = SocketIOClient(socketURL: url)
        socket?.connect()
    }
    
    func go(){
        socket?.emit("DEBUG", "12333333333")
    }
    
    @IBAction func twoClick(_ sender: Any) {
        if manager == nil{
            initManager()
        }else{
            goManager()
        }
    }
    
    var manager:SocketIOManager?
    
    func initManager(){
        manager = SocketIOManager(uuid: "595a5dab-c5ae-43bd-a652-ae6566bc80c2")
        manager?.start()
    }
    
    func goManager(){
        manager?.sendAction(action: .buy)
    }
}

