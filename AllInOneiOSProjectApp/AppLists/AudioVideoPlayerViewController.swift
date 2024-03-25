//
//  AudioVideoPlayerViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 14/04/23.
//

import UIKit
import AVKit

class Sliderthread :Thread
{
    var viewCon : AudioVideoPlayerViewController?
    override func main() {
        while self.viewCon!.player!.isPlaying {
            DispatchQueue.main.async {
                self.viewCon!.slider.value = Float(self.viewCon!.player!.currentTime)

            }
            Thread.sleep(forTimeInterval: 0.2)
        }
    }
}

class AudioVideoPlayerViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var gradientView: UIView!
    
    var player : AVAudioPlayer?
    private var gradientLayer: CAGradientLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle.main
        let filepath = bundle.path(forResource: "HARHAR", ofType: "mp3")
        print(filepath!)
        let fileURL = URL(fileURLWithPath: filepath!)
        do {
            player = try AVAudioPlayer(contentsOf: fileURL)
            
        }
        catch{
            print("Error : ",error)
        }
        updateGradient()
    }
   
    private func updateGradient() {
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer?.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor] // Update colors to include 3 colors
            gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer?.endPoint = CGPoint(x: 1, y: 1) // Set the end point of the gradient
            gradientView.layer.insertSublayer(gradientLayer!, at: 0) // Add the gradient layer as a sublayer to the gradientView
        }
        gradientLayer?.frame = gradientView.bounds // Set the gradient layer's frame to match the gradientView's bounds
    }
    
    @IBAction func play(_ sender: Any) {
        player!.play()
        slider.maximumValue = Float(player!.duration)
        let startthread = Sliderthread()
        startthread.viewCon = self
        startthread.name = "Slider Thread"
        startthread.start()
    }
    @IBAction func pause(_ sender: Any) {
        player!.pause()
    }
    
    @IBAction func playvedio(_ sender: Any) {
        let videoURL = Bundle.main.url(forResource: "Rafta Rafta (Official Song Video) - Namastey London - Akshay Kumar & Katrina Kaif", withExtension: "mp4")
        print("videoURL -",videoURL ?? "")
        if let videoURL = videoURL {
            let playerViewController = AVPlayerViewController()
            let player = AVPlayer(url: videoURL)
            playerViewController.player = player
            
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        } else {
            print("Video file not found")
        }
    }
}

