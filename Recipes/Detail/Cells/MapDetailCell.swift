//
//  MapDetailCell.swift
//  Recipes
//
//  Created by Cristian Palomino on 11/11/23.
//

import Foundation
import RecipesUI
import UIKit
import RecipesCore
import MapKit

final class MapDetailCell: UICollectionViewCell {
    static let identifier = "MapDetailCell"
    
    var location: Location? {
        didSet {
            guard let location else { return }
            let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = "Ubicación"
            mapView.addAnnotation(annotation)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }

    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.delegate = self
        return mapView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        mapView.pin(to: contentView, constant: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBorders()
    }
    
    private func addBorders() {
        mapView.layer.cornerRadius = 8
    }
}

extension MapDetailCell: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        annotationView.pinTintColor = UIColor.blue
        annotationView.canShowCallout = true
        return annotationView
    }
}
