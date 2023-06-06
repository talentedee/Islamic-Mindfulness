import Foundation
//QuranURLs.swift

public struct QuranURLs {
    static let alhussaryBaseURL = "https://server13.mp3quran.net/husr/"
    static let alminshawyBaseURL = "https://server10.mp3quran.net/minsh/"
    static let abdulbasitBaseURL = "https://server13.mp3quran.net/basit_mjwd/"
    static let almuaiqlyBaseURL = "https://server12.mp3quran.net/maher/"
    static let faresabbadBaseURL = "https://server8.mp3quran.net/frs_a/"
    static let alqatamiBaseURL = "https://server6.mp3quran.net/qtm/"
    static let alsudaisBaseURL = "https://server11.mp3quran.net/sds/"
    static let aldossariBaseURL = "https://server11.mp3quran.net/yasser/"
    static let albannaBaseURL = "https://server8.mp3quran.net/bna/"
    
    static func audioURL(forSurah surahNumber: Int, reciterNumber: Int) -> URL {
        let baseURL: String
        let formattedSurahNumber = String(format: "%03d", surahNumber)
        
        if reciterNumber == 1 {
            baseURL = alhussaryBaseURL
        } else if reciterNumber == 2 {
            baseURL = alminshawyBaseURL
        }else if reciterNumber == 3 {
            baseURL = abdulbasitBaseURL
        }else if reciterNumber == 4 {
            baseURL = almuaiqlyBaseURL
        }else if reciterNumber == 5 {
            baseURL = faresabbadBaseURL
        }else if reciterNumber == 6 {
            baseURL = alqatamiBaseURL
        }else if reciterNumber == 7 {
            baseURL = alsudaisBaseURL
        }else if reciterNumber == 8 {
            baseURL = aldossariBaseURL
        }else if reciterNumber == 9 {
            baseURL = albannaBaseURL
        } else {
            baseURL = alminshawyBaseURL
        }
        
        let urlString = "\(baseURL)\(formattedSurahNumber).mp3"
        return URL(string: urlString)!
    }
}
