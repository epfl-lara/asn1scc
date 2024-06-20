; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35008 () Bool)

(assert start!35008)

(declare-fun res!137422 () Bool)

(declare-fun e!114064 () Bool)

(assert (=> start!35008 (=> (not res!137422) (not e!114064))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35008 (= res!137422 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35008 e!114064))

(assert (=> start!35008 true))

(declare-datatypes ((array!8315 0))(
  ( (array!8316 (arr!4640 (Array (_ BitVec 32) (_ BitVec 8))) (size!3719 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6594 0))(
  ( (BitStream!6595 (buf!4171 array!8315) (currentByte!7781 (_ BitVec 32)) (currentBit!7776 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6594)

(declare-fun e!114065 () Bool)

(declare-fun inv!12 (BitStream!6594) Bool)

(assert (=> start!35008 (and (inv!12 thiss!1577) e!114065)))

(declare-fun b!164947 () Bool)

(declare-fun res!137423 () Bool)

(assert (=> b!164947 (=> (not res!137423) (not e!114064))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164947 (= res!137423 (validate_offset_bits!1 ((_ sign_extend 32) (size!3719 (buf!4171 thiss!1577))) ((_ sign_extend 32) (currentByte!7781 thiss!1577)) ((_ sign_extend 32) (currentBit!7776 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164948 () Bool)

(declare-fun lt!258522 () (_ BitVec 32))

(assert (=> b!164948 (= e!114064 (and (bvslt lt!258522 #b00000000000000000000000010000000) (bvslt lt!258522 #b11111111111111111111111110000000)))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164948 (= lt!258522 (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))

(declare-fun b!164949 () Bool)

(declare-fun array_inv!3460 (array!8315) Bool)

(assert (=> b!164949 (= e!114065 (array_inv!3460 (buf!4171 thiss!1577)))))

(assert (= (and start!35008 res!137422) b!164947))

(assert (= (and b!164947 res!137423) b!164948))

(assert (= start!35008 b!164949))

(declare-fun m!262293 () Bool)

(assert (=> start!35008 m!262293))

(declare-fun m!262295 () Bool)

(assert (=> b!164947 m!262295))

(declare-fun m!262297 () Bool)

(assert (=> b!164948 m!262297))

(declare-fun m!262299 () Bool)

(assert (=> b!164949 m!262299))

(check-sat (not start!35008) (not b!164949) (not b!164947))
(check-sat)
