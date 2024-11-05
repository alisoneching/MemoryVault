import SwiftUI
/*
    Since we scaled down, I removed the friends section
    Can comment back in if changed mind
    - Elsa
 */


struct AddCapsuleView: View {
    //Colors needed
    let backgroundColor = Color(red: 186/255,green: 194/255, blue:170/255 )
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    let buttonColor = Color(red: 78/255, green: 84/255, blue: 67/255)
    /*
    let friendBoxColor = Color(red: 239/255, green: 245/255, blue: 239/255)
    
    //fake stand in list of friends
    let friendList = ["asjfnsk", "bsdnskj", "cskdcnsk"]
    */
    
    //For the date
    @State private var unlockTime = Date()
    @State private var lockTime = Date()
    
    //For storing capsule name
    @State private var capsuleName: String = ""
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
                    
                //Set Capsule Name
                TextField("Capsule Name", text: $capsuleName)
                    //.padding()
                    .foregroundColor(Color.gray) //text color
                    .background(Color.gray.opacity(0.2)) //background of box thing color
                    .border(boxColor) //background of box thing color
                    .cornerRadius(30) //shape of box
                    .frame(width: 250, height: 100) //size of box
                    
                /*
                //Scroll through friends
                //Add friends later
                ScrollView{
                    VStack(alignment: .center, spacing: 10){
                        ForEach(friendList, id: \.self){ friend in
                                Text( friend)
                                    .padding()
                                    .foregroundColor(Color.black) //text color
                                    .background(friendBoxColor) //box background color
                                    .cornerRadius(1) //box shape
                                    .border(boxColor) //border color
                            }//end of friends list
                        }//end of VStack for friends list
                    }//end of ScrollView for friends list
                    //put button into scroll view later
                HStack{
                    //Button to add friends
                    Button("Invite"){
                        //Insert logic here later
                    }
                }//end of HStack for invite button
                */
                    
                //Setting lock time
                Text("Set lock time:")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .font(.system(size: 20)) //font size
                //Date thing
                DatePicker("", selection: $lockTime, displayedComponents: [.date, .hourAndMinute])
                    .frame(width: 175, height: 50)
                    
                //Setting unlock time
                Text("Set unlock time:")
                    .font(.title) //font type
                    .foregroundColor(.white) //font color
                    .font(.system(size: 20)) //font size
                //Date thing
                DatePicker("", selection: $unlockTime, displayedComponents: [.date, .hourAndMinute])
                    .frame(width: 175, height: 50)
                    
                //Create button that takes you to the page adding stuff to the capsule
                NavigationLink(destination: MyNewCapsuleView()) {
                    Text("Create")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink to MyNewCapsule Page
                .padding()
                .padding()
                    
                //Icons
                
                HStack{
                    //Button to send user to something Page
                    NavigationLink(destination: NotificationsView()){
                        Image("today")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 45)
                    }//end of NavigationLink for
                    
                    //Button to send user to Notifications Page
                    NavigationLink(destination: NotificationsView()){
                        Image("Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 45)
                    }//end of NavigationLink for Notifications Page button
                    
                    //Just an image for add capsule
                    Image("add")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 45)
                    
                    //Button to send user to Friends Page
                    NavigationLink(destination: FriendsView()){
                        Image("favorite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 45)
                    }//end of NavigationLink for Friends page button
                        
                        //Button to send user to Profile Page
                    NavigationLink(destination: ProfileView()){
                        Image("account_circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 45)
                    }//end of NavigationLink for Profile Page button
                }//end of HStack for icons
                .frame(width: 775, height: 75) //make frame around icons
                //Color of the frame containing the icons
                .background(Rectangle().fill(boxColor))
                .border(boxColor)
            }//end of VStack
        }//end of ZStack
    }//end of body
}//end of AddCapsuleView

