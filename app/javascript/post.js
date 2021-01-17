function post() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    const posts = document.getElementById("post");
    const topicId = posts.getAttribute("data-id");
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/topics/${topicId}/posts`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.post;
      const nickname = document.getElementById("nickname").value;
      const list = document.getElementById("list");
      const formText = document.getElementById("comment");
      const HTML = `
        <div class="post">
          <span class="name">
            ${nickname}
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