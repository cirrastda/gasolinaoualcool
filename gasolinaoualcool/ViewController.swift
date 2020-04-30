//
//  ViewController.swift
//  gasolinaoualcool
//
//  Created by Anderson Matuchenko on 30/04/20.
//  Copyright © 2020 Anderson Matuchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var txtGasolina: UITextField!
    @IBOutlet weak var txtAlcool: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func getTextValue(objText: UITextField, tipo: String ) -> Double {
        var dPreco = 0.0
        if let sPreco = objText.text {
            dPreco = Double(sPreco)!
        } else {
            lblResult.text = "Informe o Preço "+(tipo == "Gasolina" ? "da" : "do")+" "+tipo
        }
        return dPreco
    }
    @IBAction func btnCalcular_Click(_ sender: Any) {
        let dPrecoGasolina = getTextValue(objText: txtGasolina, tipo: "Gasolina")
        let dPrecoAlcool = getTextValue(objText: txtAlcool, tipo: "Alcool")
        
        if dPrecoGasolina>0 && dPrecoAlcool>0 {
            
        } else {
            lblResult.text = "Os valores devem ser maiores que ZERO"
        }
    }
    
}

