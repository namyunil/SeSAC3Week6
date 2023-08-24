//
//  Extension+UIViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/24.
//

import UIKit

extension UIViewController {

    
    enum TransitionStyle {
        case present // 네비게이션 없이 present
        case presentNavigation // 네비게이션 임데드 된 present
        case presentFullNavigation // 네비게이션 임베드 된 Fullscreen present
        case push
    }
    
    /*
     "고래밥" -> String
     String.self > String.Type
     */
    
    //Meta Type과 Type Parameter를 활용하여..!
    func transition<T: UIViewController>(viewController: T.Type, storyboard: String, style: TransitionStyle) {
        
        // T.Type은 클래스, 구조체 자체..!
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else { return }
        // T로 들어온다면 viewController()로 들어오는 것과 같다..
        //.instantiate -> 인스턴스를 생성하는 메서드이기 때문에 메타타입인 T.Type을 넣어서 대응해야한다..!
        
        
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    //Type Parameter: 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할 -> T
    //Type Constraints: 타입에도 제약을 설정.. 클래스 제약, 프로토콜 제약..
    //UppserCased -> U
    func configureBorder<T: UIView>(view: T) {
        
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    func configureBorder(view: UIButton) {
        
    }
    
    func configureBorder(view: UILabel) {
        
    }
    
    
    //Generic: 타입에 유연하게 대응하기 위한 요소
    //코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }

    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
    
}
