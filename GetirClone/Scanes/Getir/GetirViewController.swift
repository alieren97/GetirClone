//
//  SecondCategoryViewController.swift
//  GetirClone
//
//  Created by Ali Eren on 20.08.2022.
//

import Foundation
import UIKit

final class GetirViewController: UIViewController, Layouting{
    
    typealias ViewType = GetirView
    
    var itemList: [Category] = [Category(title: "Yeni Ürünler", titleImage: "getirLogo"),
                                Category(title: "İndirimler", titleImage: "getirLogo"),
                                Category(title: "Bana Özel", titleImage: "getirLogo"),
                                Category(title: "Su & İçeçek", titleImage: "getirLogo"),
                                Category(title: "Meyve & Sebze", titleImage: "getirLogo"),
                                Category(title: "Fırından", titleImage: "getirLogo"),
                                Category(title: "Yeni Ürünler", titleImage: "getirLogo"),
                                Category(title: "İndirimler", titleImage: "getirLogo"),
                                Category(title: "Bana Özel", titleImage: "getirLogo"),
                                Category(title: "Su & İçeçek", titleImage: "getirLogo"),
                                Category(title: "Meyve & Sebze", titleImage: "getirLogo"),
                                Category(title: "Fırından", titleImage: "getirLogo"),
                                Category(title: "Yeni Ürünler", titleImage: "getirLogo"),
                                Category(title: "İndirimler", titleImage: "getirLogo"),
                                Category(title: "Bana Özel", titleImage: "getirLogo"),
                                Category(title: "Su & İçeçek", titleImage: "getirLogo"),
                                Category(title: "Meyve & Sebze", titleImage: "getirLogo")]
    
    override func loadView() {
        view = ViewType.create()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1)
        setupCollectionView()
    }
    
    
}

extension GetirViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func setupCollectionView() {
        layoutableView.categoriesCollectionView.delegate = self
        layoutableView.categoriesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GetirCollectionViewCell.identifier,
                                                            for: indexPath) as? GetirCollectionViewCell else { return UICollectionViewCell() }
        let item = itemList[indexPath.row]
        cell.configure(category:item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 90, height: 100)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.width/1.2)
    }
    
}
