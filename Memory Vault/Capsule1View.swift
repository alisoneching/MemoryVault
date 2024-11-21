import SwiftUI
import PhotosUI
import Photos
import UIKit
import AVFoundation

struct Capsule1View: View {
    //Colors needed
    let backgroundColor = Color(red: 186/255,green: 194/255, blue:170/255)
    let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    let buttonColor = Color(red: 78/255, green: 84/255, blue: 67/255)
  
    //to access data in usersData class
    @EnvironmentObject var usersData: userData
    
    var body: some View {
        ZStack{
            //set background color
            backgroundColor.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                //Name of capsule
                Text("My Capsule: \(usersData.capsuleName)")
                    .font(.title)
                    .foregroundStyle(.white)
                
                Text("Capsule Description: ")
                Text("\(usersData.capsuleContent)")
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(minWidth: 100, minHeight: 50, alignment: .center)
                    .padding(.horizontal)
                
                //Show user selected photos
                ScrollView(.vertical, showsIndicators: false){
                    VStack(){
                        ForEach(usersData.userImages.indices, id: \.self){index in
                            usersData.userImages[index]
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }//end of for loop
                    }//end of VStack
                }//end of ScrollView
                //box if no images are selected
                if usersData.userImages.isEmpty{
                    Text("No Images Chosen")
                }//end of if
                
                //All Done button: takes you back to main screen
                NavigationLink(destination: MainScreen()){
                    Text("All Done!")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink to MainScreen Page
                
                Spacer()
                
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
                    
                    //Button to send user to Add Capsule Page
                    NavigationLink(destination: AddCapsuleView()){
                        Image("add")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 45)
                    }//end of NavigationLink for Add Capsule Page button
                    
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
}//end of Capsule1View



