//
//  ALButton.swift
//  ALButton
//
//  Created by Alexandre Leite on 2/22/15.
//  Copyright (c) 2015 Alexandre Leite. All rights reserved.
//

import UIKit

public typealias ButtonStyle = (UIFont, UIColor, UIColor, UIColor)
public typealias ButtonHandler = (sender: UIButton) -> Void

public class ALButton: UIButton {
    
    private var touchUpInsideHandlers: [ButtonHandler] = []
    
    //MARK- Initializers
    
    public init(title: String!, style: Style) {
        super.init(frame: CGRectZero)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK- Base Overrides
    
    
    //MARK- Public Methods
    
    public func touchUpInside(handler: ButtonHandler!) {
        touchUpInsideHandlers.append(handler)
    }
    
    public func clearTouchUpInsideHandlers() {
        touchUpInsideHandlers = []
    }
    
    //MARK- Private Methods
    
}
