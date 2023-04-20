document.addEventListener("DOMContentLoaded", () => {
  const toggleBtn = document.querySelector("#toggleBtn");
  const body = document.querySelector("body");
  const nav = document.querySelector("nav");
  const foot = document.querySelector("footer");
  const footText = document.querySelector("#foottext");

  toggleBtn.addEventListener("click", () => {
    body.classList.toggle("bg-secondary");
    body.classList.toggle("text-white");
    nav.classList.toggle("bg-dark");
    foot.classList.toggle("bg-dark");
    footText.classList.toggle("text-secondary");

    if (toggleBtn.innerHTML === "Dark Mode") {
      toggleBtn.innerHTML = "Light Mode";
    } else {
      toggleBtn.innerHTML = "Dark Mode";
    }
  });

  // get the form element
  const form1 = document.getElementById("server-form-1");

  // add a submit event listener to the form
  form1.addEventListener("submit", (e) => {
    e.preventDefault();

    // get the input fields
    const serverName1 = document.getElementById("serverName1").value;
    const databaseName1 = document.getElementById("databaseName1").value;
    const portNumber1 = document.getElementById("portNumber1").value;
    const username1 = document.getElementById("username1").value;
    const password1 = document.getElementById("password1").value;
    //const database1 = document.getElementById("database1").value;
    //const database2 = document.getElementById("database2").value;

    if (serverName1 == "Choose...") {
      alert(`Please Select Server`);
      console.log("CODE AFTER ALERT ENDS");
    }

    // check if are filled
    else if (
      username1 &&
      password1 &&
      portNumber1 &&
      databaseName1 &&
      serverName1
    ) {
      /*alert(
      `Inputs: 
      \n${username1 }
      \n${password1 }
      \n${portNumber }
      \n${databasename }
      \n${serverName1 }`
      );*/
      console.log("CODE AFTER ALERT ENDS");
      // disable button
      $("#btn1").prop("disabled", true);
      // add spinner to button
      $("#btn1").html(
        `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...`
      );
    }
    /*
    if (database1 && database2) {
      //alert(`\n2: ${database1} and ${database2}`);
      console.log("CODE AFTER ALERT ENDS");
    }
    // check if only database1 is filled
    else if (database1) {
      //alert(`\n1: ${database1}`);
      console.log("CODE AFTER ALERT ENDS");
    }*/
  });
  // form 1 js ends

  //
  // form 2 js begins:

  //

  // get the form element
  const form2 = document.getElementById("server-form-2");

  // add a submit event listener to the form
  form2.addEventListener("submit", (e) => {
    e.preventDefault();

    // get the input fields
    const serverName2 = document.getElementById("serverName2").value;
    const databaseName2 = document.getElementById("databaseName2").value;
    const portNumber2 = document.getElementById("portNumber2").value;
    const username2 = document.getElementById("username2").value;
    const password2 = document.getElementById("password2").value;

    if (serverName2 == "Choose...") {
      alert(`Please Select Server`);
      console.log("CODE AFTER ALERT ENDS");
    }

    // check if are filled
    // check if are filled
    else if (
      username2 &&
      password2 &&
      portNumber2 &&
      databaseName2 &&
      serverName2
    ) {
      /*alert(
      `Inputs: 
      \n${username1 }
      \n${password1 }
      \n${portNumber }
      \n${databasename }
      \n${serverName1 }`
      );*/
      console.log("CODE AFTER ALERT ENDS");
      // disable button
      $("#btn2").prop("disabled", true);
      // add spinner to button
      $("#btn2").html(
        `<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...`
      );
    }
  });
});
