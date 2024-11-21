import CoreImage

/*
 Extends CIImage to convert to CGImage using CIContext

extension CIImage {
    var cgImage: CGImage?{
        let ciContext = CIContext()
        guard let cgImage = ciContext.createCGImage(self, from: self.extent) else{
            return nil
        }//end of cgImage
        return cgImage
    }//end of cgImage var
}//end of CIImage
*/
