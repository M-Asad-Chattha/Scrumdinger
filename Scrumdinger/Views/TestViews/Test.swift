//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

import SwiftUI

struct Test: View {
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            Text(speechRecognizer.transcript)
                .padding()
            
            Button(action: {
                if !isRecording {
                    speechRecognizer.transcribe()
                } else {
                    speechRecognizer.stopTranscribing()
                }
                
                isRecording.toggle()
            }) {
                Text(isRecording ? "Stop" : "Record")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(isRecording ? Color.red : Color.blue)
                    .cornerRadius(10)
            }
        }
    }
    
    
    struct Test_Previews: PreviewProvider {
        static var previews: some View {
            Test()
        }
    }
}

/*33
 class speechRecognizer1: ObservableObject {
 @Published var transcript = ""
 
 private var engine: AVAudioEngine?
 private var speechRecognitionRequest: SFSpeechAudioBufferRecognitionRequest?
 private var speechRecognitionTask: SFSpeechRecognitionTask?
 private let speechRecognizer: SFSpeechRecognizer?
 
 init() {
 speechRecognizer = SFSpeechRecognizer()
 
 Task(priority: .background) {
 guard speechRecognizer != nil else {
 fatalError("Nil Speech Recogniser")
 }
 guard await AVAudioSession.sharedInstance().hasRecordingPermission() else {
 fatalError("Audio Recording Permission Denied ‼️")
 }
 guard await SFSpeechRecognizer.hasAuthorizationToSpeechRecognition() else {
 fatalError("Not Authorized to Speech Recognition ‼️")
 }
 }
 }
 
 deinit {
 reset()
 }
 
 func transcribe() {
 DispatchQueue(label: "Speech Recognition Queue", qos: .background).async { [weak self] in
 guard let self, let recognizer = self.speechRecognizer, recognizer.isAvailable else {
 fatalError("Speech Recognizer is Unavailable...")
 }
 
 do {
 let (audioEngine, request) = try Self.prepareEngine()
 self.engine = audioEngine
 self.speechRecognitionRequest = request
 
 self.speechRecognitionTask = recognizer.recognitionTask(with: request)  { result, error in
 let receivedFinalResult = result?.isFinal ?? false
 // != nil mean there's error (true)
 let receivedError = error != nil
 
 if receivedFinalResult || receivedError {
 audioEngine.stop()
 audioEngine.inputNode.removeTap(onBus: 0)
 }
 
 if let result {
 self.speak(result.bestTranscription.formattedString)
 }
 }
 } catch {
 self.reset()
 fatalError(error.localizedDescription)
 }
 
 }
 }
 
 func stopTranscribe() {
 reset()
 }
 
 private static  func prepareEngine() throws -> (AVAudioEngine, SFSpeechAudioBufferRecognitionRequest) {
 let audioEngine = AVAudioEngine()
 
 let request = SFSpeechAudioBufferRecognitionRequest()
 request.shouldReportPartialResults = false
 
 let audioSession = AVAudioSession.sharedInstance()
 try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
 try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
 let inputNode = audioEngine.inputNode
 
 let recordingFormat = inputNode.outputFormat(forBus: 0)
 inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
 request.append(buffer)
 }
 audioEngine.prepare()
 try audioEngine.start()
 
 return (audioEngine, request)
 }
 
 func reset() {
 speechRecognitionTask?.cancel()
 engine?.stop()
 engine = nil
 speechRecognitionRequest = nil
 speechRecognitionTask = nil
 }
 
 private func speak(_ message: String) {
 transcript = message
 }
 }
 
 extension AVAudioSession {
 func hasRecordingPermission() async -> Bool {
 await withCheckedContinuation { continuation in
 requestRecordPermission { authorized in
 continuation.resume(returning: authorized)
 }
 }
 }
 }
 
 extension SFSpeechRecognizer {
 static func hasAuthorizationToSpeechRecognition() async -> Bool {
 await withCheckedContinuation { continuation in
 requestAuthorization { status in
 continuation.resume(returning: status == .authorized)
 }
 }
 }
 }
 */
