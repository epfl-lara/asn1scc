; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51298 () Bool)

(assert start!51298)

(declare-datatypes ((array!12836 0))(
  ( (array!12837 (arr!6624 (Array (_ BitVec 32) (_ BitVec 8))) (size!5637 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10196 0))(
  ( (BitStream!10197 (buf!6091 array!12836) (currentByte!11294 (_ BitVec 32)) (currentBit!11289 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10196)

(assert (=> start!51298 (or (bvsgt ((_ sign_extend 32) (size!5637 (buf!6091 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11294 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11289 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165364 () Bool)

(declare-fun inv!12 (BitStream!10196) Bool)

(assert (=> start!51298 (and (inv!12 thiss!1854) e!165364)))

(declare-fun b!239156 () Bool)

(declare-fun array_inv!5378 (array!12836) Bool)

(assert (=> b!239156 (= e!165364 (array_inv!5378 (buf!6091 thiss!1854)))))

(assert (= start!51298 b!239156))

(declare-fun m!361211 () Bool)

(assert (=> start!51298 m!361211))

(declare-fun m!361213 () Bool)

(assert (=> b!239156 m!361213))

(push 1)

(assert (not start!51298))

