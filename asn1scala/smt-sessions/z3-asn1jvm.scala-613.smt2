; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17440 () Bool)

(assert start!17440)

(declare-fun res!69055 () Bool)

(declare-fun e!56218 () Bool)

(assert (=> start!17440 (=> (not res!69055) (not e!56218))))

(declare-fun nBits!333 () (_ BitVec 32))

(declare-datatypes ((array!3968 0))(
  ( (array!3969 (arr!2434 (Array (_ BitVec 32) (_ BitVec 8))) (size!1797 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3156 0))(
  ( (BitStream!3157 (buf!2187 array!3968) (currentByte!4343 (_ BitVec 32)) (currentBit!4338 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3156)

(assert (=> start!17440 (= res!69055 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4343 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4338 thiss!1136)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4343 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4338 thiss!1136)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!17440 e!56218))

(assert (=> start!17440 true))

(declare-fun e!56219 () Bool)

(declare-fun inv!12 (BitStream!3156) Bool)

(assert (=> start!17440 (and (inv!12 thiss!1136) e!56219)))

(declare-fun b!84105 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84105 (= e!56218 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4338 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4343 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136)))))))))

(declare-fun b!84106 () Bool)

(declare-fun array_inv!1643 (array!3968) Bool)

(assert (=> b!84106 (= e!56219 (array_inv!1643 (buf!2187 thiss!1136)))))

(assert (= (and start!17440 res!69055) b!84105))

(assert (= start!17440 b!84106))

(declare-fun m!130813 () Bool)

(assert (=> start!17440 m!130813))

(declare-fun m!130815 () Bool)

(assert (=> b!84105 m!130815))

(declare-fun m!130817 () Bool)

(assert (=> b!84106 m!130817))

(check-sat (not b!84106) (not b!84105) (not start!17440))
(check-sat)
(get-model)

(declare-fun d!27084 () Bool)

(assert (=> d!27084 (= (array_inv!1643 (buf!2187 thiss!1136)) (bvsge (size!1797 (buf!2187 thiss!1136)) #b00000000000000000000000000000000))))

(assert (=> b!84106 d!27084))

(declare-fun d!27086 () Bool)

(assert (=> d!27086 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4338 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4343 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4338 thiss!1136))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4338 thiss!1136))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4343 thiss!1136))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4343 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4338 thiss!1136))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4343 thiss!1136))) ((_ extract 31 0) ((_ sign_extend 32) (size!1797 (buf!2187 thiss!1136)))))))))))

(assert (=> b!84105 d!27086))

(declare-fun d!27088 () Bool)

(assert (=> d!27088 (= (inv!12 thiss!1136) (invariant!0 (currentBit!4338 thiss!1136) (currentByte!4343 thiss!1136) (size!1797 (buf!2187 thiss!1136))))))

(declare-fun bs!6696 () Bool)

(assert (= bs!6696 d!27088))

(declare-fun m!130825 () Bool)

(assert (=> bs!6696 m!130825))

(assert (=> start!17440 d!27088))

(check-sat (not d!27088))
(check-sat)
