import UIKit

var laberynth = [
    [3, 3, 3, 3, 3, 3, 3],
    [3, 0, 0, 0, 0, 0, 3],
    [3, 0, 3, 3, 3, 3, 3],
    [3, 0, 3, 0, 0, 0, 3],
    [3, 0, 3, 0, 3, 0, 3],
    [3, 0, 0, 0, 3, 0, 3],
    [3, 3, 3, 3, 3, 3, 3]
]
//He puesto paredes para el algoritmo
let start = (row: 1, col: 1)
let end = (row: 5, col: 5)
var yourPos = start
typealias Position = (row: Int, col: Int)




func esValida( pos: Position,  mapa: [[Int]]) -> Bool {
    if pos == start{
        return true
    }else{
        return false
    }
}


func autoMarker(pos : inout Position, mapa : inout [[Int]])-> [[Int]]{
    pos = start
    mapa[pos.row][pos.col] = 1
    var CheckMark = ""
    var checked = false
    var requirement = 0
    print (mapa)
    
    while pos != end{
        

        if mapa[pos.row][pos.col - 1] == requirement{
            pos.col -= 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            print (requirement)
            requirement = 0
            
        }
        else if mapa[pos.row][pos.col + 1] == requirement{
            pos.col += 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            print (requirement)
            requirement = 0
            
        }
        else if mapa[pos.row - 1][pos.col] == requirement{
            pos.row -= 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            print (requirement)
            requirement = 0
            
        }
         else if mapa[pos.row + 1][pos.col] == requirement{
             pos.row += 1
             mapa[pos.row][pos.col] += 1
             print (mapa)
             print (requirement)
             requirement = 0
             
        }
        else {
            requirement += 1
        }
         
         
        
        
        
        
        
    }
    return mapa
}


func printMap (mapa : [[Int]],  _ n0 : String,  _ n1 : String,  _ n2 : String ){
    var MAP: [[String]] = [
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""],
        ["", "", "", "", "", "", ""]
    ]
    var x = 0
    var y = 0
    var countForX = 0
    
    for row in 1...7 {
        for col in 1...7 {
            
            
            if mapa[x][y] == 0{
                MAP [x][y] = n0
                
            }
            else if mapa[x][y] == 1 || mapa[x][y] == 2{
                MAP [x][y] = n1
                
            }
            else if mapa[x][y] == 3{
                MAP [x][y] = n2
                
            }
            else{
                MAP[x][y] = ""
            }
            
            
            if countForX == 6{
                y = 0
                countForX = 0
                x += 1
                continue
            }
            y += 1
            countForX += 1
        }
        
    }
    
    print(MAP)
   
}


var Validez = esValida(pos: yourPos, mapa: laberynth)

if Validez{
    autoMarker(pos: &yourPos, mapa: &laberynth)
    printMap(mapa: laberynth, "🟦", "🟥", "⬛️")
}
