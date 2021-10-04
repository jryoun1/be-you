//
//  MainViewController.swift
//  be-you
//
//  Created by Yeon on 2021/09/14.
//

import UIKit

class MainViewController: UIViewController {
    private enum Design {
        enum Text {
            static let navigationTitle = "색상 기록"
            static let description = "한 주의 색상을 차근 차근 채워보세요☺️"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = Design.Text.navigationTitle
    }
}

