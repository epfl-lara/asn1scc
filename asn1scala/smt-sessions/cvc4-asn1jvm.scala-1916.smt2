; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50166 () Bool)

(assert start!50166)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12402 0))(
  ( (array!12403 (arr!6435 (Array (_ BitVec 32) (_ BitVec 8))) (size!5448 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9860 0))(
  ( (BitStream!9861 (buf!5923 array!12402) (currentByte!11029 (_ BitVec 32)) (currentBit!11024 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9860)

(assert (=> start!50166 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5448 (buf!5923 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!11029 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!11024 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!5448 (buf!5923 thiss!1848))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!11029 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!11024 thiss!1848)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!50166 true))

(declare-fun e!162889 () Bool)

(declare-fun inv!12 (BitStream!9860) Bool)

(assert (=> start!50166 (and (inv!12 thiss!1848) e!162889)))

(declare-fun b!235676 () Bool)

(declare-fun array_inv!5189 (array!12402) Bool)

(assert (=> b!235676 (= e!162889 (array_inv!5189 (buf!5923 thiss!1848)))))

(assert (= start!50166 b!235676))

(declare-fun m!358365 () Bool)

(assert (=> start!50166 m!358365))

(declare-fun m!358367 () Bool)

(assert (=> b!235676 m!358367))

(push 1)

(assert (not b!235676))

(assert (not start!50166))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

