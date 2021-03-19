//
//  ViewController.swift
//  BMR Calculator
//
//  Created by zein rezky chandra on 09/03/21.
//

import UIKit

class ViewController: UIViewController {
    /// Constant & Variable.
    ///
    /// Make sure explain what is constant and variable,
    /// Creating a `result`, `weight`, `height` to represent the knowledge about it
    ///
    /// - Important: `TEC056    I can apply Swift Basic Concepts and use basic Swift elements    Constants and Variables`
    ///
    var result: Float=0
    var weight: Float=0
    var height: Float=0
    
    /// String & Character.
    ///
    /// Make sure create connection between the UI Component,
    /// When UIButton create, it takes a value which String / Character
    ///
    /// - Important: `TEC061    I can use Strings and Characters in Swift`
    ///
    @IBOutlet weak var bmiValue: UILabel!
    @IBOutlet weak var bmiStatus: UILabel!

    
    /// UIKit & Outlet Connection.
    ///
    /// Explain how to work with UI Component,
    /// Use analogy that explain about the connection outlet of each UI component
    ///
    /// - Important: `Outlet Connection`
    ///`
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var heightTitle: UILabel!
    @IBOutlet weak var kgLabel: UILabel!
    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var bmiTitle: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var lightOrDark: UISegmentedControl!
    
    @IBOutlet weak var calculateButton: UIButton!
    
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
    
    /// Controls.
    ///
    /// Explain what UI component can do, and how to handle the `action` of it,
    /// Simulate how to get real time value changes of the UI component
    ///
    /// - Important: `TEC043    I can implement Controls with UIKit`
    ///
    @IBAction func slideWeight(_ sender: UISlider) {
         let weightBerat = String(format: "%.2f", weightSlider.value)
        
        kgLabel.text = "\(weightBerat) Kg"
                
    }
    
    @IBAction func slideHeight(_ sender: UISlider) {
        let heightTinggi = String(format: "%.2f", heightSlider.value)
        
        meterLabel.text = "\(heightTinggi) m"
        
    }
    
    @IBAction func calculateAction(_ sender: UIButton) {
        itIsBMICalculator(yourWeightInKg: weightSlider.value, yourHeightInMeters: heightSlider.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /// Attribute value
        ///
        /// Explain that every UI system has an attribute that we can use to change the value of it
        ///
        /// - Important: `Attribute`
        ///
        bmiValue.text = "kg/m2"
        bmiStatus.text = ""
    }
    
    
    /// Function.
    ///
    /// Explain what func is, and how it can do whatever we want to do,
    /// Try to explain what parameter inside the func using analogy
    ///
    /// - Important: `  TEC057    I can successfully manage Functions in Swift func; Parameters and return value`
    ///
    func itIsBMICalculator (yourWeightInKg : Float , yourHeightInMeters : Float) {
       let yourBMI = yourWeightInKg / (yourHeightInMeters*yourHeightInMeters)
        let resultBounded = String(format: "%.2f", yourBMI)
        
        bmiValue.text = "\(resultBounded) Kg/m2"
        
        
        /// Conditionals Statement
        ///
        /// Explain what is conditional and how it works
        ///
        /// - Important: `TEC055    I can use Conditional Statements in Swift    if/else; switch/case;`
        ///

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

