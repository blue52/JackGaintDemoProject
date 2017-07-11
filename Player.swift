//
//  Player.swift
//  JackGaintDemo
//
//  Created by sky on 2017/7/10.
//  Copyright © 2017年 sky. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    private var textureAtlas = SKTextureAtlas()
    private var playerAnimation = [SKTexture]()
    private var animatePlayerAction = SKAction()
    
    func initializePlayerAndAnimations(){
        self.xScale = 1.2
        
        textureAtlas = SKTextureAtlas(named: "Player.atlas")
        for i in 2...textureAtlas.textureNames.count{
            let name = "Player \(i)"
            playerAnimation.append(SKTexture(imageNamed: name))
            
        }
        animatePlayerAction = SKAction.animate(with: playerAnimation, timePerFrame: 0.08, resize: true, restore: false)
    }
    //判斷角色可以隨著行走方向而改變身體方向
    func animatePlayer(moveLeft: Bool){
        if moveLeft{
            self.xScale = -fabs(self.xScale)
        }else{
            self.xScale = fabs(self.xScale)
        }
        
        self.run(SKAction.repeatForever(animatePlayerAction), withKey: "Animate")
        
    }
    
    func stopPlayerAnimation(){
        self.removeAction(forKey: "Animate")
        self.texture = SKTexture(imageNamed: "Player 1")
        self.size = (self.texture?.size())!
        
    }
    func movePlayer(moveLeft: Bool){
        if moveLeft {
            self.position.x = self.position.x - 7
        }else{
            self.position.x = self.position.x + 7
        
        }
        
    }
    
}





