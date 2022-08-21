//
//  CollectionReusableView.swift
//  GetirClone
//
//  Created by Ali Eren on 21.08.2022.
//

import Foundation
import UIKit


class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    
    let urls: [String] = [
        "image1",
        "image2",
        "image3"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sliderView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var sliderView: UIView = {
        let view = UIView()
//        view.backgroundColor = .purple
        view.addSubview(carousel)
        return view
    }()
    
    lazy var carousel: Carousel = {
        let carousel = Carousel(frame: .zero, urls: urls)
        return carousel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        carousel.frame = bounds
        sliderView.frame = bounds
    }
    
    
}
