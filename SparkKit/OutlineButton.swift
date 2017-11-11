//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit

public class OutlineButton: UIButton {
    public var color: UIColor = .white {
        didSet {
            setNeedsDisplay()
            label.textColor = color
        }
    }

    public var title: String {
        set { label.text = newValue }
        get { return label.text ?? "" }
    }

    public override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: 4, dy: 4)
        let outlinePath = UIBezierPath(roundedRect: insetRect, cornerRadius: 12.0)
        color.setStroke()
        outlinePath.lineWidth = 1.0
        outlinePath.stroke()
    }

    lazy private var label: UILabel = {
        let l = UILabel(frame: CGRect.zero)
        l.frame = self.bounds
        l.textColor = self.color
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 24.0)
        return l
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    private func sharedInit() {
        addSubview(label)
    }

    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.label.textColor = color.withAlphaComponent(0.6)
        color = color.withAlphaComponent(0.6)
        setNeedsDisplay()
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.label.textColor = color.withAlphaComponent(1.0)
        color = color.withAlphaComponent(1.0)
        setNeedsDisplay()
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform.identity
        }
    }
}
