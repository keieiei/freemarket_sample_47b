$(document).on('turbolinks:load', function(){
  var deleteConfirmBtnClass = ".main-page__item-edit-btn-container__btn--delete";
  var deleteCancelBtnClass = ".main-page__item-container__confirm-delete__inner__btns__clear-btn";
  var deleteConfirmBoxClassName = "main-page__item-container__confirm-delete";
  var deleteConfirmBoxClass = "." + deleteConfirmBoxClassName;
  var deleteConfirmBoxActiveClassName = deleteConfirmBoxClassName + "--active";
  var overlayClassName = "main-page__overlay";
  var overlayActiveClassName = overlayClassName + "--active";
  var overlayClass = "." + overlayClassName;
  var modalopenCalssName = "modal-open";

  $(function(){
    $(deleteConfirmBtnClass).on('click', function(e) {
      e.preventDefault();
      $('html').addClass(modalopenCalssName);
      $('body').addClass(modalopenCalssName);
      $('body').find(overlayClass).addClass(overlayActiveClassName);
      $('body').find(deleteConfirmBoxClass).addClass(deleteConfirmBoxActiveClassName);
    })
  })

  $(function(){
    $(deleteCancelBtnClass).on('click', function(e) {
      e.preventDefault();
      $('html').removeClass(modalopenCalssName);
      $('body').removeClass(modalopenCalssName);
      $('body').find(overlayClass).removeClass(overlayActiveClassName);
      $('body').find(deleteConfirmBoxClass).removeClass(deleteConfirmBoxActiveClassName);
    })
  })
})