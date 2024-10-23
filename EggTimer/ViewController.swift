//
//  ViewController.swift
//  EggTimer
//
//  Created by Ляззат Аманбаева on 22.10.2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var hardBoiledButton: UIButton!
    @IBOutlet weak var mediumBoiledButton: UIButton!
    @IBOutlet weak var softBoiledButton: UIButton!
    @IBOutlet weak var eggImage: UIImageView!
    
    var timer: Timer?
    var totalTime = 0
    var secondsPassed = 0
    var audio: AVAudioPlayer?
    
    
    @IBAction func hardButton(_ sender: Any) {
        totalTime = 720
        eggImage.image = UIImage(named: "hard_egg")
        secondsPassed = 0
        progressBar.progress = 0.0
        startTimer()

    }
    @IBAction func mediumButton(_ sender: Any) {
        totalTime = 420
        eggImage.image = UIImage(named: "medium_egg")
        secondsPassed = 0
        progressBar.progress = 0.0
        startTimer()
    }
    @IBAction func softButton(_ sender: Any) {
        totalTime = 300
        eggImage.image = UIImage(named: "soft_egg")
        secondsPassed = 0
        progressBar.progress = 0.0
        startTimer()
    }
//    @IBAction func selectedButton(_ sender: Any) {
//        
//        timer?.invalidate()
//        if let eggtype = sender as? UIButton{
//            switch eggtype{
//            case softBoiledButton:
//                totalTime = 300
//                eggImage.image = UIImage(named: "soft_egg")
//            case mediumBoiledButton:
//                totalTime = 420
//                eggImage.image = UIImage(named: "medium_egg")
//            case hardBoiledButton:
//                totalTime = 720
//                eggImage.image = UIImage(named: "hard_egg")
//            default:
//                return
//            }
//            secondsPassed = 0
//            progressBar.progress = 0.0
//            startTimer()
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        eggImage.image = UIImage(named: "all_eggs")

        // Do any additional setup after loading the view.
    }
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        print("Timer started")
    }
            
            
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progress = Float (secondsPassed) / Float (totalTime)
            progressBar.progress = progress
        } else {
            timer?.invalidate()
            PlayAlarm()
        }
    }
    
    func PlayAlarm(){
        guard let url = Bundle.main.url(forResource: "alarm", withExtension: "wav") else {return}
        do{
            audio = try AVAudioPlayer(contentsOf: url)
            audio?.play()
        }
        catch {
            return
        }
    }

}

