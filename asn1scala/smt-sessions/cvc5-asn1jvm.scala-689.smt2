; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19396 () Bool)

(assert start!19396)

(declare-fun res!79498 () Bool)

(declare-fun e!63486 () Bool)

(assert (=> start!19396 (=> (not res!79498) (not e!63486))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4522 0))(
  ( (array!4523 (arr!2661 (Array (_ BitVec 32) (_ BitVec 8))) (size!2068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3610 0))(
  ( (BitStream!3611 (buf!2414 array!4522) (currentByte!4821 (_ BitVec 32)) (currentBit!4816 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3610)

(assert (=> start!19396 (= res!79498 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2068 (buf!2414 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4821 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4816 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2068 (buf!2414 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4821 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4816 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19396 e!63486))

(assert (=> start!19396 true))

(declare-fun e!63485 () Bool)

(declare-fun inv!12 (BitStream!3610) Bool)

(assert (=> start!19396 (and (inv!12 thiss!1288) e!63485)))

(declare-fun b!96859 () Bool)

(declare-fun res!79497 () Bool)

(assert (=> b!96859 (=> (not res!79497) (not e!63486))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96859 (= res!79497 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4816 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4821 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2068 (buf!2414 thiss!1288))))))))

(declare-fun b!96860 () Bool)

(assert (=> b!96860 (= e!63486 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!96861 () Bool)

(declare-fun array_inv!1870 (array!4522) Bool)

(assert (=> b!96861 (= e!63485 (array_inv!1870 (buf!2414 thiss!1288)))))

(assert (= (and start!19396 res!79498) b!96859))

(assert (= (and b!96859 res!79497) b!96860))

(assert (= start!19396 b!96861))

(declare-fun m!140511 () Bool)

(assert (=> start!19396 m!140511))

(declare-fun m!140513 () Bool)

(assert (=> b!96859 m!140513))

(declare-fun m!140515 () Bool)

(assert (=> b!96861 m!140515))

(push 1)

(assert (not b!96861))

(assert (not b!96859))

(assert (not start!19396))

(check-sat)

