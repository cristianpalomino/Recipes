//
//  NavigationController.swift
//  RecipesUI
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit

public final class NavigationController: UINavigationController {

    private lazy var darkModeSwitch: UISwitch = {
        let darkModeSwitch = UISwitch()
        darkModeSwitch.isOn = (traitCollection.userInterfaceStyle == .dark)
        darkModeSwitch.addTarget(self, action: #selector(darkModeSwitchChanged(_:)), for: .valueChanged)
        return darkModeSwitch
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    public func setup() {
        let switchItem = UIBarButtonItem(customView: darkModeSwitch)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        visibleViewController?.navigationItem.rightBarButtonItems = [spacer, switchItem]
    }

    @objc private func darkModeSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
}
