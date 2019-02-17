# iguana-email-automation

This repository contains Iguana channels for running Python scripts for automating an email autoresponder process. There are two channels - one channel enables the email autoresponder, and the other disables the email autoresponder. This channel is to be used in combination with the [email-automation](https://github.com/LeNPaul/email-automation) script.

### To Do
 * Update scheduling module for more refined scheduling ability.
   * Instead of running one task once a day every day, run more than one task and be able to customize times of the day, which days, etc.
 * Combine two channels into one.
 * Refactor logic for excluding holidays.
 * Potentially put this all in a Python application.
   * Instead of using Iguana channel for scheduling and email notification, use Python application.
   * Using a production Flask Python server will be more reliable.
 * There will be an update on May which will break this program, and requires changes when this happens.
