//
//  VistaEtapas.swift
//  CreaTuPizza
//
//  Created by Daniel Chico on 6/26/17.
//  Copyright © 2017 TriquiDev. All rights reserved.
//

import UIKit

class VistaEtapas: UIViewController {
    
    
    @IBOutlet weak var resultadoTamano: UILabel!
    @IBOutlet weak var resultadoMasa: UILabel!
    @IBOutlet weak var resultadoQueso: UILabel!
    @IBOutlet weak var resultadoIngrediente: UILabel!
    
    var resTamano = ""
    var resMasa = ""
    var resQueso = ""
    var resIngre = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if resTamano != "" && resTamano != "Label"{
            resultadoTamano.text = resTamano
        }else{
            resultadoTamano.text = ""
        }
        if resMasa != "" && resMasa != "Label"{
            resultadoMasa.text = resMasa
        }else{
            resultadoMasa.text = ""
        }
        if resQueso != "" && resQueso != "Label"{
            resultadoQueso.text = resQueso
        }else{
            resultadoQueso.text = ""
        }
        if resIngre != "" && resIngre != "Label"{
            resultadoIngrediente.text = resIngre
        }else{
            resultadoIngrediente.text = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmarPizza(_ sender: Any) {
        if resultadoTamano.text == "" || resultadoMasa.text == "" || resultadoQueso.text == "" || resultadoIngrediente.text == ""{
            alertaPedido(titulo: "Ingredientes no completado", mensaje: "No ha seleccionado todos los ingredientes, por favor regrese a la pantalla de selccion y termine con su pedido, gracias!", buttonTitle: "Error")
        }else{
            let respuesta = alertaAceptarPedido(titulo: "Realizar pedido de pizza", mensaje: "Esta seguro que desea realizar el pedido de la pizza con los ingredientes seleccionados?")
            if respuesta == nil {
                alertaPedido(titulo: "Ops!", mensaje: "Parece que algo salio mal!", buttonTitle: "Ok")
            }else if respuesta!{
                alertaPedido(titulo: "Exito!", mensaje: "Su pedido fue creado exitosamente, gracias por usar nuestros servicios 😊", buttonTitle: "Gracias!")
            }else{
                alertaPedido(titulo: "Ops!", mensaje: "Parece que no estas contento con tu pedido, por favor revisalo y vuelve!", buttonTitle: "Ok")
            }
        }
    }
    func alertaPedido(titulo: String, mensaje: String, buttonTitle: String) {
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.cancel, handler: { (action) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /// Show an alert with an "Okay" and "Cancel" button.
    func alertaAceptarPedido(titulo: String, mensaje: String) -> Bool? {
        var respuesta : Bool?
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler:  { (action) in alert.dismiss(animated: true, completion: nil)
            respuesta = false
        }))
        alert.addAction(UIAlertAction(title: "Si", style: UIAlertActionStyle.default, handler:  { (action) in alert.dismiss(animated: true, completion: nil)
            respuesta = true
        }))
        
        self.present(alert, animated: true, completion: nil)
        return respuesta
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
