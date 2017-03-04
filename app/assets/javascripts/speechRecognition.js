
// active with button click

$(document).ready(function() {
  window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
  const recognition = new SpeechRecognition();
  recognition.interimResults = true;

  let p = ''
  let words = document.querySelector('#messageArea');
  words.innerHTML += p 
  recognition.addEventListener('result', e => {
    const transcript = Array.from(e.results)
      .map(result => result[0])
      .map(result => result.transcript)
      .join('')

    p.textContent = transcript;
    if (e.results[0].isFinal) {
      p = ''
      words.innerHTML = p 
    }
    console.log(transcript)
    words.innerHTML += transcript
    // now replacing the text in the message area, rather than addending
      // requires spacing and punctuation
  });
  recognition.addEventListener('end', recognition.start);
  recognition.start();
})