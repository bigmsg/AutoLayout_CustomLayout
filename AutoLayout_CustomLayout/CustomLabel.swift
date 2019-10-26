//
//  CustomLabel.swift
//  AutoLayout_CustomLayout
//
//  Created by 양팀장 on 2019. 10. 27..
//  Copyright © 2019년 양팀장. All rights reserved.
//

/*
 커스텀 label 목업
 
 */

import UIKit


@IBDesignable   // 커스텀 위젯으로 사용하는 키워드
class CustomLabel: UILabel {

    @IBInspectable  // attribute inspector에 항목이 추가되어 나타남
    var innerHeight: CGFloat = 0
    

    
    // 위젯 만들어질 때 실행되는 함수
    override func layoutSubviews() {
        print("custom label")
    }

}
