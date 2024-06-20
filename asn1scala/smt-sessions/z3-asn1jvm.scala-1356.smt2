; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37622 () Bool)

(assert start!37622)

(declare-fun res!141681 () Bool)

(declare-fun e!119114 () Bool)

(assert (=> start!37622 (=> (not res!141681) (not e!119114))))

(declare-datatypes ((array!9038 0))(
  ( (array!9039 (arr!4931 (Array (_ BitVec 32) (_ BitVec 8))) (size!4001 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7140 0))(
  ( (BitStream!7141 (buf!4444 array!9038) (currentByte!8430 (_ BitVec 32)) (currentBit!8425 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7140)

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37622 (= res!141681 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283) (bvsle ((_ sign_extend 32) (size!4001 (buf!4444 bs!64))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!8430 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!8425 bs!64)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!4001 (buf!4444 bs!64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!8430 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!8425 bs!64)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!37622 e!119114))

(assert (=> start!37622 true))

(declare-fun e!119115 () Bool)

(declare-fun inv!12 (BitStream!7140) Bool)

(assert (=> start!37622 (and (inv!12 bs!64) e!119115)))

(declare-fun b!170729 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!170729 (= e!119114 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8425 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8430 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4001 (buf!4444 bs!64)))))))))

(declare-fun b!170730 () Bool)

(declare-fun array_inv!3742 (array!9038) Bool)

(assert (=> b!170730 (= e!119115 (array_inv!3742 (buf!4444 bs!64)))))

(assert (= (and start!37622 res!141681) b!170729))

(assert (= start!37622 b!170730))

(declare-fun m!269891 () Bool)

(assert (=> start!37622 m!269891))

(declare-fun m!269893 () Bool)

(assert (=> b!170729 m!269893))

(declare-fun m!269895 () Bool)

(assert (=> b!170730 m!269895))

(check-sat (not b!170730) (not b!170729) (not start!37622))
(check-sat)
(get-model)

(declare-fun d!60315 () Bool)

(assert (=> d!60315 (= (array_inv!3742 (buf!4444 bs!64)) (bvsge (size!4001 (buf!4444 bs!64)) #b00000000000000000000000000000000))))

(assert (=> b!170730 d!60315))

(declare-fun d!60317 () Bool)

(assert (=> d!60317 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8425 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8430 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4001 (buf!4444 bs!64))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8425 bs!64))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8425 bs!64))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8430 bs!64))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8430 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4001 (buf!4444 bs!64))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!8425 bs!64))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!8430 bs!64))) ((_ extract 31 0) ((_ sign_extend 32) (size!4001 (buf!4444 bs!64)))))))))))

(assert (=> b!170729 d!60317))

(declare-fun d!60319 () Bool)

(assert (=> d!60319 (= (inv!12 bs!64) (invariant!0 (currentBit!8425 bs!64) (currentByte!8430 bs!64) (size!4001 (buf!4444 bs!64))))))

(declare-fun bs!14997 () Bool)

(assert (= bs!14997 d!60319))

(declare-fun m!269903 () Bool)

(assert (=> bs!14997 m!269903))

(assert (=> start!37622 d!60319))

(check-sat (not d!60319))
(check-sat)
