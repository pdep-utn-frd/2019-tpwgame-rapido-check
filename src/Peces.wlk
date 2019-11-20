import wollok.game.*

class Carta{	
	var property nombre
	var property position
	var property arriba = false
	
	method image () = if (arriba) nombre + ".jpg" else "nemoCarta.jpg"	
	
	method darVuelta(x) {
		arriba = not arriba
		//game.schedule(5000, { x => x.arriba(not arriba)  })
	}
}

object gameControl {
	
	var cartas = []

	var personajes = [
		"carta01", 
		"carta02",
		"carta03", 
		"carta04",
		"carta1", 
		"carta2", 
		"carta3", 
		"carta4"
	]

	var property combinaciones = [
		game.at(1,1), 
		game.at(1,7), 
		game.at(7,1), 
		game.at(7,7), 
		game.at(13,1), 
		game.at(13,7), 
		game.at(19,1), 
		game.at(19,7)
	]
	
	var property combinaciones2 = []

	method position() {
		var x
		x = combinaciones.anyOne()
		combinaciones.remove(x)
		combinaciones2.add(x)
		return x		
	}
	
	method inicializar() {
		personajes.forEach {carta => self.asignarPosicion(carta)}
	}
	
	method asignarPosicion(nombreCarta) {
		const carta = new Carta( nombre = nombreCarta, position = self.position())
		cartas.add(carta)
		game.addVisual(carta)
	}
	
	method darVueltaCarta(posicion) {
		var pos = combinaciones2.get(posicion)
		cartas.find{x => x.position() == pos}.darVuelta(x)
		
			}
	
	method darVueltaTodo() {
		cartas.forEach {carta => carta.darVuelta()}
	}
	
	method timer(x){
		game.schedule(5000,{=>x.darVueltaTodo()})
	}
}
	
//SCHEDULE

