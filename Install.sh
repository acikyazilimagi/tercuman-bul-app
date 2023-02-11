#!/bin/sh
# Made By it's YEÇ - That's YEÇ!

emptySpace() {
    echo ""
}

header() {
    echo "Welcome To IT Deprem Flutter Installer"
    echo "     Made By IT Deprem Team       "
    emptySpace
}

macOS() {
    echo "macOS install progress is started! Please do not stop the progress until end"
    echo "Brew install is started"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "FVM install is started"
    brew tap leoafarias/fvm
    brew install fvm
    echo "Flutter 3.7.3 is install your device"
    fvm install 3.7.3
    echo "FVM configuration is started"
    fvm global 3.7.3
    echo "Flutter 3.7.3 configured as global"
    echo "Flutter export configuration is working"
    export PATH="$PATH":"$HOME/.pub-cache/bin"
    echo "FVM latest configuration is started"
    fvm dart pub global activate fvm
    echo "Checking Flutter install status"
    fvm flutter doctor --v
    echo "Flutter Gen install is started"
    fvm dart pub global activate flutter_gen
    echo "Flutter Gen install is completed!"
    echo "Install is completed, this installer is not checking any fail case. If you seen any"
    echo "Error or similar please contact with YEÇ"
    emptySpace
    echo "For use case, Flutter command directly will not work! You can use the Flutter with-"
    # shellcheck disable=SC2006
    echo "`fvm flutter` and `fvm dart` will work"
}

windows() {
    echo "Currently this sh only support OS X, in the future Windows support will add"
}

menu() {
    PS3="Type the number that corresponds to your OS, followed by [ENTER]:"
    options=("macOS" "Windows" "Quit")
    clear
    header
    select opt in "${options[@]}"
    do
        case $opt in
            "Windows")
                windows
                break;;
            "macOS")
                macOS
                break;;
            "Quit")
                echo "Quitting, no changes made."
                break;;
            *)
                clear
                header
                menu;;
        esac
    done
}

menu

echo "Installer is finished!"