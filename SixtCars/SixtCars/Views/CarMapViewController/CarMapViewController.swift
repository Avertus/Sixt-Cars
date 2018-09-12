//
//  CarMapViewController.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CarMapViewController: ViewController {

    struct SegueIdentifiers {
        static let carListViewController = "CarList"
    }

    static let annotationImageRatio: CGFloat = {
        let image = #imageLiteral(resourceName: "carPlaceholder")
        return image.size.height / image.size.width
    }()

    // MARK: - Outlets

    @IBOutlet weak var mapView: MKMapView!

    // MARK: - Dependencies

    private let carMapViewModel = CarMapViewModel()
    private var initialLocationReceived = false
    private let locationPermissionManager = PermissionManager(permissionRequestor: LocationPermissionRequestor())

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavigationController(withShadow: true)
        setupNavigationBar(isHidden: true, title: nil)
        if locationPermissionManager.getAuthorizationStatus() {
            CoreLocationManager.instance.startUpdatingLocation()
        } else {
            locationPermissionManager.requestAuthorization()
        }
        setupConfigurationsAndFetchData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.carListViewController {
            guard let carListViewController = segue.destination as? CarListViewController else { return }
            carListViewController.setupViewModel(CarListViewModel(Array(carMapViewModel.carMap.values)))
        }
    }

}

extension CarMapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else { return nil }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationView")
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "AnnotationView")
        }
        annotationView?.canShowCallout = false

        if let model = carMapViewModel.carMap["\(annotation.coordinate.latitude),\(annotation.coordinate.longitude)"] {
            annotationView?.image = scaleImageTo(CGSize(width: 80, height: 80 * CarMapViewController.annotationImageRatio), image: model.carImage?.image)
        }

        return annotationView
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        if !initialLocationReceived {
            zoomToLocation(userLocation.coordinate)
            initialLocationReceived = true
        }
    }

}

extension CarMapViewController: CarMapViewModelDelegate {

    func addAnnotations() {
        for car in carMapViewModel.carMap {
            let annotation = MKPointAnnotation()
            annotation.coordinate = car.value.location
            self.mapView.addAnnotation(annotation)

            car.value.imageSetHandler = { [weak self] in
                guard let strongSelf = self else { return }
                let annotationView = strongSelf.mapView.view(for: annotation)
                annotationView?.image = strongSelf.scaleImageTo(CGSize(width: 80, height: 80 * CarMapViewController.annotationImageRatio), image: car.value.carImage?.image)
            }
        }
    }

}

extension CarMapViewController {

    private func setupConfigurationsAndFetchData() {
        mapView.tintColor = .sixtOrange
        mapView.showsCompass = false
        carMapViewModel.delegate = self
        carMapViewModel.fetchCarData()
    }

    private func zoomToLocation(_ coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }

    private func scaleImageTo(_ size: CGSize, image: UIImage?) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        image?.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height)))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

}
