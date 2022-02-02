//
//  OutletViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 02/02/22.
//

import UIKit

class OutletViewController: UIViewController {
    @IBOutlet weak var counterButton: UIButton!
    
    private var counterValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onCounterClicked(_ sender: Any) {
        counterValue = counterValue + 1
        counterButton.setTitle(String(counterValue), for: .normal)
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
