// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  return $("#posts .page").infinitescroll({
    // selector for the paged navigation (it will be hidden)
    navSelector: "nav.pagination",
    // selector for the NEXT link (to page 2)
    nextSelector: "nav.pagination a[rel=next]",
    // selector for all items you'll retrieve
    itemSelector: "#posts div.post"
  });
});

$(document).ready(function() {
  document.getElementById('tag_button').addEventListener("click", function() {
    var x = document.getElementById('tag_cloud');
    //     if (this.innerText === "Show Tags") {
    //       this.innerText = "Hide Tags"
    //     } else {
    //       this.innerText = "Show Tags"
    //     }
    this.innerText = (this.innerText === "Show Tags") ? "Hide Tags" : "Show Tags"
    //     if (x.style.display === 'block') {
    //       x.style.display = 'none';
    //     } else {
    //       x.style.display = 'block';
    //     }
    x.style.display = (x.style.display === "block") ? "none" : "block";
  })
})
