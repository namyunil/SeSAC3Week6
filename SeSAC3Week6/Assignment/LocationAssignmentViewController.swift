//
//  LocationAssignmentViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/23.
//

import UIKit
import SnapKit
import CoreLocation
import MapKit

class LocationAssignmentViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    let mapView = MKMapView()
    
    let theaterList = TheaterList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(chevronMarkClicked))
        navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonClicked))
        
        locationManager.delegate = self
        
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        //전체 다 보이는 위,경도를 찾자
        //37.505581, 126.939404
        let center = CLLocationCoordinate2D(latitude: 37.505581, longitude: 126.939404)
        setRegionAndAnnotation(center: center)
        
        setAnnotation(type: 0)
    }
    
    
    @objc func chevronMarkClicked() {
        dismiss(animated: true)
    }
    
    @objc func filterButtonClicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        //closure에 setAnnotation 넣기..!
        let megabox = UIAlertAction(title: "메가박스", style: .default) { _ in
            print("메가박스")
            self.setAnnotation(type: 2)
        }
        let lotteCinema = UIAlertAction(title: "롯데시네마", style: .default) { _ in
            print("롯데시네마")
            self.setAnnotation(type: 1)
        }
        let CGV = UIAlertAction(title: "CGV", style: .default) { _ in
            print("CGV")
            self.setAnnotation(type: 3)
        }
        let all = UIAlertAction(title: "전체보기", style: .default) { _ in
            print("전체보기")
            self.setAnnotation(type: 0)
        }
        
        alert.addAction(megabox)
        alert.addAction(lotteCinema)
        alert.addAction(CGV)
        alert.addAction(all)
        
        present(alert, animated: true)
    }
    
    func setAnnotation(type: Int) {

        let theaterList = theaterList.mapAnnotations
        let annotation0 = MKPointAnnotation()
        let annotation1 = MKPointAnnotation()
        let annotation2 = MKPointAnnotation()
        let annotation3 = MKPointAnnotation()
        let annotation4 = MKPointAnnotation()
        let annotation5 = MKPointAnnotation()
        let annotationList: [MKPointAnnotation] = [annotation0, annotation1, annotation2, annotation3, annotation4, annotation5]
     
        for num in 0...theaterList.count - 1 {
            annotationList[num].coordinate = CLLocationCoordinate2D(latitude: theaterList[num].latitude, longitude: theaterList[num].longitude)
            annotationList[num].title = theaterList[num].location
        }
        
        
        if type == 0 {
            //전체
            mapView.addAnnotations(annotationList)
        } else if type == 1 {
            //롯데시네마
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation0, annotation1])
        } else if type == 2 {
            //메가박스
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2, annotation3])
        } else if type == 3 {
            //cgv
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation4, annotation5])
        } else {
            return
        }
    }
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 3000, longitudinalMeters: 12000)
        mapView.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        
        mapView.addAnnotation(annotation)
        
    }
    
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
        
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
    //iOS 위치 활성화 체크
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다")
            }
        }
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showRequestLocationServiceAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation() // didUpdateLocations 메서드 실행
        case .authorized:
            print("authorized")
        @unknown default:
            print("default")
        }
        
    }
    
}

extension LocationAssignmentViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
            
            locationManager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        
        setRegionAndAnnotation(center: center)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
}

extension LocationAssignmentViewController: MKMapViewDelegate {
    
}
