import Foundation
import CoreImage
import Observation

/*
 Manages camera preview data
 Updates UI with current camera frame

 class ViewModel: ObservableObject{
     @Published var currentFrame: CGImage?
     private let cameraManager = CameraManager()
 
     //intialized ViewModel object
     init(){
         Task{
             await handleCameraPreviews()
         }//end of Task
     }//end of init
 
     //handles updates to AsyncStream and moves them to MainActor
     func handleCameraPreviews() async{
         for await image in cameraManager.previewStream{
             Task { @MainActor in
                 currentFrame = image
             }//end of Task
         }//end of for
     }//end of handleCameraPreview function
 }//end of ViewModel class
 */
