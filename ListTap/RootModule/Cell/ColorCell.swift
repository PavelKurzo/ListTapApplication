//
//  CustomCollectionViewCell.swift
//  collectionView
//
//  Created by Павел Курзо on 15.05.22.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    static let identifier = "ColorCell"
    
    let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 23
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(circleView)
        addSubview(numberLabel)
        addSubview(separatorView)
        setConstraints()
    }
    
    func set(data: CellModel, isFirst: Bool = false) {
        separatorView.isHidden = isFirst
        circleView.backgroundColor = data.displayedColor
        numberLabel.text = data.displayedValue
    }
    
    func setConstraints() {
        let constraints = [
            circleView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            circleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            circleView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            circleView.widthAnchor.constraint(equalToConstant: 46),
            
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            numberLabel.leftAnchor.constraint(equalTo: self.circleView.leftAnchor, constant: 42),
            numberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            numberLabel.widthAnchor.constraint(equalToConstant: 50),
            
            separatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            separatorView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            separatorView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
}
