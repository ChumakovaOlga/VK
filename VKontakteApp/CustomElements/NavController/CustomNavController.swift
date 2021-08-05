//
//  CustomNavController.swift
//  VKontakteApp
//
//  Created by Olga Chumakova on 31.07.2021.
//

import UIKit

final class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension CustomNavController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            return PopAnimator()
        case .push:
            return PushAnimator()
        default:
            return nil
        }
    }
}

