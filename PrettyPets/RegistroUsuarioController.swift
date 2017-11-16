//
//  RegistroUsuarioController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/7/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation

import UIKit

class RegistroUsuarioController: UIViewController {
    
    @IBOutlet weak var Nombres: UIStackView!
    @IBOutlet weak var Direccion: UITextField!
    @IBOutlet weak var Numero: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var pickerEdad: UIPickerView!
    @IBOutlet weak var genero: UISegmentedControl!
    
  //  var edades = ["18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50"]
    var gender = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func genderChanged(_ sender: Any) {
        switch genero.selectedSegmentIndex
        {
        case 0:
            gender = "h";
        case 1:
            gender = "m";
        default:
            break
        }
    }
    
    
    
}
