; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72678 () Bool)

(assert start!72678)

(declare-fun res!266218 () Bool)

(declare-fun e!233809 () Bool)

(assert (=> start!72678 (=> (not res!266218) (not e!233809))))

(declare-datatypes ((array!20829 0))(
  ( (array!20830 (arr!10148 (Array (_ BitVec 32) (_ BitVec 8))) (size!9056 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14274 0))(
  ( (BitStream!14275 (buf!8198 array!20829) (currentByte!15151 (_ BitVec 32)) (currentBit!15146 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14274)

(assert (=> start!72678 (= res!266218 (and (bvsle ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15151 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15146 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15151 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15146 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72678 e!233809))

(declare-fun e!233810 () Bool)

(declare-fun inv!12 (BitStream!14274) Bool)

(assert (=> start!72678 (and (inv!12 thiss!877) e!233810)))

(declare-fun b!324366 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324366 (= e!233809 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15146 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15151 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877)))))))))

(declare-fun b!324367 () Bool)

(declare-fun array_inv!8608 (array!20829) Bool)

(assert (=> b!324367 (= e!233810 (array_inv!8608 (buf!8198 thiss!877)))))

(assert (= (and start!72678 res!266218) b!324366))

(assert (= start!72678 b!324367))

(declare-fun m!462489 () Bool)

(assert (=> start!72678 m!462489))

(declare-fun m!462491 () Bool)

(assert (=> b!324366 m!462491))

(declare-fun m!462493 () Bool)

(assert (=> b!324367 m!462493))

(check-sat (not start!72678) (not b!324366) (not b!324367))
(check-sat)
(get-model)

(declare-fun d!106602 () Bool)

(assert (=> d!106602 (= (inv!12 thiss!877) (invariant!0 (currentBit!15146 thiss!877) (currentByte!15151 thiss!877) (size!9056 (buf!8198 thiss!877))))))

(declare-fun bs!28083 () Bool)

(assert (= bs!28083 d!106602))

(declare-fun m!462501 () Bool)

(assert (=> bs!28083 m!462501))

(assert (=> start!72678 d!106602))

(declare-fun d!106604 () Bool)

(assert (=> d!106604 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15146 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15151 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15146 thiss!877))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15146 thiss!877))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15151 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15151 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15146 thiss!877))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15151 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9056 (buf!8198 thiss!877)))))))))))

(assert (=> b!324366 d!106604))

(declare-fun d!106606 () Bool)

(assert (=> d!106606 (= (array_inv!8608 (buf!8198 thiss!877)) (bvsge (size!9056 (buf!8198 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324367 d!106606))

(check-sat (not d!106602))
(check-sat)
