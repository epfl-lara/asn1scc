; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72836 () Bool)

(assert start!72836)

(declare-fun res!266440 () Bool)

(declare-fun e!234022 () Bool)

(assert (=> start!72836 (=> (not res!266440) (not e!234022))))

(declare-datatypes ((array!20884 0))(
  ( (array!20885 (arr!10169 (Array (_ BitVec 32) (_ BitVec 8))) (size!9077 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14316 0))(
  ( (BitStream!14317 (buf!8219 array!20884) (currentByte!15202 (_ BitVec 32)) (currentBit!15197 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14316)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!72836 (= res!266440 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) ((_ sign_extend 32) (currentByte!15202 thiss!877)) ((_ sign_extend 32) (currentBit!15197 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!72836 e!234022))

(declare-fun e!234023 () Bool)

(declare-fun inv!12 (BitStream!14316) Bool)

(assert (=> start!72836 (and (inv!12 thiss!877) e!234023)))

(declare-fun b!324649 () Bool)

(declare-fun res!266438 () Bool)

(assert (=> b!324649 (=> (not res!266438) (not e!234022))))

(assert (=> b!324649 (= res!266438 (bvslt (currentBit!15197 thiss!877) #b00000000000000000000000000000111))))

(declare-fun b!324652 () Bool)

(declare-fun array_inv!8629 (array!20884) Bool)

(assert (=> b!324652 (= e!234023 (array_inv!8629 (buf!8219 thiss!877)))))

(declare-fun b!324651 () Bool)

(declare-fun lt!447116 () (_ BitVec 64))

(assert (=> b!324651 (= e!234022 (and (bvsle ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!15202 thiss!877)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle lt!447116 #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!15202 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt lt!447116 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!324651 (= lt!447116 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877))))))

(declare-fun b!324650 () Bool)

(declare-fun res!266439 () Bool)

(assert (=> b!324650 (=> (not res!266439) (not e!234022))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324650 (= res!266439 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9077 (buf!8219 thiss!877)) (currentByte!15202 thiss!877) (currentBit!15197 thiss!877))) (bitIndex!0 (size!9077 (buf!8219 thiss!877)) (currentByte!15202 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877)))))))

(assert (= (and start!72836 res!266440) b!324649))

(assert (= (and b!324649 res!266438) b!324650))

(assert (= (and b!324650 res!266439) b!324651))

(assert (= start!72836 b!324652))

(declare-fun m!462731 () Bool)

(assert (=> start!72836 m!462731))

(declare-fun m!462733 () Bool)

(assert (=> start!72836 m!462733))

(declare-fun m!462735 () Bool)

(assert (=> b!324652 m!462735))

(declare-fun m!462737 () Bool)

(assert (=> b!324650 m!462737))

(declare-fun m!462739 () Bool)

(assert (=> b!324650 m!462739))

(check-sat (not start!72836) (not b!324650) (not b!324652))
(check-sat)
(get-model)

(declare-fun d!106754 () Bool)

(assert (=> d!106754 (= (remainingBits!0 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) ((_ sign_extend 32) (currentByte!15202 thiss!877)) ((_ sign_extend 32) (currentBit!15197 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15202 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15197 thiss!877)))))))

(assert (=> start!72836 d!106754))

(declare-fun d!106756 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106756 (= (inv!12 thiss!877) (invariant!0 (currentBit!15197 thiss!877) (currentByte!15202 thiss!877) (size!9077 (buf!8219 thiss!877))))))

(declare-fun bs!28118 () Bool)

(assert (= bs!28118 d!106756))

(declare-fun m!462751 () Bool)

(assert (=> bs!28118 m!462751))

(assert (=> start!72836 d!106756))

(declare-fun d!106758 () Bool)

(declare-fun e!234036 () Bool)

(assert (=> d!106758 e!234036))

(declare-fun res!266454 () Bool)

(assert (=> d!106758 (=> (not res!266454) (not e!234036))))

(declare-fun lt!447133 () (_ BitVec 64))

(declare-fun lt!447137 () (_ BitVec 64))

(declare-fun lt!447136 () (_ BitVec 64))

(assert (=> d!106758 (= res!266454 (= lt!447133 (bvsub lt!447136 lt!447137)))))

(assert (=> d!106758 (or (= (bvand lt!447136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447137 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447136 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447136 lt!447137) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106758 (= lt!447137 (remainingBits!0 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) ((_ sign_extend 32) (currentByte!15202 thiss!877)) ((_ sign_extend 32) (currentBit!15197 thiss!877))))))

(declare-fun lt!447135 () (_ BitVec 64))

(declare-fun lt!447134 () (_ BitVec 64))

(assert (=> d!106758 (= lt!447136 (bvmul lt!447135 lt!447134))))

(assert (=> d!106758 (or (= lt!447135 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447134 (bvsdiv (bvmul lt!447135 lt!447134) lt!447135)))))

(assert (=> d!106758 (= lt!447134 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106758 (= lt!447135 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))))))

(assert (=> d!106758 (= lt!447133 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15202 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15197 thiss!877))))))

(assert (=> d!106758 (invariant!0 (currentBit!15197 thiss!877) (currentByte!15202 thiss!877) (size!9077 (buf!8219 thiss!877)))))

(assert (=> d!106758 (= (bitIndex!0 (size!9077 (buf!8219 thiss!877)) (currentByte!15202 thiss!877) (currentBit!15197 thiss!877)) lt!447133)))

(declare-fun b!324669 () Bool)

(declare-fun res!266455 () Bool)

(assert (=> b!324669 (=> (not res!266455) (not e!234036))))

(assert (=> b!324669 (= res!266455 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447133))))

(declare-fun b!324670 () Bool)

(declare-fun lt!447132 () (_ BitVec 64))

(assert (=> b!324670 (= e!234036 (bvsle lt!447133 (bvmul lt!447132 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324670 (or (= lt!447132 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447132 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447132)))))

(assert (=> b!324670 (= lt!447132 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))))))

(assert (= (and d!106758 res!266454) b!324669))

(assert (= (and b!324669 res!266455) b!324670))

(assert (=> d!106758 m!462731))

(assert (=> d!106758 m!462751))

(assert (=> b!324650 d!106758))

(declare-fun d!106766 () Bool)

(declare-fun e!234037 () Bool)

(assert (=> d!106766 e!234037))

(declare-fun res!266456 () Bool)

(assert (=> d!106766 (=> (not res!266456) (not e!234037))))

(declare-fun lt!447139 () (_ BitVec 64))

(declare-fun lt!447143 () (_ BitVec 64))

(declare-fun lt!447142 () (_ BitVec 64))

(assert (=> d!106766 (= res!266456 (= lt!447139 (bvsub lt!447142 lt!447143)))))

(assert (=> d!106766 (or (= (bvand lt!447142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!447143 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!447142 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!447142 lt!447143) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106766 (= lt!447143 (remainingBits!0 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))) ((_ sign_extend 32) (currentByte!15202 thiss!877)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877)))))))

(declare-fun lt!447141 () (_ BitVec 64))

(declare-fun lt!447140 () (_ BitVec 64))

(assert (=> d!106766 (= lt!447142 (bvmul lt!447141 lt!447140))))

(assert (=> d!106766 (or (= lt!447141 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!447140 (bvsdiv (bvmul lt!447141 lt!447140) lt!447141)))))

(assert (=> d!106766 (= lt!447140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106766 (= lt!447141 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))))))

(assert (=> d!106766 (= lt!447139 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15202 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877)))))))

(assert (=> d!106766 (invariant!0 (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877)) (currentByte!15202 thiss!877) (size!9077 (buf!8219 thiss!877)))))

(assert (=> d!106766 (= (bitIndex!0 (size!9077 (buf!8219 thiss!877)) (currentByte!15202 thiss!877) (bvadd #b00000000000000000000000000000001 (currentBit!15197 thiss!877))) lt!447139)))

(declare-fun b!324671 () Bool)

(declare-fun res!266457 () Bool)

(assert (=> b!324671 (=> (not res!266457) (not e!234037))))

(assert (=> b!324671 (= res!266457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!447139))))

(declare-fun b!324672 () Bool)

(declare-fun lt!447138 () (_ BitVec 64))

(assert (=> b!324672 (= e!234037 (bvsle lt!447139 (bvmul lt!447138 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324672 (or (= lt!447138 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!447138 #b0000000000000000000000000000000000000000000000000000000000001000) lt!447138)))))

(assert (=> b!324672 (= lt!447138 ((_ sign_extend 32) (size!9077 (buf!8219 thiss!877))))))

(assert (= (and d!106766 res!266456) b!324671))

(assert (= (and b!324671 res!266457) b!324672))

(declare-fun m!462755 () Bool)

(assert (=> d!106766 m!462755))

(declare-fun m!462757 () Bool)

(assert (=> d!106766 m!462757))

(assert (=> b!324650 d!106766))

(declare-fun d!106770 () Bool)

(assert (=> d!106770 (= (array_inv!8629 (buf!8219 thiss!877)) (bvsge (size!9077 (buf!8219 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!324652 d!106770))

(check-sat (not d!106756) (not d!106758) (not d!106766))
