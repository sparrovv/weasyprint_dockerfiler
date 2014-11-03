import tornado.ioloop
import tornado.web
import weasyprint

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Weasyprint test tornado server POST /pdf")

    def post(self):
        self.write(weasyprint.HTML(string=self.request.body).write_pdf())

application = tornado.web.Application([
    (r"/", MainHandler),
    (r"/pdf", MainHandler),
])

if __name__ == "__main__":
    application.listen(5000)
    tornado.ioloop.IOLoop.instance().start()
