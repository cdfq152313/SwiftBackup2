//
//  DialogFactory.swift
//  MyDialog
//
//  Created by 鄭翔元 on 2017/7/11.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class DialogFactory{
    
    public static func confirmOrder(amount:String)->UIAlertController{
        let alert = UIAlertController(title: nil, message: "\n\n\n\n\n", preferredStyle: .alert)
        
//        alert.view.backgroundColor = UIColor.cyan
        
        // Amount
        let amountLabel = UILabel()
        amountLabel.text = amount
        amountLabel.textColor = UIColor(red:0.00, green:0.46, blue:1.00, alpha:1.0)
        amountLabel.font = amountLabel.font.withSize(40)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(amountLabel)
        
        // tip
        let tipLabel = UILabel()
        tipLabel.text = "請確認金額是否正確"
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(tipLabel)
        
        // ok
        let okAction = UIAlertAction(title: "正確", style: .default, handler: nil)
        alert.addAction(okAction)
        
        // cancel
        let cancelAction = UIAlertAction(title: "返回修正", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        
        // amount Constraint
        amountLabel.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor, constant: -40).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        // tip constranit
        tipLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 10).isActive = true
        tipLabel.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        return alert
    }
    
    public static func waitingTraveler()->UIAlertController{
        let alert = UIAlertController(title: nil, message: "\n\n\n\n\n", preferredStyle: .alert)
        
//        alert.view.backgroundColor = UIColor.cyan
        
        // dots loading view
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let color = UIColor(red:0.00, green:0.46, blue:1.00, alpha:1.0)
        let loadingView = NVActivityIndicatorView(frame: frame, type: .ballPulse, color: color, padding: 0)
        loadingView.startAnimating()
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(loadingView)
        
        // tip
        let tipLabel = UILabel()
        tipLabel.text = "請稍等，旅客確認中..."
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(tipLabel)
        
        // cancel
        let cancelAction = UIAlertAction(title: "取消送出", style: .destructive, handler: nil)
        alert.addAction(cancelAction)
        
        // loading Constraint
        loadingView.widthAnchor.constraint(equalToConstant: 100)
        loadingView.heightAnchor.constraint(equalToConstant: 100)
        loadingView.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor, constant: -40).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        // tip constranit
        tipLabel.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: 10).isActive = true
        tipLabel.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        return alert
    }
    
    public static func submitSuccessfully()->UIAlertController{
        let alert = UIAlertController(title: nil, message: "\n\n\n\n\n", preferredStyle: .alert)
        
        //        alert.view.backgroundColor = UIColor.cyan
        
        // image view
        let imageView = UIImageView(image: #imageLiteral(resourceName: "check"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(imageView)
        
        // tip
        let tipLabel = UILabel()
        tipLabel.text = "旅客確認完成"
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        alert.view.addSubview(tipLabel)
        
        // cancel
        let cancelAction = UIAlertAction(title: "旅客確認完成", style: .default, handler: nil)
        alert.addAction(cancelAction)
        
        // image Constraint
        imageView.widthAnchor.constraint(equalToConstant: 50)
        imageView.heightAnchor.constraint(equalToConstant: 50)
        imageView.centerYAnchor.constraint(equalTo: alert.view.centerYAnchor, constant: -40).isActive = true
        imageView.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        // tip constranit
        tipLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        tipLabel.centerXAnchor.constraint(equalTo: alert.view.centerXAnchor).isActive = true
        
        return alert
    }
}
