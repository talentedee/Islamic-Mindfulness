import SwiftUI
import AVKit
//QuranView.swift

struct QuranView: View {
    @State private var selectedSurah: Surah? // Track the selected Surah
    
    var body: some View {
        VStack {
            Text("Quran Player")
                .font(.title)
                .foregroundColor(Color.black)
                .padding()

            List(surahs) { surah in
                DisclosureGroup(
                    isExpanded: Binding(
                        get: { selectedSurah == surah },
                        set: { isExpanded in
                            if isExpanded {
                                selectedSurah = surah // Expand the Surah
                            } else if selectedSurah == surah {
                                selectedSurah = nil // Collapse the Surah
                            }
                        }
                    ),
                    content: {
                        ForEach(surah.reciters) { reciter in
                            ReciterButton(reciter: reciter)
                        }
                    },
                    label: {
                        Text(surah.name)
                    }
                )
            }

            Spacer()
        }
    }
}

struct ReciterButton: View {
    let reciter: Reciter
    @State private var isPlaying: Bool = false
    private var lastPlayedTime: CMTime?

    init(reciter: Reciter) { // Update the access level to at least internal
        self.reciter = reciter
    }

    var body: some View {
        HStack {
            Text(reciter.name)
                .padding(.vertical, 8)

            Spacer()

            Button(action: {
                if isPlaying {
                    pauseRecitation()
                } else {
                    if let lastPlayedTime = QuranPlayer.lastPlayedTime, QuranPlayer.currentReciter == reciter {
                        resumeRecitation(from: lastPlayedTime)
                    } else {
                        playRecitation(reciter: reciter)
                    }
                }
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.blue)
            }
        }
        .padding(.horizontal)
    }
}


struct QuranView_Previews: PreviewProvider {
    static var previews: some View {
        QuranView()
    }
}
