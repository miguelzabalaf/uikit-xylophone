import UIKit
import AVFoundation

struct PlaySoundProps {
    var resourceName: String
}

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        let resouceName = sender.title(for: .normal) ?? ""
        let playSoundProps = PlaySoundProps(resourceName: resouceName)
        playSound(props: playSoundProps )
    }
    
    func playSound(props: PlaySoundProps) {
        let resourceName = props.resourceName;
        if !resourceName.isEmpty {
            let url = Bundle.main.url(forResource: resourceName, withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        } else {
            print("Cannot render a sound")
        }
    }
}
