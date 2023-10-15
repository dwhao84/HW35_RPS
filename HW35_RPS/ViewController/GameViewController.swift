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

    let gameRoundLabel = UILabel()

    let playerScoreLabel = UILabel()
    let pcScoreLabel = UILabel()

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
        gameRoundLabel.text = "\(Int(progressViewValueCount)) / 10"
        if progressViewValueCount >= progressViewMaxValue {
        progressViewValueCount += 0
        print("Stop the Game")
    } else {
           showAlertController()
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

        // statusLabel
        statusLabel.frame = CGRect(x: 122, y: 438, width: 187, height: 30)
        statusLabel.textColor = .darkGray
        statusLabel.font = UIFont.systemFont(ofSize: 40)
        statusLabel.adjustsFontSizeToFitWidth = true
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 1
        view.addSubview(statusLabel)

        // Add target
        paperButton.addTarget(self, action: #selector(didTapPaperButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTapRockButton), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(didTapScissorsButton), for: .touchUpInside)
//        signLabel.addTarget(self, action: #selector(didTapsignLabel), for: .touchUpInside)
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
        // gameRoundLabel
        gameRoundLabel.frame = CGRect(x: 366, y: 798, width: 42, height: 20)
        gameRoundLabel.textColor = .darkGray
        gameRoundLabel.font = UIFont.systemFont(ofSize: 20)
        gameRoundLabel.adjustsFontSizeToFitWidth = true
        gameRoundLabel.textAlignment = .center
        gameRoundLabel.numberOfLines = 1
        view.addSubview(gameRoundLabel)

        // playerNameLabel
//        playerNameLabel.text = "Unknown"
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

        pcScoreLabel.text = "0"
        pcScoreLabel.frame = CGRect(x: 298, y: 135, width: 90, height: 20)
        pcScoreLabel.font = UIFont.systemFont(ofSize: 25)
        pcScoreLabel.textAlignment = .center
        pcScoreLabel.numberOfLines = 1
        pcScoreLabel.textColor = .darkGray
        view.addSubview(pcScoreLabel)

        playerScoreLabel.text = "0"
        playerScoreLabel.frame = CGRect(x: 42, y: 135, width: 90, height: 20)
        playerScoreLabel.font = UIFont.systemFont(ofSize: 25)
        playerScoreLabel.textAlignment = .center
        playerScoreLabel.numberOfLines = 1
        playerScoreLabel.textColor = .darkGray
        view.addSubview(playerScoreLabel)

        playerNameTitle.frame = CGRect(x: 45, y: 81, width: 90, height: 20)
        playerNameTitle.font = UIFont.systemFont(ofSize: 18)
        playerNameTitle.textAlignment = .center
        playerNameTitle.numberOfLines = 1
        playerNameTitle.textColor = .darkGray
        view.addSubview(playerNameTitle)

        pcNameTitle.text = "PC"
        pcNameTitle.frame = CGRect(x: 298, y: 81, width: 90, height: 20)
        pcNameTitle.font = UIFont.systemFont(ofSize: 18)
        pcNameTitle.textAlignment = .center
        pcNameTitle.numberOfLines = 1
        pcNameTitle.textColor = .darkGray
        view.addSubview(pcNameTitle)
    }

    func showAlertController() {
        let alertController = UIAlertController(title: "", message: "Ok", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }

    // Control UI Statement by enum.
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        view.backgroundColor = UIColor.systemGray5
        switch state {
            case .start:
                view.backgroundColor = UIColor.systemGray5

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
            case .loose:
                view.backgroundColor = UIColor.systemPink
                print("Status is LOOSE")
            case .draw:
                view.backgroundColor = UIColor.systemMint
                print("Status is DRAW")
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
//        print(progressViewValueCount)
    }

    @objc func didTapRockButton (_ sender: UIButton) {
        play(userSign: .rock)
        updateGameScoreStatus ()
        progressViewValueCount += 1
        print("didTapRockButton")
        print("The progress is now \(progressViewValueCount)")
    }

    @objc func didTapPaperButton (_ sender: UIButton) {
        play(userSign: .paper)
        updateGameScoreStatus ()
        progressViewValueCount += 1
        print("didTapPaperButton")
        print("The progress is now \(progressViewValueCount)")
    }

    @objc func didTapScissorsButton (_ sender: UIButton) {
        play(userSign: .scissors)
        updateGameScoreStatus ()
        progressViewValueCount += 1
        print("didScissorsButtonTapped")
        print("The progress is now \(progressViewValueCount)")
    }

}
