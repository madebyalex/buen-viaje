//
//  LoginVC.swift
//  buen-viaje
//
//  Created by Alexander on 12.09.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func gotoRegisterScreen(_ sender: UIButton) {
        let registerVC = RegisterVC()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true)
    }
    
    @IBAction func loginBtnClicked (_ sender: Any) {
        dismiss(animated: true)
    }
    
}
