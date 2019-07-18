DIRSRC := src/
CC := elm-make 
OUT := --output 
APP := app.js


all : clean compile 

clean : 
	rm -r elm-stuff/build-artifacts
	rm app.js 


compile : 
	$(CC) $(DIRSRC)Conversor.elm $(OUT) $(APP)
	