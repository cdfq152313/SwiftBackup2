//
//  AESHelper.swift
//  MyEncrypter
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import Foundation
import Security
import CryptoSwift

class AESHelper {
    
    public static func genAESKey() -> Array<UInt8>{
        let bytesCount = 32
        var randomBytes = Array<UInt8>(repeating: 0, count: bytesCount)
        let _ = SecRandomCopyBytes(kSecRandomDefault, bytesCount, &randomBytes)
        return Data(bytes: randomBytes, count: bytesCount).bytes
    }
    
    public static func genIV() -> Array<UInt8>{
        return AES.randomIV(AES.blockSize)
    }
    
    public static func encrypt(content: String, key: Array<UInt8>, iv: Array<UInt8>) throws -> String?{
        guard let data = content.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        let enc = try AES(key: key, iv: iv, blockMode:.CBC, padding:PKCS7()).encrypt(data)
        let encData = Data(bytes: enc, count: Int(enc.count))
        let base64String: String = encData.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
        let result = String(base64String)
        return result
    }
    
    public static func decrypt(content: String, key: Array<UInt8>, iv: Array<UInt8>) throws -> String? {
        guard let data = Data(base64Encoded: content, options: NSData.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        let dec = try AES(key: key, iv: iv, blockMode:.CBC, padding:PKCS7()).decrypt(data)
        let decData = Data(bytes: dec, count: Int(dec.count))
        let result = NSString(data: decData, encoding: String.Encoding.utf8.rawValue)
        return String(result!)
    }
    
}
