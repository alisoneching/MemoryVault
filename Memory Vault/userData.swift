//For data shared across views
import SwiftUI
import PhotosUI
import Photos
import UIKit
import AVFoundation

class userData: ObservableObject {
    //for setting the capsule name
    @Published var capsuleName: String = ""
    
    //for setting lock and unlock times for the capsule
    @Published var lockTime = Date()
    @Published var unlockTime = Date()
    
    //Picking photos
    @Published var userItems: [PhotosPickerItem] = []
    @Published var userImages: [Image] = []
    
    //Capsule Description
    @Published var capsuleContent: String = ""
}//end of userData

