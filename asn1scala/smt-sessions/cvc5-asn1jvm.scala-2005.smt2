; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51294 () Bool)

(assert start!51294)

(declare-datatypes ((array!12832 0))(
  ( (array!12833 (arr!6622 (Array (_ BitVec 32) (_ BitVec 8))) (size!5635 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10192 0))(
  ( (BitStream!10193 (buf!6089 array!12832) (currentByte!11292 (_ BitVec 32)) (currentBit!11287 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10192)

(assert (=> start!51294 (or (bvsgt ((_ sign_extend 32) (size!5635 (buf!6089 thiss!1854))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!11292 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!11287 thiss!1854)) #b0000000000000000000000000000000001111111111111111111111111111111))))

(declare-fun e!165352 () Bool)

(declare-fun inv!12 (BitStream!10192) Bool)

(assert (=> start!51294 (and (inv!12 thiss!1854) e!165352)))

(declare-fun b!239150 () Bool)

(declare-fun array_inv!5376 (array!12832) Bool)

(assert (=> b!239150 (= e!165352 (array_inv!5376 (buf!6089 thiss!1854)))))

(assert (= start!51294 b!239150))

(declare-fun m!361203 () Bool)

(assert (=> start!51294 m!361203))

(declare-fun m!361205 () Bool)

(assert (=> b!239150 m!361205))

(push 1)

(assert (not start!51294))

(assert (not b!239150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

