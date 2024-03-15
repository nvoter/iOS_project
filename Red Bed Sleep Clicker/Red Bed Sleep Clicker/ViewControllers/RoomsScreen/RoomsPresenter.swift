//
//  RoomsPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 14.03.2024.
//

final class RoomsPresenter: RoomsPresentationLogic {
    
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: RoomsDisplayLogic?
    
    // MARK: - RoomsPresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel())
    }
    
    func presentPetTap(_ response: Model.PetTap.Response) {
        view?.displayPetTap(Model.PetTap.ViewModel())
    }
    
    func presentSettings(_ response: Model.Settings.Response) {
        view?.displaySettings(RoomsModel.Settings.ViewModel())
    }
}
