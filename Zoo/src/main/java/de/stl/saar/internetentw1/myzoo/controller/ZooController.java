package de.stl.saar.internetentw1.myzoo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import de.stl.saar.internetentw1.myzoo.database.Database;
import de.stl.saar.internetentw1.myzoo.model.Animal;
import de.stl.saar.internetentw1.myzoo.model.Compound;

/**
 * Der Controller steuert die Navigation innerhalb der Anwendung. Die Methoden
 * geben an, wohin die Navigation beim Aufruf einer bestimmten URL erfolgen soll,
 * nehmen Request-Parameter entgegen, die von Formularen gesendet wurden, und 
 * schreiben neue Parameter in die Requests.
 * @author christopher
 *
 */
@Controller
public class ZooController {
	
	@RequestMapping("/")
	public String startseite(Map<String, Object> model) {
		List<Compound> alleGehege = Database.findAllCompounds();
		model.put("alleGehege", alleGehege);
		
		return "startseite";
	}
	
	@RequestMapping("gehegeWahl")
	public String gehegeWahl(Map<String, Object> model, String gehegeName){
		if(gehegeName != null){
			Compound gehege = Database.findCompoundByName(gehegeName);
			List<Animal> alleTiere = gehege.getAnimals();
			model.put("gehege", gehege);
			model.put("alleTiere", alleTiere);
			return "gehegeAnsicht";
		}else {
			List<Compound> alleGehege = Database.findAllCompounds();
			model.put("alleGehege", alleGehege);
			model.put("keineAuswahl", true);
			return "startseite";
		}
	}
	
	@RequestMapping("tierWahl")
	public String tierWahl(Map<String, Object> model, String tierName, String gehegeName){
		Compound gehege = Database.findCompoundByName(gehegeName);
		List<Animal> alleTiere = gehege.getAnimals();
		model.put("gehege", gehege);
		model.put("alleTiere", alleTiere);
		
		if(tierName != null) {
			Animal tier = Database.findAnimalByName(tierName);
			model.put("tier", tier);
			return "tierAnsicht";	
		}else {
			model.put("keineAuswahl", true);
			return "gehegeAnsicht";
		}
	}
	
	@RequestMapping("fuettern")
	public String fuettern(Map<String, Object> model, String tierName, String gehegeName){
		Compound gehege = Database.findCompoundByName(gehegeName);
		List<Animal> alleTiere = gehege.getAnimals();
		Animal tier = Database.findAnimalByName(tierName);
		tier.feed();
		model.put("gehege", gehege);
		model.put("alleTiere", alleTiere);
		model.put("tier", tier);
		
		return "tierAnsicht";
	}
}
