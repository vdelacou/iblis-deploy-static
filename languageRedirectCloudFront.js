exports.handler = (event, _context, callback) => {
  const request = event.Records[0].cf.request;
  const headers = request.headers;
  // only if we are at domain root
  if (request.uri == "/") {
    if (typeof headers["accept-language"] !== "undefined") {
      const supportedLanguages = headers["accept-language"][0].value;
      console.log("Supported languages:", supportedLanguages);
      if (supportedLanguages.startsWith("en")) {
        callback(null, redirect("/index.html"));
      } else if (supportedLanguages.startsWith("fr")) {
        callback(null, redirect("/fr/index.html"));
      } else {
        callback(null, redirect("/index.html"));
      }
    } else {
      callback(null, redirect("/index.html"));
    }
  } else {
    callback(null, request);
  }
};

function redirect(to) {
  return {
    status: "301",
    statusDescription: "redirect to browser language",
    headers: {
      location: [{ key: "Location", value: to }]
    }
  };
}
