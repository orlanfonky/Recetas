//
//  ViewController.swift
//  recetas
//
//  Created by Orlando Abaunza Ubaque on 4/06/20.
//  Copyright © 2020 Orlando Abaunza Ubaque. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var recipes: [Recipe] = []
    //var recipes = [,"cafe tostado","lenetchas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var recipe = Recipe(name:"frisoles con garra", image: #imageLiteral(resourceName: "Frijoles-charros-chorizo"),time:20, ingredientes: ["frijoles","cebolla","choricete"],steps: ["Beans a la olla a presion","sofreir chorizo y cebolla","hechar verduras y chorizo a la olla"])
        recipes.append(recipe)
        recipe = Recipe(name:"Lentejas con bacon", image:#imageLiteral(resourceName: "lentejas"),time:100, ingredientes: ["lentejas","cebolla","bacon"],steps: ["dejar una noche lentejas en agua","sofreir bacon y picar junto con cebolla","Hechar todo a la olla"])
        recipes.append(recipe)
         recipe = Recipe(name:"Huevos con arroz", image:#imageLiteral(resourceName: "rizeYeggs"),time:45, ingredientes: ["Ryce","Eggs","cebolla y tomate"],steps: ["Prepara arroz con cebolla y ajo","hechar huevo al arroz y tapar","agregar queso y demas al gusto"])
        recipes.append(recipe)
        recipe = Recipe(name:"fish with pasta",image:#imageLiteral(resourceName: "pastaWithBarrandi"),time:20, ingredientes: ["Trucha","Pasta","cebolla, ajo, tomate y pimenton"],steps: ["Cocinar pasta","Preparar fish con ajo y cebolla","Hechar fish a la pasta montada en plato"])
        recipes.append(recipe)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe =  recipes[indexPath.row]
        let CellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! RecipeCell
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLbael.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredientes.count)"
        
        //cell.thumbnailImageView.clipsToBounds = true
        //cell.thumbnailImageView.layer.cornerRadius = 42.0
        if recipe.isFavourite {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = self.recipes[indexPath.row]
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        var fav = "Me gusta"
        var favActStyle = UIAlertAction.Style.default
        if recipe.isFavourite{
            fav = "Ya no me Gusta"
            favActStyle = UIAlertAction.Style.destructive
        }
        let favoriteAction = UIAlertAction(title: fav, style: favActStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        alertController.addAction(favoriteAction)
        self.present(alertController,animated: true, completion: nil)
        
    }
        //Borrado  func: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.recipes.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: .bottom)
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //action-compartir
        let shareAction = UITableViewRowAction(style: .default, title: "compartir"){ (action, indexPath) in
            let shareDefaultText = "estoy viendo la receta de \(self.recipes[indexPath.row].name) en la App de recetas"
            let activityControlles = UIActivityViewController(activityItems: [shareDefaultText], applicationActivities: nil)
        }
        // Toca agregar la accion de borrar tmb
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar"){(action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return [shareAction, deleteAction]
    }
        //fin borrado
}

