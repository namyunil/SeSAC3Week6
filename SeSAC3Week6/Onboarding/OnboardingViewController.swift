//
//  OnboardingViewController.swift
//  SeSAC3Week6
//
//  Created by NAM on 2023/08/25.
//

import UIKit

    class FirstViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .brown
        }
        
    }
    
    class SecondViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .systemGreen
        }
        
    }
    
    class ThirdViewController: UIViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .magenta
        }
        
    }
    


class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
   
    //1.
    var list: [UIViewController] = []
    
    
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        list = [FirstViewController(), SecondViewController(), ThirdViewController()]
    
        view.backgroundColor = .lightGray
        delegate = self // 스토리보드 상에서 진행했다면, 내장된 기능이다
        dataSource = self // 스토리보드 상에서 진행했다면, 내장된 기능이다
        
        
        
        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let example = [1,2,3,1,2,6,7,8]
        example[1] // 2
        example.firstIndex(of: 6) // -> 요소 기반으로 인덱스를 찾는 메서드 / 인덱스 값 5
        
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil } //현재 사용자가 보고있는 VC
        
        let previousIndex = currentIndex - 1
        
        return previousIndex < 0 ? nil : list[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        return nextIndex >= list.count ? nil : list[nextIndex]
    }
    
    //총 페이지 컨트롤을 몇 개를 이용할까?
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        
        //페이지컨트롤의 위치는 변경이 어려워, 커스텀으로 만들어줘야한다..!
        //페이지 컨트롤이 vertical, pagecurl에서는 나타나지않는다..!
        //viewControllers = 현재 보여지는 뷰컨트롤러의 배열 [UIViewController]
        
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 }
        return index
    }
}
