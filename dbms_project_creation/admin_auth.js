function loginToAdmin() {
    const adminID = document.querySelector('input[placeholder="Enter Admin ID"]').value.trim();
    const pass = document.querySelector('input[placeholder="Enter Password"]').value.trim();
    const key = document.querySelector('input[placeholder="Unique Access Key"]').value.trim();

    if (adminID === "admin" && pass === "1234" && key === "999") {
        window.location.href = "admin_dashboard.html"; 
    } else {
        alert("Verification Failed!");
    }
}