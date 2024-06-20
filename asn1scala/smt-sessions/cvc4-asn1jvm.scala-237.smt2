; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4718 () Bool)

(assert start!4718)

(declare-datatypes ((array!1301 0))(
  ( (array!1302 (arr!990 (Array (_ BitVec 32) (_ BitVec 8))) (size!549 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1301)

(declare-datatypes ((BitStream!932 0))(
  ( (BitStream!933 (buf!849 array!1301) (currentByte!2116 (_ BitVec 32)) (currentBit!2111 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!932)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4718 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!549 srcBuffer!2)))) (or (bvsgt ((_ sign_extend 32) (size!549 (buf!849 thiss!1379))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!2116 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!2111 thiss!1379)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!4718 true))

(declare-fun array_inv!519 (array!1301) Bool)

(assert (=> start!4718 (array_inv!519 srcBuffer!2)))

(declare-fun e!12128 () Bool)

(declare-fun inv!12 (BitStream!932) Bool)

(assert (=> start!4718 (and (inv!12 thiss!1379) e!12128)))

(declare-fun b!18761 () Bool)

(assert (=> b!18761 (= e!12128 (array_inv!519 (buf!849 thiss!1379)))))

(assert (= start!4718 b!18761))

(declare-fun m!25197 () Bool)

(assert (=> start!4718 m!25197))

(declare-fun m!25199 () Bool)

(assert (=> start!4718 m!25199))

(declare-fun m!25201 () Bool)

(assert (=> b!18761 m!25201))

(push 1)

(assert (not start!4718))

(assert (not b!18761))

(check-sat)

(pop 1)

(push 1)

(check-sat)

