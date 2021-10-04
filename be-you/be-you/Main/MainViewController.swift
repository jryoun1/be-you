//
//  MainViewController.swift
//  be-you
//
//  Created by wonhee on 2021/09/14.
//

import UIKit

// TODO: add navigationBar icon
class MainViewController: UIViewController {
    private enum Design {
        enum Text {
            static let navigationTitle = "색상 기록"
            static let description = "한 주의 색상을 차근 차근 채워보세요☺️"
        }

        enum Color {
            static let background = UIColor(rgb: 0xF9F9F9)
            static let descriptionText = UIColor(rgb: 0x8F8F8F)
            static let dateText = UIColor(rgb: 0x626262)
            static let addButton = UIColor(rgb: 0x626262)
        }

        enum Font {
            static let description = UIFont(type: .regular, size: 14)
            static let date = UIFont(type: .regular, size: 18)
            static let day = UIFont(type: .regular, size: 15)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Design.Color.background
        self.navigationItem.title = Design.Text.navigationTitle
    }
}

