//
//  LoginViewController.swift
//  ProvaApp
//
//  Created by michael.sanelli on 02/02/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
    private let alert = UIAlertController(title: "Attenzione", message: "Le tue credenziali sono errate, riprova", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginTapped(_ sender: Any) {
        login()
    }
    
    @IBAction func onShowTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        showButton.setTitle(passwordTextField.isSecureTextEntry ? "Mostra" : "Nascondi", for: .normal)
        
        
        /*if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            showButton.setTitle("Nascondi", for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            showButton.setTitle("Mostra", for: .normal)
        }*/
        
    }
    
    func login() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email == "pippo@mail.com" && password == "Password1!" {
                self.performSegue(withIdentifier: "showHome", sender: self)
            } else {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabVC = segue.destination as? UITabBarController, let navigationVC = tabVC.viewControllers?.first as? UINavigationController, let homeVC = navigationVC.viewControllers.first as? HomeViewController {
            if let emailText = emailTextField.text {
                homeVC.email = emailText
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
