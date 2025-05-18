import Foundation

struct UserData: Codable, Identifiable {
    var id: UUID
    var startedDay: Int
    var weight: Int
    var jenisObat: String
    var tahapan: Int

    init(startedDay: Int, weight: Int, jenisObat: String, tahapan: Int) {
        self.id = UUID()
        self.startedDay = startedDay
        self.weight = weight
        self.jenisObat = jenisObat
        self.tahapan = tahapan
    }
}

func getDocumentsDirectory() -> URL? {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
}


func saveUserDataToJSON(_ user: UserData) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted

    do {
        let data = try encoder.encode(user)
        if let url = getDocumentsDirectory()?.appendingPathComponent("userdata.json") {
            try data.write(to: url)
            print("Data berhasil disimpan di: \(url.path)")
        }
    } catch {
        print("Gagal menyimpan JSON: \(error)")
    }
}


func loadUserDataFromJSON() -> UserData? {
    if let url = getDocumentsDirectory()?.appendingPathComponent("userdata.json") {
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(UserData.self, from: data)
            return decoded
        } catch {
            print("Gagal membaca JSON: \(error)")
        }
    }
    return nil
}
