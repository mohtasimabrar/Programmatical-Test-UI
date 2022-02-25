//
//  CollectionViewCell.swift
//  Test UI Programmatically
//
//  Created by BS236 on 25/2/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let label = UILabel()
    let picture = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        addConstraints()
    }
    
    func addElements() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Test Data"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        contentView.addSubview(label)
        
        picture.image = UIImage(named: "Sylhet")
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFit
        picture.clipsToBounds = true
        contentView.addSubview(picture)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20.0),
            
            picture.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -8),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            picture.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    // we have to implement this initializer, but will only ever use this class programmatically
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(text: String, image: String) {
        label.text = text
        picture.image = UIImage(named: image)
    }
    
    
}
