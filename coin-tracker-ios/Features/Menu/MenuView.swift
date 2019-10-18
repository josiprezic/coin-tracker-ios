//
//  MenuView.swift
//  coin-tracker-ios
//
//  Created by Korisnik on 18/10/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var destination: SettingsView
}

class MenuViewModel {
    
    var menuItems = [
        MenuItem(name: "New Record", destination: SettingsView()),
        MenuItem(name: "Current status", destination: SettingsView()),
        MenuItem(name: "Statistics", destination: SettingsView()),
        MenuItem(name: "Settings", destination: SettingsView())
    ]
}

struct MenuView: View {
    
    var viewModel = MenuViewModel()
    @State var isDetailViewPresented = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 12) {
                Spacer()
                MenuLogo()
                ForEach(viewModel.menuItems) { item in
                    Button(action: {
                        self.isDetailViewPresented.toggle()
                    }, label: {
                        MenuItemView(name: item.name)
                    })
                        .cornerRadius(25)
                        .sheet(isPresented: self.$isDetailViewPresented, content: {
                            item.destination
                        })
                }
                Spacer()
            }
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [.black, .green]),
                                   startPoint: UnitPoint(x: 0.5, y: 0.0),
                                   endPoint: UnitPoint(x: 0.5, y: 1.0)))
    }
}

struct MenuLogo: View {
    var body: some View {
        Image("coin")
            .resizable()
            .frame(width:100, height: 100)
            .padding(30)
    }
}

struct MenuItemView: View {
    @State var name: String
    
    var body: some View {
        Text(name)
            .frame(width: 300, height: 50, alignment: .center)
            .background(Color.blue)
            .foregroundColor(Color.white)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
