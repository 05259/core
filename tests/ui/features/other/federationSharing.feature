Feature: FederationSharing

	Background:
		Given these users exist:
		|username|password|displayname|email       |
		|user1   |1234    |User One   |u1@oc.com.np|
		|user2   |1234    |User Two   |u2@oc.com.np|
		And I am on the login page
		And I login with username "user1" and password "1234"
		And I logout
		And I login with username "user2" and password "1234"

	Scenario: share a file & folder with another federated user
		And the folder "simple-folder" is shared with the remote user "user1@%base_url%"
		And I logout
		And I login with username "user1" and password "1234"
		Then dialogs should be displayed
		| title        | content                                                                    |
		| Remote share | Do you want to add the remote share /simple-folder from user2@%base_url_without_scheme%/? |