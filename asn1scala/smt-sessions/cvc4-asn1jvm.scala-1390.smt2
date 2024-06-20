; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38392 () Bool)

(assert start!38392)

(declare-fun res!142776 () Bool)

(declare-fun e!120457 () Bool)

(assert (=> start!38392 (=> (not res!142776) (not e!120457))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9258 0))(
  ( (array!9259 (arr!5016 (Array (_ BitVec 32) (_ BitVec 8))) (size!4086 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7280 0))(
  ( (BitStream!7281 (buf!4514 array!9258) (currentByte!8586 (_ BitVec 32)) (currentBit!8581 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7280)

(assert (=> start!38392 (= res!142776 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4086 (buf!4514 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8586 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8581 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4086 (buf!4514 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8586 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8581 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38392 e!120457))

(assert (=> start!38392 true))

(declare-fun e!120455 () Bool)

(declare-fun inv!12 (BitStream!7280) Bool)

(assert (=> start!38392 (and (inv!12 thiss!1187) e!120455)))

(declare-fun b!172363 () Bool)

(declare-fun res!142775 () Bool)

(assert (=> b!172363 (=> (not res!142775) (not e!120457))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172363 (= res!142775 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8581 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8586 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4086 (buf!4514 thiss!1187))))))))

(declare-fun b!172364 () Bool)

(assert (=> b!172364 (= e!120457 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!172365 () Bool)

(declare-fun array_inv!3827 (array!9258) Bool)

(assert (=> b!172365 (= e!120455 (array_inv!3827 (buf!4514 thiss!1187)))))

(assert (= (and start!38392 res!142776) b!172363))

(assert (= (and b!172363 res!142775) b!172364))

(assert (= start!38392 b!172365))

(declare-fun m!271501 () Bool)

(assert (=> start!38392 m!271501))

(declare-fun m!271503 () Bool)

(assert (=> b!172363 m!271503))

(declare-fun m!271505 () Bool)

(assert (=> b!172365 m!271505))

(push 1)

(assert (not b!172365))

(assert (not b!172363))

(assert (not start!38392))

(check-sat)

(pop 1)

