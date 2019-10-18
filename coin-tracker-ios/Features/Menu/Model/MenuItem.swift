//
//  MenuItem.swift
//  coin-tracker-ios
//
//  Created by Korisnik on 18/10/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var destination: SettingsView
}
