inp = input('화씨 온도 입력해줘: ')
try:
    fahr = float(inp)
    cel = (fahr - 32.0) * 5.0 / 9.0
    print(cel)
except ValueError:
    print('숫자를 입력해주세요!')
    
