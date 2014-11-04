function postControl(throttle, steering){
  var controlData = {
    "throttle": throttle,
    "steering": steering
  };
  $.ajax({
    url: "/api/control",
    type: "POST",
    dataType: "json",
    contentType: "application/json",
    data: JSON.stringify(controlData),
    async: false,
  });

}