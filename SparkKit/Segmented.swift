//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit

class RoundedShadow: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(rect)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 12)

        context.addPath(path.cgPath)
        context.setFillColor(UIColor.orange.cgColor)
        context.fillPath()

        context.addPath(path.cgPath)
        context.setStrokeColor(UIColor.black.cgColor)
        context.strokePath()

        // TODO: Add shadow here
    }
}

public class SegmentedSubClass: UISegmentedControl {

    lazy var backgroundView: RoundedShadow = {
        let v = RoundedShadow()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clear

        insertSubview(backgroundView, at: 0)
        backgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: -12).isActive = true
        backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: -12).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: 12).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12).isActive = true

        // TODO: Since the background view extends beyond the frame....
        // how do we notify adjacent view's of our larger size?
    }
}
