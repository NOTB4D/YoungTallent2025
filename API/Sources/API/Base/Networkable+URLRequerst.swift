//
//  Networkable+URLRequerst.swift
//  API
//
//  Created by Eser Kucuker on 5.08.2025.
//

import Foundation

extension Networkable {
    func getRequest(
        url: URL,
        httpMethod: HttpRequestMethod = .get,
        queryItems: [String: String] = [:],
        headers: [String: String] = [:],
        addBearerToken: Bool = true
    ) async -> URLRequest {
        await prepareRequest(
            url: url,
            httpMethod: httpMethod,
            queryItems: queryItems,
            headers: headers,
            contentType: .json,
            addBearerToken: addBearerToken
        )
    }
    
    func getRequest(
      url: URL,
      body: some Encodable,
      headers: [String: String] = [:],
      httpMethod: HttpRequestMethod = .post,
      addBearerToken: Bool = true
    ) async -> URLRequest {
      var request = await prepareRequest(
        url: url,
        httpMethod: httpMethod,
        headers: headers,
        contentType: .json,
        addBearerToken: addBearerToken
      )
      request.httpBody = getBody(body)
      return request
    }

    func getRequest(
      url: URL,
      formItems: [String: String] = [:],
      headers: [String: String] = [:],
      httpMethod: HttpRequestMethod = .post,
      addBearerToken: Bool = true
    ) async -> URLRequest {
      // TODO: throw exception when an unexpected http method is encountered
      let formData = formItems.map {
        "\($0.key)=\($0.value.addingPercentEncoding(withAllowedCharacters: .nwURLQueryAllowed) ?? "")"
      }.joined(separator: "&")
      var request = await prepareRequest(
        url: url,
        httpMethod: httpMethod,
        headers: headers,
        contentType: .formUrlEncoded,
        addBearerToken: addBearerToken
      )

      request.httpBody = formData.data(using: .utf8)
      return request
    }

    private func getBody(_ body: some Encodable) -> Data? {
      let encoder = JSONEncoder()
      encoder.dateEncodingStrategy = .iso8601
      return try? encoder.encode(body)
    }

    func uploadRequest(
      method: HttpRequestMethod,
      url: URL,
      parameters: [String: String] = [:],
      files: [File] = [],
      headers: [String: String] = [:]
    ) async -> URLRequest {
      var body = Data()
      let boundary = "Boundary-\(UUID().uuidString)"
      let lineBreak = "\r\n"
      let boundaryPrefix = "--\(boundary)\(lineBreak)"
      var timeout = 0.0

      for (key, value) in parameters {
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
        body.appendString("\(value)\(lineBreak)")
      }

      for file in files {
        body.appendString(boundaryPrefix)
        body.appendString(
          "Content-Disposition: form-data; name=\"\(file.name)\";" +
            "filename=\"\(file.fileNameWithExtension)\"\(lineBreak)"
        )
        body.appendString("Content-Type: \(file.mimeType)\(lineBreak + lineBreak)")
        body.append(file.data)
        body.appendString("\(lineBreak)")
        timeout += Double(file.data.count) * 0.00005
      }

      if timeout < 30 {
        timeout = 30
      }
      body.appendString("--".appending(boundary.appending("--")))
      var request = await prepareRequest(
        url: url,
        httpMethod: .post,
        headers: headers,
        contentType: .multipartFormData(boundary)
      )
      request.httpBody = body as Data
      request.timeoutInterval = timeout
      request.httpMethod = method.rawValue
      return request
    }
    
    private func prepareRequest(
        url: URL,
        httpMethod: HttpRequestMethod = .get,
        queryItems: [String: String] = [:],
        headers: [String: String] = [:],
        contentType: ContentType,
        addBearerToken: Bool = true
    ) async -> URLRequest {
        // URL'e query items ekle
        let url = url.adding(parameters: queryItems)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        var headers = headers
        headers.updateValue(contentType.rawValue, forKey: "Content-Type")
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = 60

        // Opsiyonel Bearer Token eklemesi
        if addBearerToken {
//            if let token = await getBearerToken() {
//                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//            } else {
//                throw NSError(domain: "TokenError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Missing Bearer Token"])
//            }
        }
        
        return request
    }
}
