#!/bin/bash
find . -type f -exec sed -i 's/old_text/new_text/g' {} +
