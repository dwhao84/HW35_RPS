//
//  RPSGameViewController.swift
//  HW35_RPSGame
//
//  Created by Dawei Hao on 2023/10/7.
//

import UIKit

class GameViewController: UIViewController {

    var playerName: String?

    let statusBtn       = UILabel()
    let playerNameLabel = UILabel()
    let pcLabel = UILabel()

    let gameRoundLabel = UILabel()

    let rockBtn      = UIButton(type: .system)
    let scissorsBtn  = UIButton(type: .system)
    let paperBtn     = UIButton(type: .system)
    let pcBtn        = UIButton(type: .system)

    let playAgainBtn = UIButton(type: .custom)

    var progressView = UIProgressView()

    var progressViewValueCount = 0.0
    let progressViewMaxValue = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Going to RPSGameViewController")
        view.backgroundColor = UIColor.systemBackground

        configureButton()
        configureProgressView ()
        configureLabel()


        print(progressViewValueCount)
    }

    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

// MARK: - Configure Button
    let buttonFontSize: CGFloat = 70.0

    func controlGameScore () {

        progressView.setProgress(Float(Int(progressViewValueCount)) / 10, animated: true)
        gameRoundLabel.text = "\(Int(progressViewValueCount)) / 10"

        if progressViewMaxValue < progressViewValueCount {
            print("Stop the Game")
        } else if progressViewMaxValue > progressViewValueCount {
            print("Game Continue")
        } else {
            print("Game stauts unknown")
        }
    }

    func configureButton () {
        let buttonFontSize: CGFloat = 70.0

        // paperBtn UI
        paperBtn.frame = CGRect(x: 20, y: 610, width: 120, height: 120)
//        paperBtn.configuration = .plain()
        paperBtn.setTitle("🖐🏻", for: .normal)
        paperBtn.backgroundColor = UIColor.systemGray6
        paperBtn.layer.cornerRadius = 30
        paperBtn.clipsToBounds = true
        paperBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        paperBtn.titleLabel?.contentMode = .scaleToFill
        paperBtn.titleLabel?.textAlignment = .center
        paperBtn.titleLabel?.numberOfLines = 1
        paperBtn.isUserInteractionEnabled = true
        view.addSubview(paperBtn)


       // rockBtn UI
        rockBtn.frame = CGRect(x: 154, y: 610, width: 120, height: 120)
        rockBtn.setTitle("✊🏻", for: .normal)
        rockBtn.backgroundColor = UIColor.systemGray6
        rockBtn.layer.cornerRadius = 30
        rockBtn.clipsToBounds = true
        rockBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        rockBtn.titleLabel?.contentMode = .scaleToFill
        rockBtn.titleLabel?.textAlignment = .center
        rockBtn.titleLabel?.numberOfLines = 1
        rockBtn.isUserInteractionEnabled = true
        view.addSubview(rockBtn)

        // scissorsBtn set up
        scissorsBtn.frame = CGRect(x: 288, y: 610, width: 120, height: 120)
        scissorsBtn.setTitle("✌🏻", for: .normal)
        scissorsBtn.backgroundColor = UIColor.systemGray6
        scissorsBtn.layer.cornerRadius = 30
        scissorsBtn.clipsToBounds = true
        scissorsBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        scissorsBtn.titleLabel?.contentMode = .scaleToFill
        scissorsBtn.titleLabel?.textAlignment = .center
        scissorsBtn.titleLabel?.numberOfLines = 1
        scissorsBtn.isUserInteractionEnabled = true
        view.addSubview(scissorsBtn)

        // pcBtn set up
        pcBtn.frame = CGRect(x: 155, y: 221, width: 120, height: 120)
        pcBtn.setTitle("🤖", for: .normal)
        pcBtn.backgroundColor = UIColor.systemGray6
        pcBtn.layer.cornerRadius = 30
        pcBtn.clipsToBounds = true
        pcBtn.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
        pcBtn.titleLabel?.contentMode = .scaleToFill
        pcBtn.titleLabel?.textAlignment = .center
        pcBtn.titleLabel?.numberOfLines = 1
        pcBtn.isUserInteractionEnabled = true
        view.addSubview(pcBtn)

        // playAgainBtn configure
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

    // MARK: - Configure progressView
    func configureProgressView () {
        // progressView set up
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.frame = CGRect(x: 21, y: 764, width: 388, height: 4)
        progressView.progress = 0.1
        view.addSubview(progressView)
        print(progressViewValueCount)
    }

    // MARK: - Configure Label
    func configureLabel () {

        // statusBtn
        statusBtn.frame = CGRect(x: 122, y: 438, width: 187, height: 30)
        statusBtn.text = "Win or Lose!!!"
        statusBtn.textColor = .darkGray
        statusBtn.font = UIFont.systemFont(ofSize: 40)
        statusBtn.adjustsFontSizeToFitWidth = true
        statusBtn.textAlignment = .center
        statusBtn.numberOfLines = 1
        view.addSubview(statusBtn)

        // gameRoundLabel
        gameRoundLabel.frame = CGRect(x: 366, y: 798, width: 42, height: 20)
        gameRoundLabel.textColor = .darkGray
        gameRoundLabel.font = UIFont.systemFont(ofSize: 20)
        gameRoundLabel.adjustsFontSizeToFitWidth = true
        gameRoundLabel.textAlignment = .center
        gameRoundLabel.numberOfLines = 1
        view.addSubview(gameRoundLabel)

        // playerNameLabel
        playerNameLabel.text = "Unknown"
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

    // MARK: - @objc function added
    @objc func didTapPlayAgainBtn (_ sender: UIButton) {
        scissorsBtn.isHidden = false
        paperBtn.isHidden    = false
        rockBtn.isHidden     = false

        progressViewValueCount = 0


        controlGameScore()

        print("didTapPlayAgainBtn")
        print(progressViewValueCount)
    }

    @objc func didTapRockBtn (_ sender: UIButton) {
        scissorsBtn.isHidden = true
        paperBtn.isHidden    = true

        if progressViewValueCount >= progressViewMaxValue {
            progressViewValueCount += 0
        } else {
            progressViewValueCount += 1
        }

        controlGameScore ()

        print("didTapRockBtn")
        print(progressViewValueCount)
    }

    @objc func didTapPaperBtn (_ sender: UIButton) {
        rockBtn.isHidden     = true
        scissorsBtn.isHidden = true

        //        rockBtn.isEnabled = false
        //        scissorsBtn.isEnabled = false

        if progressViewValueCount >= progressViewMaxValue {
            progressViewValueCount += 0
        } else {
            progressViewValueCount += 1
        }

        controlGameScore ()

        print("didTapPaperBtn")
        print(progressViewValueCount)
    }

    @objc func didTapScissorsBtn (_ sender: UIButton) {
        rockBtn.isHidden  = true
        paperBtn.isHidden = true

//        rockBtn.isEnabled = false
//        paperBtn.isEnabled = false

        if progressViewValueCount >= progressViewMaxValue {
            progressViewValueCount += 0
        } else {
            progressViewValueCount += 1
        }

        controlGameScore ()

        print("scissorsBtnTapped")
        print(progressViewValueCount)
    }

    @objc func didTapPcBtn (_ sender: UIButton) {
        print("didTapPcBtn")
    }


    // MARK: - Configure UI
    func updateUI () {


    }








}
