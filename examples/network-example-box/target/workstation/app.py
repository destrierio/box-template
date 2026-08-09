from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer

FLAG = "destrier{r3l4y_y4rd_55rf_p1v07}"


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"ok\n")
            return

        if self.path == "/flag":
            self.send_response(200)
            self.end_headers()
            self.wfile.write((FLAG + "\n").encode())
            return

        self.send_response(404)
        self.end_headers()


ThreadingHTTPServer(("0.0.0.0", 8001), Handler).serve_forever()
