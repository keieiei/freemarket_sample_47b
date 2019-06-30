$(document).on('turbolinks:load', function(){
  var tabTitleName = 'main-page__body__content__tab-container__title-list__item';
  var tabTitleActiveName = tabTitleName + '--active';
  var tabTitleClass = '.' + tabTitleName;
  var tabContentListName = 'main-page__body__content__tab-container__content-list';
  var tabContentName = tabContentListName + '__content';
  var tabContentActiveName = tabContentName + '--active';
  var tabContentListClass = '.' + tabContentListName;
  var tabContentActiveClass = '.' + tabContentActiveName;

  var sidebarItemName = 'main-page__body__side-bar__nav__list__item';
  var sidebarLinkName = sidebarItemName + '__text-link';
  var sidebarIconName = sidebarItemName + '__icon-arrow-right'

  var sidebarActiveLinkName = sidebarLinkName + '--active';
  var sidebarActiveIconName = sidebarIconName + '--active';

  var sidebarItemClass = '.' + sidebarItemName;
  var sidebarLinkClass = '.' + sidebarLinkName;
  var sidebarIconClass = '.' + sidebarIconName;
  $(function(){
    $(tabTitleClass).on('click', function(e){
      e.preventDefault();
      var pattern = 'active';
      let classNames = $(this).attr('class');
      if(!classNames.endsWith(pattern)){
        $(this).siblings().removeClass().addClass(tabTitleName);
        $(this).addClass(tabTitleActiveName);
        var activeContent = $(this).parent().parent().children(tabContentListClass).children(tabContentActiveClass);
        var nonactiveContent = activeContent.siblings();
        activeContent.removeClass().addClass(tabContentName);
        nonactiveContent.addClass(tabContentActiveName);
      }
    })
    $(sidebarItemClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var link = $(this).children(sidebarLinkClass);
        var icon = link.children(sidebarIconClass);
        link.addClass(sidebarActiveLinkName);
        icon.addClass(sidebarActiveIconName);
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var link = $(this).children(sidebarLinkClass);
        var icon = link.children(sidebarIconClass);
        link.removeClass(sidebarActiveLinkName);
        icon.removeClass(sidebarActiveIconName);
      }
    })
  })

  var birthYearId = '#user_birth_year';
  var birthMonthId = '#user_birth_month';
  var birthDayId = '#user_birth_day';
  var getMonthDays = function(year, month) {
    return new Date(year, month, 0).getDate();
  };
  var changeDaySelction = function() {
    var year = $(birthYearId).val();
    var month = $(birthMonthId).val();
    if (year != 0 && month != 0) {
      var days = getMonthDays(year, month);
      for (var i = 1; i <= days; i++) {
        $(birthDayId).append($("<option>").val(i).text(i));
      }
    } else {
      $(birthDayId).empty();
      $(birthDayId).append($("<option>").val("--").text("--"));
    }
  };
  $(function(){
    $(birthYearId).on('change', function(){
      changeDaySelction();
    })
    $(birthMonthId).on('change', function(){
      changeDaySelction();
    })
  })
})