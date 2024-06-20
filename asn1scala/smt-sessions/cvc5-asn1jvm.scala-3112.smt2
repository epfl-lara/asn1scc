; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71562 () Bool)

(assert start!71562)

(declare-fun res!264034 () Bool)

(declare-fun e!231778 () Bool)

(assert (=> start!71562 (=> (not res!264034) (not e!231778))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20468 0))(
  ( (array!20469 (arr!10003 (Array (_ BitVec 32) (_ BitVec 8))) (size!8911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13984 0))(
  ( (BitStream!13985 (buf!8053 array!20468) (currentByte!14851 (_ BitVec 32)) (currentBit!14846 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13984)

(assert (=> start!71562 (= res!264034 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8911 (buf!8053 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14851 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14846 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8911 (buf!8053 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14851 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14846 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71562 e!231778))

(assert (=> start!71562 true))

(declare-fun e!231779 () Bool)

(declare-fun inv!12 (BitStream!13984) Bool)

(assert (=> start!71562 (and (inv!12 thiss!1793) e!231779)))

(declare-fun b!321645 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321645 (= e!231778 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14846 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14851 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8911 (buf!8053 thiss!1793)))))))))

(declare-fun b!321646 () Bool)

(declare-fun array_inv!8463 (array!20468) Bool)

(assert (=> b!321646 (= e!231779 (array_inv!8463 (buf!8053 thiss!1793)))))

(assert (= (and start!71562 res!264034) b!321645))

(assert (= start!71562 b!321646))

(declare-fun m!460003 () Bool)

(assert (=> start!71562 m!460003))

(declare-fun m!460005 () Bool)

(assert (=> b!321645 m!460005))

(declare-fun m!460007 () Bool)

(assert (=> b!321646 m!460007))

(push 1)

(assert (not b!321646))

(assert (not b!321645))

(assert (not start!71562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105524 () Bool)

