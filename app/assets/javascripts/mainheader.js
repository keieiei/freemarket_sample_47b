$(document).on('turbolinks:load', function(){
  var leftItemName       = 'main-page__header__nav-box__left-box__list__item';
  var parentWrapName     = leftItemName + '__parent-wrap';
  var parentName         = parentWrapName + '__parent';
  var childWrapName      = parentName + '__child-wrap';
  var childName          = childWrapName + '__child';
  var grandchildWrapName = childName + '__grand-child-wrap';
  var grandchildName     = grandchildWrapName + '__grand-child';

  var activeParentName     = parentName + '--active';
  var activeChildName      = childName + '--active';
  var activeGrandchildName = grandchildName + '--active';

  var leftItemClass       = '.' + leftItemName;
  var parentWrapClass     = '.' + parentWrapName;
  var parentClass         = '.' + parentName;
  var childWrapClass      = '.' + childWrapName;
  var childClass          = '.' + childName;
  var grandchildWrapClass = '.' + grandchildWrapName;
  var grandchildClass     = '.' + grandchildName;

  var rightItemName = 'main-page__header__nav-box__right-box__list__item';
  var itemboxName   = rightItemName + '__item-box';
  var mypageItemName = itemboxName + '--mypage__nav-list__item';
  var mypageLinkName = mypageItemName + '__text';
  var mypageIconName = mypageItemName + '__icon-arrow-right';

  var activeItemboxName = itemboxName + '--active';
  var activeMypageLinkName = mypageLinkName + '--active';
  var activeMypageIconName = mypageIconName + '--active';

  var rightItemClass = '.' + rightItemName;
  var itemboxClass   = '.' + itemboxName;
  var mypageItemClass = '.' + mypageItemName;
  var mypageLinkClass = '.' + mypageLinkName;
  var mypageIconClass = '.' + mypageIconName;
  $(function(){
    $(leftItemClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var parent = $(this).children(parentWrapClass).children(parentClass);
        parent.addClass(activeParentName);
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var parent = $(this).children(parentWrapClass).children(parentClass);
        parent.removeClass(activeParentName);
      }
    })
    $(parentClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var parentWrap = $(this).parent();
        var child = $(this).children(childWrapClass).children(childClass);
        if (child.length) {
          parentWrap.css('width', '448px')
          child.addClass(activeChildName);
        }
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var parentWrap = $(this).parent();
        parentWrap.css('width', 'auto')
        var child = $(this).children(childWrapClass).children(childClass);
        child.removeClass(activeChildName);
      }
    })
    $(childClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var childWrap = $(this).parent();
        var grandchild = $(this).children(grandchildWrapClass).children(grandchildClass);
        if (grandchild.length) {
          childWrap.css('width', '768px')
          grandchild.addClass(activeGrandchildName);
        }
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var childWrap = $(this).parent();
        childWrap.css('width', 'auto')
        var grandchild = $(this).children(grandchildWrapClass).children(grandchildClass);
        grandchild.removeClass(activeGrandchildName);
      }
    })
    $(rightItemClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var itembox = $(this).children(itemboxClass);
        itembox.addClass(activeItemboxName);
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var itembox = $(this).children(itemboxClass);
        itembox.removeClass(activeItemboxName);
      }
    })
    $(mypageItemClass).on({
      'mouseenter' : function(e){
        e.preventDefault();
        var link = $(this).children(mypageLinkClass);
        var icon = $(this).children(mypageLinkClass).children(mypageIconClass);
        link.addClass(activeMypageLinkName);
        icon.addClass(activeMypageIconName);
      },
      'mouseleave' : function(e){
        e.preventDefault();
        var link = $(this).children(mypageLinkClass);
        var icon = $(this).children(mypageLinkClass).children(mypageIconClass);
        link.removeClass(activeMypageLinkName);
        icon.removeClass(activeMypageIconName);
      }
    })
  })
})