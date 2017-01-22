$(window).on('scroll', function() {
  const nav = document.querySelector('#header')
  if (window.scrollY >= 269) {
    document.body.classList.add('fixed-nav')
    document.body.style.paddingTop = nav.offsetHeight + 'px'
  } else {
    document.body.classList.remove('fixed-nav')
    document.body.style.paddingTop = 0
  }
})
