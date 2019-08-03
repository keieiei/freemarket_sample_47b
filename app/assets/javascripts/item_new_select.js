$(document).on('turbolinks:load', function(){
  var largeCategorySelectId = "#item_large_category_id";
  var middleCategorySelectId = "#item_middle_category_id";
  var smallCategorySelectId = "#item_small_category_id";
  var middleCategoryBoxId = "#middle-category-box";
  var smallCategoryBoxId = "#small-category-box";
  var sizeBoxId = "#size-box";
  var brandBoxId = "#brand-box";

  function addMiddleBox(middle_categories) {
    var html = `<div id="middle-category-box">
                  <label for="middle_category_id" class="single-page__body__form__group__label"></label>
                  <div class="single-page__body__form__large_category-select-wrap">
                    <div class="single-page__body__form__group__middle_category-select-wrap__select-wrap">
                      <select name="item[middle_category_id]" id="item_middle_category_id" class="single-page__body__form__category">
                        <option value>---</option>`
    for (var i=0; i<middle_categories.length; i++) {
      html = html + `<option value="${middle_categories[i].id}">${middle_categories[i].name}</option>`
    }
    var html = html + `     </select>
                            <i class="fas fa-chevron-down single-page__body__form__group__middle_category-select-wrap__select-wrap__icon-arrow-bottom"></i>
                          </div>
                        </div>
                       </div>`
    return html;
  };

  function addSmallBox(small_categories) {
    var html = `<div id="small-category-box">
                  <label for="small_category_id" class="single-page__body__form__group__label"></label>
                  <div class="single-page__body__form__large_category-select-wrap">
                    <div class="single-page__body__form__group__small_category-select-wrap__select-wrap">
                      <select name="item[small_category_id]" id="item_small_category_id" class="single-page__body__form__category">
                        <option value>---</option>`
    for (var i=0; i<small_categories.length; i++) {
      html = html + `<option value="${small_categories[i].id}">${small_categories[i].name}</option>`
    }
    var html = html + `     </select>
                            <i class="fas fa-chevron-down single-page__body__form__group__middle_category-select-wrap__select-wrap__icon-arrow-bottom"></i>
                          </div>
                        </div>
                       </div>`
    return html;
  };
  function addSizeBox(item_sizes) {
    var html = `<div id="size-box" class="single-page__body__form__sell-box-option">
                  <div class="single-page__body__form__group">
                    <label for="item_size_id" class="single-page__body__form__label-size">サイズ</label>
                    <span class="single-page__body__form__group__require-mark">必須</span>
                    <div class="single-page__body__form__large_category-select-wrap">
                      <div class="single-page__body__form__group__size-select-wrap__select-wrap">
                        <select name="item[item_size_id]" id="item_item_size_id" class="single-page__body__form__category">
                          <option value>---</option>`
    for (var i=0; i<item_sizes.length; i++) {
      html = html + `<option value="${item_sizes[i].id}">${item_sizes[i].size}</option>`
    }
    var html = html + `       </select>
                              <i class="fas fa-chevron-down single-page__body__form__group__middle_category-select-wrap__select-wrap__icon-arrow-bottom"></i>
                            </div>
                          </div>
                        </div>
                       </div>`
    return html;
  };

  function addBrandBox() {
    var html = `<div id="brand-box" class="single-page__body__form__sell-box-option">
                  <div class="single-page__body__form__group">
                    <label for="brand_name" class="single-page__body__form__label-brand">ブランド</label>
                    <span class="single-page__body__form__group__optional-mark">任意</span>
                    <div class="single-page__body__form__large_category-select-wrap">
                      <div class="single-page__body__form__group__size-select-wrap__select-wrap">
                        <input placeholder="例)シャネル" class="single-page__body__form__category" type="text" name="brand[name]" id="brand_name">
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  $(function(){
    $(document).on('change', largeCategorySelectId, function(e) {
      e.preventDefault();
      var large_category_id = $(this).val();
      var parent = $(this).parent().parent().parent();
      var grandparent = parent.parent();
      middleCategoryBox = parent.find(middleCategoryBoxId);
      smallCategoryBox = parent.find(smallCategoryBoxId);
      sizeBox = grandparent.find(sizeBoxId);
      brandBox = grandparent.find(brandBoxId);
      $.ajax({
        type: 'GET',
        url: '/items/get_middle_categories',
        data: { large_category_id: large_category_id },
        dataType: 'json'
      })
      .done(function(middle_categories) {
        if (middleCategoryBox.length >= 1) {
          middleCategoryBox.remove();
        }
        if (smallCategoryBox.length >= 1) {
          smallCategoryBox.remove();
        }
        if (sizeBox.length >= 1) {
          sizeBox.remove();
        }
        if (brandBox.length >= 1) {
          brandBox.remove();
        }
        if (middle_categories.length > 1) {
          var html = addMiddleBox(middle_categories);
          parent.append(html);
        }
      })
      .fail(function(){
        alert('middle_categoryのセレクトボックスの表示に失敗しました');
      })
    })
  })

  $(function(){
    $(document).on('change', middleCategorySelectId, function(e) {
      e.preventDefault();
      var middle_category_id = $(this).val();
      var parent = $(this).parent().parent().parent().parent();
      var grandparent = parent.parent();
      smallCategoryBox = parent.find(smallCategoryBoxId);
      sizeBox = grandparent.find(sizeBoxId);
      brandBox = grandparent.find(brandBoxId);
      $.ajax({
        type: 'GET',
        url: '/items/get_small_categories',
        data: { middle_category_id: middle_category_id },
        dataType: 'json'
      })
      .done(function(small_categories_item_sizes_brand_allow) {
        if (smallCategoryBox.length >= 1) {
          smallCategoryBox.remove();
        }
        if (sizeBox.length >= 1) {
          sizeBox.remove();
        }
        if (brandBox.length >= 1) {
          brandBox.remove();
        }
        if (small_categories_item_sizes_brand_allow.small_categories.length > 1) {
          var html = addSmallBox(return_data.small_categories);
          parent.append(html);
        }
        if (small_categories_item_sizes_brand_allow.item_sizes.length > 1) {
          var html = addSizeBox(return_data.item_sizes);
          grandparent.append(html);
        }
        if (small_categories_item_sizes_brand_allow.brand_allow == true) {
          var html = addBrandBox();
          grandparent.append(html);
        }
      })
      .fail(function(){
        alert('middle_categoryのセレクトボックスの表示に失敗しました');
      })
    })
  })

  $(function(){
    $(document).on('change', smallCategorySelectId, function(e) {
      e.preventDefault();
      var small_category_id = $(this).val();
      var parent = $(this).parent().parent().parent().parent();
      var grandparent = parent.parent();
      sizeBox = grandparent.find(sizeBoxId);
      brandBox = grandparent.find(brandBoxId);
      $.ajax({
        type: 'GET',
        url: '/items/get_sizes_brand_allow',
        data: { small_category_id: small_category_id },
        dataType: 'json'
      })
      .done(function(item_sizes_brand_allow) {
        if (sizeBox.length >= 1) {
          sizeBox.remove();
        }
        if (brandBox.length >= 1) {
          brandBox.remove();
        }
        if (item_sizes_brand_allow.item_sizes.length > 1) {
          var html = addSizeBox(return_data.item_sizes);
          grandparent.append(html);
        }
        if (item_sizes_brand_allow.brand_allow == true) {
          var html = addBrandBox();
          grandparent.append(html);
        }
      })
      .fail(function(){
        alert('item_sizeのセレクトボックスの表示に失敗しました');
      })
    })
  })
})