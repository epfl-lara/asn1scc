; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19904 () Bool)

(assert start!19904)

(declare-fun res!81278 () Bool)

(declare-fun e!64852 () Bool)

(assert (=> start!19904 (=> (not res!81278) (not e!64852))))

(declare-datatypes ((array!4654 0))(
  ( (array!4655 (arr!2717 (Array (_ BitVec 32) (_ BitVec 8))) (size!2124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3722 0))(
  ( (BitStream!3723 (buf!2481 array!4654) (currentByte!4921 (_ BitVec 32)) (currentBit!4916 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3722)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!19904 (= res!81278 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!2124 (buf!2481 thiss!1305))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4921 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4916 thiss!1305)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!2124 (buf!2481 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4921 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4916 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!19904 e!64852))

(assert (=> start!19904 true))

(declare-fun e!64854 () Bool)

(declare-fun inv!12 (BitStream!3722) Bool)

(assert (=> start!19904 (and (inv!12 thiss!1305) e!64854)))

(declare-fun b!99105 () Bool)

(declare-fun res!81277 () Bool)

(assert (=> b!99105 (=> (not res!81277) (not e!64852))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99105 (= res!81277 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4916 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4921 thiss!1305))) ((_ extract 31 0) ((_ sign_extend 32) (size!2124 (buf!2481 thiss!1305))))))))

(declare-fun b!99106 () Bool)

(assert (=> b!99106 (= e!64852 (bvslt ((_ sign_extend 32) (bvsub nBits!396 i!615)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!99107 () Bool)

(declare-fun array_inv!1926 (array!4654) Bool)

(assert (=> b!99107 (= e!64854 (array_inv!1926 (buf!2481 thiss!1305)))))

(assert (= (and start!19904 res!81278) b!99105))

(assert (= (and b!99105 res!81277) b!99106))

(assert (= start!19904 b!99107))

(declare-fun m!144541 () Bool)

(assert (=> start!19904 m!144541))

(declare-fun m!144543 () Bool)

(assert (=> b!99105 m!144543))

(declare-fun m!144545 () Bool)

(assert (=> b!99107 m!144545))

(push 1)

(assert (not b!99107))

(assert (not b!99105))

(assert (not start!19904))

(check-sat)

(pop 1)

(push 1)

(check-sat)

