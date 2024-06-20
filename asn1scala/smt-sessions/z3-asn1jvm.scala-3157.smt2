; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72508 () Bool)

(assert start!72508)

(declare-fun res!266086 () Bool)

(declare-fun e!233617 () Bool)

(assert (=> start!72508 (=> (not res!266086) (not e!233617))))

(declare-datatypes ((array!20778 0))(
  ( (array!20779 (arr!10130 (Array (_ BitVec 32) (_ BitVec 8))) (size!9038 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14238 0))(
  ( (BitStream!14239 (buf!8180 array!20778) (currentByte!15102 (_ BitVec 32)) (currentBit!15097 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14238)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72508 (= res!266086 (validate_offset_bit!0 ((_ sign_extend 32) (size!9038 (buf!8180 thiss!1702))) ((_ sign_extend 32) (currentByte!15102 thiss!1702)) ((_ sign_extend 32) (currentBit!15097 thiss!1702))))))

(assert (=> start!72508 e!233617))

(declare-fun e!233618 () Bool)

(declare-fun inv!12 (BitStream!14238) Bool)

(assert (=> start!72508 (and (inv!12 thiss!1702) e!233618)))

(declare-fun b!324180 () Bool)

(assert (=> b!324180 (= e!233617 (or (bvslt (currentByte!15102 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentByte!15102 thiss!1702) (size!9038 (buf!8180 thiss!1702)))))))

(declare-fun b!324181 () Bool)

(declare-fun array_inv!8590 (array!20778) Bool)

(assert (=> b!324181 (= e!233618 (array_inv!8590 (buf!8180 thiss!1702)))))

(assert (= (and start!72508 res!266086) b!324180))

(assert (= start!72508 b!324181))

(declare-fun m!462275 () Bool)

(assert (=> start!72508 m!462275))

(declare-fun m!462277 () Bool)

(assert (=> start!72508 m!462277))

(declare-fun m!462279 () Bool)

(assert (=> b!324181 m!462279))

(check-sat (not start!72508) (not b!324181))
(check-sat)
(get-model)

(declare-fun d!106450 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106450 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9038 (buf!8180 thiss!1702))) ((_ sign_extend 32) (currentByte!15102 thiss!1702)) ((_ sign_extend 32) (currentBit!15097 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9038 (buf!8180 thiss!1702))) ((_ sign_extend 32) (currentByte!15102 thiss!1702)) ((_ sign_extend 32) (currentBit!15097 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28039 () Bool)

(assert (= bs!28039 d!106450))

(declare-fun m!462287 () Bool)

(assert (=> bs!28039 m!462287))

(assert (=> start!72508 d!106450))

(declare-fun d!106452 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106452 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15097 thiss!1702) (currentByte!15102 thiss!1702) (size!9038 (buf!8180 thiss!1702))))))

(declare-fun bs!28040 () Bool)

(assert (= bs!28040 d!106452))

(declare-fun m!462289 () Bool)

(assert (=> bs!28040 m!462289))

(assert (=> start!72508 d!106452))

(declare-fun d!106456 () Bool)

(assert (=> d!106456 (= (array_inv!8590 (buf!8180 thiss!1702)) (bvsge (size!9038 (buf!8180 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324181 d!106456))

(check-sat (not d!106450) (not d!106452))
(check-sat)
(get-model)

(declare-fun d!106468 () Bool)

(assert (=> d!106468 (= (remainingBits!0 ((_ sign_extend 32) (size!9038 (buf!8180 thiss!1702))) ((_ sign_extend 32) (currentByte!15102 thiss!1702)) ((_ sign_extend 32) (currentBit!15097 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9038 (buf!8180 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15102 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15097 thiss!1702)))))))

(assert (=> d!106450 d!106468))

(declare-fun d!106470 () Bool)

(assert (=> d!106470 (= (invariant!0 (currentBit!15097 thiss!1702) (currentByte!15102 thiss!1702) (size!9038 (buf!8180 thiss!1702))) (and (bvsge (currentBit!15097 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15097 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15102 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15102 thiss!1702) (size!9038 (buf!8180 thiss!1702))) (and (= (currentBit!15097 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15102 thiss!1702) (size!9038 (buf!8180 thiss!1702)))))))))

(assert (=> d!106452 d!106470))

(check-sat)
