//
//  RootView.swift
//  collectionView
//
//  Created by Павел Курзо on 14.05.22.
//

import Foundation
import UIKit

class RootView: UIView {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.identifier)
        return cv
    }()
    
    let stopStartButton: UIButton = {
        let button = UIButton()
        button.setTitle("START", for: .normal)
        button.backgroundColor = UIColor(red: 0.15, green: 0.79, blue: 0.57, alpha: 0.9)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let actionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(stopStartButton)
        addSubview(collectionView)
        addSubview(actionLabel)
        setConstraints()
    }
    
    func setConstraints() {
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            stopStartButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            stopStartButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            stopStartButton.heightAnchor.constraint(equalToConstant: 70),
            stopStartButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
            
            actionLabel.bottomAnchor.constraint(equalTo: stopStartButton.topAnchor, constant: -10),
            actionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
            actionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

