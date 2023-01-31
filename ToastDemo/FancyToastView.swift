//
//  FancyToastView.swift
//  ToastDemo
//
//  Created by Ondrej Kvasnovsky on 1/30/23.
//

import SwiftUI

struct ToastView: View {
  
  var type: ToastStyle
  var title: String
  var message: String
  var onCancelTapped: (() -> Void)
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        Image(systemName: type.iconFileName)
          .foregroundColor(type.themeColor)
        
        VStack(alignment: .leading) {
          Text(title)
            .font(.system(size: 14, weight: .semibold))
          
          Text(message)
            .font(.system(size: 12))
            .foregroundColor(Color.black.opacity(0.6))
        }
        
        Spacer(minLength: 10)
        
        Button {
          onCancelTapped()
        } label: {
          Image(systemName: "xmark")
            .foregroundColor(Color.black)
        }
      }
      .padding()
    }
    .background(Color.white)
    .overlay(
      Rectangle()
        .fill(type.themeColor)
        .frame(width: 6)
        .clipped()
      , alignment: .leading
    )
    .frame(minWidth: 0, maxWidth: .infinity)
    .cornerRadius(8)
    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
    .padding(.horizontal, 16)
  }
}

struct FancyToastView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ToastView(
        type: .error,
        title: "Error",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
      
      ToastView(
        type: .info,
        title: "Info",
        message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ") {}
    }
  }
}
