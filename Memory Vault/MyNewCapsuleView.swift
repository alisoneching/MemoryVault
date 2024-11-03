import SwiftUI

struct MyNewCapsuleView: View {
    // State properties for user input within the capsule view
    @State private var capsuleContent: String = ""
    @State private var isPrivate: Bool = false
    @State private var selectedCategory: String = "General"
    
    // Categories for the capsule content
    private let categories = ["General", "Personal", "Travel", "Work", "Memories"]
    
    var body: some View {
        ZStack {
            Color(red: 186/255, green: 194/255, blue: 170/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                // Title for the screen
                Text("My New Capsule")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding([.top, .horizontal])
                
                // Capsule content input
                Text("Enter Content")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                TextEditor(text: $capsuleContent)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(height: 150)
                    .padding(.horizontal)
                
                // Category picker
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
                
                // Save button
                Button(action: saveCapsule) {
                    Text("Save Capsule")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer() // Pushes content up for better layout
            }
            .padding()
        }
    }
    
    // Function to handle saving capsule content
    private func saveCapsule() {
        // Placeholder function for saving capsule content
        print("Capsule saved with content: \(capsuleContent), category: \(selectedCategory), private: \(isPrivate)")
    }
}
