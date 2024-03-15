//
//  OnboardingDataSource.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 15.03.2024.
//

struct MyOnboardingDataSource: IntroDataSource {
    
    let numberOfPages = 3
    
    // Set to true, if you want to fade out the last page color into black.
    let fadeOutLastPage: Bool = false
    
    func viewController(at index: Int) -> OnboardingPageViewController? {
        switch index {
        case 0:
            return DefaultOnboardingPageViewController(
                index: index,
                hue: 30/360,
                title: "First page",
                subtitle: "This is the first page.",
                image: UIImage(named: "first")!
            )
        case 1:
            return DefaultOnboardingPageViewController(
                index: index,
                hue: 60/360,
                title: "Second page",
                subtitle: "This is the second page.",
                image: UIImage(named: "second")!
            )
        case 2:
            return DefaultOnboardingPageViewController(
                index: index,
                hue: 90/360,
                title: "Third page",
                subtitle: "This is the third page.",
                image: UIImage(named: "third")!
            )
        default:
            return nil
        }
    }
}
