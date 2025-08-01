import UIKit

var laberynth = [
    [8, 8, 8, 8, 8, 8, 8, 8, 8],
    [8, 0, 0, 0, 0, 0, 0, 8, 8],
    [8, 8, 8, 8, 0, 8, 0, 8, 8],
    [8, 0, 0, 0, 0, 8, 0, 0, 8],
    [8, 0, 8, 0, 8, 8, 8, 8, 8],
    [8, 0, 8, 0, 8, 0, 0, 0, 8],
    [8, 8, 8, 0, 8, 0, 8, 0, 8],
    [8, 0, 0, 0, 0, 0, 8, 0, 8],
    [8, 8, 8, 8, 8, 8, 8, 8, 8]
]


let start = (row: 1, col: 1)
let end = (row: 7, col: 7)
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
    var CheckMark = ""
    var checked = false
    var requirement = 0
    print (mapa)
    
    while pos != end{
        

        if mapa[pos.row][pos.col - 1] == requirement{
            mapa[pos.row][pos.col] += 1
            pos.col -= 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            requirement = 0
            
        }
        else if mapa[pos.row][pos.col + 1] == requirement{
            mapa[pos.row][pos.col] += 1
            pos.col += 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            requirement = 0
            
        }
        else if mapa[pos.row - 1][pos.col] == requirement{
            mapa[pos.row][pos.col] += 1
            pos.row -= 1
            mapa[pos.row][pos.col] += 1
            print (mapa)
            requirement = 0
            
        }
         else if mapa[pos.row + 1][pos.col] == requirement{
             mapa[pos.row][pos.col] += 1
             pos.row += 1
             mapa[pos.row][pos.col] += 1
             print (mapa)
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
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""],
        ["", "", "", "", "", "", "", "", ""]
    ]
    var x = 0
    var y = 0
    var countForX = 0
    
    for row in 1...9 {
        for col in 1...9 {
            
            
            if mapa[x][y] == 0{
                MAP [x][y] = n0
                
            }
            else if mapa[x][y] == 1 || mapa[x][y] == 2 || mapa[x][y] == 3 || mapa[x][y] == 4 || mapa[x][y] == 5 || mapa[x][y] == 6 || mapa[x][y] == 7{
                MAP [x][y] = n1
                
            }
            else if mapa[x][y] == 8{
                MAP [x][y] = n2
                
            }
            else{
                MAP[x][y] = ""
            }
            
            
            if countForX == 8{
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
