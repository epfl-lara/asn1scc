; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54844 () Bool)

(assert start!54844)

(declare-fun res!215167 () Bool)

(declare-fun e!177938 () Bool)

(assert (=> start!54844 (=> (not res!215167) (not e!177938))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13880 0))(
  ( (array!13881 (arr!7078 (Array (_ BitVec 32) (_ BitVec 8))) (size!6091 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11104 0))(
  ( (BitStream!11105 (buf!6613 array!13880) (currentByte!12100 (_ BitVec 32)) (currentBit!12095 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11104)

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54844 (= res!215167 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6091 (buf!6613 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12100 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12095 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6091 (buf!6613 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12100 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12095 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54844 e!177938))

(assert (=> start!54844 true))

(declare-fun e!177939 () Bool)

(declare-fun inv!12 (BitStream!11104) Bool)

(assert (=> start!54844 (and (inv!12 thiss!1754) e!177939)))

(declare-fun b!256713 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256713 (= e!177938 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12095 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12100 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6091 (buf!6613 thiss!1754)))))))))

(declare-fun b!256714 () Bool)

(declare-fun array_inv!5832 (array!13880) Bool)

(assert (=> b!256714 (= e!177939 (array_inv!5832 (buf!6613 thiss!1754)))))

(assert (= (and start!54844 res!215167) b!256713))

(assert (= start!54844 b!256714))

(declare-fun m!386319 () Bool)

(assert (=> start!54844 m!386319))

(declare-fun m!386321 () Bool)

(assert (=> b!256713 m!386321))

(declare-fun m!386323 () Bool)

(assert (=> b!256714 m!386323))

(push 1)

(assert (not b!256714))

(assert (not b!256713))

(assert (not start!54844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

