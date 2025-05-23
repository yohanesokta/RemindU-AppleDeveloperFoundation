import Foundation
import SwiftData

struct Tahapan: Identifiable {
    var id: UUID = UUID()
    var name : String
    var jumlah : Int
    var jenis : String
}

extension Tahapan {
    static var Default : [Tahapan] = [
        Tahapan(name: "Intensif", jumlah: 56, jenis: "RHZE (150/75/400/275)"),
        Tahapan(name: "Lanjutan", jumlah: 16*7, jenis: "RH (150/150)")
    ]
}

func obatRegimen(weight: Int) -> String {
    switch weight {
    case 30...37:
        return "2 Tablet 4 KDT"
    case 38...59:
        return "3 Tablet 4 KDT"
    case 60...70:
        return "4 Tablet 4 KDT"
    case 71...150:
        return "5 Tablet 4 KDT"
    default:
        return "1 Tablet 4 KDT"
    }
}



@Model
class LocalData:Identifiable {
    @Attribute(.unique) var id: UUID
    var obatName : String
    var date : Int
    var taken : Bool
    var comments : String?
    init(date:Int, obatName:String,taken:Bool,comment:String?) {
        self.date = date
        self.id = UUID()
        self.obatName = obatName
        self.taken = taken
        self.comments = comment
    }
}



import Foundation


func dateFromNumber(_ number: Int) -> Date? {
    let year = number / 10000
    let month = (number / 100) % 100
    let day = number % 100
    
    var components = DateComponents()
    components.year = year
    components.month = month
    components.day = day
    
    return Calendar.current.date(from: components)
}



func getTodayAsNumber(date:Date = Date()) -> Int {
    let calendar = Calendar.current
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)
    return year * 10000 + month * 100 + day
}


func hasPassedDays(startDateNumber: Int, offsetDays: Int) -> Bool {
    guard let startDate = dateFromNumber(startDateNumber) else {
        return false
    }
    
    let calendar = Calendar.current
    guard let targetDate = calendar.date(byAdding: .day, value: offsetDays, to: startDate) else {
        return false
    }
    
    let today = calendar.startOfDay(for: Date())
    return today >= targetDate
}


func daysSince(startDateNumber: Int) -> Int? {
    guard let startDate = dateFromNumber(startDateNumber) else {
        return nil
    }

    let calendar = Calendar.current
    let today = calendar.startOfDay(for: Date())
    let start = calendar.startOfDay(for: startDate)
    
    let components = calendar.dateComponents([.day], from: start, to: today)
    return components.day
}

func compareDateNumbers(_ first: Int, _ second: Int) -> Int {
    guard let date1 = dateFromNumber(first),
          let date2 = dateFromNumber(second) else {
        return -1 
    }

    let calendar = Calendar.current
    let start1 = calendar.startOfDay(for: date1)
    let start2 = calendar.startOfDay(for: date2)
    if start1 == start2 {
        return 0
    } else if start1 < start2 {
        return 1
    } else {
        return -1
    }
}


func convertDate(_ input: String) -> String {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyyMMdd"
    
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "MMMM d" // "May 19"
    
    if let date = inputFormatter.date(from: input) {
        return outputFormatter.string(from: date)
    } else {
        return "Invalid date"
    }
}
