; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4716 () Bool)

(assert start!4716)

(declare-datatypes ((array!1299 0))(
  ( (array!1300 (arr!989 (Array (_ BitVec 32) (_ BitVec 8))) (size!548 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1299)

(declare-datatypes ((BitStream!930 0))(
  ( (BitStream!931 (buf!848 array!1299) (currentByte!2115 (_ BitVec 32)) (currentBit!2110 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!930)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4716 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!548 srcBuffer!2)))) (or (bvsgt ((_ sign_extend 32) (size!548 (buf!848 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2115 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2110 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4716 true))

(declare-fun array_inv!518 (array!1299) Bool)

(assert (=> start!4716 (array_inv!518 srcBuffer!2)))

(declare-fun e!12119 () Bool)

(declare-fun inv!12 (BitStream!930) Bool)

(assert (=> start!4716 (and (inv!12 thiss!1379) e!12119)))

(declare-fun b!18758 () Bool)

(assert (=> b!18758 (= e!12119 (array_inv!518 (buf!848 thiss!1379)))))

(assert (= start!4716 b!18758))

(declare-fun m!25191 () Bool)

(assert (=> start!4716 m!25191))

(declare-fun m!25193 () Bool)

(assert (=> start!4716 m!25193))

(declare-fun m!25195 () Bool)

(assert (=> b!18758 m!25195))

(check-sat (not start!4716) (not b!18758))
(check-sat)
