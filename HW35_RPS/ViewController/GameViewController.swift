//
//  RPSGameViewController.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import UIKit

class GameViewController: UIViewController {

    var playerName: String?

    let statusLabel       = UILabel()
    let playerNameLabel = UILabel()

    let pcLabel = UILabel()
    let signLabel  = UILabel()

    var playerNameString : String?

    let gameRoundLabel = UILabel()

    let rockButton      = UIButton(type: .system)
    let scissorsButton  = UIButton(type: .system)
    let paperButton      = UIButton(type: .system)

    let playerAgainButton = UIButton(type: .custom)

    var progressView = UIProgressView()

    var progressViewValueCount = 0.0
    let progressViewMaxValue = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Going to RPSGameViewController")
        view.backgroundColor = UIColor.systemGray5

        updateUI(forState: .start)

        playerNameLabel.text = playerNameString

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
        progressViewValueCount += 1
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
        // paperButton UI
        paperButton.frame = CGRect(x: 20, y: 610, width: 120, height: 120)
        paperButton.setTitle("🖐🏻", for: .normal)
        paperButton.backgroundColor = UIColor.systemGray6
        paperButton.layer.cornerRadius = 30
        paperButton.clipsToBounds = true
        paperButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        paperButton.titleLabel?.contentMode = .scaleToFill
        paperButton.titleLabel?.textAlignment = .center
        paperButton.titleLabel?.numberOfLines = 1
        paperButton.isUserInteractionEnabled = true
        view.addSubview(paperButton)

        // rockButton UI
        rockButton.frame = CGRect(x: 154, y: 610, width: 120, height: 120)
        rockButton.setTitle("✊🏻", for: .normal)
        rockButton.backgroundColor = UIColor.systemGray6
        rockButton.layer.cornerRadius = 30
        rockButton.clipsToBounds = true
        rockButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        rockButton.titleLabel?.contentMode = .scaleToFill
        rockButton.titleLabel?.textAlignment = .center
        rockButton.titleLabel?.numberOfLines = 1
        rockButton.isUserInteractionEnabled = true
        view.addSubview(rockButton)

        // scissorsButton set up
        scissorsButton.frame = CGRect(x: 288, y: 610, width: 120, height: 120)
        scissorsButton.setTitle("✌🏻", for: .normal)
        scissorsButton.backgroundColor = UIColor.systemGray6
        scissorsButton.layer.cornerRadius = 30
        scissorsButton.clipsToBounds = true
        scissorsButton.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        scissorsButton.titleLabel?.contentMode = .scaleToFill
        scissorsButton.titleLabel?.textAlignment = .center
        scissorsButton.titleLabel?.numberOfLines = 1
        scissorsButton.isUserInteractionEnabled = true
        view.addSubview(scissorsButton)

        // signLabel set up
        signLabel.frame = CGRect(x: 155, y: 221, width: 120, height: 120)
        signLabel.font = UIFont.systemFont(ofSize: 40)
        signLabel.textColor = UIColor.darkGray
        signLabel.textAlignment = .center
        view.addSubview(signLabel)

        // playerAgainButton configure
        playerAgainButton.configuration = .plain()
        playerAgainButton.setTitle("Play Again", for: .normal)
        playerAgainButton.frame = CGRect(x: 140, y: 486, width: 150, height: 50)
        view.addSubview(playerAgainButton)

        // statusLabel
        statusLabel.frame = CGRect(x: 122, y: 438, width: 187, height: 30)
        statusLabel.text = "Win or Lose!!!"
        statusLabel.textColor = .darkGray
        statusLabel.font = UIFont.systemFont(ofSize: 40)
        statusLabel.adjustsFontSizeToFitWidth = true
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 1
        view.addSubview(statusLabel)

        // Add target
        paperButton.addTarget(self, action: #selector(didTappaperButton), for: .touchUpInside)
        rockButton.addTarget(self, action: #selector(didTaprockButton), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(didTapscissorsButton), for: .touchUpInside)
//        signLabel.addTarget(self, action: #selector(didTapsignLabel), for: .touchUpInside)
        playerAgainButton.addTarget(self, action: #selector(didTapplayerAgainButton), for: .touchUpInside)
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
    }

    func updateUI(forState state: GameState) {
        statusLabel.text = state.status
        switch state {
            case .start:
                view.backgroundColor = UIColor.systemGray5

                paperButton.setTitle("🖐🏻", for: .normal)
                playerAgainButton.isHidden = true

                scissorsButton.isHidden  = false
                paperButton.isHidden     = false
                rockButton.isHidden      = false

                rockButton.isEnabled     = true
                paperButton.isEnabled    = true
                scissorsButton.isEnabled = true

            case .win:
                view.backgroundColor = UIColor.systemBlue
            case .loose:
                view.backgroundColor = UIColor.systemMint
            case .draw:
                view.backgroundColor = UIColor.systemPink
        }
    }

    func play(userSign: Sign) {
        let computerSign = randomSign()

        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)

        signLabel.text = "🤖"

        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true

        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false

        switch userSign {
            case .rock:
                rockButton.isHidden = false
            case .paper:
                paperButton.isHidden = false
            case .scissors:
                scissorsButton.isHidden = false
        }
        playerAgainButton.isHidden = false
    }

    // MARK: - @objc function added
    @objc func didTapplayerAgainButton (_ sender: UIButton) {
        scissorsButton.isHidden = false
        paperButton.isHidden    = false
        rockButton.isHidden     = false

        updateGameScoreStatus()

        print("didTapplayerAgainButton")
        print(progressViewValueCount)
    }

    @objc func didTaprockButton (_ sender: UIButton) {
        scissorsButton.isHidden = true
        paperButton.isHidden    = true

        updateGameScoreStatus ()

        print("didTaprockButton")
        print(progressViewValueCount)
    }

    @objc func didTappaperButton (_ sender: UIButton) {
        rockButton.isHidden     = true
        scissorsButton.isHidden = true

        updateGameScoreStatus ()

        print("didTappaperButton")
        print(progressViewValueCount)
    }

    @objc func didTapscissorsButton (_ sender: UIButton) {
        play(userSign: .scissors)
        updateGameScoreStatus ()

        print("scissorsButtonTapped")
        print(progressViewValueCount)
    }

//    @objc func didTapsignLabel (_ sender: UIButton) {
//        print("didTapcomputerButton")
//    }



}
