$(document).on('turbolinks:load', function(){
  var containerClass = "main-page__body__top-banner__contents__container";
  var container = "." + containerClass;
  var contentClass = "main-page__body__top-banner__contents__container__content";
  var activeContentClass = contentClass + "--active";
  var content = "." + contentClass;
  var activeContent = "." + activeContentClass;
  var dotClass = "main-page__body__top-banner__dots__dot";
  var activeDotClass = dotClass + "--active";
  var dot = "." + dotClass;
  var activeDot = "." + activeDotClass;
  var bannerNum = $(dot).length;
  var navClass = "main-page__body__top-banner__nav__angle.main-page__body__top-banner__nav__angle";
  var prev = "." + navClass + "--prev";
  var next = "." + navClass + "--next";

  function readActiveNumber() {
    return $(activeContent).index();
  }
  function repositionSize(number) {
    return window.innerWidth * (-1) * number;
  }

  function content_resize() {
    $(container).width(window.innerWidth * ( bannerNum + 2 ));
    $(content).width(window.innerWidth);
  }
  function content_reposition(size) {
    $(container).offset({left: size});
  }
  function content_slow_reposition(size) {
    $(container).animate({left: size}, 1000);
  }

  function initializeSet() {
    var activeNumber = readActiveNumber();
    var size = repositionSize(activeNumber);
    content_resize(size);
    content_reposition(size);
  }
  function moveBanner(type) {
    var activeNumber = readActiveNumber();
    if (type === 'prev') {
      var thresholdNumber = 1;
      var setNumber = bannerNum;
      var addNumber = 1;
    } else if (type === 'next') {
      var thresholdNumber = bannerNum;
      var setNumber = 1;
      var addNumber = -1;
    }
    if(activeNumber === thresholdNumber){
      var prevNumber = setNumber;
      content_reposition(repositionSize(prevNumber + addNumber));
    } else {
      var prevNumber = activeNumber - addNumber;
    }
    $(activeContent).removeClass().addClass(contentClass);
    $(activeDot).removeClass().addClass(dotClass);
    $(content).eq(prevNumber).addClass(activeContentClass);
    $(dot).eq(prevNumber - 1).addClass(activeDotClass);
    content_slow_reposition(repositionSize(readActiveNumber()));
  }
  function nextMoveBanner() {
    moveBanner('next');
    setTimeout(nextMoveBanner, 5000);
  }

  initializeSet();
  window.onresize = function () {
    initializeSet();
  };
  $(prev).on('click', function(e){
      e.preventDefault();
      moveBanner('prev');
  })
  $(next).on('click', function(e){
      e.preventDefault();
      moveBanner('next');
  })
  setTimeout(nextMoveBanner, 5000);
})