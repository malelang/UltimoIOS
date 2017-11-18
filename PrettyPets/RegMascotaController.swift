//
//  RegMascotaController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/17/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation

import UIKit

class RegMascotaController: UIViewController {
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var petSex: UISegmentedControl!
    @IBOutlet weak var petKind: UISegmentedControl!
    @IBOutlet weak var raza: UITextField!
    var sexo:String!
    var tipo:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func chooseSex(_ sender: Any) {
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
    }
    
}
