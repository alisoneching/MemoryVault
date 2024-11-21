import Foundation
import AVFoundation

/*
    Manages camera session
    Captures video fframs
    Streams it to CGImage

class CameraManager: NSObject {
    //let = can't change, var = can chnage
    private let captureSession = AVCaptureSession() //real time video capture
    private var deviceInput: AVCaptureDeviceInput? //media input from capture device to a capture session
    private var videoOutput: AVCaptureVideoDataOutput? //get access to video frames for processing
    private let systemPreferredCamera = AVCaptureDevice.default(for: .video) //represents device that captures video
    private var sessionQueue = DispatchQueue(label: "video.preview.session") //ensures frames are delivered correctly
    private var addToPreviewStream: ((CGImage) -> Void)?
    
    //ask for permission to open camera
    private var isAuthorized: Bool{
        get async{
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            
            //check if user has already given permission
            var isAuthorized = status == .authorized
            
            //prompt for permission if no permission
            if status == .notDetermined{
                isAuthorized = await AVCaptureDevice.requestAccess(for: .video)
            }//end of if statement
            return isAuthorized
        }//end of async
    }//end of check permission
    
    lazy var previewStream: AsyncStream<CGImage> = {
        AsyncStream { continuation in
            addToPreviewStream = { cgImage in
                continuation.yield(cgImage)
            }//end of addToPreviewStream
        }//end of AsyncStream
    }()//end of previewStream
    
    override init(){
        super.init()
        
        Task{
            await configureSession()
            await startSession()
        }//end of Task
    }//end of override init
    
    //initializing properties and defining the buffer delegate
    private func configureSession() async{
        //check if user has given authorization to camera
        guard await isAuthorized,
                let systemPreferredCamera,
                let deviceInput = try? AVCaptureDeviceInput(device: systemPreferredCamera)
        else{ return }
        
        //start configuration
        captureSession.beginConfiguration()
        
        //commit configuration to running session
        defer{
            self.captureSession.commitConfiguration()
        }//end of defer
        
        //Define video output, queue for callbacks
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self, queue: sessionQueue)
        
        //check if input can be added to captureSession
        guard captureSession.canAddInput(deviceInput) else {
            print("unable to add device input to capture session.")
            return
        }//end of captureSession
        
        //check if output can be added to captureSession
        guard captureSession.canAddOutput(videoOutput) else{
            print("Unable to add video output to capture session.")
            return
        }//end fo captureSession
        
        //add input and output to AVCaptureSession
        captureSession.addInput(deviceInput)
        captureSession.addOutput(videoOutput)
    }//end of configureSession function
    
    //start camera
    private func startSession() async{
        //checking authorization
        guard await isAuthorized else { return }
        //start the capture session flow of data
        captureSession.startRunning()
    }//end of startSession function
}//end of CameraManager class

//to receive many buffer frames from the camera
extension CameraManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    //called when camera captures new frame
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        guard let currentFrame = sampleBuffer.cgImage else{return}
        addToPreviewStream?(currentFrame)
    }//end of captureOutput function
}//end of CameraManager extension
*/




