; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52410 () Bool)

(assert start!52410)

(declare-fun res!201318 () Bool)

(declare-fun e!167148 () Bool)

(assert (=> start!52410 (=> (not res!201318) (not e!167148))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13226 0))(
  ( (array!13227 (arr!6780 (Array (_ BitVec 32) (_ BitVec 8))) (size!5793 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10508 0))(
  ( (BitStream!10509 (buf!6259 array!13226) (currentByte!11621 (_ BitVec 32)) (currentBit!11616 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10508)

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> start!52410 (= res!201318 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297) (bvsle ((_ sign_extend 32) (size!5793 (buf!6259 thiss!1005))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11621 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11616 thiss!1005)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5793 (buf!6259 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!11621 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!11616 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!52410 e!167148))

(assert (=> start!52410 true))

(declare-fun e!167149 () Bool)

(declare-fun inv!12 (BitStream!10508) Bool)

(assert (=> start!52410 (and (inv!12 thiss!1005) e!167149)))

(declare-fun b!241177 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241177 (= e!167148 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!11616 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!11621 thiss!1005))) ((_ extract 31 0) ((_ sign_extend 32) (size!5793 (buf!6259 thiss!1005)))))))))

(declare-fun b!241178 () Bool)

(declare-fun array_inv!5534 (array!13226) Bool)

(assert (=> b!241178 (= e!167149 (array_inv!5534 (buf!6259 thiss!1005)))))

(assert (= (and start!52410 res!201318) b!241177))

(assert (= start!52410 b!241178))

(declare-fun m!363903 () Bool)

(assert (=> start!52410 m!363903))

(declare-fun m!363905 () Bool)

(assert (=> b!241177 m!363905))

(declare-fun m!363907 () Bool)

(assert (=> b!241178 m!363907))

(push 1)

(assert (not b!241178))

(assert (not b!241177))

(assert (not start!52410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

