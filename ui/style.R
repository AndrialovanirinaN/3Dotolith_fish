# style for footer
tags$style(tags$link(rel = "stylesheet", href = "https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap"),
           HTML("
    
    /* Lock navbar on top */
    .navbar {
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 9999;
      border: 0px;
    }

    /* Adds a space so that the content does not go under the navbar */
    body {
      padding-top: 70px; /* Adjust to the height of your navbar */
    }
  
    .footer-logos {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      margin-top: 50px;
      padding-bottom: 30px;
      gap: 30px;
      transition: all 0.3s ease-in-out;
    }
  
    .footer-logos img {
      height: auto;
      max-height: 60px;
      max-width: 120px;
      width: auto;
      transition: transform 0.3s ease, max-width 0.3s ease, max-height 0.3s ease;
    }
  
    /* Responsive for small screens */
    @media (max-width: 600px) {
      .footer-logos {
        flex-direction: column;
        gap: 20px;
      }
  
      .footer-logos img {
        max-width: 90px;
        max-height: 50px;
      }
    }
    
    .footer-copyright {
    text-align: center;
    padding: 10px 0;
    font-size: 12px;
    color: #777;
    }
    
    #viewer-container {
    width: 100%;
    height: 450px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    }
    
    .correct {
    color: green;
    font-weight: bold;
    }
    
    .wrong {
    color: red;
    font-weight: bold;
    }
    
    .btn {
    margin-top: 5px;
    margin-right: 5px;
    }
    
    
"))