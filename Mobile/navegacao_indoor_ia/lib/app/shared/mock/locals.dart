List<int> route = [
  0,
  1,
  49,
  50,
  51,
  38,
  39,
  40,
  41,
  42,
  43,
  53,
  54,
  55,
  56,
  10,
  9,
  8,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  48,
  47,
  32,
  47,
  48,
  27,
  26,
  25,
  24,
  23,
  22,
  21,
  20,
  19,
  18,
  17
];

String jsonStateList = """[
{
"id": 0,
"name": "Porta",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 12,
"pox_y": 80
},
{
"id": 1,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 25,
"pox_y": 80
},
{
"id": 2,
"name": "Unique",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 25,
"pox_y": 70
},
{
"id": 3,
"name": "Lojas Brasil",
"bias": 0,
"is_cross": 0,
"category": "Market",
"pox_x": 25,
"pox_y": 50
},
{
"id": 4,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 25,
"pox_y": 25
},
{
"id": 5,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 55,
"pox_y": 25
},
{
"id": 6,
"name": "Cacau Show",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 55,
"pox_y": 40
},
{
"id": 7,
"name": "Samsung",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 60,
"pox_y": 40
},
{
"id": 8,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 60,
"pox_y": 50
},
{
"id": 9,
"name": "JBL",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 90,
"pox_y": 50
},
{
"id": 10,
"name": "Huawei",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 110,
"pox_y": 50
},
{
"id": 11,
"name": "TPLINK",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 125,
"pox_y": 50
},
{
"id": 12,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 135,
"pox_y": 50
},
{
"id": 13,
"name": "Cinema",
"bias": 0,
"is_cross": 0,
"category": "Entertainment",
"pox_x": 135,
"pox_y": 30
},
{
"id": 14,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 135,
"pox_y": 20
},
{
"id": 15,
"name": "Kei",
"bias": 0,
"is_cross": 0,
"category": "Market",
"pox_x": 145,
"pox_y": 20
},
{
"id": 16,
"name": "OnePlus",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 155,
"pox_y": 20
},
{
"id": 17,
"name": "Galego Do Peixe",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 165,
"pox_y": 20
},
{
"id": 18,
"name": "Steak House",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 165,
"pox_y": 40
},
{
"id": 19,
"name": "BK",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 165,
"pox_y": 55
},
{
"id": 20,
"name": "Mc Donalds",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 165,
"pox_y": 65
},
{
"id": 21,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 165,
"pox_y": 85
},
{
"id": 22,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 135,
"pox_y": 85
},
{
"id": 23,
"name": "POP",
"bias": 0,
"is_cross": 0,
"category": "Food",
"pox_x": 135,
"pox_y": 90
},
{
"id": 24,
"name": "Honda",
"bias": 0,
"is_cross": 0,
"category": "Automotive",
"pox_x": 135,
"pox_y": 100
},
{
"id": 25,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 145,
"pox_y": 100
},
{
"id": 26,
"name": "Cooler Master",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 145,
"pox_y": 105
},
{
"id": 27,
"name": "Jesus High Tech",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 145,
"pox_y": 120
},
{
"id": 28,
"name": "Estrijoias",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 155,
"pox_y": 120
},
{
"id": 29,
"name": "Americanas",
"bias": 0,
"is_cross": 0,
"category": "Market",
"pox_x": 155,
"pox_y": 145
},
{
"id": 30,
"name": "Magazine Luiza",
"bias": 0,
"is_cross": 0,
"category": "Market",
"pox_x": 125,
"pox_y": 145
},
{
"id": 31,
"name": "Joalheira Pérola",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 110,
"pox_y": 145
},
{
"id": 32,
"name": "ItatechJr",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 90,
"pox_y": 145
},
{
"id": 33,
"name": "Riot Games",
"bias": 0,
"is_cross": 0,
"category": "Games",
"pox_x": 80,
"pox_y": 145
},
{
"id": 34,
"name": "My Drunks",
"bias": 0,
"is_cross": 0,
"category": "Drink",
"pox_x": 60,
"pox_y": 145
},
{
"id": 35,
"name": "Golden Fitness",
"bias": 0,
"is_cross": 0,
"category": "Fit",
"pox_x": 50,
"pox_y": 145
},
{
"id": 36,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 50,
"pox_y": 135
},
{
"id": 37,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 50,
"pox_y": 120
},
{
"id": 38,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 35,
"pox_y": 110
},
{
"id": 39,
"name": "Hoyoverse",
"bias": 0,
"is_cross": 0,
"category": "Games",
"pox_x": 35,
"pox_y": 90
},
{
"id": 40,
"name": "Asus",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 35,
"pox_y": 80
},
{
"id": 41,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 35,
"pox_y": 60
},
{
"id": 42,
"name": "Evolution",
"bias": 0,
"is_cross": 0,
"category": "Fit",
"pox_x": 40,
"pox_y": 60
},
{
"id": 43,
"name": "Motorola",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 55,
"pox_y": 60
},
{
"id": 44,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 55,
"pox_y": 50
},
{
"id": 45,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 35,
"pox_y": 50
},
{
"id": 46,
"name": "Renner",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 80,
"pox_y": 135
},
{
"id": 47,
"name": "Riachuelo",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 90,
"pox_y": 135
},
{
"id": 48,
"name": "#",
"bias": 0,
"is_cross": 1,
"category": "#",
"pox_x": 145,
"pox_y": 135
},
{
"id": 49,
"name": "Apple",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 25,
"pox_y": 90
},
{
"id": 50,
"name": "Sky",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 25,
"pox_y": 105
},
{
"id": 51,
"name": "Logitech",
"bias": 0,
"is_cross": 0,
"category": "Tech",
"pox_x": 25,
"pox_y": 110
},
{
"id": 52,
"name": "Musicyan",
"bias": 0,
"is_cross": 0,
"category": "Entertainment",
"pox_x": 25,
"pox_y": 120
},
{
"id": 53,
"name": "C&A",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 25,
"pox_y": 135
},
{
"id": 54,
"name": "Cartel",
"bias": 0,
"is_cross": 0,
"category": "Fashion",
"pox_x": 25,
"pox_y": 145
}
]""";
