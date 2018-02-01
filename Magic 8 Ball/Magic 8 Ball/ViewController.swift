//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Chinmay Ghotkar on 1/31/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomMagicBallImageIndex : Int = 0
    let magicEightBallImageArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    @IBOutlet weak var magicEightBallImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeMagicBallImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        changeMagicBallImage()
    }
    
    func changeMagicBallImage() {
        randomMagicBallImageIndex = Int(arc4random_uniform(5))
        
        magicEightBallImage.image = UIImage(named: magicEightBallImageArray[randomMagicBallImageIndex])
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        changeMagicBallImage()
    }
}

