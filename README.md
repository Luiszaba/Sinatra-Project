# Spooky Tales

This website is created to act as a database for user created horror stories.
Users will create an account using their email, username, and password.  The credentials are required and will result in redirects to the signup page if any are blank.  

Users password will be secure
Users session will be protected

Protected using `SecurePassword.hex(64)`

Once logged in User will view the '/users/show' page.  This will be the users homepage.  '/users/show' appears as 

<h3>Hello,  <%= @user.username %>. What would you like to do today? </h3>
    <a href="/stories/new">Write A Spooky Story</a></br>
    <a href="/stories/edit_story">Make Changes</a></br>
    <a href="/stories/public_stories">View Stories</a></br>
    <a href="/logout">Sign Out</a>
<br>

The selections available are -
1. Create new story
2. Make changes to stories
3. View all stories
4. Logout

Future implimentations include a voting system, CSS, and links to users Youtube channel. 


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Sinatra-Project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Spooky Tales project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Sinatra-Project/master/CODE_OF_CONDUCT.md).
