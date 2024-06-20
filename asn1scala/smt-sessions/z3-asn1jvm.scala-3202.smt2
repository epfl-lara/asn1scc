; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73506 () Bool)

(assert start!73506)

(declare-fun bufLength!7 () (_ BitVec 64))

(declare-fun currentByte!23 () (_ BitVec 64))

(declare-fun currentBit!18 () (_ BitVec 64))

(assert (=> start!73506 (and (bvsle bufLength!7 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!23 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!18 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!7 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!23 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!18 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt currentByte!23 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> start!73506 true))

(check-sat)
