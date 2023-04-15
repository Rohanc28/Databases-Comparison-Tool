document.addEventListener('DOMContentLoaded', () => {
  const toggleBtn = document.querySelector('#toggleBtn');
  const body = document.querySelector('body');
  const nav = document.querySelector('nav');
  const foot = document.querySelector('footer');
  const footText = document.querySelector('#foottext');
  
  toggleBtn.addEventListener('click', () => {
    body.classList.toggle('bg-secondary');
    body.classList.toggle('text-white');
    nav.classList.toggle('bg-dark');
    foot.classList.toggle('bg-dark');
    footText.classList.toggle('text-secondary');
    
    if (toggleBtn.innerHTML === 'Dark Mode') {
      toggleBtn.innerHTML = 'Light Mode';
    } else {
      toggleBtn.innerHTML = 'Dark Mode';
    }
  });
  
  // get the form element
  const form = document.getElementById('server-form');
  
 // add a submit event listener to the form
  form.addEventListener('submit', (e) => {
    e.preventDefault();
    
    // get the input fields
    const serverName = document.getElementById('serverName').value;
    const databaseName = document.getElementById('databaseName').value;
    const username = document.getElementById('userName').value;
    const password = document.getElementById('password').value;
    
    
    // check if both database1 and database2 are filled
    if (username && password && databaseName && serverName) {
      alert(`Inputs: \n${serverName} \n${databaseName} \n${username} \n${password}`);
      console.log("CODE AFTER ALERT ENDS");
    }
     // check if only database1 is filled
    else {
      alert(`Multiple invalid field inputs`);
      console.log("CODE AFTER ALERT ENDS");
    }
    //if both blank
    

  });
});
