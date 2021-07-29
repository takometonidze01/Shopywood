//
//  LogInViewController.swift
//  Shopywood
//
//  Created by CodergirlTM on 18.07.21.
//

import UIKit
import Firebase
import CoreData

class LogInViewController: BaseViewController {

    @IBOutlet weak var txtEmailField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPWDField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtn(_ sender: Any) {

    }
    func saveUser() {
        let userID = Auth.auth().currentUser?.uid
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let users = User(entity: entity!, insertInto: context)
        users.userId = userID
        
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        
        
    }

    


    
   
    @IBAction func SignUpBtn(_ sender: Any) {

        Auth.auth().signIn(withEmail: txtEmailField.text!, password: txtPWDField.text!) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            print(authResult?.user.email)

            self?.checkData()
    }
    }
        func checkData(){
            handle = Auth.auth().addStateDidChangeListener { auth, user in
                print(user?.email as Any)
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                self.coordinator?.proceedToMainTabBarController()
                
            }
        }

}

