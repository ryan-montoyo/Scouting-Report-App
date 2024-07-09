//
//  ScoutView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI

struct ScoutView: View {
    @StateObject private var viewModel = ScoutViewViewModel()

    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
            } else {
                VStack {
                    Text("Start Scouting")
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
                List(viewModel.gamertags, id: \.self) { gamertag in
                    Text(gamertag)
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingImagePicker) {
            ImagePicker(viewModel: viewModel)
        }
    }
}

#Preview {
    ScoutView()
}
