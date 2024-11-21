import SwiftUI
import PhotosUI
import Photos
import UIKit
import AVFoundation

struct MainScreen: View {
    let backgroundColor = Color(red: 186/255, green: 194/255, blue: 170/255)
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    
    //to access data in usersData class
    @EnvironmentObject var usersData: userData
    
    var body: some View {
        VStack {
            Text("Your Time Capsules")
                .font(.title)
                .padding()

            Spacer()

            // List of capsules
            List {
                //Create button that takes you to the page adding stuff to the capsule
                NavigationLink(destination: Capsule1View()){
                    Text("Capsule 1: \(usersData.capsuleName)")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink to MyNewCapsule Page
                //Goes nowhere because only implemented 1 capsule
                //for decoration
                NavigationLink(destination: MainScreen()){
                    Text("Capsule 2:")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink
                //Goes nowhere because only implemented 1 capsule
                //for decoration
                NavigationLink(destination: MainScreen()){
                    Text("Capsule 3:")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink
            }
            
            Spacer()

            // Add capsule button
            NavigationLink(destination: AddCapsuleView()) {
                Text("Add New Capsule")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

        }
        .navigationTitle("Main Screen")
        //   var body: some View {
        VStack {
            // Top title
            Text("Memory Vault")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
            
            // Search bar
            TextField("Search for a Capsule", text: .constant(""))
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            
            
            Spacer()
            
            // Bottom tab bar
            let icons = ["calendar", "bell", "plus.circle.fill", "heart", "person.circle"]

            HStack {
                ForEach(icons, id: \.self) { icon in
                    Spacer()
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Spacer()
            }

            .padding()
            .background(boxColor)
            .foregroundColor(.white)
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
        }
    }
}
 
struct ContentView: View {
    
    @State private var isLoggedIn = false // Track login status
    @State private var showLogin = false // Show login screen if not logged in

    var body: some View {
        NavigationView {
            if isLoggedIn {
                // Main screen with the list of capsules
                MainScreen()
            } else {
                // Home screen with app name and options
                HomeScreen(isLoggedIn: $isLoggedIn, showLogin: $showLogin)
            }
        }
    }
}

struct HomeScreen: View {
    @Binding var isLoggedIn: Bool
    @Binding var showLogin: Bool

    var body: some View {
        VStack {
            Text("Memory Vault")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            if !isLoggedIn {
                Button("Create Account") {
                    // Code to handle account creation
                }
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Login") {
                    showLogin.toggle()
                }
                .font(.headline)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .sheet(isPresented: $showLogin) { // Use sheet for macOS
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Login to Memory Vault")
                .font(.title)
                .padding()

            // Simulated login fields
            TextField("Username", text: .constant("")) // Add proper binding
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()

            SecureField("Password", text: .constant("")) // Add proper binding
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()

            Button("Login") {
                // Here would be the authentication logic
                isLoggedIn = true
                presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

