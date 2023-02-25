function setUpBackend() {
  const scriptURL = '/savematch'
  const form = document.querySelector('#scoutingForm')
  const btn = document.querySelector('#submit')

  
  form.addEventListener('submit', e => {
    e.preventDefault()
    btn.disabled = true
    btn.innerHTML = "Sending..."

    let fd = getData(false)
    var object = {};
    fd.forEach((value, key) => object[key] = value);
    var data = JSON.stringify(object);

    fetch(scriptURL,
    {
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        method: "POST",
        body: data
    })
      .then(response => { 
            alert('Success!', response) })
      .catch(error => {
            alert('Error!', error.message)})

    btn.disabled = false
    btn.innerHTML = "Send to Server"
  })
}
