//
//  LoginController.swift
//  btvnFireBase
//
//  Created by Huy on 6/5/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController: UIViewController {
    let LogonView : UIImageView = {
       let lg = UIImageView()
        lg.contentMode = .scaleAspectFit
        lg.clipsToBounds = true
        lg.image = UIImage(named: "ilove")
        return lg
    }()
    lazy var emailContainer: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, UIImage(named: "mail")!, emailText)
    }()
    var emailText : UITextField = {
        let eT = UITextField()
        return eT.textField(placeholder: "Email", isSecure: false)
    }()
    lazy var PassContainer: UIView = {
        let view = UIView()
        return view.textContainerView(view: view,UIImage(named: "lock")!, PassText)
    }()
    var PassText : UITextField = {
        let PT = UITextField()
        return PT.textField(placeholder: "PassWord", isSecure: true)
    }()
    var loginButton : UIButton = {
       let LB = UIButton()
        LB.setTitle("Log In", for: .normal)
        LB.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        LB.backgroundColor = .white
        LB.setTitleColor(UIColor.mainBlue(), for: .normal)
        LB.addTarget(self, action: #selector(showLogin), for: .touchUpInside)
        LB.layer.cornerRadius = 5
        return LB
    }()
    let dontAccount: UIButton = {
        let BT = UIButton(type: .system)
        let attribut = NSMutableAttributedString(string: "don't have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attribut.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.red]))
        BT.setAttributedTitle(attribut, for: .normal)
        BT.addTarget(self, action: #selector(showSignUP), for: .touchUpInside)
        return BT
    }()
    var alertControll : UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        setupLayout()
        // Do any additional setup after loading the view.
    }
    @objc func showLogin(){
        
        guard let email = emailText.text else {return}
        guard let pass = PassText.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if error == nil && user != nil {
//                let destinationVC = HomeController()
//                self.navigationController?.pushViewController(destinationVC, animated: true)
                print("test" )
                let secondVC = HomeController()
                let navigation = UINavigationController(rootViewController: secondVC)
                self.present(navigation, animated: true, completion: nil)
            }
            else {
                print("error")
                self.alertControll = UIAlertController(title: "chu y", message: "sai tai khoan - mat khau", preferredStyle: .alert)
                let ok = UIAlertAction(title: "nhap lai", style: .default)
                self.alertControll?.addAction(ok)
                self.present(self.alertControll!, animated: true)
                
            }
        }
    }
    @objc func showSignUP(){
        let secondVC = testSignFlas()
        let navigation = UINavigationController(rootViewController: secondVC)
        
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true, completion: nil)
    }
    func setupLayout(){
        view.backgroundColor = UIColor.mainBlue()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(LogonView)
        LogonView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingRight: 0, paddingLeft: 0, paddingBottom: 0, width: 0, height: UIScreen.main.bounds.height/3)
        LogonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainer)
        emailContainer.anchor(top: LogonView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingRight: -30, paddingLeft: 30, paddingBottom: 0, width: 0, height: 50)
        view.addSubview(emailText)
        emailText.anchor(top: emailContainer.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -11, paddingRight: -30, paddingLeft: 70, paddingBottom: 0, width: 0, height: 50)
        
        view.addSubview(PassContainer)
        PassContainer.anchor(top: emailContainer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 60, paddingRight: -30, paddingLeft: 30, paddingBottom: 0, width: 0, height: 50)
        view.addSubview(PassText)
        PassText.anchor(top: PassContainer.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: -11, paddingRight: -30, paddingLeft: 70, paddingBottom: 0, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: PassContainer.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 100, paddingRight: -30, paddingLeft: 30, paddingBottom: 0, width: 0, height: 50)
//         dontAccount
         view.addSubview(dontAccount)
        dontAccount.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingRight: -30, paddingLeft: 30, paddingBottom: -20, width: 0, height: 50)
        
    }

}
