//
//  convertView.swift
//  conversorApp
//
//  Created by Jeiel Lima on 12/12/23.
//

import UIKit

final class ConvertView: UIView {

    private lazy var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "0"
        resultLabel.textAlignment = .center
        resultLabel.textColor = UIColor(red: 22.0/255.0, green: 135.0/255.0, blue: 200.0/255.0, alpha: 1)
        resultLabel.font = .boldSystemFont(ofSize: 75)
        return resultLabel
    }()
    
    private lazy var resultUnitLabel: UILabel = {
        let resultUnitLabel = UILabel()
        resultUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        resultUnitLabel.text = "Label"
        resultUnitLabel.textColor = UIColor(red: 10.0/255.0, green: 85.0/255.0, blue: 93.0/255.0, alpha: 1)
        resultUnitLabel.font = UIFont.boldSystemFont(ofSize: 35)
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
    
    private func setupViewHierarchy() {
        addSubview(resultLabel)
        addSubview(resultUnitLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
        ])
    }
    
    func update(resultText: String, resultUnit: String) {
        resultLabel.text = resultText
        resultUnitLabel.text = resultUnit
    }
}

