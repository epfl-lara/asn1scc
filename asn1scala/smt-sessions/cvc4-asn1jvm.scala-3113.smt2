; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71580 () Bool)

(assert start!71580)

(declare-fun res!264057 () Bool)

(declare-fun e!231824 () Bool)

(assert (=> start!71580 (=> (not res!264057) (not e!231824))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20480 0))(
  ( (array!20481 (arr!10008 (Array (_ BitVec 32) (_ BitVec 8))) (size!8916 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13994 0))(
  ( (BitStream!13995 (buf!8058 array!20480) (currentByte!14857 (_ BitVec 32)) (currentBit!14852 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13994)

(assert (=> start!71580 (= res!264057 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8916 (buf!8058 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14857 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14852 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8916 (buf!8058 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14857 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14852 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71580 e!231824))

(assert (=> start!71580 true))

(declare-fun e!231825 () Bool)

(declare-fun inv!12 (BitStream!13994) Bool)

(assert (=> start!71580 (and (inv!12 thiss!1793) e!231825)))

(declare-fun b!321683 () Bool)

(declare-fun res!264058 () Bool)

(assert (=> b!321683 (=> (not res!264058) (not e!231824))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321683 (= res!264058 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14852 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14857 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8916 (buf!8058 thiss!1793))))))))

(declare-fun b!321684 () Bool)

(assert (=> b!321684 (= e!231824 (bvslt ((_ sign_extend 32) (bvsub nBits!548 i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321685 () Bool)

(declare-fun array_inv!8468 (array!20480) Bool)

(assert (=> b!321685 (= e!231825 (array_inv!8468 (buf!8058 thiss!1793)))))

(assert (= (and start!71580 res!264057) b!321683))

(assert (= (and b!321683 res!264058) b!321684))

(assert (= start!71580 b!321685))

(declare-fun m!460035 () Bool)

(assert (=> start!71580 m!460035))

(declare-fun m!460037 () Bool)

(assert (=> b!321683 m!460037))

(declare-fun m!460039 () Bool)

(assert (=> b!321685 m!460039))

(push 1)

(assert (not b!321683))

(assert (not start!71580))

(assert (not b!321685))

(check-sat)

(pop 1)

(push 1)

(check-sat)

