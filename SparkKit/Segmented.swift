//
//  Copyright © 2017 Spark App Studio. All rights reserved.
//

import UIKit

public class SegmentedControl: UISegmentedControl {

    public override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.setShadow(offset: CGSize(width: 10, height: 10), blur: 10, color: UIColor.black.cgColor)
        super.draw(rect)
    }

}
