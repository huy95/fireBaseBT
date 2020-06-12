//
//  testSignFlas.swift
//  btvnFireBase
//
//  Created by Huy on 6/5/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class testSignFlas: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passtext: UITextField!
    
    @IBOutlet weak var confirmPass: UITextField!
    var alertControll: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passtext.isSecureTextEntry = true
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(cancelPress))
        navigationItem.leftBarButtonItem = cancelButton
        // Do any additional setup after loading the view.
    }
    @objc func cancelPress(){
           dismiss(animated: true, completion: nil)
       }
    
    @IBAction func buttonSignUp(_ sender: Any) {
       if let email = emailText.text, let password = passtext.text,
        let confirm = confirmPass.text
       { if (confirm == password){
           Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
             guard let user = authResult?.user, error == nil else{
               print("error \(error?.localizedDescription)")
               return
                
             }
             print(user)
           }
        self.alertControll = UIAlertController(title: "ok", message: " co tai khoan ra ma dang nhap", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        self.alertControll?.addAction(ok)
        self.present(self.alertControll!, animated: true)
       }
       else {
        self.alertControll = UIAlertController(title: "nhap lai", message: "nhap sai mk hoac tk", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        self.alertControll?.addAction(ok)
        self.present(self.alertControll!, animated: true)
        }
    }
    }}
//    func createUser(email: String, password: String, userName: String){
//        Auth.auth().createUser(withEmail: email, password: password ) { (userResult, error) in
//            if let user = userResult?.user { // kiểm tra userResult.user nếu khác nil
//                print(user)
//            }
//            if let error = error {
//                print("error",error.localizedDescription)
//                return
//            }
//            guard let uid = userResult?.user.uid else {return}
//            let values = ["email": email, "userName": userName]
////            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: {(error, ref) in
//                if let error = error {
//                    print("error",error.localizedDescription)
//                    return
//                }
//            })
//        }
    



