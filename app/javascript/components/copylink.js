function copyLink() {
  const button = document.querySelector("#copybtn");
  button.addEventListener('click', function (){
    const copyText = document.querySelector("#myInput");
    copyText.select();
    copyText.setSelectionRange(0, 99999);
    document.execCommand("copy");
  })
}

export {copyLink};
