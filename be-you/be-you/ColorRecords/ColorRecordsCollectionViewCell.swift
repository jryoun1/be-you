//
//  ColorRecordsCollectionViewCell.swift
//  be-you
//
//  Created by Yeon on 2021/11/30.
//

import UIKit

final class ColorRecordsCollectionViewCell: UICollectionViewCell {
    //MARK: - 크기를 고정사이즈로 할지 고민좀 해봐야할듯..
    private enum Design {
        enum Size {
            static let circleWidth: CGFloat = 84
        }
    }
    static let identifier = "ColorRecordsCollectionViewCell"
    
    private var colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Design.Size.circleWidth/2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
