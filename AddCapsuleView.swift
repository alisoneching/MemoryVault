import SwiftUI
import PhotosUI
import Photos
import UIKit
import AVFoundation

struct AddCapsuleView: View {
    //Colors needed
    let backgroundColor = Color(red: 186/255,green: 194/255, blue:170/255)
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    let buttonColor = Color(red: 78/255, green: 84/255, blue: 67/255)
    /*
    let friendBoxColor = Color(red: 239/255, green: 245/255, blue: 239/255)
    
    //fake stand in list of friends
    let friendList = ["asjfnsk", "bsdnskj", "cskdcnsk"]
    */
    
    //For the date
    @StateObject private var lock = userData()
    @StateObject private var unlock = userData()
    
    //For storing capsule name
    @StateObject private var name = userData()
    
    //State property so we can go to MyNewCapsuleView
    //@StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack{
            //set background color
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text("CREATE NEW CAPSULE")
                    .font(.title) //font type
                    .bold()
                    .foregroundColor(.white) //font color
                    .frame(width: 775, height: 100) //make frame around text
                    //Color of the frame containing "Create New Capsule"
                    .background(Rectangle().fill(boxColor))
                    .border(boxColor)
               
                VStack(alignment: .leading) {
                    TextField("Enter capsule name", text: $name.capsuleName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                        .frame(width: 300, height: 50)
                }
                .padding(.vertical, 30)
                    
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
                
                // Setting lock time
                VStack(alignment: .leading) {
                    Text("Set Lock Time:")
                        .foregroundColor(.white)
                        .bold()
                                
                    DatePicker("", selection: $lock.lockTime, displayedComponents: [.date, .hourAndMinute])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                            .padding()
                            .cornerRadius(50)
                            .frame(height: 50)
                    }
                    .padding(.horizontal, 30)
                    
                //Setting unlock time
                VStack(alignment: .leading) {
                    Text("Set Unlock Time:")
                        .foregroundColor(.white)
                        .bold()
                        
                    DatePicker("", selection: $unlock.unlockTime, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .padding()
                        .cornerRadius(50)
                        .frame(height: 50)
                    }
                    .padding(.horizontal, 30)
                    
                //Create button that takes you to the page adding stuff to the capsule
                NavigationLink(destination: MyNewCapsuleView(name: name)){
                    Text("Create")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(buttonColor)
                        .cornerRadius(10)
                }//end of NavigationLink to MyNewCapsule Page
            }//end of VStack
        }//end of ZStack
        
        HStack {
            Spacer()
            Image(systemName: "calendar")
                .font(.system(size: 25))
            Spacer()
            NavigationLink(destination: NotificationsView()) {
                Image(systemName: "bell")
                    .font(.system(size: 25))

            }
            Spacer()
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 25))
            Spacer()
            NavigationLink(destination: FriendsView()) {
                Image(systemName: "heart")
                    .font(.system(size: 25))
            }
            Spacer()
            NavigationLink(destination: ProfileView()) {
                Image(systemName: "person.circle")
                    .font(.system(size: 25))
            }
            Spacer()
        }

        .padding()
        .background(boxColor)
        .foregroundColor(.white)
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }//end of body
}//end of AddCapsuleView



