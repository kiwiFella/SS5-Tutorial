## 4.0 - Holder Page concept
The holder page concept is used often in websites

Think of he Holder page as a List of Articles - with brief snippets - these snippets then link to the Single Item page which has the full article.

In the CMS
1.  The Holder page needs to be the Parent (root) page in the CMS Page structure
2. The Single Item page needs to be a sub-page beneath the Holder page in CMS Page structure

The holder page doesn't really have much of it's own content - it pulls the content from the sub-pages

it does this by

```php
<% Loop $Children %>
    ... uses $Title, $Link & other custom CMS fields
<% end_loop %>
```

## 4.1 - CMS Hierarchy limits
It's good practice to lock down the CMS so usesr know that:
1. an 'Article' page can only be a subpage available to the Holder page
2. Article page can not be a pageType at the root level

SO...
`/app/src/Models/ArticleHolder.php`
```php
class ArticleHolder extends Page {

    private static $allowed_children = [
        ArticlePage::class
    ];

}
```

`/app/src/Models/ArticlePage.php`
```php
class ArticlePage extends Page{
    private static $can_be_root = false;
    
}
```






--------------------------------------------