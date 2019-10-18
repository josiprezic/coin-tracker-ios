//
//  MenuView.swift
//  coin-tracker-ios
//
//  Created by Korisnik on 18/10/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var viewModel = MenuViewModel()
    @State var isDetailViewPresented = false
    @State var isSettingsViewPresented = false
    
    var body: some View {
        VStack(alignment: .trailing) {
            SettingsButtonView(isSettingsViewPresented: isSettingsViewPresented)
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
                        .sheet(isPresented: self.$isDetailViewPresented, content: { item.destination })
                    }
                    Spacer()
                }
                Spacer()
            }
            .background(GradientView())
        }
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
            .cornerRadius(25)
    }
}

struct SettingsButtonView: View {
    
    @State var isSettingsViewPresented: Bool
    
    var body: some View {
        Button(action: {
            self.isSettingsViewPresented.toggle()
        }, label: {
            Image("settings")
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
        })
            .frame(width: 40, height: 40)
            .offset(x: -10)
            .zIndex(1)
            .foregroundColor(Color.white)
            .sheet(isPresented: $isSettingsViewPresented) { SettingsView() }
    }
}

struct GradientView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.black, .green]),
                       startPoint: UnitPoint(x: 0.5, y: 0.0),
                       endPoint: UnitPoint(x: 0.5, y: 1.0))
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
