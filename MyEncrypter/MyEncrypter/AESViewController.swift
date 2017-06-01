//
//  AESViewController.swift
//  MyEncrypter
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit

class AESViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var display: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func genAES(_ sender: Any) {
        let key = AESHelper.genAESKey()
        let b64Key = key.toBase64()
        label1.text = b64Key
    }
    
    @IBAction func genIV(_ sender: Any) {
        let iv = AESHelper.genIV()
        let b64IV = iv.toBase64()
        label2.text = b64IV
    }
    
    @IBAction func encrypt(_ sender: Any) {
        // 初始化
        let content = display.text!
        guard let key = Base64Helper.b64ToBytes(label1.text!) else {
            label3.text = "key error"
            return
        }
        guard let iv = Base64Helper.b64ToBytes(label2.text!) else{
            label3.text = "iv error"
            return
        }
        
        // 加密
        do{
            let result = try AESHelper.encrypt(content: content, key: key, iv: iv)
            display.text = result
            label3.text = "Encrypt successffully"
        }
        catch{
            label3.text = "Encrypt failed"
        }
    }
    
    @IBAction func decrypt(_ sender: Any) {
        // 初始化
        let content = display.text!
        guard let key = Base64Helper.b64ToBytes(label1.text!) else{
            label4.text = "key error"
            return
        }
        guard let iv = Base64Helper.b64ToBytes(label2.text!) else{
            label4.text = "iv error"
            return
        }
        
        // 解密
        do{
            let result = try AESHelper.decrypt(content: content, key: key, iv: iv)
            display.text = result
            label4.text = "Decrypt successffully"
        }
        catch{
            label4.text = "Decrypted Failed"
        }
    }
    
    @IBAction func export(_ sender: Any) {
        print ("Key: ", label1.text!)
        print ("IV: ", label2.text!)
    }
}
