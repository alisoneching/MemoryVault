import SwiftUI

struct NotificationsView: View {
    let notifications: [String] = [
        "You have a new follower!",
        "Your capsule was unlocked!",
        "You have an invitation from User456."
    ]
    
    var body: some View {
        ZStack {
            Color(red: 186/255, green: 194/255, blue: 170/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Notifications")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                List(notifications, id: \.self) { notification in
                    Text(notification)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
        }
    }
}
