//
//  AffichePageController.swift
//  LECG0965378_TP2
//
//  Created by Etudiant on 17-11-02.
//  Copyright © 2017 Etudiant. All rights reserved.
//

import UIKit

class AffichePageController: UIViewController, UICollectionViewDataSource {

    var _tableau = [Array<String>]()
    
    @IBOutlet weak var CV_affiches: UICollectionView!
    @IBOutlet weak var nombreAffiches: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pathFichierPlist = Bundle.main.path(forResource: "lesDonnes", ofType: "plist")!
        print("#pathFichierPlist: \(pathFichierPlist)")
        // Voir documentation pour Array VS NSArray:
        // https://developer.apple.com/reference/swift/array
        // https://developer.apple.com/reference/foundation/nsarray
        _tableau = NSArray(contentsOfFile: pathFichierPlist) as! Array<Array<String>>
        print("Nombre d'entrée : \(_tableau.count)")
        
        nombreAffiches.text = "Il y a \(_tableau.count) affiches dans la collection"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _tableau.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celluleCourante:CVCAffiche
        
        celluleCourante = collectionView.dequeueReusableCell(withReuseIdentifier: "modeleCelluleAffiche", for:indexPath) as! CVCAffiche
        
        let nomDeAffiche = _tableau[indexPath.row][0]
        let fichierImage = _tableau[indexPath.row][1]
        
        celluleCourante.afficheNom.text = nomDeAffiche
        celluleCourante.afficheImage.image = UIImage(named:fichierImage)
        
        print(celluleCourante.afficheNom.text!)
        return celluleCourante
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1 - Déterminer l'index de la sélection à partir de la cellule reçue en paramètre (sender)
        let selection = CV_affiches.indexPath(for: sender as! UICollectionViewCell)!.row
        //yo(dans: String(selection))
        print("# Exécution de la méthode: prepareForSegue pour la cellule numéro: \(selection)\n")
        
        // 2 - Créer un objet pointant sur l'instance de classe de la destination
        let destination = segue.destination as! VC_details
        
        // 3 - Passer les informations au controleur de destination
        destination.informationDeAfficheCourante = _tableau[selection]
    }
    
}
