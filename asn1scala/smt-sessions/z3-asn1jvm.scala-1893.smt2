; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49634 () Bool)

(assert start!49634)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12246 0))(
  ( (array!12247 (arr!6368 (Array (_ BitVec 32) (_ BitVec 8))) (size!5381 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9726 0))(
  ( (BitStream!9727 (buf!5856 array!12246) (currentByte!10908 (_ BitVec 32)) (currentBit!10903 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9726)

(assert (=> start!49634 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5381 (buf!5856 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!10908 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!10903 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!49634 true))

(declare-fun e!161905 () Bool)

(declare-fun inv!12 (BitStream!9726) Bool)

(assert (=> start!49634 (and (inv!12 bs!63) e!161905)))

(declare-fun b!234269 () Bool)

(declare-fun array_inv!5122 (array!12246) Bool)

(assert (=> b!234269 (= e!161905 (array_inv!5122 (buf!5856 bs!63)))))

(assert (= start!49634 b!234269))

(declare-fun m!356909 () Bool)

(assert (=> start!49634 m!356909))

(declare-fun m!356911 () Bool)

(assert (=> b!234269 m!356911))

(check-sat (not b!234269) (not start!49634))
(check-sat)
