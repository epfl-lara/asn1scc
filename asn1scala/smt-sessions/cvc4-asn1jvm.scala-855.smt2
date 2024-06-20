; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24752 () Bool)

(assert start!24752)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5662 0))(
  ( (array!5663 (arr!3158 (Array (_ BitVec 32) (_ BitVec 8))) (size!2565 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5662)

(declare-datatypes ((BitStream!4454 0))(
  ( (BitStream!4455 (buf!2941 array!5662) (currentByte!5652 (_ BitVec 32)) (currentBit!5647 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4454)

(assert (=> start!24752 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2565 arr!227)) (bvsle ((_ sign_extend 32) (size!2565 (buf!2941 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!5652 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!5647 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!2565 (buf!2941 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5652 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5647 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!24752 true))

(declare-fun array_inv!2354 (array!5662) Bool)

(assert (=> start!24752 (array_inv!2354 arr!227)))

(declare-fun e!82657 () Bool)

(declare-fun inv!12 (BitStream!4454) Bool)

(assert (=> start!24752 (and (inv!12 thiss!1614) e!82657)))

(declare-fun b!125627 () Bool)

(assert (=> b!125627 (= e!82657 (array_inv!2354 (buf!2941 thiss!1614)))))

(assert (= start!24752 b!125627))

(declare-fun m!190989 () Bool)

(assert (=> start!24752 m!190989))

(declare-fun m!190991 () Bool)

(assert (=> start!24752 m!190991))

(declare-fun m!190993 () Bool)

(assert (=> b!125627 m!190993))

(push 1)

(assert (not start!24752))

(assert (not b!125627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

