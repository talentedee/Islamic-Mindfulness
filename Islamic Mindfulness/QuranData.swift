import Foundation
//QuranData.swift

struct Reciter: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let audioURL: URL?
    
    static func == (lhs: Reciter, rhs: Reciter) -> Bool {
        lhs.id == rhs.id
    }
}


struct Surah: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let reciters: [Reciter]
    
    static func == (lhs: Surah, rhs: Surah) -> Bool {
        lhs.id == rhs.id
    }
}

let totalSurahs = 114
let recitersPerSurah = 1
let totalReciters = 9

let surahNames = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aali Imran",
    "An-Nisa",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajdah",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiyah",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'ah",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahinah",
    "As-Saff",
    "Al-Jumu'ah",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyinah",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'ah",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Lahab",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas",

]

func generateSurahs() -> [Surah] {
    var surahs: [Surah] = []
    
    for surahNumber in 1...totalSurahs {
        var reciters: [Reciter] = []
        
        for reciterNumber in 1...totalReciters {
            let reciterName: String
            
            if reciterNumber == 1 {
                reciterName = "Al-Hussary"
            } else if reciterNumber == 2 {
                reciterName = "Al-Minshawy"
            } else if reciterNumber == 3 {
                reciterName = "Abdul-Basit"
            } else if reciterNumber == 4 {
                reciterName = "Al-Muaiqly"
            }else if reciterNumber == 5 {
                reciterName = "Fares Abbad"
            }else if reciterNumber == 6 {
                reciterName = "Nasser Alqatami"
            }else if reciterNumber == 7 {
                reciterName = "Al-Sudais"
            }else if reciterNumber == 8 {
                reciterName = "Yasser Aldossari"
            }else if reciterNumber == 9 {
                reciterName = "Al-Banna"
            } else {
                reciterName = "Al-Minshawy"
            }
            
            let audioURL = QuranURLs.audioURL(forSurah: surahNumber, reciterNumber: reciterNumber)
            let reciter = Reciter(name: reciterName, audioURL: audioURL)
            reciters.append(reciter)
        }
        
        let surahName = surahNames[surahNumber - 1] // Subtract 1 because array is zero-indexed
        let surah = Surah(name: surahName, reciters: reciters)
        surahs.append(surah)
    }
    
    return surahs
}

let surahs = generateSurahs()
