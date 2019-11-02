//
//  Extensions.swift
//  Recommendations
//
//  Created by Robert on 01/11/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
}
