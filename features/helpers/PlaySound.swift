import AVFoundation

class AudioManager {
    static let shared = AudioManager()
    var audioPlayer: AVAudioPlayer?

    private init() {}

    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.numberOfLoops = -1
                audioPlayer?.play()
            } catch {
                print("ERROR: Could not find and play the sound file!")
            }
        } else {
            print("ERROR: Sound file not found!")
        }
    }

    func play() {
        audioPlayer?.play()
    }

    func pause() {
        audioPlayer?.pause()
    }

    func stop() {
        audioPlayer?.stop()
    }
}
