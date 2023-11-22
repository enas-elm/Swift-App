//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var newRecepeScreenIsPresented = false
    
    @StateObject var myRecepes = AllRecepes(recepes: Recepe.previewAllRecepes)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(myRecepes.recepes) { recepe in
                            NavigationLink {
                                RecepeDetailsView(recepe: recepe, allRecepes: myRecepes)
                            } label: {
                                RecepeCell(recepe: recepe)
                            }
                            Divider()
                                .padding()
                        }
                    }
                    NavigationLink {
                        NewRecepeScreen(allRecepes: myRecepes)
                    } label: {
                       Text("New")
                    }
                }
                .padding()
            }
            
        }
    }
}

#Preview {
    ContentView(myRecepes: AllRecepes(recepes: Recepe.previewAllRecepes))
}
