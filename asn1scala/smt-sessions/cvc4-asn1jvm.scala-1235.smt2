; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35010 () Bool)

(assert start!35010)

(declare-fun res!137429 () Bool)

(declare-fun e!114075 () Bool)

(assert (=> start!35010 (=> (not res!137429) (not e!114075))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35010 (= res!137429 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35010 e!114075))

(assert (=> start!35010 true))

(declare-datatypes ((array!8317 0))(
  ( (array!8318 (arr!4641 (Array (_ BitVec 32) (_ BitVec 8))) (size!3720 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6596 0))(
  ( (BitStream!6597 (buf!4172 array!8317) (currentByte!7782 (_ BitVec 32)) (currentBit!7777 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6596)

(declare-fun e!114074 () Bool)

(declare-fun inv!12 (BitStream!6596) Bool)

(assert (=> start!35010 (and (inv!12 thiss!1577) e!114074)))

(declare-fun b!164956 () Bool)

(declare-fun res!137428 () Bool)

(assert (=> b!164956 (=> (not res!137428) (not e!114075))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164956 (= res!137428 (validate_offset_bits!1 ((_ sign_extend 32) (size!3720 (buf!4172 thiss!1577))) ((_ sign_extend 32) (currentByte!7782 thiss!1577)) ((_ sign_extend 32) (currentBit!7777 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164957 () Bool)

(declare-fun lt!258525 () (_ BitVec 32))

(assert (=> b!164957 (= e!114075 (and (bvslt lt!258525 #b00000000000000000000000010000000) (bvslt lt!258525 #b11111111111111111111111110000000)))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164957 (= lt!258525 (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))

(declare-fun b!164958 () Bool)

(declare-fun array_inv!3461 (array!8317) Bool)

(assert (=> b!164958 (= e!114074 (array_inv!3461 (buf!4172 thiss!1577)))))

(assert (= (and start!35010 res!137429) b!164956))

(assert (= (and b!164956 res!137428) b!164957))

(assert (= start!35010 b!164958))

(declare-fun m!262301 () Bool)

(assert (=> start!35010 m!262301))

(declare-fun m!262303 () Bool)

(assert (=> b!164956 m!262303))

(declare-fun m!262305 () Bool)

(assert (=> b!164957 m!262305))

(declare-fun m!262307 () Bool)

(assert (=> b!164958 m!262307))

(push 1)

(assert (not b!164958))

