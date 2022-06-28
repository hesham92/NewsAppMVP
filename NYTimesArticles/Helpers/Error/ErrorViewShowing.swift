//
//  ErrorViewShowing.swift
//  InterViewTask
//
//  Created by Hesham Mohamed on 12/26/18.
//  Copyright © 2018 Hesham Mohamed. All rights reserved.
//

import UIKit
import NotificationBannerSwift

protocol ErrorViewShowing {
    func showError(_ error: Error)
}

extension ErrorViewShowing where Self: UIViewController {
    func showError(_ error: Error) {
        let banner = NotificationBanner(title: "Error!", subtitle: error.localizedDescription, style: .danger)
        banner.show()
    }
}
