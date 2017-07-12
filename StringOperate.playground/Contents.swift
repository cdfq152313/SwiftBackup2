//: Playground - noun: a place where people can play

import Foundation

var str = "Hello, playground"


func timeOnly(_ datetime:String?)->String{
    guard let time = datetime else {
        return "No time"
    }
    let start = time.index(time.startIndex, offsetBy: 11)
    let end = time.index(time.startIndex, offsetBy: 16)
    let range = Range(start..<end)
    return time.substring(with: range)
}

func dateOnly(_ datetime:String?)->String{
    guard let time = datetime else {
        return "No date"
    }
    
    let start = time.index(time.startIndex, offsetBy: 5)
    let end = time.index(time.startIndex, offsetBy: 10)
    let range = Range(start..<end)
    return time.substring(with: range)
}

func main(){
    let datetime = "2017-07-06 15:17:54"
    let date = dateOnly(datetime)
    let time = timeOnly(datetime)
    print("date:", date)
    print("time:", time)
}

main()