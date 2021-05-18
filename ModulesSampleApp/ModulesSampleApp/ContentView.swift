//
//  ContentView.swift
//  ModulesSampleApp
//
//  Created by Diana Maria Perez Afanador on 18/5/21.
//

import SwiftUI
import ModuleSample
import ModuleSampleDB

struct ContentView: View {
    @State var name1: String = ""
    @State var name2: String = ""

    var body: some View {
        Text("Object from first module \(name1)")
        Text("Object from second module \(name2)")
            .padding()
            .onAppear(perform: test1)
            .onAppear(perform: test2)
    }

    func test1() {
        do {
            let key = try Test.addTestObject(ofName: "Lola")
            let object = Test.getObject(ofType: TestObject.self, forPrimaryKey: key)
            name1 = object.name
        } catch {
            print("Error on Realm \(error)")
        }
    }

    func test2() {
        do {
            let key = try Copy.addTestObject(ofName: "Patricia")
            let object = Copy.getObject(ofType: CopyObject.self, forPrimaryKey: key)
            name2 = object.name
        } catch {
            print("Error on Realm \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
