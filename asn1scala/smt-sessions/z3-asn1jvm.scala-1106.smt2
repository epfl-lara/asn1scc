; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31772 () Bool)

(assert start!31772)

(declare-fun res!132403 () Bool)

(declare-fun e!107817 () Bool)

(assert (=> start!31772 (=> (not res!132403) (not e!107817))))

(declare-datatypes ((array!7396 0))(
  ( (array!7397 (arr!4277 (Array (_ BitVec 32) (_ BitVec 8))) (size!3356 (_ BitVec 32))) )
))
(declare-fun buf!77 () array!7396)

(declare-fun bytes!14 () (_ BitVec 32))

(declare-datatypes ((BitStream!5880 0))(
  ( (BitStream!5881 (buf!3814 array!7396) (currentByte!7006 (_ BitVec 32)) (currentBit!7001 (_ BitVec 32))) )
))
(declare-fun b1!99 () BitStream!5880)

(assert (=> start!31772 (= res!132403 (and (= (size!3356 (buf!3814 b1!99)) (size!3356 buf!77)) (bvsge bytes!14 #b00000000000000000000000000000000)))))

(assert (=> start!31772 e!107817))

(declare-fun e!107815 () Bool)

(declare-fun inv!12 (BitStream!5880) Bool)

(assert (=> start!31772 (and (inv!12 b1!99) e!107815)))

(declare-fun array_inv!3103 (array!7396) Bool)

(assert (=> start!31772 (array_inv!3103 buf!77)))

(assert (=> start!31772 true))

(declare-fun b!158521 () Bool)

(declare-fun res!132404 () Bool)

(assert (=> b!158521 (=> (not res!132404) (not e!107817))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!158521 (= res!132404 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3356 (buf!3814 b1!99))) ((_ sign_extend 32) (currentByte!7006 b1!99)) ((_ sign_extend 32) (currentBit!7001 b1!99)) bytes!14))))

(declare-fun b!158522 () Bool)

(assert (=> b!158522 (= e!107817 (or (bvsgt ((_ sign_extend 32) (size!3356 buf!77)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!7006 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!7001 b1!99)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!158523 () Bool)

(assert (=> b!158523 (= e!107815 (array_inv!3103 (buf!3814 b1!99)))))

(assert (= (and start!31772 res!132403) b!158521))

(assert (= (and b!158521 res!132404) b!158522))

(assert (= start!31772 b!158523))

(declare-fun m!249013 () Bool)

(assert (=> start!31772 m!249013))

(declare-fun m!249015 () Bool)

(assert (=> start!31772 m!249015))

(declare-fun m!249017 () Bool)

(assert (=> b!158521 m!249017))

(declare-fun m!249019 () Bool)

(assert (=> b!158523 m!249019))

(check-sat (not b!158521) (not start!31772) (not b!158523))
(check-sat)
