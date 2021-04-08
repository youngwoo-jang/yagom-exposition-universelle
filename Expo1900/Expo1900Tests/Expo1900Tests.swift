//
//  Expo1900Tests.swift
//  Expo1900Tests
//
//  Created by Yunhwa on 2021/04/08.
//

import XCTest
@testable import Expo1900
class Expo1900Tests: XCTestCase {
    
    func test_ExpositionUniverselle1900() {
        let jsonDecoder = JSONDecoder()
        
        guard let data: NSDataAsset = NSDataAsset.init(name: "exposition_universelle_1900") else { return }
        do {
            try jsonDecoder.decode(ExpositionUniverselle1900.self, from: data.data)
        } catch {
            XCTFail()
        }
    }
    
}
