//
//  GameScene.swift
//  BelajarAnimasiDenganSpriteKit
//
//  Created by Muhammad Rajab Priharsanto on 20/08/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import SpriteKit

enum ZPositions: Int
{
    case background
    case foreground
    case player
    case otherNodes
}


class GameScene: SKScene
{
    private var ninjaCat = SKSpriteNode()
    private var ninjaCatAnimationFrames: [SKTexture] = []
    var updateLocation: CGPoint = CGPoint(x: 458, y: 300)
    let background = SKSpriteNode(imageNamed: "HomeBackground.png")
    let kickButton = SKSpriteNode(imageNamed: "ObatButton.png")
    let punchButton = SKSpriteNode(imageNamed: "MakanButton.png")
    let walkButton = SKSpriteNode(imageNamed: "MusicButton.png")
    
    var audioReady = AudioModel()
    
    override func didMove(to view: SKView)
    {
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.zPosition = CGFloat(ZPositions.background.rawValue)
        addChild(background)
        
        kickButton.position = CGPoint(x: 816, y: 494)
        kickButton.zPosition = CGFloat(ZPositions.foreground.rawValue)
        kickButton.size = CGSize(width: 79, height: 79)
        kickButton.name = "KickButton"
        addChild(kickButton)
        
        punchButton.position = CGPoint(x: 768, y: 336)
        punchButton.zPosition = CGFloat(ZPositions.foreground.rawValue)
        punchButton.size = CGSize(width: 96, height: 95)
        punchButton.name = "PunchButton"
        addChild(punchButton)
        
        walkButton.position = CGPoint(x: 807, y: 194)
        walkButton.zPosition = CGFloat(ZPositions.foreground.rawValue)
        walkButton.size = CGSize(width: 79, height: 79)
        walkButton.name = "WalkButton"
        addChild(walkButton)
        
        buildWalk()
        animateWalk()
    }
    
    func buildWalk()
    {
        let ninjaCatWalkAnimatedAtlas = SKTextureAtlas(named: "Police_run")
        var walkFrames: [SKTexture] = []
        
        let numImages = ninjaCatWalkAnimatedAtlas.textureNames.count
        for i in 1...numImages
        {
            let ninjaCatWalkTextureName = "police_run_\(i)"
            walkFrames.append(ninjaCatWalkAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
        }
        ninjaCatAnimationFrames = walkFrames
        
        //        let firstFrameTexture = ninjaCatAnimationFrames[0]
        //        ninjaCat = SKSpriteNode(texture: firstFrameTexture)
        ninjaCat.position = updateLocation
        ninjaCat.zPosition = CGFloat(ZPositions.player.rawValue)
        ninjaCat.size = CGSize(width: 357, height: 477)
        ninjaCat.name = "ninjaCatWalk"
        addChild(ninjaCat)
    }
    
    func animateWalk()
    {
        ninjaCat.run(SKAction.repeatForever(
            SKAction.animate(with: ninjaCatAnimationFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                     withKey:"walkingInPlaceNinjaCat")
    }
    
    func buildAttackKick()
    {
        let ninjaCatAnimatedAtlas = SKTextureAtlas(named: "Police_attack")
        var attackKickFrames: [SKTexture] = []
        
        let numImages = ninjaCatAnimatedAtlas.textureNames.count
        for i in 1...numImages
        {
            let ninjaCatTextureName = "Police_attack_\(i)"
            attackKickFrames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatTextureName))
        }
        ninjaCatAnimationFrames = attackKickFrames
        
        //        let firstFrameTexture = ninjaCatAnimationFrames[0]
        //        ninjaCat = SKSpriteNode(texture: firstFrameTexture)
        ninjaCat.position = updateLocation
        ninjaCat.zPosition = CGFloat(ZPositions.player.rawValue)
        ninjaCat.size = CGSize(width: 357, height: 477)
        ninjaCat.name = "ninjaCatKick"
        addChild(ninjaCat)
    }
    
    //animate ninja cat to kick
    func animateAttackKick()
    {
        ninjaCat.run(SKAction.repeatForever(
            SKAction.animate(with: ninjaCatAnimationFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                     withKey:"attackKickInPlaceBear")
    }
    
    func buildAttackPunch()
    {
        let ninjaCatAnimatedAtlas = SKTextureAtlas(named: "Police_jump")
        var attackPunchFrames: [SKTexture] = []
        
        let numImages = ninjaCatAnimatedAtlas.textureNames.count
        for i in 1...numImages
        {
            let ninjaCatTextureName = "Police_jump_\(i)"
            attackPunchFrames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatTextureName))
        }
        ninjaCatAnimationFrames = attackPunchFrames
        
        //        let firstFrameTexture = ninjaCatAnimationFrames[0]
        //        ninjaCat = SKSpriteNode(texture: firstFrameTexture)
        ninjaCat.position = updateLocation
        ninjaCat.zPosition = CGFloat(ZPositions.player.rawValue)
        ninjaCat.size = CGSize(width: 357, height: 477)
        ninjaCat.name = "ninjaCatPunch"
        addChild(ninjaCat)
    }
    
    //animate ninja cat to punch
    func animateAttackPunch()
    {
        ninjaCat.run(SKAction.repeatForever(
            SKAction.animate(with: ninjaCatAnimationFrames,
                             timePerFrame: 0.1,
                             resize: false,
                             restore: true)),
                     withKey:"attackPunchInPlaceNinjaCat")
    }
    
    //Moving the Bear Around the Screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //        let touch = touches.first!
        for touch in touches
        {
            let location = touch.location(in: self)
            let touchedNode = atPoint(location)
            if touchedNode.name == "KickButton"
            {
                // Call the function here.
                backgroundColor = .black
                audioReady.audioClick()
                removeAnimation()
                buildAttackKick()
                animateAttackKick()
                print("Tombol kick berhasil ditekan")
            }
            else if touchedNode.name == "PunchButton"
            {
                // Call the function here.
                backgroundColor = .yellow
                audioReady.audioClick()
                removeAnimation()
                buildAttackPunch()
                animateAttackPunch()
                print("Tombol punch berhasil ditekan")
            }
            else if touchedNode.name == "WalkButton"
            {
                // Call the function here.
                backgroundColor = .green
                audioReady.audioPlay()
                removeAnimation()
                buildWalk()
                animateWalk()
                print("Tombol punch berhasil ditekan")
            }
            else
            {
                //moveNinjaCat(location: location)
                print("Kucing jalan")
            }
        }
    }
    
    func ninjaCatMoveEnded()
    {
        ninjaCat.removeAllActions()
    }
    
    func removeAnimation()
    {
        //remove child node from parent, biar kucingnya gak kagebunshin
        if let child = self.childNode(withName: "ninjaCatWalk") as? SKSpriteNode
        {
            child.removeFromParent()
        }
        
        if let child = self.childNode(withName: "ninjaCatKick") as? SKSpriteNode
        {
            child.removeFromParent()
        }
        
        if let child = self.childNode(withName: "ninjaCatPunch") as? SKSpriteNode
        {
            child.removeFromParent()
        }
    }
    
    func moveNinjaCat(location: CGPoint)
    {
        // 1
        var multiplierForDirection: CGFloat
        
        // 2
        let ninjaCatSpeed = frame.size.width / 3.0
        
        // 3
        let moveDifference = CGPoint (x: location.x - ninjaCat.position.x, y: location.y - ninjaCat.position.y)
        let distanceToMove = sqrt(moveDifference.x * moveDifference.x + moveDifference.y * moveDifference.y)
        
        // 4
        let moveDuration = distanceToMove / ninjaCatSpeed
        
        // 5
        if moveDifference.x < 0
        {
            multiplierForDirection = -1.0
        }
        else
        {
            multiplierForDirection = 1.0
        }
        ninjaCat.xScale = abs(ninjaCat.xScale) * multiplierForDirection
        
        updateLocation = location
        //animate the ninja cat
        // 1
        if ninjaCat.action(forKey: "walkingInPlaceNinjaCat") == nil
        {
            // if legs are not moving, start them
            animateWalk()
        }
        
        // 2
        let moveAction = SKAction.move(to: location, duration:(TimeInterval(moveDuration)))
        
        // 3
        let doneAction = SKAction.run({ [weak self] in
            self?.ninjaCatMoveEnded()
        })
        
        // 4
        let moveActionWithDone = SKAction.sequence([moveAction, doneAction])
        ninjaCat.run(moveActionWithDone, withKey:"ninjaCatMoving")
    }
    
    //    //Changing Animation Facing Direction
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    //    {
    //        let touch = touches.first!
    //        let location = touch.location(in: self)
    //
    //        var multiplierForDirection: CGFloat
    //        if location.x < frame.midX
    //        {
    //            // walk left
    //            multiplierForDirection = 1.0
    //        }
    //        else
    //        {
    //            // walk right
    //            multiplierForDirection = -1.0
    //        }
    //
    //        ninjaCat.xScale = abs(ninjaCat.xScale) * multiplierForDirection
    //        animateWalk()
    //    }
}

