//
//  ContentView.swift
//  PCPortalClock
//
//  Created by Angelos Staboulis on 29/1/22.
//

import SwiftUI
struct DigitalClock{
    var hour:Int!=0
    var minute:Int!=0
    var second:Int!=0
    var convertHours:String!
    var convertMinutes:String!
    var convertSeconds:String!
}
struct ContentView: View {
    @State var clockDigital = DigitalClock(hour: 0, minute: 0, second: 0, convertHours: "0", convertMinutes: "00", convertSeconds: "00")
    @State var digitalClock:String!="00:00:00"
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Image(uiImage:UIImage(named: "pcportal")!).padding(25)
            Image(uiImage: UIImage(named: "computer")!).resizable().overlay {
                Text(digitalClock).onReceive(timer) { output in
                    digitalClock = createClock(clock: clockDigital)
                }.foregroundColor(Color.white).frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2, alignment: .center).font(.largeTitle)
                
            }
        }.background(Rectangle().foregroundColor(Color.blue))
    }
    func createClock(clock:DigitalClock)->String{
        var getClock = clock
        let date = DateFormatter()
        let calendar = date.calendar
        getClock.minute = calendar?.component(.minute, from: Date())
        getClock.hour  = calendar?.component(.hour, from: Date())
        getClock.second = calendar?.component(.second, from: Date())
        getClock.convertHours = getClock.hour?.formatted()
        getClock.convertMinutes = String((getClock.minute! < 10 ?  "0" + (getClock.minute?.formatted())! : getClock.minute?.formatted())!)
        getClock.convertSeconds = String((getClock.second! < 10 ?  "0" + (getClock.second?.formatted())! : getClock.second?.formatted())!)
   
        return getClock.convertHours + ":" + getClock.convertMinutes + ":" + getClock.convertSeconds
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
