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

func obatRegimen(umur: Int) -> String {
    switch umur {
    case 30...37:
        return "2 Tablet 4 KDT"
    case 38...59:
        return "3 Tablet 4 KDT"
    case 60...70:
        return "4 Tablet 4 KDT"
    default:
        return "5 Tablet 4 KDT"
    }
}
