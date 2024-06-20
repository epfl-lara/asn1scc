; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52022 () Bool)

(assert start!52022)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-datatypes ((array!13085 0))(
  ( (array!13086 (arr!6719 (Array (_ BitVec 32) (_ BitVec 8))) (size!5732 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10386 0))(
  ( (BitStream!10387 (buf!6186 array!13085) (currentByte!11525 (_ BitVec 32)) (currentBit!11520 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10386)

(assert (=> start!52022 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000) (or (bvsgt ((_ sign_extend 32) (size!5732 (buf!6186 thiss!982))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11525 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11520 thiss!982)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!52022 true))

(declare-fun e!166240 () Bool)

(declare-fun inv!12 (BitStream!10386) Bool)

(assert (=> start!52022 (and (inv!12 thiss!982) e!166240)))

(declare-fun b!239801 () Bool)

(declare-fun array_inv!5473 (array!13085) Bool)

(assert (=> b!239801 (= e!166240 (array_inv!5473 (buf!6186 thiss!982)))))

(assert (= start!52022 b!239801))

(declare-fun m!362111 () Bool)

(assert (=> start!52022 m!362111))

(declare-fun m!362113 () Bool)

(assert (=> b!239801 m!362113))

(check-sat (not b!239801) (not start!52022))
(check-sat)
