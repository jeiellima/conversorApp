//
//  convertView.swift
//  conversorApp
//
//  Created by Jeiel Lima on 12/12/23.
//

import UIKit

class ConvertView: UIView {
    
    lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "0"
        resultLabel.textAlignment = .center
        resultLabel.textColor = UIColor(red: 21.0/255.0, green: 116.0/255.0, blue: 207.0/255.0, alpha: 1)
        resultLabel.font = .boldSystemFont(ofSize: 80)
        resultLabel.backgroundColor = UIColor(red: 128.0/255.0, green: 200.0/255.0, blue: 237.0/255.0, alpha: 1)
        resultLabel.layer.cornerRadius = 10
        return resultLabel
    }()
    
    lazy var resultUnitLabel: UILabel = {
        let resultUnitLabel = UILabel()
        resultUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        resultUnitLabel.text = "Label"
        resultUnitLabel.textColor = UIColor(red: 21.0/255.0, green: 116.0/255.0, blue: 207.0/255.0, alpha: 1)
        resultUnitLabel.font = UIFont.boldSystemFont(ofSize: 40)
        return resultUnitLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupViewHierarchy() {
        addSubview(resultLabel)
        addSubview(resultUnitLabel)
    }
    
     func setupConstraints() {
        NSLayoutConstraint.activate([
            resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 50),
            resultLabel.widthAnchor.constraint(equalToConstant: 300),
            resultLabel.heightAnchor.constraint(equalToConstant: 120),
            
            resultUnitLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultUnitLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 35)
        ])
    }
    
    func update(resultText: String, resultUnit: String) {
        resultLabel.text = resultText
        resultUnitLabel.text = resultUnit
    }
}

