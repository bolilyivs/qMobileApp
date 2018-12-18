import QtQuick 2.12
import "crossword.js" as Cross

Item {
    property var words: []
    property var clues: []

    property var letters: []
    property var starts: []

    property var down: []
    property var across: []

    function run(){
        var cw = new Cross.Crossword(words, clues);

        var tries = 10;
        var grid = cw.getSquareGrid(tries);

        if(grid == null){
            var bad_words = cw.getBadWords();
            var str = [];
            for(var i = 0; i < bad_words.length; i++){
                str.push(bad_words[i].word);
                console.log(bad_words[i].word)
            }

            return;
        }

        var show_answers = true;
        getCrossword(grid, show_answers);

        var legend = cw.getLegend(grid)
        addLegendToPage(legend)
    }

    function addLegendToPage(groups){
        down = [];
        across = [];

        for(var i in groups["down"]){
           down.push(groups["down"][i]['position'] + " " + groups["down"][i]['clue'])
        }

        for(var i in groups["across"]){
           across.push(groups["across"][i]['position'] + " " + groups["across"][i]['clue'])
        }

        console.log(down)
        console.log(across)
    }

    function getCrossword(grid, show_answers){
        if(grid == null)
            return;
        letters = []
        starts = []
        var label = 1;
        for(var r = 0; r < grid.length; r++){
            var lrow = []
            var srow = []
            for(var c = 0; c < grid[r].length; c++){
                var cell = grid[r][c];
                var is_start_of_word = false;
                if(cell == null){
                    var ch = "#";
                } else {
                    var ch = cell['char'];
                    var is_start_of_word = (cell['across'] && cell['across']['is_start_of_word']) || (cell['down'] && cell['down']['is_start_of_word']);
                }

                if(is_start_of_word) {
                    srow.push(label);
                    label++;
                } else {
                    srow.push(' ');
                }

                if(show_answers) {
                    lrow.push(ch);

                } else {
                    lrow.push('@');
                }
            }
            letters.push(lrow)
            starts.push(srow)
        }
    }
}
