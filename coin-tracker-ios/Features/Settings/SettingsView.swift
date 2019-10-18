//
//  SettingsView.swift
//  coin-tracker-ios
//
//  Created by Korisnik on 18/10/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("Settings View")
                Spacer()
            }
            Spacer()
        }
        .background(Color.red)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
