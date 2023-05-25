 //
 //  ScrumdingerApp.swift
 //  Scrumdinger
 //
 //  Created by Muhammad Asad Chattha on 25/01/2023.
 //

 import SwiftUI

 @main
 struct ScrumdingerApp: App {
     @StateObject private var store = ScrumStore()
     @State private var errorWrapper: ErrorWrapper?
     
     var body: some Scene {
         WindowGroup {
             
             NavigationView {
                 // ScrumsView(scrums: <#T##Binding<[DailyScrum]>#>, saveAction: <#T##() -> Void#>)
                 ScrumsView(scrums: $store.scrums) {
                     // saveACtion Closure; declared in ScrumsView
                     Task {
                         do {
                             try await ScrumStore.saveAsync(scrums: store.scrums)
                         } catch {
                             errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                         }
                     }
                 }
             }
             // Adds an asynchronous task to perform before this view appears.
             .task {
                 do {
                     store.scrums = try await ScrumStore.loadAsync()
                 } catch {
                     errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                 }
             }
             .sheet(item: $errorWrapper, onDismiss: {
                 store.scrums = DailyScrum.sampleData
             }) { wrapper in
                 ErrorView(errorWrapper: wrapper)
             }
             
             
//             Test()
         }
         
     }
 }
