/*
 * Play with this code and it'll update in the panel opposite.
 *
 * Why not try some of the options above?
 */
$(document).ready(function(){
  Morris.Donut({
    element: 'donut-example',
    data: [
      {label: "Constancias", value: 12},
      {label: "Certificados", value: 9},
      {label: "Extras", value: 20}
    ]
  });
});
