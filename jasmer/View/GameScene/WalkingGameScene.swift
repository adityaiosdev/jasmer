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
    var personSprite : SKSpriteNode!
    override func didMove(to view: SKView) {
        print("Halo")
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: background.size.width, height: frame.size.height)
        background.name = "bg"
        addChild(background)
        nextBtn.position = CGPoint (x: frame.midX + 320 , y: frame.midY)
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
        leftBtn.position = CGPoint (x: frame.midX - 320 , y: frame.midY)
        leftBtn.name = "prevBtn"
        addChild(leftBtn)
    
    }
    
    func moveBackground (moveBy: CGFloat, forTheKey: String) {
        let moveAction = SKAction.moveBy(x: moveBy, y: 0, duration: 1)
        let repeatForEver = SKAction.repeatForever(moveAction)
        let seq = SKAction.sequence([moveAction, repeatForEver])
        background.run(seq, withKey: forTheKey)
        //run the action on your ship
//        player.run(seq, withKey: forTheKey)
        
    }
    
    func walkingPerson (image1: String, image2: String, forTheKey: String){
        
        let walkperson1 = SKTexture(imageNamed: image1)
        let walkperson2 = SKTexture(imageNamed: image2)
        walkperson1.filteringMode = .nearest
        walkperson2.filteringMode = .nearest
        
        let walkAnimation = SKAction.animate(with: [walkperson1, walkperson2], timePerFrame: 0.5)
        personSprite = SKSpriteNode()
        personSprite.size = CGSize(width: 200, height: 200)
        personSprite.position = CGPoint(x: frame.midX, y: frame.minY + 100)
        addChild(personSprite)
        let repeatForEver = SKAction.repeatForever(walkAnimation)
        let seq = SKAction.sequence([walkAnimation,repeatForEver])
        personSprite.run(seq, withKey : forTheKey)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          for touch: AnyObject in touches {
              let pointTouched = touch.location(in: self)
              if nextBtn.contains(pointTouched) {
//                background.run(repright, withKey:"MovingRight")
                moveBackground(moveBy: -150, forTheKey: "MoveRight")
                walkingPerson(image1: "Rightleg", image2: "Leftleg", forTheKey: "Right")
              }
            if leftBtn.contains(pointTouched) {
                moveBackground(moveBy: 150, forTheKey: "MoveLeft")
                walkingPerson(image1: "Rightlegforleft", image2: "Leftlegforleft", forTheKey: "Left")
            }
         }
      }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        background.removeAction(forKey: "MovingRight")
//        background.removeAction(forKey: "MovingLeft")
        background.removeAction(forKey: "MoveRight")
        background.removeAction(forKey: "MoveLeft")
        personSprite.removeAction(forKey: "Right")
        personSprite.removeAction(forKey: "Left")
    }
}
