; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72932 () Bool)

(assert start!72932)

(declare-fun res!266556 () Bool)

(declare-fun e!234128 () Bool)

(assert (=> start!72932 (=> (not res!266556) (not e!234128))))

(declare-datatypes ((array!20909 0))(
  ( (array!20910 (arr!10177 (Array (_ BitVec 32) (_ BitVec 8))) (size!9085 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14332 0))(
  ( (BitStream!14333 (buf!8227 array!20909) (currentByte!15232 (_ BitVec 32)) (currentBit!15227 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14332)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72932 (= res!266556 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9085 (buf!8227 thiss!877))) ((_ sign_extend 32) (currentByte!15232 thiss!877)) ((_ sign_extend 32) (currentBit!15227 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72932 e!234128))

(declare-fun e!234129 () Bool)

(declare-fun inv!12 (BitStream!14332) Bool)

(assert (=> start!72932 (and (inv!12 thiss!877) e!234129)))

(declare-fun b!324791 () Bool)

(declare-fun res!266557 () Bool)

(assert (=> b!324791 (=> (not res!266557) (not e!234128))))

(assert (=> b!324791 (= res!266557 (bvsge (currentBit!15227 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324792 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324792 (= e!234128 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15232 thiss!877)) (size!9085 (buf!8227 thiss!877)))))))

(declare-fun b!324793 () Bool)

(declare-fun array_inv!8637 (array!20909) Bool)

(assert (=> b!324793 (= e!234129 (array_inv!8637 (buf!8227 thiss!877)))))

(assert (= (and start!72932 res!266556) b!324791))

(assert (= (and b!324791 res!266557) b!324792))

(assert (= start!72932 b!324793))

(declare-fun m!462847 () Bool)

(assert (=> start!72932 m!462847))

(declare-fun m!462849 () Bool)

(assert (=> start!72932 m!462849))

(declare-fun m!462851 () Bool)

(assert (=> b!324792 m!462851))

(declare-fun m!462853 () Bool)

(assert (=> b!324793 m!462853))

(push 1)

(assert (not start!72932))

(assert (not b!324793))

(assert (not b!324792))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106860 () Bool)

(assert (=> d!106860 (= (remainingBits!0 ((_ sign_extend 32) (size!9085 (buf!8227 thiss!877))) ((_ sign_extend 32) (currentByte!15232 thiss!877)) ((_ sign_extend 32) (currentBit!15227 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9085 (buf!8227 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15232 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15227 thiss!877)))))))

(assert (=> start!72932 d!106860))

(declare-fun d!106868 () Bool)

(assert (=> d!106868 (= (inv!12 thiss!877) (invariant!0 (currentBit!15227 thiss!877) (currentByte!15232 thiss!877) (size!9085 (buf!8227 thiss!877))))))

(declare-fun bs!28136 () Bool)

(assert (= bs!28136 d!106868))

(declare-fun m!462871 () Bool)

(assert (=> bs!28136 m!462871))

(assert (=> start!72932 d!106868))

(declare-fun d!106874 () Bool)

(assert (=> d!106874 (= (array_inv!8637 (buf!8227 thiss!877)) (bvsge (size!9085 (buf!8227 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324793 d!106874))

(declare-fun d!106878 () Bool)

(assert (=> d!106878 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15232 thiss!877)) (size!9085 (buf!8227 thiss!877))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!15232 thiss!877)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!15232 thiss!877)) (size!9085 (buf!8227 thiss!877))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!15232 thiss!877)) (size!9085 (buf!8227 thiss!877)))))))))

(assert (=> b!324792 d!106878))

(push 1)

(assert (not d!106868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106882 () Bool)

(assert (=> d!106882 (= (invariant!0 (currentBit!15227 thiss!877) (currentByte!15232 thiss!877) (size!9085 (buf!8227 thiss!877))) (and (bvsge (currentBit!15227 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15227 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15232 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15232 thiss!877) (size!9085 (buf!8227 thiss!877))) (and (= (currentBit!15227 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15232 thiss!877) (size!9085 (buf!8227 thiss!877)))))))))

(assert (=> d!106868 d!106882))

(push 1)

(check-sat)

