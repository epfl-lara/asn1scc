; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52380 () Bool)

(assert start!52380)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13209 0))(
  ( (array!13210 (arr!6773 (Array (_ BitVec 32) (_ BitVec 8))) (size!5786 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10494 0))(
  ( (BitStream!10495 (buf!6252 array!13209) (currentByte!11612 (_ BitVec 32)) (currentBit!11607 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10494)

(assert (=> start!52380 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (or (bvsgt ((_ sign_extend 32) (size!5786 (buf!6252 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11612 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11607 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52380 true))

(declare-fun e!167098 () Bool)

(declare-fun inv!12 (BitStream!10494) Bool)

(assert (=> start!52380 (and (inv!12 thiss!1005) e!167098)))

(declare-fun b!241148 () Bool)

(declare-fun array_inv!5527 (array!13209) Bool)

(assert (=> b!241148 (= e!167098 (array_inv!5527 (buf!6252 thiss!1005)))))

(assert (= start!52380 b!241148))

(declare-fun m!363865 () Bool)

(assert (=> start!52380 m!363865))

(declare-fun m!363867 () Bool)

(assert (=> b!241148 m!363867))

(check-sat (not start!52380) (not b!241148))
(check-sat)
