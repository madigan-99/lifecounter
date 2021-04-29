import SwiftUI

struct IdentifiableGameResult: Identifiable {
    var id = UUID()
    var score: Int
}

struct TestView: View {
    let results = [
        IdentifiableGameResult(score: 400),
        IdentifiableGameResult(score: 5),
        IdentifiableGameResult(score: 10)
    ]

    var body: some View {
        
            List {
            ForEach(0..<5) { result in
                Text("Result")
            }
            
        }
            
    }
}
struct TestView_Preview: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

