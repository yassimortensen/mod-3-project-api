document.addEventListener('DOMContentLoaded', function(){


  fetch('http://localhost:3000/api/v1/users/').then(req=>req.json()).then(json=>populateUser(json))

  let user = document.getElementById('user')
  let headerContent1 = document.getElementById('headerContent1')
  let headerContent2 = document.getElementById('headerContent2')
  let bodyContent1 = document.getElementById('bodyContent1')
  let bodyContent2 = document.getElementById('bodyContent2')
  let button1 = document.getElementById('button1')
  let button2 = document.getElementById('button2')

  const populateUser = json => {
    user.innerHTML = `<li>Welcome, ${json[0]['name']}, or should I call you ${json[0]['characterName']}?</li>`
  }

})
