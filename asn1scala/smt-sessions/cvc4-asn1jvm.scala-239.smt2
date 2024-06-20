; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4736 () Bool)

(assert start!4736)

(declare-fun res!16451 () Bool)

(declare-fun e!12191 () Bool)

(assert (=> start!4736 (=> (not res!16451) (not e!12191))))

(declare-datatypes ((array!1314 0))(
  ( (array!1315 (arr!996 (Array (_ BitVec 32) (_ BitVec 8))) (size!555 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1314)

(declare-datatypes ((BitStream!944 0))(
  ( (BitStream!945 (buf!855 array!1314) (currentByte!2123 (_ BitVec 32)) (currentBit!2118 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!944)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4736 (= res!16451 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!555 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!555 (buf!855 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2123 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2118 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!555 (buf!855 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2123 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2118 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4736 e!12191))

(assert (=> start!4736 true))

(declare-fun array_inv!525 (array!1314) Bool)

(assert (=> start!4736 (array_inv!525 srcBuffer!2)))

(declare-fun e!12190 () Bool)

(declare-fun inv!12 (BitStream!944) Bool)

(assert (=> start!4736 (and (inv!12 thiss!1379) e!12190)))

(declare-fun b!18787 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18787 (= e!12191 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2118 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2123 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!555 (buf!855 thiss!1379)))))))))

(declare-fun b!18788 () Bool)

(assert (=> b!18788 (= e!12190 (array_inv!525 (buf!855 thiss!1379)))))

(assert (= (and start!4736 res!16451) b!18787))

(assert (= start!4736 b!18788))

(declare-fun m!25239 () Bool)

(assert (=> start!4736 m!25239))

(declare-fun m!25241 () Bool)

(assert (=> start!4736 m!25241))

(declare-fun m!25243 () Bool)

(assert (=> b!18787 m!25243))

(declare-fun m!25245 () Bool)

(assert (=> b!18788 m!25245))

(push 1)

(assert (not start!4736))

(assert (not b!18788))

(assert (not b!18787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

