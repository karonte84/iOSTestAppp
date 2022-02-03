//
//  DettaglioLibroViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 03/02/22.
//

import UIKit

class DettaglioLibroViewController: UIViewController {
    @IBOutlet weak var titoloLibroLabel: UILabel!
    @IBOutlet weak var autoreLabel: UILabel!
    @IBOutlet weak var annoLabel: UILabel!
    @IBOutlet weak var sinossiLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var libro : Libro? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let l = libro {
            titoloLibroLabel.text = l.titolo
            autoreLabel.text = l.autore
            annoLabel.text = l.anno
            sinossiLabel.text = l.sinossi
            if let url = URL(string: l.copertina) {
                imageView.load(from: url)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
