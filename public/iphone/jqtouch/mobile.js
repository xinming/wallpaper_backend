var $db = new Lawnchair({table:"appdata", adaptor:"webkit"});

var jQT = new $.jQTouch({
  startupScreen:"/iphone/images/splash.png",
  statusBar:'default',
  icon:'/iphone/images/icon.png',
  preloadImages:[
  ],
  fullScreenClass: "fullscreen",
  onAjaxPageLoaded: function(element){
    
    
    // if(element == "article_category1"){
    //   var ad = "<li class='banner_list' ><a class='slide' href='#inoa' ><img src='/iphone/images/LH_banner.jpg' /></a></li>"
    //   $(ad).insertAfter($($("#article_category1 li")[0]));
    // }
    
    // if(element == "article_category4"){
    //   var ad = "<li class='banner_list' ><a class='slide' href='#dkny' ><img src='/iphone/images/propaganda_banner.jpg' /></a></li>"
    //   $(ad).insertAfter($($("#article_category4 li")[1]));
    // }
    
    
    
    // for article
    jQT.init_iScroll();

    // for gallery
    if(element.match(/gallery[0-9]+/)){
      var gallery_id = element.replace("gallery","");
      var gallery_element_id = "photos" + gallery_id
      
      
      load_gallery(gallery_id);
      $("#" + element + " .photo_gallery a").each(function(){
        $(this).click(function(){
          // GO TO PICTURE
          jQT.goToSlide("#" + gallery_element_id + "", parseInt($(this).attr("gallery_id")));
          
          return false;
        })
      })
    }
    // for all
    var current_page = {key:element, uri:$("#" + element).attr("unique_uri"), uri_html:$("a[href=#" + element + "]").html()}
    $("body").data("current_page", current_page);
    // $("#tabbar").hide();
    // $("#" + element).bind("pageAnimationEnd", {}, function(event, info){
    //     if (info.direction == 'in'){
    //       $("#tabbar").hide();
    //     }
    //     else{
    //       // $("#tabbar").hide();
    //     }
    // });
  },
  useFastTouch: true
});

// {name}

var showing_toolbar = 0;
function load_gallery(id){
  $.getJSON( "/galleries/" + id + ".json", function(data){
      jQT.generateGallery("photos" + id, data);
  });
}



jQuery(function(){

  display_lists();
  // setTimeout(function(){
  //   jQT.goTo("#cover");
  //   
  // },4000);
  
  
  $("#gallery").bind("pageAnimationEnd", {}, function(event, info){
      if (info.direction == 'in'){
        // $("#tabbar").show();
      }
      else{
        // $("#tabbar").hide();
      }
  });

  $("#news").bind("pageAnimationEnd", {}, function(event, info){
      if (info.direction == 'in' && showing_toolbar == 0){
        
        $('#tabbar').show(function () {
          jQT.setHeight();
          // alert($("#tabbar a:last-child").html());
          $("#tabbar a:first").click();
        });
        showing_toolbar = 1;
        
      }
      else{
        // $("#tabbar").hide();
      }
  });
});

function add_to_fav(){
  $db.save($("body").data("current_page"), function(){
    $('#favourites_list').html("");
    display_fav();
  });
}

function display_fav(){
  $db.each(function(r){
    document.getElementById(r.key) ? href = "#" + r.key : href = r.uri
    var message_string= "<li><a class='slide' href='" + href + "'>" + r.uri_html.replace("/iphone/", "/iphone_thumb/") + "</a></li>";
    $('#favourites_list').append(message_string);
  });
}

function display_lists(){
  // DISPLAY NEWS
  $.getJSON( "/news.json", function(data){
    for(i=0;i<data.length; i++){
      object = data[i];
      var message_string = "<li><a class='slide' href=\"" + "/news_ajax/" + object.id + "\"><img src=\"" + object.thumbnail + "\" alt=\"\" /><div><h4>" + object.title + "</h4><span>" + object.category + " | " + object.date + "</span></div></a></li>"
      $('#news_list').append(message_string);
    }
    var ad = "<li class='banner_list' ><a class='slide' href='#lh' ><img src='/iphone/images/LH_banner.jpg' /></a></li>"
    $(ad).insertAfter($($("#news_list li")[2]));
  });
  
  // DISPLAY GALLERIES
  $.getJSON( "/galleries.json", function(data){
    for(i=0;i<data.length; i++){
      object = data[i];
      var message_string = "<li><a class='slide' href=\"" + "/gallery_ajax/" + object.id + "\"><img src=\"" + object.thumbnail + "\" alt=\"\" /><h4>" + object.title + "</h4><span>" + object.date + "</span></a></li>"
      $('#gallery_list').append(message_string);
    }
    // var ad = "<li class='banner_list' ><a href='#propaganda_container' class='slide'><img src='/iphone/images/propaganda_banner.jpg' /></a></li>"
    // $(ad).insertAfter($($("#gallery_list li")[1]));
  });
  
  $.getJSON( "/directories.json", function(data){
    for(i=0;i<data.length; i++){
      object = data[i];
      var message_string = "<li><a class='slide' href=\"" + "/directory_ajax/" + object.id + "\"><img src=\"" + object.thumbnail + "\" alt=\"\" /><h4>" + object.title + "</h4><span>" + object.date + "</span></a></li>"
      $('#directory_list').append(message_string);
    }
  });
  
  
  display_fav();
}