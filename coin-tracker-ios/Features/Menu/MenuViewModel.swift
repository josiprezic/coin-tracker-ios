//
//  MenuViewModel.swift
//  coin-tracker-ios
//
//  Created by Korisnik on 18/10/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

class MenuViewModel {
    
    var menuItems = [
        MenuItem(name: "New Record", destination: SettingsView()),
        MenuItem(name: "Current status", destination: SettingsView()),
        MenuItem(name: "Statistics", destination: SettingsView()),
    ]
}
