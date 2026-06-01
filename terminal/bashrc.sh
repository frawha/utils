mkcd() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

edit_bash_profile() {
 nano ~/.zshrc
}

auth_gcp() {
    if [ -z "$1" ]; then
        echo "Usage: gcp_set <project_id>"
        return 1
    fi

    local project_id=$1

    echo "Configuring project to: $project_id..."
    gcloud config set project "$project_id"

    echo "Authenticating user account..."
    gcloud auth login

    echo "Setting Application Default Credentials (ADC)..."
    gcloud auth application-default login

    echo "Successfully switched to $project_id"
}