//
//  AddMascotaController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/18/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class AddMascotaController: UIViewController {
    
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var raza: UITextField!
    
    let ref = Database.database().reference(fromURL: "https://prettypets-652fe.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func GuardarMascota(_ sender: UIButton) {
        guard let nombre = nombre.text else {
            print("nombre issue")
            return
        }
        guard let edad = edad.text else {
            print("edad issue")
            return
        }
        
        guard let raza = raza.text else {
            print("raza issue")
            return
        }
        //Recuperamos información de usuario
        let user = Auth.auth().currentUser
        let uid = user?.uid
        let reference = Database.database().reference(fromURL: "https://prettypets-652fe.firebaseio.com/").child("users").child(uid!).child("pets").childByAutoId()
        
        let values = ["nombre":nombre, "edad":edad, "raza":raza]
        
        reference.updateChildValues(values) { (error, reference) in
            if error != nil {
                print("ha ocurrido un error en Registrar mascota")
                print(error!)
                return
            }
            // self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
}
