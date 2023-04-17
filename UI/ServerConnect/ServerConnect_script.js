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
  const form = document.getElementById("server-form");

  // add a submit event listener to the form
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    // get the input fields
    const serverName = document.getElementById("serverName").value;
    const databaseName = document.getElementById("databaseName").value;
    const username = document.getElementById("userName").value;
    const password = document.getElementById("password").value;
    const database1 = document.getElementById("database1").value;
    const database2 = document.getElementById("database2").value;

    if (serverName == "Choose...") {
      alert(`Please Select Server`);
      console.log("CODE AFTER ALERT ENDS");
    }

    // check if are filled
    else if (
      username &&
      password &&
      databaseName &&
      serverName &&
      (database1 || (database1 && database2))
    ) {
      alert(
        `Inputs: \n${serverName} \n${databaseName} \n${username} \n${password}`
      );
      console.log("CODE AFTER ALERT ENDS");
    }

    if (database1 && database2) {
      //alert(`\n2: ${database1} and ${database2}`);
      console.log("CODE AFTER ALERT ENDS");
    }
    // check if only database1 is filled
    else if (database1) {
      //alert(`\n1: ${database1}`);
      console.log("CODE AFTER ALERT ENDS");
    }
  });

  // check if both database1 and database2 are filled

  //if both blank
});
