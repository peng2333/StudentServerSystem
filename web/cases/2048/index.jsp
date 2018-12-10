<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>2048</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  
      <link rel="stylesheet" href="${pageContext.request.contextPath}/cases/2048/css/style.css">

  
</head>

<body>
<div class="container">
  <div class="scores">
    <div class="score-container best-score">
      best:
      <div class="score">
        <div id="bestScore">0</div>
      </div>
    </div>
    <div class="score-container">
      score:
      <div class="score">
        <div id="score">0</div>
        <div class="add" id="add"></div>
      </div>
    </div>
  </div>
  <div class="game">
    <div id="tile-container" class="tile-container"></div>
    <div class="end" id="end">Game Over<div class="monkey">🙈</div><button class="btn not-recommended__item js-restart-btn" id="try-again">Try Again</button></div>
  </div>
  
  <div class="not-recommended">
    <button class="btn not-recommended__item js-restart-btn" id="restart">Restart Game</button>
    <span class="not-recommended__annotation"></span>
  </div>
  
<%--</div>--%>
  
    <script src="${pageContext.request.contextPath}/cases/2048/js/index.js"></script>

</body>
</html>
