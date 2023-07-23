## 1.0 - Composer Setup new project
```bash
composer create-project silverstripe/installer my-project
```

## 1.1 - create database
using gui like sequel pro - create new project database - i always use prefix `ss_`

## 1.2 - Edit .env file
copy the `.env.example` file and rename to just `.env`
adjust settings to match new database
add some extra vars like
```bash
SS_DEFAULT_ADMIN_USERNAME="admin"
SS_DEFAULT_ADMIN_PASSWORD="password"
SS_SEND_ALL_EMAILS_TO="xxxxxx@email.com"
```
add .env file to .gitiginore

## 1.3 - create theme folder
create a new theme folder in themes
include following folder structure
```yml
- themes
    - my-theme
        - css
        - fonts
        - images
        - javascript
        - templates
            - Includes
            - Layout
```
`expose theme` to public dir by adding the folowing into `composer.json`
```yaml
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
v3 & v4 Lessons suggest you can use any folder names inside theme folder and also reference the `themes/my-theme/css` ... this does NOT WORK FOR SS-5.
in SS-5 to use `$themedCSS` and `$themedJavascript` the themed folders MUST be called 'css' and 'javascript'
... this process will be covered in the next 'Templates' chapter 


in terminal cd to project root
then run `composer vendor-expose` - this will create a symlink in public folder to new theme
remove `simple` theme folders/files from public

## 1.4 - Set theme in _config
in `/app/_config/theme.yml` set your new theme to be used
```yaml
SilverStripe\View\SSViewer:
  themes:
    - '$public'
    - 'my-theme'
    - '$default'
```

## 1.5 - Create first template
create a simple `/themes/my-theme/templates/Page.ss` template to test installation is working.
```html
<html>
  <body>
    <h1>Hello, world</h1>
  </body>
</html>
```

## 1.6 - run /dev/build?flush
SS needs to update it's files so run `dev/build?flush` on the end of the localhost url.

## 1.7 - Everything should work
you should see your themed 'Hello World' page display (with no styling) instead of the default SS Page template - this means that everything is set up correctly.




--------------------------------------------