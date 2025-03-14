<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>QR Code Verification</title>
    <link rel="stylesheet" href="styles.css" />
  </head>
  <style>
    /* Background Styling */
    body {
      background-image: url("https://images01.nicepage.com/c461c07a441a5d220e8feb1a/c77a5184c87552b6a3238666/rt-min.jpg");

      margin: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      /* background: white; */
      overflow: hidden;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      height: 100vh;
      position: relative;
    }

    .card {
      background: rgba(255, 255, 255, 0.5);
      backdrop-filter: blur(20px);
      padding: 30px;
      padding-top: 90px;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 20vw;
      height: 65vh;
      padding-bottom: 34px;
    }

    h2 {
      margin: 0;
      font-size: 22px;
      color: #333;
      margin-bottom: 22px;
    }

    p {
      font-size: 14px;
      color: #555;
      margin: 10px 0;
    }

    .qr-box {
      background: white;
      padding: 10px;
      display: inline-block;
      border-radius: 10px;
      margin-bottom: 0px;
    }

    .qr-box img {
      width: 160px;
      cursor: pointer;
      /* height: 120px; */
    }


    /* Input Field */
    .input-box {
      display: flex;
      align-items: center;
      background: white;
      border-radius: 8px;
      padding: 5px;
      margin-top: 10px;
    }

    .input-box input {
      border: none;
      outline: none;
      width: 100%;
      padding: 8px;
      font-size: 14px;
    }

    /* Continue Button */
    .continue-btn {
      background: royalblue;
      color: white;
      border: none;
      padding: 10px;
      font-size: 16px;
      width: 100%;
      border-radius: 8px;
      margin-top: 15px;
      cursor: pointer;
    }

    .continue-btn:hover {
      background: darkblue;
    }
  </style>
  <body>
    <div class="circle circle1"></div>
    <div class="circle circle2"></div>
    <div class="circle circle3"></div>
    <div class="container">
      <div class="card">
        <h2>Generate QR Code</h2>
        <div class="qr-box">
          <img
          	onclick = "downloadImage()"
          	id = "image"
            src=${url }
            alt="QR Code"
          />
        </div>
          <p>Click QR to Download</p>
        
        <form action="QrCodeGenerator" method="post">
          <div class="input-box">
            <input type="text" placeholder="Enter Text Here" name="inputText" />
          </div>
          <button type="submit" class="continue-btn">Generate</button>
        </form>
      </div>
    </div>
<script>
    function downloadImage() {
        const image = document.getElementById("image").src;

        fetch(image)
            .then(response => response.blob())
            .then(blob => {
                const blobURL = URL.createObjectURL(blob);
                const anchor = document.createElement("a");
                anchor.href = blobURL;
                anchor.download = "downloaded-image.jpg"; 
                document.body.appendChild(anchor);
                anchor.click();
                document.body.removeChild(anchor);
                URL.revokeObjectURL(blobURL);
            })
            .catch(error => console.error("Error downloading image:", error));
    }
</script>


  </body>

</html>
