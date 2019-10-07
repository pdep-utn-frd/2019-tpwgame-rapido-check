import wollok.game.*

object nemoCarta {
	method image () = "nemoCarta.jpg"
}
class Carta{	
	var property nombre
	var property position
	var property arriba = false
	
	method image () = if (arriba) nombre + ".jpg" else "nemoCarta.jpg"	
	
	method darVuelta() {
		arriba = not arriba
	}
	
}
object gameControl {
	
	var cartas = []

	
	var personajes = ["carta01", "carta02", "carta03", "carta04","carta1", "carta2", "carta3", "carta4"]
		
	
	
//	var cartas = [
//		new Carta (nombre = "carta01", posicion = self.position()),
//		new Carta (nombre = "carta1", posicion = self.position()),
//		new Carta (nombre = "carta02", posicion = self.position()),
//		new Carta (nombre = "carta2", posicion = self.position()),
//		new Carta (nombre = "carta03", posicion = self.position()),
//		new Carta (nombre = "carta3", posicion = self.position()),
//		new Carta (nombre = "carta04", posicion = self.position()),
//		new Carta (nombre = "carta4", posicion = self.position())	
//	]
	var combinaciones = [
		game.at(1,1), 
		game.at(1,7), 
		game.at(7,1), 
		game.at(7,7), 
		game.at(13,1), 
		game.at(13,7), 
		game.at(19,1), 
		game.at(19,7)
	]
	
	method position() {
		var x
		x = combinaciones.anyOne()
		combinaciones.remove(x)
		return x		
	}
	method inicializar (){
		
	personajes.forEach {carta => self.asignarPosicion(carta)}
	
	}
	
	method asignarPosicion(nombreCarta) {
		const carta = new Carta( nombre = nombreCarta, position = self.position())
		cartas.add(carta)
		game.addVisual(carta)
	}
	
	method darVueltaTodo(){
		cartas.forEach {carta => carta.darVuelta()}
	}
	
	
}
	


