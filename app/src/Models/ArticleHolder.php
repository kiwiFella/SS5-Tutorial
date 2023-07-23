<?php

class ArticleHolder extends Page {

    private static $db = [
        
    ];

    private static $allowed_children = [
        ArticlePage::class
    ];
}