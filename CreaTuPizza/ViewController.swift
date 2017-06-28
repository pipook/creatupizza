//
//  ViewController.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/22/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TamanoVistaControllerProtocol, MasaVistaControllerProtocol, QuesosVistaControllerProtocol, IngredientesVistaControllerProtocol {

    @IBOutlet weak var labelTamano: UILabel!
    @IBOutlet weak var labelMasa: UILabel!
    @IBOutlet weak var labelQueso: UILabel!
    @IBOutlet weak var labelIngredientes: UILabel!
    
    var vista : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTamanos" {
            let tamanoVista = segue.destination as! VistaTamanos
            tamanoVista.delegate = self
            tamanoVista.resultadoTamano = labelTamano.text!
        }else if segue.identifier == "showMasas" {
            let masaVista = segue.destination as! VistaMasas
            masaVista.delegate = self
            masaVista.resultadoMasa = labelMasa.text!
        }else if segue.identifier == "showQuesos" {
            let quesoVista = segue.destination as! VistaQuesos
            quesoVista.delegate = self
            quesoVista.resultadoQueso = labelQueso.text!
        }else if segue.identifier == "showIngredientes" {
            let ingredienteVista = segue.destination as! VistaIngredientes
            ingredienteVista.delegate = self
            ingredienteVista.resultadoIngrediente = labelIngredientes.text!
        }else if segue.identifier == "showResultado" {
            let resultadoVista = segue.destination as! VistaEtapas
            resultadoVista.resTamano = labelTamano.text!
            resultadoVista.resMasa = labelMasa.text!
            resultadoVista.resQueso = labelQueso.text!
            resultadoVista.resIngre = labelIngredientes.text!
        }
    }
    func tamanoSeleccionadoController(tamano: String){
        self.labelTamano.text = tamano
    }
    func masaSeleccionadoController(masa: String){
        self.labelMasa.text = masa
    }
    func quesoSeleccionadoController(queso: String){
        self.labelQueso.text = queso
    }
    func ingredienteSeleccionadoController(ingrediente : String){
        self.labelIngredientes.text = ingrediente
    }

}

