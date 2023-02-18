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
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appending(path: "scrums.data")
    }
    
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
                completion(.failure(error))
            }
        }
    }
    
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
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Modernizing by Using Structured Concurrency using withCheckedThrowingContinuation
    
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
    
    /// save func's  returned 'Int' value can be ignored
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
    
    // MARK: - Aync/Await Cocurrency

//    static func load() async throws -> [DailyScrum] {
//        do {
//            let fileURL = try fileURL()
//            guard let file = try? FileHandle(forReadingFrom: fileURL) else { return [] }
//            let data = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
//            return data
//        } catch {
//            fatalError()
//        }
//    }
}
