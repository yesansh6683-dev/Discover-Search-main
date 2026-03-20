#!/bin/bash
echo "=== Verifying Assets for Android Build ==="
echo ""

cd assets/images || exit 1

echo "1. Checking all PNG files are valid..."
for f in *.png; do
    type=$(file "$f" | grep "PNG image")
    if [ -z "$type" ]; then
        echo "   ❌ $f is NOT a valid PNG!"
        exit 1
    else
        echo "   ✓ $f is valid"
    fi
done

echo ""
echo "2. Checking image sizes..."
for f in *.png *.jpg; do
    size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null)
    kb=$((size / 1024))
    echo "   $f: ${kb}KB"
done

echo ""
echo "=== All assets verified successfully! ==="
