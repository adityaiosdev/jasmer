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
        background.run(seq, withKey: forTheKey)
        //run the action on your ship
//        player.run(seq, withKey: forTheKey)
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          for touch: AnyObject in touches {
              let pointTouched = touch.location(in: self)
              if nextBtn.contains(pointTouched) {
//                background.run(repright, withKey:"MovingRight")
                movePerson(moveBy: 150, forTheKey: "MoveRight")
              }
            if leftBtn.contains(pointTouched) {
                movePerson(moveBy: -150, forTheKey: "MoveLeft")
            }
         }
      }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        background.removeAction(forKey: "MovingRight")
//        background.removeAction(forKey: "MovingLeft")
        background.removeAction(forKey: "MoveRight")
        background.removeAction(forKey: "MoveLeft")
    }
}
