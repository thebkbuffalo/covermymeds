$(document).ready(function(){

  var names = ['ray', 'oscar', 'gwen', 'bob', 'marie']
  random_names = shuffle(names);
  name_space = $('.names_list');
  $.each(random_names, function(i, v){
    name_space.append("<span class='name "+ v +"'>" + v + "</span>");
  });

  function shuffle(a){
    var currentIndex=a.length, tempVal, randomIndex;
    while(0!==currentIndex){
      randomIndex=Math.floor(Math.random() * currentIndex);
      currentIndex -= 1;

      tempVal=a[currentIndex];
      a[currentIndex]=a[randomIndex];
      a[randomIndex]=tempVal;
    }
    return a;
  };
});
