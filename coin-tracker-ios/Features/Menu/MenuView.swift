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
    
    @State var isPresented: Bool = false
}

struct MenuView: View {
    
    var viewModel = MenuViewModel()
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                MenuLogo()
                MenuList(viewModel: viewModel, isPresented: viewModel.isPresented)
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

struct MenuRow: View {
    @State var item: MenuItem
    @State var isPresented: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.isPresented.toggle()
            }, label: {
                Text(item.name)
                    .frame(width: 300, height: 50, alignment: .center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            })
                .cornerRadius(25)
                .sheet(isPresented: $isPresented, content: {
                    self.item.destination
                })
        }
    }
}

struct MenuList: View {
    
    @State var viewModel: MenuViewModel
    @State var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.menuItems) { item in
                MenuRow(item: item, isPresented: self.isPresented)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
