//
//  Images.swift
//  RecipesUI
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import UIKit

final class BundleHelper {
    static var main: Bundle {
        let moduleBundle = Bundle(for: self)
        let resourcesBundle = moduleBundle
            .path(forResource: "Images", ofType: "bundle")
            .flatMap(Bundle.init(path:))
        return resourcesBundle ?? moduleBundle
    }
}

public extension UIImage {

    static var noData: UIImage? {
        return UIImage(named: "empty", in: BundleHelper.main, with: nil)
    }

    static var noDataBox: UIImage? {
        return UIImage(named: "empty-box", in: BundleHelper.main, with: nil)
    }

    static var placeHolder: UIImage? {
        return UIImage(named: "placeholder", in: BundleHelper.main, with: nil)
    }
}
