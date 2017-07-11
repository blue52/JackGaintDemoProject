//
//  GameplayScene.swift
//  JackGaintDemo
//
//  Created by sky on 2017/7/10.
//  Copyright © 2017年 sky. All rights reserved.
//

import SpriteKit

class GameplayScene: SKScene {
    
    var player: Player?
    var canMove = false
    var moveLeft = false
    var center: CGFloat?
    var mainCamera: SKCameraNode?
    var bg1: BGClass?
    var bg2: BGClass?
    var bg3: BGClass?
    
    override func didMove(to view: SKView) {
        
        initializeVaribles()
    }
    override func update(_ currentTime: TimeInterval) {
        moveCamera()
        managePlayer()
        manageBackgrounds()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
        {
        for touch in touches{
            let location = touch.location(in: self)
            if location.x > center! {
                moveLeft = false
                player?.animatePlayer(moveLeft: moveLeft)
            }else{
                moveLeft = true
                player?.animatePlayer(moveLeft: moveLeft)
            }
        }
        canMove = true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        canMove = false
        player?.stopPlayerAnimation()
    }
    func managePlayer(){
        if canMove{
            player?.movePlayer(moveLeft: moveLeft)
        }
    }
    func initializeVaribles(){
        center = (self.scene?.size.width)!/(self.scene?.size.height)!
        player = self.childNode(withName: "Player") as? Player!
        player?.initializePlayerAndAnimations()
        mainCamera = self.childNode(withName: "Main Camera") as? SKCameraNode!
        
    }//lesson 48
    func moveCamera(){
        self.mainCamera?.position.y -= 3
        
    }//lesson 48
    
    func getBackgrounds(){
        bg1 = self.childNode(withName: "BG 1") as? BGClass!
        bg2 = self.childNode(withName: "BG 2") as? BGClass!
        bg3 = self.childNode(withName: "BG 3") as? BGClass!
        
    }
    func manageBackgrounds(){
        bg1?.moveBG(camera: mainCamera!)
        bg2?.moveBG(camera: mainCamera!)
        bg3?.moveBG(camera: mainCamera!)
    }
    
}
























