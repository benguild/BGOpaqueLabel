//
//  BGOpaqueLabel.swift
//  BGOpaqueLabel
//
//  Created by Ben Guild on 10/28/26.
//

import UIKit

@objc(BGOpaqueLabel)
open class BGOpaqueLabel: UILabel {
    private var layerObservations: [NSKeyValueObservation] = []

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        observeLayer()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        observeLayer()
    }

    open override func draw(_ layerDrawn: CALayer, in context: CGContext) {
        if let colorFill = layer.backgroundColor {
            context.setFillColor(colorFill)
            context.fill(context.boundingBoxOfClipPath)
        }

        super.draw(layerDrawn, in: context)
    }

    private nonisolated func layerDidChange() {
        guard Thread.isMainThread else {
            assertionFailure("unexpected state")

            DispatchQueue.main.async {
                self.matchSublayerOpacity()
            }

            return
        }

        MainActor.assumeIsolated {
            matchSublayerOpacity()
        }
    }

    private func matchSublayerOpacity() {
        let sublayersAreOpaque = layer.backgroundColor !== nil

        for sublayer in layer.sublayers ?? [] where
            sublayer.isOpaque != sublayersAreOpaque {
            sublayer.isOpaque = sublayersAreOpaque
            sublayer.setNeedsDisplay()
        }
    }

    private func observeLayer() {
        layerObservations = [
            layer.observe(\.backgroundColor, options: [.initial]) { [weak self] _, _ in
                self?.layerDidChange()
            },

            layer.observe(\.sublayers, options: [.initial]) { [weak self] _, _ in
                self?.layerDidChange()
            },
        ]
    }
}
