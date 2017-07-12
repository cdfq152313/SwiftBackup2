//: Playground - noun: a place where people can play

import Foundation


func isUUID(_ text:String)->Bool{
    let pattern = "^\\p{Alnum}{8}-\\p{Alnum}{4}-\\p{Alnum}{4}-\\p{Alnum}{4}-\\p{Alnum}{12}$"
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: text.characters.count)
    let match = regex.firstMatch(in: text, options: [], range: range)
    if match != nil{
        return true
    }else{
        return false
    }
}

func main(_ arg:String){
    print("Argument:", arg)
    if isUUID(arg){
        print("is uuid")
    }else{
        print("not uuid")
    }
}

//main("hello world")
//main("54d6cb46-7e34-4967-aeca-66920b02c0f9")
//main("balaponpa")
//main("29ef9a02-6dee-4243-bab3-25e405c87d18")


var boardingPassPattern:String{
    let white = "\\s+"
    
    let namePat1 = "\\p{Alnum}{2}(\\p{Alpha}+)/(\\p{Alpha}+ ?\\p{Alpha}*)"
    let namePat2 = "\\p{Alnum}{2}(\\p{Alpha}+)\\s{1,2}(\\p{Alpha}+)"
    let namePat = "((" + namePat1 + ")|(" + namePat2 + "))"
    let recordPat = "E?(\\p{Alnum}+)"
    let airport = "(\\p{Alnum}{3})(\\p{Alnum}{3})(\\p{Alnum}{2})"
    let flightNumberPat = "(\\d+)"
    let flightTimePat = "(\\d{3})\\p{Alnum}+"
    let pattern = namePat + white + recordPat + white + airport + white + flightNumberPat + white + flightTimePat
    return pattern
}

func isBoardingPass(_ text:String) -> Bool{
    let regex = try! NSRegularExpression(pattern: boardingPassPattern, options: [])
    let range = NSRange(location: 0, length: text.characters.count)
    
    if let _ = regex.firstMatch(in: text, options: [], range: range){
        return true
    }else{
        return false
    }
}

func main2(_ arg:String){
    print("Argument:", arg)
    if isBoardingPass(arg){
        print("is boarding pass")
    }else{
        print("not boarding pass")
    }
}

//main2("M1TENG/PEICHIH        E8SGE2T HKGTPECX 0406 004Y049K0054 34A>1180 O    B                29                  CX 1561906564          8GR")
//main2("M1KUO/YICHENG         EZ8CRMZ SEATPEBR 0025 310Y056B0091 35C>2180  5310BBR 06958545600013E69524358558360                           *30601023K09")
//main2("M1TENG/PEICHIH        E8SGE2T BKKHKGCX 0708 003Y043H0257 14E>10B0MW7003BCX 291602356196565 1CX CX 1561906564       20K8GR708")
//main2("M1CHOI/MOONYOUNG      EYBS7IC ICNJFKKE 0081 009Y035B0033 34C>5180  7008B1A 01803451270012A18011460826170 KE KE 114528792809        NTB")
//main2("M1ARIEFBASLY  MUHAMMAD YPFFUB PDGHLPID 7106 008Z002F0014")
//main2("M1CHEN/HUNGHUA        ELLTGBB EUGSFOUA 5392 096Y00000000 15C>3180 M6096BUA 40166368870022901677527786970 UA                        *30602    09         ^160MEUCIDIwH5XYzY5434h14zV6NIFTEtIDHVoldR4/o502EZ97AiEAzicMLPnzhFagyYptbsF1KKYG4K4snDWAFMS1p7znC0I=")
//main2("hello moto")
//main2("M1CHEN/HUNGHUA ")


class BoardingPass{
    var given_name:String?
    var family_name:String?
    var departure:String?
    var arrival:String?
    var flight_num:String?
    var booking_ref_num:String?
    var departure_date:String?
    var julian_date:String?
    var airline_id:String?
    var raw_data:String?
    
    func toDict()->[String:Any]{
        return [
            "given_name":given_name,
            "family_name":family_name,
            "departure":departure,
            "arrival":arrival,
            "flight_num":flight_num,
            "booking_ref_num":booking_ref_num,
            "departure_date":departure_date,
            "julian_date":julian_date,
            "airline_id":airline_id,
            "raw_data":raw_data,
        ]
    }
}

func parseBoardingPass(_ text:String){
    let regex = try! NSRegularExpression(pattern: boardingPassPattern, options: [])
    let range = NSRange(location: 0, length: text.characters.count)
    
    guard let match = regex.firstMatch(in: text, options: [], range: range) else{
        return
    }
    
    var count = 0
    var boardingPass = BoardingPass()
    for n in 0..<match.numberOfRanges{
        if let range = match.rangeAt(n).toRange(){
            count += 1
            let r = text.index(text.startIndex, offsetBy: range.lowerBound)..<text.index(text.startIndex, offsetBy: range.upperBound)
            let sub = text.substring(with: r)
            switch count {
            case 1:
                ()
            case 2:
                ()
            case 3:
                ()
            case 4:
                boardingPass.family_name = sub
            case 5:
                boardingPass.given_name = sub
            case 6:
                boardingPass.booking_ref_num = sub
            case 7:
                boardingPass.departure = sub
            case 8:
                boardingPass.arrival = sub
            case 9:
                boardingPass.airline_id = sub
            case 10:
                boardingPass.flight_num = sub
            case 11:
                boardingPass.julian_date = sub
            default:
                ()
            }
        }
    }
    print("count:", count)
    print(boardingPass.toDict().description)
}

func main3(_ arg:String){
    print("=== BoardingPass ===")
    print(arg)
    parseBoardingPass(arg)
}

main3("M1TENG/PEICHIH        E8SGE2T HKGTPECX 0406 004Y049K0054 34A>1180 O    B                29                  CX 1561906564          8GR")
main3("M1KUO/YICHENG         EZ8CRMZ SEATPEBR 0025 310Y056B0091 35C>2180  5310BBR 06958545600013E69524358558360                           *30601023K09")
main3("M1TENG/PEICHIH        E8SGE2T BKKHKGCX 0708 003Y043H0257 14E>10B0MW7003BCX 291602356196565 1CX CX 1561906564       20K8GR708")
main3("M1CHOI/MOONYOUNG      EYBS7IC ICNJFKKE 0081 009Y035B0033 34C>5180  7008B1A 01803451270012A18011460826170 KE KE 114528792809        NTB")
main3("M1ARIEFBASLY  MUHAMMAD YPFFUB PDGHLPID 7106 008Z002F0014")
main3("M1CHEN/HUNGHUA        ELLTGBB EUGSFOUA 5392 096Y00000000 15C>3180 M6096BUA 40166368870022901677527786970 UA                        *30602    09         ^160MEUCIDIwH5XYzY5434h14zV6NIFTEtIDHVoldR4/o502EZ97AiEAzicMLPnzhFagyYptbsF1KKYG4K4snDWAFMS1p7znC0I=")


func easyParse(_ text:String){
    let pattern = "(\\p{Alpha}+)/(\\p{Alpha}+)"
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: text.characters.count)
    
    guard let match = regex.firstMatch(in: text, options: [], range: range) else{
        return
    }
    
    for n in 0..<match.numberOfRanges{
        if let range = match.rangeAt(n).toRange(){
            print(range.lowerBound, range.upperBound)
            let r = text.index(text.startIndex, offsetBy: range.lowerBound)..<text.index(text.startIndex, offsetBy: range.upperBound)
            let sub = text.substring(with: r)
            print(sub)
        }
    }
}

func main4(_ arg:String){
    print("== Arg: \(arg) ===")
    easyParse(arg)
}

//main4("hello/world")
//main4("pala ponpon baba")
//main4("haef fasdf_ aa")
//main4("hello a")
