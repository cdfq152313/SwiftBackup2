//
//  ViewController.swift
//  MyDialog
//
//  Created by 鄭翔元 on 2017/7/11.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func oneClick(_ sender: Any) {
        let dialog = DialogFactory.confirmOrder(amount: "101")
        present(dialog, animated: true, completion: nil)
    }

    @IBAction func twoClick(_ sender: Any) {
        let dialog = DialogFactory.waitingTraveler()
        present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func threeClick(_ sender: Any) {
        let dialog = DialogFactory.submitSuccessfully()
        present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func fourClick(_ sender: Any) {
        let x = Product()
        x.title = "台灣啤酒精裝組"
        x.price = "2500"
        let helper = DialogFactory.startPromotion(product: x, countDown: 5)
        present(helper.controller, animated: true, completion: helper.update)
    }
    
    @IBAction func fiveClick(_ sender: Any) {
        
    }
    
    @IBAction func sixClick(_ sender: Any) {
        
    }
    
    @IBAction func sevenClick(_ sender: Any) {
        
    }
    
    @IBAction func eightClick(_ sender: Any) {
        
    }
    
}

public class Product{
    var title:String?
    var price:String?
}
