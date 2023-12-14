//
//  ViewController.swift
//  conversorApp
//
//  Created by Jeiel Lima on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var unitLabel: UILabel!
    var numberTextField: UITextField!
    var buttonUnit1: UIButton!
    var buttonUnit2: UIButton!
    var switchButton: UIButton!
    
    let colorLight = UIColor(red: 100.0/255.0, green: 170.0/255.0, blue: 255.0/255.0, alpha: 1)
    let colorDark = UIColor(red: 80.0/255.0, green: 140.0/255.0, blue: 255.0/255.0, alpha: 1)
    
    let screenSize: CGRect = UIScreen.main.bounds
    lazy var convertView: ConvertView = {
        let frame = CGRect(x: 0, y: 320, width: screenSize.width, height: screenSize.height)
        let convertView = ConvertView(frame: frame)
        convertView.backgroundColor = .white
        convertView.translatesAutoresizingMaskIntoConstraints = false
        convertView.isHidden = true
        return convertView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 22.0/255.0, green: 135.0/255.0, blue: 200.0/255.0, alpha: 1)
        
        unitLabel = UILabel()
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.text = "Temperatura"
        unitLabel.font = .boldSystemFont(ofSize: 50)
        unitLabel.textColor = .white
        unitLabel.textAlignment = .center
        view.addSubview(unitLabel)
        
        numberTextField = UITextField()
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.text = "0"
        numberTextField.font = .boldSystemFont(ofSize: 80)
        numberTextField.textColor = .white
        numberTextField.textAlignment = .center
        numberTextField.isUserInteractionEnabled = true
        numberTextField.backgroundColor = UIColor(red: 95.0/255.0, green: 190.0/255.0, blue: 250.0/255.0, alpha: 1)
        numberTextField.layer.cornerRadius = 10
        view.addSubview(numberTextField)
        
        buttonUnit1 = UIButton()
        buttonUnit1.translatesAutoresizingMaskIntoConstraints = false
        buttonUnit1.setTitle("Celsius", for: .normal)
        buttonUnit1.addTarget(self, action: #selector(convert), for: .touchUpInside)
        buttonUnit1.backgroundColor = colorDark
        buttonUnit1.layer.cornerRadius = 10
        view.addSubview(buttonUnit1)
        
        buttonUnit2 = UIButton()
        buttonUnit2.translatesAutoresizingMaskIntoConstraints = false
        buttonUnit2.setTitle("Farenheint", for: .normal)
        buttonUnit2.addTarget(self, action: #selector(convert), for: .touchUpInside)
        buttonUnit2.backgroundColor = colorLight
        buttonUnit2.layer.cornerRadius = 10
        view.addSubview(buttonUnit2)
        
        switchButton = UIButton()
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.setTitle("TROCAR UNIDADE", for: .normal)
        switchButton.addTarget(self, action: #selector(switchUnit), for: .touchUpInside)
        view.addSubview(switchButton)
        
        self.view.addSubview(convertView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            unitLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35),
            unitLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            numberTextField.topAnchor.constraint(equalTo: unitLabel.bottomAnchor, constant: 15),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.widthAnchor.constraint(equalToConstant: 300),
            numberTextField.heightAnchor.constraint(equalToConstant: 120),
            
            switchButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 10),
            switchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonUnit1.topAnchor.constraint(equalTo: numberTextField.layoutMarginsGuide.bottomAnchor, constant: 90),
            buttonUnit1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            buttonUnit1.widthAnchor.constraint(equalToConstant: 100),
            buttonUnit1.heightAnchor.constraint(equalToConstant: 40),
            
            buttonUnit2.topAnchor.constraint(equalTo: numberTextField.layoutMarginsGuide.bottomAnchor, constant: 90),
            buttonUnit2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: +100),
            buttonUnit2.widthAnchor.constraint(equalToConstant: 100),
            buttonUnit2.heightAnchor.constraint(equalToConstant: 40),
            
            convertView.topAnchor.constraint(equalTo: view.centerYAnchor),
            convertView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            convertView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            convertView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func switchUnit(_ sender: UIButton) {
        switch unitLabel.text! {
            case "Temperatura":
                unitLabel.text = "Peso"
                buttonUnit1.setTitle("Quilograma (kg)", for: .normal)
                buttonUnit2.setTitle("Libra (lb)", for: .normal)
            case "Peso":
                unitLabel.text = "Moeda"
                buttonUnit1.setTitle("Real (R$)", for: .normal)
                buttonUnit2.setTitle("Dólar (US$)", for: .normal)
            case "Moeda":
                unitLabel.text = "Distância"
                buttonUnit1.setTitle("Metro (m)", for: .normal)
                buttonUnit2.setTitle("Kilometros (km)", for: .normal)
            default:
                unitLabel.text = "Temperatura"
                buttonUnit1.setTitle("Celsius (ºC)", for: .normal)
                buttonUnit2.setTitle("Farenheint (F)", for: .normal)
        }
        convert(nil)
    }
    
    @objc func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == buttonUnit1 {
                buttonUnit2.backgroundColor = colorLight
            } else {
                buttonUnit1.backgroundColor = colorLight
            }
            sender.backgroundColor = colorDark
            convertView.isHidden = false
        }
        switch unitLabel.text! {
            case "Temperatura":
                calcTemp()
            case "Peso":
                calcPeso()
            case "Moeda":
                calcMoeda()
            default:
                calcDistance()
        }
    }
    
    func calcTemp() {
        guard let temperature = Double(numberTextField.text!) else {return}
        if buttonUnit1.backgroundColor == colorDark {
            convertView.resultUnitLabel.text = "Farenheint"
            convertView.resultLabel.text = String(temperature * 1.8 + 32.0)
        } else {
            convertView.resultUnitLabel.text = "Celsius"
            convertView.resultLabel.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcPeso() {
        guard let peso = Double(numberTextField.text!) else {return}
        if buttonUnit1.backgroundColor == colorDark {
            convertView.resultUnitLabel.text = "Libra (lb)"
            convertView.resultLabel.text = String(peso / 2.2046)
        } else {
            convertView.resultUnitLabel.text = "Quilograma (kg)"
            convertView.resultLabel.text = String(peso * 2.2046)
        }
        
    }
    
    func calcMoeda() {
        guard let moeda = Double(numberTextField.text!) else {return}
        if buttonUnit1.backgroundColor == colorDark {
            convertView.resultUnitLabel.text = "Dólar (US$)"
            convertView.resultLabel.text = String(moeda / 4.9)
        } else {
            convertView.resultUnitLabel.text = "Real (R$)"
            convertView.resultLabel.text = String(moeda * 4.9)
        }
    }
    
    func calcDistance() {
        guard let distance = Double(numberTextField.text!) else {return}
        if buttonUnit1.backgroundColor == colorDark {
            convertView.resultUnitLabel.text = "Kilometros (km)"
            convertView.resultLabel.text = String(distance / 1000)
        } else {
            convertView.resultUnitLabel.text = "Metros (m)"
            convertView.resultLabel.text = String(distance * 1000)
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: UIViewControllerRepresentableContext<UIViewControllerPreview<ViewController>>) {
        return
    }
}

#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone 11 Pro Max",
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
  static var previews: some View {
    ForEach(deviceNames, id: \.self) { deviceName in
      UIViewControllerPreview {
        ViewController()
      }.previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
  }
}
#endif
