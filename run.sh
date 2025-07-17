#!/bin/sh

# This function is called when SIGTERM is received.
# It prints a message and exits.
graceful_shutdown() {
  echo "SIGTERM received, shutting down sample-app gracefully..."
  exit 0
}

# Trap the TERM signal and call our shutdown function.
trap 'graceful_shutdown' TERM

# The main loop.
echo "Sample app started. Logging every 3 seconds..."
while true
do
  # Print our log message.
  echo "{\"timestamp\":\"$(date -u +%s)\",\"level\":\"INFO\",\"message\":\"Processing user request\",\"user_id\":\"user-123\"}"
  
  # Sleep in the foreground. This is the key change.
  # The trap will interrupt this sleep command.
  sleep 3
done