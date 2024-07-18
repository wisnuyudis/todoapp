//
//  todoAppApp.swift
//  todoApp
//
//  Created by sdt on 04/04/24.
//

import SwiftUI

//MVVM
//Model - View - ViewModel

@main
struct todoAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
