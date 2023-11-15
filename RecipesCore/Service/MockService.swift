//
//  MockService.swift
//  RecipesCore
//
//  Created by Cristian on 14/11/23.
//

import Foundation
import RxSwift

final class MockService: ServiceProtocol {

    func obtainRecipes() -> Single<Dashboard> {
        return Single.just(
            Dashboard(
                top: [
                    Recipe(id: "1", name: "Lomo Saltado", image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg"),
                    Recipe(id: "2", name: "Ceviche", image: "://recipeselected.com/wp-content/uploads/2019/09/Recipes-Selected-Ceviche.jpg"),
                    Recipe(id: "3", name: "Aji de Gallina", image: "https://www.recetasnestle.com.pe/sites/default/files/srh_recipes/535186920a8b142c9d521f8e9390fedd.jpg"),
                    Recipe(id: "4", name: "Anticuchos", image: "://images.hola.com/imagenes/cocina/recetas/2016101989128/anticuchos-con-aji-de-huacatay/0-826-642/anticucho-aji-huacatay-m.jpg"),
                    Recipe(id: "5", name: "Papa a la Huancaina", image: "://cdn0.recetasgratis.net/es/posts/6/1/1/papas_a_la_huancaina_peruanas_32116_orig.jpg")
                ],
                mostLiked: [
                    Recipe(id: "1", name: "Lomo Saltado", image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg"),
                    Recipe(id: "2", name: "Ceviche", image: "://recipeselected.com/wp-content/uploads/2019/09/Recipes-Selected-Ceviche.jpg"),
                    Recipe(id: "3", name: "Aji de Gallina", image: "https://www.recetasnestle.com.pe/sites/default/files/srh_recipes/535186920a8b142c9d521f8e9390fedd.jpg"),
                    Recipe(id: "4", name: "Anticuchos", image: "://images.hola.com/imagenes/cocina/recetas/2016101989128/anticuchos-con-aji-de-huacatay/0-826-642/anticucho-aji-huacatay-m.jpg"),
                    Recipe(id: "5", name: "Papa a la Huancaina", image: "://cdn0.recetasgratis.net/es/posts/6/1/1/papas_a_la_huancaina_peruanas_32116_orig.jpg"),
                    Recipe(id: "6", name: "Lomo Saltado", image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg"),
                    Recipe(id: "7", name: "Ceviche", image: "://recipeselected.com/wp-content/uploads/2019/09/Recipes-Selected-Ceviche.jpg")
                ],
                recipes: [
                    Recipe(id: "1", name: "Lomo Saltado", image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg"),
                    Recipe(id: "2", name: "Ceviche", image: "://recipeselected.com/wp-content/uploads/2019/09/Recipes-Selected-Ceviche.jpg"),
                    Recipe(id: "3", name: "Aji de Gallina", image: "https://www.recetasnestle.com.pe/sites/default/files/srh_recipes/535186920a8b142c9d521f8e9390fedd.jpg"),
                    Recipe(id: "4", name: "Anticuchos", image: "://images.hola.com/imagenes/cocina/recetas/2016101989128/anticuchos-con-aji-de-huacatay/0-826-642/anticucho-aji-huacatay-m.jpg"),
                    Recipe(id: "5", name: "Papa a la Huancaina", image: "://cdn0.recetasgratis.net/es/posts/6/1/1/papas_a_la_huancaina_peruanas_32116_orig.jpg"),
                    Recipe(id: "1", name: "Lomo Saltado", image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg"),
                    Recipe(id: "2", name: "Ceviche", image: "://recipeselected.com/wp-content/uploads/2019/09/Recipes-Selected-Ceviche.jpg"),
                    Recipe(id: "3", name: "Aji de Gallina", image: "https://www.recetasnestle.com.pe/sites/default/files/srh_recipes/535186920a8b142c9d521f8e9390fedd.jpg"),
                    Recipe(id: "4", name: "Anticuchos", image: "://images.hola.com/imagenes/cocina/recetas/2016101989128/anticuchos-con-aji-de-huacatay/0-826-642/anticucho-aji-huacatay-m.jpg"),
                    Recipe(id: "5", name: "Papa a la Huancaina", image: "://cdn0.recetasgratis.net/es/posts/6/1/1/papas_a_la_huancaina_peruanas_32116_orig.jpg")
                ]
            )
        )
    }

    func obtainRecipe(by id: String) -> Single<RecipeDetail> {
        return Single.just(
            RecipeDetail(
                id: "1",
                name: "Lomo Saltado",
                description: "Un plato peruano popular que presenta tiras de carne marinada, cebolla, tomates y papas fritas.",
                image: "https://static.wixstatic.com/media/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg/v1/fill/w_640,h_616,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/8fb78d_c77b22a3f89744a4bb1329a8d5c4e2a5~mv2.jpg",
                ingredients: [
                    Ingredient(name: "Carne de res", quantity: "1 lb, en tiras finas"),
                    Ingredient(name: "Ajo", quantity: "1, en gajos"),
                    Ingredient(name: "Cebolla roja", quantity: "1, en rodajas"),
                    Ingredient(name: "Tomates", quantity: "1, en gajos"),
                    Ingredient(name: "Pimiento rojo", quantity: "1, en rodajas"),
                    Ingredient(name: "Pimiento amarillo", quantity: "1, en rodajas")
                ],
                steps: [
                    "En un tazón, mezcla la carne de res en tiras finas con ajo picado, salsa de soja, vinagre, comino, sal y pimienta. Deja marinar durante 20-30 minutos.",
                    "En una sartén grande o wok, calienta aceite vegetal a fuego alto. Agrega la carne marinada y saltea hasta que esté dorada. Retira y reserva.",
                    "En la misma sartén, agrega un poco más de aceite si es necesario. Agrega las cebollas y los pimientos en rodajas. Saltea hasta que comiencen a ablandarse.",
                    "Agrega los tomates en gajos y la carne cocida nuevamente a la sartén. Saltea durante unos minutos hasta que todo esté caliente.",
                    "Sirve el Lomo Saltado caliente con papas fritas y arroz cocido."
                ],
                origin: Location(latitude: -12.0881471, longitude: -77.0411483))
        )
    }
}
