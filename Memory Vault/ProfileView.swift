import SwiftUI

struct ProfileView: View {
    @State private var username: String = "User123"
    @State private var email: String = "user@example.com"
    
    var body: some View {
        ZStack {
            Color(red: 186/255, green: 194/255, blue: 170/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Username: \(username)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                
                Text("Email: \(email)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    // Handle edit profile action here
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
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
