class View {
  constructor(game, $rootEl) {
    this.game = game;
    this.$rootEl = $rootEl;
    this.setupTowers();
    this.render();
    this.clickTower();
  }

  render() {
    const towers = this.game.towers;

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        // let disk = $(`.i-j`)
        // this.game.towers[i].reverse();
        // li.text(currentTower[j])
      }
    }
  }

  clickTower() {

  }

  setupTowers() {
    let ul, li;
    for (let i = 0; i < 3; i++) {
      ul = $('<ul>');
      this.$rootEl.append(ul);
      for (let j = 0; j < 3; j++) {
        li = $('<li>');
        // li.addClass('i-j');
        ul.append(li);
      }
    }
  }

}

module.exports = View;
