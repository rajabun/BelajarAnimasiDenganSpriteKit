//
//  Police.swift
//  BelajarAnimasiDenganSpriteKit
//
//  Created by Muhammad Rajab Priharsanto on 22/08/19.
//  Copyright © 2019 Muhammad Rajab Priharsanto. All rights reserved.
//

import UIKit
import SpriteKit

class PoliceCharacter: SKSpriteNode
{
    private var ninjaCat = SKSpriteNode()
    private var ninjaCatAnimationFrames: [SKTexture] = []
    var game = GameScene()
    
    func buildCharacter()
    {
        let ninjaCatAnimatedAtlas = SKTextureAtlas(named: "Police_run")
        var walkFrames: [SKTexture] = []
        
        let numImages = ninjaCatAnimatedAtlas.textureNames.count
        if game.kickButton.name == "WalkButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_run_\(i)"
                walkFrames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = walkFrames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatWalk"
        }
        else if game.punchButton.name == "KickButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_attack_\(i)"
                walkFrames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = walkFrames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatKick"
        }
        else if game.punchButton.name == "PunchButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_jump_\(i)"
                walkFrames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = walkFrames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatPunch"
        }
        //        let firstFrameTexture = ninjaCatAnimationFrames[0]
        //        ninjaCat = SKSpriteNode(texture: firstFrameTexture)
        ninjaCat.position = game.updateLocation
        addChild(ninjaCat)
    }
    
    func animateCharacter()
    {
        if game.kickButton.name == "WalkButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"walkingInPlaceNinjaCat")
        }
        else if game.kickButton.name == "KickButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"attackKickInPlaceNinjaCat")
        }
        else if game.kickButton.name == "PunchButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"attackPunchInPlaceNinjaCat")
        }
    }
}
