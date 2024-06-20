; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4714 () Bool)

(assert start!4714)

(declare-datatypes ((array!1297 0))(
  ( (array!1298 (arr!988 (Array (_ BitVec 32) (_ BitVec 8))) (size!547 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1297)

(declare-datatypes ((BitStream!928 0))(
  ( (BitStream!929 (buf!847 array!1297) (currentByte!2114 (_ BitVec 32)) (currentBit!2109 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!928)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4714 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!547 srcBuffer!2)))) (or (bvsgt ((_ sign_extend 32) (size!547 (buf!847 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2114 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2109 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4714 true))

(declare-fun array_inv!517 (array!1297) Bool)

(assert (=> start!4714 (array_inv!517 srcBuffer!2)))

(declare-fun e!12110 () Bool)

(declare-fun inv!12 (BitStream!928) Bool)

(assert (=> start!4714 (and (inv!12 thiss!1379) e!12110)))

(declare-fun b!18755 () Bool)

(assert (=> b!18755 (= e!12110 (array_inv!517 (buf!847 thiss!1379)))))

(assert (= start!4714 b!18755))

(declare-fun m!25185 () Bool)

(assert (=> start!4714 m!25185))

(declare-fun m!25187 () Bool)

(assert (=> start!4714 m!25187))

(declare-fun m!25189 () Bool)

(assert (=> b!18755 m!25189))

(push 1)

(assert (not b!18755))

(assert (not start!4714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

