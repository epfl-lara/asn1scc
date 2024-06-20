; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72868 () Bool)

(assert start!72868)

(declare-fun b!324714 () Bool)

(declare-fun e!234067 () Bool)

(declare-fun e!234068 () Bool)

(assert (=> b!324714 (= e!234067 e!234068)))

(declare-fun res!266497 () Bool)

(assert (=> b!324714 (=> (not res!266497) (not e!234068))))

(declare-datatypes ((array!20893 0))(
  ( (array!20894 (arr!10172 (Array (_ BitVec 32) (_ BitVec 8))) (size!9080 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14322 0))(
  ( (BitStream!14323 (buf!8222 array!20893) (currentByte!15212 (_ BitVec 32)) (currentBit!15207 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14322)

(declare-fun lt!447197 () (_ BitVec 64))

(assert (=> b!324714 (= res!266497 (and (bvsle ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15212 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447197 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!15212 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge lt!447197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324714 (= lt!447197 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877))))))

(declare-fun b!324715 () Bool)

(declare-fun res!266495 () Bool)

(assert (=> b!324715 (=> (not res!266495) (not e!234067))))

(assert (=> b!324715 (= res!266495 (bvslt (currentBit!15207 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324716 () Bool)

(declare-fun e!234069 () Bool)

(declare-fun array_inv!8632 (array!20893) Bool)

(assert (=> b!324716 (= e!234069 (array_inv!8632 (buf!8222 thiss!877)))))

(declare-fun b!324717 () Bool)

(declare-fun res!266494 () Bool)

(assert (=> b!324717 (=> (not res!266494) (not e!234067))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324717 (= res!266494 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9080 (buf!8222 thiss!877)) (currentByte!15212 thiss!877) (currentBit!15207 thiss!877))) (bitIndex!0 (size!9080 (buf!8222 thiss!877)) (currentByte!15212 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877)))))))

(declare-fun res!266496 () Bool)

(assert (=> start!72868 (=> (not res!266496) (not e!234067))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72868 (= res!266496 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) ((_ sign_extend 32) (currentByte!15212 thiss!877)) ((_ sign_extend 32) (currentBit!15207 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72868 e!234067))

(declare-fun inv!12 (BitStream!14322) Bool)

(assert (=> start!72868 (and (inv!12 thiss!877) e!234069)))

(declare-fun b!324718 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324718 (= e!234068 (not (invariant!0 ((_ extract 31 0) lt!447197) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15212 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877)))))))))

(assert (= (and start!72868 res!266496) b!324715))

(assert (= (and b!324715 res!266495) b!324717))

(assert (= (and b!324717 res!266494) b!324714))

(assert (= (and b!324714 res!266497) b!324718))

(assert (= start!72868 b!324716))

(declare-fun m!462781 () Bool)

(assert (=> b!324716 m!462781))

(declare-fun m!462783 () Bool)

(assert (=> b!324717 m!462783))

(declare-fun m!462785 () Bool)

(assert (=> b!324717 m!462785))

(declare-fun m!462787 () Bool)

(assert (=> start!72868 m!462787))

(declare-fun m!462789 () Bool)

(assert (=> start!72868 m!462789))

(declare-fun m!462791 () Bool)

(assert (=> b!324718 m!462791))

(check-sat (not b!324716) (not start!72868) (not b!324717) (not b!324718))
(check-sat)
(get-model)

(declare-fun d!106792 () Bool)

(assert (=> d!106792 (= (array_inv!8632 (buf!8222 thiss!877)) (bvsge (size!9080 (buf!8222 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324716 d!106792))

(declare-fun d!106794 () Bool)

(assert (=> d!106794 (= (remainingBits!0 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) ((_ sign_extend 32) (currentByte!15212 thiss!877)) ((_ sign_extend 32) (currentBit!15207 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15212 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15207 thiss!877)))))))

(assert (=> start!72868 d!106794))

(declare-fun d!106796 () Bool)

(assert (=> d!106796 (= (inv!12 thiss!877) (invariant!0 (currentBit!15207 thiss!877) (currentByte!15212 thiss!877) (size!9080 (buf!8222 thiss!877))))))

(declare-fun bs!28124 () Bool)

(assert (= bs!28124 d!106796))

(declare-fun m!462805 () Bool)

(assert (=> bs!28124 m!462805))

(assert (=> start!72868 d!106796))

(declare-fun d!106798 () Bool)

(declare-fun e!234084 () Bool)

(assert (=> d!106798 e!234084))

(declare-fun res!266515 () Bool)

(assert (=> d!106798 (=> (not res!266515) (not e!234084))))

(declare-fun lt!447217 () (_ BitVec 64))

(declare-fun lt!447214 () (_ BitVec 64))

(declare-fun lt!447216 () (_ BitVec 64))

(assert (=> d!106798 (= res!266515 (= lt!447217 (bvsub lt!447214 lt!447216)))))

(assert (=> d!106798 (or (= (bvand lt!447214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447216 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447214 lt!447216) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106798 (= lt!447216 (remainingBits!0 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) ((_ sign_extend 32) (currentByte!15212 thiss!877)) ((_ sign_extend 32) (currentBit!15207 thiss!877))))))

(declare-fun lt!447213 () (_ BitVec 64))

(declare-fun lt!447218 () (_ BitVec 64))

(assert (=> d!106798 (= lt!447214 (bvmul lt!447213 lt!447218))))

(assert (=> d!106798 (or (= lt!447213 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447218 (bvsdiv (bvmul lt!447213 lt!447218) lt!447213)))))

(assert (=> d!106798 (= lt!447218 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106798 (= lt!447213 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))))

(assert (=> d!106798 (= lt!447217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15212 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15207 thiss!877))))))

(assert (=> d!106798 (invariant!0 (currentBit!15207 thiss!877) (currentByte!15212 thiss!877) (size!9080 (buf!8222 thiss!877)))))

(assert (=> d!106798 (= (bitIndex!0 (size!9080 (buf!8222 thiss!877)) (currentByte!15212 thiss!877) (currentBit!15207 thiss!877)) lt!447217)))

(declare-fun b!324738 () Bool)

(declare-fun res!266514 () Bool)

(assert (=> b!324738 (=> (not res!266514) (not e!234084))))

(assert (=> b!324738 (= res!266514 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447217))))

(declare-fun b!324739 () Bool)

(declare-fun lt!447215 () (_ BitVec 64))

(assert (=> b!324739 (= e!234084 (bvsle lt!447217 (bvmul lt!447215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324739 (or (= lt!447215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447215)))))

(assert (=> b!324739 (= lt!447215 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))))

(assert (= (and d!106798 res!266515) b!324738))

(assert (= (and b!324738 res!266514) b!324739))

(assert (=> d!106798 m!462787))

(assert (=> d!106798 m!462805))

(assert (=> b!324717 d!106798))

(declare-fun d!106806 () Bool)

(declare-fun e!234085 () Bool)

(assert (=> d!106806 e!234085))

(declare-fun res!266517 () Bool)

(assert (=> d!106806 (=> (not res!266517) (not e!234085))))

(declare-fun lt!447220 () (_ BitVec 64))

(declare-fun lt!447222 () (_ BitVec 64))

(declare-fun lt!447223 () (_ BitVec 64))

(assert (=> d!106806 (= res!266517 (= lt!447223 (bvsub lt!447220 lt!447222)))))

(assert (=> d!106806 (or (= (bvand lt!447220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447222 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447220 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447220 lt!447222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106806 (= lt!447222 (remainingBits!0 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))) ((_ sign_extend 32) (currentByte!15212 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877)))))))

(declare-fun lt!447219 () (_ BitVec 64))

(declare-fun lt!447224 () (_ BitVec 64))

(assert (=> d!106806 (= lt!447220 (bvmul lt!447219 lt!447224))))

(assert (=> d!106806 (or (= lt!447219 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447224 (bvsdiv (bvmul lt!447219 lt!447224) lt!447219)))))

(assert (=> d!106806 (= lt!447224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106806 (= lt!447219 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))))

(assert (=> d!106806 (= lt!447223 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15212 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877)))))))

(assert (=> d!106806 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877)) (currentByte!15212 thiss!877) (size!9080 (buf!8222 thiss!877)))))

(assert (=> d!106806 (= (bitIndex!0 (size!9080 (buf!8222 thiss!877)) (currentByte!15212 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15207 thiss!877))) lt!447223)))

(declare-fun b!324740 () Bool)

(declare-fun res!266516 () Bool)

(assert (=> b!324740 (=> (not res!266516) (not e!234085))))

(assert (=> b!324740 (= res!266516 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447223))))

(declare-fun b!324741 () Bool)

(declare-fun lt!447221 () (_ BitVec 64))

(assert (=> b!324741 (= e!234085 (bvsle lt!447223 (bvmul lt!447221 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324741 (or (= lt!447221 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447221 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447221)))))

(assert (=> b!324741 (= lt!447221 ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))))

(assert (= (and d!106806 res!266517) b!324740))

(assert (= (and b!324740 res!266516) b!324741))

(declare-fun m!462809 () Bool)

(assert (=> d!106806 m!462809))

(declare-fun m!462811 () Bool)

(assert (=> d!106806 m!462811))

(assert (=> b!324717 d!106806))

(declare-fun d!106808 () Bool)

(assert (=> d!106808 (= (invariant!0 ((_ extract 31 0) lt!447197) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15212 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))) (and (bvsge ((_ extract 31 0) lt!447197) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) lt!447197) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15212 thiss!877))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15212 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877))))) (and (= ((_ extract 31 0) lt!447197) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!15212 thiss!877))) ((_ extract 31 0) ((_ sign_extend 32) (size!9080 (buf!8222 thiss!877)))))))))))

(assert (=> b!324718 d!106808))

(check-sat (not d!106798) (not d!106806) (not d!106796))
