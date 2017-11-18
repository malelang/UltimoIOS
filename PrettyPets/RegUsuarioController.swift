//
//  RegUsuarioController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/17/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation

import UIKit

class RegUsuarioController: UIViewController {
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var direccion: UITextField!
    @IBOutlet weak var contacto: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    var genero:String!
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
    
    
}
