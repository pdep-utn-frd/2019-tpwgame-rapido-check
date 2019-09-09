import wollok.game.*

//Aplicando lo visto en clase

//class Carta{
	//var property position
	//var property posX = [1, 7, 13, 19]
	//var property posY = [1, 7, 13]
	//var property personajes = ["carta1", "carta2", "carta3", "carta4","carta1", "carta2", "carta3", "carta4"]
	
	//method image() = "nemoCarta.jpg"
//}




object cartaNormal {
	method image() = "nemoCarta.jpg"
}

class Cartas {
	
	const x 
	const y
	const numero
	
	method image () = "carta" + numero.toString() + ".jpg"
	
	method position () = game.at(x,y)
		
}
object doryBaby {

	method darseVuelta(x,y){
		return game.at(x,y)
		//return image("DoryBaby.jpg")
	}
	
	method position() = game.at(1,1)
	
	//method image() = "DoryBaby.jpg"
	//method modoDarVuelta() {
		//return imagen() = "DoryBaby.jpg"
	//}
}



//object gameControl {
	//var imagenes = ["DoryBaby.jpg", "Dorys.jpg", "parejaPeces.jpg", "pezGlobo.jpg"]
	//var posX = [1, 7, 13, 19]
	//var posY = [1, 7, 13]
	//var imagenActual
	
	//method position() {
		//var x = posX.anyOne()
		//var y = posY.anyOne()
		//posX.remove(x)
		//posY.remove(y)
		//imagenActual = imagenes.anyOne()
		//imagenes.remove(imagenActual)

		
	//}
//}





