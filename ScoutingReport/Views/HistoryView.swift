//
//  HistoryView.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import SwiftUI

struct HistoryView: View {
    @StateObject var viewModel = HistoryViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            if viewModel.history.isEmpty {
                VStack {
                    Image(systemName: "clock.arrow.circlepath")
                        .padding(5)
                        .foregroundColor(.gray)
                    Text("No history")
                        .foregroundColor(.gray)
                }
            }
            else {
                List(viewModel.history) { lobby in
                    VStack(alignment: .leading) {
                        Text("Scanned on \(lobby.scanDate, formatter: dateFormatter)")
                            .font(.headline)
                    }
                }
                .navigationTitle("History")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAlert = true // Set showAlert to true to trigger the alert
                        }) {
                            Image(systemName: "trash.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Confirm Clear History"),
                        message: Text("Are you sure you want to clear the lobby history?"),
                        primaryButton: .destructive(Text("Clear")) {
                            viewModel.clearHistory()
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()


#Preview {
    HistoryView()
}
