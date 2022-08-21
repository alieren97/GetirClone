//
//  GetirCollectionViewCell.swift
//  GetirClone
//
//  Created by Ali Eren on 21.08.2022.
//

import Foundation
import UIKit
import SnapKit

class GetirCollectionViewCell: UICollectionViewCell {
    static let identifier = "GetirCollectionViewCell"
    
    private lazy var  cellContainer: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(titleImageView)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        contentView.addSubview(cellContainer)
    }
    
    func setupLayout() {
        
        cellContainer.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(90)
        }
        
        titleImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.top.equalToSuperview().inset(5)
            make.height.equalTo(70)
            make.width.equalTo(30)
            
        }
    
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}


// MARK: - Configure
extension GetirCollectionViewCell {
    func configure(category: Category) {
        titleLabel.text = category.title
        titleImageView.image = UIImage(named: category.titleImage)
    }
}
