; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70996 () Bool)

(assert start!70996)

(declare-fun res!263478 () Bool)

(declare-fun e!230905 () Bool)

(assert (=> start!70996 (=> (not res!263478) (not e!230905))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20246 0))(
  ( (array!20247 (arr!9916 (Array (_ BitVec 32) (_ BitVec 8))) (size!8824 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13810 0))(
  ( (BitStream!13811 (buf!7966 array!20246) (currentByte!14697 (_ BitVec 32)) (currentBit!14692 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13810)

(assert (=> start!70996 (= res!263478 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8824 (buf!7966 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14697 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14692 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8824 (buf!7966 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14697 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14692 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70996 e!230905))

(assert (=> start!70996 true))

(declare-fun e!230907 () Bool)

(declare-fun inv!12 (BitStream!13810) Bool)

(assert (=> start!70996 (and (inv!12 thiss!1788) e!230907)))

(declare-fun b!320741 () Bool)

(declare-fun res!263479 () Bool)

(assert (=> b!320741 (=> (not res!263479) (not e!230905))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320741 (= res!263479 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14692 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14697 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8824 (buf!7966 thiss!1788))))))))

(declare-fun b!320742 () Bool)

(assert (=> b!320742 (= e!230905 (bvslt ((_ sign_extend 32) nBits!545) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!320743 () Bool)

(declare-fun array_inv!8376 (array!20246) Bool)

(assert (=> b!320743 (= e!230907 (array_inv!8376 (buf!7966 thiss!1788)))))

(assert (= (and start!70996 res!263478) b!320741))

(assert (= (and b!320741 res!263479) b!320742))

(assert (= start!70996 b!320743))

(declare-fun m!459111 () Bool)

(assert (=> start!70996 m!459111))

(declare-fun m!459113 () Bool)

(assert (=> b!320741 m!459113))

(declare-fun m!459115 () Bool)

(assert (=> b!320743 m!459115))

(push 1)

(assert (not b!320743))

(assert (not start!70996))

(assert (not b!320741))

(check-sat)

