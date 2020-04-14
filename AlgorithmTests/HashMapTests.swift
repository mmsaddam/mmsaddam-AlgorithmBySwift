//
//  HashMapTest.swift
//  AlgorithmTests
//
//  Created by Muzahidul Islam on 13/4/20.
//  Copyright © 2020 Muzahid. All rights reserved.
//

import XCTest
@testable import Algorithm


class HashMapTests: XCTestCase {
    struct Person: Equatable {
        var name: String
        var address: String
    }
    
    var hashMap: HashMap<String, Person>?
     
    override func setUp() {
        hashMap = HashMap<String, Person>(10)
    }
    
    func testAdd() {
        [("Muzahid", "Dhaka, Bangladesh"), ("Mariam", "Naogaon, Bangladesh"), ("Tania", "Dhaka, Bangladesh"),("Rupak", "Dhaka, Bangladesh")]
            .map { Person(name: $0.0, address: $0.1) }
            .forEach { person in
                hashMap?[person.name] = person
            }

        XCTAssertEqual(hashMap?.count, 4)
        
    }
    
    func testRemove() {
        [("Muzahid", "Dhaka, Bangladesh"), ("Mariam", "Naogaon, Bangladesh"), ("Tania", "Dhaka, Bangladesh"),("Rupak", "Dhaka, Bangladesh")]
            .map { Person(name: $0.0, address: $0.1) }
            .forEach { person in
                hashMap?[person.name] = person
            }
        
        hashMap?["Mariam"] = nil
        
        let person = hashMap?["Mariam"]
        XCTAssertEqual(person, nil)
        
        XCTAssertEqual(hashMap?.count, 3)
        
    }
    
    func testUpdate() {
        [("Muzahid", "Dhaka, Bangladesh"), ("Mariam", "Naogaon, Bangladesh"), ("Tania", "Dhaka, Bangladesh"),("Rupak", "Dhaka, Bangladesh")]
            .map { Person(name: $0.0, address: $0.1) }
            .forEach { person in
                hashMap?[person.name] = person
            }
        
        let newPerson = Person(name: "Mariam", address: "Dhaka, Bangladesh")
        hashMap?["Mariam"] = newPerson
        
        XCTAssertEqual(hashMap?.count, 4)
        
    }
    
    override func tearDown() {
        hashMap = nil
    }

}
