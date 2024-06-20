; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54848 () Bool)

(assert start!54848)

(declare-fun res!215173 () Bool)

(declare-fun e!177956 () Bool)

(assert (=> start!54848 (=> (not res!215173) (not e!177956))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13884 0))(
  ( (array!13885 (arr!7080 (Array (_ BitVec 32) (_ BitVec 8))) (size!6093 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11108 0))(
  ( (BitStream!11109 (buf!6615 array!13884) (currentByte!12102 (_ BitVec 32)) (currentBit!12097 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11108)

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54848 (= res!215173 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535) (bvsle ((_ sign_extend 32) (size!6093 (buf!6615 thiss!1754))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!12102 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!12097 thiss!1754)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!6093 (buf!6615 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!12102 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!12097 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!54848 e!177956))

(assert (=> start!54848 true))

(declare-fun e!177957 () Bool)

(declare-fun inv!12 (BitStream!11108) Bool)

(assert (=> start!54848 (and (inv!12 thiss!1754) e!177957)))

(declare-fun b!256725 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256725 (= e!177956 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!12097 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!12102 thiss!1754))) ((_ extract 31 0) ((_ sign_extend 32) (size!6093 (buf!6615 thiss!1754)))))))))

(declare-fun b!256726 () Bool)

(declare-fun array_inv!5834 (array!13884) Bool)

(assert (=> b!256726 (= e!177957 (array_inv!5834 (buf!6615 thiss!1754)))))

(assert (= (and start!54848 res!215173) b!256725))

(assert (= start!54848 b!256726))

(declare-fun m!386331 () Bool)

(assert (=> start!54848 m!386331))

(declare-fun m!386333 () Bool)

(assert (=> b!256725 m!386333))

(declare-fun m!386335 () Bool)

(assert (=> b!256726 m!386335))

(push 1)

(assert (not start!54848))

(assert (not b!256726))

(assert (not b!256725))

(check-sat)

(pop 1)

(push 1)

(check-sat)

