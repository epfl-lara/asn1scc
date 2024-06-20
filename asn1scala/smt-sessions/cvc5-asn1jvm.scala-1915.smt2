; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50156 () Bool)

(assert start!50156)

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(declare-datatypes ((array!12392 0))(
  ( (array!12393 (arr!6430 (Array (_ BitVec 32) (_ BitVec 8))) (size!5443 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9850 0))(
  ( (BitStream!9851 (buf!5918 array!12392) (currentByte!11024 (_ BitVec 32)) (currentBit!11019 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9850)

(assert (=> start!50156 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000) (or (bvsgt ((_ sign_extend 32) (size!5443 (buf!5918 thiss!1848))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11024 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11019 thiss!1848)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!50156 true))

(declare-fun e!162859 () Bool)

(declare-fun inv!12 (BitStream!9850) Bool)

(assert (=> start!50156 (and (inv!12 thiss!1848) e!162859)))

(declare-fun b!235661 () Bool)

(declare-fun array_inv!5184 (array!12392) Bool)

(assert (=> b!235661 (= e!162859 (array_inv!5184 (buf!5918 thiss!1848)))))

(assert (= start!50156 b!235661))

(declare-fun m!358345 () Bool)

(assert (=> start!50156 m!358345))

(declare-fun m!358347 () Bool)

(assert (=> b!235661 m!358347))

(push 1)

(assert (not b!235661))

(assert (not start!50156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

