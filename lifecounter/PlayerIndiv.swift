////
////  ContentView.swift
////  lifecounter
////
////  Created by stlp on 4/22/21.
////
//
//import SwiftUI
//
//struct PlayerIndiv: View {
//    @State var count1: Int = 20
//    @State var inProgress: Bool = false
//    
//    var width: CGFloat {
//            // if UIDevice.current.userInterfaceIdiom == .phone {
//                return UIScreen.main.bounds.width / 5
//           // } else {
//           //     return UIScreen.main.bounds.width / 6
//          //  }
//        }
//    var fontSize: CGFloat {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return 1
//        } else {
//            return 1.5
//        }
//    }
//    
//    var paddingScale: CGFloat {
//        return UIScreen.main.bounds.width / 35
//    }
//    
//    var body: some View {
//        GeometryReader { metrics in
//            VStack (alignment: .center) {
//                HStack {
//                    Text("Player 1").font(.system(size: 20 * fontSize))
//                    Spacer()
//                    Text(String(count1)).font(.system(size: 20 * fontSize))
//                }.padding(.horizontal, paddingScale)
//                HStack (alignment: .center) {
//                    Button(action: {
//                        self.count1 -= 5
//                        inProgress = true
//                    }){
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
//                            Text("-5").font(.system(size: 20 * fontSize))
//                        }
//                    }
//                    Button(action: {
//                        self.count1 -= 1
//                        inProgress = true
//                    }) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
//                            Text("-1").font(.system(size: 20 * fontSize))
//                        }
//                    }
//                    Button(action: {
//                        self.count1 += 1
//                        inProgress = true
//                    }) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
//                            Text("+1").font(.system(size: 20 * fontSize))
//                        }
//                    }
//                    Button(action: {
//                        self.count1 += 5
//                        inProgress = true
//                    }) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
//                            Text("+5").font(.system(size: 20 * fontSize))
//                        }
//                    }
//                }
//            } .padding(paddingScale)
//        }
//    }
//}
//
//struct PlayerIndivView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerIndiv()
//    }
//}
