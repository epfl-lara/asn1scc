; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72936 () Bool)

(assert start!72936)

(declare-fun res!266568 () Bool)

(declare-fun e!234146 () Bool)

(assert (=> start!72936 (=> (not res!266568) (not e!234146))))

(declare-datatypes ((array!20913 0))(
  ( (array!20914 (arr!10179 (Array (_ BitVec 32) (_ BitVec 8))) (size!9087 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14336 0))(
  ( (BitStream!14337 (buf!8229 array!20913) (currentByte!15234 (_ BitVec 32)) (currentBit!15229 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14336)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72936 (= res!266568 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9087 (buf!8229 thiss!877))) ((_ sign_extend 32) (currentByte!15234 thiss!877)) ((_ sign_extend 32) (currentBit!15229 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72936 e!234146))

(declare-fun e!234147 () Bool)

(declare-fun inv!12 (BitStream!14336) Bool)

(assert (=> start!72936 (and (inv!12 thiss!877) e!234147)))

(declare-fun b!324809 () Bool)

(declare-fun res!266569 () Bool)

(assert (=> b!324809 (=> (not res!266569) (not e!234146))))

(assert (=> b!324809 (= res!266569 (bvsge (currentBit!15229 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324810 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324810 (= e!234146 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15234 thiss!877)) (size!9087 (buf!8229 thiss!877)))))))

(declare-fun b!324811 () Bool)

(declare-fun array_inv!8639 (array!20913) Bool)

(assert (=> b!324811 (= e!234147 (array_inv!8639 (buf!8229 thiss!877)))))

(assert (= (and start!72936 res!266568) b!324809))

(assert (= (and b!324809 res!266569) b!324810))

(assert (= start!72936 b!324811))

(declare-fun m!462863 () Bool)

(assert (=> start!72936 m!462863))

(declare-fun m!462865 () Bool)

(assert (=> start!72936 m!462865))

(declare-fun m!462867 () Bool)

(assert (=> b!324810 m!462867))

(declare-fun m!462869 () Bool)

(assert (=> b!324811 m!462869))

(push 1)

(assert (not b!324811))

(assert (not b!324810))

(assert (not start!72936))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106862 () Bool)

(assert (=> d!106862 (= (array_inv!8639 (buf!8229 thiss!877)) (bvsge (size!9087 (buf!8229 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324811 d!106862))

(declare-fun d!106866 () Bool)

(assert (=> d!106866 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15234 thiss!877)) (size!9087 (buf!8229 thiss!877))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!15234 thiss!877)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!15234 thiss!877)) (size!9087 (buf!8229 thiss!877))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!15234 thiss!877)) (size!9087 (buf!8229 thiss!877)))))))))

(assert (=> b!324810 d!106866))

(declare-fun d!106870 () Bool)

(assert (=> d!106870 (= (remainingBits!0 ((_ sign_extend 32) (size!9087 (buf!8229 thiss!877))) ((_ sign_extend 32) (currentByte!15234 thiss!877)) ((_ sign_extend 32) (currentBit!15229 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9087 (buf!8229 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15234 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15229 thiss!877)))))))

(assert (=> start!72936 d!106870))

(declare-fun d!106876 () Bool)

(assert (=> d!106876 (= (inv!12 thiss!877) (invariant!0 (currentBit!15229 thiss!877) (currentByte!15234 thiss!877) (size!9087 (buf!8229 thiss!877))))))

(declare-fun bs!28138 () Bool)

(assert (= bs!28138 d!106876))

(declare-fun m!462875 () Bool)

(assert (=> bs!28138 m!462875))

(assert (=> start!72936 d!106876))

(push 1)

(assert (not d!106876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106884 () Bool)

(assert (=> d!106884 (= (invariant!0 (currentBit!15229 thiss!877) (currentByte!15234 thiss!877) (size!9087 (buf!8229 thiss!877))) (and (bvsge (currentBit!15229 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15229 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15234 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15234 thiss!877) (size!9087 (buf!8229 thiss!877))) (and (= (currentBit!15229 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15234 thiss!877) (size!9087 (buf!8229 thiss!877)))))))))

(assert (=> d!106876 d!106884))

(push 1)

(check-sat)

(pop 1)

