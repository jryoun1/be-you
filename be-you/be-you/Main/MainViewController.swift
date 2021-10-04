//
//  MainViewController.swift
//  be-you
//
//  Created by wonhee on 2021/09/14.
//

import UIKit

// TODO: add navigationBar icon, add scrollView(색깔 고르는 뷰 -> 애니메이션 필요한지? / 스펙이 제대로 안 나와서 지금 구현 못함)
class MainViewController: UIViewController {
    private enum Design {
        enum Text {
            static let navigationTitle = "색상 기록"
            static let description = "한 주의 색상을 차근 차근 채워보세요☺️"
            static let addButton = "+"
        }

        enum Color {
            static let background = UIColor(rgb: 0xF9F9F9)
            static let descriptionText = UIColor(rgb: 0x8F8F8F)
            static let dateText = UIColor(rgb: 0x626262)
            static let line = UIColor(rgb: 0xAEAEAE)
            static let addButtonBackground = UIColor(rgb: 0xBFF3F3F3)
            static let addButton = UIColor(rgb: 0x8C8C8C)
        }

        enum Font {
            static let description = UIFont(type: .regular, size: 14)
            static let date = UIFont(type: .regular, size: 18)
            static let day = UIFont(type: .regular, size: 15)
        }

        enum Constant {
            static let descriptionLabelTop: CGFloat = 65
            static let dateLabelTop: CGFloat = 60
            static let lineTop: CGFloat = 11
            static let dayTop: CGFloat = 28
            static let addButtonBottom: CGFloat = 120
        }

        enum Size {
            static let lineHeight: CGFloat = 0.5
            static let lineWidth: CGFloat = 100
            static let addButton: CGFloat = 38
        }

        static let addButtonRadius: CGFloat = 16
    }

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Design.Text.description
        label.textColor = Design.Color.descriptionText
        return label
    }()

    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.Font.date
        label.text = DateFormat.ymd()
        label.textColor = Design.Color.dateText
        return label
    }()

    private var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Design.Color.line
        return view
    }()

    private var dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Design.Font.day
        label.text = DateFormat.day()
        label.textColor = Design.Color.dateText
        return label
    }()

    private var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Design.Text.addButton, for: .normal)
        button.setTitleColor(Design.Color.addButton, for: .normal)
        button.backgroundColor = Design.Color.addButtonBackground
        button.clipsToBounds = true
        button.layer.cornerRadius = Design.addButtonRadius
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - UI Setting
    private func configureUI() {
        view.backgroundColor = Design.Color.background
        self.navigationItem.title = Design.Text.navigationTitle

        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Design.Constant.descriptionLabelTop),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Design.Constant.dateLabelTop),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Design.Constant.lineTop),
            lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: Design.Size.lineWidth),
            lineView.heightAnchor.constraint(equalToConstant: Design.Size.lineHeight)
        ])

        view.addSubview(dayLabel)
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: Design.Constant.dayTop),
            dayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Design.Constant.addButtonBottom),
            addButton.widthAnchor.constraint(equalToConstant: Design.Size.addButton),
            addButton.heightAnchor.constraint(equalToConstant: Design.Size.addButton),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

