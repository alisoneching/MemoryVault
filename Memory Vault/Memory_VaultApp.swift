//
//  Memory_VaultApp.swift
//  Memory Vault
//
//  Created by Alison Ching on 10/20/24.
//

import SwiftUI

@main
struct Memory_VaultApp: App {
    //to access data in usersData class for all view
    @StateObject var usersData = userData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(usersData)
        }
    }
} 
