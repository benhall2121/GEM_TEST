
$(document).ready(function(){
	
  $("#employees th a, #employees .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#employees_search input").keyup(function() {
    $.get($("#employees_search").attr("action"), $("#employees_search").serialize(), null, "script");
    return false;
  });

  $("#assets th a, #assets .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#assets_search input").keyup(function() {
    $.get($("#assets_search").attr("action"), $("#assets_search").serialize(), null, "script");
    return false;
  });

  $("#chk_out_ins th a, #chk_out_ins .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#chk_out_ins_search input").keyup(function() {
    $.get($("#chk_out_ins_search").attr("action"), $("#chk_out_ins_search").serialize(), null, "script");
    return false;
  });

});