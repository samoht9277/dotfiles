class Reader():
    
    def read(self, file):
        """Reads file from given parameter."""
        if not file: SyntaxError("You must pass a file!")
        with open(file) as f:
            return f.read()

    def read_colorcheme(self):
        from json import loads
        with open('/home/tomi/code/theme-changer/colors.json') as f:
            return loads(f.read())