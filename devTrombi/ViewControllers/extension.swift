//
//  extensions.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import UIKit

extension UIViewController {
    func alertError(error: Error) {
        let alertController = UIAlertController(title: "Oops ❗️", message: "Veuillez rééssayer plus tard. Erreur: \(error) ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
