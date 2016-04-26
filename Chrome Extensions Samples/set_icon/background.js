// Copyright (c) 2011 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

var min = 1;
var max = 5;
var current = min;

function updateIcon() {
  chrome.browserAction.setIcon({path:"icon" + current + ".png"});
  chrome.browserAction.setTitle({title:"got you"});
  chrome.browserAction.setBadgeText({text: "ON"});
  current++;

  if (current > max)
    current = min;
}

chrome.browserAction.onClicked.addListener(updateIcon);
updateIcon();