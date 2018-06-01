import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';
import { Route } from 'react-router-dom';

export default class PokemonIndex extends React.Component {
  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke}/>
    ));

    return (
      <div className='pokedex'>
        <ul className='pokemon_index'>
          { pokemonItems }
        </ul>
        <Route path="/pokemon/:pokemonId"
          component={PokemonDetailContainer} />
      </div>

    );
  }
}
