
document.addEventListener('DOMContentLoaded', () => {
  const toggleBtn = document.querySelector('#toggleBtn');
  const body = document.querySelector('body');

  toggleBtn.addEventListener('click', () => {
    body.classList.toggle('bg-dark');
    body.classList.toggle('text-white');
    if (toggleBtn.innerHTML === 'Dark Mode') {
      toggleBtn.innerHTML = 'Light Mode';
    } else {
      toggleBtn.innerHTML = 'Dark Mode';
    }
  });

  // get the form element
  const form = document.getElementById('database-form');

  // add a submit event listener to the form
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    // get the input fields
    const database1 = document.getElementById('database1').value;
    const database2 = document.getElementById('database2').value; 
    
   
    // check if both database1 and database2 are filled
    if (database1 && database2) {
      alert(`2: ${database1} and ${database2}`);
      console.log("CODE AFTER ALERT ENDS");
    }
     // check if only database1 is filled
    else if (database1) {
      alert(`1: ${database1}`);
      console.log("CODE AFTER ALERT ENDS");
    }
    //if both blank
    

  });
});
