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
    let ref = Database.database().reference(fromURL: "https://prettypets-652fe.firebaseio.com/")

    @IBAction func nest2(_ sender: UIButton) {
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
        guard let email1 = email.text else {
            print("email issue")
            return
        }
        guard let pass = pass.text else {
            print("pass issue")
            return
        }
        Auth.auth().createUser(withEmail: email.text!, password: pass, completion: { (user, error) in
            if user != nil{
                print("Registrado exitosamente")
                //Si el Login es exitoso continua al menu
            //    self.performSegue(withIdentifier: "segue10", sender: self)
            }else{
                if let MiniError = error?.localizedDescription{
                    print("Ha ocurrido un error en el Registro: ")
                    print(MiniError)
                }else{
                    print("Parece un error más grave chiquillo")
                }
            }
            guard let uid = user?.uid else {
                return
            }
            let userReference = self.ref.child("users").child(uid)
            let values = ["nombre": nombre, "direccion": direccion, "contacto": contacto, "email": email1, "pic":"","pets":""]
            
            userReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
                if error != nil {
                    print (error!)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            })
            
        })
        //   Auth.auth().signIn(withEmail: email, password: pass, completion: nil)
        
    }
    }
