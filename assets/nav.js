// Site navigation: dropdown menus and the mobile menu button (see .site-nav in theme.css)
document.addEventListener('DOMContentLoaded', function () {
  var nav = document.querySelector('.site-nav');
  if (!nav) return;

  var toggle = nav.querySelector('.site-nav__toggle');
  var menu = nav.querySelector('.site-nav__menu');
  var triggers = nav.querySelectorAll('.site-nav__dropdown > button');

  function closeDropdowns(exceptMenu) {
    triggers.forEach(function (trigger) {
      var dropdown = document.getElementById(trigger.getAttribute('aria-controls'));
      if (dropdown && dropdown !== exceptMenu) {
        dropdown.classList.remove('show');
        trigger.setAttribute('aria-expanded', 'false');
      }
    });
  }

  triggers.forEach(function (trigger) {
    trigger.addEventListener('click', function (event) {
      event.stopPropagation();
      var dropdown = document.getElementById(trigger.getAttribute('aria-controls'));
      var willOpen = !dropdown.classList.contains('show');
      closeDropdowns(dropdown);
      dropdown.classList.toggle('show', willOpen);
      trigger.setAttribute('aria-expanded', String(willOpen));
    });
  });

  toggle.addEventListener('click', function () {
    var open = menu.classList.toggle('show');
    toggle.setAttribute('aria-expanded', String(open));
  });

  document.addEventListener('click', function (event) {
    if (!event.target.closest('.site-nav__dropdown')) closeDropdowns(null);
  });

  document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape') closeDropdowns(null);
  });
});
