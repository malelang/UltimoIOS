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
    @IBOutlet weak var btnSexo: DLRadioButton!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var btnTipo: DLRadioButton!
    @IBOutlet weak var txtRaza: UITextField!
    
    @IBOutlet weak var pickerRaza: UIPickerView!
    var sexo: String = ""
    var tipo: String = ""
    var razaperros = ["Akita","Pastor Aleman","Schnauzer"]
    var razagatos = ["Abisinio","Persa","Egipcio"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func selectSexo(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            sexo = "m"
        }else if sender.tag == 2 {
            sexo = "h"
        }
    }
    @IBAction func selectTipo(_ sender: DLRadioButton) {
        if sender.tag == 3 {
            tipo = "p"
        }else if sender.tag == 4 {
            tipo = "g"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if tipo == "p" {
            return razaperros.count
        }else if tipo == "g" {
        return razagatos.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        if tipo == "p" {
            return razaperros[row]
        }
        else if tipo == "g" {
            return razagatos[row]
        }else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if tipo == "p"{
            self.txtRaza.text = self.razaperros[row]
            self.pickerRaza.isHidden = true
        }else if tipo == "g"{
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
