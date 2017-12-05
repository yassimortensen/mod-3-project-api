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

  fetch('http://localhost:3000/api/v1/story_stages/').then(req=>req.json()).then(json=>populateStoryStage(json))

  const populateStoryStage = json => {
    headerContent1.innerHTML = `<h1>${json[2]['description']}</h1>`
    headerContent2.innerHTML = `<h1>${json[3]['description']}</h1>`
    headerContent3.innerHTML = `<h1>${json[4]['description']}</h1>`
    bodyContent1.innerHTML = `<p>${json[2]['body']}</p>`
    bodyContent2.innerHTML = `<p>${json[3]['body']}</p>`
    bodyContent3.innerHTML = `<p>${json[4]['body']}</p>`
    button1.innerText = `${json[2]['button']}`
    button2.innerText = `${json[3]['button']}`
    button3.innerText = `${json[4]['button']}`
  }



})
