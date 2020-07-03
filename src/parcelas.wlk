import plantas.*

class Parcela{
	var property ancho
	var property largo
	var property horasDeSolRecibidas
	var property plantasQueTiene = #{}
	
	method superficieDeParcela(){
		return  self.ancho() * self.largo()
	}
	
	method toleranciaDePlantas(){
		if (self.ancho()> self.largo()){
			return self.superficieDeParcela() /5
		}else { return self.superficieDeParcela() / 3 +self.largo()}
	}
	method  tieneComplicaciones(){
		return self.plantasQueTiene().any({planta => planta.horasDeSol() < self.horasDeSolRecibidas()})
	}
	method poderPlantar(planta){
		if (self.recibe2HsMasDeSol(planta) or self.noHayMasLugarEnParcela() ) {
			self.error("No se puede agregar mas plantas")
		}else{
			self.plantasQueTiene().add(planta)
		}
		
	}
	/*metodos complementarios  */
	method noHayMasLugarEnParcela(){
		return self.plantasQueTiene().size() == self.toleranciaDePlantas()
	}
	method recibe2HsMasDeSol(planta){
		return (self.horasDeSolRecibidas() - planta.horasDeSol()) >= 2
		
	}
	method medidaDePlantaMasAlta(){
		return self.plantasQueTiene().max({planta => planta.altura()}).altura()
	}
	method cantidadDePlantas(){
		return self.plantasQueTiene().size()
	}
	
	
}

/*punto 5 asociacion de plantas) */
class ParcelaEcologica inherits Parcela {
	method plantaSeAsociaBien(planta){
		return not self.tieneComplicaciones()  and planta.parcelaIdeal(self)
	}
	method cantPlantasAsociadas(){
		return self.plantasQueTiene().count({planta => self.plantaSeAsociaBien(planta)})
	}
}
	
class ParcelaIndustriales inherits Parcela {
	method plantaSeAsociaBien(planta){
		return  self.cantidadDePlantas() <= 2  and planta.esFuerte()
	}
	method cantPlantasAsociadas(){
		return self.plantasQueTiene().count({planta => self.plantaSeAsociaBien(planta)})
	}
}	

