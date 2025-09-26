# Contribute

## Braches
This are the branch
- `main or master`
   > Only use if you are the Author/Owner of the project

- `tickets/<branch-name>` 
   > Only use if you are a Author or Co-author use for minimal changes like fixes

- `features/<branch-name>`
   > Only use if you are a Author or Co-author use for major changes / breaking changes


## Before Commiting

### Run prettier
```bash
cd <to-project>
npm run format 
# this will format to given standard
```

### Run Lint
```bash
cd <to-project>
npm run lint 
# this will check any possible error based on rules or eslint config
# if ERRORS, fix it.
# if WARNING, ifnore it.

# No need to be strict

# If not sure 
# DO
npm run lint:fix
```

### Run Test if Any
```bash
cd <to-project>
npm run test # defualt to vite cause no headache

# specifics
npm run test:vite # default vite
npm run test:jest # if jest
npm run test:mocha # if mocha
```

### Run Your Changes
Before Build and after Build.
```bash
npm run dev # default to jiti

npm run dev:jiti # if jiti
npm run dev:ts # if ts-node
npm run dev:nodemon # if nodemon

# AFTER BUILD or for Prod
npm run start
```

## Additional

### Stashing
Need to Fix issue  or To Test something but still working on some branch that you dont want to commit at the moment.
Better to stash the changes fix, this is separated from commit but still save the changes.
```bash
# Before leaving in the branch

git add . 
# make sure you will add all changes. Without add all Modified file is included, the New File or deleted file will not include

git stash save "<message>" # Unique message to easilly determeined"

# Then you can now process on switching


# After switching and you want to continue.

git stash list # to check where it is.
git stash apply stash@{<Number of stash>} # to apply the saved
```