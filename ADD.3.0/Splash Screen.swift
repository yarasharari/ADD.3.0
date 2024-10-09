//
//  Splash Screen.swift
//  ADD.3.0
//
//  Created by Yara Alsharari on 03/04/1446 AH.
//

import SwiftUI
struct SplashScreen: View {
@State var tempText = ""
var body: some View {
    VStack {
Image ("ic-logo")
            .resizable ()
            .frame(width: 175, height: 175)
            .shadow(radius: 10)
Text ("Space.App")
            .font(.system(size: 52))
            .foregroundStyle(white)
            .bold()
            .shadow (radius: 10)
TextField("Email", text:$tempText)
            .font.system(size: (10))
24))
padding(horizontal, 30)
frame(width: 360, height: 60)
.background (.white)
clipShape (RoundedRectangle(cornerRadius: 14))
shadow (radius: 10)|

import SwiftUI
struct
SplashScreen: View {
@State
var moveRight = false
    var body: some View {
ZStack {
Image ("9brainy" )
resizable ()
ignoresSafeArea ( )
Image ("9brainy")
resizable()
frame(width: 210, height: 300)
offset(x: moveRight? 20 : -20)
animation(.easeInOut(duration:
repeatForever (autoreverses: true), value: moveRight)
｝

          OnAppear {
moveRight = true

｝
    #Preview {
        ContentView()
    }
