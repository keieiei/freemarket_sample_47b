$(document).on('turbolinks:load', function(){
  var largeCategorySelectClass = ".main-page__body__side-bar__form__container__group__select-wrap__select--large_category";
  var middleCategoryWrapClass = ".main-page__body__side-bar__form__container__group__child-wrap";
  var middleCategorySelectClass = ".main-page__body__side-bar__form__container__group__child-wrap__select-wrap__select--middle_category";
  var smallCategoryWrapClass = ".main-page__body__side-bar__form__container__group__grand-child-wrap";
  var sizeTypeSelectClass = ".main-page__body__side-bar__form__container__group__select-wrap__select--size_type";
  var itemSizeWrapClass = ".main-page__body__side-bar__form__container__group__child-wrap";
  var priceSelectClass = ".main-page__body__side-bar__form__container__group__select-wrap__select--price";
  var priceMinInputClass = ".main-page__body__side-bar__form__container__group__input-text--price_min";
  var priceMaxInputClass = ".main-page__body__side-bar__form__container__group__input-text--price_max";
  var checkboxClass = ".main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap__checkbox";
  var clearBtnClass = ".main-page__body__side-bar__form__container__search-btn-box__clear-btn"

  $(function(){
    $(document).on('click', clearBtnClass, function(e) {
      e.preventDefault();
      var parent = $(this).parent().parent();
      parent.find("#q_sorts").val("id desc");
      parent.find("#q_name_or_detail_cont").val("");
      parent.find("#q_large_category_id_eq").val("");
      parent.find("#q_large_category_id_eq").parent().parent().find(".main-page__body__side-bar__form__container__group__child-wrap").remove();
      parent.find("#q_large_category_id_eq").parent().parent().find(".main-page__body__side-bar__form__container__group__grand-child-wrap").remove();
      parent.find("#q_brand_name_cont").val("");
      parent.find("#q_item_size_size_type_id_eq").val("");
      parent.find("#q_item_size_size_type_id_eq").parent().parent().find(".main-page__body__side-bar__form__container__group__child-wrap").remove();
      parent.find("#price_select").val(0);
      parent.find("#q_price_gteq").val("");
      parent.find("#q_price_lteq").val("");
      parent.find(".main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap__checkbox").prop("checked", false);
    })
  })

  $(function(){
    $(document).on('change', "#q_item_condition_id_eq_any", function(e) {
      e.preventDefault();
      var otherCheckboxes = $(this).parent().parent().find(checkboxClass);
      if ($(this).prop("checked") == true) {
        otherCheckboxes.prop("checked", true)
      } else {
        otherCheckboxes.prop("checked", false)
      }
    })
  })

  $(function(){
    $(document).on('change', "#q_delivery_charge_id_eq_any", function(e) {
      e.preventDefault();
      var otherCheckboxes = $(this).parent().parent().find(checkboxClass);
      if ($(this).prop("checked") == true) {
        otherCheckboxes.prop("checked", true)
      } else {
        otherCheckboxes.prop("checked", false)
      }
    })
  })

  $(function(){
    $(document).on('change', "#q_item_state_id_eq_any", function(e) {
      e.preventDefault();
      var otherCheckboxes = $(this).parent().parent().find(checkboxClass);
      if ($(this).prop("checked") == true) {
        otherCheckboxes.prop("checked", true)
      } else {
        otherCheckboxes.prop("checked", false)
      }
    })
  })

  function addMiddleSelect(middle_categories) {
    var html = `<div class="main-page__body__side-bar__form__container__group__child-wrap">
                  <div class="main-page__body__side-bar__form__container__group__child-wrap__select-wrap main-page__body__side-bar__form__container__group__child-wrap__select-wrap--active">
                    <i class="fas fa-chevron-down main-page__body__side-bar__form__container__group__child-wrap__select-wrap__icon"></i>
                    <select name="middle_category_id" class="main-page__body__side-bar__form__container__group__child-wrap__select-wrap__select main-page__body__side-bar__form__container__group__child-wrap__select-wrap__select--middle_category">
                      <option value>すべて</option>`
    for (var i=0; i<middle_categories.length; i++) {
      html = html + `<option value="${middle_categories[i].id}">${middle_categories[i].name}</option>`
    }
    var html = html + `    </select>
                        </div>
                       </div>`
    return html;
  };

  $(function(){
    $(largeCategorySelectClass).on('change', function(e) {
      e.preventDefault();
      var large_category_id = $(this).val();
      var parent = $(this).parent().parent();
      var middleCategoryWrap = parent.find(middleCategoryWrapClass);
      var smallCategoryWrap = parent.find(smallCategoryWrapClass);
      $.ajax({
        type: 'GET',
        url: '/items/get_middle_categories',
        data: { large_category_id: large_category_id },
        dataType: 'json'
      })
      .done(function(middle_categories) {
        if (middleCategoryWrap.length >= 1) {
          middleCategoryWrap.remove();
        }
        if (smallCategoryWrap.length >= 1) {
          smallCategoryWrap.remove();
        }
        if (middle_categories.length > 1) {
          var html = addMiddleSelect(middle_categories);
          parent.append(html);
        }
      })
      .fail(function(){
        alert('middle_categoryのセレクトボックスの表示に失敗しました');
      })
    })
  })

  function addSmallCheckbox(small_categories) {
    var html = `<div class="main-page__body__side-bar__form__container__group__grand-child-wrap">
                  <div class="main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap--active">`
    for (var i=0; i<small_categories.length; i++) {
      html = html + `<div class="main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap__checkbox-wrap">
                      <input type="checkbox" name="q[small_category_id_eq_any][]" id="q_small_category_id_eq_any_${small_categories[i].id}" value="${small_categories[i].id}" class="main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap__checkbox-wrap__checkbox">
                      <i class="fas fa-check main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap__checkbox-wrap__icon"></i>
                      <label for="q_small_category_id_eq_any_${small_categories[i].id}" class="main-page__body__side-bar__form__container__group__grand-child-wrap__select-wrap__checkbox-wrap__label">${small_categories[i].name}</label>
                    </div>`
    }
    var html = html + ` </div>
                       </div>`
    return html;
  };

  $(function(){
    $(document).on('change', middleCategorySelectClass, function(e) {
      e.preventDefault();
      var middle_category_id = $(this).val();
      var parent = $(this).parent().parent().parent();
      var smallCategoryWrap = parent.find(smallCategoryWrapClass);
      $.ajax({
        type: 'GET',
        url: '/items/get_small_categories',
        data: { middle_category_id: middle_category_id },
        dataType: 'json'
      })
      .done(function(return_data) {
        if (smallCategoryWrap.length >= 1) {
          smallCategoryWrap.remove();
        }
        if (return_data.small_categories.length > 1) {
          var html = addSmallCheckbox(return_data.small_categories);
          parent.append(html);
        }
      })
      .fail(function(){
        alert('small_categoryのチェックボックスの表示に失敗しました');
      })
    })
  })

  function addSizeCheckbox(item_sizes) {
    var html = `<div class="main-page__body__side-bar__form__container__group__child-wrap">
                  <div class="main-page__body__side-bar__form__container__group__child-wrap__wrap main-page__body__side-bar__form__container__group__child-wrap__wrap--active">`
    for (var i=0; i<item_sizes.length; i++) {
      html = html + `<div class="main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap">
                      <input type="checkbox" name="q[item_size_id_eq_any][]" id="q_item_size_id_eq_any_${item_sizes[i].id}" value="${item_sizes[i].id}" class="main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap__checkbox">
                      <i class="fas fa-check main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap__icon"></i>
                      <label for="q_item_size_id_eq_any_${item_sizes[i].id}" class="main-page__body__side-bar__form__container__group__child-wrap__wrap__checkbox-wrap__label">${item_sizes[i].size}</label>
                    </div>`
    }
    var html = html + ` </div>
                       </div>`
    return html;
  };

  $(function(){
    $(document).on('change', sizeTypeSelectClass, function(e) {
      e.preventDefault();
      var size_type_id = $(this).val();
      var parent = $(this).parent().parent();
      var itemSizeWrap = parent.find(itemSizeWrapClass);
      $.ajax({
        type: 'GET',
        url: '/items/get_item_sizes',
        data: { size_type_id: size_type_id },
        dataType: 'json'
      })
      .done(function(item_sizes) {
        if (itemSizeWrap.length >= 1) {
          itemSizeWrap.remove();
        }
        if (item_sizes.length > 1) {
          var html = addSizeCheckbox(item_sizes);
          parent.append(html);
        }
      })
      .fail(function(){
        alert('item_sizeのチェックボックスの表示に失敗しました');
      })
    })
  })

  $(function(){
    $(document).on('change', priceSelectClass, function(e) {
      e.preventDefault();
      var priceSelectVal = $(this).val();
      var priceSelectTexts = $(this).text();
      var priceSelectText_array = priceSelectTexts.split(/\r\n|\r|\n/);
      var priceSelectText = priceSelectText_array[priceSelectVal];
      if (priceSelectVal >= 1) {
        var priceMin = priceSelectText.split('~')[0].replace(/\s+/g, "");
        var priceMax = priceSelectText.split('~')[1].replace(/\s+/g, "");
      } else {
        var priceMin = "";
        var priceMax = "";
      }
      var parent = $(this).parent().parent();
      var priceMinInput = parent.find(priceMinInputClass);
      var priceMaxInput = parent.find(priceMaxInputClass);
      priceMinInput.val(priceMin);
      priceMaxInput.val(priceMax);
    })
  })
})