; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4720 () Bool)

(assert start!4720)

(declare-datatypes ((array!1303 0))(
  ( (array!1304 (arr!991 (Array (_ BitVec 32) (_ BitVec 8))) (size!550 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1303)

(declare-datatypes ((BitStream!934 0))(
  ( (BitStream!935 (buf!850 array!1303) (currentByte!2117 (_ BitVec 32)) (currentBit!2112 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!934)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4720 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!550 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!550 (buf!850 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2117 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2112 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!550 (buf!850 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!2117 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!2112 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4720 true))

(declare-fun array_inv!520 (array!1303) Bool)

(assert (=> start!4720 (array_inv!520 srcBuffer!2)))

(declare-fun e!12137 () Bool)

(declare-fun inv!12 (BitStream!934) Bool)

(assert (=> start!4720 (and (inv!12 thiss!1379) e!12137)))

(declare-fun b!18764 () Bool)

(assert (=> b!18764 (= e!12137 (array_inv!520 (buf!850 thiss!1379)))))

(assert (= start!4720 b!18764))

(declare-fun m!25203 () Bool)

(assert (=> start!4720 m!25203))

(declare-fun m!25205 () Bool)

(assert (=> start!4720 m!25205))

(declare-fun m!25207 () Bool)

(assert (=> b!18764 m!25207))

(push 1)

(assert (not start!4720))

(assert (not b!18764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

