/*

Copyright (c) 2015 - Alex Leite (al7dev)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

import UIKit

public typealias ButtonHandler = (UIButton) -> Void

public class ALButton: UIButton {
    
    private typealias KVOContext = UInt8
    private var context = KVOContext()

    public var style: ButtonStyle = ButtonStyle()
    private var touchUpInsideHandlers: [ButtonHandler] = []
    private var touchingDown = false
    
    //MARK- Initializers
    
    public init(title: String!, style: ButtonStyle? = nil, touchUpInsideHandler: ButtonHandler? = nil) {
        super.init(frame: CGRectZero)
        
        self.setTitle(title, forState: .Normal)
        if let st = style {
            self.style = st
        }
        
        self.updateFace()
        
        self.addTarget(self, action: "onBaseTouchUp:", forControlEvents: .TouchUpInside)
        self.addTarget(self, action: "onBaseTouchUp:", forControlEvents: .TouchUpOutside)
        self.addTarget(self, action: "onBaseTouchDown:", forControlEvents: .TouchDown)
        self.addTarget(self, action: "fireTouchUpInsideHandlers:", forControlEvents: .TouchUpInside)
        
        self.addObserver(self, forKeyPath: "enabled", options: .New | .Old, context: &context)
        self.addObserver(self, forKeyPath: "style", options: .New | .Old, context: &context)
    }
    
    convenience init(title: String!, touchUpHandler: ButtonHandler!) {
        self.init(title: title, style: nil, touchUpInsideHandler: touchUpHandler)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        fatalError("init(frame:) should not be used")
    }
    
    //MARK- Base Overrides
    
    public override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "enabled" {
            self.updateFace()
        }
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "enabled")
        self.removeObserver(self, forKeyPath: "style")
    }
    
    //MARK- Public Methods
    
    public func touchUpInside(handler: ButtonHandler!) {
        self.touchUpInsideHandlers.append(handler)
    }
    
    public func clearTouchUpInsideHandlers() {
        self.touchUpInsideHandlers = []
    }
    
    //MARK- Private Methods
    
    public func updateFace() {
        //-- Setting fixed color values
        self.setTitleColor(self.style.titleColor,  forState: .Normal)
        self.setTitleColor(self.style.disabledTitleColor, forState: .Disabled)
        
        //-- Setting variable color values
        if self.enabled {
            if self.touchingDown {
                self.backgroundColor = self.style.highlightColor
            }
            else {
                self.backgroundColor = self.style.backgroundColor
            }
        }
        else {
            self.backgroundColor = self.style.disabledColor
        }
    }
    
    //MARK- Action Targets
    
    internal func onBaseTouchUp(sender: UIButton) {
        self.touchingDown = false
        self.updateFace()
    }
    
    internal func onBaseTouchDown(sender: UIButton) {
        self.touchingDown = true
        self.updateFace()
    }
    
    internal func fireTouchUpInsideHandlers(sender: UIButton) {
        for handler in self.touchUpInsideHandlers {
            handler(self)
        }
    }
    
    //MARK- Helper Structs
    
    public struct ButtonStyle {
        public var titleFont = UIFont.systemFontOfSize(14.0)
        public var titleColor = UIColor.whiteColor()
        public var disabledTitleColor = UIColor.lightGrayColor()
        public var backgroundColor = UIColor(red: 0, green: 204.0 / 255.0, blue: 0.0, alpha: 1.0)
        public var highlightColor = UIColor(red: 0.0, green: 153.0 / 255.0, blue: 0.0, alpha: 1.0)
        public var disabledColor = UIColor.grayColor()
    }

}