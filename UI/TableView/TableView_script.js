
console.log("new")
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
    else {
      alert(`Multiple invalid field inputs`);
      console.log("CODE AFTER ALERT ENDS");
    }
    //if both blank
    
  });
});


//
// /
// /
// //
// /

// /
//
//
//
//


// Select the file input element
const fileInput = document.getElementById('csv-file');

// When the user selects a file
fileInput.addEventListener('change', () => {
  // Get the selected file
  const file = fileInput.files[0];

  // Check if the file is a CSV file
  if (!file || file.type !== 'text/csv') {
    alert('Please select a CSV file.');
    return;
  }

  // Call the loadCSV function to parse the file and create the table
  loadCSV(file);
});

// Function to parse CSV data and create an HTML table
function loadCSV(file) {
  // Create a new FileReader
  const reader = new FileReader();

  // When the FileReader finishes loading the file
  reader.addEventListener('load', () => {
    // Parse the CSV data
    const rows = reader.result.split('\n').map(row => row.split(','));

    // Create the HTML table
    const table = document.createElement('table');
    table.classList.add('table', 'table-striped');

    // Create the table header
    const thead = document.createElement('thead');
    const headerRow = document.createElement('tr');
    rows[0].forEach(header => {
      const th = document.createElement('th');
      th.textContent = header;
      headerRow.appendChild(th);
    });
    thead.appendChild(headerRow);
    table.appendChild(thead);

    // Create the table body
    const tbody = document.createElement('tbody');
    rows.slice(1).forEach(rowData => {
      const row = document.createElement('tr');
      rowData.forEach(cellData => {
        const cell = document.createElement('td');
        cell.textContent = cellData;
        row.appendChild(cell);
      });
      tbody.appendChild(row);
    });
    table.appendChild(tbody);

    // Replace the existing content with the new table
    const contentDiv = document.getElementById('content');
    contentDiv.innerHTML = ''; 
    contentDiv.classList.remove('d-none');
    contentDiv.appendChild(table);
  });

  // Handle errors during file reading
  reader.addEventListener('error', () => {
    alert('Error reading the file. Please try again.');
  });

  // Read the file as text
  try {
    reader.readAsText(file);
  } catch (err) {
    alert('Error reading the file. Please try again.');
  }
}
