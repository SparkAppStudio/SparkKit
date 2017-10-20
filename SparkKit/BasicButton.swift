//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit

@IBDesignable
class BasicButton: UIButton {

    let rounded: CGFloat = 12

    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }

    func sharedInit() {
        titleLabel?.textColor = UIColor.white
    }


    override func draw(_ rect: CGRect) {

        let ctx = UIGraphicsGetCurrentContext()!

        let inset = rect.insetBy(dx: 1, dy: 1)
        let rounded = UIBezierPath(roundedRect: inset, cornerRadius: self.rounded)

        UIColor.blue.setFill()
        ctx.addPath(rounded.cgPath)
        ctx.fillPath()

        UIColor.orange.setStroke()
        ctx.addPath(rounded.cgPath)
        ctx.strokePath()
    }

    override var intrinsicContentSize: CGSize {
        if let string = titleLabel?.text as
            NSString? {
            let stringSize = string.size(withAttributes: [.font: titleLabel!.font])
            return CGSize(width: rounded * 2 + ceil(stringSize.width), height: rounded * 2 + ceil(stringSize.height))
        }
        return super.intrinsicContentSize
    }

    override func prepareForInterfaceBuilder() {
        self.setNeedsDisplay()
    }
}
