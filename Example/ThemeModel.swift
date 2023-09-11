//
//  ThemeModel.swift
//  SDKNetwork_Example
//
//  Created by Lillian Souza Peixoto on 11/09/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

typealias ThemeModel = [ThemeModelElement]

struct ThemeModelElement: Codable {
    let name: String?
    let id: Int?
    let isInativo: Bool?
    let creationDate: String?
    let changeDate: String?
    let uid, uidFirebase: String?
    let isChanged: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case id = "Id"
        case isInativo = "IsInativo"
        case creationDate = "CreationDate"
        case changeDate = "ChangeDate"
        case uid = "Uid"
        case uidFirebase = "UidFirebase"
        case isChanged = "IsChanged"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }
    func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
