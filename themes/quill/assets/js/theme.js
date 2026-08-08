(function () {
  "use strict";
  var root = document.documentElement;
  var KEY = "theme";

  function currentScheme() {
    return root.getAttribute("data-theme") ||
      (window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
  }

  var toggle = document.querySelector("[data-theme-toggle]");
  if (toggle) {
    toggle.addEventListener("click", function () {
      var next = currentScheme() === "dark" ? "light" : "dark";
      root.setAttribute("data-theme", next);
      try { localStorage.setItem(KEY, next); } catch (e) {}
    });
  }

  var box = document.querySelector("[data-search]");
  if (box) initSearch(box);

  function escapeHtml(s) {
    return String(s || "").replace(/[&<>"']/g, function (c) {
      return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c];
    });
  }

  function initSearch(el) {
    var input = el.querySelector("input");
    var out = el.querySelector("[data-search-results]");
    var url = el.getAttribute("data-index-url");
    var data = null;
    var pending = null;

    function load() {
      if (data) return Promise.resolve(data);
      return fetch(url).then(function (r) { return r.json(); }).then(function (d) { data = d; return d; });
    }

    function render() {
      var q = input.value.trim().toLowerCase();
      if (!q) { out.innerHTML = ""; return; }
      load().then(function (items) {
        var hits = items.filter(function (p) {
          var hay = (p.title + " " + (p.description || "") + " " +
            ((p.tags || []).join(" ")) + " " + (p.content || "")).toLowerCase();
          return hay.indexOf(q) !== -1;
        }).slice(0, 25);
        out.innerHTML = hits.length
          ? hits.map(function (p) {
              return '<li class="post-item"><a class="post-link" href="' + p.url + '">' +
                '<time class="post-date">' + escapeHtml(p.date) + "</time>" +
                '<span class="post-title">' + escapeHtml(p.title) + "</span></a>" +
                (p.description ? '<p class="post-excerpt">' + escapeHtml(p.description) + "</p>" : "") +
                "</li>";
            }).join("")
          : '<li class="muted">No results for “' + escapeHtml(input.value) + '”.</li>';
      });
    }

    input.addEventListener("input", function () {
      clearTimeout(pending);
      pending = setTimeout(render, 90);
    });

    var q = new URLSearchParams(location.search).get("q");
    if (q) { input.value = q; render(); }
  }
})();
