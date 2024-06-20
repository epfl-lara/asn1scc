; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72694 () Bool)

(assert start!72694)

(declare-fun res!266227 () Bool)

(declare-fun e!233827 () Bool)

(assert (=> start!72694 (=> (not res!266227) (not e!233827))))

(declare-datatypes ((array!20834 0))(
  ( (array!20835 (arr!10150 (Array (_ BitVec 32) (_ BitVec 8))) (size!9058 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14278 0))(
  ( (BitStream!14279 (buf!8200 array!20834) (currentByte!15155 (_ BitVec 32)) (currentBit!15150 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14278)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72694 (= res!266227 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9058 (buf!8200 thiss!877))) ((_ sign_extend 32) (currentByte!15155 thiss!877)) ((_ sign_extend 32) (currentBit!15150 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72694 e!233827))

(declare-fun e!233828 () Bool)

(declare-fun inv!12 (BitStream!14278) Bool)

(assert (=> start!72694 (and (inv!12 thiss!877) e!233828)))

(declare-fun b!324380 () Bool)

(declare-fun res!266226 () Bool)

(assert (=> b!324380 (=> (not res!266226) (not e!233827))))

(assert (=> b!324380 (= res!266226 (bvslt (currentBit!15150 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324381 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324381 (= e!233827 (not (invariant!0 (currentBit!15150 thiss!877) (currentByte!15155 thiss!877) (size!9058 (buf!8200 thiss!877)))))))

(declare-fun b!324382 () Bool)

(declare-fun array_inv!8610 (array!20834) Bool)

(assert (=> b!324382 (= e!233828 (array_inv!8610 (buf!8200 thiss!877)))))

(assert (= (and start!72694 res!266227) b!324380))

(assert (= (and b!324380 res!266226) b!324381))

(assert (= start!72694 b!324382))

(declare-fun m!462505 () Bool)

(assert (=> start!72694 m!462505))

(declare-fun m!462507 () Bool)

(assert (=> start!72694 m!462507))

(declare-fun m!462509 () Bool)

(assert (=> b!324381 m!462509))

(declare-fun m!462511 () Bool)

(assert (=> b!324382 m!462511))

(push 1)

(assert (not b!324382))

(assert (not b!324381))

(assert (not start!72694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106620 () Bool)

(assert (=> d!106620 (= (array_inv!8610 (buf!8200 thiss!877)) (bvsge (size!9058 (buf!8200 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324382 d!106620))

(declare-fun d!106622 () Bool)

(assert (=> d!106622 (= (invariant!0 (currentBit!15150 thiss!877) (currentByte!15155 thiss!877) (size!9058 (buf!8200 thiss!877))) (and (bvsge (currentBit!15150 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15150 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15155 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15155 thiss!877) (size!9058 (buf!8200 thiss!877))) (and (= (currentBit!15150 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15155 thiss!877) (size!9058 (buf!8200 thiss!877)))))))))

(assert (=> b!324381 d!106622))

(declare-fun d!106628 () Bool)

(assert (=> d!106628 (= (remainingBits!0 ((_ sign_extend 32) (size!9058 (buf!8200 thiss!877))) ((_ sign_extend 32) (currentByte!15155 thiss!877)) ((_ sign_extend 32) (currentBit!15150 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9058 (buf!8200 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15155 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15150 thiss!877)))))))

(assert (=> start!72694 d!106628))

(declare-fun d!106632 () Bool)

(assert (=> d!106632 (= (inv!12 thiss!877) (invariant!0 (currentBit!15150 thiss!877) (currentByte!15155 thiss!877) (size!9058 (buf!8200 thiss!877))))))

(declare-fun bs!28088 () Bool)

(assert (= bs!28088 d!106632))

(assert (=> bs!28088 m!462509))

(assert (=> start!72694 d!106632))

(push 1)

(assert (not d!106632))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

