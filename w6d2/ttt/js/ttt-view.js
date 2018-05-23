class View {
  constructor(game, $el) {
    this.ttt = game;
    this.$container = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {


    this.$container.on('click', 'li', (e) => {
      let square = $(e.currentTarget);
      // debugger
      const mark = square.text()
      if ( mark === "x" || mark === "o") {
        alert(`${square.data("pos")} Is not a valid move`)
      } else {
        this.makeMove(square);
      }

      if (this.ttt.isOver()) {
        this.$container.off('click');
        this.$container.addClass('gameover')

        let message;
        if (this.ttt.winner()) {
          message = `You win, ${this.ttt.winner()}`
        } else {
          message = `NO ONE WINS!`
        }
        let h3 = $('<h3></h3>');
        $('figure').append(h3.text(message));


        const list = $('li');
        for (let i = 0; i < list.length; i++) {
          let square = $(list[i]);
          if (square.text() === this.ttt.winner()) {
            square.css('background-color', 'green');
            square.css('color', 'white');
          } else {
            square.css('color', 'red');
          }
        }
      }

    })
  }

  makeMove($square) {
    let pos = $square.data("pos");

    let mark = this.ttt.currentPlayer;

    this.ttt.playMove(pos);


    let prettymark = $('<h2></h2>').text(mark);
    $square.addClass(mark);
    $square.append(prettymark);
  }

  setupBoard() {
    const ul = $('<ul></ul>');
    this.$container.append(ul);

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let li = $('<li></li>');
        li.data('pos', [i, j]);
        ul.append(li);
      }
    }
  }
}

module.exports = View;
