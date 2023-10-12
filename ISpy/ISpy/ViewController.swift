//
//  ViewController.swift
//  ISpy
//
//  Created by Ethan Archibald on 10/11/23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainScrollView.delegate = self
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mainImageView
    }
    
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / mainImageView.bounds.width
        let heightScale = size.height / mainImageView.bounds.height
        let scale = min(widthScale, heightScale)
        mainScrollView.minimumZoomScale = scale
        mainScrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }

}

