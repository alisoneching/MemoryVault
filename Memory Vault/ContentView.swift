import SwiftUI

struct MainScreen: View {
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

struct AddCapsuleView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Create New Capsule")
            //font type
                .font(.title)
            //font color
                .foregroundColor(.white)
                .frame(width: 700, height: 50)
            //Set better color later
                .background(Rectangle().fill(Color.green))
                .border(Color.black)
            
            // Fields for creating a new time capsule
            TextField("Capsule Title", text: .constant(""))
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            //Add friends to Time Capsule
            Text("Invite some friends:")
            //font type
                .font(.title)
            //font color
                .foregroundColor(.white)
                .padding()
            
            Spacer()
            
            HStack{
                //Button to add friends
                Button("Invite"){
                    //Insert logic here later
                }
            }
            
            //Setting lock time
            Text("Set lock time:")
            //font type
                .font(.title)
            //font color
                .foregroundColor(.white)
            //font size
                .font(.system(size: 20))
            HStack{
                
            }
            
            //Setting unlock time
            Text("Set unlock time:")
            //font type
                .font(.title)
            //font color
                .foregroundColor(.white)
            //font size
                .font(.system(size: 20))
            HStack{
                
            }
            
            Button("Create"){
                //add stuff later
            }
        }
        
    }
}
    //Page to add stuff into the capsule
struct MyNewCapsule: View {
    var body: some View {
        VStack{
            Text("My New Capsule")
        }
    }
}

