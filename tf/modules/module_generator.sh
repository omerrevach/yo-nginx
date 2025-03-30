#!/bin/bash

# check if at least one parameter is provided
if [ $# -eq 0 ]; then
    echo "Error: No module names provided"
    echo "Usage: $0 module1 [module2 module3 ...]"
    exit 1
fi

# function to create the module structure for terraform (output.tf, cars.tf, main.tf)
create_module() {
    local module_name=$1
    
    # create module directory
    if [ -d "$module_name" ]; then
        echo "Warning: Directory $module_name already exists"
    else
        mkdir -p "$module_name"
        echo "Created directory: $module_name"
    fi
    
    # create template files
    for file in main.tf outputs.tf vars.tf; do
        if [ -f "$module_name/$file" ]; then
            echo "Warning: File $module_name/$file already exists"
        else
            touch "$module_name/$file"
            echo "Created file: $module_name/$file"
        fi
    done
}

# process each module name provided as parameter
for module in "$@"; do
    echo "Creating module structure for: $module"
    create_module "$module"
    echo "----------------------------------------"
done

echo "Module generation complete!"