$( document ).ready(function() {
 
  $(".flexnav").flexNav({
  'animationSpeed':     400,            // default for drop down animation speed
  'transitionOpacity':  true,           // default for opacity animation
  'buttonSelector':     '.menu-button', // default menu button class name
  'hoverIntent':        false,          // Change to true for use with hoverIntent plugin
  'hoverIntentTimeout': 150,            // hoverIntent default timeout
  'calcItemWidths':     false,          // dynamically calcs top level nav item widths
  'hover':              true            // would you like hover support?      
});

    
});