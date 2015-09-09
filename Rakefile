require "jekyll"

namespace :blog do
	desc "Commit general files."
	task :commit do
		puts "\n- STAGING MODIFIED FILES."
		status = system("git add -A")
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- COMMITTING FILES AT #{Time.now.utc}."
		message = "Built files updated at #{Time.now.utc}."
		status = system("git commit -m \"#{message}\"")
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- PUSHING COMMITS TO REMOTE."
		status = system("git push origin dev")
		puts status ? "SUCCESS." : "FAILED."
	end

	desc "Deploy built files."
	task :deploy do
		puts "\n- DELETING MASTER BRANCH."
		status = system("git branch -D master")
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- CREATING NEW MASTER BRANCH."
		status = system("git checkout -b master")
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- FORCING BUILT FILES TO BE ROOT."
		status = system("git filter-branch --subdirectory-filter _site/ -f");
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- SWITCHING BACK TO DEV."
		status = system("git checkout dev")
		puts status ? "SUCCESS." : "FAILED."

		puts "\n- DEPLOYING CHANGES."
		status = system("git push --all origin")
		puts status ? "SUCCESS." : "FAILED."
	end
end