//
//  ScoutViewViewModel.swift
//  ScoutingReport
//
//  Created by Ryan Montoyo on 7/9/24.
//

import Foundation
import Combine
import UIKit
import Vision

class ScoutViewViewModel: ObservableObject {
    @Published var isShowingImagePicker = false
    @Published var image: UIImage?
    @Published var gamertags: [String] = []

    func openCamera() {
        isShowingImagePicker = true
    }

    func handleCapturedImage(_ image: UIImage) {
        self.image = image
        recognizeText(in: image)
    }

    private func recognizeText(in image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        let request = VNRecognizeTextRequest { [weak self] (request, error) in
            guard let self = self else { return }
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }

            var recognizedTexts: [String] = []
            for observation in observations {
                if let topCandidate = observation.topCandidates(1).first {
                    recognizedTexts.append(topCandidate.string)
                }
            }
            
            // Assuming the gamertags are 10 in number, you can adjust based on your needs
            self.gamertags = Array(recognizedTexts.prefix(12))
        }
        
        request.recognitionLevel = .accurate

        do {
            try requestHandler.perform([request])
        } catch {
            print("Error performing text recognition: \(error)")
        }
    }
}
