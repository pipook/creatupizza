//
//  VistaIngredientes.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/27/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

protocol IngredientesVistaControllerProtocol {
    func ingredienteSeleccionadoController(ingrediente : String)
}

class VistaIngredientes: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate : IngredientesVistaControllerProtocol!
    @IBOutlet weak var pickerIngredientes: UIPickerView!
    @IBOutlet weak var ingreSeleccionado: UILabel!
    let ingredientesArray = ["", "Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var resultadoIngrediente = "Daniel"
    
    enum Ingredientes : Int{
        case Otro = 0, Jamon = 1, Pepperoni = 2, Pavo = 3, Salchicha = 4, Aceituna = 5, Cebolla = 6, Pimiento = 7, Piña = 8, Anchoa = 9
        init(tipo : String){
            switch tipo {
            case "Jamon":
                self = .Jamon
            case "Pepperoni":
                self = .Pepperoni
            case "Pavo":
                self = .Pavo
            case "Salchicha":
                self = .Salchicha
            case "Aceituna":
                self = .Aceituna
            case "Cebolla":
                self = .Cebolla
            case "Pimiento":
                self = .Pimiento
            case "Piña":
                self = .Piña
            case "Anchoa":
                self = .Anchoa
            default:
                self = .Otro
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerIngredientes.dataSource = self
        pickerIngredientes.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let ing = Ingredientes(tipo : resultadoIngrediente)
        ingreSeleccionado.text = ingredientesArray[ing.rawValue]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredientesArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredientesArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        ingreSeleccionado.text = ingredientesArray[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate.ingredienteSeleccionadoController(ingrediente: ingreSeleccionado.text ?? "Label")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
