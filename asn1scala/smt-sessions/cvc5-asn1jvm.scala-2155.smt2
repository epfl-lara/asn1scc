; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54786 () Bool)

(assert start!54786)

(declare-fun nBits!539 () (_ BitVec 64))

(declare-fun from!530 () (_ BitVec 64))

(declare-datatypes ((array!13846 0))(
  ( (array!13847 (arr!7063 (Array (_ BitVec 32) (_ BitVec 8))) (size!6076 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11074 0))(
  ( (BitStream!11075 (buf!6598 array!13846) (currentByte!12082 (_ BitVec 32)) (currentBit!12077 (_ BitVec 32))) )
))
(declare-fun thiss!1774 () BitStream!11074)

(assert (=> start!54786 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!539) (bvsle nBits!539 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!530) (bvsle from!530 nBits!539) (or (bvsgt ((_ sign_extend 32) (size!6076 (buf!6598 thiss!1774))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!12082 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!12077 thiss!1774)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!54786 true))

(declare-fun e!177837 () Bool)

(declare-fun inv!12 (BitStream!11074) Bool)

(assert (=> start!54786 (and (inv!12 thiss!1774) e!177837)))

(declare-fun b!256657 () Bool)

(declare-fun array_inv!5817 (array!13846) Bool)

(assert (=> b!256657 (= e!177837 (array_inv!5817 (buf!6598 thiss!1774)))))

(assert (= start!54786 b!256657))

(declare-fun m!386247 () Bool)

(assert (=> start!54786 m!386247))

(declare-fun m!386249 () Bool)

(assert (=> b!256657 m!386249))

(push 1)

(assert (not b!256657))

(assert (not start!54786))

(check-sat)

(pop 1)

(push 1)

(check-sat)

