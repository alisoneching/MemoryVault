import SwiftUI

struct AddCapsuleView: View {
    // Define colors
    private let backgroundColor = Color(red: 186/255, green: 194/255, blue: 170/255)
    private let boxColor = Color(red: 105/255, green: 113/255, blue: 90/255)
    private let friendBoxColor = Color(red: 239/255, green: 245/255, blue: 239/255)
    
    // Dummy list of friends
    private let friendList = ["Alice", "Bob", "Charlie"]
    
    // State properties for user input
    @State private var capsuleName: String = ""
    @State private var lockTime: Date = Date()
    @State private var unlockTime: Date = Date()
    
    var body: some View {
        ZStack {
            // Background color for entire view
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                // Title
                Text("Create New Capsule")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(boxColor)
                
                // Capsule Name TextField
                TextField("Capsule Name", text: $capsuleName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Friends list (scrollable)
                ScrollView {
                    VStack(alignment: .center, spacing: 10) {
                        ForEach(friendList, id: \.self) { friend in
                            Text(friend)
                                .padding()
                                .background(friendBoxColor)
                                .cornerRadius(10)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal)
                }
                
                // Lock time picker
                Text("Set lock time:")
                    .font(.headline)
                    .foregroundColor(.white)
                DatePicker("", selection: $lockTime, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.horizontal)
                
                // Unlock time picker
                Text("Set unlock time:")
                    .font(.headline)
                    .foregroundColor(.white)
                DatePicker("", selection: $unlockTime, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding(.horizontal)
                
                // Create button
                NavigationLink(destination: MyNewCapsuleView()) {
                    Text("Create")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}
