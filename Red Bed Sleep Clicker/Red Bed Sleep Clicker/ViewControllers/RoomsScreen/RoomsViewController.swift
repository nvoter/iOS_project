//
//  RoomsViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 12.03.2024.
//

import UIKit

final class RoomsViewController: UIViewController,
                                 RoomsDisplayLogic {
    // MARK: - Constants
    private enum Constants {
        static let fatalError: String = "init(coder:) has not been implemented"
        
        static let width: CGFloat = 360
        static let height: CGFloat = 70
        
        static let backgroundImageName: String = "background"
        
        static let titleViewText: String = "CHARACTERS"
        
        static let settingsButtonText: String = "SETTINGS"
        
        static let collectionPinConstant: CGFloat = 100
        static let collectionHeight: CGFloat = 560
    }
    
    // MARK: - Fields
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.width - 50) / 2, height: (view.frame.height + 40) / 4)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    private let titleView: CustomTitle = CustomTitle(titleText: Constants.titleViewText)
    private let settingsButton: CustomButton = CustomButton(title: Constants.settingsButtonText)
    private let background: UIImageView = UIImageView(image: UIImage(named: Constants.backgroundImageName))
    
    private let router: RoomsRoutingLogic
    private let interactor: (RoomsBusinessLogic & RoomsDataSource)
    
    // MARK: - LifeCycle
    init(
        router: RoomsRoutingLogic,
        interactor: (RoomsBusinessLogic & RoomsDataSource)
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Configuration
    private func configureUI() {
        configureBackground()
        configureTitle()
        configureCollection()
        configureSettingsButton()
    }
    
    private func configureBackground() {
        view.addSubview(background)
        
        background.pinCenter(to: view)
    }
    
    private func configureTitle() {
        view.addSubview(titleView)
        
        titleView.setWidth(Constants.width)
        titleView.setHeight(Constants.height)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
    }
    
    private func configureCollection() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(RoomCell.self, forCellWithReuseIdentifier: RoomCell.roomCellId)
        collection.layer.masksToBounds = true
        
        view.addSubview(collection)
        
        collection.pinCenterX(to: view)
        collection.pinTop(to: titleView.bottomAnchor, Constants.collectionPinConstant)
        collection.setWidth(Constants.width)
        collection.setHeight(Constants.collectionHeight)
    }
    
    private func configureSettingsButton() {
        view.addSubview(settingsButton)
        
        settingsButton.setWidth(Constants.width)
        settingsButton.setHeight(Constants.height)
        settingsButton.pinCenterX(to: view)
        settingsButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        settingsButton.setFontSize(fontSize: 40)
        settingsButton.addTarget(self, action: #selector(settingsWasTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func settingsWasTapped() {
        router.routeToSettings()
    }
    
    // MARK: - RoomsDisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        collection.reloadData()
    }
    
    func displayPetTap(_ viewModel: Model.PetTap.ViewModel) {
        
    }
    
    func displaySettings(_ viewModel: Model.Settings.ViewModel) {
        
    }
}

extension RoomsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        interactor.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCell.roomCellId, for: indexPath)
        guard let roomCell = cell as? RoomCell else {
            return cell
        }
        roomCell.configure(
            with: interactor.characters[indexPath.row]
        )
        roomCell.backgroundColor = .white
        return roomCell
    }
}

extension RoomsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let roomCell = collectionView.cellForItem(at: indexPath) as? RoomCell else {
            return
        }
        roomCell.changeCharacterStatement()
        collectionView.reloadItems(at: [indexPath])
    }
}
