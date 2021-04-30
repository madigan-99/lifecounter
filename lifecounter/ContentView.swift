//
//  ContentView.swift
//  lifecounter
//
//  Created by stlp on 4/22/21.
//

import SwiftUI

var width: CGFloat {
    return UIScreen.main.bounds.width / 6
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



struct ContentView: View {
    @State private var val: Int = 1
    @State var inProgress: Bool = false
    @ObservedObject var model = Model()
    @State var loser: String = ""
    @State var historyArr: [String] = []
    @State var totalLost: Int = 0
    
    var body: some View {
        GeometryReader { metrics in
            NavigationView {
                VStack {
                    VStack {
                        Text("Welcome to the Life Counter").font(.system(size: metrics.size.width / 15)).multilineTextAlignment(.center)
                        HStack {
                            Button(action: {
                                if (model.players.count < 8) {
                                    addPlayer()
                                }
                            }){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
                                    Text("Add").font(.system(size: 18 * fontSize)).foregroundColor(inProgress ? Color.gray : Color.black)
                                }
                            }.disabled(inProgress)
                            Button(action: {
                                if (model.players.count > 1) {
                                    removePlayer()
                                }
                            }){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
                                    Text("Remove").font(.system(size: 18 * fontSize)).foregroundColor(inProgress ? Color.gray : Color.black)
                                }
                            }.disabled(inProgress)
                            NavigationLink(destination: HistoryView(changes: $historyArr)){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
                                    Text("History").font(.system(size: 18 * fontSize)).foregroundColor(Color.black)
                                }
                            }
                            Button(action: {
                                resetGame()
                            }){
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.66, green: 0.66, blue: 0.99)).frame(width: width * 1.25, height: width / 1.5, alignment: .center)
                                    Text("Reset").font(.system(size: 18 * fontSize)).foregroundColor(Color.black)
                                }
                            }
                        }
                    }.padding(paddingScale)
                    ScrollView {
                        ZStack (alignment: .top) {
                            VStack (alignment: .center) {
                                ForEach(model.players, id:\.self){ playerIndiv in
                                    IndivPlayer(player: playerIndiv, historyArr: $historyArr, loser: $loser, inProgress: $inProgress, playerName: playerIndiv.name, totalLost: $totalLost)
                                }
                            }
                            if (totalLost == (model.players.count - 1)) {
                                ZStack {
                                    Color.white
                                    VStack {
                                        Text("Game Over!")
                                        Button(action: {
                                            resetGame()
                                        }, label: {
                                            Text("Restart Game?")
                                        })
                                    }.padding()
                                }
                                .frame(width: width * 5, height: width * 2)
                                .cornerRadius(20).shadow(radius: 10)
                            }
                        }.padding(paddingScale)
                    }
                    
                    HStack {
                        Text(loser).foregroundColor(Color.red).font(.system(size: 30 * fontSize))
                        
                    }
                }.navigationBarHidden(true)
            }.navigationViewStyle(StackNavigationViewStyle())
        }
    }
    private func addPlayer(){
        let id = model.players.count + 1
        model.players.append(Player(name: "Player " + String(id)))
    }
    private func removePlayer(){
        model.players.removeLast()
    }
    private func resetGame() {
        inProgress = false
        loser = ""
        totalLost = 0
        model.players = Model().players
        historyArr = []
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.66, green: 0.66, blue: 0.99)]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(2)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.center)
    }
}


struct IndivPlayer: View {
    @State var player: Player
    @State var count: Int = 20
    @State private var val: Int = 1
    @Binding var historyArr: [String]
    @Binding var loser: String
    @Binding var inProgress: Bool
    @State var playing: Bool = true
    @State var playerName: String
    @Binding var totalLost: Int
    @State private var showPopUp = false
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 20) {
                HStack {
                    Button(action: {
                        self.showPopUp = true
                    }, label: {
                        Text(playerName).font(.system(size: 20 * fontSize)).foregroundColor(.black)
                    })
                    //  TextField(player.name, text: $playerName).font(.system(size: 20 * fontSize))
                    Spacer()
                    Text(String(self.count)).font(.system(size: 20 * fontSize))
                }.padding(.horizontal)
                HStack (alignment: .center) {
                    Button(action: {
                        self.count -= val
                        inProgress = true
                        if (self.count <= 0 && playing == true) {
                            loser += playerName + " LOSES ! \n"
                            playing = false
                            historyArr.append(playerName + " lost ")
                            totalLost += 1
                        }
                        historyArr.append(playerName + " lost " + String(val) + " lives")
                    }){
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.99, green: 0.6, blue: 0.6)).frame(width: width, height: width, alignment: .center)
                            Text("-").font(.system(size: 25 * fontSize)).foregroundColor(Color.black)
                        }
                    }
                    TextField("Value", value: $val, formatter: NumberFormatter())
                        .textFieldStyle(OvalTextFieldStyle())
                    Button(action: {
                        self.count += val
                        inProgress = true
                        historyArr.append(playerName + " gained " + String(val) + " lives")
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5).fill(Color.init(red: 0.4, green: 0.8, blue: 0.4)).frame(width: width, height: width, alignment: .center)
                            Text("+").font(.system(size: 25 * fontSize)).foregroundColor(Color.black)
                        }
                    }
                }
            }.padding(paddingScale)
            if $showPopUp.wrappedValue {
                ZStack {
                    Color.white
                    VStack {
                        Text("Enter Players Name: ")
                        Spacer()
                        TextField(player.name, text: $playerName).font(.system(size: 20 * fontSize)).padding(paddingScale).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            self.showPopUp = false
                        }, label: {
                            Text("Save")
                        })
                    }.padding()
                }
                .frame(width: width * 5, height: width * 2)
                .cornerRadius(20).shadow(radius: 10)
            }
        }
    }
}

class Player: NSObject {
    var name: String
    let id = UUID()
    init(name: String) {
        self.name = name
    }
}

class Model: ObservableObject {
    @Published var players: [Player] = []
    init() {
        players = [
            Player(name: "Player 1"),
            Player(name: "Player 2"),
            Player(name: "Player 3"),
            Player(name: "Player 4")
        ]
    }
}

struct HistoryView: View {
    @Binding var changes: [String]
    
    var body: some View {
        List {
            ForEach(changes, id: \.self) { result in
                Text(result)
            }
            
        }
        
    }
}
