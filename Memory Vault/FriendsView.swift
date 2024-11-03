import SwiftUI

struct FriendsView: View {
    let friends: [String] = ["Friend 1", "Friend 2", "Friend 3"]
    
    var body: some View {
        ZStack {
            Color(red: 186/255, green: 194/255, blue: 170/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Friends")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                List(friends, id: \.self) { friend in
                    HStack {
                        Text(friend)
                        Spacer()
                        Button(action: {
                            // Handle unfollow action here
                        }) {
                            Text("Unfollow")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}
