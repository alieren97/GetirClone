//
//  SecondCategoryView.swift
//  GetirClone
//
//  Created by Ali Eren on 20.08.2022.
//

import Foundation
import UIKit
import SnapKit

final class GetirView: UIView,Layoutable {
    
    var headerView: HeaderView = {
        let header = HeaderView(frame: .zero, title: "getir")
        return header
    }()
    
    
    var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 100)
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collectionView.register(GetirCollectionViewCell.self, forCellWithReuseIdentifier: GetirCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,withReuseIdentifier: HeaderCollectionReusableView.identifier)
        collectionView.backgroundColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    func setupViews() {
        addSubview(headerView)
        addSubview(categoriesCollectionView)
    }
    
    func setupLayout() {
        headerView.snp.makeConstraints { make in
            make.trailing.top.leading.equalToSuperview()
            make.height.equalTo(130)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.trailing.leading.bottom.equalToSuperview()
        }
        
    }
    
}
