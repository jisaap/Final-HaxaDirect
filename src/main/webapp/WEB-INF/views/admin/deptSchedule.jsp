<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

	<link  rel='stylesheet'  href='${path}/resources/css/fullcalendar.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/daygrid.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/timegrid.css'  />  
	<script src='${path}/resources/js/moment.min.js'></script>  
	<script src='${path}/resources/js/fullcalendar.min.js'></script>
	<script src='${path}/resources/js/interaction.js'></script>
	<script src='${path}/resources/js/daygrid.js'></script>
	<script src='${path}/resources/js/timegrid.js'></script>
	<script src='${path}/resources/js/ko.js'></script>
            
 
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
    	  var Calendar = FullCalendar.Calendar;
    	 
    	  var containerEl = document.getElementById('external-events');
    	  var calendarEl = document.getElementById('calendar');
    	  var checkbox = document.getElementById('drop-remove');
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        defaultView: 'dayGridMonth',
        defaultDate: new Date(),
        header: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
         editable: true,

          locale: 'ko',
          selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
          selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
          // 선택했을때 함수
          select: function(data) {            
           let end = moment(new Date(moment(data.endStr, "YYYY-MM-DD").subtract(1, 'days').toDate())).format('YYYY-MM-DD');
           $(".modalCal").modal("show");
           $(".modal-backdrop").css("display","block");
           $('.modal-content').css('display','block');
            $(".modalCal")
              .find("#title")
              .val("");
            $(".modalCal")
              .find("#starts-at")
              .val(data.startStr);
            $(".modalCal")
              .find("#ends-at")
              .val(end);
            $("#save-event").show();
            $("input").prop("readonly", false);
          },
        });//calendar종료
 $(function(){
    calendar.render();
    $.ajax({
            url: '${pageContext.request.contextPath}/getCalendar.hd',
            type: 'post',
            //인포 찾기

            data: {"start": moment(new Date(calendar.state.dateProfile.activeRange.start)).format('YYYY-MM-DD'),
                    "end": moment(new Date(calendar.state.dateProfile.activeRange.end)).format('YYYY-MM-DD')},
            success: function(data) {
              if(data != null) {
                  $.each(data, function(key, items) {
                    $.each(items,function(index, item) {
                      let depCode = "${sessionScope.loginMember.deptCode }";
                      let flag = depCode == item['deptCode']?"#FF6666":null;
                          let setData = {
                              "title" : item['planName'],
                              "color" : flag,
                              "groupId":item['deptCode'],
                              "start" : moment(new Date(item['stDate'])).format('YYYY-MM-DD'),
                              "end" : moment(new Date(item['enDate'])).format('YYYY-MM-DD'),
                          };
                              console.log(setData);
                          calendar.addEvent(setData);
                    })
                  }) 
                //just to give a visual on the data. From what you were doing in your example it looks like your data is already in a format suitable to be used by fullCalendar, so no need to push it all into another array
              }
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
              alert("Error when fetching events: " + textStatus + " - " + errorThrown);
            }
        });
   
      });
        });  
    
        // 모달창 close 하는 함수
        $(function(){
          $(".btn-default").click(function(){
            $(".modal-content").css("display","none");
            $(".modal-backdrop").css("display","none");

          });
        }); 

        $(function(){
          $(".closeCal").click(function(){
            $(".modal-content").css("display","none");
            $(".modal-backdrop").css("display","none");

          });
        });
        

        function insertPlan() {
          let start = $('#starts-at').val();
          let end = $('#ends-at').val();
          let title = $('#title').val();
          location.href='${pageContext.request.contextPath}/insertPlan.hd?start='+start+'&end='+end+'&title='+title+'';
        }

     
</script>
<style>
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
 
  #external-events {
    position: fixed;
    /* z-index: 2; */
    top: 300px;
    left: 240px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
  }
 
  #calendar-container {
    position: relative;
    /* z-index: 1; */
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }

  /* 여기부터 모달 */
  #wrap {
  width: 1100px;
  margin: 0 auto;
}


input {
  width: 50%;
}

input[type="text"][readonly] {
  border: 2px solid rgba(0, 0, 0, 0);
}

/*info btn*/
.dropbtn {
  /*background-color: #4CAF50;*/
  background-color: #eee;
  margin: 10px;
  padding: 8px 16px 8px 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  left: 50%;
  background-color: #f1f1f1;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 5;
  margin-left: 100px;
  margin-top: -300px;
}


.dropdown-content p {
  color: black;
  padding: 4px 4px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: grey;
}

.dropdown:hover .dropbtn span {
  color: white;
}

.modal-content {
  display: none;
  position: absolute !important;
  width: 400px !important;
  top: -700px !important;
  left: 11.5% !important;
  z-index: 9999 !important;
}

.form-control{
  display: inline-block !important;
  width: 250px !important;
  /* float: left; */
}

.col-xs-4 {
  margin-left: 25px;
  width: 80px;
}

/* closrCal */
.closeCal {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            border-radius: 5px;
            position: absolute;
            top: 5%;
            right: 5%;
        }
        .closeCal:hover,
        .closeCal:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

</style>

		<div class="main-panel">
      <div class="content-wrapper">
        
        <div class='card card-body'>
          
<div id='calendar'></div>


<div id='calendar'></div>

<div id='datepicker'></div>

<div class="modalCal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <span class="closeCal" aria-hidden="true">&times;</span>
        <h4><input class="modal-title form-control" type="text" name="title" id="title" placeholder="Event Title/Description" /></h4>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-xs-12">
            <label class="col-xs-4" for="starts-at">시작일</label>
            <input type="text" name="starts_at" id="starts-at" class='form-control' />
          </div>
        </div>
        <br>
        <div class="row">
          <div class="col-xs-12">
            <label class="col-xs-4" for="ends-at">종료일</label>
            <input type="text" name="ends_at" id="ends-at" class="form-control" />
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modalCal">Close</button>
        <button type="button" class="btn btn-primary" id="save-event" onclick="insertPlan();">Save</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->



    </div>
    

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>