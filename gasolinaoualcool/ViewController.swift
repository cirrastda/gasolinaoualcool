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

    func validaCampo(valor: String) -> Bool {
        var result : Bool = true
        //var msg_erro
        let numberCharacters = CharacterSet.decimalDigits.inverted
        
        if (valor.isEmpty) {
            result = false
        } else if(valor.rangeOfCharacter(from: numberCharacters) == nil) {
            result = false
        }
        return result
    }
    
    func getTextValue(objText: UITextField, tipo: String ) -> Double {
        var dPreco = 0.0
        if let sPreco = objText.text {
            if !self.validaCampo(valor: sPreco) {
                lblResult.text = "Campo "+tipo+" não informado ou inválido"
            } else {
                if let tPreco = Double(sPreco) {
                    dPreco = tPreco
                } else {
                    lblResult.text = "Campo "+tipo+" não informado ou inválido"
                }
            }
            
        } else {
            lblResult.text = "Informe o Preço "+(tipo == "Gasolina" ? "da" : "do")+" "+tipo
        }
        return dPreco
    }
    
    func calculaMelhorValor(dValorGasolina: Double, dValorAlcool: Double) {
        let dProp = (dValorAlcool / dValorGasolina)
        
        let melhor :String = (dProp >= 0.7 ? "gasolina" : "alcool")
        lblResult.text = "É melhor usar "+melhor.prefix(1).uppercased()+melhor.dropFirst().lowercased()
    }
    @IBAction func btnCalcular_Click(_ sender: Any) {
        let dPrecoGasolina = self.getTextValue(objText: txtGasolina, tipo: "Gasolina")
        let dPrecoAlcool = self.getTextValue(objText: txtAlcool, tipo: "Alcool")
        
        if dPrecoGasolina>0 && dPrecoAlcool>0 {
           calculaMelhorValor(dValorGasolina: dPrecoGasolina, dValorAlcool: dPrecoAlcool)
        } else {
            // lblResult.text = "Os valores devem ser maiores que ZERO"
        }
    }
    
}

