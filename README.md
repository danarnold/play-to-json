play-to-json
============

play_to_json.rb is a quick script I wrote to generate a JSON output from a Google Play page. It will work for search results, app search results pages, your wishlist, etc.

# Usage

Download the page you'd like to parse; I've been right-clicking, Save As..., and then choosing Format: HTML Only in Chrome. Then, just point the script at the file like this:

```shell
ruby play_to_json.rb '/Users/me/Downloads/search_results.html'
```

You will get pretty-formatted JSON to STDOUT. You can always redirect the output to a file.

```shell
ruby play_to_json.rb 'file.html' > output_file.json
```

That's it!

# Requirements

You'll need the gem `nokogiri` to run this script.
