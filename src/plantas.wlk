import parcelas.*
class Plantas {
	var property anoDeObtencion
	var property  altura 
	var property  horasDeSol = 7

	method esFuerte(){return self.horasDeSol()> 9 }
	method daNuevasSemillas(){return self.esFuerte()}
	/*metodo abstracto */
	method cuantoEspacioOcupa()
		
}

class Menta inherits Plantas {
	
	override method daNuevasSemillas(){
		return super() or self.altura() > 0.4
	}
	
	override method  cuantoEspacioOcupa(){
		return self.altura() + 1
	}
/*4. Parcelas ideales */

	method parcelaIdeal(parcela){
	    return parcela.superficieDeParcela() > 6
	}
}

class Soja inherits Plantas {
	
	override method horasDeSol(){
			if (self.altura() < 0.3){
				return  6
			} else if (self.altura().between(0.3,0.8)){
				return  7
		    }else{
		    	return 12
		    }
	  }	
	  
	override method daNuevasSemillas(){
		
	  	return super() or (self.anoDeObtencion()> 2007
	  		and self.altura().between(0.75,0.9))
	  	}
	  	
	 override method  cuantoEspacioOcupa(){
	 	return (self.altura() / 2)
	 }
/*4. Parcelas ideales */
	 method parcelaIdeal(parcela){
	    	return parcela.horasDeSolRecibidas() == self.horasDeSol()
	    
	  }	
}

class Quinoa inherits Plantas {
	var property  espacioQueOcupa
	
	override method cuantoEspacioOcupa(){
		return self.espacioQueOcupa()
	}
	override method horasDeSol(){
		 var horasToleradas = super()
		 if (self.cuantoEspacioOcupa() < 0.3){
			horasToleradas =10
		}
		return horasToleradas
	}
	
	override method daNuevasSemillas(){
	  		return super() or self.anoDeObtencion().between(2001,2008)
	  		
	 }
/*4. Parcelas ideales */
	  method parcelaIdeal(parcela){
	  	if (parcela.cantidadDePlantas() > 0){
	  	return parcela.medidaDePlantaMasAlta() < 1.5
	    }else{ return true
	  	  }
	  	  
	  }
}

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas(){
		return false
	}
/*4. Parcelas ideales */
	method parcelaIdeal(parcela){
		parcela.toleranciaDePlantas().max(1)
	}
	
} 
class Hierbabuena inherits Menta {
	override method  cuantoEspacioOcupa(){
		return super()*2
	}
} 
