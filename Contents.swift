import UIKit

var laberynth = [
    [8, 8, 8, 8, 8, 8, 8, 8, 8],
    [8, 0, 0, 0, 0, 0, 0, 0, 8],
    [8, 8, 8, 8, 8, 8, 8, 0, 8],
    [8, 0, 0, 0, 0, 0, 0, 0, 8],
    [8, 0, 8, 8, 8, 8, 8, 8, 8],
    [8, 0, 8, 0, 0, 0, 8, 0, 8],
    [8, 0, 8, 0, 8, 0, 8, 0, 8],
    [8, 0, 0, 0, 8, 0, 0, 0, 8],
    [8, 8, 8, 8, 8, 8, 8, 8, 8]
]

typealias position = (row: Int, col: Int)
let start: position = (row: 1, col: 1)
let end: position = (row: 5, col: 7)
let magicNum: Int = 1
var yourPos: position = start





func isValid( pos: position,  map: [[Int]]) -> Bool {
    if pos == start{
        return true
    }else{
        return false
    }
} //Checks if the position is correct


func autoMarker(pos : inout position, map : inout [[Int]])-> [[Int]]{
    pos = start
    var requirement: Int = 0
    //Print(mapa)
    
    while pos != end{
        
        if map[pos.row][pos.col - magicNum] == requirement{
            map[pos.row][pos.col] += magicNum
            pos.col -= 1
            //print(mapa)
            requirement = 0
            
        }
        else if map[pos.row][pos.col + magicNum] == requirement{
            map[pos.row][pos.col] += magicNum
            pos.col += 1
            //print (mapa)
            requirement = 0
            
        }
        else if map[pos.row - magicNum][pos.col] == requirement{
            map[pos.row][pos.col] += magicNum
            pos.row -= 1
            //print (mapa)
            requirement = 0
            
        }
         else if map[pos.row + magicNum][pos.col] == requirement{
             map[pos.row][pos.col] += magicNum
             pos.row += 1
             //print (mapa)
             requirement = 0
             
        }
        else {
            requirement += 1
        }
        
    }

    return map
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
    let map = 1...9
    var x = 0
    var y = 0
    var countForX = 0
    
    for row in map {
        for col in map {
            
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


var Validez = isValid(pos: yourPos, map: laberynth)

if Validez{
    autoMarker(pos: &yourPos, map: &laberynth)
    printMap(mapa: laberynth, "🟦", "🟥", "⬛️")
}
