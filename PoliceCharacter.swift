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
        let ninjaCatAnimatedAtlas = SKTextureAtlas(named: "Police_dance")
        var Frames: [SKTexture] = []
        
        let numImages = ninjaCatAnimatedAtlas.textureNames.count
        if game.danceButton.name == "DanceButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_dance_\(i)"
                Frames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = Frames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatDance"
        }
        else if game.makanButton.name == "RunButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_jump_\(i)"
                Frames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = Frames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatRun"
        }
        else if game.obatButton.name == "ObatButton"
        {
            for i in 1...numImages
            {
                let ninjaCatWalkTextureName = "police_attack_\(i)"
                Frames.append(ninjaCatAnimatedAtlas.textureNamed(ninjaCatWalkTextureName))
            }
            ninjaCatAnimationFrames = Frames
            ninjaCat.size = CGSize(width: 357, height: 477)
            ninjaCat.name = "ninjaCatAttack"
        }
        
        //        let firstFrameTexture = ninjaCatAnimationFrames[0]
        //        ninjaCat = SKSpriteNode(texture: firstFrameTexture)
        ninjaCat.position = game.updateLocation
        addChild(ninjaCat)
    }
    
    func animateCharacter()
    {
        if game.danceButton.name == "DanceButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"dancingInPlaceNinjaCat")
        }
        else if game.makanButton.name == "RunButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"runInPlaceNinjaCat")
        }
        else if game.obatButton.name == "ObatButton"
        {
            ninjaCat.run(SKAction.repeatForever(
                SKAction.animate(with: ninjaCatAnimationFrames,
                                 timePerFrame: 0.1,
                                 resize: false,
                                 restore: true)),
                         withKey:"attackInPlaceNinjaCat")
        }
    }
}
