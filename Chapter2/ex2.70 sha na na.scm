; Exercise 2.70
; depends on encode (ex2.68) and generate-huffman-tree (ex2.69)

(define song-pair
	'((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9) (JOB 2) (WAH 1)))

(make-leaf-set song-pair)
(define song-tree (generate-huffman-tree song-pair))

(define song-lyric
	'(GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  GET A JOB
	  SHA NA NA NA NA NA NA NA NA
	  WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
	  SHA BOOM))

(define encode-song (encode song-lyric song-tree))
(encode-song)

; decode to test
(decode encode-song song-tree)

(length (encode song-lyric song-tree))
; 87 bits
; 8 kinds of symbles in total, then each symble need 3 numbers of bits to store (2^3)
; this song has
(length song-lyric)
; 36 words(symbols), 36*3=108 bits.
; so 108 number of bits would be needed to encode the song if used a fixed-length code.