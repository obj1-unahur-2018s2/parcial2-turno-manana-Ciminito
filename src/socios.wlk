import tiposDeViajes.*

class Socio{
	var property edad = 0
	var lenguajesSocio=#{}
	var property cantidadDeActividades = 0
	var actividadesRealizadas=[]
	
	method actividadRecomendada(actividad){
		return actividad.esInteresante() and self.leAtrae(actividad)
		and not actividadesRealizadas.contains(actividad) or edad.between(20, 30)
			}
		
		
	method leAtrae(actividad){return false} /*Pongo este metodo ya que me
	 * pide en actividadRecomendada que una de las condiciones sea que la
	 * actividad le atraiga*/
	 
	 
	method setLenguajes(lenguaje){lenguajesSocio.add(lenguaje)}
	method agregarActividad(actividad) {
	  if (actividadesRealizadas.size()>=cantidadDeActividades
	  ){
        assert.error("No se pueden agregar mas actividades")
    } else {actividadesRealizadas.add(actividad)}}
	
	
	method adoradorDelSol(){
		return actividadesRealizadas.all({actividad => actividad.bronceado()})
	}
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter({actividad => actividad.esfuerzo()})
	}
}

class SocioTranquilo inherits Socio{
	override method leAtrae(actividad){
		return actividad.diasDeActividad() >= 4
	}
}
class SocioCoherente inherits Socio{
	override method leAtrae(actividad){
		return self.adoradorDelSol() and actividad.bronceado() or actividad.esfuerzo()
	}
}
class SocioRelajado inherits Socio{
	override method leAtrae(actividad){
		return {actividad.lenguajes().intersection({lenguajesSocio})}.size()>0
	}
}