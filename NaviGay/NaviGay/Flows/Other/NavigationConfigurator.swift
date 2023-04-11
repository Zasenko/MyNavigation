//
//  NavigationConfigurator.swift
//  NaviGay
//
//  Created by Dmitry Zasenko on 11.04.23.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        let controller = UIViewController()
        DispatchQueue.main.async {
            if let navigationController = controller.navigationController {
                self.configure(navigationController)
                //print("Successfully obtained navigation controller")
            } else {
                //print("Failed to obtain navigation controller")
            }
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
    }
}
