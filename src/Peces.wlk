import wollok.game.*


object gameControl {
	var imagenes = ["DoryBaby.jpg", "Dorys.jpg", "parejaPeces.jpg", "pezGlobo.jpg"]
	var posX = [1, 7, 13, 19]
	var posY = [1, 7, 13]
	var imagenActual
	//var bandera
	
	method position() {
		var x = posX.anyOne()
		var y = posY.anyOne()
		posX.remove(x)
		posY.remove(y)
		imagenActual = imagenes.anyOne()
		imagenes.remove(imagenActual)

		
	}
}

object cartaNormal {
	method image() = "nemoCarta.jpg"
}

object doryBaby {
	method imagen() = "DoryBaby.jpg"
	//method modoDarVuelta() {
		//return imagen() = "DoryBaby.jpg"
	//}
}

class Cartas {
	
	var posX = [1, 7, 13, 19]
	var posY = [1, 7, 13]
	var imagen

	
	method image() = imagen
	
	method position() {
		var x = posX.anyOne()
		var y = posY.anyOne()
		return game.at(x, y)
	}
}