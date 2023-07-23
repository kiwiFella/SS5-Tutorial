## 3.0 0 PageTypes
Different pagetypes customise the CMS experience for different pages
- adds new CMS fields & tabs depending on how those specific pages require
- controls the database relationships (has_one, has_many, many_many, owner, belongs_to_many)
- 

- Each page type requires a controller
- 

PageTypes live in the `/app/src/` directory by default... how ever i like to put them together in `/app/src/pages/` (leave the root Page.php & PageController.php at '/app/src')ß


## 3.1 - Templates & Layouts
Each page type generally uses the default `Page.ss` template - but uses a `Layout` with the same name as the PageType

How this works:
In the `/themes/templates/Layout` folder we can have many `.ss` files - these are named to match the pagetypes/model... eg. the `HomePage.php` model -> uses the `/Layout/HomePage.ss` Layout ... and this is done when in the root `Page.ss` uses a reference to `$Layout`.

If you require a unique root template file - then simply name it the same as the Model (eg. HomePage.ss) and it will automatically be inherited - otherwise it goes down the class extension and inherits the parent class (which is how Page.ss gets used by most pagetypes)


## 3.2 - Including CSS & Javascript into Controllers
I like to keep my css & js inside the theme directory - as this allows me to de-couple the UI from the Backend... and it works out of the box when copying over a theme.

However if we are smart - we can keep the base/core css and js in the theme - and then include/point to specific files in the controller for specific pages - this way we can control different css/js to appear only on specific pages... eg. generally on the homepage will have a carousel image widget - which will have unique css & js - no point including this on every page!

For more detail on how to include css & js in controller
refer to [https://docs.silverstripe.org/en/5/developer_guides/templates/requirements/]
```php
    // Either
    Requirements::javascript('themes/mytheme/javascript/script-name.js');
    Requirements::css('themes/mytheme/css/script-name.css');
    // OR (i prefer this - but folders inside theme must be named 'css' + 'javascript' - (ie. NOT 'js'))
    Requirements::themedCSS('script-name');
    Requirements::themedJavascript('script-name');
```





--------------------------------------------