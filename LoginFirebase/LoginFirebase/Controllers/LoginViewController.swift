//
//  LoginViewController.swift
//  LoginFirebase
//
//  Created by Vinicius on 26/08/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var loginEmailTextfield: UITextField!
    @IBOutlet weak var loginPasswordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        loginPasswordTextfield.delegate = self
        loginEmailTextfield.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    func alert(title: String, message: String) {
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func doLoginButton(_ sender: Any) {
        let email = loginEmailTextfield.text ?? ""
        let password = loginPasswordTextfield.text ?? ""
        
        auth?.signIn(withEmail: email, password: password, completion: { user, error in
            if error != nil {
                self.loginEmailTextfield.text = ""
                self.loginPasswordTextfield.text = ""
                self.alert(title: "Oooopa", message: "Por favor, verifique seus dados")
                
            }else{
               if user == nil {
                   self.alert(title: "Nuuuuussss", message: "Erro inesperado")
                   
               }else{
                   self.alert(title: "Ai Sim", message: "Login com sucesso")
                   self.loginEmailTextfield.text = " "
                   self.loginPasswordTextfield.text = " "
                   
               }
            }
        })
    }
    
  
}

extension ViewController: UITextFieldDelegate {

    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.blue.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty == true {
            textField.layer.borderWidth = 2.0
            textField.layer.borderColor = UIColor.red.cgColor
            
        }
    }
    
 
    
}
