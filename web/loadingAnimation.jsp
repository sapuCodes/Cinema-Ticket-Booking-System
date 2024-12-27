<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    /* styles.css */

/* Full-screen loader */
#loading-screen {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

/* Loader animation */
.loader {
    border: 8px solid #f3f3f3; /* Light grey */
    border-top: 8px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

        </style>
        </head>
        <body>
            <div id="loading-screen">
            <div class="loader"></div>
        </div>
        </body>
        <script>
                window.onload = function () {
    // Hide the loading screen
    document.getElementById("loading-screen").style.display = "none";
    // Show the main content
    document.getElementById("main-content").style.display = "block";
};
</script>
</html>
