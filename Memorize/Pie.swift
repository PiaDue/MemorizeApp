//
//  Pie.swift
//  Memorize
//
//  Created by Pia Dünow on 24.10.22.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var center = CGPoint(x: rect.midX, y: rect.midY)
        var radius = min(rect.width, rect.height) / 2
        let startPoint = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(cos(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center) //no drawing just moving the "pen"
        p.addLine(to: startPoint)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !false
        )
        p.addLine(to: center)
        
        return p
    }
    
    
}
