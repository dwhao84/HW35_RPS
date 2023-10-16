//
//  RPSGameViewController.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import UIKit

class GameViewController: UIViewController {

    var playerName: String?

    // Define win or loose or draw.
    let statusLabel       = UILabel()

    // Define the player's name.
    var playerNameLabel = UILabel()

    // Define who is the PC.
    let pcLabel = UILabel()

    // Define the
    let signLabel  = UILabel()

    var playerNameString : String?

    let gameRoundLabel = UILabel ()
    let gameRoundNumberLabel = UILabel()

    let playerScoreLabel = UILabel()
    let pcScoreLabel = UILabel()

    var playerScoreValue = 0
    var pcScoreValue = 0

    let playerNameTitle = UILabel()
    let pcNameTitle = UILabel()

    // Create the rock icon for game.
    let rockButton      = UIButton(type: .system)

    // Create the scissors icon for game.
    let scissorsButton  = UIButton(type: .system)

    // Create the paper icon for game.
    let paperButton      = UIButton(type: .system)

    // Create the plaAgainButton and set it as plain().
    let playerAgainButton = UIButton(type: .custom)

    var progressView = UIProgressView()
    var progressViewValueCount = 0.0
    let progressViewMaxValue = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Going to RPSGameViewController")
        view.backgroundColor = UIColor.systemGray5

        // Set up the UI statement as start.
        updateUI(forState: .start)

        playerNameLabel.text = playerName
        playerNameTitle.text = playerName

        configureUI ()
    }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    // MARK: - Update GameScoreStatus
    func updateGameScoreStatus () {
        progressView.setProgress( Float(Int(progressViewValueCount)) / 10, animated: true)
        gameRoundNumberLabel.text = "\(Int(progressViewValueCount)) / 10"

        if progressViewValueCount == progressViewMaxValue {
            if playerScoreValue > pcScoreValue {
                showWinAlertController()
                print("YOU WIN")
            } else if playerScoreValue < pcScoreValue {
                showLooseAlertController()
                print("YOU LOOSE")
            } else if playerScoreValue == pcScoreValue {
                showDrawAlertController()
                print("WE DRAW")
            }
            print("Stop the Game")

        } else if progressViewValueCount < progressViewMaxValue {
            print("Continue the Game")
        } else {
            print("")
      }
    }

    // MARK: - Combine configure Button / Label / ProgressView
    func configureUI () {
        configureLabel()
        configureButton()
        configureProgressView()
    }

    // MARK: - Configure Button
    func configureButton () {
        let buttonFontSize: CGFloat = 70.0
        let playAgainButtonFontSize = 30.0
        let cornerRadiusValue = 30.0

        // Configure paperButton
        paperButton.frame = CGRect(x: 20, y: 610, width: 120, height: 120)
        paperButton.setTitle("🖐🏻", for: .normal)
        paperButton.backgroundColor = UIColor.systemGray6
        paperButton.layer.cornerRadius = cornerRadiusValue
        paperButton.clipsToBounds = true
        paperButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        paperButton.titleLabel?.contentMode = .scaleToFill
        paperButton.titleLabel?.textAlignment = .center
        paperButton.titleLabel?.numberOfLines = 1
        paperButton.isUserInteractionEnabled = true
        view.addSubview(paperButton)

        // Configure rockButton
        rockButton.frame = CGRect(x: 154, y: 610, width: 120, height: 120)
        rockButton.setTitle("✊🏻", for: .normal)
        rockButton.backgroundColor = UIColor.systemGray6
        rockButton.layer.cornerRadius = cornerRadiusValue
        rockButton.clipsToBounds = true
        rockButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        rockButton.titleLabel?.contentMode = .scaleToFill
        rockButton.titleLabel?.textAlignment = .center
        rockButton.titleLabel?.numberOfLines = 1
        rockButton.isUserInteractionEnabled = true
        view.addSubview(rockButton)

        // Configure scissorsButton
        scissorsButton.frame = CGRect(x: 288, y: 610, width: 120, height: 120)
        scissorsButton.setTitle("✌🏻", for: .normal)
        scissorsButton.backgroundColor = UIColor.systemGray6
        scissorsButton.layer.cornerRadius = cornerRadiusValue
        scissorsButton.clipsToBounds = true
        scissorsButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        scissorsButton.titleLabel?.contentMode = .scaleToFill
        scissorsButton.titleLabel?.textAlignment = .center
        scissorsButton.titleLabel?.numberOfLines = 1
        scissorsButton.isUserInteractionEnabled = true
        view.addSubview(scissorsButton)

        // Configure signLabel
        signLabel.text = "🤖"
        signLabel.frame = CGRect(x: 155, y: 221, width: 120, height: 120)
        signLabel.font = UIFont.systemFont(ofSize: buttonFontSize)
        signLabel.backgroundColor = UIColor.systemGray6
        signLabel.contentMode = .scaleToFill
        signLabel.textAlignment = .center
        signLabel.layer.cornerRadius = cornerRadiusValue
        signLabel.clipsToBounds = true
        view.addSubview(signLabel)

        // Configure playerAgainButton
        playerAgainButton.configuration = .plain()
        playerAgainButton.tintColor = .systemBlue
        playerAgainButton.setTitle("Play Again", for: .normal)
        playerAgainButton.contentMode = .scaleToFill
        playerAgainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: playAgainButtonFontSize)
        playerAgainButton.configuration?.buttonSize = .large
        playerAgainButton.frame = CGRect(x: 140, y: 486, width: 150, height: 50)
        view.addSubview(playerAgainButton)

        // Add target
        paperButton.addTarget(self, action: #selector(didTapPaperButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapRockButton), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(didTapScissorsButton), for: .touchUpInside)

        playerAgainButton.addTarget(self, action: #selector(didTapPlayerAgainButton), for: .touchUpInside)
    }

    // MARK: - Configure progressView
    func configureProgressView () {
        // progressView set up
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.frame = CGRect(x: 21, y: 764, width: 388, height: 4)
        progressView.progress = 0.0
        view.addSubview(progressView)
        print(progressViewValueCount)
    }

    // MARK: - Configure Label
    func configureLabel () {

        // statusLabel
        statusLabel.frame = CGRect(x: 122, y: 438, width: 187, height: 30)
        statusLabel.textColor = .darkGray
        statusLabel.font = UIFont.systemFont(ofSize: 40)
        statusLabel.adjustsFontSizeToFitWidth = true
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 1
        view.addSubview(statusLabel)

        // gameRoundLabel
        gameRoundLabel.text = "Game Round"
        gameRoundLabel.frame = CGRect(x: 20, y: 798, width: 99, height: 21)
        gameRoundLabel.textColor = .darkGray
        gameRoundLabel.font = UIFont.systemFont(ofSize: 20)
        gameRoundLabel.adjustsFontSizeToFitWidth = true
        gameRoundLabel.textAlignment = .center
        gameRoundLabel.numberOfLines = 1
        view.addSubview(gameRoundLabel)

        // gameRoundNumberLabel
        gameRoundNumberLabel.text = "\(Int(progressViewValueCount)) / 10"
        gameRoundNumberLabel.frame = CGRect(x: 366, y: 798, width: 42, height: 20)
        gameRoundNumberLabel.textColor = .darkGray
        gameRoundNumberLabel.font = UIFont.systemFont(ofSize: 20)
        gameRoundNumberLabel.adjustsFontSizeToFitWidth = true
        gameRoundNumberLabel.textAlignment = .center
        gameRoundNumberLabel.numberOfLines = 1
        view.addSubview(gameRoundNumberLabel)

        // playerNameLabel
        playerNameLabel.frame = CGRect(x: 325, y: 566, width: 90, height: 20)
        playerNameLabel.textColor = .darkGray
        playerNameLabel.font = UIFont.systemFont(ofSize: 20)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.textAlignment = .center
        playerNameLabel.numberOfLines = 1
        view.addSubview(playerNameLabel)

        // pcLabel
        pcLabel.text = "PC"
        pcLabel.frame = CGRect(x: 170, y: 349, width: 90, height: 20)
        pcLabel.textColor = .darkGray
        pcLabel.font = UIFont.systemFont(ofSize: 20)
        pcLabel.adjustsFontSizeToFitWidth = true
        pcLabel.textAlignment = .center
        pcLabel.numberOfLines = 1
        view.addSubview(pcLabel)

        // pcScoreLabel
        pcScoreLabel.text = "0"
        pcScoreLabel.frame = CGRect(x: 298, y: 135, width: 90, height: 20)
        pcScoreLabel.font = UIFont.boldSystemFont(ofSize: 25)
        pcScoreLabel.textAlignment = .center
        pcScoreLabel.numberOfLines = 1
        pcScoreLabel.textColor = .darkGray
        view.addSubview(pcScoreLabel)

        // playerScoreLabel
        playerScoreLabel.text = "0"
        playerScoreLabel.frame = CGRect(x: 42, y: 135, width: 90, height: 20)
        playerScoreLabel.font = UIFont.boldSystemFont(ofSize: 25)
        playerScoreLabel.textAlignment = .center
        playerScoreLabel.numberOfLines = 1
        playerScoreLabel.textColor = .darkGray
        view.addSubview(playerScoreLabel)

        // playerNameTitle
        playerNameTitle.frame = CGRect(x: 45, y: 81, width: 90, height: 20)
        playerNameTitle.font = UIFont.systemFont(ofSize: 18)
        playerNameTitle.textAlignment = .center
        playerNameTitle.numberOfLines = 1
        playerNameTitle.textColor = .darkGray
        view.addSubview(playerNameTitle)

        // pcNameTitle
        pcNameTitle.text = "PC"
        pcNameTitle.frame = CGRect(x: 298, y: 81, width: 90, height: 20)
        pcNameTitle.font = UIFont.systemFont(ofSize: 18)
        pcNameTitle.textAlignment = .center
        pcNameTitle.numberOfLines = 1
        pcNameTitle.textColor = .darkGray
        view.addSubview(pcNameTitle)
    }

    // MARK: - Configure AlertController
    // Show the alertController when the progressViewCount equals or over ten.
    func showWinAlertController() {
        let winController = UIAlertController(title: "You Win!🎉", message: "Congratulations", preferredStyle: .alert)
        winController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(winController, animated: true)
    }

    func showLooseAlertController () {
        let looseController = UIAlertController(title: "Keep going!🙌🏻", message: "Don't Give Up", preferredStyle: .alert)
        looseController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(looseController, animated: true)
    }

    func showDrawAlertController () {
        let drawController = UIAlertController(title: "Draw!🤝🏻", message: "Keep Challange!", preferredStyle: .alert)
        drawController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(drawController, animated: true)
    }

    // MARK: - Configure UI statement
    // Control UI Statement by enum.
    func updateUI(forState state: GameState) {

        statusLabel.text = state.status
        view.backgroundColor = UIColor.systemGray5

        switch state {
            case .start:
                view.backgroundColor = UIColor.systemGray5

                // When signLabel change to start mode, let the signLabel.text change to Robots icon.
                // Same as the rest of icon.
                signLabel.text = "🤖"
                paperButton.setTitle("🖐🏻", for: .normal)
                rockButton.setTitle("✊🏻", for: .normal)
                scissorsButton.setTitle("✌🏻", for: .normal)

                playerAgainButton.isHidden = true

                scissorsButton.isHidden  = false
                paperButton.isHidden     = false
                rockButton.isHidden      = false

                rockButton.isEnabled     = true
                paperButton.isEnabled    = true
                scissorsButton.isEnabled = true

            case .win:
                view.backgroundColor = UIColor(red: 197/255, green: 214/255, blue: 226/255, alpha: 1)
                print("Status is WIN")
                playerScoreValue += 1
                progressViewValueCount += 1
                playerScoreLabel.text = String(playerScoreValue)
            case .loose:
                view.backgroundColor = UIColor.systemPink
                print("Status is LOOSE")
                pcScoreValue += 1
                progressViewValueCount += 1
                pcScoreLabel.text = String(pcScoreValue)
            case .draw:
                view.backgroundColor = UIColor.systemMint
                print("Status is DRAW")
                progressViewValueCount += 1
        }
    }


    func play(userSign: Sign) {

       // Let computerSign stored as randomSign.
       let computerSign = randomSign()

        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)

        signLabel.text = computerSign.emoji

        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true

        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false

        switch userSign {
            case .rock:
                rockButton.isHidden = false
                print("UserSign is rock")

            case .paper:
                paperButton.isHidden = false
                print("UserSign is paper")

            case .scissors:
                scissorsButton.isHidden = false
                print("UserSign is scissors")
        }
        playerAgainButton.isHidden = false
    }

    // MARK: - @objc function added
    @objc func didTapPlayerAgainButton (_ sender: UIButton) {
        updateUI(forState: .start)
        scissorsButton.isHidden = false
        paperButton.isHidden    = false
        rockButton.isHidden     = false

        updateGameScoreStatus()
        print("didTapPlayerAgainButton")
    }

    @objc func didTapRockButton (_ sender: UIButton) {
        play(userSign: .rock)
        updateGameScoreStatus ()
        print("didTapRockButton")
    }

    @objc func didTapPaperButton (_ sender: UIButton) {
        play(userSign: .paper)
        updateGameScoreStatus ()
        print("didTapPaperButton")
    }

    @objc func didTapScissorsButton (_ sender: UIButton) {
        play(userSign: .scissors)
        updateGameScoreStatus ()
        print("didScissorsButtonTapped")
    }

}
