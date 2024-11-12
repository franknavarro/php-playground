<?php

/**
 * Plugin main file.
 * @package   MyPHP\Fun
 *
 * @wordpress-plugin
 * Plugin Name:       Example PHP plugin
 * Plugin URI:        https://example.com
 * Description:       Just another WordPress plugin.
 * Version:           1.0.0
 * Author:            Me
 * Author URI:        https://youtu.be/dQw4w9WgXcQ?si=zojAhu2MF5zWslpX
 * License:           Apache 2.0
 * License URI:       https://www.apache.org/licenses/LICENSE-2.0
 * Text Domain:       php-fun
 */

// phpcs:disable PSR1.Files.SideEffects.FoundWithSymbols -- WordPress plugin

// If this file is called directly, abort.
if (! defined('WPINC')) {
    die;
}

// Load the plugin dependencies
require_once plugin_dir_path(__FILE__) . 'vendor/autoload.php';

function hello_world()
{
    $helloWorld = new \MyPHP\Fun\HelloWorld();
    ?>
        <div style="width:100%; text-align: center;">
            <h1 id="greeting"><?= $helloWorld->greetSW(); ?></h1>
        </div>
    <?php
}

add_action(/*hook=*/'wp_body_open', /*callback=*/'hello_world', /*priority=*/10, /*accepted_args=*/1);
