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
// 


// Select the file input element
const fileInput = document.getElementById('csv-file1');

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
  loadCSV1(file);
});

// Function to parse CSV data and create an HTML table
function loadCSV1(file) {
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
    const contentDiv = document.getElementById('content1');
    contentDiv.innerHTML = ''; 
    contentDiv.classList.remove('d-none');
    contentDiv.appendChild(table);
    console.log(reader.result);
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




//content 2


//
// /
// 


// Select the file input element
const fileInput2 = document.getElementById('csv-file2');

// When the user selects a file
fileInput2.addEventListener('change', () => {
  // Get the selected file
  const file2 = fileInput2.files[0];

  // Check if the file is a CSV file
  if (!file2 || file2.type !== 'text/csv') {
    alert('Please select a CSV file.');
    return;
  }

  // Call the loadCSV function to parse the file and create the table
  loadCSV2(file2);
});

// Function to parse CSV data and create an HTML table
function loadCSV2(file2) {
  console.log("CALLED 2") //is being called
  // Create a new FileReader
  const reader2 = new FileReader();

  // When the FileReader finishes loading the file
  reader2.addEventListener('load', () => {
    // Parse the CSV data
    const rows2 = reader2.result.split('\n').map(row => row.split(','));

    // Create the HTML table
    const table2 = document.createElement('table');
    table2.classList.add('table', 'table-striped','bg-light');
    
    
    // Create the table header
    const thead2 = document.createElement('thead');
    thead2.classList.add('thead-dark');
    const headerRow2 = document.createElement('tr');
    rows2[0].forEach(header => {
      const th2 = document.createElement('th');
      th2.textContent = header;
      headerRow2.appendChild(th2);
    });
    thead2.appendChild(headerRow2);
    table2.appendChild(thead2);

    // Create the table body
    const tbody2 = document.createElement('tbody');
    tbody2.setAttribute('id','table-row-2');
    rows2.slice(1).forEach(rowData => {
      const row2 = document.createElement('tr');
      rowData.forEach(cellData => {
        const cell2 = document.createElement('td');
        cell2.textContent = cellData;
        row2.appendChild(cell2);
      });
      tbody2.appendChild(row2);
    });
    table2.appendChild(tbody2);

    // Replace the existing content with the new table
    const contentDiv2 = document.getElementById('content2');
    contentDiv2.innerHTML = ''; 
    contentDiv2.classList.remove('d-none');
    contentDiv2.appendChild(table2);
    console.log(reader2.result);
  });

  // Handle errors during file reading
  reader2.addEventListener('error', () => {
    alert('Error during reading the file. Please try again.');
  });

  // Read the file as text
  try {
    reader2.readAsText(file2);
  } catch (err) {
    alert('Cant read as text, Error reading the file. Please try again.');
  }
}
