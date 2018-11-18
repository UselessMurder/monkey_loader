import argparse

class Parser:
    def __init__(self, args):
        self.source = args.source_prj
        self.offsets = args.offsets_file

    def parse(self):
        pass

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('dll_path', help='source dll')
    parser.add_argument('offsets_path', help='json with funcs offsets definition')
    args = parser.parse_args()
    main_parser = Parser(args)
    main_parser.parse()

if __name__=='__main__':
    main()
