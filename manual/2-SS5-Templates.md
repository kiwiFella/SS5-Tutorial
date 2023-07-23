## 2.0 - Template files
Template files live in the themes folder (don't expose templates to public folder)
- Page.ss is the default template
- Classic examples of templates are `Article.ss` and `ArticleHolder.ss`


## 2.1 - CSS & JS used in templates (Page.ss)
In SS v5 - to reference themed css files and themed javascript use the following.

CSS and Javascript are referenced in the <head> or at the bottom of the page so we include like this
CSS:    <% require themedCSS('bootstrap.min') %>
JS:     <% require themedJavascript('modernizr-2.8.1.min') %>

Images are referenced inline HTML
IMAGES:   <img src="$themedResourceURL('images/logo.png')" />

NOTE: the methods used in v3 & v4 lessons don't work in v5.

## 2.2 - Base URL
best practice is to put `<% base_tag %>` at the top of the <head> section

## 2.3 - Differences from v3 & v4 lessons
- it doesn't seem we need to put `$Form` beneath `$Content` anymore ... it seems the url '/admin' redirects to a secure login instead of inserting the form in the default Page.ss template.

## 2.4 - Standard Variables
Templates have a bunch of standard $vars inherited from Page Class
- $Title
- $Content
- $Menu(1) - Level 1 Navigation
- $Menu(2) - Level 2 Navigation
- $MenuTitle
- $Link
- $LinkingMode - [link, current, section]
- <% base_tag %>
- $Breadcrumbs
- $AbsoluteBaseUrl
