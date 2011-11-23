/*
    Copyright 2011 Chris Desjardins - cjd@chrisd.info

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/*
    To see what this program does, check out:
    http://youtu.be/X3yo5z44HFA
*/

#define NOID_1  3
#define NOID_2  4
#define NOID_3  5
#define NOID_4  6
#define NOID_5  9
#define NOID_6  10
#define NOID_7  11
#define NOID_8  12
#define INTERRUPT_PIN  2

#define NOID_C   NOID_1
#define NOID_D   NOID_2
#define NOID_E   NOID_3
#define NOID_F   NOID_4
#define NOID_G   NOID_5
#define NOID_A   NOID_6
#define NOID_B   NOID_7
#define NOID_HC  NOID_8

#define MULTINOID_MAX  4
#define MULTINOID_SET(first,second,third,fourth) ((first << 0) | (second << 8) | (third << 16) | (fourth << 24))
#define MULTINOID_GET(noids, i)  ((noids >> (8 * i)) & 0xff)

#define MAKE_SONG(song) song, sizeof(song) / sizeof(int)
int rung = 0;

/* Here are all of the songs this thing can play */
int scale[] = 
{
  100, NOID_1,
  300, NOID_2,
  100, NOID_3,
  300, NOID_4,
  100, NOID_5,
  300, NOID_6,
  100, NOID_7,
  300, NOID_8,
};

int ode_to_joy[] = 
{
  300, NOID_E, 
  300, NOID_E, 
  300, NOID_F, 
  300, NOID_G,
  
  300, NOID_G, 
  300, NOID_F, 
  300, NOID_E, 
  300, NOID_D,
  
  300, NOID_C, 
  300, NOID_C, 
  300, NOID_D, 
  300, NOID_E,
  
  450, NOID_E, 
  200, NOID_D, 
  600, NOID_D,

  300, NOID_E, 
  300, NOID_E, 
  300, NOID_F, 
  300, NOID_G,
  
  300, NOID_G, 
  300, NOID_F, 
  300, NOID_E, 
  300, NOID_D,
  
  300, NOID_C, 
  300, NOID_C, 
  300, NOID_D, 
  300, NOID_E,

  450, NOID_D, 
  200, NOID_C, 
  600, NOID_C,
};

int fifth[] = 
{
  150, NOID_G,
  150, NOID_G,
  150, NOID_G,
  
  1000, NOID_E,
  
  200, NOID_G,
  200, NOID_G,
  200, NOID_G,
  
  1000, NOID_D,
};

int chopsticks[] = 
{
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),

  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  

  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),

  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),

  200, MULTINOID_SET(NOID_C, NOID_HC, 0,0),
  200, MULTINOID_SET(NOID_C, NOID_HC, 0,0),
  200, MULTINOID_SET(NOID_C, NOID_HC, 0,0),

  200, MULTINOID_SET(NOID_C, NOID_HC, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_A, NOID_E, 0,0),


  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),

  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
    
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_E, 0,0),


  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),

  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),
  200, MULTINOID_SET(NOID_B, NOID_D, 0,0),

  400, MULTINOID_SET(NOID_C, NOID_HC, 0,0),
  200, MULTINOID_SET(NOID_G, NOID_F, 0,0),

  400, MULTINOID_SET(NOID_C, NOID_E, 0,0),
};

int oh_canada[] =
{
    600, MULTINOID_SET(NOID_D, NOID_F, 0,0),
    400, MULTINOID_SET(NOID_E, NOID_A, 0,0),
    200, MULTINOID_SET(NOID_A, 0,0,0),
    
    700, MULTINOID_SET(NOID_D, 0, 0,0),
    400, MULTINOID_SET(NOID_E, 0, 0,0),

    400, MULTINOID_SET(NOID_D, NOID_F, 0,0),
    400, MULTINOID_SET(NOID_D, NOID_G, 0,0),
    400, MULTINOID_SET(NOID_D, NOID_G, 0,0),
    400, MULTINOID_SET(NOID_D, NOID_B, 0,0),

    30, MULTINOID_SET(NOID_E, 0, 0,0),
    200, MULTINOID_SET(NOID_D, 0, 0,0),
};

struct s_songlist
{
  int *notes;
  int num_notes;
};

s_songlist songlist[] =
{
  { MAKE_SONG(oh_canada) },
  { MAKE_SONG(chopsticks) },
  { MAKE_SONG(ode_to_joy) },
  { MAKE_SONG(fifth) },
};

void setup()
{
  pinMode(NOID_1,  OUTPUT);
  pinMode(NOID_2,  OUTPUT);
  pinMode(NOID_3,  OUTPUT);
  pinMode(NOID_4,  OUTPUT);
  pinMode(NOID_5,  OUTPUT);
  pinMode(NOID_6,  OUTPUT);
  pinMode(NOID_7,  OUTPUT);
  pinMode(NOID_8,  OUTPUT);
  
  digitalWrite(NOID_1, LOW);
  digitalWrite(NOID_2, LOW);
  digitalWrite(NOID_3, LOW);
  digitalWrite(NOID_4, LOW);
  digitalWrite(NOID_5, LOW);
  digitalWrite(NOID_6, LOW);
  digitalWrite(NOID_7, LOW);
  digitalWrite(NOID_8, LOW);
  attachInterrupt(INTERRUPT_PIN - 2, doorbell_ring, RISING);
}

void doorbell_ring()
{
  rung = 1;  
}

void strike(int noids)
{
  int i;
  for (i = 0; i < MULTINOID_MAX; i++)
  {
    digitalWrite(MULTINOID_GET(noids, i), HIGH);
  }
  delay(10);
  for (i = 0; i < MULTINOID_MAX; i++)
  {
    digitalWrite(MULTINOID_GET(noids, i), LOW);
  }
}

void play_song(int *notes, int num_notes)
{
  int i; 
  for (i = 0; i < num_notes; i += 2)
  {
    strike(notes[i + 1]);
    delay(notes[i]);
  }
}

int song_index = 0;
void loop()
{
  if (rung == 1)
  {
    play_song(songlist[song_index].notes, songlist[song_index].num_notes);
    song_index = (song_index + 1) % (sizeof(songlist) / sizeof(s_songlist));
    rung = 0;
  }
}
