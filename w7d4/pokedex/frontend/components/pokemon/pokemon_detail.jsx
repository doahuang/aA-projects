import React from 'react';

export default class PokemonDetail extends React.Component {
  componentDidMount() {
    let id = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentWillReceiveProps(newProps) {
    if (this.props.match.params.pokemonId !== newProps.match.params.pokemonId) {
      this.props.requestSinglePokemon(newProps.match.params.pokemonId);
    }
  }

  render() {
    if (!this.props.pokemon) {
      return <h1>loading</h1>;
    }
    return (
      <div>
        <h1>hello, {this.props.pokemon.name}</h1>
      </div>
    );
  }
}
