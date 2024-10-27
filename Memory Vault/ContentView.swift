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
    //Colors needed
    let backgroundColor = Color(red: 186/255,green: 194/255, blue:170/255 )
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    let buttonColor = Color(red: 78/255, green: 84/255, blue: 67/255)
    let friendBoxColor = Color(red: 239/255, green: 245/255, blue: 239/255)

    //fake stand in list of friends
    let friendList = ["a", "b", "c"]
    
    
    var body: some View {
            ZStack{
                //set background color
                backgroundColor.edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
                    Text("Create New Capsule")
                        .font(.title) //font type
                        .foregroundColor(.white) //font color
                        .frame(width: 775, height: 50) //make frame around text
                        //Color of the frame containing "Create New Capsule"
                        .background(Rectangle().fill(boxColor))
                        .border(boxColor)
                    
                    /*Set Capsule Title
                    Entering the name of the capsule
                    If no name is entered, the default name is "Capsule Name"
                    */
                    TextField("Capsule Name", text: .constant("Capsule Name"))
                        .padding()
                        .foregroundColor(Color.gray) //text color
                        .background(Color.gray.opacity(0.2)) //background of box thing color
                        .border(boxColor) //background of box thing color
                        .cornerRadius(30) //shape of box
                        .padding()
                    
                    //Add friends to Time Capsule
                    Text("Invite some friends:")
                        .font(.title) //font type
                        .foregroundColor(.white) //font color
                    
                    //Scroll through friends
                    //Add friends later
                    ScrollView{
                        VStack(alignment: .center, spacing: 10){
                            ForEach(friendList, id: \.self){ friend in
                                Text(friend)
                                    .padding()
                                    .foregroundColor(Color.black) //text color
                                    .background(friendBoxColor) //box background color
                                    .cornerRadius(1) //box shape
                                    .border(boxColor) //border color
                            }
                        }
                    }
                    //put button into scroll view later
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
                        
                    }//end of HStack for unlock time
                    
                    //Create button that takes you to the page adding stuff to the capsule
                    NavigationLink(destination: MyNewCapsuleView()){
                            Text("Create") //What the button will say
                                .font(.title) //font title
                                .padding()
                                .foregroundColor(.white) //font color
                                .background(buttonColor) //background box color
                                .cornerRadius(10) //shape of button
                    }//end of NavigationLink
                    .padding()
                }//end of VStack
            }//end of ZStack
           .navigationTitle("Add Capsule")
    }//end of body
}//end of AddCapsuleView

struct MyNewCapsuleView: View{
    var body: some View{
        VStack{
            Text("My New Capsule")
                .font(.title)
                .padding()
        }
        .navigationTitle("My New Capsule")
    }//end of body
}//end of MyNewCapsule
