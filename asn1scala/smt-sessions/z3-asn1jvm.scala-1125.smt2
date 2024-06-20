; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32000 () Bool)

(assert start!32000)

(declare-fun res!132530 () Bool)

(declare-fun e!108115 () Bool)

(assert (=> start!32000 (=> (not res!132530) (not e!108115))))

(declare-datatypes ((array!7478 0))(
  ( (array!7479 (arr!4310 (Array (_ BitVec 32) (_ BitVec 8))) (size!3389 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5946 0))(
  ( (BitStream!5947 (buf!3847 array!7478) (currentByte!7058 (_ BitVec 32)) (currentBit!7053 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!5946)

(assert (=> start!32000 (= res!132530 (and (bvsle ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!7058 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!7053 thiss!1602)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!7058 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!7053 thiss!1602)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!32000 e!108115))

(declare-fun e!108116 () Bool)

(declare-fun inv!12 (BitStream!5946) Bool)

(assert (=> start!32000 (and (inv!12 thiss!1602) e!108116)))

(declare-fun b!158741 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!158741 (= e!108115 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7053 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7058 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602)))))))))

(declare-fun b!158742 () Bool)

(declare-fun array_inv!3136 (array!7478) Bool)

(assert (=> b!158742 (= e!108116 (array_inv!3136 (buf!3847 thiss!1602)))))

(assert (= (and start!32000 res!132530) b!158741))

(assert (= start!32000 b!158742))

(declare-fun m!249301 () Bool)

(assert (=> start!32000 m!249301))

(declare-fun m!249303 () Bool)

(assert (=> b!158741 m!249303))

(declare-fun m!249305 () Bool)

(assert (=> b!158742 m!249305))

(check-sat (not b!158741) (not b!158742) (not start!32000))
(check-sat)
(get-model)

(declare-fun d!53353 () Bool)

(assert (=> d!53353 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7053 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7058 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7053 thiss!1602))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7053 thiss!1602))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7058 thiss!1602))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7058 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!7053 thiss!1602))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!7058 thiss!1602))) ((_ extract 31 0) ((_ sign_extend 32) (size!3389 (buf!3847 thiss!1602)))))))))))

(assert (=> b!158741 d!53353))

(declare-fun d!53355 () Bool)

(assert (=> d!53355 (= (array_inv!3136 (buf!3847 thiss!1602)) (bvsge (size!3389 (buf!3847 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!158742 d!53355))

(declare-fun d!53357 () Bool)

(assert (=> d!53357 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7053 thiss!1602) (currentByte!7058 thiss!1602) (size!3389 (buf!3847 thiss!1602))))))

(declare-fun bs!13203 () Bool)

(assert (= bs!13203 d!53357))

(declare-fun m!249313 () Bool)

(assert (=> bs!13203 m!249313))

(assert (=> start!32000 d!53357))

(check-sat (not d!53357))
(check-sat)
