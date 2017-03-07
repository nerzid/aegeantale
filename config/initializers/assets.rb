# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.asset_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( preload.css )
Rails.application.config.assets.precompile += %w( vendors.css )
Rails.application.config.assets.precompile += %w( syntaxhighlighter/shCore.css )
Rails.application.config.assets.precompile += %w( style-blue.css )
Rails.application.config.assets.precompile += %w( width-full.css )
Rails.application.config.assets.precompile += %w( full-background.css )
Rails.application.config.assets.precompile += %w( top-navigation-bar.css )
Rails.application.config.assets.precompile += %w( vendors.js )
Rails.application.config.assets.precompile += %w( syntaxhighlighter/shCore.js )
Rails.application.config.assets.precompile += %w( syntaxhighlighter/shBrushXml.js )
Rails.application.config.assets.precompile += %w( syntaxhighlighter/shBrushJScript.js )
Rails.application.config.assets.precompile += %w( app.js )
