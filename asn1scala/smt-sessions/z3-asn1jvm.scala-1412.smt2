; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38890 () Bool)

(assert start!38890)

(declare-fun res!144957 () Bool)

(declare-fun e!122048 () Bool)

(assert (=> start!38890 (=> (not res!144957) (not e!122048))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!9410 0))(
  ( (array!9411 (arr!5081 (Array (_ BitVec 32) (_ BitVec 8))) (size!4151 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7410 0))(
  ( (BitStream!7411 (buf!4588 array!9410) (currentByte!8709 (_ BitVec 32)) (currentBit!8704 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7410)

(assert (=> start!38890 (= res!144957 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348) (bvsle ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8709 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8704 thiss!1204)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8709 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8704 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!38890 e!122048))

(assert (=> start!38890 true))

(declare-fun e!122049 () Bool)

(declare-fun inv!12 (BitStream!7410) Bool)

(assert (=> start!38890 (and (inv!12 thiss!1204) e!122049)))

(declare-fun b!175046 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175046 (= e!122048 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8704 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8709 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204)))))))))

(declare-fun b!175047 () Bool)

(declare-fun array_inv!3892 (array!9410) Bool)

(assert (=> b!175047 (= e!122049 (array_inv!3892 (buf!4588 thiss!1204)))))

(assert (= (and start!38890 res!144957) b!175046))

(assert (= start!38890 b!175047))

(declare-fun m!275295 () Bool)

(assert (=> start!38890 m!275295))

(declare-fun m!275297 () Bool)

(assert (=> b!175046 m!275297))

(declare-fun m!275299 () Bool)

(assert (=> b!175047 m!275299))

(check-sat (not b!175046) (not start!38890) (not b!175047))
(check-sat)
(get-model)

(declare-fun d!61891 () Bool)

(assert (=> d!61891 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8704 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8709 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8704 thiss!1204))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8704 thiss!1204))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8709 thiss!1204))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8709 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8704 thiss!1204))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8709 thiss!1204))) ((_ extract 31 0) ((_ sign_extend 32) (size!4151 (buf!4588 thiss!1204)))))))))))

(assert (=> b!175046 d!61891))

(declare-fun d!61895 () Bool)

(assert (=> d!61895 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8704 thiss!1204) (currentByte!8709 thiss!1204) (size!4151 (buf!4588 thiss!1204))))))

(declare-fun bs!15416 () Bool)

(assert (= bs!15416 d!61895))

(declare-fun m!275307 () Bool)

(assert (=> bs!15416 m!275307))

(assert (=> start!38890 d!61895))

(declare-fun d!61899 () Bool)

(assert (=> d!61899 (= (array_inv!3892 (buf!4588 thiss!1204)) (bvsge (size!4151 (buf!4588 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175047 d!61899))

(check-sat (not d!61895))
(check-sat)
