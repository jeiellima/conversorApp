//
//  ViewController.swift
//  conversorApp
//
//  Created by Jeiel Lima on 12/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var convertLabel: UILabel!
    var numberTextField: UITextField!
    var buttonUnit1: UIButton!
    var buttonUnit2: UIButton!
    var buttonConvert: UIButton!
    
    let screenSize: CGRect = UIScreen.main.bounds
    lazy var convertView: ConvertView = {
        let frame = CGRect(x: 0, y: 320, width: screenSize.width, height: screenSize.height)
        let convertView = ConvertView(frame: frame)
        convertView.backgroundColor = .white
        convertView.translatesAutoresizingMaskIntoConstraints = false
        convertView.isHidden = false
        return convertView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor(red: 22.0/255.0, green: 135.0/255.0, blue: 200.0/255.0, alpha: 1)
        
        convertLabel = UILabel()
        convertLabel.translatesAutoresizingMaskIntoConstraints = false
        convertLabel.text = "Temperatura"
        convertLabel.font = .boldSystemFont(ofSize: 50)
        convertLabel.textColor = .white
        convertLabel.textAlignment = .center
        view.addSubview(convertLabel)
        
        numberTextField = UITextField()
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.text = "0"
        numberTextField.font = .boldSystemFont(ofSize: 75)
        numberTextField.textColor = .white
        numberTextField.textAlignment = .center
        numberTextField.backgroundColor = UIColor(red: 95.0/255.0, green: 190.0/255.0, blue: 250.0/255.0, alpha: 1)
        numberTextField.layer.cornerRadius = 10
        view.addSubview(numberTextField)
        
        buttonUnit1 = UIButton()
        buttonUnit1.translatesAutoresizingMaskIntoConstraints = false
        buttonUnit1.setTitle("Celsius", for: .normal)
        buttonUnit1.backgroundColor = UIColor(red: 100.0/255.0, green: 170.0/255.0, blue: 255.0/255.0, alpha: 1)
        buttonUnit1.layer.cornerRadius = 10
        view.addSubview(buttonUnit1)
        
        buttonUnit2 = UIButton()
        buttonUnit2.translatesAutoresizingMaskIntoConstraints = false
        buttonUnit2.setTitle("Farenheint", for: .normal)
        buttonUnit2.backgroundColor = UIColor(red: 80.0/255.0, green: 140.0/255.0, blue: 255.0/255.0, alpha: 1)
        buttonUnit2.layer.cornerRadius = 10
        buttonUnit2.layer.borderWidth = 0.5
        buttonUnit2.layer.borderColor = UIColor.white.cgColor
        view.addSubview(buttonUnit2)
        
        buttonConvert = UIButton()
        buttonConvert.translatesAutoresizingMaskIntoConstraints = false
        buttonConvert.setTitle("TROCAR UNIDADE", for: .normal)
        view.addSubview(buttonConvert)
        
        self.view.addSubview(convertView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            convertLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 35),
            convertLabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            
            numberTextField.topAnchor.constraint(equalTo: convertLabel.bottomAnchor, constant: 15),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.widthAnchor.constraint(equalToConstant: 300),
            numberTextField.heightAnchor.constraint(equalToConstant: 120),
            
            buttonConvert.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 10),
            buttonConvert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
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
