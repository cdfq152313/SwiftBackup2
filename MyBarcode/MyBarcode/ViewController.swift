//
//  ViewController.swift
//  MyBarcode
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var messageLabel: UILabel!
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initCaptureSession()
        initVideoPreview()
        captureSession?.startRunning()
        view.bringSubview(toFront: messageLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCaptureSession(){
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else{
            print("Get input error")
            return
        }
        
        // Add input
        captureSession = AVCaptureSession()
        captureSession?.addInput(input)
        
        // Add output
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureSession?.addOutput(captureMetadataOutput)
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypePDF417Code]
    }
    
    func initVideoPreview(){
        guard let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession) else{
            print("Init preview failed")
            return
        }
        
        videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
    }
    
    func initQRCodeFrameView(){
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView?.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubview(toFront: qrCodeFrameView!)
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        guard metadataObjects != nil && metadataObjects.count != 0 else{
            return
        }
        
        guard let metadataObj = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else{
            print("MetadataObj type is not correct")
            return
        }
        
        messageLabel.text = metadataObj.stringValue
    }

}

