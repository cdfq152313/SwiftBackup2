//: Playground - noun: a place where people can play

import Foundation

// 注意HH大寫才是24小時制，小寫是12小時制
let format = "yyyy-MM-dd HH:mm:ss"

func availableTimeZone(){
    print(TimeZone.knownTimeZoneIdentifiers)
}

func toDate(fromGMTString string: String)->Date{
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.timeZone = TimeZone(identifier: "GMT")
    
    return formatter.date(from: string)!
}

func toDate(fromLocalString string: String)->Date{
    let formatter = DateFormatter()
    formatter.dateFormat = format
    
    return formatter.date(from: string)!
}

func toGMTDateComponents(date:Date)->DateComponents{
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents(in: TimeZone(identifier: "GMT")!, from: date)
    return dateComponents
}

func toLocalDateComponents(date:Date)->DateComponents{
    let calendar = Calendar.current
    let dateComponents = calendar.dateComponents(in: calendar.timeZone, from: date)
    return dateComponents
}

func toGMTString(date:Date)->String{
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.timeZone = TimeZone(identifier: "GMT")
    return formatter.string(from: date)
}

func toLocalString(date:Date)->String{
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: date)
}

func currentGMTDateComponents()->DateComponents{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .hour, value: 1, to: Date())!
    let dateComponents = calendar.dateComponents(in: TimeZone(identifier: "GMT")!, from: date)
    return dateComponents
}

func main(){
    print("==== main ====")
    let date = toDate(fromGMTString: "2016-06-03 14:24:59")
    print("GMT:", toGMTString(date: date))
    print("Local:", toLocalString(date: date))
    
    let x = toGMTDateComponents(date:date)
    let y = toLocalDateComponents(date:date)
    print("GMT Components:", "\(x.year!)-\(x.month!)-\(x.day!) \(x.hour!):\(x.minute!):\(x.second!)")
    print("Local Components:", "\(y.year!)-\(y.month!)-\(y.day!) \(y.hour!):\(y.minute!):\(y.second!)")
}

func main2(){
    print("==== main2 ====")
    let date = toDate(fromLocalString: "2016-06-03 20:24:59")
    print("GMT:", toGMTString(date: date))
    print("Local:", toLocalString(date: date))
    
    let x = toGMTDateComponents(date:date)
    let y = toLocalDateComponents(date:date)
    print("GMT Components:", "\(x.year!)-\(x.month!)-\(x.day!) \(x.hour!):\(x.minute!):\(x.second!)")
    print("Local Components:", "\(y.year!)-\(y.month!)-\(y.day!) \(y.hour!):\(y.minute!):\(y.second!)")
}

func main3(){
    print("==== main3 ====")
    let x = currentGMTDateComponents()
    print("GMT Components:", "\(x.year!)-\(x.month!)-\(x.day!) \(x.hour!):\(x.minute!):\(x.second!)")
}

//main()
//
//main2()
//
//main3()

let gmtZone = TimeZone(identifier: "GMT")!

func toFormatDate(julianDate:String)->String{
    var addNumber = 0
    if let num = Int(julianDate){
        addNumber = num - 1
    }
    
    var calendar = Calendar.current
    calendar.timeZone = gmtZone
    
    let startDate = getFirstDayInYear(calendar)
    let ticketDate = calendar.date(byAdding: .day, value: addNumber, to: startDate)!
    let result = toGMTString(date: ticketDate)
    
    return result.substring(to: result.index(result.startIndex, offsetBy: 10))
}

func getFirstDayInYear(_ calendar:Calendar)->Date{
    let date = Date()
    var dateComponent = calendar.dateComponents([.year], from: date)
    dateComponent.month = 1
    dateComponent.day = 1
    return calendar.date(from: dateComponent)!
}


func main4(){
    let date = toFormatDate(julianDate: "200")
    print(date)
}

main4()