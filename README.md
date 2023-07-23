## ReadMe File Generated from `/manual` folder
```bash
cd manual
make readme
```
This concatenates all `.md` files in the `manual` dir and builds a `/manual/README.md` file ... copy this content into the root README.md

--------------------------------------------


## 1.0 - Composer Setup new project

``` bash
composer create-project silverstripe/installer my-project
```

## 1.1 - create database

using gui like sequel pro - create new project database - i always use
prefix `ss_`

## 1.2 - Edit .env file

copy the `.env.example` file and rename to just `.env` adjust settings
to match new database add some extra vars like

``` bash
SS_DEFAULT_ADMIN_USERNAME="admin"
SS_DEFAULT_ADMIN_PASSWORD="password"
SS_SEND_ALL_EMAILS_TO="xxxxxx@email.com"
```

add .env file to .gitiginore

## 1.3 - create theme folder

create a new theme folder in themes include following folder structure -
themes - my-theme - css - fonts - images - javascript - templates -
Includes - Layout

expose theme to public by adding the folowing into `composer.json`

``` yaml
"extra": {
    "expose": [
        "themes/one-ring/css",
        "themes/one-ring/images",
        "themes/one-ring/javascript",
        "themes/one-ring/fonts"
    ]
}
```

### NOTE:

v3 & v4 Lessons suggest you can use any folder names inside theme folder
and also reference the `themes/my-theme/css` ... this does NOT WORK FOR
SS-5. in SS5 to use `$themedCSS` and `$themedJavascript` the themed
folders MUST be called 'css' and 'javascript' ... this process will be
covered in the next 'Templates' chapter

in terminal cd to project root then run `composer vendor-expose` - this
will create a symlink in public folder to new theme remove `simple`
theme folders/files from public

## 1.4 - Set theme in \_config

in `/app/_config/theme.yml` set your new theme to be used

``` yaml
SilverStripe\View\SSViewer:
  themes:
    - '$public'
    - 'my-theme'
    - '$default'
```

## 1.5 - Create first template

create a simple `/themes/my-theme/templates/Page.ss` template to test
installation is working.

``` html
<html>
  <body>
    <h1>Hello, world</h1>
  </body>
</html>
```

## 1.6 - run /dev/build?flush

SS needs to update it's files so run `dev/build?flush` on the end of the
localhost url.

## 1.7 - Everything should work

you should see your themed 'Hello World' page display (with no styling)
instead of the default SS Page template - this means that everything is
set up correctly.

## 2.0 - Template files

Template files live in the themes folder (don't expose templates to
public folder) - Page.ss is the default template - Classic examples of
templates are `Article.ss` and `ArticleHolder.ss`

## 2.1 - CSS & JS used in templates (Page.ss)

In SS v5 - to reference themed css files and themed javascript use the
following.

CSS and Javascript are referenced in the
```{=html}
<head>
```
or at the bottom of the page so we include like this CSS: \<% require
themedCSS('bootstrap.min') %\> JS: \<% require
themedJavascript('modernizr-2.8.1.min') %\>

Images are referenced inline HTML IMAGES:
`<img src="$themedResourceURL('images/logo.png')" />`{=html}

NOTE: the methods used in v3 & v4 lessons don't work in v5.

## 2.2 - Base URL

best practice is to put `<% base_tag %>` at the top of the
```{=html}
<head>
```
section

## 2.3 - Differences from v3 & v4 lessons

-   it doesn't seem we need to put `$Form` beneath `$Content` anymore
    ... it seems the url '/admin' redirects to a secure login instead of
    inserting the form in the default Page.ss template.

## 2.4 - Standard Variables

Templates have a bunch of standard \$vars inherited from Page Class -
\$Title - \$Content - \$Menu(1) - Level 1 Navigation - \$Menu(2) - Level
2 Navigation - \$MenuTitle - \$Link - \$LinkingMode - \[link, current,
section\] - \<% base_tag %\> - \$Breadcrumbs - \$AbsoluteBaseUrl

## 3.0 0 PageTypes

Different pagetypes customise the CMS experience for different pages -
adds new CMS fields & tabs depending on how those specific pages
require - controls the database relationships (has_one, has_many,
many_many, owner, belongs_to_many) -

-   Each page type requires a controller
-   

PageTypes live in the `/app/src/` directory by default... how ever i
like to put them together in `/app/src/pages/` (leave the root Page.php
& PageController.php at '/app/src')ß

## 3.1 - Templates & Layouts

Each page type generally uses the default `Page.ss` template - but uses
a `Layout` with the same name as the PageType

How this works: In the `/themes/templates/Layout` folder we can have
many `.ss` files - these are named to match the pagetypes/model... eg.
the `HomePage.php` model -\> uses the `/Layout/HomePage.ss` Layout ...
and this is done when in the root `Page.ss` uses a reference to
`$Layout`.

If you require a unique root template file - then simply name it the
same as the Model (eg. HomePage.ss) and it will automatically be
inherited - otherwise it goes down the class extension and inherits the
parent class (which is how Page.ss gets used by most pagetypes)

## 3.2 - Including CSS & Javascript into Controllers

I like to keep my css & js inside the theme directory - as this allows
me to de-couple the UI from the Backend... and it works out of the box
when copying over a theme.

However if we are smart - we can keep the base/core css and js in the
theme - and then include/point to specific files in the controller for
specific pages - this way we can control different css/js to appear only
on specific pages... eg. generally on the homepage will have a carousel
image widget - which will have unique css & js - no point including this
on every page!

to include css & js in controller refer to
\[https://docs.silverstripe.org/en/5/developer_guides/templates/requirements/\]

``` php
    // Either
    Requirements::javascript('themes/mytheme/javascript/script-name.js');
    Requirements::css('themes/mytheme/css/script-name.css');
    // OR (i prefer this - but folders inside theme must be named 'css' + 'javascript' - (ie. NOT 'js'))
    Requirements::themedCSS('script-name');
    Requirements::themedJavascript('script-name');
```

## ReadMe File Generated from `/manual` folder

``` bash
cd manual
make readme
```

This concatenates all `.md` files in the `manual` dir and builds a
`/manual/README.md` file XXXXXXXX

------------------------------------------------------------------------

## 1.0 - Composer Setup new project

``` bash
composer create-project silverstripe/installer my-project
```

## 1.1 - create database

using gui like sequel pro - create new project database - i always use
prefix `ss_`

## 1.2 - Edit .env file

copy the `.env.example` file and rename to just `.env` adjust settings
to match new database add some extra vars like

``` bash
SS_DEFAULT_ADMIN_USERNAME="admin"
SS_DEFAULT_ADMIN_PASSWORD="password"
SS_SEND_ALL_EMAILS_TO="xxxxxx@email.com"
```

add .env file to .gitiginore

## 1.3 - create theme folder

create a new theme folder in themes include following folder structure -
themes - my-theme - css - fonts - images - javascript - templates -
Includes - Layout

expose theme to public by adding the folowing into `composer.json`

``` yaml
"extra": {
    "expose": [
        "themes/one-ring/css",
        "themes/one-ring/images",
        "themes/one-ring/javascript",
        "themes/one-ring/fonts"
    ]
}
```

### NOTE:

v3 & v4 Lessons suggest you can use any folder names inside theme folder
and also reference the `themes/my-theme/css` ... this does NOT WORK FOR
SS-5. in SS5 to use `$themedCSS` and `$themedJavascript` the themed
folders MUST be called 'css' and 'javascript' ... this process will be
covered in the next 'Templates' chapter

in terminal cd to project root then run `composer vendor-expose` - this
will create a symlink in public folder to new theme remove `simple`
theme folders/files from public

## 1.4 - Set theme in \_config

in `/app/_config/theme.yml` set your new theme to be used

``` yaml
SilverStripe\View\SSViewer:
  themes:
    - '$public'
    - 'my-theme'
    - '$default'
```

## 1.5 - Create first template

create a simple `/themes/my-theme/templates/Page.ss` template to test
installation is working.

``` html
<html>
  <body>
    <h1>Hello, world</h1>
  </body>
</html>
```

## 1.6 - run /dev/build?flush

SS needs to update it's files so run `dev/build?flush` on the end of the
localhost url.

## 1.7 - Everything should work

you should see your themed 'Hello World' page display (with no styling)
instead of the default SS Page template - this means that everything is
set up correctly.

## 2.0 - Template files

Template files live in the themes folder (don't expose templates to
public folder) - Page.ss is the default template - Classic examples of
templates are `Article.ss` and `ArticleHolder.ss`

## 2.1 - CSS & JS used in templates (Page.ss)

In SS v5 - to reference themed css files and themed javascript use the
following.

CSS and Javascript are referenced in the

```{=html}
<head>
```
or at the bottom of the page so we include like this CSS: \<% require
themedCSS('bootstrap.min') %\> JS: \<% require
themedJavascript('modernizr-2.8.1.min') %\>

Images are referenced inline HTML IMAGES:
`<img src="$themedResourceURL('images/logo.png')" />`{=html}

NOTE: the methods used in v3 & v4 lessons don't work in v5.

## 2.2 - Base URL

best practice is to put `<% base_tag %>` at the top of the

```{=html}
<head>
```
section

## 2.3 - Differences from v3 & v4 lessons

-   it doesn't seem we need to put `$Form` beneath `$Content` anymore
    ... it seems the url '/admin' redirects to a secure login instead of
    inserting the form in the default Page.ss template.

## 2.4 - Standard Variables

Templates have a bunch of standard \$vars inherited from Page Class -
\$Title - \$Content - \$Menu(1) - Level 1 Navigation - \$Menu(2) - Level
2 Navigation - \$MenuTitle - \$Link - \$LinkingMode - \[link, current,
section\] - \<% base_tag %\> - \$Breadcrumbs - \$AbsoluteBaseUrl

## 3.0 0 PageTypes

Different pagetypes customise the CMS experience for different pages -
adds new CMS fields & tabs depending on how those specific pages
require - controls the database relationships (has_one, has_many,
many_many, owner, belongs_to_many) -

-   Each page type requires a controller
-   

PageTypes live in the `/app/src/` directory by default... how ever i
like to put them together in `/app/src/pages/` (leave the root Page.php
& PageController.php at '/app/src')ß

## 3.1 - Templates & Layouts

Each page type generally uses the default `Page.ss` template - but uses
a `Layout` with the same name as the PageType

How this works: In the `/themes/templates/Layout` folder we can have
many `.ss` files - these are named to match the pagetypes/model... eg.
the `HomePage.php` model -\> uses the `/Layout/HomePage.ss` Layout ...
and this is done when in the root `Page.ss` uses a reference to
`$Layout`.

If you require a unique root template file - then simply name it the
same as the Model (eg. HomePage.ss) and it will automatically be
inherited - otherwise it goes down the class extension and inherits the
parent class (which is how Page.ss gets used by most pagetypes)

## 3.2 - Including CSS & Javascript into Controllers

I like to keep my css & js inside the theme directory - as this allows
me to de-couple the UI from the Backend... and it works out of the box
when copying over a theme.

However if we are smart - we can keep the base/core css and js in the
theme - and then include/point to specific files in the controller for
specific pages - this way we can control different css/js to appear only
on specific pages... eg. generally on the homepage will have a carousel
image widget - which will have unique css & js - no point including this
on every page!

to include css & js in controller refer to
\[https://docs.silverstripe.org/en/5/developer_guides/templates/requirements/\]

``` php
    // Either
    Requirements::javascript('themes/mytheme/javascript/script-name.js');
    Requirements::css('themes/mytheme/css/script-name.css');
    // OR (i prefer this - but folders inside theme must be named 'css' + 'javascript' - (ie. NOT 'js'))
    Requirements::themedCSS('script-name');
    Requirements::themedJavascript('script-name');
```

                
                