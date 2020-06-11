//
//  HomeController.swift
//  btvnFireBase
//
//  Created by Huy on 6/11/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {

    @IBOutlet weak var signout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
          if Auth.auth().currentUser == nil {
            dismiss(animated: true, completion: nil)
          }
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
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
