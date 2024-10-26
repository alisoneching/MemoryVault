import SwiftUI

struct MainScreen: View {
//    var body: some View {
//        VStack {
//            Text("Your Time Capsules")
//                .font(.title)
//                .padding()
//
//            Spacer()
//
//            // List of capsules
//            List {
//                Text("Capsule 1")
//                Text("Capsule 2")
//                Text("Capsule 3")
//            }
//
//            Spacer()
//
//            // Add capsule button
//            NavigationLink(destination: AddCapsuleView()) {
//                Text("Add New Capsule")
//                    .font(.headline)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            }
//            .padding()
//        }
//        .navigationTitle("Main Screen")
//    }
    let backgroundColor = Color(red: 186/255, green: 194/255, blue: 170/255)
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)

        var body: some View {
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
                    Image(systemName: "person.circle")
                    Spacer()
                }
                .padding()
                .background(boxColor)
                .foregroundColor(.white)
            }
            .background(backgroundColor.edgesIgnoringSafeArea(.all))
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
    //Colors needed
    let backgroundColor = Color(red: 186/255,green: 194/255, blue:170/255 )
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    let buttonColor = Color(red: 78/255, green: 84/255, blue: 67/255)
    var body: some View {
        ZStack{
            //set background color
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                Text("Create New Capsule")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .frame(width: 775, height: 50) //make frame around text
                //Color of the frame containing "Create New Capsule"
                    .background(Rectangle().fill(boxColor))
                    .border(boxColor)
                
                //Set Capsule Title
                TextField("Capsule Name", text: .constant(""))
                    .padding()
                    .foregroundColor(Color.gray) //text color
                    .background(Color.white) //background of box thing color
                    .border(boxColor) //background of box thing color
                    .cornerRadius(30) //shape of box
                    .padding()
                
                //Add friends to Time Capsule
                Text("Invite some friends:")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .padding()
                
                HStack{
                    //Button to add friends
                    Button("Invite"){
                        //Insert logic here later
                    }
                }
                
                //Setting lock time
                Text("Set lock time:")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .font(.system(size: 20)) //font size
                HStack{
                    
                }
                
                //Setting unlock time
                Text("Set unlock time:")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .font(.system(size: 20)) //font size
                HStack{
                    
                }
                
                //Create button that takes you to the page adding stuff to the capsule
                NavigationView{
                    VStack(alignment: .center){
                        NavigationLink(destination: MyNewCapsule()){
                            Text("Create") //What the button will say
                                .font(.title) //font title
                                .padding()
                                .foregroundColor(.white) //font color
                                .background(buttonColor) //background box color
                                .cornerRadius(1) //shape of button
                        }//end of NavigationLink
                        .buttonStyle(PlainButtonStyle()) //button shape
                    }//end of VStack
                    .navigationTitle("Create")
                }//end of Navigation View
            }//end of VStack
        }//end of ZStack
    }//end of body
}//end of AddCapsuleView

struct MyNewCapsule: View{
    var body: some View{
        VStack{
            Text("My New Capsule")
                .font(.title)
                .padding()
                .foregroundColor(.white)
        }//end of VStack
        .navigationTitle("My New Capsule")
    }//end of body
}//end of MyNewCapsule
