//
//  Urls.swift
//  Wizipedia
//
//  Created by Tardes on 3/2/26.
//

import UIKit

func openUrl(_ url: String) {
    guard let url = URL(string: url) else {
        print("Invalid URL")

        return
    }

    UIApplication.shared.open(url)
}
