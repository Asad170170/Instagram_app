# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




<div class="container ">
    <div class="row ">
        <%@posts.each do |post|%>
        <div class="col-8">
            <div class="post-meta"><%=post.caption%></div>
            <% (0...post.images.count).each do |image|%>
            <%= image_tag(post.thumbnail(image))%>
            <%end%>
        </div>
        <div class="padding"></div>
        <%end%>
    </div>
</div>

