//
//  ContentView.swift
//  lifecounter_swiftui
//
//  Created by stlp on 4/22/21.
//

import SwiftUI

struct ContentView: View {
    @State var count1: Int = 20
    @State var count2: Int = 20
    @State var count3: Int = 20
    @State var count4: Int = 20
    
    var width: CGFloat {
            // if UIDevice.current.userInterfaceIdiom == .phone {
                return UIScreen.main.bounds.width / 5
           // } else {
           //     return UIScreen.main.bounds.width / 6
          //  }
        }
    var fontSize: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return 1
        } else {
            return 1.5
        }
    }
    
    var paddingScale: CGFloat {
        return UIScreen.main.bounds.width / 35
    }
    
    var body: some View {
        GeometryReader { metrics in
        ScrollView {
        VStack {
            Text("Welcome to the Life Counter").font(.system(size: metrics.size.width / 10)).multilineTextAlignment(.center)
            VStack (alignment: .center) {
                HStack {
                    Text("Player 1").font(.system(size: 20 * fontSize))
                    Spacer()
                    Text(String(count1)).font(.system(size: 20 * fontSize))
                }.padding(.horizontal, paddingScale)
                HStack (alignment: .center) {
                    Button(action: {
                        self.count1 -= 5
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-5").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count1 -= 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count1 += 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count1 += 5
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+5").font(.system(size: 20 * fontSize))
                        }
                    }
                }
            } .padding(paddingScale)
            VStack (alignment: .center) {
                HStack {
                    Text("Player 2").font(.system(size: 20 * fontSize))
                    Spacer()
                    Text(String(count2)).font(.system(size: 20 * fontSize))
                }.padding(.horizontal, paddingScale)
                HStack (alignment: .center) {
                    Button(action: {
                        self.count2 -= 5
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-5").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count2 -= 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count2 += 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count2 += 5
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+5").font(.system(size: 20 * fontSize))
                        }
                    }
                }
            } .padding(paddingScale)
            VStack (alignment: .center) {
                HStack {
                    Text("Player 3").font(.system(size: 20 * fontSize))
                    Spacer()
                    Text(String(count3)).font(.system(size: 20 * fontSize))
                }.padding(.horizontal, paddingScale)
                HStack (alignment: .center) {
                    Button(action: {
                        self.count3 -= 5
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-5").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count3 -= 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count3 += 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count3 += 5
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+5").font(.system(size: 20 * fontSize))
                        }
                    }
                }
            } .padding(paddingScale)
            VStack (alignment: .center) {
                HStack {
                    Text("Player 4").font(.system(size: 20 * fontSize))
                    Spacer()
                    Text(String(count4)).font(.system(size: 20 * fontSize))
                }.padding(.horizontal, paddingScale)
                HStack (alignment: .center) {
                    Button(action: {
                        self.count4 -= 5
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-5").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count4 -= 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count4 += 1
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+1").font(.system(size: 20 * fontSize))
                        }
                    }
                    Button(action: {
                        self.count4 += 5
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+5").font(.system(size: 20 * fontSize))
                        }
                    }
                }
            } .padding(paddingScale)
            HStack {
                if (self.count1 <= 0) {
                    Text("Player 1 LOSES!").foregroundColor(Color.red).font(.system(size: 25 * fontSize))
                }
                if (self.count2 <= 0) {
                    Text("Player 2 LOSES!").foregroundColor(Color.red).font(.system(size: 35 * fontSize))
                }
                if (self.count3 <= 0) {
                    Text("Player 3 LOSES!").foregroundColor(Color.red).font(.system(size: 35 * fontSize))
                }
                if (self.count4 <= 0) {
                    Text("Player 4 LOSES!").foregroundColor(Color.red).font(.system(size: 35 * fontSize))
                }
            }.padding(.top, paddingScale / 2)
        }
        }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
