import UIKit
import iCarousel

class LoginViewController: UIViewController {

    @IBAction func loginButtonPressed(_ sender: Any) {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController")
        navigationController?.pushViewController(mainVC, animated: true)
    }
}

class MainViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet var squareViews: [UIView]!
    
    let squareColors: [UIColor] = [.red, .blue, .green, .purple]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configurar o carrossel
        carousel.delegate = self
        carousel.dataSource = self
        carousel.type = .coverFlow
    }
    
    // MARK: - iCarousel DataSource
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5 // Número de itens no carrossel
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        // Configurar e retornar as visualizações no carrossel
        let itemView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        itemView.backgroundColor = UIColor.random()
        
        let label = UILabel(frame: itemView.bounds)
        label.textAlignment = .center
        label.textColor = .white
        label.font = label.font.withSize(50)
        label.text = "\(index + 1)"
        
        itemView.addSubview(label)
        return itemView
    }
}
