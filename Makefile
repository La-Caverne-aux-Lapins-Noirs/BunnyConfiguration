
all:
	@(cd lib/ && make -j2 && cp *.a ../) && \
	 (cd bin/mergeconf && make && cp mergeconf ../../) && \
	 (cd bin/fetchconf && make && cp fetchconf ../../)
clean:
	rm -f fetchconf mergeconf *.a
fclean:	clean
	@(cd lib/ && make fclean) && \
	 (cd bin/mergeconf && make fclean) && \
	 (cd bin/fetchconf && make fclean)
re:	fclean all

install: all
	@cp *.a /usr/lib/
	@mkdir /usr/include/bunnyconf && cp inc/* /usr/include/
	@cp fetchconf mergeconf /usr/bin/
