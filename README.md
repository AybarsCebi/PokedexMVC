# Pokedex Flutter App

> **Note:** This is an older project I built while first learning Flutter.  
> A simple Pokedex application demonstrating MVC architecture and live JSON data fetching.

## 🚀 Features

- **Pokédex List**: Displays all Pokémon in a scrollable list.  
- **Detail View**: Shows each Pokémon’s image, types, height, weight, weaknesses, and evolution chain.  
- **MVC Architecture**: Clear separation of Model, View, and Controller layers.  
- **Live Data Source**: Fetches Pokémon data from Biuni’s [PokemonGO-Pokedex API](https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json).

## 🏗 Architecture

- **Model**  
  - `Pokemon` class defines fields matching the JSON schema:  
    - `id`, `num`, `name`, `img`  
    - `type` (List\<String\>)  
    - `height`, `weight`  
    - `candy`, `candy_count`, `egg`  
    - `spawn_chance`, `avg_spawns`, `spawn_time`  
    - `multipliers` (List\<double\>)  
    - `weaknesses` (List\<String\>)  
    - `next_evolution`, `prev_evolution` (List\<Evolution\>)

- **View**  
  - Flutter widgets (`ListView`, `GridView`, `Card`, etc.) build the UI.  
  - Responsive layout to display Pokémon cards and details.

- **Controller**  
  - `ApiService` handles HTTP requests using the `http` package.  
  - Parses the JSON response into `Pokemon` model instances.  
  - Provides data to Views and handles user interactions.

## 🗃 Data Source

Data is fetched from:
https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json

<img width="278" height="590" alt="image" src="https://github.com/user-attachments/assets/799e6e16-a461-4324-bec3-605eed442db6" />



<img width="278" height="595" alt="image" src="https://github.com/user-attachments/assets/475d0afe-9872-4d17-9247-de259e4755fd" />

