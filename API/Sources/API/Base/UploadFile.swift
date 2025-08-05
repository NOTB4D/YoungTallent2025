//
//  UploadFile.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

public struct File {
  public var name: String
  public var fileName: String
  public var fileExtension: String
  public var mimeType: String
  public var data: Data

  var fileNameWithExtension: String {
    var fileName = fileName
    if !fileExtension.isEmpty {
      fileName.append(".")
      fileName.append(fileExtension)
    }
    return fileName
  }

  public init(name: String, fileName: String, fileExtension: String, mimeType: String, data: Data) {
    self.name = name
    self.fileName = fileName
    self.fileExtension = fileExtension
    self.mimeType = mimeType
    self.data = data
  }
}
