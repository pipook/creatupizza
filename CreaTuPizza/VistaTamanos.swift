//
//  VistaTamanos.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/27/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

protocol TamanoVistaControllerProtocol {
    func tamanoSeleccionadoController(tamano : String)
}

class VistaTamanos: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var delegate : TamanoVistaControllerProtocol!
    @IBOutlet weak var pickerTamanos: UIPickerView!
    let tamanosArray = ["", "Chica", "Mediana", "Grande"]
    @IBOutlet weak var tamanoSeleccionado: UILabel!
    var resultadoTamano : String = "Daniel"
    
    enum Tamanos : Int{
        case Otro = 0, Chica = 1, Mediana = 2, Grande = 3
        init(tipo : String){
            switch tipo {
            case "Chica":
                self = .Chica
            case "Mediana":
                self = .Mediana
            case "Grande":
                self = .Grande
            default:
                self = .Otro
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerTamanos.dataSource = self
        pickerTamanos.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let tam = Tamanos(tipo : resultadoTamano)
        tamanoSeleccionado.text = tamanosArray[tam.rawValue]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamanosArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanosArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        tamanoSeleccionado.text = tamanosArray[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate.tamanoSeleccionadoController(tamano: tamanoSeleccionado.text ?? "Label")
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
