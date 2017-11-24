//
//  Mascota.swift
//  PrettyPets
//
//  Created by Alejandra Landinez on 11/23/17.
//  Copyright © 2017 LordBoxen. All rights reserved.
//

import Foundation

class Mascota{
    var nombre:String!
    var raza:String!
    var img:String!
    //Creamos constructor
    init(nombre:String,raza:String,img:String){
        self.nombre=nombre
        self.img=img
        self.raza=raza
        
    }
}
