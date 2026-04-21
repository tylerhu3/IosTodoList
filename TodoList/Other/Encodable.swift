//
//  Encodable.swift
//  TodoList
//
//  Created by Tyler Hu on 4/6/26.
//

import Foundation
/*
 The point of this code is to convert a strongly-typed Swift object into a plain Dictionary ([String: Any]).
 
 How it Works (The Data Flow)

 The code performs a "double-hop" conversion:

 Object → JSON Data: It uses JSONEncoder to turn your struct or class into raw bytes.

 JSON Data → Dictionary: It uses JSONSerialization to read those bytes back as a collection of keys and values.
 
 struct User: Encodable {
     let name: String
     let age: Int
 }

 let user = User(name: "Aris", age: 28)
 let dict = user.asDictionary()

 print(dict) // ["name": "Aris", "age": 28]
 */
extension Encodable {
    func asDictionary() -> [String: Any]  {
        guard let data = try?  JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
            } catch {
                return [:]
            }
        }
}
