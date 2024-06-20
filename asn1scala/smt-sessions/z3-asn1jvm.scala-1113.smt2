; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31892 () Bool)

(assert start!31892)

(declare-fun res!132497 () Bool)

(declare-fun e!108025 () Bool)

(assert (=> start!31892 (=> (not res!132497) (not e!108025))))

(declare-fun nBits!578 () (_ BitVec 32))

(declare-datatypes ((array!7450 0))(
  ( (array!7451 (arr!4298 (Array (_ BitVec 32) (_ BitVec 8))) (size!3377 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5922 0))(
  ( (BitStream!5923 (buf!3835 array!7450) (currentByte!7042 (_ BitVec 32)) (currentBit!7037 (_ BitVec 32))) )
))
(declare-fun thiss!1825 () BitStream!5922)

(assert (=> start!31892 (= res!132497 (and (bvsge nBits!578 #b00000000000000000000000000000000) (bvsle nBits!578 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7042 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7037 thiss!1825)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7042 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7037 thiss!1825)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!31892 e!108025))

(assert (=> start!31892 true))

(declare-fun e!108026 () Bool)

(declare-fun inv!12 (BitStream!5922) Bool)

(assert (=> start!31892 (and (inv!12 thiss!1825) e!108026)))

(declare-fun b!158678 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158678 (= e!108025 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7037 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7042 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825)))))))))

(declare-fun b!158679 () Bool)

(declare-fun array_inv!3124 (array!7450) Bool)

(assert (=> b!158679 (= e!108026 (array_inv!3124 (buf!3835 thiss!1825)))))

(assert (= (and start!31892 res!132497) b!158678))

(assert (= start!31892 b!158679))

(declare-fun m!249219 () Bool)

(assert (=> start!31892 m!249219))

(declare-fun m!249221 () Bool)

(assert (=> b!158678 m!249221))

(declare-fun m!249223 () Bool)

(assert (=> b!158679 m!249223))

(check-sat (not start!31892) (not b!158678) (not b!158679))
(check-sat)
(get-model)

(declare-fun d!53293 () Bool)

(assert (=> d!53293 (= (inv!12 thiss!1825) (invariant!0 (currentBit!7037 thiss!1825) (currentByte!7042 thiss!1825) (size!3377 (buf!3835 thiss!1825))))))

(declare-fun bs!13156 () Bool)

(assert (= bs!13156 d!53293))

(declare-fun m!249231 () Bool)

(assert (=> bs!13156 m!249231))

(assert (=> start!31892 d!53293))

(declare-fun d!53295 () Bool)

(assert (=> d!53295 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7037 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7042 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7037 thiss!1825))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7037 thiss!1825))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7042 thiss!1825))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7042 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7037 thiss!1825))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7042 thiss!1825))) ((_ extract 31 0) ((_ sign_extend 32) (size!3377 (buf!3835 thiss!1825)))))))))))

(assert (=> b!158678 d!53295))

(declare-fun d!53297 () Bool)

(assert (=> d!53297 (= (array_inv!3124 (buf!3835 thiss!1825)) (bvsge (size!3377 (buf!3835 thiss!1825)) #b00000000000000000000000000000000))))

(assert (=> b!158679 d!53297))

(check-sat (not d!53293))
(check-sat)
