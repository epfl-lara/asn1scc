; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19400 () Bool)

(assert start!19400)

(declare-fun res!79509 () Bool)

(declare-fun e!63503 () Bool)

(assert (=> start!19400 (=> (not res!79509) (not e!63503))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4526 0))(
  ( (array!4527 (arr!2663 (Array (_ BitVec 32) (_ BitVec 8))) (size!2070 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3614 0))(
  ( (BitStream!3615 (buf!2416 array!4526) (currentByte!4823 (_ BitVec 32)) (currentBit!4818 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3614)

(assert (=> start!19400 (= res!79509 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2070 (buf!2416 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4823 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4818 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2070 (buf!2416 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4823 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4818 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19400 e!63503))

(assert (=> start!19400 true))

(declare-fun e!63504 () Bool)

(declare-fun inv!12 (BitStream!3614) Bool)

(assert (=> start!19400 (and (inv!12 thiss!1288) e!63504)))

(declare-fun b!96877 () Bool)

(declare-fun res!79510 () Bool)

(assert (=> b!96877 (=> (not res!79510) (not e!63503))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96877 (= res!79510 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4818 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4823 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2070 (buf!2416 thiss!1288))))))))

(declare-fun b!96878 () Bool)

(assert (=> b!96878 (= e!63503 (bvslt ((_ sign_extend 32) nBits!388) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!96879 () Bool)

(declare-fun array_inv!1872 (array!4526) Bool)

(assert (=> b!96879 (= e!63504 (array_inv!1872 (buf!2416 thiss!1288)))))

(assert (= (and start!19400 res!79509) b!96877))

(assert (= (and b!96877 res!79510) b!96878))

(assert (= start!19400 b!96879))

(declare-fun m!140523 () Bool)

(assert (=> start!19400 m!140523))

(declare-fun m!140525 () Bool)

(assert (=> b!96877 m!140525))

(declare-fun m!140527 () Bool)

(assert (=> b!96879 m!140527))

(push 1)

(assert (not start!19400))

(assert (not b!96879))

(assert (not b!96877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

