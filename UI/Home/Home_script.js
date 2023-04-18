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
})



//
// /
// 



// Select the file input element
const fileInput = document.getElementById('file-input1');

// When the user selects a file
fileInput.addEventListener('change', () => {
  // Get the selected file
  const file = fileInput.files[0];

  // Check if the file is a CSV or Excel file
  if (!file || (file.type !== 'text/csv' && file.type !== 'application/vnd.ms-excel' && file.type !== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
    alert('Please select a CSV or Excel file.');
    return;
  }

  // Call the appropriate function to parse the file and create the table
  if (file.type === 'text/csv') {
    loadCSV(file);
  } else if (file.type === 'application/vnd.ms-excel' || file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
    loadExcel(file);
  } else {
    alert('Unsupported file type.');
  }
});



// CSV FILE

//
//
//
