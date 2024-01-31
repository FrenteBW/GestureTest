//
//  ContentView.swift
//  GestureTest
//
//  Created by 안병욱의 mac on 2024/01/31.
//

import SwiftUI

struct GestureExampleView: View {
    @State private var tapped = false
    @State private var longPressed = false
    @State private var dragOffset: CGSize = .zero
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Angle = .degrees(0)

    var body: some View {
        VStack {
            // Tap Gesture
            Circle()
                .fill(tapped ? Color.red : Color.blue)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    self.tapped.toggle()
                }

            // Long Press Gesture
            Circle()
                .fill(longPressed ? Color.green : Color.yellow)
                .frame(width: 100, height: 100)
                .onLongPressGesture(minimumDuration: 1.0) {
                    self.longPressed.toggle()
                }

            // Drag Gesture
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .offset(dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.dragOffset = value.translation
                        }
                        .onEnded { _ in
                            self.dragOffset = .zero
                        }
                )

            // Magnification Gesture
            Image(systemName: "arrow.up.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            self.scale = value
                        }
                )

            // Rotation Gesture
            Image(systemName: "arrow.right.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(rotation)
                .gesture(
                    RotationGesture()
                        .onChanged { value in
                            self.rotation = value
                        }
                )
        }
        .padding(20)
    }
}
