import SwiftUI

struct MainScreen: View {
    let backgroundColor = Color(red: 186/255, green: 194/255, blue: 170/255)
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    var body: some View {
        VStack {
            Text("Your Time Capsules")
                .font(.title)
                .padding()

            Spacer()

            // List of capsules
            List {
                Text("Capsule 1")
                Text("Capsule 2")
                Text("Capsule 3")
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
//            let icons = ["calendar", "bell", "plus.circle.fill", "heart", "person.circle"]

            HStack {
                Spacer()
                Image(systemName: "calendar")
                Spacer()
                Image(systemName: "bell")
                Spacer()
                Image(systemName: "plus.circle.fill")
                Spacer()
                Image(systemName: "heart")
                Spacer()
                
                NavigationLink(destination: ProfileView()) {
                    Image(systemName: "person.circle")
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
                AddCapsuleView()
                ProfileView()
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
    
    let backgroundColor = Color(red: 186 / 255, green: 194 / 255, blue: 170 / 255)
    let buttonColor = Color(red: 78 / 255, green: 84 / 255, blue: 67 / 255)

    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Welcome to Memory Vault")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                    .multilineTextAlignment(.center)
                
                if !isLoggedIn {
                    Button(action: {
                        showLogin.toggle()
                    }) {
                        Text("Login")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(buttonColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    
                    Text("Don't have an account with us?")
                        .foregroundColor(buttonColor)
                        .padding(.top, 20)
                    
                    Button(action: {
                        // TODO: Implement account creation
                    }) {
                        Text("Create Account")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(buttonColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
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

