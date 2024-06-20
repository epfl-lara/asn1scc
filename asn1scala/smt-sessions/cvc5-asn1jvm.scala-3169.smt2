; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72828 () Bool)

(assert start!72828)

(declare-fun b!324604 () Bool)

(declare-fun e!233988 () Bool)

(declare-datatypes ((array!20876 0))(
  ( (array!20877 (arr!10165 (Array (_ BitVec 32) (_ BitVec 8))) (size!9073 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14308 0))(
  ( (BitStream!14309 (buf!8215 array!20876) (currentByte!15198 (_ BitVec 32)) (currentBit!15193 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14308)

(declare-fun array_inv!8625 (array!20876) Bool)

(assert (=> b!324604 (= e!233988 (array_inv!8625 (buf!8215 thiss!877)))))

(declare-fun res!266404 () Bool)

(declare-fun e!233986 () Bool)

(assert (=> start!72828 (=> (not res!266404) (not e!233986))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72828 (= res!266404 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9073 (buf!8215 thiss!877))) ((_ sign_extend 32) (currentByte!15198 thiss!877)) ((_ sign_extend 32) (currentBit!15193 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72828 e!233986))

(declare-fun inv!12 (BitStream!14308) Bool)

(assert (=> start!72828 (and (inv!12 thiss!877) e!233988)))

(declare-fun b!324602 () Bool)

(declare-fun res!266402 () Bool)

(assert (=> b!324602 (=> (not res!266402) (not e!233986))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324602 (= res!266402 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9073 (buf!8215 thiss!877)) (currentByte!15198 thiss!877) (currentBit!15193 thiss!877))) (bitIndex!0 (size!9073 (buf!8215 thiss!877)) (currentByte!15198 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15193 thiss!877)))))))

(declare-fun b!324601 () Bool)

(declare-fun res!266403 () Bool)

(assert (=> b!324601 (=> (not res!266403) (not e!233986))))

(assert (=> b!324601 (= res!266403 (bvslt (currentBit!15193 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324603 () Bool)

(assert (=> b!324603 (= e!233986 (or (bvsgt ((_ sign_extend 32) (size!9073 (buf!8215 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!15198 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15193 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (= (and start!72828 res!266404) b!324601))

(assert (= (and b!324601 res!266403) b!324602))

(assert (= (and b!324602 res!266402) b!324603))

(assert (= start!72828 b!324604))

(declare-fun m!462691 () Bool)

(assert (=> b!324604 m!462691))

(declare-fun m!462693 () Bool)

(assert (=> start!72828 m!462693))

(declare-fun m!462695 () Bool)

(assert (=> start!72828 m!462695))

(declare-fun m!462697 () Bool)

(assert (=> b!324602 m!462697))

(declare-fun m!462699 () Bool)

(assert (=> b!324602 m!462699))

(push 1)

(assert (not b!324604))

(assert (not b!324602))

(assert (not start!72828))

(check-sat)

(pop 1)

(push 1)

(check-sat)

