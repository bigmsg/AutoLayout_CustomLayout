//
//  DiagonalCustomImageView.swift
//  AutoLayout_CustomLayout
//
//  Created by 양팀장 on 2019. 10. 26..
//  Copyright © 2019년 양팀장. All rights reserved.
//

import UIKit

@IBDesignable       // 커스텀위젯이 스토리보드에서 바로 사용할 수 있음
class DiagonalCustomImageView: UIImageView {
    
    // 대각선으로 잘린 사각형을 그린다.
    // bezierPath
    
    // path -> layer
    
    // layer -> mask
    
    /* 내가 만든 커스텀 코드 --> storyboard 편집화면에서 바로확인
        1. 스토리보드에서 UIImageView 추가
        2. identifier inspector에서 Custom Class 항목에 DiagonalCustomImageView 설정
        3. custom image view 적용이 됨
     
     
     */
    
    
    // inspector 창에서 innerHeight 항목이 새로 생김
    @IBInspectable var innerHeight: CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        //path.move(to: CGPoint.init(x:0, y:0))
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        
        path.close()
        
        return path
    }

    func pathToLayer () -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
        
    }
    
    // 위젯이 만들어질때 실행되는 메소드
    override func layoutSubviews() {
        print("custom imageview layoutSubviews()")
        makeMask()
    }
    
}
