//
//  ViewController.swift
//  ColorMixer
//
//  Created by Artyom Gurbovich on 10/30/19.
//  Copyright © 2019 Artyom Gurbovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var hexCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.cornerRadius = 15
        colorView.layer.borderWidth = 1
        updateColor()
        updateControls()
    }

    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    @IBAction func resetClicked(_ sender: UIButton) {
        redSwitch.setOn(false, animated: true)
        greenSwitch.setOn(false, animated: true)
        blueSwitch.setOn(false, animated: true)
        redSlider.setValue(1, animated: true)
        greenSlider.setValue(1, animated: true)
        blueSlider.setValue(1, animated: true)
        updateColor()
        updateControls()
    }
    
    func updateColor() {
        let red: CGFloat = redSwitch.isOn ? CGFloat(redSlider.value) : 0
        let green: CGFloat = greenSwitch.isOn ? CGFloat(greenSlider.value) : 0
        let blue: CGFloat = blueSwitch.isOn ? CGFloat(blueSlider.value) : 0
        redLabel.text = String(Int(red * 255.0))
        greenLabel.text = String(Int(green * 255.0))
        blueLabel.text = String(Int(blue * 255.0))
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
        hexCodeLabel.text = "Hex code: \(color.toHex()!)"
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        redLabel.isEnabled = redSwitch.isOn
        greenLabel.isEnabled = greenSwitch.isOn
        blueLabel.isEnabled = blueSwitch.isOn
    }
    
}

extension UIColor {
    func toHex(alpha: Bool = false) -> String? {
        let components = cgColor.components!
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        return String(format: "%02lX%02lX%02lX", Int(round(r * 255)), Int(round(g * 255)), Int(round(b * 255)))
    }
}
