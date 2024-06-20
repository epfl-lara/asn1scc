; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72472 () Bool)

(assert start!72472)

(declare-fun res!266056 () Bool)

(declare-fun e!233582 () Bool)

(assert (=> start!72472 (=> (not res!266056) (not e!233582))))

(declare-datatypes ((array!20769 0))(
  ( (array!20770 (arr!10127 (Array (_ BitVec 32) (_ BitVec 8))) (size!9035 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14232 0))(
  ( (BitStream!14233 (buf!8177 array!20769) (currentByte!15093 (_ BitVec 32)) (currentBit!15088 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14232)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72472 (= res!266056 (validate_offset_bit!0 ((_ sign_extend 32) (size!9035 (buf!8177 thiss!1702))) ((_ sign_extend 32) (currentByte!15093 thiss!1702)) ((_ sign_extend 32) (currentBit!15088 thiss!1702))))))

(assert (=> start!72472 e!233582))

(declare-fun e!233583 () Bool)

(declare-fun inv!12 (BitStream!14232) Bool)

(assert (=> start!72472 (and (inv!12 thiss!1702) e!233583)))

(declare-fun b!324140 () Bool)

(declare-fun res!266055 () Bool)

(assert (=> b!324140 (=> (not res!266055) (not e!233582))))

(declare-datatypes ((Unit!22070 0))(
  ( (Unit!22071) )
))
(declare-datatypes ((tuple2!23752 0))(
  ( (tuple2!23753 (_1!13505 Unit!22070) (_2!13505 BitStream!14232)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14232) tuple2!23752)

(assert (=> b!324140 (= res!266055 (= (buf!8177 (_2!13505 (increaseBitIndex!0 thiss!1702))) (buf!8177 thiss!1702)))))

(declare-fun b!324141 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324141 (= e!233582 (not (invariant!0 (currentBit!15088 thiss!1702) (currentByte!15093 thiss!1702) (size!9035 (buf!8177 thiss!1702)))))))

(declare-fun b!324142 () Bool)

(declare-fun array_inv!8587 (array!20769) Bool)

(assert (=> b!324142 (= e!233583 (array_inv!8587 (buf!8177 thiss!1702)))))

(assert (= (and start!72472 res!266056) b!324140))

(assert (= (and b!324140 res!266055) b!324141))

(assert (= start!72472 b!324142))

(declare-fun m!462225 () Bool)

(assert (=> start!72472 m!462225))

(declare-fun m!462227 () Bool)

(assert (=> start!72472 m!462227))

(declare-fun m!462229 () Bool)

(assert (=> b!324140 m!462229))

(declare-fun m!462231 () Bool)

(assert (=> b!324141 m!462231))

(declare-fun m!462233 () Bool)

(assert (=> b!324142 m!462233))

(check-sat (not start!72472) (not b!324141) (not b!324140) (not b!324142))
(check-sat)
(get-model)

(declare-fun d!106420 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106420 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9035 (buf!8177 thiss!1702))) ((_ sign_extend 32) (currentByte!15093 thiss!1702)) ((_ sign_extend 32) (currentBit!15088 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9035 (buf!8177 thiss!1702))) ((_ sign_extend 32) (currentByte!15093 thiss!1702)) ((_ sign_extend 32) (currentBit!15088 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28030 () Bool)

(assert (= bs!28030 d!106420))

(declare-fun m!462245 () Bool)

(assert (=> bs!28030 m!462245))

(assert (=> start!72472 d!106420))

(declare-fun d!106426 () Bool)

(assert (=> d!106426 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15088 thiss!1702) (currentByte!15093 thiss!1702) (size!9035 (buf!8177 thiss!1702))))))

(declare-fun bs!28032 () Bool)

(assert (= bs!28032 d!106426))

(assert (=> bs!28032 m!462231))

(assert (=> start!72472 d!106426))

(declare-fun d!106430 () Bool)

(assert (=> d!106430 (= (invariant!0 (currentBit!15088 thiss!1702) (currentByte!15093 thiss!1702) (size!9035 (buf!8177 thiss!1702))) (and (bvsge (currentBit!15088 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15088 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15093 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15093 thiss!1702) (size!9035 (buf!8177 thiss!1702))) (and (= (currentBit!15088 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15093 thiss!1702) (size!9035 (buf!8177 thiss!1702)))))))))

(assert (=> b!324141 d!106430))

(declare-fun d!106434 () Bool)

(declare-fun e!233600 () Bool)

(assert (=> d!106434 e!233600))

(declare-fun res!266080 () Bool)

(assert (=> d!106434 (=> (not res!266080) (not e!233600))))

(declare-fun lt!446720 () (_ BitVec 64))

(declare-fun lt!446722 () tuple2!23752)

(declare-fun lt!446718 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106434 (= res!266080 (= (bvadd lt!446720 lt!446718) (bitIndex!0 (size!9035 (buf!8177 (_2!13505 lt!446722))) (currentByte!15093 (_2!13505 lt!446722)) (currentBit!15088 (_2!13505 lt!446722)))))))

(assert (=> d!106434 (or (not (= (bvand lt!446720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446718 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446720 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446720 lt!446718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106434 (= lt!446718 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106434 (= lt!446720 (bitIndex!0 (size!9035 (buf!8177 thiss!1702)) (currentByte!15093 thiss!1702) (currentBit!15088 thiss!1702)))))

(declare-fun Unit!22077 () Unit!22070)

(declare-fun Unit!22079 () Unit!22070)

