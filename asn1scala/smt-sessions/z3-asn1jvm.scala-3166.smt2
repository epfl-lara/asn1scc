; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72756 () Bool)

(assert start!72756)

(declare-fun b!324451 () Bool)

(declare-fun e!233891 () Bool)

(declare-datatypes ((array!20854 0))(
  ( (array!20855 (arr!10157 (Array (_ BitVec 32) (_ BitVec 8))) (size!9065 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14292 0))(
  ( (BitStream!14293 (buf!8207 array!20854) (currentByte!15174 (_ BitVec 32)) (currentBit!15169 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14292)

(declare-fun array_inv!8617 (array!20854) Bool)

(assert (=> b!324451 (= e!233891 (array_inv!8617 (buf!8207 thiss!877)))))

(declare-fun res!266275 () Bool)

(declare-fun e!233890 () Bool)

(assert (=> start!72756 (=> (not res!266275) (not e!233890))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72756 (= res!266275 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9065 (buf!8207 thiss!877))) ((_ sign_extend 32) (currentByte!15174 thiss!877)) ((_ sign_extend 32) (currentBit!15169 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72756 e!233890))

(declare-fun inv!12 (BitStream!14292) Bool)

(assert (=> start!72756 (and (inv!12 thiss!877) e!233891)))

(declare-fun b!324449 () Bool)

(declare-fun res!266273 () Bool)

(assert (=> b!324449 (=> (not res!266273) (not e!233890))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324449 (= res!266273 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9065 (buf!8207 thiss!877)) (currentByte!15174 thiss!877) (currentBit!15169 thiss!877))) (bitIndex!0 (size!9065 (buf!8207 thiss!877)) (currentByte!15174 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15169 thiss!877)))))))

(declare-fun b!324450 () Bool)

(assert (=> b!324450 (= e!233890 (or (bvsgt ((_ sign_extend 32) (size!9065 (buf!8207 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15174 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!15169 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!324448 () Bool)

(declare-fun res!266274 () Bool)

(assert (=> b!324448 (=> (not res!266274) (not e!233890))))

(assert (=> b!324448 (= res!266274 (bvslt (currentBit!15169 thiss!877) #b00000000000000000000000000000111))))

(assert (= (and start!72756 res!266275) b!324448))

(assert (= (and b!324448 res!266274) b!324449))

(assert (= (and b!324449 res!266273) b!324450))

(assert (= start!72756 b!324451))

(declare-fun m!462569 () Bool)

(assert (=> b!324451 m!462569))

(declare-fun m!462571 () Bool)

(assert (=> start!72756 m!462571))

(declare-fun m!462573 () Bool)

(assert (=> start!72756 m!462573))

(declare-fun m!462575 () Bool)

(assert (=> b!324449 m!462575))

(declare-fun m!462577 () Bool)

(assert (=> b!324449 m!462577))

(check-sat (not b!324449) (not start!72756) (not b!324451))
(check-sat)
