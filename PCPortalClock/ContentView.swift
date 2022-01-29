//
//  ContentView.swift
//  PCPortalClock
//
//  Created by Angelos Staboulis on 29/1/22.
//

import SwiftUI

struct ContentView: View {
    @State var convertHours:String!="0"
    @State var convertMinutes:String!="00"
    @State var convertSeconds:String!="00"
    @State var digitalClock:String!="00:00:00"
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Image(uiImage:UIImage(named: "pcportal")!).padding(25)
            Image(uiImage: UIImage(named: "computer")!).resizable().overlay {
                Text(digitalClock).onReceive(timer) { output in
                    let date = DateFormatter()
                    let calendar = date.calendar
                    let minute = calendar?.component(.minute, from: Date())
                    let hour = calendar?.component(.hour, from: Date())
                    let second = calendar?.component(.second, from: Date())
                    convertHours = hour?.formatted()
                    convertMinutes = String((minute! < 10 ?  "0" + (minute?.formatted())! : minute?.formatted())!)
                    convertSeconds = String((second! < 10 ?  "0" + (second?.formatted())! : second?.formatted())!)
                    digitalClock = convertHours + ":" + convertMinutes + ":" + convertSeconds
                }.foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2, alignment: .center).font(.largeTitle)
                
            }
        }.background(Rectangle().foregroundColor(Color.blue))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
