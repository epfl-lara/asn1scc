; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35004 () Bool)

(assert start!35004)

(declare-fun res!137410 () Bool)

(declare-fun e!114048 () Bool)

(assert (=> start!35004 (=> (not res!137410) (not e!114048))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35004 (= res!137410 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35004 e!114048))

(assert (=> start!35004 true))

(declare-datatypes ((array!8311 0))(
  ( (array!8312 (arr!4638 (Array (_ BitVec 32) (_ BitVec 8))) (size!3717 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6590 0))(
  ( (BitStream!6591 (buf!4169 array!8311) (currentByte!7779 (_ BitVec 32)) (currentBit!7774 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6590)

(declare-fun e!114047 () Bool)

(declare-fun inv!12 (BitStream!6590) Bool)

(assert (=> start!35004 (and (inv!12 thiss!1577) e!114047)))

(declare-fun b!164929 () Bool)

(declare-fun res!137411 () Bool)

(assert (=> b!164929 (=> (not res!137411) (not e!114048))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164929 (= res!137411 (validate_offset_bits!1 ((_ sign_extend 32) (size!3717 (buf!4169 thiss!1577))) ((_ sign_extend 32) (currentByte!7779 thiss!1577)) ((_ sign_extend 32) (currentBit!7774 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164930 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164930 (= e!114048 (bvsge (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))) #b00000000000000000000000010000000))))

(declare-fun b!164931 () Bool)

(declare-fun array_inv!3458 (array!8311) Bool)

(assert (=> b!164931 (= e!114047 (array_inv!3458 (buf!4169 thiss!1577)))))

(assert (= (and start!35004 res!137410) b!164929))

(assert (= (and b!164929 res!137411) b!164930))

(assert (= start!35004 b!164931))

(declare-fun m!262277 () Bool)

(assert (=> start!35004 m!262277))

(declare-fun m!262279 () Bool)

(assert (=> b!164929 m!262279))

(declare-fun m!262281 () Bool)

(assert (=> b!164930 m!262281))

(declare-fun m!262283 () Bool)

(assert (=> b!164931 m!262283))

(push 1)

(assert (not b!164931))

(assert (not b!164929))

(assert (not start!35004))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

