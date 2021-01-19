#!/usr/bin/env newlisp

(let ((magic '(0x09 0xf9 0x11 0x02 0x9d 0x74 0xe3 0x5b 0xd8 0x41 0x56 0xc5 0x63 0x56 0x88 0xbc)))
  (for (i 0 6)
    (setf (magic 15) (+ (magic 15) 1))

    (if (!= i 3)
      (println (join (map (lambda (e) (format "%02x" e)) magic) " "))
      (println "                 [ redacted ]"))))

(exit)
