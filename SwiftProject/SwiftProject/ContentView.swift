//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var newClotheScreenIsPresented = false
    
    @StateObject var myCloset = Closet(clothes: Clothe.previewCloset)
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(myCloset.clothes) { clothe in
                            NavigationLink {
                                ClotheDetailsView(clothe: clothe, closet: myCloset)
                            } label: {
                                ClotheCell(clothe: clothe)
                            }
                            Divider()
                                .padding()
                        }
                    }
                    NavigationLink {
                        NewClotheScreen(closet: myCloset)
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
    ContentView(myCloset: Closet(clothes: Clothe.previewCloset))
}
