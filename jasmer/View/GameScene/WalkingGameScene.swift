//
//  WalkingGameScene.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 19/08/21.
//

import SpriteKit

class WalkingGameScene : SKScene{

    //bg
    var background = SKSpriteNode(imageNamed: "Tes")

    //button
    var nextBtn = SKSpriteNode(imageNamed: "nextBtn")
    var leftBtn = SKSpriteNode(imageNamed: "prevBtn")

    //objects
    var rumah = SKSpriteNode(imageNamed: "RumahTes")
    var esDogerStand = SKSpriteNode(imageNamed: "EsDogerStand")
    var sekolah = SKSpriteNode(imageNamed: "SekolahTes")

    //person
    var personSprite : SKSpriteNode!

    override func didMove(to view: SKView) {
        print("Halo")

      background.zPosition = 0
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.size = CGSize(width: background.size.width, height: frame.size.height)
        background.name = "bg"
        addChild(background)

      nextBtn.zPosition = 100
        nextBtn.position = CGPoint (x: frame.midX + 320 , y: frame.midY)
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
      leftBtn.zPosition = 100
        leftBtn.position = CGPoint (x: frame.midX - 320 , y: frame.midY)
        leftBtn.name = "prevBtn"
        addChild(leftBtn)

        //player
        personSprite = SKSpriteNode(imageNamed: "Rightleg")
        personSprite.zPosition = 99
        personSprite.size = CGSize(width: 1500/10, height: 2100/10)
        personSprite.position = CGPoint(x: frame.midX, y: frame.minY + 120)
        addChild(personSprite)

        //objects
        rumah.zPosition = 1
        rumah.position = CGPoint(x: frame.midX-20, y: frame.midY-220)
        rumah.size = CGSize(width: 300, height: 300)
        rumah.name = "rmh"
        background.addChild(rumah)

        sekolah.zPosition = 1
        sekolah.position = CGPoint(x: frame.midX+1300, y: frame.midY-230)
        sekolah.size = CGSize(width: 2532/5, height: 1170/5)
        sekolah.name = "sekolah"
        background.addChild(sekolah)

        esDogerStand.zPosition = 1
        esDogerStand.position = CGPoint(x: frame.midX+2300, y: frame.midY-255)
        esDogerStand.size = CGSize(width: 150, height: 150)
        esDogerStand.name = "esDogerStand"
        background.addChild(esDogerStand)
    
    }
    
    func moveBackground (moveBy: CGFloat, forTheKey: String) {
        let moveAction = SKAction.moveBy(x: moveBy, y: 0, duration: 1)
        let repeatForEver = SKAction.repeatForever(moveAction)
        let seq = SKAction.sequence([moveAction, repeatForEver])
        background.run(seq, withKey: forTheKey)
        //run the action on your ship
//        player.run(seq, withKey: forTheKey)
        
    }
    
    func walkingPerson (image1: String, image2: String, image3: String, image4: String, forTheKey: String){
        
        let walkperson1 = SKTexture(imageNamed: image1)
        let walkperson2 = SKTexture(imageNamed: image2)
        let walkperson3 = SKTexture(imageNamed: image3)
        let walkperson4 = SKTexture(imageNamed: image4)
        walkperson1.filteringMode = .nearest
        walkperson2.filteringMode = .nearest
        
        let walkAnimation = SKAction.animate(with: [walkperson1, walkperson2,walkperson3,walkperson4], timePerFrame: 0.5)
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
                walkingPerson(image1: "Rightleg", image2: "Rightlegtrans", image3: "Leftleg", image4: "Leftlegtrans",forTheKey: "Right")
              }
            if leftBtn.contains(pointTouched) {
                moveBackground(moveBy: 150, forTheKey: "MoveLeft")
                walkingPerson(image1: "Rightlegforleft", image2: "Rightlegforlefttrans", image3: "Leftlegforleft", image4: "Leftlegforlefttrans", forTheKey: "Left")
            }


            //object touches
            let objectTouched = touch.location(in: background)
            if rumah.contains(objectTouched) {
              //go to mom convo
              if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard")
                if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                    window.rootViewController = MainViewController
                    UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
              }
            }

            if sekolah.contains(objectTouched) {
              //go to carlos convo
              if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard")
                if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                    window.rootViewController = MainViewController
                    UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
              }
            }

            if esDogerStand.contains(objectTouched) {
              //go to esdoger convo
              if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard")
                if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                    window.rootViewController = MainViewController
                    UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
              }
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
