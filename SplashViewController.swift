//
//  SplashViewController.swift
//  AudioVideo
//
//  Created by imac on 13/11/24.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imvSplash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let x = (view.frame.width - imvSplash.frame.width) / 2.0
        imvSplash.frame.origin.x = x
        imvSplash.frame.origin.y = view.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.0, delay: 0.5) {
            self.imvSplash.frame.origin.y = (self.view.frame.height - self.imvSplash.frame.height) / 2.0
        }completion: { res in
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { Timer in
                self.performSegue(withIdentifier: "SgSplash", sender: nil)
            }
        }
    }

}
