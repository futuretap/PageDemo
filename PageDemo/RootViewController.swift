//
//  RootViewController.swift
//  PageDemo
//
//  Created by Ortwin Gentz on 16.08.23.
//

import UIKit

class RootViewController: UIViewController {

	@IBOutlet var logView: UITextView!
	var pageViewController: UIPageViewController?
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let pageVC = segue.destination as? PageViewController {
			pageVC.delegate = self
			pageViewController = pageVC
		}
    }
	
	@IBAction func logCurrent(_ sender: Any) {
		let vc = pageViewController?.viewControllers?.first as? ViewController
		log("current: \(vc?.title ?? "nil")")
	}
	
	func log(_ message: String) {
		var text = logView.text.components(separatedBy: "\n").suffix(8).joined(separator: "\n")
		text.append(message)
		logView.text = text + "\n"
	}
}

// MARK: UIPageViewControllerDelegate
extension RootViewController: UIPageViewControllerDelegate {
	func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
		let vc = pendingViewControllers.first as? ViewController
		
		log("willTransitionTo: \(vc?.title ?? "nil")")
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		let vc = pageViewController.viewControllers?.first as? ViewController
		log("didFinishAnimating: \(finished ? "finished, ":"")current: \(vc?.title ?? "nil"), previous: \(previousViewControllers.first?.title ?? "nil")\(completed ? ", completed":"")")
	}
}
