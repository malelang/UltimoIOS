//
//  RegistroMascotaController.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/7/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation

import UIKit

class RegistroMascotaController: UIViewController {
    @IBOutlet var nombreMascota: UITextField!
   
    @IBOutlet weak var edad: UITextField!
    
    @IBOutlet weak var txtRaza: UITextField!
    
    @IBOutlet weak var pickerRaza: UIPickerView!
    
    @IBOutlet weak var sexo: UISegmentedControl!
    
    @IBOutlet weak var tipo: UISegmentedControl!
    var selSexo: String = ""
    var selTipo: String = ""
    var razaperros = ["Akita","Pastor Aleman","Schnauzer"]
    var razagatos = ["Abisinio","Persa","Egipcio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SexoSelected(_ sender: Any) {
        switch sexo.selectedSegmentIndex
        {
        case 0:
            selSexo = "m"
        case 1:
            selSexo = "h"
        default:
            break
        }
    }
    
    
    @IBAction func TipoSelected(_ sender: Any) {
        switch tipo.selectedSegmentIndex
        {
        case 0:
            selTipo = "p"
        case 1:
            selTipo = "g"
        default:
            break
        }
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if selTipo == "p" {
            return razaperros.count
        }else if selTipo == "g" {
        return razagatos.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        if selTipo == "p" {
            return razaperros[row]
        }
        else if selTipo == "g" {
            return razagatos[row]
        }else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selTipo == "p"{
            self.txtRaza.text = self.razaperros[row]
            self.pickerRaza.isHidden = true
        }else if selTipo == "g"{
            self.txtRaza.text = self.razagatos[row]
            self.pickerRaza.isHidden = true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.txtRaza {
            self.pickerRaza.isHidden = false
            textField.endEditing(true)
        }
        
    }
    
    @IBAction func goToRegister(_ sender: UIButton) {
        
    }
    
}
