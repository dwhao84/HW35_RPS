//
//  RPSGameViewController.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import UIKit

class GameViewController: UIViewController {

    var playerName: String?

    let titleLabel      = UILabel()
    let statusBtn       = UILabel()
    let playerNameLabel = UILabel()

    let gameRoundLabel = UILabel()

    let rockBtn      = UIButton(type: .system)
    let scissorsBtn  = UIButton(type: .system)
    let paperBtn     = UIButton(type: .system)
    let pcBtn        = UIButton(type: .system)

    let playAgainBtn = UIButton(type: .custom)

    let progressView = UIProgressView()

    var gameRoundCount:  Int = 0

    let finalRoundCount: Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Going to RPSGameViewController")
        view.backgroundColor = UIColor.systemBackground

        configureButton()
        configureProgressView ()
        configureLabel()
        print(gameRoundCount)
    }

    func configureButton () {
        let buttonFontSize: CGFloat = 70.0
        let config = UIButton.Configuration.filled()

        // paperBtn UI
        paperBtn.frame = CGRect(x: 20, y: 610, width: 120, height: 120)
        paperBtn.configuration = config
        paperBtn.setTitle("🖐🏻", for: .normal)
        paperBtn.configuration?.cornerStyle = .medium
        paperBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        paperBtn.titleLabel?.contentMode = .scaleToFill
        paperBtn.titleLabel?.textAlignment = .center
        paperBtn.tintColor = UIColor.systemGray5
        paperBtn.titleLabel?.numberOfLines = 0
        paperBtn.isUserInteractionEnabled = true
        view.addSubview(paperBtn)

        print("paperBtn.titleLabel?.font = UIFont.systemFont(ofSize: \(buttonFontSize))")

       // rockBtn UI
        rockBtn.frame = CGRect(x: 154, y: 610, width: 120, height: 120)
        rockBtn.configuration = config
        rockBtn.setTitle("✊🏻", for: .normal)
        rockBtn.configuration?.cornerStyle = .medium
        rockBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        rockBtn.titleLabel?.textAlignment = .center
        rockBtn.tintColor = UIColor.systemGray5
        rockBtn.isUserInteractionEnabled = true
        view.addSubview(rockBtn)

        // scissorsBtn UI
        scissorsBtn.frame = CGRect(x: 288, y: 610, width: 120, height: 120)
        scissorsBtn.configuration = config
        scissorsBtn.setTitle("✌🏻", for: .normal)
        scissorsBtn.configuration?.cornerStyle = .medium
        scissorsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        scissorsBtn.titleLabel?.textAlignment = .center
        scissorsBtn.tintColor = UIColor.systemGray5
        scissorsBtn.isUserInteractionEnabled = true
        view.addSubview(scissorsBtn)

        // pcBtn
        pcBtn.frame = CGRect(x: 155, y: 221, width: 120, height: 120)
        pcBtn.configuration = config
        pcBtn.setTitle("🤖", for: .normal)
        pcBtn.configuration?.cornerStyle = .medium
        pcBtn.titleLabel?.font = UIFont.systemFont(ofSize: 70)
        pcBtn.titleLabel?.textAlignment = .center
        pcBtn.tintColor = UIColor.systemGray5
        pcBtn.isUserInteractionEnabled = true
        view.addSubview(pcBtn)

        // playAgainBtn
        playAgainBtn.configuration = .plain()
        playAgainBtn.setTitle("Play Again", for: .normal)
        playAgainBtn.frame = CGRect(x: 140, y: 486, width: 150, height: 50)
        view.addSubview(playAgainBtn)

        // Add target
        paperBtn.addTarget(self, action: #selector(didTapPaperBtn), for: .touchUpInside)
        rockBtn.addTarget(self, action: #selector(didTapRockBtn), for: .touchUpInside)
        scissorsBtn.addTarget(self, action: #selector(didTapScissorsBtn), for: .touchUpInside)

        pcBtn.addTarget(self, action: #selector(didTapPcBtn), for: .touchUpInside)

        playAgainBtn.addTarget(self, action: #selector(didTapPlayAgainBtn), for: .touchUpInside)
    }

    func configureProgressView () {
        progressView.frame = CGRect(x: 21, y: 764, width: 388, height: 4)
        progressView.progress = Float(CGFloat(gameRoundCount / finalRoundCount))
        view.addSubview(progressView)
        print(gameRoundCount)
    }

    func configureLabel () {
        // statusBtn
        statusBtn.frame = CGRect(x: 122, y: 438, width: 187, height: 30)
        statusBtn.text = ""
        statusBtn.textColor = .darkGray
        statusBtn.font = UIFont.systemFont(ofSize: 25)
        statusBtn.adjustsFontSizeToFitWidth = true
        statusBtn.textAlignment = .center
        statusBtn.numberOfLines = 1
        view.addSubview(statusBtn)

        // gameRoundLabel
        gameRoundLabel.frame = CGRect(x: 366, y: 798, width: 42, height: 21)
        gameRoundLabel.text = " \(gameRoundCount) / \(finalRoundCount)"
        gameRoundLabel.textColor = .darkGray
        gameRoundLabel.font = UIFont.systemFont(ofSize: 17)
        gameRoundLabel.adjustsFontSizeToFitWidth = true
        gameRoundLabel.textAlignment = .center
        gameRoundLabel.numberOfLines = 1
        view.addSubview(gameRoundLabel)

        playerNameLabel.text = "Unknown"
        playerNameLabel.frame = CGRect(x: 318, y: 566, width: 90, height: 22)
        playerNameLabel.textColor = .darkGray
        playerNameLabel.font = UIFont.systemFont(ofSize: 18)
        playerNameLabel.adjustsFontSizeToFitWidth = true
        playerNameLabel.textAlignment = .center
        playerNameLabel.numberOfLines = 1
        view.addSubview(playerNameLabel)
    }

    @objc func didTapPlayAgainBtn (_sender: UIButton) {
        scissorsBtn.isHidden = false
        paperBtn.isHidden    = false
        rockBtn.isHidden     = false
        gameRoundCount = 0
        print("didTapPlayAgainBtn, \(gameRoundCount)")
    }

    @objc func didTapRockBtn (_sender: UIButton) {
        scissorsBtn.isHidden = true
        paperBtn.isHidden    = true
        gameRoundCount += 1
        print("didTapRockBtn, \(gameRoundCount)")
    }

    @objc func didTapPaperBtn (_sender: UIButton) {
        rockBtn.isHidden     = true
        scissorsBtn.isHidden = true
        gameRoundCount += 1
        print("didTapPaperBtn, \(gameRoundCount)")
    }

    @objc func didTapScissorsBtn (_sender: UIButton) {
        rockBtn.isHidden  = true
        paperBtn.isHidden = true
        gameRoundCount += 1
        print("scissorsBtnTapped, \(gameRoundCount)")
    }

    @objc func didTapPcBtn (_sender: UIButton) {
        print("didTapPcBtn")
    }


    // MARK: - Configure UI
    func updateUI () {


    }








}
