//
//  RegUsuarioController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/17/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase
import FirebaseAuth

import UIKit

class RegUsuarioController: UIViewController {
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var direccion: UITextField!
    @IBOutlet weak var contacto: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var siguienteButton: UIButton!
    
    var genero:String!
    let ref = Database.database().reference(fromURL: <#T##String#>)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func chooseGenero(_ sender: Any) {
        
        
        switch gender.selectedSegmentIndex
        {
        case 0:
            genero = "h";
        case 1:
            genero = "m";
        default:
            break
        }
        
    }
    
    @IBAction func siguienteButtonTappped(_ sender:UIButton){
        
        guard let nombre = nombre.text else {
            print("nombre issue")
            return
        }
        guard let direccion = direccion.text else {
            print("direccion issue")
            return
        }
        guard let contacto = contacto.text else {
            print("contacto issue")
            return
        }
        guard let email = email.text else {
            print("email issue")
            return
        }
        guard let pass = pass.text else {
            print("pass issue")
            return
        }
        Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let uid = user?.uid else {
                return
            }
            let userReference = self.ref.child("users").child(uid)
            let values = ["nombre": nombre, "direccion": direccion, "contacto": contacto, "email": email, "pic":""]
            
            userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print (error!)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
        })
        
    }
    
    
}
