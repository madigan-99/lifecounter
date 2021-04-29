////
////  ContentView.swift
////  lifecounter
////
////  Created by stlp on 4/22/21.
////
//
//import SwiftUI
//
//struct HeaderView: View {
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
//        VStack {
//            Text("Welcome to the Life Counter").font(.system(size: metrics.size.width / 15)).multilineTextAlignment(.center)
//            HStack () {
//                Button(action: {
//                  
//                }){
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
//                        Text("Add").font(.system(size: 18 * fontSize))
//                    }
//                }.disabled(inProgress)
//                Button(action: {
//                  
//                }){
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
//                        Text("History").font(.system(size: 18 * fontSize))
//                    }
//                }
//                Button(action: {
//                  inProgress = false
//                    
//                }){
//                    ZStack {
//                        RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
//                        Text("Reset").font(.system(size: 18 * fontSize))
//                    }
//                }
//}
//        }
//        }
//    }
//}
//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView()
//    }
//}
