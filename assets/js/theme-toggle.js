/* Dark mode toggle — the initial theme is applied inline in _includes/head.html */
(function () {
  var root = document.documentElement;
  var button = document.getElementById('theme-toggle');
  var media = window.matchMedia ? window.matchMedia('(prefers-color-scheme: dark)') : null;

  function storedTheme() {
    try { return localStorage.getItem('theme'); } catch (e) { return null; }
  }

  function syncButton(theme) {
    if (!button) return;
    var label = theme === 'dark' ? 'Switch to light theme' : 'Switch to dark theme';
    button.setAttribute('aria-pressed', theme === 'dark' ? 'true' : 'false');
    button.setAttribute('aria-label', label);
    button.setAttribute('title', label);
  }

  function applyTheme(theme, animate) {
    if (animate) {
      root.classList.add('theme-transition');
      window.setTimeout(function () { root.classList.remove('theme-transition'); }, 300);
    }
    root.setAttribute('data-theme', theme);
    syncButton(theme);
  }

  syncButton(root.getAttribute('data-theme') === 'dark' ? 'dark' : 'light');

  if (button) {
    button.addEventListener('click', function () {
      var next = root.getAttribute('data-theme') === 'dark' ? 'light' : 'dark';
      try { localStorage.setItem('theme', next); } catch (e) {}
      applyTheme(next, true);
    });
  }

  // Follow OS changes until the visitor makes an explicit choice.
  if (media) {
    var onChange = function (e) {
      var stored = storedTheme();
      if (stored !== 'dark' && stored !== 'light') {
        applyTheme(e.matches ? 'dark' : 'light', true);
      }
    };
    if (media.addEventListener) {
      media.addEventListener('change', onChange);
    } else if (media.addListener) {
      media.addListener(onChange);
    }
  }
})();
