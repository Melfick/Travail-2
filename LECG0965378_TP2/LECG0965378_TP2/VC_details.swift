//
//  VC_details.swift
//  LECG0965378_TP2
//
//  Created by Etudiant on 17-11-03.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class VC_details: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Titre: UILabel!
    @IBOutlet weak var Infos: UILabel!
    @IBOutlet weak var buttonRetour: UIButton!
    @IBAction func button(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    var informationDeAfficheCourante = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Infos.lineBreakMode = .byWordWrapping
        Infos.numberOfLines = 0;
        
        Titre.text = informationDeAfficheCourante[0]
        Image.image = UIImage(named:informationDeAfficheCourante[1])
        Infos.text = informationDeAfficheCourante[2]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
