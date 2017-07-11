//
//  BGClass.swift
//  JackGaintDemo
//
//  Created by sky on 2017/7/11.
//  Copyright © 2017年 sky. All rights reserved.
//

import SpriteKit

class BGClass: SKSpriteNode {
    func moveBG(camera: SKCameraNode){
        if self.position.y - self.size.height - 10 > camera.position.y{
            self.position.y -= self.size.height * 3 //3個背景為一單位，所以在這*3
            
        }
    }
    
    
    
    
}





