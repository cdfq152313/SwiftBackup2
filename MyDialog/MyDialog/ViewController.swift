//
//  ViewController.swift
//  MyDialog
//
//  Created by 鄭翔元 on 2017/7/11.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
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
}

