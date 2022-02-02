//
//  HomeViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 02/02/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var bentornatoLabel: UILabel!
    
    var email = ""

    private let alert = UIAlertController(title: "Attenzione", message: "Questa è una app di prova", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        bentornatoLabel.text = "Bentornato, " + email
        // Do any additional setup after loading the view.
    }
    
    @IBAction func homeButtonTouched(_ sender: Any) {
        self.present(alert, animated: true, completion: nil)
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
