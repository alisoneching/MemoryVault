import SwiftUI
import PhotosUI
import Photos
import UIKit
import AVFoundation

struct MyNewCapsuleView: View {
    //State properties for user input within the capsule view
    @State private var capsuleContent: String = ""
    @State private var isPrivate: Bool = false
    @State private var selectedCategory: String = "General"

    //to access data in usersData class
    @EnvironmentObject var usersData: userData
    
    //Categories for the capsule content
    private let categories = ["General", "Personal", "Travel", "Work", "Memories"]
    
    var body: some View {
        ZStack {
            Color(red: 186/255, green: 194/255, blue: 170/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                //Title for the screen
                Text("My New Capsule")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding([.top, .horizontal])
                
                //Name of capsule
                Text("Capsule Name: \(usersData.capsuleName)")
                    .font(.title)
                    .foregroundStyle(.white)
                
                //for adding existings photos
                PhotosPicker("Select your photos", selection: $usersData.userItems, matching:.images, photoLibrary: .shared())
                    .onChange(of: usersData.userItems) { newItems in
                        usersData.userImages = []
                        Task {
                            for item in newItems{
                                if let data = try? await item.loadTransferable(type: Data.self),
                                    let uiImage = UIImage(data: data){
                                    usersData.userImages.append(Image(uiImage: uiImage))
                                }//end of if
                                else{
                                    print("Failed to load photo(s). Please try again")
                                }//end of else
                            }//end of for loop
                        }//end of Taskl
                    }//end of PhotosPicker
                //Show user selected photos
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10){
                        ForEach(usersData.userImages.indices, id: \.self){index in
                            usersData.userImages[index]
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }//end of for loop
                    }//end of HStack
                }//end of ScrollView
                //box if no images are selected
                if usersData.userImages.isEmpty{
                    Text("Please choose your photo(s)")
                }//end of if
                
                /*
                //For taking videos
                GeometryReader{ geometry in
                    if let image = image{
                        Image(decorative: image, scale: 1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width,
                                    height: geometry.size.height)
                    }//end of if
                }//end of Geometry Reader
                */
                 
                //Capsule content input
                Text("Add a description for your capsule")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)
                TextEditor(text: $usersData.capsuleContent)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .frame(height: 75)
                .padding(.horizontal)
                    
                //to display images
              //  MyNewCapsuleView(image: $viewModel.currentFrame)
                    
                //Category picker
                Text("Select Category")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                    
                // Privacy toggle
                Toggle(isOn: $isPrivate) {
                    Text("Make Private")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                //takes user to Capsule1View to view final capsule after creation
                NavigationLink(destination: Capsule1View()){
                    Text("Save")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }//end of NavigationLink to Capsule1View
                
                Spacer() // Pushes content up for better layout
            }//end of VStack
            .padding()
        }//end of ZStack
    }//end of body
    // Function to handle saving capsule content
    private func saveCapsule() {
        // Placeholder function for saving capsule content
        print("Capsule saved with content: \(capsuleContent), category: \(selectedCategory), private: \(isPrivate)")
    }//end of saveCapsule function
}//end of MyCapsuleView
