//
//  RSAViewController.swift
//  MyEncrypter
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit
import SwiftyRSA

class RSAViewController: UIViewController{
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var display: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var key:PublicKey?
    
    @IBAction func getRSAKey(_ sender: Any) {
        guard let key = RSAHelper.loadPublicKey(pubpemString: RSAHelper.pubpemString) else {
            label1.text = "Init RSA key failed"
            return
        }
        label1.text = try! key.base64String()
        self.key = key
    }
    
    @IBAction func encrypt(_ sender: Any) {
        guard let key = self.key else{
            label2.text = "No key"
            return
        }
        
        let result = try? RSAHelper.encrypt(content: display.text!, key: key)
        display.text = result!
        print("Display:", result!)
    }
    
    @IBAction func decrypt(_ sender: Any) {
        
    }
    
    @IBAction func export(_ sender: Any) {
        guard let key = try! self.key?.base64String() else{
            return
        }
        print(key)
    }
}
