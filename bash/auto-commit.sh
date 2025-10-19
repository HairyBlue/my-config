#!/bin/bash
set -e
current_dir="$(pwd)"

help="$1"
semantic=$(echo "$1" | cut -d= -f2)
commitMessage="$2"
specificFile=""

function print_error() {
    printf "\033[1;31m%s\033[0m" "$1"
}

function print_info() {
    printf "\033[1;32m%s\033[0m\n" "$1"
}

function exitf() {
    print_error "$1"
    exit 1
}

function userInput() {
   read -r user_input
   user_input=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

   if [[ "$user_input" == "yes" ]]; then
      git add .
      print_info "commiting all files"
   elif [[ "$user_input" == "no" ]]; then
      exitf "You choose no, please specify file/s"
   else
      exitf "Invalid response. Please enter 'Yes' or 'No'."
   fi
}

function commit() {
   
   if [ ! "$semantic" ]; then
      exitf "Should provide Semantic Commit: default, feat, fix, docs, refactor, build, test, ci, style, chore, perf. Do --help"
   fi

   if [ ! "$commitMessage" ]; then
      exitf "Should provide commit message. Do --help"
   fi

   if [ ! "$specificFile" ]; then
      print_info "You didn't provide specific files on third argument. This will do 'git add .' [Yes/no]"
      userInput
   fi
   

   if [ "$semantic" == "default" ]; then
      git commit -m "$commitMessage"
      echo "$commitMessage"
   elif [ "$semantic" == "feat" ]; then
      message="✨ feat: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "fix" ]; then
      message="🐛 fix: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "docs" ]; then
      message="📝 docs: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "refactor" ]; then
      message="♻️ refactor: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "build" ]; then
      message="👷 build: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "test" ]; then
      message="✅ test: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "ci" ]; then
      message="💚 ci: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "style" ]; then
      message="🎨 style: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "chore" ]; then
      message="🔧 chore: $commitMessage"
      git commit -m "$message"
      echo "$message"
   elif [ "$semantic" == "perf" ]; then
      message="⚡ perf: $commitMessage"
      git commit -m "$message"
      echo "$message"
   else
      exitf "Unable to auto commit. Do --help"
   fi

    (echo "Branch: $(git rev-parse --abbrev-ref HEAD)"; git log -1 --pretty=format:"%h | %an | %ad | %s%n") >> "commit.txt"
}

if [ "$#" -eq 0 ]; then
   exitf "Do --help"
fi

if [ "$#" -ge 3 ]; then
   shift 2
   specificFile="$@"
fi

if [ "$help" == "--help" ]; then
  echo "Usage:"
  echo "  ./auto-commit.sh --semantic=<type> \"Your commit message here\""
  echo ""
  echo "Semantic commit types:"
  echo "  default      Plain commit message without emoji or type"
  echo "  feat         ✨  New feature"
  echo "  fix          🐛  Bug fix"
  echo "  docs         📝  Documentation only changes"
  echo "  style        🎨  Code style/formatting (no logic change)"
  echo "  refactor     ♻️  Code change that neither fixes a bug nor adds a feature"
  echo "  test         ✅  Adding or updating tests"
  echo "  chore        🔧  Routine tasks, build scripts, etc."
  echo "  build        👷  Changes that affect the build system or dependencies"
  echo "  ci           💚  CI/CD related changes"
  echo "  perf         ⚡  Performance improvements"
  echo ""
  echo "Example:"
  echo "  ./auto-commit.sh --semantic=feat \"add dark mode toggle\""
  echo ""
  echo "Example with specific file/s:"
  echo "  ./auto-commit.sh --semantic=feat \"add dark mode toggle\" \"file1.ts\" \"file2.ts\""
  exit 0
fi

commit