; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72906 () Bool)

(assert start!72906)

(declare-fun res!266550 () Bool)

(declare-fun e!234120 () Bool)

(assert (=> start!72906 (=> (not res!266550) (not e!234120))))

(declare-datatypes ((array!20904 0))(
  ( (array!20905 (arr!10176 (Array (_ BitVec 32) (_ BitVec 8))) (size!9084 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14330 0))(
  ( (BitStream!14331 (buf!8226 array!20904) (currentByte!15225 (_ BitVec 32)) (currentBit!15220 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14330)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72906 (= res!266550 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9084 (buf!8226 thiss!877))) ((_ sign_extend 32) (currentByte!15225 thiss!877)) ((_ sign_extend 32) (currentBit!15220 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72906 e!234120))

(declare-fun e!234119 () Bool)

(declare-fun inv!12 (BitStream!14330) Bool)

(assert (=> start!72906 (and (inv!12 thiss!877) e!234119)))

(declare-fun b!324782 () Bool)

(declare-fun res!266551 () Bool)

(assert (=> b!324782 (=> (not res!266551) (not e!234120))))

(assert (=> b!324782 (= res!266551 (bvsge (currentBit!15220 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324783 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324783 (= e!234120 (not (invariant!0 (currentBit!15220 thiss!877) (currentByte!15225 thiss!877) (size!9084 (buf!8226 thiss!877)))))))

(declare-fun b!324784 () Bool)

(declare-fun array_inv!8636 (array!20904) Bool)

(assert (=> b!324784 (= e!234119 (array_inv!8636 (buf!8226 thiss!877)))))

(assert (= (and start!72906 res!266550) b!324782))

(assert (= (and b!324782 res!266551) b!324783))

(assert (= start!72906 b!324784))

(declare-fun m!462839 () Bool)

(assert (=> start!72906 m!462839))

(declare-fun m!462841 () Bool)

(assert (=> start!72906 m!462841))

(declare-fun m!462843 () Bool)

(assert (=> b!324783 m!462843))

(declare-fun m!462845 () Bool)

(assert (=> b!324784 m!462845))

(push 1)

(assert (not start!72906))

(assert (not b!324783))

(assert (not b!324784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106836 () Bool)

(assert (=> d!106836 (= (remainingBits!0 ((_ sign_extend 32) (size!9084 (buf!8226 thiss!877))) ((_ sign_extend 32) (currentByte!15225 thiss!877)) ((_ sign_extend 32) (currentBit!15220 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9084 (buf!8226 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15225 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15220 thiss!877)))))))

(assert (=> start!72906 d!106836))

(declare-fun d!106846 () Bool)

(assert (=> d!106846 (= (inv!12 thiss!877) (invariant!0 (currentBit!15220 thiss!877) (currentByte!15225 thiss!877) (size!9084 (buf!8226 thiss!877))))))

(declare-fun bs!28131 () Bool)

(assert (= bs!28131 d!106846))

(assert (=> bs!28131 m!462843))

(assert (=> start!72906 d!106846))

(declare-fun d!106848 () Bool)

(assert (=> d!106848 (= (invariant!0 (currentBit!15220 thiss!877) (currentByte!15225 thiss!877) (size!9084 (buf!8226 thiss!877))) (and (bvsge (currentBit!15220 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15220 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15225 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15225 thiss!877) (size!9084 (buf!8226 thiss!877))) (and (= (currentBit!15220 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15225 thiss!877) (size!9084 (buf!8226 thiss!877)))))))))

(assert (=> b!324783 d!106848))

(declare-fun d!106852 () Bool)

(assert (=> d!106852 (= (array_inv!8636 (buf!8226 thiss!877)) (bvsge (size!9084 (buf!8226 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324784 d!106852))

