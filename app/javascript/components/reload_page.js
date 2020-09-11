function reload() {
  window.reload = setTimeout(function(){
   window.location.reload(1);
}, 20000);
  console.log("hello")
}

export { reload };
