; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51062 () Bool)

(assert start!51062)

(declare-fun v!315 () (_ BitVec 64))

(assert (=> start!51062 (and (bvslt v!315 #b0000000000000000000000000000000000000000000000000000000000000000) (let ((bdg!14613 (bvmul #b00000000000000000000000000001000 (ite (bvsge v!315 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!315 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!315 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!315 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!315 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!315 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!315 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000)))))))))) (let ((bdg!14614 (bvand bdg!14613 #b10000000000000000000000000000000))) (and (not (= bdg!14614 #b00000000000000000000000000000000)) (not (= bdg!14614 (bvand (bvsub bdg!14613 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))))

(assert (=> start!51062 true))

(push 1)

(check-sat)

(pop 1)

