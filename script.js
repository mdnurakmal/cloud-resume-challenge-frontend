
// api url
const api_url = 
      "https://increment.oneclicklaunch.com";
  
// Defining async function
async function getapi(url) {
    
    // Storing response
    const response = await fetch(url)
    
    // Storing data in form of JSON
    var data = await response.json();
    console.log(data);
    if (response) {
        hideloader();
    }
    show(data);
}
// Calling that async function
getapi(api_url);
  
// Function to hide the loader
function hideloader() {
    document.getElementById('loading').style.display = 'none';
}
// Function to define innerHTML for HTML table
function show(data) {

    let tab = 
        `<tr>
          <th>Name</th>
         </tr>`;
`<tr> 
    <td>${data.count}</td>     
</tr>`;

    // Setting innerHTML as tab variable
    document.getElementById("employees").innerHTML = tab;
}