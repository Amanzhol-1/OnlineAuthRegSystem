//
//  SliderSlides.swift
//  iOSMessengerOnline
//
//  Created by Amanzhol on 01.07.2024.
//

import Foundation
import UIKit

class SliderSlides {
    func getSlides() -> [Slides] {
        var slides: [Slides] = []
        
        let slide1 = Slides(id: 1, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Nulla posuere sollicitudin aliquam ultrices sagittis orci a scelerisque", image: UIImage(imageLiteralResourceName: "Background"))
        let slide2 = Slides(id: 2, text: "Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Justo laoreet sit amet cursus sit. Cursus mattis molestie a iaculis at erat pellentesque. Imperdiet sed euismod nisi porta lorem mollis aliquam. Pellentesque eu tincidunt tortor aliquam nulla facilisi cras fermentum.", image: UIImage(imageLiteralResourceName: "Background"))
        let slide3 = Slides(id: 3, text: "Donec ac odio tempor orci dapibus ultrices in iaculis nunc. Diam vulputate ut pharetra sit amet aliquam id. Egestas dui id ornare arcu. Adipiscing tristique risus nec feugiat in fermentum posuere urna nec. Nunc vel risus commodo viverra maecenas accumsan lacus.", image: UIImage(imageLiteralResourceName: "Background"))
        
        slides.append(slide1)
        slides.append(slide2)
        slides.append(slide3)
        
        return slides
    }
}
