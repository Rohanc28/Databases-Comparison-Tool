
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



function loadCSV(file) {
  console.log("CALLED CSV");
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






// EXCEL FILE


// Function to parse Excel data and create an HTML table
function loadExcel(file) {
  console.log("CALLED EXCEL"); //is being called
  
  // Create a new FileReader
  const reader = new FileReader();

  // When the FileReader finishes loading the file
  reader.addEventListener('load', () => {
    // Parse the Excel data using SheetJS library
    const workbook = XLSX.read(reader.result, { type: 'binary' });
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const rows = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

    // Create the HTML table
    const table = document.createElement('table');
    table.classList.add('table', 'table-striped', 'bg-light');

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
    tbody.setAttribute('id', 'table-row');
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
  });

  // Handle errors during file reading
  reader.addEventListener('error', () => {
    alert('Error during reading the file. Please try again.');
  });

  // Read the file as binary string
  try {
    reader.readAsBinaryString(file);
  } catch (err) {
    alert('Error reading the file. Please try again.');
  }
}




//content 2


//
// /
// 


// Select the file input element
const fileInput2 = document.getElementById('file-input2');

// When the user selects a file
fileInput2.addEventListener('change', () => {
  // Get the selected file
  const file = fileInput2.files[0];

  // Check if the file is a CSV or Excel file
  if (!file || (file.type !== 'text/csv' && file.type !== 'application/vnd.ms-excel' && file.type !== 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')) {
    alert('Please select a CSV or Excel file.');
    return;
  }

  // Call the appropriate function to parse the file and create the table
  if (file.type === 'text/csv') {
    loadCSV2(file);
  } else if (file.type === 'application/vnd.ms-excel' || file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet') {
    loadExcel2(file);
  } else {
    alert('Unsupported file type.');
  }
});







// CSV FILE



function loadCSV2(file) {
  console.log("CALLED CSV");
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
    const contentDiv = document.getElementById('content2');
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






// EXCEL FILE


// Function to parse Excel data and create an HTML table
function loadExcel2(file) {
  console.log("CALLED EXCEL"); //is being called
  
  // Create a new FileReader
  const reader = new FileReader();

  // When the FileReader finishes loading the file
  reader.addEventListener('load', () => {
    // Parse the Excel data using SheetJS library
    const workbook = XLSX.read(reader.result, { type: 'binary' });
    const sheetName = workbook.SheetNames[0];
    const worksheet = workbook.Sheets[sheetName];
    const rows = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

    // Create the HTML table
    const table = document.createElement('table');
    table.classList.add('table', 'table-striped', 'bg-light');

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
    tbody.setAttribute('id', 'table-row');
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
    const contentDiv = document.getElementById('content2');
    contentDiv.innerHTML = '';
    contentDiv.classList.remove('d-none');
    contentDiv.appendChild(table);
  });

  // Handle errors during file reading
  reader.addEventListener('error', () => {
    alert('Error during reading the file. Please try again.');
  });

  // Read the file as binary string
  try {
    reader.readAsBinaryString(file);
  } catch (err) {
    alert('Error reading the file. Please try again.');
  }
}
