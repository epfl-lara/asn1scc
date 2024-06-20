; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4724 () Bool)

(assert start!4724)

(declare-datatypes ((array!1307 0))(
  ( (array!1308 (arr!993 (Array (_ BitVec 32) (_ BitVec 8))) (size!552 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1307)

(declare-datatypes ((BitStream!938 0))(
  ( (BitStream!939 (buf!852 array!1307) (currentByte!2119 (_ BitVec 32)) (currentBit!2114 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!938)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4724 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!552 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!552 (buf!852 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2119 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2114 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!552 (buf!852 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2119 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2114 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4724 true))

(declare-fun array_inv!522 (array!1307) Bool)

(assert (=> start!4724 (array_inv!522 srcBuffer!2)))

(declare-fun e!12155 () Bool)

(declare-fun inv!12 (BitStream!938) Bool)

(assert (=> start!4724 (and (inv!12 thiss!1379) e!12155)))

(declare-fun b!18770 () Bool)

(assert (=> b!18770 (= e!12155 (array_inv!522 (buf!852 thiss!1379)))))

(assert (= start!4724 b!18770))

(declare-fun m!25215 () Bool)

(assert (=> start!4724 m!25215))

(declare-fun m!25217 () Bool)

(assert (=> start!4724 m!25217))

(declare-fun m!25219 () Bool)

(assert (=> b!18770 m!25219))

(push 1)

(assert (not start!4724))

(assert (not b!18770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

