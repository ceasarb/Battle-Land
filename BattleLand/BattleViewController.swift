//
//  BattleViewController.swift
//  BattleLand
//
//  Created by Ceasar Barbosa on 6/4/16.
//  Copyright © 2016 Ceasar Barbosa. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var heroHPLabel: UILabel!
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var enemyAttackLabel: UILabel!
    @IBOutlet weak var heroAttackLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var spartanAttackButton: UIButton!
    @IBOutlet weak var enemyAttackButton: UIButton!
    
    //MARK: Variables
    var enemyPlayer1: Character!
    var heroPlayer2: Character!
    
  

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewGame()
        
        hideRestartButton()
        

    }
    
    //MARK: IBActions
    @IBAction func onAttackButtonTapped(sender: UIButton) {
        
        if sender.tag == 1 {
            heroPlayer2.attemptAttack(enemyPlayer1.attackPower)
            printLabel.text = "\(enemyPlayer1.name) attacked \(heroPlayer2.name) for \(enemyPlayer1.attackPower) HP"
            heroHPLabel.text = "\(heroPlayer2.hp)HP"
     

        } else if sender.tag == 2 {
            enemyPlayer1.attemptAttack(heroPlayer2.attackPower)
            printLabel.text = "\(heroPlayer2.name) attacked \(enemyPlayer1.name) for \(heroPlayer2.attackPower)HP"
            enemyHPLabel.text = "\(enemyPlayer1.hp)HP"
        
        }
        
        if !enemyPlayer1.isAlive {
            printLabel.text = "\(heroPlayer2.name) beat \(enemyPlayer1.name)"
            enemyImage.hidden = true

            hideLabels()
            hideAttackButtons()
            showRestartButton()
            
        
        } else if !heroPlayer2.isAlive {
            printLabel.text = "\(enemyPlayer1.name) beat \(heroPlayer2.name)"
            heroImage.hidden = true
            
            hideLabels()
            hideAttackButtons()
            showRestartButton()
        }
        
        
    }
    
    @IBAction func onRestartGameTapped() {
        startNewGame()
        
        hideRestartButton()
        
    }
    
    //MARK: Functions
    
    func hideLabels() {
        enemyHPLabel.text = ""
        heroHPLabel.text = ""
        heroAttackLabel.text = ""
        enemyAttackLabel.text = ""
        
    }
    
    func hideAttackButtons() {
        spartanAttackButton.hidden = true
        enemyAttackButton.hidden = true
    }
    
    func hideRestartButton() {
        restartButton.hidden = true
        restartLabel.hidden = true
    }
    
    func showAttackButtons() {
        spartanAttackButton.hidden = false
        enemyAttackButton.hidden = false
        heroAttackLabel.text = "Attack!"
        enemyAttackLabel.text = "Attack!"
    }
    
    func showRestartButton() {
        restartButton.hidden = false
        restartLabel.hidden = false
    }
    
    func showCharacterImages() {
        heroImage.hidden = false
        enemyImage.hidden = false
        
    }
    
    func startNewGame() {
        
        enemyPlayer1 = Character(startingHP: 200, attackPower: 50, name: "Ogre")
        heroPlayer2 = Character(startingHP: 500, attackPower: 40, name: "Ceaz")
        
        heroHPLabel.text = "\(heroPlayer2.hp)HP"
        enemyHPLabel.text = "\(enemyPlayer1.hp)HP"
        
        printLabel.text = "Fight!"
        
        showCharacterImages()
        showAttackButtons()
    
    }


}
