//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//

/*Arc()
 .strokeBorder(.blue, lineWidth: 10)
 */


import SwiftUI

struct Test: View {
    
    var body: some View {
        Arc()
            .strokeBorder(.blue, lineWidth: 10)
    }
}

// "InsettableShape" conforms to "Shape". struct Conforming it also conform to "Shape"
struct Arc: InsettableShape {
    // 0.0 apply built-in inset, like it apply to Circle() etc.
    var insetAmount = 0.0
    
    // Required to conform "Shape"
    // Describes this shape as a path within a rectangular frame of reference.
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            // To Apply inset, subtract from radius
            radius: rect.width / 2 - insetAmount,
            startAngle: .zero,
            endAngle: .degrees(180),
            clockwise: true)
        
        return path
    }
    
    // Method require to conform "InsettableShape"
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

/*
 import SwiftUI
 
 struct Test: View {
 
 var body: some View {
 Arc()
 .stroke(.blue, lineWidth: 10)
 }
 }
 
 struct Arc: Shape {
 
 // Inherited from "Shape"
 // Describes this shape as a path within a rectangular frame of reference.
 func path(in rect: CGRect) -> Path {
 var path = Path()
 path.addArc(
 center: CGPoint(x: rect.midX, y: rect.midY),
 radius: rect.width / 2,
 startAngle: .zero,
 endAngle: .degrees(180),
 clockwise: true)
 
 return path
 }
 }
 */

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

/*
 import SwiftUI
 
 struct Test: View {
 
 @State private var angle: Double = 0
 
 var body: some View {
 //        ZStack {
 //            Circle()
 //                .stroke(.gray, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [2, 10], dashPhase: 2))
 //
 //            Circle()
 //                .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .miter, miterLimit: 0, dash: [2, 15], dashPhase: 1))
 //                .rotationEffect(.degrees(angle))
 //                .padding()
 //                .onAppear {
 //                    withAnimation(.easeOut(duration: 5)) {
 //                        angle = 360
 //                    }
 //                }
 //        }
 //        .padding()
 }
 }
 
 struct Test_Previews: PreviewProvider {
 static var previews: some View {
 Test()
 }
 }
 */
