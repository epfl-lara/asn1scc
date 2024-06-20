; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34984 () Bool)

(assert start!34984)

(declare-fun res!137350 () Bool)

(declare-fun e!113958 () Bool)

(assert (=> start!34984 (=> (not res!137350) (not e!113958))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34984 (= res!137350 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34984 e!113958))

(assert (=> start!34984 true))

(declare-datatypes ((array!8291 0))(
  ( (array!8292 (arr!4628 (Array (_ BitVec 32) (_ BitVec 8))) (size!3707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6570 0))(
  ( (BitStream!6571 (buf!4159 array!8291) (currentByte!7769 (_ BitVec 32)) (currentBit!7764 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6570)

(declare-fun e!113957 () Bool)

(declare-fun inv!12 (BitStream!6570) Bool)

(assert (=> start!34984 (and (inv!12 thiss!1577) e!113957)))

(declare-fun b!164839 () Bool)

(declare-fun res!137351 () Bool)

(assert (=> b!164839 (=> (not res!137351) (not e!113958))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164839 (= res!137351 (validate_offset_bits!1 ((_ sign_extend 32) (size!3707 (buf!4159 thiss!1577))) ((_ sign_extend 32) (currentByte!7769 thiss!1577)) ((_ sign_extend 32) (currentBit!7764 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164840 () Bool)

(assert (=> b!164840 (= e!113958 (bvsge (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7764 thiss!1577))))) #b00000000000000000000000010000000))))

(declare-fun b!164841 () Bool)

(declare-fun array_inv!3448 (array!8291) Bool)

(assert (=> b!164841 (= e!113957 (array_inv!3448 (buf!4159 thiss!1577)))))

(assert (= (and start!34984 res!137350) b!164839))

(assert (= (and b!164839 res!137351) b!164840))

(assert (= start!34984 b!164841))

(declare-fun m!262203 () Bool)

(assert (=> start!34984 m!262203))

(declare-fun m!262205 () Bool)

(assert (=> b!164839 m!262205))

(declare-fun m!262207 () Bool)

(assert (=> b!164840 m!262207))

(declare-fun m!262209 () Bool)

(assert (=> b!164841 m!262209))

(check-sat (not b!164839) (not start!34984) (not b!164841))
(check-sat)
