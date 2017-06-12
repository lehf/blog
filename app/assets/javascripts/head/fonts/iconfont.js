;(function(window) {

  var svgSprite = '<svg>' +
    '' +
    '<symbol id="icon-augichuojian" viewBox="0 0 1024 1024">' +
    '' +
    '<path d="M768.68408 646.851291l0-24.972764-97.466845-110.084211-0.24764 0.280386c2.901073-113.254414 2.488681-235.545644-9.981329-284.58043-14.45113-56.82624-98.496292-181.133384-148.996452-181.133384S377.444445 170.668031 362.993315 227.495294c-12.468986 49.031716-12.882402 171.310667-9.981329 284.559964l-0.230244-0.25992-97.466845 110.084211 0 24.972764 102.59361 0c0.306992 6.699586 0.610914 13.143345 0.909719 19.317974-23.714098 42.608423-30.861892 77.598332-0.75827 77.598332 1.632173 0 3.288906 0 4.933359 0 96.466052 0 214.980259 0 297.993928 0 1.64957 0 3.312442 0 4.934382 0 30.103622 0 22.955828-34.989909-0.75827-77.598332 0.297782-6.175653 0.602727-12.618389 0.909719-19.317974L768.68408 646.852314zM530.145266 618.84647c0 8.832156-8.128121 15.991206-18.154475 15.991206-10.027377 0-18.155499-7.15905-18.155499-15.991206L493.835292 478.785527c0-8.831132 8.128121-15.991206 18.155499-15.991206 10.026354 0 18.154475 7.160073 18.154475 15.991206L530.145266 618.84647zM586.280774 353.954451c0 13.138228-10.650571 23.789823-23.788799 23.789823l-101.001345 0c-13.138228 0-23.788799-10.650571-23.788799-23.789823l0-94.323249c0-13.138228 10.650571-23.789823 23.788799-23.789823l101.001345 0c13.138228 0 23.788799 10.650571 23.788799 23.789823L586.280774 353.954451z"  ></path>' +
    '' +
    '<path d="M554.931788 769.443373c0 0-1.258667 15.589047-3.244904 20.340257-6.462179 15.462157-39.686884 54.020334-39.686884 54.020334s-33.235962-38.553061-39.697117-54.016241c-1.985214-4.752234-3.234671-20.343327-3.234671-20.343327l-69.962421 0c0 0-3.807722 43.654242 1.749854 56.958246 18.086937 43.294039 111.143333 151.235446 111.143333 151.235446s93.02365-107.955734 111.116727-151.245679c5.559623-13.301957 1.77646-56.949037 1.77646-56.949037L554.931788 769.443373z"  ></path>' +
    '' +
    '</symbol>' +
    '' +
    '</svg>'
  var script = function() {
    var scripts = document.getElementsByTagName('script')
    return scripts[scripts.length - 1]
  }()
  var shouldInjectCss = script.getAttribute("data-injectcss")

  /**
   * document ready
   */
  var ready = function(fn) {
    if (document.addEventListener) {
      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
        setTimeout(fn, 0)
      } else {
        var loadFn = function() {
          document.removeEventListener("DOMContentLoaded", loadFn, false)
          fn()
        }
        document.addEventListener("DOMContentLoaded", loadFn, false)
      }
    } else if (document.attachEvent) {
      IEContentLoaded(window, fn)
    }

    function IEContentLoaded(w, fn) {
      var d = w.document,
        done = false,
        // only fire once
        init = function() {
          if (!done) {
            done = true
            fn()
          }
        }
        // polling for no errors
      var polling = function() {
        try {
          // throws errors until after ondocumentready
          d.documentElement.doScroll('left')
        } catch (e) {
          setTimeout(polling, 50)
          return
        }
        // no errors, fire

        init()
      };

      polling()
        // trying to always fire before onload
      d.onreadystatechange = function() {
        if (d.readyState == 'complete') {
          d.onreadystatechange = null
          init()
        }
      }
    }
  }

  /**
   * Insert el before target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var before = function(el, target) {
    target.parentNode.insertBefore(el, target)
  }

  /**
   * Prepend el to target
   *
   * @param {Element} el
   * @param {Element} target
   */

  var prepend = function(el, target) {
    if (target.firstChild) {
      before(el, target.firstChild)
    } else {
      target.appendChild(el)
    }
  }

  function appendSvg() {
    var div, svg

    div = document.createElement('div')
    div.innerHTML = svgSprite
    svgSprite = null
    svg = div.getElementsByTagName('svg')[0]
    if (svg) {
      svg.setAttribute('aria-hidden', 'true')
      svg.style.position = 'absolute'
      svg.style.width = 0
      svg.style.height = 0
      svg.style.overflow = 'hidden'
      prepend(svg, document.body)
    }
  }

  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    window.__iconfont__svg__cssinject__ = true
    try {
      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    } catch (e) {
      console && console.log(e)
    }
  }

  ready(appendSvg)


})(window)