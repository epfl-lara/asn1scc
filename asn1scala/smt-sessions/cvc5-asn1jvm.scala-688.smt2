; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19382 () Bool)

(assert start!19382)

(declare-fun res!79486 () Bool)

(declare-fun e!63457 () Bool)

(assert (=> start!19382 (=> (not res!79486) (not e!63457))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4515 0))(
  ( (array!4516 (arr!2658 (Array (_ BitVec 32) (_ BitVec 8))) (size!2065 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3604 0))(
  ( (BitStream!3605 (buf!2411 array!4515) (currentByte!4817 (_ BitVec 32)) (currentBit!4812 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3604)

(assert (=> start!19382 (= res!79486 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2065 (buf!2411 thiss!1288))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4817 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4812 thiss!1288)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2065 (buf!2411 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4817 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4812 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19382 e!63457))

(assert (=> start!19382 true))

(declare-fun e!63458 () Bool)

(declare-fun inv!12 (BitStream!3604) Bool)

(assert (=> start!19382 (and (inv!12 thiss!1288) e!63458)))

(declare-fun b!96839 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!96839 (= e!63457 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4812 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4817 thiss!1288))) ((_ extract 31 0) ((_ sign_extend 32) (size!2065 (buf!2411 thiss!1288)))))))))

(declare-fun b!96840 () Bool)

(declare-fun array_inv!1867 (array!4515) Bool)

(assert (=> b!96840 (= e!63458 (array_inv!1867 (buf!2411 thiss!1288)))))

(assert (= (and start!19382 res!79486) b!96839))

(assert (= start!19382 b!96840))

(declare-fun m!140491 () Bool)

(assert (=> start!19382 m!140491))

(declare-fun m!140493 () Bool)

(assert (=> b!96839 m!140493))

(declare-fun m!140495 () Bool)

(assert (=> b!96840 m!140495))

(push 1)

(assert (not b!96840))

(assert (not b!96839))

(assert (not start!19382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

