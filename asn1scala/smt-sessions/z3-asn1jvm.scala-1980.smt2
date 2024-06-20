; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51052 () Bool)

(assert start!51052)

(declare-fun v!315 () (_ BitVec 64))

(declare-fun i!888 () (_ BitVec 32))

(assert (=> start!51052 (and (bvslt v!315 #b0000000000000000000000000000000000000000000000000000000000000000) (let ((bdg!14611 (bvsub (bvmul #b00000000000000000000000000001000 (ite (bvsge v!315 #b1111111111111111111111111111111111111111111111111111111110000000) #b00000000000000000000000000000001 (ite (bvsge v!315 #b1111111111111111111111111111111111111111111111111000000000000000) #b00000000000000000000000000000010 (ite (bvsge v!315 #b1111111111111111111111111111111111111111100000000000000000000000) #b00000000000000000000000000000011 (ite (bvsge v!315 #b1111111111111111111111111111111110000000000000000000000000000000) #b00000000000000000000000000000100 (ite (bvsge v!315 #b1111111111111111111111111000000000000000000000000000000000000000) #b00000000000000000000000000000101 (ite (bvsge v!315 #b1111111111111111100000000000000000000000000000000000000000000000) #b00000000000000000000000000000110 (ite (bvsge v!315 #b1111111110000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000111 #b00000000000000000000000000001000)))))))) #b00000000000000000000000000000001))) (and (bvsge i!888 bdg!14611) (bvsle i!888 #b00000000000000000000000001000000) (bvslt i!888 #b00000000000000000000000001000000) (bvslt (bvadd #b00000000000000000000000000000001 i!888) #b00000000000000000000000001000000) (bvslt (bvadd #b00000000000000000000000000000001 i!888) bdg!14611))))))

(assert (=> start!51052 true))

(check-sat)
