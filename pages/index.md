---
# title: "perfSONAR"
keywords: sample homepage
# tags: [ home ]
sidebar: home_sidebar
permalink: index.html
# summary: perfSONAR is the <b>perf</b>ormance <b>S</b>ervice-<b>O</b>riented <b>N</b>etwork monitoring <b>AR</b>chitecture, a toolkit for identifying performance problems on your network.
toc: false
comments: false
---

<center>
Latest News:
{% assign post_url = site.posts[0].url | remove: "/" %}
<b><a href="{{ post_url }}">{{ site.posts[0].title }}</a></b>
&middot;
{{ site.posts[0].date | date: "%B %-d, %Y" }}
</center>

<p align="center"><img src="images/logos/perfsonar.svg"/></p>

{% include important.html content="This is a development test for a potential replacement for the perfSONAR web site.  It is not the official site, so please take anything you see here with a grain of salt." %}
{% include note.html content="Items in the sidebar marked (X) do not exist yet." %}
{% include note.html content="Search doesn't work yet." %}

## Here's a short summary.

perfSONAR is the <b>perf</b>ormance <b>S</b>ervice-<b>O</b>riented
<b>N</b>etwork monitoring <b>AR</b>chitecture, a toolkit for
identifying performance problems on your network.


## Here's a nice video.
<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/EO2NiNaASYo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>


## Here are some things.

<div class="row">

         <div class="col-md-3 col-sm-6">
             <div class="panel panel-default text-center">
                 <div class="panel-heading">
                     <span class="fa-stack fa-5x">
                           <i class="fa fa-circle fa-stack-2x text-primary"></i>
                           <i class="fa fa-download fa-stack-1x fa-inverse"></i>
                     </span>
                 </div>
                 <div class="panel-body">
                     <!-- <h4>Installation</h4> -->
 		     <!-- <p>How to download and install perfSONAR and use it on your network.</p> -->
                     <a href="tag_getting_started.html" class="btn btn-primary">Installation</a>
                 </div>
             </div>
         </div>

         <div class="col-md-3 col-sm-6">
             <div class="panel panel-default text-center">
                 <div class="panel-heading">
                     <span class="fa-stack fa-5x">
                           <i class="fa fa-circle fa-stack-2x text-primary"></i>
                           <i class="fa fa-book fa-stack-1x fa-inverse"></i>
                     </span>
                 </div>
                 <div class="panel-body">
                     <!-- <h4>Documentation</h4> -->
                     <!-- <p>All of perfSONAR's gory details.</p> -->
                     <a href="https://docs.perfsonar.net" class="btn btn-primary">Documentation</a>
                 </div>
             </div>
         </div>

         <div class="col-md-3 col-sm-6">
             <div class="panel panel-default text-center">
                 <div class="panel-heading">
                     <span class="fa-stack fa-5x">
                           <i class="fa fa-circle fa-stack-2x text-primary"></i>
                           <i class="fa fa-th fa-stack-1x fa-inverse"></i>
                     </span>
                 </div>
                 <div class="panel-body">
                     <a href="https://perfsonar-testbed-ma.grnoc.iu.edu/maddash-webui/index.cgi?dashboard=PWA%20Development%20Testbed" class="btn btn-primary">Test Bed</a>
                 </div>
             </div>
         </div>

         <div class="col-md-3 col-sm-6">
             <div class="panel panel-default text-center">
                 <div class="panel-heading">
                     <span class="fa-stack fa-5x">
                           <i class="fa fa-circle fa-stack-2x text-primary"></i>
                           <i class="fa fa-user fa-stack-1x fa-inverse"></i>
                     </span>
                 </div>
                 <div class="panel-body">
                     <a href="https://www.andylake.com/" class="btn btn-primary">Andy Lake</a>
                 </div>
             </div>
         </div>

</div>
