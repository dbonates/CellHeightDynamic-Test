import UIKit

public class NiceCell: UITableViewCell {
    
    let borderColor: UIColor = .black
    let borderWidth: CGFloat = 0.5
    
    lazy var infoLabel: UILabel = {
        
        let lbl = UILabel.init(frame: .zero)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.backgroundColor = .white
        lbl.layer.borderColor = borderColor.cgColor
        lbl.layer.borderWidth = borderWidth
        return lbl
        
    }()
    
    lazy var bullet: UIView = {
        
        let b = UIView(frame: .zero)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.layer.borderColor = borderColor.cgColor
        b.layer.borderWidth = borderWidth
        b.layer.cornerRadius = 11
        return b
        
    }()
    
    lazy var miniBanner: UIImageView = {
        
        let i = UIImageView(frame: .zero)
        i.backgroundColor = .ultraLight
        i.translatesAutoresizingMaskIntoConstraints = false
        i.layer.borderColor = borderColor.cgColor
        i.layer.borderWidth = borderWidth
        
        return i
        
    }()
    
    internal override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {
        
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = borderWidth * 4
        self.backgroundColor = .veryUltraLight
        
        let margin: CGFloat = 10
        let bannerHeight: CGFloat = 44
        let bulletWidth: CGFloat = 22
        
        contentView.addSubview(miniBanner)
        NSLayoutConstraint.activate([
            miniBanner.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margin/3),
            miniBanner.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margin/3),
            miniBanner.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin/3),
            miniBanner.heightAnchor.constraint(equalToConstant: bannerHeight)
            ])
        
        
        contentView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin),
            infoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margin),
            infoLabel.bottomAnchor.constraint(equalTo: miniBanner.topAnchor, constant: -margin),
            infoLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -(bulletWidth+margin))
            ])
        
        contentView.addSubview(bullet)
        NSLayoutConstraint.activate([
            bullet.centerYAnchor.constraint(equalTo: infoLabel.centerYAnchor),
            bullet.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margin/3),
            bullet.heightAnchor.constraint(equalToConstant: bulletWidth),
            bullet.widthAnchor.constraint(equalToConstant: bulletWidth)
            ])
        
        setupBanner()
    }
    
    func setupBanner() {
        guard let iFile = Bundle.main.path(forResource: "aperture", ofType: "jpg") else { return }
        
        guard let img = UIImage(named: "aperture.jpg") else { return }
        
        miniBanner.image = img
    }
    
    public func setupInfo(_ info: String) {
        infoLabel.text = info
    }
}
