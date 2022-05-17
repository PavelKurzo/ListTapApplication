//
//  ViewController.swift
//  collectionView
//
//  Created by Павел Курзо on 14.05.22.
//

import UIKit

class RootViewController: UIViewController {
    
    private var timer = Timer()
    
    private var dataSource: [CellModel] = []
    
    private var rootView: RootView {
        return self.view as! RootView
    }
    
    private var isButtonStart = true
    
    override func loadView() {
        super.loadView()
        self.view = RootView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        rootView.stopStartButton.addTarget(self, action: #selector(stopStartButtonTapped), for: .primaryActionTriggered)
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
    }
    
    private func startButtonPressed() {
        rootView.stopStartButton.backgroundColor = UIColor(red: 0.99, green: 0.33, blue: 0.36, alpha: 0.9)
            rootView.stopStartButton.setTitle("STOP", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    private func stopButtonPressed() {
        rootView.stopStartButton.backgroundColor = UIColor(red: 0.15, green: 0.79, blue: 0.57, alpha: 0.9)
            rootView.stopStartButton.setTitle("START", for: .normal)
        timer.invalidate()
    }
    
    @objc func stopStartButtonTapped() {
        if isButtonStart {
            startButtonPressed()
        } else {
            stopButtonPressed()
        }
        isButtonStart.toggle()
    }
    
    @objc func timerAction() {
        handleAction(dataSource.count < 5 ? .addElement : ActionGenerator.getRandomAction())
        
        rootView.collectionView.reloadData()
    }
    
    private func appendRandomElement() {
        let element = CellModel(initialValue: Int.random(in: 1...4), color: .random)
        dataSource.append(element)
    }
    
    private func handleAction(_ action: Action) {
        let index = action == .addElement ? 0 : Int.random(in: 0..<dataSource.count)
        switch action {
        case .increment:
            dataSource[index].increment()
        case .reset:
            dataSource[index].reset()
        case .delete:
            dataSource.remove(at: index)
        case .addModule:
            dataSource[index].add(dataSource.count)
        case .addElement:
            let element = CellModel(initialValue: Int.random(in: 1...4), color: .random)
            dataSource.append(element)
        }
        setTextInLabel(action, index)
    }
    
    private func setTextInLabel(_ action: Action, _ index: Int) {
        var text = action.rawValue
        if action != .addElement {
            text += " at index:\(index)"
        }
        rootView.actionLabel.text = text
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.identifier, for: indexPath) as! ColorCell
        cell.set(data: dataSource[indexPath.row], isFirst: indexPath.row == 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: rootView.collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}

extension RootViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dataSource[indexPath.row].didTap()
        rootView.collectionView.reloadData()
    }
}



