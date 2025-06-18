import json
import re

class CustomCommentsParser(CommentsParser):
    def __init__(self):
        pass

    def ParseAll(self, comment):
        if "@auth" in comment:
            return comment.replace("@auth", "<!-- auth -->").strip()
        return comment
