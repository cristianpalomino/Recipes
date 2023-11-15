# RecetasApp

RecetasApp es una aplicación iOS que permite a los usuarios explorar recetas de cocina,
organizadas en diferentes categorías como 'Top', 'Más Gustadas' y 'General'.

## Estructura de Módulos

La aplicación está diseñada con una arquitectura modular para facilitar la escalabilidad y mantenibilidad del código.

### Recipes

- **Listado de Recetas:** Explora todas las recetas disponibles.
- **Top Recetas:** Descubre las recetas más populares.
- **Más Gustadas:** Mira las recetas con más 'me gusta'.
- **Generales:** Navega por recetas clasificadas por tipo de comida o ingrediente.
- **Detalle de Receta:** Todo el detalle de una receta, ingredientes, preparacion y mas!.

- Modelos de UI para las recetas.

### RecipesTests

Tests unitarios para el módulo `Recipes`, garantizando la correcta funcionalidad de:

### RecipesCore

- Modelos de Negocio.
- Modelos de Requests.
- Consumo del API de Recetas.
- Integracion con RxSwift
- Integracion con Networking

### RecipesUITests

Tests de UI para el módulo `RecipesUI`, que incluyen:

- Pruebas automatizadas de flujos de usuario.
- Verificación de la correcta visualización de elementos de UI.

### RecipesUI

El Desing System de la aplicación

- Pantallas de listado de recetas.
- Vistas detalladas de recetas.
- Componentes de UI reutilizables y personalizados.

### Networking

Un módulo dedicado a la conectividad con internet, responsable de:

- Llamadas API para obtener recetas de un servidor remoto.
- Procesamiento y manejo de respuestas y errores de red.

### Libraries

- Alamofire
- SDWebImage
- RxSwift

## Instalación

Instrucciones para configurar el proyecto en tu máquina local para propósitos de desarrollo y pruebas.

```bash
pod install
xed Recipes.xcworkspace

- Select Recipes Target
Run the App / CMD+R

- Select RecipesTests Target
Run the Unit Tests / CMD+U
