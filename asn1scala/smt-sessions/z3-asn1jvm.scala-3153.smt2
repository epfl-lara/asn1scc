; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72372 () Bool)

(assert start!72372)

(declare-fun res!265972 () Bool)

(declare-fun e!233470 () Bool)

(assert (=> start!72372 (=> (not res!265972) (not e!233470))))

(declare-datatypes ((array!20742 0))(
  ( (array!20743 (arr!10118 (Array (_ BitVec 32) (_ BitVec 8))) (size!9026 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14214 0))(
  ( (BitStream!14215 (buf!8168 array!20742) (currentByte!15064 (_ BitVec 32)) (currentBit!15059 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14214)

(assert (=> start!72372 (= res!265972 (and (bvsle ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15064 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!15059 thiss!1702)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15064 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!15059 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!72372 e!233470))

(declare-fun e!233471 () Bool)

(declare-fun inv!12 (BitStream!14214) Bool)

(assert (=> start!72372 (and (inv!12 thiss!1702) e!233471)))

(declare-fun b!324030 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324030 (= e!233470 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15059 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15064 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702)))))))))

(declare-fun b!324031 () Bool)

(declare-fun array_inv!8578 (array!20742) Bool)

(assert (=> b!324031 (= e!233471 (array_inv!8578 (buf!8168 thiss!1702)))))

(assert (= (and start!72372 res!265972) b!324030))

(assert (= start!72372 b!324031))

(declare-fun m!462103 () Bool)

(assert (=> start!72372 m!462103))

(declare-fun m!462105 () Bool)

(assert (=> b!324030 m!462105))

(declare-fun m!462107 () Bool)

(assert (=> b!324031 m!462107))

(check-sat (not b!324031) (not start!72372) (not b!324030))
(check-sat)
(get-model)

(declare-fun d!106312 () Bool)

(assert (=> d!106312 (= (array_inv!8578 (buf!8168 thiss!1702)) (bvsge (size!9026 (buf!8168 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324031 d!106312))

(declare-fun d!106314 () Bool)

(assert (=> d!106314 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15059 thiss!1702) (currentByte!15064 thiss!1702) (size!9026 (buf!8168 thiss!1702))))))

(declare-fun bs!28007 () Bool)

(assert (= bs!28007 d!106314))

(declare-fun m!462115 () Bool)

(assert (=> bs!28007 m!462115))

(assert (=> start!72372 d!106314))

(declare-fun d!106316 () Bool)

(assert (=> d!106316 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15059 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15064 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15059 thiss!1702))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15059 thiss!1702))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15064 thiss!1702))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15064 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!15059 thiss!1702))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15064 thiss!1702))) ((_ extract 31 0) ((_ sign_extend 32) (size!9026 (buf!8168 thiss!1702)))))))))))

(assert (=> b!324030 d!106316))

(check-sat (not d!106314))
(check-sat)
