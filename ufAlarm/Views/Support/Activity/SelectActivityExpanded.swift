//
//  SelectActivityExpanded.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/28/23.
//

import SwiftUI

struct SelectActivityExpanded: View {
  @Binding var currentColorIndex: Int
  @Binding var currentActivity: String
  
  var circleFrame = 25.0
  
  var currentColor: Color {
    ALARM_COLORS[currentColorIndex]
  }
  
  
  var body: some View {
    VStack(spacing: 30) {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 30) {
          ForEach(0 ..< ALARM_COLORS.count, id: \.self) { i in
            let color = ALARM_COLORS[i]
            let isSelected = ALARM_COLORS[i] == currentColor
            
            Circle()
              .fill(color)
              .frame(width: circleFrame, height: circleFrame)
              .shadow(color: color.opacity(0.7),
                      radius: 10,
                      x: 0,
                      y: 5)
              .scaleEffect(isSelected ? 1.1 : 1.0)
              .overlay {
                Circle()
                  .stroke(
                    lineWidth: isSelected ? 3 : 0.1
                  )
              }
              .padding(.vertical, 20)
              .onTapGesture {
                withAnimation {
                  currentColorIndex = i
                }
              }
          }
        }
        .padding(.horizontal)
      }
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(ACTIVITIES, id: \.self) { activity in
            let isSelected = activity == currentActivity
            
            Image(systemName: activity)
              .font(isSelected ? .headline : .subheadline)
              .foregroundStyle(isSelected ? currentColor : .gray)
              .opacity(isSelected ? 1 : 0.8)
              .onTapGesture {
                withAnimation {
                  currentActivity = activity
                }
              }
              .padding(8)
              .background {
                Circle()
                  .fill(isSelected && currentColor != .gray ? .accentUf.opacity(0.7) : .clear)
              }
              .overlay {
                Circle()
                  .stroke(.gray, lineWidth: isSelected ? 2 : 0)
              }
          }
        }
        .padding(.horizontal)
      }
    }
    .padding()
    .overlay {
      RoundedRectangle(cornerRadius: 10)
        .stroke(.teal, lineWidth: 2)
    }
  }
}

#Preview {
  SelectActivityExpanded(currentColorIndex: .constant(0),
                         currentActivity: .constant(ACTIVITIES[0]))
  .padding(.horizontal)
}
