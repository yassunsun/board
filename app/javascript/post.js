function post() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/topics/18/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");
      const HTML = `
        <div class="post">
          <span class="name">
            名無し
          </span>
          <span class="time">
            ${item.created_at}
          </span>
          <p class=comment>${item.comment}</p>
        </div>`;

      list.insertAdjacentHTML("beforebegin", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
 }
 window.addEventListener("load", post);