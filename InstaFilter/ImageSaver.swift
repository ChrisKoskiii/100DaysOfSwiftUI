//
//  ImageSaver.swift
//  InstaFilter
//
//  Created by Christopher Koski on 7/20/22.
//

import Foundation
import UIKit

class ImageSaver: NSObject {
  func writeToPhotoAlbum(image: UIImage) {
    UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
  }
  
  @objc func saveCompleted(_ imageL: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
    print("Save finished!")
  }
}
