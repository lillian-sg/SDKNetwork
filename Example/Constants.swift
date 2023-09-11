//
//  Constants.swift
//  SDKNetwork_Example
//
//  Created by Lillian Souza Peixoto on 11/09/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

struct Constants {
    static let urlBase = "http://mentoria.codandocommoa.com.br/swagger/ui/index#/Theme/Theme_GetListaTheme?"
    
}

public enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
}
