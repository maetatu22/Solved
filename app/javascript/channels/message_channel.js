import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    
    const html = `
    <div class="comment-text-lists">
        <p>${data.content.created_at}</p>
        <div class="comment-textes">
          <p>"新規投稿"</p>
          <p>${data.content.comment_text}</p>
        </div>
      </div>
    `;
    const comments = document.getElementById('comment-list');
    const newComment = document.getElementById('comment_comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  
  }
});
