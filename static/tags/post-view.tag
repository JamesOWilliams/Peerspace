<post-feed>
    <li class="media post post-{opts.post.id} list-group-item p-4 my-3">
      <img class="media-object mr-3 align-self-start" src="{ post.user_url }">
      <div class="media-body">
        <div class="media-heading">
          <small class="float-right text-muted">{opts.post.days_since} days</small>
          <h6><a href="https://peerspace.herokuapp.com/users/{post.user}">{opts.post.user_name}</a> made the commitment: <a href="https://peerspace.herokuapp.com/posts/{post.id}">{opts.post.title}</a></h6>
        </div>
        <p>
          {opts.post.description}
        </p>
      </div>
    </li>
    <div if={opts.post.proof_description && post.proof_pic} id="accordion{opts.post.id}" role="tablist">
      <div class="card">
        <div class="card-header" role="tab" id="heading{opts.post.id}">
          <h5 class="mb-0">
            <a data-toggle="collapse" href="#collapse{opts.post.id}" aria-expanded="true" aria-controls="collapse{opts.post.id}">
              {post.user_name} submitted proof, it took {post.days_taken} days.
            </a>
          </h5>
        </div>
        <div id="collapse{opts.post.id}" class="collapse show" role="tabpanel" aria-labelledby="heading{opts.post.id}" data-parent="#accordion{opts.post.id}">
          <div class="card-body">
            <div class="post-proof">
              <p>{post.proof_description}</p>
              <img class="img-fluid d-block m-auto" src="{opts.post.proof_pic}">
            </div>
        </div>
      </div>
    </div>
  </div>
  <div class="post-footer pb-3">
    <a href="#" class="ml-3 pt-3 like-btn" style="color: #007bff;" id="{opts.post.id}" show={opts.post.likes.includes(user_id)}><span class="icon icon-thumbs-up"></span> Liked ({opts.post.likes.length})</a>
    <a href="#" class="ml-3 pt-3 like-btn" id="{opts.post.id}" hide={opts.post.likes.includes(user_id)}><span class="icon icon-thumbs-up"></span> Like ({opts.post.likes.length})</a>
    <a class="ml-3 pt-3 comment-btn comment-btn-{opts.post.id}" post-id="{opts.post.id}" href="#"><span class="icon icon-message"></span> Comment ({opts.post.comments.length})</a>
    <a if={(!opts.post.completed && (opts.post.proof_description || opts.post.proof_pic)) && opts.post.verifications.includes(user_id)} class="ml-3 pt-3 verify-btn verify-btn-{opts.post.id}" post-id="{opts.post.id}" style="color:#007bff;" href="#"><span class="icon icon-shield"></span> Verified ({opts.post.verifications.length}/5)</a>
    <a if={(!opts.post.completed && (opts.post.proof_description || opts.post.proof_pic)) && !opts.post.verifications.includes(user_id)} class="ml-3 pt-3 verify-btn verify-btn-{opts.post.id}" post-id="{opts.post.id}" style="color:grey;" href="#"><span class="icon icon-shield"></span> Verify ({opts.post.verifications.length}/5)</a>
    <div class="completion-status-container-{opts.post.id}" style="display:inline;">
      <p if={!opts.post.completed && !(opts.post.proof_description || opts.post.proof_pic)} class="float-right completion-status mr-3 pt-1" style="color: red;"><span class="icon icon-cross"></span> Not completed</p>
      <p if={!opts.post.completed && (opts.post.proof_description || opts.post.proof_pic)} class="float-right completion-status awaiting-verifcation-{opts.post.id} mr-3 pt-1" style="color: #FFBF00; margin-bottom:0px;"><span class="icon icon-hour-glass"> Awaiting Verification</span></p>
      <p if={opts.post.completed} class="float-right completion-status completed-{opts.post.id} mr-3 pt-1" style="color: green;"><span class="icon icon-check"></span> Completed</p>
    </div>
  </div>
  <div class="comment-container comment-container-{opts.post.id}" commentsopen="false" style="display:none;">
    <ul class="media-list comment-list comment-list-{opts.post.id} mx-auto d-block my-0" style="width:95%;">
    </ul>
  </div>
  <div class="comment-form comment-form-{opts.post.id}" style="display:none;">
      <div class="form-group">
        <input type="text" class="form-control comment" post-id="{opts.post.id}" placeholder="Comment">
      </div>
  </div>
  <script>
    this.on('mount', function() {
      opts.callback(this)
    });;
    this.on('data_loaded', function(data, user_id) {
      opts.post = data;;
      console.log(opts.post);;
      this.update()
    })
  </script>
</post-feed>
