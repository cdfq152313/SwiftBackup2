//: Playground - noun: a place where people can play

import Foundation

func toDict(text: String) -> [String: Any]?{
    if let data = text.data(using: .utf8) {
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        return json as? [String: Any]
    }else{
        return nil
    }
}

func toArray(text: String)->[Any]?{
    if let data = text.data(using: .utf8) {
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        let array = json as? [Any]
        return array
    }else{
        return nil
    }
}

func toString(dict:[String:Any]) -> String{
    let data = try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    let result = String(data: data, encoding: .utf8)
    return result!
}


func decimalParse(){
    let text = "{\"a\": 2.7777777777777777777}"
    guard let dict = toDict(text: text) else{
        print("to dict error")
        return
    }
    let value = dict["a"]!
    let value2 = String(describing: value)
    let result = Decimal(string: value2)!
    print(result)
}

decimalParse()


func decimalToDict(){
    let value = Decimal(string: "1235.88888888888888888888888888888888888888888888")!
    let x:[String:Any] = ["a":value]
    let result = toString(dict: x)
    print(result)
}

decimalToDict()
