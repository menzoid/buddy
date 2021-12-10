const navLight = () => {
  const nav = document.querySelector('.navbar-buddy');
  const btns = nav.querySelectorAll('.nav-icon');
  for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function () {
      const current = document.getElementsByClassName("shine");
      console.log(current);
      // If there's no active class
      if (current.length > 0) {
        current[0].className = current[0].className.toggle("shine");
      }

      // Add the active class to the current/clicked button
      this.className += "shine";
    });
  }
};

export { navLight };


// if btn find class shine exists then toggle, this.classname =
