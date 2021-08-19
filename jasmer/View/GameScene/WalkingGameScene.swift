//
//  WalkingGameScene.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 19/08/21.
//

import SpriteKit

class WalkingGameScene : SKScene{
    
    var background = SKSpriteNode(imageNamed: "Tes")
    var nextBtn = SKSpriteNode(imageNamed: "nextBtn")
    var leftBtn = SKSpriteNode(imageNamed: "prevBtn")

    override func didMove(to view: SKView) {
        print("Halo")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: background.size.width, height: frame.size.height)
        background.name = "bg"
        addChild(background)
        nextBtn.position = CGPoint (x: frame.midX + 100 , y: frame.midY)
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
        leftBtn.position = CGPoint (x: frame.midX - 100 , y: frame.midY)
        leftBtn.name = "prevBtn"
        addChild(leftBtn)
    }
    
    func movePerson (moveBy: CGFloat, forTheKey: String) {
        let moveAction = SKAction.moveBy(x: moveBy, y: 0, duration: 1)
        let repeatForEver = SKAction.repeatForever(moveAction)
        let seq = SKAction.sequence([moveAction, repeatForEver])

        //run the action on your ship
//        player.run(seq, withKey: forTheKey)
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          for touch: AnyObject in touches {
              let pointTouched = touch.location(in: self)
              if nextBtn.contains(pointTouched) {
                  background.position.x -= 30
              }
            if leftBtn.contains(pointTouched) {
                background.position.x += 30
            }
         }
      }
}