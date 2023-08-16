//
//  PageViewController.swift
//  PageDemo
//
//  Created by Ortwin Gentz on 16.08.23.
//

import UIKit

class PageViewController: UIPageViewController {

	var vcs: [UIViewController] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()

		for i in 0...9 {
			if let vc = storyboard?.instantiateViewController(withIdentifier: "vc") as? ViewController {
				_ = vc.view
				vc.title = "\(i)"
				vc.view.backgroundColor = generateRandomColor()
				vcs.append(vc)
			}
		}
		setViewControllers([vcs.first!], direction: .forward, animated: false)
		dataSource = self
	}
}

extension PageViewController: UIPageViewControllerDataSource {
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let index = vcs.firstIndex(of: viewController),
			  index > 0 else {
			return nil
		}
		
		return vcs[index - 1]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let index = vcs.firstIndex(of: viewController),
			  index < vcs.count - 1 else {
			return nil
		}
		
		return vcs[index + 1]
	}
	
	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		vcs.count
	}
	
	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		guard let current = pageViewController.viewControllers?.first,
			let index = vcs.firstIndex(of: current) else {
			fatalError()
		}
		
		return index
	}
}


func generateRandomColor() -> UIColor {
	let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
	let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
	let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
	
	return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
}
