; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35002 () Bool)

(assert start!35002)

(declare-fun res!137404 () Bool)

(declare-fun e!114037 () Bool)

(assert (=> start!35002 (=> (not res!137404) (not e!114037))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35002 (= res!137404 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35002 e!114037))

(assert (=> start!35002 true))

(declare-datatypes ((array!8309 0))(
  ( (array!8310 (arr!4637 (Array (_ BitVec 32) (_ BitVec 8))) (size!3716 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6588 0))(
  ( (BitStream!6589 (buf!4168 array!8309) (currentByte!7778 (_ BitVec 32)) (currentBit!7773 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6588)

(declare-fun e!114038 () Bool)

(declare-fun inv!12 (BitStream!6588) Bool)

(assert (=> start!35002 (and (inv!12 thiss!1577) e!114038)))

(declare-fun b!164920 () Bool)

(declare-fun res!137405 () Bool)

(assert (=> b!164920 (=> (not res!137405) (not e!114037))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164920 (= res!137405 (validate_offset_bits!1 ((_ sign_extend 32) (size!3716 (buf!4168 thiss!1577))) ((_ sign_extend 32) (currentByte!7778 thiss!1577)) ((_ sign_extend 32) (currentBit!7773 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164921 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!164921 (= e!114037 (bvsge (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))) #b00000000000000000000000010000000))))

(declare-fun b!164922 () Bool)

(declare-fun array_inv!3457 (array!8309) Bool)

(assert (=> b!164922 (= e!114038 (array_inv!3457 (buf!4168 thiss!1577)))))

(assert (= (and start!35002 res!137404) b!164920))

(assert (= (and b!164920 res!137405) b!164921))

(assert (= start!35002 b!164922))

(declare-fun m!262269 () Bool)

(assert (=> start!35002 m!262269))

(declare-fun m!262271 () Bool)

(assert (=> b!164920 m!262271))

(declare-fun m!262273 () Bool)

(assert (=> b!164921 m!262273))

(declare-fun m!262275 () Bool)

(assert (=> b!164922 m!262275))

(check-sat (not b!164922) (not b!164920) (not start!35002))
(check-sat)
