; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38388 () Bool)

(assert start!38388)

(declare-fun res!142763 () Bool)

(declare-fun e!120437 () Bool)

(assert (=> start!38388 (=> (not res!142763) (not e!120437))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9254 0))(
  ( (array!9255 (arr!5014 (Array (_ BitVec 32) (_ BitVec 8))) (size!4084 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7276 0))(
  ( (BitStream!7277 (buf!4512 array!9254) (currentByte!8584 (_ BitVec 32)) (currentBit!8579 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7276)

(assert (=> start!38388 (= res!142763 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4084 (buf!4512 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8584 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8579 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4084 (buf!4512 thiss!1187))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8584 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8579 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38388 e!120437))

(assert (=> start!38388 true))

(declare-fun e!120439 () Bool)

(declare-fun inv!12 (BitStream!7276) Bool)

(assert (=> start!38388 (and (inv!12 thiss!1187) e!120439)))

(declare-fun b!172345 () Bool)

(declare-fun res!142764 () Bool)

(assert (=> b!172345 (=> (not res!142764) (not e!120437))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172345 (= res!142764 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8579 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8584 thiss!1187))) ((_ extract 31 0) ((_ sign_extend 32) (size!4084 (buf!4512 thiss!1187))))))))

(declare-fun b!172346 () Bool)

(assert (=> b!172346 (= e!120437 (bvslt ((_ sign_extend 32) nBits!340) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!172347 () Bool)

(declare-fun array_inv!3825 (array!9254) Bool)

(assert (=> b!172347 (= e!120439 (array_inv!3825 (buf!4512 thiss!1187)))))

(assert (= (and start!38388 res!142763) b!172345))

(assert (= (and b!172345 res!142764) b!172346))

(assert (= start!38388 b!172347))

(declare-fun m!271489 () Bool)

(assert (=> start!38388 m!271489))

(declare-fun m!271491 () Bool)

(assert (=> b!172345 m!271491))

(declare-fun m!271493 () Bool)

(assert (=> b!172347 m!271493))

(push 1)

(assert (not b!172347))

(assert (not b!172345))

(assert (not start!38388))

(check-sat)

(pop 1)

(push 1)

(check-sat)

