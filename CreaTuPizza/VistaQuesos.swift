//
//  VistaQuesos.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/27/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

protocol QuesosVistaControllerProtocol {
    func quesoSeleccionadoController(queso : String)
}
class VistaQuesos: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var delegate : QuesosVistaControllerProtocol!
    @IBOutlet weak var pickerQuesos: UIPickerView!
    let quesosArray = ["", "Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    @IBOutlet weak var quesoSeleccionado: UILabel!
    var resultadoQueso : String = "Daniel"
    
    enum Quesos : Int{
        case Otro = 0, Mozarela = 1, Cheddar = 2, Parmesano = 3, SinQueso = 4
        init(tipo : String){
            switch tipo {
            case "Mozarela":
                self = .Mozarela
            case "Cheddar":
                self = .Cheddar
            case "Parmesano":
                self = .Parmesano
            case "Sin queso":
                self = .SinQueso
            default:
                self = .Otro
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerQuesos.dataSource = self
        pickerQuesos.delegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let que = Quesos(tipo : resultadoQueso)
        quesoSeleccionado.text = quesosArray[que.rawValue]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return quesosArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return quesosArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        quesoSeleccionado.text = quesosArray[row]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(_ animated: Bool) {
        delegate.quesoSeleccionadoController(queso: quesoSeleccionado.text ?? "Label")
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
