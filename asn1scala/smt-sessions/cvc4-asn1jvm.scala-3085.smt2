; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71030 () Bool)

(assert start!71030)

(declare-fun res!263500 () Bool)

(declare-fun e!230986 () Bool)

(assert (=> start!71030 (=> (not res!263500) (not e!230986))))

(declare-fun nBits!542 () (_ BitVec 32))

(declare-datatypes ((array!20270 0))(
  ( (array!20271 (arr!9927 (Array (_ BitVec 32) (_ BitVec 8))) (size!8835 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13832 0))(
  ( (BitStream!13833 (buf!7977 array!20270) (currentByte!14709 (_ BitVec 32)) (currentBit!14704 (_ BitVec 32))) )
))
(declare-fun thiss!1780 () BitStream!13832)

(assert (=> start!71030 (= res!263500 (and (bvsge nBits!542 #b00000000000000000000000000000000) (bvsle nBits!542 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8835 (buf!7977 thiss!1780))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14709 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14704 thiss!1780)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8835 (buf!7977 thiss!1780))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14709 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14704 thiss!1780)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71030 e!230986))

(assert (=> start!71030 true))

(declare-fun e!230987 () Bool)

(declare-fun inv!12 (BitStream!13832) Bool)

(assert (=> start!71030 (and (inv!12 thiss!1780) e!230987)))

(declare-fun b!320796 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320796 (= e!230986 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14704 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14709 thiss!1780))) ((_ extract 31 0) ((_ sign_extend 32) (size!8835 (buf!7977 thiss!1780)))))))))

(declare-fun b!320797 () Bool)

(declare-fun array_inv!8387 (array!20270) Bool)

(assert (=> b!320797 (= e!230987 (array_inv!8387 (buf!7977 thiss!1780)))))

(assert (= (and start!71030 res!263500) b!320796))

(assert (= start!71030 b!320797))

(declare-fun m!459169 () Bool)

(assert (=> start!71030 m!459169))

(declare-fun m!459171 () Bool)

(assert (=> b!320796 m!459171))

(declare-fun m!459173 () Bool)

(assert (=> b!320797 m!459173))

(push 1)

(assert (not b!320796))

(assert (not start!71030))

(assert (not b!320797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

