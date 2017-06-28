//
//  VistaMasas.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/27/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

protocol MasaVistaControllerProtocol {
    func masaSeleccionadoController(masa : String)
}

class VistaMasas: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var delegate : MasaVistaControllerProtocol!
    @IBOutlet weak var pickerMasas: UIPickerView!
    let masasArray = ["", "Delgada", "Crujiente", "Gruesa"]
    @IBOutlet weak var masaSeleccionada: UILabel!
    var resultadoMasa : String = "Daniel"
    
    enum Masas : Int{
        case Otro = 0, Delgada = 1, Crujiente = 2, Gruesa = 3
        init(tipo : String){
            switch tipo {
            case "Delgada":
                self = .Delgada
            case "Crujiente":
                self = .Crujiente
            case "Gruesa":
                self = .Gruesa
            default:
                self = .Otro
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerMasas.dataSource = self
        pickerMasas.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let mas = Masas(tipo : resultadoMasa)
        masaSeleccionada.text = masasArray[mas.rawValue]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return masasArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return masasArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        masaSeleccionada.text = masasArray[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate.masaSeleccionadoController(masa: masaSeleccionada.text ?? "Label")
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
