//
//  Bacteria.swift
//  BioBlitz
//
//  Created by Abhilash k George on 13/12/22.
//


import UIKit

enum Direction {
    case north, south, east, west
}

class Bacteria: UIButton {
    let connection = UIView(frame: CGRect(x: 27, y: -11, width: 16, height: 12))
    var row = 0
    var col = 0

    private var _color = UIColor.gray
    var color: UIColor {
        get {
            return _color
        }

        set {
            _color = newValue
            connection.backgroundColor = newValue

            switch newValue {
            case UIColor.green:
                setImage(UIImage(named: "arrowGreen"), for: .normal)
            case UIColor.red:
                setImage(UIImage(named: "arrowRed"), for: .normal)
            default:
                setImage(UIImage(named: "arrowGray"), for: .normal)
            }
        }
    }

    private var _direction = Direction.north
    var direction: Direction {
        get {
            return _direction
        }

        set {
            _direction = newValue

            switch newValue {
            case .north:
                transform = .identity
            case .east:
                transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            case .south:
                transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case .west:
                transform = CGAffineTransform(rotationAngle: CGFloat.pi + CGFloat.pi / 2)
            }
        }
    }

    func addConnection() {
        addSubview(connection)
    }

    func rotate() {
        switch direction {
        case .north:
            direction = .east
        case .east:
            direction = .south
        case .south:
            direction = .west
        case .west:
            direction = .north
        }
    }
}
