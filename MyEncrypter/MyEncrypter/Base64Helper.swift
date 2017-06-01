//
//  Base64Helper.swift
//  MyEncrypter
//
//  Created by 鄭翔元 on 2017/6/1.
//  Copyright © 2017年 Addweup. All rights reserved.
//

import Foundation

class Base64Helper{
    public static func b64ToBytes(_ b64String:String) -> Array<UInt8>?{
        return Data(base64Encoded: b64String)?.bytes
    }
}
