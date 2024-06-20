; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72728 () Bool)

(assert start!72728)

(declare-fun res!266256 () Bool)

(declare-fun e!233872 () Bool)

(assert (=> start!72728 (=> (not res!266256) (not e!233872))))

(declare-datatypes ((array!20847 0))(
  ( (array!20848 (arr!10155 (Array (_ BitVec 32) (_ BitVec 8))) (size!9063 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14288 0))(
  ( (BitStream!14289 (buf!8205 array!20847) (currentByte!15166 (_ BitVec 32)) (currentBit!15161 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14288)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72728 (= res!266256 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9063 (buf!8205 thiss!877))) ((_ sign_extend 32) (currentByte!15166 thiss!877)) ((_ sign_extend 32) (currentBit!15161 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72728 e!233872))

(declare-fun e!233874 () Bool)

(declare-fun inv!12 (BitStream!14288) Bool)

(assert (=> start!72728 (and (inv!12 thiss!877) e!233874)))

(declare-fun b!324425 () Bool)

(declare-fun res!266257 () Bool)

(assert (=> b!324425 (=> (not res!266257) (not e!233872))))

(assert (=> b!324425 (= res!266257 (bvslt (currentBit!15161 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324426 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324426 (= e!233872 (not (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15161 thiss!877)) (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877)))))))

(declare-fun b!324427 () Bool)

(declare-fun array_inv!8615 (array!20847) Bool)

(assert (=> b!324427 (= e!233874 (array_inv!8615 (buf!8205 thiss!877)))))

(assert (= (and start!72728 res!266256) b!324425))

(assert (= (and b!324425 res!266257) b!324426))

(assert (= start!72728 b!324427))

(declare-fun m!462545 () Bool)

(assert (=> start!72728 m!462545))

(declare-fun m!462547 () Bool)

(assert (=> start!72728 m!462547))

(declare-fun m!462549 () Bool)

(assert (=> b!324426 m!462549))

(declare-fun m!462551 () Bool)

(assert (=> b!324427 m!462551))

(push 1)

(assert (not b!324427))

(assert (not b!324426))

(assert (not start!72728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106648 () Bool)

(assert (=> d!106648 (= (array_inv!8615 (buf!8205 thiss!877)) (bvsge (size!9063 (buf!8205 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324427 d!106648))

(declare-fun d!106652 () Bool)

(assert (=> d!106652 (= (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15161 thiss!877)) (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877))) (and (bvsge (bvadd #b00000000000000000000000000000001 (currentBit!15161 thiss!877)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentBit!15161 thiss!877)) #b00000000000000000000000000001000) (bvsge (currentByte!15166 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877))) (and (= (bvadd #b00000000000000000000000000000001 (currentBit!15161 thiss!877)) #b00000000000000000000000000000000) (= (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877)))))))))

(assert (=> b!324426 d!106652))

(declare-fun d!106660 () Bool)

(assert (=> d!106660 (= (remainingBits!0 ((_ sign_extend 32) (size!9063 (buf!8205 thiss!877))) ((_ sign_extend 32) (currentByte!15166 thiss!877)) ((_ sign_extend 32) (currentBit!15161 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9063 (buf!8205 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15166 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15161 thiss!877)))))))

(assert (=> start!72728 d!106660))

(declare-fun d!106664 () Bool)

(assert (=> d!106664 (= (inv!12 thiss!877) (invariant!0 (currentBit!15161 thiss!877) (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877))))))

(declare-fun bs!28096 () Bool)

(assert (= bs!28096 d!106664))

(declare-fun m!462557 () Bool)

(assert (=> bs!28096 m!462557))

(assert (=> start!72728 d!106664))

(push 1)

(assert (not d!106664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106668 () Bool)

(assert (=> d!106668 (= (invariant!0 (currentBit!15161 thiss!877) (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877))) (and (bvsge (currentBit!15161 thiss!877) #b00000000000000000000000000000000) (bvslt (currentBit!15161 thiss!877) #b00000000000000000000000000001000) (bvsge (currentByte!15166 thiss!877) #b00000000000000000000000000000000) (or (bvslt (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877))) (and (= (currentBit!15161 thiss!877) #b00000000000000000000000000000000) (= (currentByte!15166 thiss!877) (size!9063 (buf!8205 thiss!877)))))))))

(assert (=> d!106664 d!106668))

(push 1)

(check-sat)

(pop 1)

