//
//  ContentView.swift
//  KeyframeAnimation
//
//  Created by 佐々木一樹 on 2024/01/04.
//

import SwiftUI

struct ContentView: View {
    @State private var startKeyframeAnimation: Bool = false

    var body: some View {
        VStack {
            Spacer()

            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyframeAnimation) { content, value in
                    content
                        .scaleEffect(value.scale)
                        .offset(y: value.offsetY)
                        .rotationEffect(Angle(degrees: value.rotation))
                        .opacity(value.reflectionOpacity)
                } keyframes: { _ in
                    KeyframeTrack(\.scale) {
                        SpringKeyframe(1, duration: 1)
                        SpringKeyframe(1, duration: 1, spring: .bouncy, startVelocity: 35.0)
                        SpringKeyframe(1, duration: 1)
                    }
                    KeyframeTrack(\.rotation) {
                        SpringKeyframe(0, duration: 1)
                        SpringKeyframe(0, duration: 1)
                        SpringKeyframe(30.0, duration: 1, spring: .bouncy, startVelocity: 35.0)
                        SpringKeyframe(0, duration: 1)
                    }
                    KeyframeTrack(\.offsetY) {
                        SpringKeyframe(-60, duration: 1)
                        SpringKeyframe(-60, duration: 1)
                        SpringKeyframe(-60, duration: 1)
                        SpringKeyframe(-60, duration: 1)
                        SpringKeyframe(0, duration: 1)
                    }
                }

            Spacer()

            Button("Start") {
                startKeyframeAnimation.toggle()
            }
            .font(.title2)
            .fontWeight(.bold)
            .foregroundStyle(.blue)
        }
    }
}

struct Keyframe {
    var scale: CGFloat = 1
    var offsetY: CGFloat = .zero
    var rotation: CGFloat = .zero
    var reflectionOpacity: CGFloat = 1.0
}

#Preview {
    ContentView()
}
