//
//  RoomsInteractor.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 14.03.2024.
//

import UIKit

final class RoomsInteractor: RoomsBusinessLogic, RoomsDataSource {
    var characters: [PetModel] = []
    
    // MARK: - Fields
    private let presenter: RoomsPresentationLogic
    
    // MARK: - Lifecycle
    init(presenter: RoomsPresentationLogic) {
        self.presenter = presenter
    }
    
    // MARK: - RoomsBusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        characters = [PetModel](
            repeating: PetModel(
                name: "Steve",
                sleepingImage: UIImage(named: "sleeping Steve"),
                awakeImage: UIImage(named: "awake Steve")
            ),
            count: 4
        )
        presenter.presentStart(Model.Start.Response())
    }
    
    func loadPetTap(_ request: Model.PetTap.Request) {
        presenter.presentPetTap(Model.PetTap.Response())
    }
    
    func loadSettings(_ request: Model.Settings.Request) {
        presenter.presentSettings(Model.Settings.Response())
    }
}
