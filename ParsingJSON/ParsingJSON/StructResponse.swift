//
//  StructResponse.swift
//  ParsingJSON
//
//  Created by Irsyad Ashari on 16/05/24.
//

import Foundation

struct Heading: Decodable {
    let text: String
    let size: Int
}

struct Paragraph: Decodable {
    let text: String
}

struct Image: Decodable {
    let url: String
    let caption: String
    let source: String
}

struct Quote: Decodable {
    let text: String
    let author: String
}

struct Result: Decodable {
    let response: [Response]
    
    enum Response: Decodable {
        case heading(Heading)
        case paragraph(Paragraph)
        case image(Image)
        case quote(Quote)
        
        enum DecodingError: Error {
            case wrongJSON
        }
        
        enum CodingKeys: String, CodingKey {
            case heading
            case paragraph
            case image
            case quote
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            switch container.allKeys.first {
            case .heading:
                let value = try container.decode(Heading.self, forKey: .heading)
                print("heading : \(value.text)")
                self = .heading(value)
            case .paragraph:
                let value = try container.decode(Paragraph.self, forKey: .paragraph)
                print("paragraph : \(value.text)")
                self = .paragraph(value)
            case .image:
                let value = try container.decode(Image.self, forKey: .image)
                print("image : \(value.caption)")
                self = .image(value)
            case .quote:
                let value = try container.decode(Quote.self, forKey: .quote)
                print("quote : \(value.text)")
                self = .quote(value)
            case .none:
                throw DecodingError.wrongJSON
            }
        }
    }
}
