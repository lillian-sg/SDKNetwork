//
//  ThemeProvider.swift
//  SDKNetwork_Example
//
//  Created by Lillian Souza Peixoto on 11/09/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

class ThemeProvider {
    
    public func getTheme(uidFirebase: String, completion: @escaping(Result<[ThemeModel], Error>) -> Void) {
        
        let urlStr = "\(Constants.urlBase)/uIdFirebase=\(uidFirebase)"
        debugPrint(urlStr)
        
        guard let url = URL(string: urlStr) else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPRequestMethod.get.rawValue
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            NetworkLogger.log(request: urlRequest, response: response, data: data)
            do {
                if let error {
                    completion(.failure(error))
                }
                if let data  {
                    let dataStr = String(data: data, encoding: .utf8)
                    debugPrint(dataStr as Any)
                    
                    if let jsonData = dataStr?.data(using: .utf8) {
                        if jsonData.isEmpty {
                            completion(.success([ThemeModel]()))
                        } else {
                            let result = try JSONDecoder().decode([ThemeModel].self, from: jsonData)
                            completion(.success(result))
                        }
                    }
                    
                }
            } catch let error as NSError {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
}


struct NetworkLogger {
    
    static func log(request: URLRequest?, response: URLResponse?, data: Data?, verbose: Bool = true) {
        print("-------------START OF REQUEST-------------")
        
        if let url = request?.url {
            print ("Request URL: \(url.absoluteString)")
            
        }
        
        if let httpMethod = request?.httpMethod {
            print( "HTTP Method: (httpMethod)")
        }
        
        if verbose, let headers = request?.allHTTPHeaderFields {
            print ("Headers: \(headers)")
        }
        
        if verbose, let body = request?.httpBody, let bodyString = String (data: body, encoding: .utf8) {
            print ("Body Request: \(bodyString)")
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse .statusCode
            let statusIcon = (200...299).contains(statusCode) ? "✅" : "❌"
            print("Status Code: \(statusCode) \(statusIcon)")
        }
        
        if verbose, let headers = (response as? HTTPURLResponse)?.allHeaderFields as? [String: Any] {
            print ("Response Headers: \(headers)")
        }
        
        if let data = data {
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
                
                if let jsonStr = String(data: jsonData, encoding: .utf8) {
                    print("JSON Response: ⬇️\n\(jsonStr)")
                }
            } catch let serializationError {
                print("Failed to serialize JSON: \(serializationError)")
            }
        }
        print("-------------------- END OF REQUEST--------------------\n")
    }
}
