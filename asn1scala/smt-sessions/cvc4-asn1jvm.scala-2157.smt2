; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54810 () Bool)

(assert start!54810)

(declare-fun res!215164 () Bool)

(declare-fun e!177893 () Bool)

(assert (=> start!54810 (=> (not res!215164) (not e!177893))))

(declare-datatypes ((array!13864 0))(
  ( (array!13865 (arr!7071 (Array (_ BitVec 32) (_ BitVec 8))) (size!6084 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11090 0))(
  ( (BitStream!11091 (buf!6606 array!13864) (currentByte!12091 (_ BitVec 32)) (currentBit!12086 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11090)

(declare-fun from!530 () (_ BitVec 64))

(declare-fun nBits!539 () (_ BitVec 64))

(assert (=> start!54810 (= res!215164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (bvsle ((_ sign_extend 32) (size!6084 (buf!6606 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12091 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12086 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6084 (buf!6606 thiss!1774))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12091 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12086 thiss!1774)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54810 e!177893))

(assert (=> start!54810 true))

(declare-fun e!177894 () Bool)

(declare-fun inv!12 (BitStream!11090) Bool)

(assert (=> start!54810 (and (inv!12 thiss!1774) e!177894)))

(declare-fun b!256689 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256689 (= e!177893 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12086 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12091 thiss!1774))) ((_ extract 31 0) ((_ sign_extend 32) (size!6084 (buf!6606 thiss!1774)))))))))

(declare-fun b!256690 () Bool)

(declare-fun array_inv!5825 (array!13864) Bool)

(assert (=> b!256690 (= e!177894 (array_inv!5825 (buf!6606 thiss!1774)))))

(assert (= (and start!54810 res!215164) b!256689))

(assert (= start!54810 b!256690))

(declare-fun m!386285 () Bool)

(assert (=> start!54810 m!386285))

(declare-fun m!386287 () Bool)

(assert (=> b!256689 m!386287))

(declare-fun m!386289 () Bool)

(assert (=> b!256690 m!386289))

(push 1)

(assert (not b!256689))

(assert (not b!256690))

(assert (not start!54810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

