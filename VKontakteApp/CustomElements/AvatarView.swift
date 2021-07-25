//
//  AvatarView.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 18.07.2021.
//



import UIKit

final class AvatarView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let shadowView: UIView = {
        let shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = .white
        return shadowView
    }()

    private var isBig = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        setGestures()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupConstraints()
        setGestures()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        viewSettings()
    }

    /// Установить аватарку
    func setImage(_ image: UIImage?) {
        imageView.image = image
    }

    private func setupViews() {
        addSubview(shadowView)
        addSubview(imageView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor),
            shadowView.leftAnchor.constraint(equalTo: leftAnchor),
            shadowView.rightAnchor.constraint(equalTo: rightAnchor),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)
    }

    private func viewSettings() {
        imageView.layer.cornerRadius = bounds.height/2
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.black.cgColor

        shadowView.layer.cornerRadius = bounds.height/2
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 5, height: 5)
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.9
    }

    @objc private func viewTapped() {
        if isBig {
            imageView.transform = .identity
        } else {
            imageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }
        isBig.toggle()
    }
}
