import AVFoundation
import CoreImage

/*
    Converts CMSampleBuffer to CGImage
    Allows access to image buffer from camera feed

extension CMSampleBuffer{
    var cgImage: CGImage?{
        let pixelBuffer: CVPixelBuffer? = CMSampleBufferGetImageBuffer(self)
        guard let imagePixelBuffer = pixelBuffer else{
            return nil
        }//end of imagePixelBuffer
        return CIImage(cvPixelBuffer: imagePixelBuffer).cgImage
    }//end of cgImage
}//end of CMSampleBuffer
*/
