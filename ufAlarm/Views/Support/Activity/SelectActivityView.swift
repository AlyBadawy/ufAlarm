//
//  SelectActivityView.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct SelectActivityView: View {
  @Binding var currentColorIndex: Int
  @Binding var currentActivity: String
  
  var currentColor: Color {
    ALARM_COLORS[currentColorIndex]
  }
  
  var nextIndex: Int {
    (currentColorIndex + 1) % ALARM_COLORS.count
  }
  
  var body: some View {
    HStack(spacing: 10) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(ACTIVITIES, id: \.self) { activity in
            let isSelectedActivity = activity == currentActivity
            Image(systemName: activity)
              .font(isSelectedActivity ? .title2 : .subheadline)
              .foregroundStyle(isSelectedActivity ? currentColor : .subtleTextUf)
              .opacity(isSelectedActivity ? 1.0 : 0.7)
              .onTapGesture {
                withAnimation {
                  currentActivity = activity
                }
              }
          }
        }
      }
      
      Circle()
        .fill(currentColor)
        .frame(width: 20, height: 20)
        .shadow(color: currentColor.opacity(0.7),
                radius: 10,
                x: 0,
                y: 3)
        .overlay(
          Circle()
            .stroke(lineWidth: 2)
        )
        .onTapGesture {
          withAnimation {
            currentColorIndex = nextIndex
          }
        }
    }
    .padding(.horizontal, 5)
    .padding(.vertical, 3)
    .overlay {
      RoundedRectangle(cornerRadius: 10)
        .stroke(.teal, lineWidth: 2)
    }
  }
}

#Preview {
  SelectActivityView(currentColorIndex: .constant(0),
                     currentActivity: .constant(ACTIVITIES[0]))
  .padding(.horizontal)
}

