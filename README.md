# Spooky Tales

This website is created to act as a database for user created horror stories.
Users will create an account using their email, username, and password.  The credentials are required and will result in redirects to the signup page if any are blank.  

Users can create an account<br>
Users can log in<br>
Users can logout<br>
Users password will be secure<br>
Users session will be protected<br>
Protected using `SecurePassword.hex(64)`<br>
User can create stories<br>
User can edit own story<br>
User can not make edits to other users stories<br>


Once logged in User will view the '/users/show' page.  This will be the users homepage.  '/users/show' appears as :

```<h3>Hello,  <%= current_user.username %>. What would you like to do today? </h3>
    <a href="/stories/new">Write A Spooky Story</a></br>
    <a href="/stories/index">View Stories</a></br>
    <a href="/logout">Sign Out</a>```
<br>

The selections available are -
1. Create new story
2. View all stories
3. Logout

#Future implimentations include a voting system, CSS, and links to users Youtube channel. 

Please read Logfile for archived development information

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Sinatra-Project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Spooky Tales project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Sinatra-Project/master/CODE_OF_CONDUCT.md).
