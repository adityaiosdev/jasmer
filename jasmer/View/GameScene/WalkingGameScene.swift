//
//  WalkingGameScene.swift
//  jasmer
//
//  Created by Aditya Ramadhan on 19/08/21.
//

import SpriteKit
import UIKit

class WalkingGameScene : SKScene, WrongStoryPopUpControllerDelegate{
    func resumeGame() {
        print("Kembali")
    }
    
    
    //bg
    var background = SKSpriteNode(imageNamed: "Tes")
    
    //button
    var nextBtn = SKSpriteNode(imageNamed: "nextBtn")
    var leftBtn = SKSpriteNode(imageNamed: "prevBtn")
    
    //objects
    var rumah = SKSpriteNode(imageNamed: "RumahTes")
    var esDogerStand = SKSpriteNode(imageNamed: "EsDogerStand")
    var sekolah = SKSpriteNode(imageNamed: "SekolahTes")

    
    //kantor polisi
    var kantorPolisi = SKSpriteNode(imageNamed: "KantorPolisi")
    
    //pak hoegeng chibi
    var hoegengChibi = SKSpriteNode(imageNamed: "hoegengChibi")
    
=======

  //bandara hatta
//    var bandara = SKSpriteNode(imageNamed: "Bandara")


    //person
    var personSprite : SKSpriteNode!
    
//    var backgroundPosition: CGPoint?
    
    var nextSection: Int?
    let cdm = CoreDataManager()
    var backgroundPosition = [BackgroundPosition]()
    
    override func didMove(to view: SKView) {
        print("Halo")
        print(nextSection)
        WrongStoryPopUpController.instance.delegate = self
        
        background.zPosition = 0
        
        backgroundPosition = cdm.getBackgroundPosition()
        
        if backgroundPosition.isEmpty{
            print("BG Position empty")
            background.position = CGPoint(x: frame.midX, y: frame.midY)
        }
        else{
            print(backgroundPosition[0].xPosition)
            let bgPosition = backgroundPosition[0]
            background.position = CGPoint(x: CGFloat(bgPosition.xPosition), y: CGFloat(bgPosition.yPosition))
        }
        
        background.size = CGSize(width: background.size.width, height: frame.size.height+10)
        background.name = "bg"
        addChild(background)
      
      //create pesawat hatta
//        createPesawat()
        
        nextBtn.zPosition = 1
        nextBtn.position = CGPoint (x: frame.minX + 180 , y: frame.minY + 60)
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
        leftBtn.zPosition = 100
        leftBtn.position = CGPoint (x: frame.minX + 100 , y: frame.minY + 60)
        leftBtn.name = "prevBtn"
        addChild(leftBtn)
        
        //player
        personSprite = SKSpriteNode(imageNamed: "Rightleg")
        personSprite.zPosition = 99
        personSprite.size = CGSize(width: 1500/10, height: 2100/10)
        personSprite.position = CGPoint(x: frame.midX, y: frame.minY + 120)
        addChild(personSprite)
        
        //objects
//          bandara.zPosition = 1
//          bandara.position = CGPoint(x: frame.midX-20, y: frame.midY-230)
//          bandara.size = CGSize(width: 2532/5, height: 1170/5)
//          bandara.name = "bandara"
//          background.addChild(bandara)

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
        
        hoegengChibi.zPosition = 1
        hoegengChibi.position = CGPoint(x: frame.midX-280, y: frame.midY-275)
        hoegengChibi.size = CGSize(width: 93, height: 140)
        hoegengChibi.name = "hoegengChibi"
        background.addChild(hoegengChibi)
        
        kantorPolisi.zPosition = 1
        kantorPolisi.position = CGPoint(x: frame.midX-20, y: frame.midY-220)
        kantorPolisi.size = CGSize(width: 1824/4, height: 211)
        kantorPolisi.name = "kantorPolisi"
        background.addChild(kantorPolisi)
             
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
        
        let walkAnimation = SKAction.animate(with: [walkperson1, walkperson2,walkperson3,walkperson4], timePerFrame: 0.3)
        let repeatForEver = SKAction.repeatForever(walkAnimation)
        let footstepSoundEffect = SKAction.repeatForever(SKAction.playSoundFileNamed("footstepSound.mp3", waitForCompletion: true))
        let seq = SKAction.sequence([walkAnimation,repeatForEver])
        self.run(footstepSoundEffect, withKey: "footstepSoundEffect")
        personSprite.run(seq, withKey : forTheKey)
    }

  // animasi + create pesawat
    func createPesawat() {
        //texture
        let pesawatTexture = SKTexture(imageNamed: "Pesawat")
        let pesawatScale = 0.1 as CGFloat
        pesawatTexture.filteringMode = .nearest

        //pesawat sprite
        let pesawatSprite = SKSpriteNode(texture: pesawatTexture)
        pesawatSprite.setScale(pesawatScale)
        //add to scene
        background.addChild(pesawatSprite)

        //animate pesawat
        animatePesawat(sprite: pesawatSprite, textureWidth: pesawatScale)
    }

    func animatePesawat(sprite: SKSpriteNode, textureWidth: CGFloat) {

        //pesawat
        //    SKAction.mov
        let movePesawat = SKAction.move(to: CGPoint(x: frame.minX-600, y: frame.maxY), duration: 10.0)
        let rotatePesawat = SKAction.rotate(toAngle: CGFloat(-.pi/10.0), duration: 1, shortestUnitArc: true)

        let resetPesawat = SKAction.move(to: CGPoint(x: frame.minX+540, y: frame.minY), duration: 0)
        let pesawatLoop = SKAction.sequence([rotatePesawat, movePesawat, resetPesawat])

        sprite.position = CGPoint(x: frame.midX-60, y: frame.midY-220)
        sprite.run(SKAction.repeatForever(pesawatLoop))
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let cdm = CoreDataManager()
            //object touches
            let objectTouched = touch.location(in: background)
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

          //touches bandara
//          if bandara.contains(objectTouched) && background.position.x <= frame.midX-20-150 && background.position.x >= (frame.midX-20-150) - 300-100 {
//              //go to hatta convo
//              if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
//                cdm.insertEntry(1, 0, currentIndex: 0)
//                let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard") as? StoryViewController
//                MainViewController?.backgroundPosition = background.position
//                if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
//                  window.rootViewController = MainViewController
//                  UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
//                }
//              }
//            }

            if rumah.contains(objectTouched) && background.position.x <= frame.midX-20-150 && background.position.x >= (frame.midX-20-150) - 300-100 {
                //go to mom convo
                if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                    cdm.deleteBackgroundPosition()
                    cdm.insertBackgroundPosition(bgPosition: background.position)
                    cdm.insertEntryLastUpdates(1, 0, currentIndex: 0)
                    let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard") as? StoryViewController
//                    MainViewController?.backgroundPosition = background.position
                    if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
                        window.rootViewController = MainViewController
                        UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                    }
                }
            }

            if sekolah.contains(objectTouched) && background.position.x <= frame.midX-1300-150 && background.position.x >= frame.midX-1300-150 - 2532/5-100{
                //go to carlos convo
                if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                    WrongStoryPopUpController.instance.showAlert()
//                    cdm.insertEntry(1, 1, currentIndex: 0)
//                    let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard") as? StoryViewController
//                    MainViewController?.backgroundPosition = background.position
//                    if let sceneDelegate = self.view?.window?.windowScene?.delegate as? SceneDelegate, let window = sceneDelegate.window{
//                        window.rootViewController = MainViewController
//                        UIView.transition(with: window, duration: 0.1, options: .transitionCrossDissolve, animations: nil, completion: nil)
                    }
                }
            

            if esDogerStand.contains(objectTouched) && background.position.x <= frame.midX-2300-150 && background.position.x >= frame.midX-2300-150-150-100{
                //go to esdoger convo
                if (!nextBtn.contains(pointTouched) && !leftBtn.contains(pointTouched)){
                    cdm.insertEntryLastUpdates(1, 10, currentIndex: 0)
                    let MainViewController = UIStoryboard(name: "StoryStoryboard", bundle: nil).instantiateViewController(identifier: "StoryStoryboard") as? StoryViewController
                    MainViewController?.backgroundPosition = background.position
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
        self.removeAction(forKey: "footstepSoundEffect")
    }
}
