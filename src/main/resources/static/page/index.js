$( document ).ready(function() {
    $(function() {
        let $tabButtonItem = $('#tab-button li'),
            $tabSelect = $('#tab-select'),
            $tabContents = $('.tab-contents'),
            activeClass = 'is-active';

        $tabButtonItem.first().addClass(activeClass);
        $tabContents.not(':first').hide();

        $tabButtonItem.find('a').on('click', function(e) {
            let target = $(this).attr('href');

            $tabButtonItem.removeClass(activeClass);
            $(this).parent().addClass(activeClass);
            $tabSelect.val(target);
            $tabContents.hide();
            $(target).show();
            e.preventDefault();
        });

        $tabSelect.on('change', function() {
            let target = $(this).val(),
                targetSelectNum = $(this).prop('selectedIndex');

            $tabButtonItem.removeClass(activeClass);
            $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
            $tabContents.hide();
            $(target).show();
        });
    });
});

$("#addLadonSaveBtn").click(function () {
  let getRoomName = $("#ladonRoomName").val();
  let getPclValue = $("#ladonPciInput").val();

  common_addDefaultListDiv("#ladonListDiv",getRoomName,getPclValue,"PCI/L");
});

$("#addFormaldehydeSaveBtn").click(function () {
    let getRoomName = $("#formaldehydeRoomName").val();
    let getPclValue = $("#formaldehydePpmInput").val();

    common_addDefaultListDiv("#formaldehydeListDiv",getRoomName,getPclValue,"PPM");
});


function common_addDefaultListDiv(div, room, value, value_unit){
    let html = [];

    html.push(
        ` <div class="col-6">
        <div class="card card-inverse-info">
            <div class="card-header mb-0 "><h5 class="card-title mb-0 ">${room}</h5></div>
            <div class="card-body">${value} <small>${value_unit}</small></div>
        </div></div>
      `
    );
    $(div).append(html.join(''));
}