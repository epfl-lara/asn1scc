; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38154 () Bool)

(assert start!38154)

(declare-fun res!142341 () Bool)

(declare-fun e!120025 () Bool)

(assert (=> start!38154 (=> (not res!142341) (not e!120025))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-datatypes ((array!9183 0))(
  ( (array!9184 (arr!4987 (Array (_ BitVec 32) (_ BitVec 8))) (size!4057 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7222 0))(
  ( (BitStream!7223 (buf!4485 array!9183) (currentByte!8522 (_ BitVec 32)) (currentBit!8517 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7222)

(assert (=> start!38154 (= res!142341 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!4057 (buf!4485 thiss!1817))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8522 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8517 thiss!1817)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4057 (buf!4485 thiss!1817))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8522 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8517 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38154 e!120025))

(assert (=> start!38154 true))

(declare-fun e!120023 () Bool)

(declare-fun inv!12 (BitStream!7222) Bool)

(assert (=> start!38154 (and (inv!12 thiss!1817) e!120023)))

(declare-fun b!171763 () Bool)

(declare-fun res!142340 () Bool)

(assert (=> b!171763 (=> (not res!142340) (not e!120025))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171763 (= res!142340 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8517 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8522 thiss!1817))) ((_ extract 31 0) ((_ sign_extend 32) (size!4057 (buf!4485 thiss!1817))))))))

(declare-fun b!171764 () Bool)

(assert (=> b!171764 (= e!120025 (bvslt ((_ sign_extend 32) nBits!575) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!171765 () Bool)

(declare-fun array_inv!3798 (array!9183) Bool)

(assert (=> b!171765 (= e!120023 (array_inv!3798 (buf!4485 thiss!1817)))))

(assert (= (and start!38154 res!142341) b!171763))

(assert (= (and b!171763 res!142340) b!171764))

(assert (= start!38154 b!171765))

(declare-fun m!271019 () Bool)

(assert (=> start!38154 m!271019))

(declare-fun m!271021 () Bool)

(assert (=> b!171763 m!271021))

(declare-fun m!271023 () Bool)

(assert (=> b!171765 m!271023))

(push 1)

(assert (not b!171765))

(assert (not b!171763))

(assert (not start!38154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

