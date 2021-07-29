//
//  SignUpViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit
import Firebase

class SignUpViewController: BaseViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var txtFieldPWd: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

    }
    func checkData(){
            handle = Auth.auth().addStateDidChangeListener { auth, user in
                print(user?.email as Any)
                let alert = UIAlertController(title: "Alert", message: "User SignUp Successfull \(user?.email as Any)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in self.coordinator?.proceedToLogInPage()}))
                self.present(alert, animated: true)
            }
    }
    @IBAction func SignUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: txtFieldEmail.text!, password: txtFieldPWd.text!) { authResult, error in
            print("Success Created User")
            print(error)
            self.checkData()
    }
    

}

}
