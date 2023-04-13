#!/bin/bash

# create group and add current user to the group
useradd -u 6008 $USER -m
useradd -u 7000 mongod -m
