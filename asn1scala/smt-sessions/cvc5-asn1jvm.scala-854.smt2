; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24742 () Bool)

(assert start!24742)

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5652 0))(
  ( (array!5653 (arr!3153 (Array (_ BitVec 32) (_ BitVec 8))) (size!2560 (_ BitVec 32))) )
))
(declare-fun arr!227 () array!5652)

(declare-datatypes ((BitStream!4444 0))(
  ( (BitStream!4445 (buf!2936 array!5652) (currentByte!5647 (_ BitVec 32)) (currentBit!5642 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4444)

(assert (=> start!24742 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2560 arr!227)) (or (bvsgt ((_ sign_extend 32) (size!2560 (buf!2936 thiss!1614))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5647 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5642 thiss!1614)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(assert (=> start!24742 true))

(declare-fun array_inv!2349 (array!5652) Bool)

(assert (=> start!24742 (array_inv!2349 arr!227)))

(declare-fun e!82612 () Bool)

(declare-fun inv!12 (BitStream!4444) Bool)

(assert (=> start!24742 (and (inv!12 thiss!1614) e!82612)))

(declare-fun b!125612 () Bool)

(assert (=> b!125612 (= e!82612 (array_inv!2349 (buf!2936 thiss!1614)))))

(assert (= start!24742 b!125612))

(declare-fun m!190959 () Bool)

(assert (=> start!24742 m!190959))

(declare-fun m!190961 () Bool)

(assert (=> start!24742 m!190961))

(declare-fun m!190963 () Bool)

(assert (=> b!125612 m!190963))

(push 1)

(assert (not start!24742))

(assert (not b!125612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

