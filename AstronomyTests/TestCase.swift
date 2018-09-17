//
//  TestCase.swift
//  AstronomyTests
//
//  Created by David Doswell on 9/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

class MockDataLoader: NetworkDataLoader {
    
    init(data: Data?, error: Error?) {
        self.data = data
        self.error = error
    }
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        self.request = request
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.error)
        }
    }
    
    let data: Data?
    let error: Error?
    private(set) var request: URLRequest? = nil
}
