; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38344 () Bool)

(assert start!38344)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-datatypes ((array!9235 0))(
  ( (array!9236 (arr!5007 (Array (_ BitVec 32) (_ BitVec 8))) (size!4077 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7262 0))(
  ( (BitStream!7263 (buf!4505 array!9235) (currentByte!8572 (_ BitVec 32)) (currentBit!8567 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7262)

(assert (=> start!38344 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!4077 (buf!4505 thiss!1187))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!8572 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!8567 thiss!1187)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!38344 true))

(declare-fun e!120384 () Bool)

(declare-fun inv!12 (BitStream!7262) Bool)

(assert (=> start!38344 (and (inv!12 thiss!1187) e!120384)))

(declare-fun b!172311 () Bool)

(declare-fun array_inv!3818 (array!9235) Bool)

(assert (=> b!172311 (= e!120384 (array_inv!3818 (buf!4505 thiss!1187)))))

(assert (= start!38344 b!172311))

(declare-fun m!271447 () Bool)

(assert (=> start!38344 m!271447))

(declare-fun m!271449 () Bool)

(assert (=> b!172311 m!271449))

(push 1)

(assert (not start!38344))

(assert (not b!172311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

