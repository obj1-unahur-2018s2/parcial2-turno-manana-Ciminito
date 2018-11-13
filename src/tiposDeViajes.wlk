class Viajes{
	var lenguajes=#{}
	method setLenguajes(lenguaje){lenguajes.add(lenguaje)}
	method bronceado()
	method esfuerzo()
	method diasDeActividad()
	method viajeInteresante(){
		return {lenguajes.size()>=2}
	}
}

class ViajesDePlaya inherits Viajes{
	var property largoDePlaya = 0
	override method diasDeActividad(){
		return largoDePlaya/500
	}
	override method esfuerzo(){
		return largoDePlaya>1200
	}
	override method bronceado(){
		return true
	}
}
class ExcursionACiudad inherits Viajes{
	var property cantidadDeAtracciones = 0
	override method diasDeActividad(){
		return cantidadDeAtracciones/2
	}
	override method esfuerzo(){
		return cantidadDeAtracciones>=5 and cantidadDeAtracciones<=8
	}
	override method bronceado(){
		return false
	}
	override method viajeInteresante(){
		return super() or cantidadDeAtracciones == 5
	}
}
class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad(){
		return (super()+1)
	}
	override method bronceado(){
		return true
	}
}
class SalidaDeTrekking inherits Viajes{
	var property kilometrosDeSendero = 0
	var property diasDeSol = 0
	override method diasDeActividad(){
		return kilometrosDeSendero/50
	}
	override method esfuerzo(){
		return kilometrosDeSendero>80
	}
	override method bronceado(){
		return diasDeSol>200 or (diasDeSol>100 and diasDeSol<200 and kilometrosDeSendero>120)
	}
	override method viajeInteresante(){
		return super() and diasDeSol>=140 
	}
}

class ClaseDeGym{
	var property lenguajes= #{"Español"}
	method bronceado(){
		return false
	}
	method esfuerzo(){
		return true
	}
	method diasDeActividad(){
		return 1
	}
	
}
