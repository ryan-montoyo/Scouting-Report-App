//
//  ScoutView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI

struct ScoutView: View {
    @StateObject private var viewModel = ScoutViewViewModel()
    @State private var navigateToLobbyView = false

    var body: some View {
        NavigationView {
            VStack {
                if let image = viewModel.image {
    //                Image(uiImage: image)
    //                    .resizable()
    //                    .scaledToFit()
    //                    .frame(maxHeight: 300)
                } else {
                    VStack {
                        Text("Click here to scout")
                            .padding()
                            .foregroundColor(.gray)
                        
                        
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.gray)
                    }
                    .onTapGesture {
                        viewModel.openCamera()
                    }
                }

                if !viewModel.gamertags.isEmpty {
                    Text("Confirm IDs and Console")
                        .font(Font.custom("ScoutCondensed-Bold", size: 35))
                        .padding(.top, 15)
                    HStack {
                        Spacer()
                        Text("PSN?")
                            .font(Font.custom("ScoutCondensed-Bold", size: 15))
                            .padding(.trailing, 25)
                            .padding(.bottom, 0)
                    }
                    VStack {
                        ForEach(0..<viewModel.gamertags.count, id: \.self) { index in
                            if viewModel.gamertags[index] != "ATK" && viewModel.gamertags[index] != "DEF" {
                                HStack {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(Color(.secondarySystemFill))
                                            .frame(width: 200, height: 45)
                                        TextField("Gamertag \(index + 1)", text: $viewModel.gamertags[index])
                                            .foregroundColor(.white)
                                            .font(Font.custom("ScoutCondensed-BoldItalic", size: 20))
                                            .padding()
                                            .frame(width: 200, height: 45)
                                    }
                                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .padding(.top, 0)

                    VStack {
                        NavigationLink(destination: LobbyView(), isActive: $navigateToLobbyView) {
                            Button("Confirm") {
                                navigateToLobbyView = true
                            }
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 10)
                }
            }
            .sheet(isPresented: $viewModel.isShowingImagePicker) {
                ImagePicker(viewModel: viewModel)
            }
        }
    }
}



#Preview {
    ScoutView()
}
