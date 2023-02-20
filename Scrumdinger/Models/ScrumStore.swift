//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 15/02/2023.
//

import Foundation
import SwiftUI

// ObservableObject is a class-constrained protocol for
// connecting external model data to SwiftUI views.
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    // Return File 'URL' of User Documents Directory + append new path
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appending(path: "scrums.data")
    }
    
    // MARK: - Aync/Await Structured Cocurrency
    
    // Load and Decode Serailized Data (in JSON) from User Files Directory
    static func loadAsync() async throws -> [DailyScrum] {
        do {
            let fileURL = try fileURL()
            guard let file = try? FileHandle(forReadingFrom: fileURL) else { return [] }
            let scrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
            return scrums
        }
    }
    
    // Encode data (in JSON) and save that serailized data in User's Files Directory
    @discardableResult
    static func saveAsync(scrums: [DailyScrum]) async throws -> Int {
        do {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try fileURL()
            try data.write(to: outfile)
            return scrums.count
        }
    }
}

/*
    // MARK: - Cocurrency using Completion-Handler Approach [old & complex-approach]
    
    // Load and Decode Serailized Data (in JSON) from User Files Directory
    static func load(completion: @escaping (Result<[DailyScrum], Error>)-> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // Encode data (in JSON) and save that serailized data in User Files Directory
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>)-> Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(scrums)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Modernizing Concurrency Code Using Structured Concurrency
    
    static func load() async throws -> [DailyScrum] {
        try await withCheckedThrowingContinuation { continuation in
            load { result in
                switch result {
                case .success(let scrums):
                    continuation.resume(returning: scrums)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    // Using @discardableResult save func's  returned 'Int' value can be ignored
    @discardableResult
    static func save(scrums: [DailyScrum]) async throws -> Int {
        try await withCheckedThrowingContinuation { continuation in
            save(scrums: scrums) { result in
                switch result {
                case .success(let scrumsSaved):
                    continuation.resume(returning: scrumsSaved)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
 */



