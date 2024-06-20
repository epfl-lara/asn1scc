; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4732 () Bool)

(assert start!4732)

(declare-fun res!16445 () Bool)

(declare-fun e!12166 () Bool)

(assert (=> start!4732 (=> (not res!16445) (not e!12166))))

(declare-datatypes ((array!1310 0))(
  ( (array!1311 (arr!994 (Array (_ BitVec 32) (_ BitVec 8))) (size!553 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1310)

(declare-datatypes ((BitStream!940 0))(
  ( (BitStream!941 (buf!853 array!1310) (currentByte!2121 (_ BitVec 32)) (currentBit!2116 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!940)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4732 (= res!16445 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!553 srcBuffer!2)))) (bvsle ((_ sign_extend 32) (size!553 (buf!853 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!2121 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!2116 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!553 (buf!853 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!2121 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!2116 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!4732 e!12166))

(assert (=> start!4732 true))

(declare-fun array_inv!523 (array!1310) Bool)

(assert (=> start!4732 (array_inv!523 srcBuffer!2)))

(declare-fun e!12165 () Bool)

(declare-fun inv!12 (BitStream!940) Bool)

(assert (=> start!4732 (and (inv!12 thiss!1379) e!12165)))

(declare-fun b!18775 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18775 (= e!12166 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!2116 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!2121 thiss!1379))) ((_ extract 31 0) ((_ sign_extend 32) (size!553 (buf!853 thiss!1379)))))))))

(declare-fun b!18776 () Bool)

(assert (=> b!18776 (= e!12165 (array_inv!523 (buf!853 thiss!1379)))))

(assert (= (and start!4732 res!16445) b!18775))

(assert (= start!4732 b!18776))

(declare-fun m!25223 () Bool)

(assert (=> start!4732 m!25223))

(declare-fun m!25225 () Bool)

(assert (=> start!4732 m!25225))

(declare-fun m!25227 () Bool)

(assert (=> b!18775 m!25227))

(declare-fun m!25229 () Bool)

(assert (=> b!18776 m!25229))

(push 1)

(assert (not start!4732))

(assert (not b!18776))

(assert (not b!18775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

