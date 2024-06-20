; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51216 () Bool)

(assert start!51216)

(declare-datatypes ((array!12803 0))(
  ( (array!12804 (arr!6612 (Array (_ BitVec 32) (_ BitVec 8))) (size!5625 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10172 0))(
  ( (BitStream!10173 (buf!6079 array!12803) (currentByte!11271 (_ BitVec 32)) (currentBit!11266 (_ BitVec 32))) )
))
(declare-fun thiss!1857 () BitStream!10172)

(assert (=> start!51216 (or (bvsgt ((_ sign_extend 32) (size!5625 (buf!6079 thiss!1857))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11271 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11266 thiss!1857)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165274 () Bool)

(declare-fun inv!12 (BitStream!10172) Bool)

(assert (=> start!51216 (and (inv!12 thiss!1857) e!165274)))

(declare-fun b!239102 () Bool)

(declare-fun array_inv!5366 (array!12803) Bool)

(assert (=> b!239102 (= e!165274 (array_inv!5366 (buf!6079 thiss!1857)))))

(assert (= start!51216 b!239102))

(declare-fun m!361121 () Bool)

(assert (=> start!51216 m!361121))

(declare-fun m!361123 () Bool)

(assert (=> b!239102 m!361123))

(push 1)

(assert (not start!51216))

(assert (not b!239102))

(check-sat)

(pop 1)

(push 1)

(check-sat)

