console.log("new")
document.addEventListener('DOMContentLoaded', () => {
  const toggleBtn = document.querySelector('#toggleBtn');
  const body = document.querySelector('body');
  const nav = document.querySelector('nav');
  const foot = document.querySelector('footer');
  const footText = document.querySelector('#foottext');
  //const tableView= document.querySelector('#table-row');
  
  
  toggleBtn.addEventListener('click', () => {
    body.classList.toggle('bg-secondary');
    body.classList.toggle('text-white');
    nav.classList.toggle('bg-dark');
    foot.classList.toggle('bg-dark');
    footText.classList.toggle('text-secondary');
    //tableView.classList.toggle('table-dark');
    
    if (toggleBtn.innerHTML === 'Dark Mode') {
      toggleBtn.innerHTML = 'Light Mode';
    } else {
      toggleBtn.innerHTML = 'Dark Mode';
    }
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
    table.classList.add('table', 'table-striped','bg-light');
    

    // Create the table header
    const thead = document.createElement('thead');
    thead.classList.add('thead-dark');
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
    tbody.setAttribute('id','table-row');
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
