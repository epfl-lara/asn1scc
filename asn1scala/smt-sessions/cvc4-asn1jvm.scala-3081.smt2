; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70980 () Bool)

(assert start!70980)

(declare-fun res!263473 () Bool)

(declare-fun e!230896 () Bool)

(assert (=> start!70980 (=> (not res!263473) (not e!230896))))

(declare-fun nBits!545 () (_ BitVec 32))

(declare-datatypes ((array!20242 0))(
  ( (array!20243 (arr!9915 (Array (_ BitVec 32) (_ BitVec 8))) (size!8823 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13808 0))(
  ( (BitStream!13809 (buf!7965 array!20242) (currentByte!14694 (_ BitVec 32)) (currentBit!14689 (_ BitVec 32))) )
))
(declare-fun thiss!1788 () BitStream!13808)

(assert (=> start!70980 (= res!263473 (and (bvsge nBits!545 #b00000000000000000000000000000000) (bvsle nBits!545 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8823 (buf!7965 thiss!1788))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14694 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14689 thiss!1788)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8823 (buf!7965 thiss!1788))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14694 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14689 thiss!1788)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!70980 e!230896))

(assert (=> start!70980 true))

(declare-fun e!230897 () Bool)

(declare-fun inv!12 (BitStream!13808) Bool)

(assert (=> start!70980 (and (inv!12 thiss!1788) e!230897)))

(declare-fun b!320733 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!320733 (= e!230896 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14689 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14694 thiss!1788))) ((_ extract 31 0) ((_ sign_extend 32) (size!8823 (buf!7965 thiss!1788)))))))))

(declare-fun b!320734 () Bool)

(declare-fun array_inv!8375 (array!20242) Bool)

(assert (=> b!320734 (= e!230897 (array_inv!8375 (buf!7965 thiss!1788)))))

(assert (= (and start!70980 res!263473) b!320733))

(assert (= start!70980 b!320734))

(declare-fun m!459101 () Bool)

(assert (=> start!70980 m!459101))

(declare-fun m!459103 () Bool)

(assert (=> b!320733 m!459103))

(declare-fun m!459105 () Bool)

(assert (=> b!320734 m!459105))

(push 1)

(assert (not b!320734))

(assert (not start!70980))

(assert (not b!320733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

