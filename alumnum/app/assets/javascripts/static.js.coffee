# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$("#status").dataTable
	sPaginationType: "full_numbers"


jQuery ->
  data =[
    {
        value: $("#s0c").text(),
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: $("#s0q").text()
    },
    {
        value: $("#s1c").text(),
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: $("#s1q").text()
    },
    {
        value: $("#s2c").text(),
        color: "#FDB45C",
        highlight: "#FFC870",
        label: $("#s2q").text()
    },
    {
        value: $("#s3c").text(),
        color: "#FF005C",
        highlight: "#FFC870",
        label: $("#s3q").text()
    },
    {
        value: $("#s4c").text(),
        color: "#FDB4ff",
        highlight: "#FFC870",
        label: $("#s4q").text()
    },
    {
        value: $("#s5c").text(),
        color: "lightskyblue",
        highlight: "#FFC870",
        label: $("#s5q").text()
    }
]

  myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Pie(data)