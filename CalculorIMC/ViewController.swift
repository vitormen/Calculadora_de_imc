//
//  ViewController.swift
//  CalculorIMC
//
//  Created by user on 24/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var LBpeso: UITextField!
    @IBOutlet weak var LBaltura: UITextField!
    @IBOutlet weak var LBResultado: UILabel!
    @IBOutlet weak var IVimage: UIImageView!
    @IBOutlet weak var VIresultado: UIView!
    
    var imc:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    @IBAction func Calculator(_ sender: Any) {
        if let Peso = Double(LBpeso.text!), let Altura = Double(LBaltura.text!){
            
            imc = Peso/(Altura*Altura)
            DispatchQueue.main.async {
                self.showResults()
            }
        }
    }
    func showResults(){
        var result: String = ""
        var image: String = ""
        switch imc{
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "Peso ideal"
            image = "ideal"
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
        }
        LBResultado.text = "\(Int(imc)): \(result)"
        IVimage.image = UIImage(named: image)
        VIresultado.isHidden = false
        view.endEditing(true)
        
    }
    
}

