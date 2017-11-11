//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit


/// A Button with a rounded rect outline around it.
/// The button `title` can be set to a custom string
/// The title and outline will share the same `color: UIColor`
public class OutlineButton: UIButton {

    /// Set's the color for the title and the outline
    /// Default is white
    public var color: UIColor = .white {
        didSet {
            setNeedsDisplay()
            label.textColor = color
        }
    }

    /// The title text to be set, used in the center of the button
    public var title: String {
        set { label.text = newValue }
        get { return label.text ?? "" }
    }

    /// Strokes the outline of the button
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

    /// Animated the button touch down
    /// Color is slightly dimmed, and button size shrinks
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.label.textColor = color.withAlphaComponent(0.6)
        color = color.withAlphaComponent(0.6)
        setNeedsDisplay()
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }
    }

    /// Animates button on touch up
    /// Color is set back to normal and size is set back to identity
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
