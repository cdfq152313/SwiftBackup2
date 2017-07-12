//
//  ViewController.swift
//  MyHttpAndJson
//
//  Created by 鄭翔元 on 2017/6/19.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickButton(_ sender: Any) {
        let data = Data1()
        print(data.toJsonString())
    }
    
    @IBAction func clickFromString(_ sender: Any) {
        let str = "{\"a\": 3, \"b\":null }"
        let data = Data1(json: str)
        print(data)
    }
    
    @IBAction func fromString2(_ sender: Any) {
        let str = "{\"a\": 11, \"c\":\"apple\"}"
        let data = Data1(json: str)
        print(data)
    }
}
