//
//  IntroController.swift
//  LECG0965378_TP2
//
//  Created by Etudiant on 17-11-02.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class IntroController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(controlIntro), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func controlIntro(){
        performSegue(withIdentifier: "IntroSegue", sender: nil)
    }
    
}
