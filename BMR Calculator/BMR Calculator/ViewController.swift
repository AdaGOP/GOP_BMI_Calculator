//
//  ViewController.swift
//  BMR Calculator
//
//  Created by zein rezky chandra on 09/03/21.
//

import UIKit

class ViewController: UIViewController {
    var result: Float=0
    
    var weight: Float=0
    
    var height: Float=0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var bmiTitle: UILabel!
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var bmiStatus: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var lightOrDark: UISegmentedControl!
    
    @IBAction func lightDarkAction(_ sender: UISegmentedControl) {
    if lightOrDark.selectedSegmentIndex == 0 {
            self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            titleLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            kgLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            weightTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            meterLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            heightTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bmiTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bmiValue.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bmiStatus.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        } else if lightOrDark.selectedSegmentIndex == 1 {
            self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            kgLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            weightTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            meterLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            heightTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            bmiTitle.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            bmiValue.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            bmiStatus.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
    }
    
    @IBAction func slideWeight(_ sender: UISlider) {
         let weightBerat = String(format: "%.2f", weightSlider.value)
        
        kgLabel.text = "\(weightBerat) Kg"
        
         itIsBMICalculator(yourWeightInKg: weightSlider.value, yourHeightInMeters: heightSlider.value)
        
    }
    
    @IBAction func slideHeight(_ sender: UISlider) {
        let heightTinggi = String(format: "%.2f", heightSlider.value)
        
        meterLabel.text = "\(heightTinggi) m"
        
         itIsBMICalculator(yourWeightInKg: weightSlider.value, yourHeightInMeters: heightSlider.value)
       
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bmiValue.text = "kg/m2"
        bmiStatus.text = ""
        
    }
    
    func itIsBMICalculator (yourWeightInKg : Float , yourHeightInMeters : Float) {
       let yourBMI = yourWeightInKg / (yourHeightInMeters*yourHeightInMeters)
        let resultBounded = String(format: "%.2f", yourBMI)
        
        bmiValue.text = "\(resultBounded) Kg/m2"
        
        
       if yourBMI >= 30 {
            bmiStatus.text = "You are obessed."
            bmiStatus.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
       } else if yourBMI >= 25 {
            bmiStatus.text = "You are overweight."
            bmiStatus.textColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
       } else if yourBMI > 18.5  {
            bmiStatus.text = "You have a normal weight."
            bmiStatus.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
       } else {
            bmiStatus.text = "You are underweight."
            bmiStatus.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
       }
        
    }
    
}

