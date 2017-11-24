//
//  RegMascotaController.swift
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

class RegMascotaController: UIViewController {
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var edad: UITextField!
    //@IBOutlet weak var petSex: UISegmentedControl!
    //@IBOutlet weak var petKind: UISegmentedControl!
    @IBOutlet weak var raza: UITextField!
    var sexo:String!
    var tipo:String!
    
    let ref = Database.database().reference(fromURL: "https://prettypets-652fe.firebaseio.com/")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Teminar(_ sender: UIButton) {
        guard let nombre = nombre.text else {
            print("nombre issue")
            return
        }
        guard let edad = edad.text else {
            print("edad issue")
            return
        }
        /* guard let petSex = petSex.text else {
         print("sexo issue")
         return
         }
         guard let petKind = petKind.text else {
         print("mascota issue")
         return
         }*/
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
       // self.performSegue(withIdentifier: "seguemenu", sender: self)
        /* @IBAction func chooseSex(_ sender: Any) {
         switch petSex.selectedSegmentIndex
         {
         case 0:
         sexo = "m";
         case 1:
         sexo = "h";
         default:
         break
         }
         }
         
         @IBAction func chooseType(_ sender: Any) {
         switch petKind.selectedSegmentIndex
         {
         case 0:
         tipo = "p";
         case 1:
         tipo = "g";
         default:
         break
         }
         }*/
        
    
    }
}
