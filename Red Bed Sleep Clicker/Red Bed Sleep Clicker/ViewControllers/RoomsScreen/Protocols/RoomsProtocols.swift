//
//  RoomsProtocols.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 14.03.2024.
//

protocol RoomsBusinessLogic {
    typealias Model = RoomsModel
    func loadStart(_ request: Model.Start.Request)
    func loadPetTap(_ request: Model.PetTap.Request)
    func loadSettings(_ request: Model.Settings.Request)
}

protocol RoomsDataSource: AnyObject {
    typealias Model = RoomsModel
    var characters: [PetModel] { get }
}

protocol RoomsPresentationLogic {
    typealias Model = RoomsModel
    func presentStart(_ response: Model.Start.Response)
    func presentPetTap(_ response: Model.PetTap.Response)
    func presentSettings(_ response: Model.Settings.Response)
}

protocol RoomsDisplayLogic: AnyObject {
    typealias Model = RoomsModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func displayPetTap(_ viewModel: Model.PetTap.ViewModel)
    func displaySettings(_ viewModel: Model.Settings.ViewModel)
}

protocol RoomsRoutingLogic {
    func routeToSettings()
}
