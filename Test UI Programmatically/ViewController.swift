//
//  ViewController.swift
//  Test UI Programmatically
//
//  Created by BS236 on 23/2/22.
//

import UIKit

class ViewController: UIViewController {
    let cars = ["Chevrolet Onix", "Chevrolet Spin", "Fiat Strada", "Ford Ka+", "Hyundai Tucson", "Tata Tiago", "Toyota Avanza", "Toyota Fortuner", "Toyota HiAce", "Toyota Hilux", "Toyota Innova", "Toyota Matrix"]
    
    var collectionView: UICollectionView!
    let screenSize: CGRect = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.backgroundColor = .lightGray
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func loadView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = screenSize.width
        
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 40, left: width * 0.07, bottom: 10, right: width * 0.07)
        layout.itemSize = CGSize(width: width * 0.4, height: (width * 0.4) * 1.3)
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view = collectionView
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            let car = cars[indexPath.item]
            
            cell.setupCell(text: car, image: car)
            cell.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
            cell.layer.cornerRadius = 8.0
            
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}

