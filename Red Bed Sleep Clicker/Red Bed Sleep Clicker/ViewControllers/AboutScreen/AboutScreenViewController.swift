//
//  AboutScreenViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 13.03.2024.
//

import UIKit
import MapKit

private enum Constants {

}

final class AboutScreenViewController: UIViewController, MKMapViewDelegate {
    private let background: UIImageView = UIImageView(image: UIImage(named: "background"))
    private let developerNameLabel: CustomTitle = CustomTitle(titleText: "Made by", subtitleText: "Anastasia Manushkina")
    private let contactsLabel: CustomTitle = CustomTitle(titleText: "Contacts", subtitleText: "tg: @nvoter")
    private let addressLabel: CustomTitle = CustomTitle(titleText: "Office", subtitleText: "Russia, Moscow, Pokrovsky blvd, 11")
    private let mapView: MKMapView = MKMapView()
    
    override func viewDidLoad() {
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(background)
        background.pinCenter(to: view)
        configureDeveloperNameLabel()
        configureContactsLabel()
        configureAddressLabel()
    }
    
    private func configureDeveloperNameLabel() {
        view.addSubview(developerNameLabel)
        developerNameLabel.pinCenterX(to: view)
        developerNameLabel.setWidth(365)
        developerNameLabel.setHeight(70)
        developerNameLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor, 150)
    }
    
    private func configureContactsLabel() {
        view.addSubview(contactsLabel)
        contactsLabel.pinCenterX(to: view)
        contactsLabel.pinTop(to: developerNameLabel.bottomAnchor, 10)
        contactsLabel.setWidth(365)
        contactsLabel.setHeight(70)
    }
    
    private func configureAddressLabel() {
        view.addSubview(addressLabel)
        addressLabel.pinCenterX(to: view)
        addressLabel.pinTop(to: contactsLabel.bottomAnchor, 10)
        addressLabel.setWidth(365)
        addressLabel.setHeight(320)
        configureMapView()
    }
    
    private func configureMapView() {
        view.addSubview(mapView)
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: 55.754471, longitude: 37.649139)
        
        let region = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoordinate
        annotation.title = "HSE University"
        annotation.subtitle = "Pokrovsky blvd, 11"
        mapView.addAnnotation(annotation)
        
        mapView.pinBottom(to: addressLabel.bottomAnchor, 10)
        mapView.pinCenterX(to: view.centerXAnchor)
        mapView.setWidth(345)
        mapView.setHeight(240)
    }
}
