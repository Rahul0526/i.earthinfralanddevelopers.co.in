<?php  include'header.php';?> 

<style>
.box-home{ background-color:#fff; padding:20px; margin-bottom:50px;}
.box-home p{ font-size:14px; line-height:25px;  

}

.promo-box{ margin-bottom:0;}


</style>

   <!--Header Section Close here-->
<div id="page-wrapper">


  <?php $destinations=$this->user_model->destinations();
  		$packages=$this->pack_model->packeges();

  

  ?>

  

  

  <!--Image slider Section close here -->

  

  <!--Search box content gose here-->

    <?php include'searchbox_wraper.php';?>

  <!--Search box content close here-->

  

  <section id="content">

    <!-- Popuplar Destinations -->

    <div class="destinations section1">

      <div class="container">

        <h1>Popular Destinations</h1>

        <div class="row image-box style1 add-clearfix">

          

		  

         <?php 

         // print_r($destinations);
         foreach($destinations  as $dest){?>          

          <div class="col-sms-6 col-sm-6 col-md-3">		 

		   <a href="<?php echo base_url('index.php/home/view_detail/'.$dest['id']);?>">

		   <article class="box">

              <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1"> 

			   <img src="<?php echo base_url('destination/'.$dest['main_image']);?>" alt="" width="270" height="160" /></a> </figure>

              <div class="details">

                <h4 class="box-title"><?php  echo $dest['name'];?><small><?php $countryobj=$this->region_model->getCountryValue($dest['country']);echo $countryobj[0]['country'];?></small></h4>

              </div>

            </article></a>

			</div>

          

		<?php }?>	

          

        </div>

      </div>

    </div>

    
<div class="container">

        <h1>Popular Packages</h1>

        <div class="row image-box style1 add-clearfix">

          

		  

         <?php foreach($packages  as $dest){?>          

          <div class="col-sms-6 col-sm-6 col-md-3">		 

		   <a href="<?php echo base_url('index.php/home/package_detail/'.$dest['pack_id']);?>">

		   <article class="box">

              <figure class="animated" data-animation-type="fadeInDown" data-animation-duration="1"> 

			   <img src="<?php echo base_url('upload/package/'.$dest['image_1']);?>" alt="" width="270" height="160" /></a> </figure>

              <div class="details">

                <h4 class="box-title"><?php  echo $dest['pack_name'];?><small><?php $country=$this->region_model->getcntbyid($dest['country']);echo $country[0]['country'];?></small></h4>

              </div>

            </article></a>

			</div>

          

		<?php }?>	

          

        </div>

<div class="clearfix"></div>



<!-- <div class="details box-home">
<h1 class="box-title">Welcome to Easeyatra.com</h1><br/>
 <p>By using new methods and advanced technology, we can offer the lowest

fares and highest standard of service in travel today. EaseYatra only think

about how to satisfy you, no matter how long it takes, or how low they get

your fare. We are specialist in a particular type of travel (Like cruises,

domestic and international air ticketing, etc.). So we have the knowledge and

experience to give you great advice.

EaseYatra current product offering consists of airline tickets, hotel

rooms, vacation packages, car rental, passport and visa services, agencies

normally spend on advertising and branch offices.

We plan, organize and conduct tours and trips for individuals or

groups. Our duty is to assist travellers with the travel schedules, available

vacation packages, food facilities, guiding them in new places and assisting

in their needs. We assess tourist’s need and help them with the best

possible travel arrangements  round the clock 24*7.
</p>

<p class="s-title"><strong>For EaseYatra.com</strong></p>
<p class="s-title"><strong>Hari Om Patel (CEO & FOUNDER)</strong></p>

</div> -->


      </div>
	<!--Progress bar open here-->

 

  

	

	<!--Progress bar close here-->

    <!-- Honeymoon -->
    
    
    
    
    

    <div class="honeymoon section global-map-area promo-box parallax" data-stellar-background-ratio="0.5">

      <div class="container">

        <div class="col-sm-6 content-section description pull-right">

          <h1 class="title" style="color:#fff;">Popular Packages for Honeymoon</h1>

          <p>Nunc cursus libero purusac congue arcu cursus utsed vitae pulvinar massa idporta neque purusac Etiam elerisque mi id faucibus iaculis vitae pulvinar.</p>

          <div class="row places image-box style9">

            <div class="col-sm-4 col-xs-12">

              <article class="box">

                <figure> <a href="<?php echo base_url('index.php/home/package_detail/9B1en');?>" title="" class="hover-effect yellow middle-block animated" data-animation-type="fadeInUp" data-animation-duration="1">

				<img src="<?php echo base_url('image/img/places01.jpg');?>" alt="" /></a> </figure>

                <div class="details">

                  <h4 class="box-title">Andman<small>(India)</small></h4>

                  <a href="<?php echo base_url('index.php/home/package_detail/9B1en');?>" title="" class="button">SEE ALL</a> </div>

              </article>

            </div>

            <div class="col-sm-4 col-xs-12">

              <article class="box">

                <figure> <a href="<?php echo base_url('index.php/home/package_detail/BFfqK');?>" title="" class="hover-effect yellow middle-block animated" data-animation-type="fadeInUp" data-animation-duration="1" data-animation-delay="0.4">

				<img src="<?php echo base_url('image/img/places02.jpg');?>" alt="" /></a> </figure>

                <div class="details">

                  <h4 class="box-title">Dubai<small>(UAE)</small></h4>

                  <a href="<?php echo base_url('index.php/home/package_detail/BFfqK');?>" title="" class="button">SEE ALL</a> </div>

              </article>

            </div>

            <div class="col-sm-4 col-xs-12">

              <article class="box">

                <figure> <a href="<?php echo base_url('index.php/home/package_detail/BFfqK');?>" title="" class="hover-effect yellow middle-block animated" data-animation-type="fadeInUp" data-animation-duration="1" data-animation-delay="0.8">

				<img src="<?php echo base_url('image/img/places03.jpg');?>" alt="" /></a> </figure>

                <div class="details">

                  <h4 class="box-title">Malvadis<small>(Malvadis)</small></h4>

                  <a href="<?php echo base_url('index.php/home/package_detail/BFfqK');?>" title="" class="button">SEE ALL</a> </div>

              </article>

            </div>

          </div>

        </div>

        <div class="col-sm-6 image-container no-margin"> 

		<img src="<?php echo base_url('image/img/couple.png');?>" alt="" class="animated" data-animation-type="fadeInUp" data-animation-duration="2"> </div>

      </div>

    </div>

    <?php /*?><div class="features section global-map-area parallax" data-stellar-background-ratio="0.5">

      <div class="container">

        <div class="row image-box style7">

          <div class="col-sms-6 col-sm-6 col-md-3">

            <article class="box">

              <figure class="middle-block"> <img src="<?php echo base_url('assets/img/14.jpg');?>" alt="" class="middle-item" /> <span class="opacity-wrapper"></span> </figure>

              <div class="details">

                <h4><a href="#">Best Price Guarantee</a></h4>

                <p> Nunc cursus libero purus ac congue arcu cursus ut sed vitae pulvinar massa idporta nequetiam elerisque mi id faucibus iaculis vitae pulvinar. </p>

              </div>

            </article>

          </div>

          <div class="col-sms-6 col-sm-6 col-md-3">

            <article class="box">

              <figure class="middle-block"> <img src="<?php echo base_url('assets/img/21.jpg');?>" alt="" class="middle-item" /> <span class="opacity-wrapper"></span> </figure>

              <div class="details">

                <h4><a href="#">Travel Insurance</a></h4>

                <p> Nunc cursus libero purus ac congue arcu cursus ut sed vitae pulvinar massa idporta nequetiam elerisque mi id faucibus iaculis vitae pulvinar. </p>

              </div>

            </article>

          </div>

          <div class="col-sms-6 col-sm-6 col-md-3">

            <article class="box">

              <figure class="middle-block"> <img src="<?php echo base_url('assets/img/14.jpg');?>" alt="" class="middle-item" /> <span class="opacity-wrapper"></span> </figure>

              <div class="details">

                <h4><a href="#">Why Chose Us</a></h4>

                <p> Nunc cursus libero purus ac congue arcu cursus ut sed vitae pulvinar massa idporta nequetiam elerisque mi id faucibus iaculis vitae pulvinar. </p>

              </div>

            </article>

          </div>

          <div class="col-sms-6 col-sm-6 col-md-3">

            <article class="box">

              <figure class="middle-block"> <img src="<?php echo base_url('assets/img/41.jpg');?>" alt="" class="middle-item" /> <span class="opacity-wrapper"></span> </figure>

              <div class="details">

                <h4><a href="#">Need Help?</a></h4>

                <p> Nunc cursus libero purus ac congue arcu cursus ut sed vitae pulvinar massa idporta nequetiam elerisque mi id faucibus iaculis vitae pulvinar. </p>

              </div>

            </article>

          </div>

        </div>

      </div>

    </div><?php */?>

	



  </section>

  

  <!--	<div id="container">

    

    <div class="content">

      <h1><a href="http://ivan.ly/ui/" title="Pure CSS Progress Bar">Pure CSS Progress Bar</a></h1>

    </div>-->

    

    <!-- Progress bar -->

 <!--<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">

  <div class="modal-dialog modal-sm">

    <div class="modal-content">

     <div id="progress_bar" class="ui-progress-bar ui-container" style="display:none;">

     

	 <div class="ui-progress" style="width: 79%;">

        <span class="ui-label" style="display:none;">Processing <b class="value">79%</b></span>

      </div>

    </div>

    </div>

  </div>

</div>

    

    

  </div>--><!-- /Progress bar -->

  <!--footer bar open -->

  <?php include'footer.php';?>

  <!--footer bar Close -->

</div>

<script>



(function( $ ){

  // Simple wrapper around jQuery animate to simplify animating progress from your app

  // Inputs: Progress as a percent, Callback

  // TODO: Add options and jQuery UI support.



  $.fn.animateProgress = function(progress, callback) {    

    return this.each(function() {

      $(this).animate({

        width: progress+'%'

      }, {

        duration: 2000, 

        

        // swing or linear

        easing: 'swing',



        // this gets called every step of the animation, and updates the label

        step: function( progress ){

          var labelEl = $('.ui-label', this),

              valueEl = $('.value', labelEl);

          

          if (Math.ceil(progress) < 20 && $('.ui-label', this).is(":visible")) {

            labelEl.hide();

          }else{

            if (labelEl.is(":hidden")) {

              labelEl.fadeIn();

            };

          }

          

          if (Math.ceil(progress) == 100) {

            labelEl.text('Done');

            setTimeout(function() {

              labelEl.fadeOut();

            }, 1000);

          }else{

            valueEl.text(Math.ceil(progress) + '%');

          }

        },

        complete: function(scope, i, elem) {

          if (callback) {

            callback.call(this, i, elem );

          };

        }

      });

    });

  };

})( jQuery );



$(function() {

  // Hide the label at start

    $(".clickme").click(function(){

  $('#progress_bar').show();

   $('#progress_bar .ui-progress .ui-label').hide();

  // Set initial value

  $('#progress_bar .ui-progress').css('width', '7%');



  // Simulate some progress

  $('#progress_bar .ui-progress').animateProgress(43, function() {

    $(this).animateProgress(79, function() {

      setTimeout(function() {

        $('#progress_bar .ui-progress').animateProgress(100, function() {

          $('#main_content').slideDown();

          $('#fork_me').fadeIn();

        });

      }, 2000);

    });

  });

  

});



});


//autocomplete for flight city code
$("#source").autocomplete( {
    source: function(request,response) {
		console.log($('#Domestic2').is(':checked'));
        $.ajax ( {
          url: "http://easeyatra.com/yatra/index.php/flight/get_airport_code",
          data: {term: request.term,domestic:$('#Domestic2').is(':checked')},
 
          dataType: "json",
		   crossDomain: true,
          success: function(data) {           
			response( $.map( data.myData, function( item ) {
                return {
                    label: item.CITYAIRPORT,
                    value: item.CODE
                }
            }));
          } 
    }) }
 });
 
 $("#destination").autocomplete( {
    source: function(request,response) {
		console.log($('#Domestic2').is(':checked'));
        $.ajax ( {
          url: "<?php echo base_url('index.php/flight/get_airport_code');?>",
          data: {term: request.term,domestic:$('#Domestic2').is(':checked')},
          dataType: "json",
          success: function(data) {           
			response( $.map( data.myData, function( item ) {
                return {
                    label: item.CITYAIRPORT,
                    value: item.CODE
                }
            }));
          } 
    }) }
 });
 
 $("#hotel_city").autocomplete( {
    source: function(request,response) {
		//console.log($('#Domestic2').is(':checked'));
        $.ajax ( {
          url: "<?php echo base_url('index.php/hotel/get_city');?>",
          data: {term: request.term,domestic:$('#hotel_domestic').is(':checked')},
          dataType: "json",
          success: function(data) {           
			response( $.map( data.myData, function( item ) {
                return {
                    label: item.state,
                    value: item.state
                }
            }));
          } 
    }) }
 });
 
 $("#bus_origin").autocomplete( {	 
    source: function(request,response) {	
		 $("#bus_destination").replaceWith('<input type="text" name="Destination" disabled="disabled" id="bus_destination" required="required"  class="input-text full-width" placeholder="First choose  Origin" />');	
        $.ajax ( {
          url: "<?php echo base_url('index.php/bus/BusGetOrigin');?>",
          data: {term: request.term},
          dataType: "json",
          success: function(data) {           
			response( $.map( data.myData, function( item ) {
                return {
                    label: item.OriginId,
                    value: item.OriginName
                }
            }));
          } 
    }) },
	select: function(event, ui) {
						   $("#bus_origin_code").val(ui.item.value);						   
						 }
 });
 
 var lastSearch="";
 $("#bus_origin").blur(function(e) {
	 if(lastSearch==$("#bus_origin").val()){
		 return false;
	 }
	  $("#bus_destination").replaceWith('<input type="text" name="Destination" disabled="disabled" id="bus_destination" required="required"  class="input-text full-width" placeholder="Please Wait..." />');	
	 $.ajax ( {
          url: "<?php echo base_url('index.php/bus/BusGetDestination');?>",
          data: {term: $("#bus_origin").val()},
          dataType: "json",
          success: function(data) {
			     lastSearch=$("#bus_origin").val();
				  if(data==false){
					  alert("Sorry! no bus available from this origin");
					  $("#bus_destination")
		.replaceWith('<select  id="bus_destination" required="required" placeholder="chose diffrent origin..."  name="Destination" class="input-text full-width"><option value="">please chose diffrent origin</option></select>');
				  }else{
					  var optionss='';
					  $(data).each(function(index, element) {                       
					    optionss=optionss+'<option value="'+element.DestinationId+'">'+element.DestinationName+'</option>'
                    });
					$("#bus_destination")
		.replaceWith('<select onchange="$(\'#bus_destination_code\').val($(\'#bus_destination>option:selected\').text());" id="bus_destination" required="required"  name="Destination" class="input-text full-width"><option value=\'\'>--Select Destination--'+optionss+'</select>');
				  }
			  } 
    })
	
    
});
 
</script>

