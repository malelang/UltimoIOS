//
//  ViewController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/6/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class ViewController: UIViewController {

   
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginButton(_ sender: UIButton) {
    
            Auth.auth().signIn(withEmail: email.text!, password: password.text!, completion: {(user,error) in
                if user != nil{
                    print("Logueado exitosamente")
                    //Si el Login es exitoso continua al menu
                    self.performSegue(withIdentifier: "segue2", sender: self)
                    
                }else{
                    if let MiniError = error?.localizedDescription{
                        print("Ha ocurrido un error en el LOGUEO: ")
                        print(MiniError)
                    }else{
                        print("Parece un error más grave chiquillo")
                    }
                }
            })
    }
}

