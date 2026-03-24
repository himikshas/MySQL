function toggleSalary() {
    let category = document.querySelector('input[name="category"]:checked');

    if (category && category.value === "professional") {
        document.getElementById("salaryDiv").style.display = "block";
    } else {
        document.getElementById("salaryDiv").style.display = "none";
    }
}
function validateForm() {
    
     // Name check
    if (!document.getElementById('name').value.trim()) {
        alert("Name is required");
        return false;
    }

     // Email check
    if (!document.getElementById('email').value.includes('@')) {
        alert("Valid email required");
        return false;
    }
    

    // PASSWORD CHECK
    var password = document.getElementById('password').value;

    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,}$/;

    if (!passwordRegex.test(password)) {
        alert("Password must contain:\n- At least 8 characters\n- One Uppercase letter\n- One Lowercase letter\n- One Special character\n- No spaces");
        return false;
    }

    // CONFIRM PASSWORD CHECK
    if (document.getElementById('confirm_password').value !== password) {
        alert("Passwords must match");
        return false;
    }

    // CATEGORY CHECK
    var studentRadio = document.getElementById('student');
    var professionalRadio = document.getElementById('professional');

    if (!studentRadio.checked && !professionalRadio.checked) {
        alert("Select student or professional");
        return false;
    }

    // DOB & AGE CHECK
    var dobInput = document.getElementById('date').value;

    if (!dobInput) {
        alert("Please enter Date of Birth");
        return false;
    }

    var dob = new Date(dobInput);
    var today = new Date();
    var age = today.getFullYear() - dob.getFullYear();
    var monthDiff = today.getMonth() - dob.getMonth();

    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
        age--;
    }

    // Student age condition
    if (studentRadio.checked && age >= 25) {
        alert("Registration denied: Students must be under 25 years of age");
        return false;
    }

    // State check
    if (!document.getElementById('state').value) {
        alert("Choose a valid state");
        return false;
    }

    // Terms check
    if (!document.getElementById('terms').checked) {
        alert("You must agree to the Terms");
        return false;
    }

    alert("Form submitted successfully!");
    return false;
}
