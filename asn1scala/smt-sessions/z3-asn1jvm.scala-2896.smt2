; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69354 () Bool)

(assert start!69354)

(declare-fun b!311978 () Bool)

(declare-fun res!255558 () Bool)

(declare-fun e!224346 () Bool)

(assert (=> b!311978 (=> (not res!255558) (not e!224346))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19083 0))(
  ( (array!19084 (arr!9356 (Array (_ BitVec 32) (_ BitVec 8))) (size!8276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13656 0))(
  ( (BitStream!13657 (buf!7889 array!19083) (currentByte!14566 (_ BitVec 32)) (currentBit!14561 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13656)

(declare-fun b2!97 () BitStream!13656)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311978 (= res!255558 (bvsle (bitIndex!0 (size!8276 (buf!7889 b2!97)) (currentByte!14566 b2!97) (currentBit!14561 b2!97)) (bvadd (bitIndex!0 (size!8276 (buf!7889 b1!97)) (currentByte!14566 b1!97) (currentBit!14561 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311979 () Bool)

(declare-fun e!224343 () Bool)

(declare-fun array_inv!7828 (array!19083) Bool)

(assert (=> b!311979 (= e!224343 (array_inv!7828 (buf!7889 b1!97)))))

(declare-fun b!311980 () Bool)

(declare-fun res!255560 () Bool)

(assert (=> b!311980 (=> (not res!255560) (not e!224346))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311980 (= res!255560 (validate_offset_bits!1 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))) ((_ sign_extend 32) (currentByte!14566 b1!97)) ((_ sign_extend 32) (currentBit!14561 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255559 () Bool)

(assert (=> start!69354 (=> (not res!255559) (not e!224346))))

(assert (=> start!69354 (= res!255559 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8276 (buf!7889 b1!97)) (size!8276 (buf!7889 b2!97)))))))

(assert (=> start!69354 e!224346))

(assert (=> start!69354 true))

(declare-fun inv!12 (BitStream!13656) Bool)

(assert (=> start!69354 (and (inv!12 b1!97) e!224343)))

(declare-fun e!224345 () Bool)

(assert (=> start!69354 (and (inv!12 b2!97) e!224345)))

(declare-fun b!311981 () Bool)

(assert (=> b!311981 (= e!224345 (array_inv!7828 (buf!7889 b2!97)))))

(declare-fun b!311982 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311982 (= e!224346 (bvslt (remainingBits!0 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))) ((_ sign_extend 32) (currentByte!14566 b1!97)) ((_ sign_extend 32) (currentBit!14561 b1!97))) b1ValidateOffsetBits!10))))

(assert (= (and start!69354 res!255559) b!311980))

(assert (= (and b!311980 res!255560) b!311978))

(assert (= (and b!311978 res!255558) b!311982))

(assert (= start!69354 b!311979))

(assert (= start!69354 b!311981))

(declare-fun m!449715 () Bool)

(assert (=> start!69354 m!449715))

(declare-fun m!449717 () Bool)

(assert (=> start!69354 m!449717))

(declare-fun m!449719 () Bool)

(assert (=> b!311981 m!449719))

(declare-fun m!449721 () Bool)

(assert (=> b!311978 m!449721))

(declare-fun m!449723 () Bool)

(assert (=> b!311978 m!449723))

(declare-fun m!449725 () Bool)

(assert (=> b!311979 m!449725))

(declare-fun m!449727 () Bool)

(assert (=> b!311982 m!449727))

(declare-fun m!449729 () Bool)

(assert (=> b!311980 m!449729))

(check-sat (not start!69354) (not b!311978) (not b!311979) (not b!311981) (not b!311980) (not b!311982))
(check-sat)
(get-model)

(declare-fun d!103524 () Bool)

(declare-fun e!224373 () Bool)

(assert (=> d!103524 e!224373))

(declare-fun res!255591 () Bool)

(assert (=> d!103524 (=> (not res!255591) (not e!224373))))

(declare-fun lt!441627 () (_ BitVec 64))

(declare-fun lt!441632 () (_ BitVec 64))

(declare-fun lt!441628 () (_ BitVec 64))

(assert (=> d!103524 (= res!255591 (= lt!441627 (bvsub lt!441632 lt!441628)))))

(assert (=> d!103524 (or (= (bvand lt!441632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441632 lt!441628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103524 (= lt!441628 (remainingBits!0 ((_ sign_extend 32) (size!8276 (buf!7889 b2!97))) ((_ sign_extend 32) (currentByte!14566 b2!97)) ((_ sign_extend 32) (currentBit!14561 b2!97))))))

(declare-fun lt!441631 () (_ BitVec 64))

(declare-fun lt!441629 () (_ BitVec 64))

(assert (=> d!103524 (= lt!441632 (bvmul lt!441631 lt!441629))))

(assert (=> d!103524 (or (= lt!441631 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441629 (bvsdiv (bvmul lt!441631 lt!441629) lt!441631)))))

(assert (=> d!103524 (= lt!441629 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103524 (= lt!441631 ((_ sign_extend 32) (size!8276 (buf!7889 b2!97))))))

(assert (=> d!103524 (= lt!441627 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14566 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14561 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103524 (invariant!0 (currentBit!14561 b2!97) (currentByte!14566 b2!97) (size!8276 (buf!7889 b2!97)))))

(assert (=> d!103524 (= (bitIndex!0 (size!8276 (buf!7889 b2!97)) (currentByte!14566 b2!97) (currentBit!14561 b2!97)) lt!441627)))

(declare-fun b!312018 () Bool)

(declare-fun res!255590 () Bool)

(assert (=> b!312018 (=> (not res!255590) (not e!224373))))

(assert (=> b!312018 (= res!255590 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441627))))

(declare-fun b!312019 () Bool)

(declare-fun lt!441630 () (_ BitVec 64))

(assert (=> b!312019 (= e!224373 (bvsle lt!441627 (bvmul lt!441630 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312019 (or (= lt!441630 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441630 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441630)))))

(assert (=> b!312019 (= lt!441630 ((_ sign_extend 32) (size!8276 (buf!7889 b2!97))))))

(assert (= (and d!103524 res!255591) b!312018))

(assert (= (and b!312018 res!255590) b!312019))

(declare-fun m!449759 () Bool)

(assert (=> d!103524 m!449759))

(declare-fun m!449761 () Bool)

(assert (=> d!103524 m!449761))

(assert (=> b!311978 d!103524))

(declare-fun d!103556 () Bool)

(declare-fun e!224374 () Bool)

(assert (=> d!103556 e!224374))

(declare-fun res!255593 () Bool)

(assert (=> d!103556 (=> (not res!255593) (not e!224374))))

(declare-fun lt!441634 () (_ BitVec 64))

(declare-fun lt!441638 () (_ BitVec 64))

(declare-fun lt!441633 () (_ BitVec 64))

(assert (=> d!103556 (= res!255593 (= lt!441633 (bvsub lt!441638 lt!441634)))))

(assert (=> d!103556 (or (= (bvand lt!441638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441638 lt!441634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103556 (= lt!441634 (remainingBits!0 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))) ((_ sign_extend 32) (currentByte!14566 b1!97)) ((_ sign_extend 32) (currentBit!14561 b1!97))))))

(declare-fun lt!441637 () (_ BitVec 64))

(declare-fun lt!441635 () (_ BitVec 64))

(assert (=> d!103556 (= lt!441638 (bvmul lt!441637 lt!441635))))

(assert (=> d!103556 (or (= lt!441637 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441635 (bvsdiv (bvmul lt!441637 lt!441635) lt!441637)))))

(assert (=> d!103556 (= lt!441635 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103556 (= lt!441637 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))))))

(assert (=> d!103556 (= lt!441633 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14566 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14561 b1!97))))))

(assert (=> d!103556 (invariant!0 (currentBit!14561 b1!97) (currentByte!14566 b1!97) (size!8276 (buf!7889 b1!97)))))

(assert (=> d!103556 (= (bitIndex!0 (size!8276 (buf!7889 b1!97)) (currentByte!14566 b1!97) (currentBit!14561 b1!97)) lt!441633)))

(declare-fun b!312020 () Bool)

(declare-fun res!255592 () Bool)

(assert (=> b!312020 (=> (not res!255592) (not e!224374))))

(assert (=> b!312020 (= res!255592 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441633))))

(declare-fun b!312021 () Bool)

(declare-fun lt!441636 () (_ BitVec 64))

(assert (=> b!312021 (= e!224374 (bvsle lt!441633 (bvmul lt!441636 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312021 (or (= lt!441636 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441636 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441636)))))

(assert (=> b!312021 (= lt!441636 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))))))

(assert (= (and d!103556 res!255593) b!312020))

(assert (= (and b!312020 res!255592) b!312021))

(assert (=> d!103556 m!449727))

(declare-fun m!449763 () Bool)

(assert (=> d!103556 m!449763))

(assert (=> b!311978 d!103556))

(declare-fun d!103558 () Bool)

(assert (=> d!103558 (= (array_inv!7828 (buf!7889 b1!97)) (bvsge (size!8276 (buf!7889 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311979 d!103558))

(declare-fun d!103560 () Bool)

(assert (=> d!103560 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))) ((_ sign_extend 32) (currentByte!14566 b1!97)) ((_ sign_extend 32) (currentBit!14561 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8276 (buf!7889 b1!97))) ((_ sign_extend 32) (currentByte!14566 b1!97)) ((_ sign_extend 32) (currentBit!14561 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26795 () Bool)

