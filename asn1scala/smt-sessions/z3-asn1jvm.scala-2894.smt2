; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69306 () Bool)

(assert start!69306)

(declare-fun res!255472 () Bool)

(declare-fun e!224239 () Bool)

(assert (=> start!69306 (=> (not res!255472) (not e!224239))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19068 0))(
  ( (array!19069 (arr!9350 (Array (_ BitVec 32) (_ BitVec 8))) (size!8270 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13644 0))(
  ( (BitStream!13645 (buf!7883 array!19068) (currentByte!14548 (_ BitVec 32)) (currentBit!14543 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13644)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13644)

(assert (=> start!69306 (= res!255472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8270 (buf!7883 b1!97)) (size!8270 (buf!7883 b2!97)))))))

(assert (=> start!69306 e!224239))

(assert (=> start!69306 true))

(declare-fun e!224234 () Bool)

(declare-fun inv!12 (BitStream!13644) Bool)

(assert (=> start!69306 (and (inv!12 b1!97) e!224234)))

(declare-fun e!224233 () Bool)

(assert (=> start!69306 (and (inv!12 b2!97) e!224233)))

(declare-fun b!311853 () Bool)

(declare-fun array_inv!7822 (array!19068) Bool)

(assert (=> b!311853 (= e!224233 (array_inv!7822 (buf!7883 b2!97)))))

(declare-fun b!311854 () Bool)

(declare-fun res!255475 () Bool)

(assert (=> b!311854 (=> (not res!255475) (not e!224239))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311854 (= res!255475 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311855 () Bool)

(declare-fun res!255474 () Bool)

(declare-fun e!224238 () Bool)

(assert (=> b!311855 (=> (not res!255474) (not e!224238))))

(assert (=> b!311855 (= res!255474 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) ((_ sign_extend 32) (currentByte!14548 b2!97)) ((_ sign_extend 32) (currentBit!14543 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311856 () Bool)

(declare-fun res!255473 () Bool)

(assert (=> b!311856 (=> (not res!255473) (not e!224239))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311856 (= res!255473 (bvsle (bitIndex!0 (size!8270 (buf!7883 b2!97)) (currentByte!14548 b2!97) (currentBit!14543 b2!97)) (bvadd (bitIndex!0 (size!8270 (buf!7883 b1!97)) (currentByte!14548 b1!97) (currentBit!14543 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311857 () Bool)

(declare-fun e!224236 () Bool)

(assert (=> b!311857 (= e!224236 e!224238)))

(declare-fun res!255470 () Bool)

(assert (=> b!311857 (=> (not res!255470) (not e!224238))))

(declare-fun lt!441466 () (_ BitVec 64))

(declare-fun lt!441465 () (_ BitVec 64))

(declare-fun lt!441467 () (_ BitVec 64))

(assert (=> b!311857 (= res!255470 (and (bvsle lt!441466 (bvadd lt!441467 advancedAtMostBits!9)) (bvsge (bvsub lt!441465 lt!441466) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311857 (= lt!441466 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14548 b2!97))) ((_ sign_extend 32) (currentBit!14543 b2!97))))))

(declare-fun b!311858 () Bool)

(assert (=> b!311858 (= e!224234 (array_inv!7822 (buf!7883 b1!97)))))

(declare-fun b!311859 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311859 (= e!224238 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14543 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14548 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8270 (buf!7883 b2!97)))))))))

(declare-fun b!311860 () Bool)

(declare-fun res!255471 () Bool)

(assert (=> b!311860 (=> (not res!255471) (not e!224239))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311860 (= res!255471 (validate_offset_bits!1 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311861 () Bool)

(assert (=> b!311861 (= e!224239 e!224236)))

(declare-fun res!255476 () Bool)

(assert (=> b!311861 (=> (not res!255476) (not e!224236))))

(assert (=> b!311861 (= res!255476 (bvsge (bvsub lt!441465 lt!441467) b1ValidateOffsetBits!10))))

(assert (=> b!311861 (= lt!441467 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14548 b1!97))) ((_ sign_extend 32) (currentBit!14543 b1!97))))))

(assert (=> b!311861 (= lt!441465 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97)))))))

(declare-fun b!311862 () Bool)

(declare-fun res!255469 () Bool)

(assert (=> b!311862 (=> (not res!255469) (not e!224238))))

(assert (=> b!311862 (= res!255469 (and (bvsle ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14548 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14543 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14548 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14543 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!69306 res!255472) b!311860))

(assert (= (and b!311860 res!255471) b!311856))

(assert (= (and b!311856 res!255473) b!311854))

(assert (= (and b!311854 res!255475) b!311861))

(assert (= (and b!311861 res!255476) b!311857))

(assert (= (and b!311857 res!255470) b!311855))

(assert (= (and b!311855 res!255474) b!311862))

(assert (= (and b!311862 res!255469) b!311859))

(assert (= start!69306 b!311858))

(assert (= start!69306 b!311853))

(declare-fun m!449605 () Bool)

(assert (=> b!311856 m!449605))

(declare-fun m!449607 () Bool)

(assert (=> b!311856 m!449607))

(declare-fun m!449609 () Bool)

(assert (=> b!311860 m!449609))

(declare-fun m!449611 () Bool)

(assert (=> start!69306 m!449611))

(declare-fun m!449613 () Bool)

(assert (=> start!69306 m!449613))

(declare-fun m!449615 () Bool)

(assert (=> b!311855 m!449615))

(declare-fun m!449617 () Bool)

(assert (=> b!311853 m!449617))

(declare-fun m!449619 () Bool)

(assert (=> b!311854 m!449619))

(declare-fun m!449621 () Bool)

(assert (=> b!311858 m!449621))

(declare-fun m!449623 () Bool)

(assert (=> b!311859 m!449623))

(check-sat (not b!311859) (not b!311854) (not b!311858) (not start!69306) (not b!311860) (not b!311853) (not b!311856) (not b!311855))
(check-sat)
(get-model)

(declare-fun d!103458 () Bool)

(assert (=> d!103458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26774 () Bool)

(assert (= bs!26774 d!103458))

(assert (=> bs!26774 m!449619))

(assert (=> b!311860 d!103458))

(declare-fun d!103460 () Bool)

(assert (=> d!103460 (= (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) ((_ sign_extend 32) (currentByte!14548 b2!97)) ((_ sign_extend 32) (currentBit!14543 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14548 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14543 b2!97)))))))

(assert (=> b!311855 d!103460))

(declare-fun d!103462 () Bool)

(declare-fun e!224263 () Bool)

(assert (=> d!103462 e!224263))

(declare-fun res!255505 () Bool)

(assert (=> d!103462 (=> (not res!255505) (not e!224263))))

(declare-fun lt!441490 () (_ BitVec 64))

(declare-fun lt!441491 () (_ BitVec 64))

(declare-fun lt!441489 () (_ BitVec 64))

(assert (=> d!103462 (= res!255505 (= lt!441491 (bvsub lt!441490 lt!441489)))))

(assert (=> d!103462 (or (= (bvand lt!441490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441490 lt!441489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103462 (= lt!441489 (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))) ((_ sign_extend 32) (currentByte!14548 b2!97)) ((_ sign_extend 32) (currentBit!14543 b2!97))))))

(declare-fun lt!441492 () (_ BitVec 64))

(declare-fun lt!441493 () (_ BitVec 64))

(assert (=> d!103462 (= lt!441490 (bvmul lt!441492 lt!441493))))

(assert (=> d!103462 (or (= lt!441492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441493 (bvsdiv (bvmul lt!441492 lt!441493) lt!441492)))))

(assert (=> d!103462 (= lt!441493 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103462 (= lt!441492 ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))))))

(assert (=> d!103462 (= lt!441491 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14548 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14543 b2!97))))))

(assert (=> d!103462 (invariant!0 (currentBit!14543 b2!97) (currentByte!14548 b2!97) (size!8270 (buf!7883 b2!97)))))

(assert (=> d!103462 (= (bitIndex!0 (size!8270 (buf!7883 b2!97)) (currentByte!14548 b2!97) (currentBit!14543 b2!97)) lt!441491)))

(declare-fun b!311897 () Bool)

(declare-fun res!255506 () Bool)

(assert (=> b!311897 (=> (not res!255506) (not e!224263))))

(assert (=> b!311897 (= res!255506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441491))))

(declare-fun b!311898 () Bool)

(declare-fun lt!441494 () (_ BitVec 64))

(assert (=> b!311898 (= e!224263 (bvsle lt!441491 (bvmul lt!441494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311898 (or (= lt!441494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441494)))))

(assert (=> b!311898 (= lt!441494 ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))))))

(assert (= (and d!103462 res!255505) b!311897))

(assert (= (and b!311897 res!255506) b!311898))

(assert (=> d!103462 m!449615))

(declare-fun m!449645 () Bool)

(assert (=> d!103462 m!449645))

(assert (=> b!311856 d!103462))

(declare-fun d!103464 () Bool)

(declare-fun e!224264 () Bool)

(assert (=> d!103464 e!224264))

(declare-fun res!255507 () Bool)

(assert (=> d!103464 (=> (not res!255507) (not e!224264))))

(declare-fun lt!441495 () (_ BitVec 64))

(declare-fun lt!441496 () (_ BitVec 64))

(declare-fun lt!441497 () (_ BitVec 64))

(assert (=> d!103464 (= res!255507 (= lt!441497 (bvsub lt!441496 lt!441495)))))

(assert (=> d!103464 (or (= (bvand lt!441496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441496 lt!441495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103464 (= lt!441495 (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97))))))

(declare-fun lt!441498 () (_ BitVec 64))

(declare-fun lt!441499 () (_ BitVec 64))

(assert (=> d!103464 (= lt!441496 (bvmul lt!441498 lt!441499))))

(assert (=> d!103464 (or (= lt!441498 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441499 (bvsdiv (bvmul lt!441498 lt!441499) lt!441498)))))

(assert (=> d!103464 (= lt!441499 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103464 (= lt!441498 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))))))

(assert (=> d!103464 (= lt!441497 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14548 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14543 b1!97))))))

(assert (=> d!103464 (invariant!0 (currentBit!14543 b1!97) (currentByte!14548 b1!97) (size!8270 (buf!7883 b1!97)))))

(assert (=> d!103464 (= (bitIndex!0 (size!8270 (buf!7883 b1!97)) (currentByte!14548 b1!97) (currentBit!14543 b1!97)) lt!441497)))

(declare-fun b!311899 () Bool)

(declare-fun res!255508 () Bool)

(assert (=> b!311899 (=> (not res!255508) (not e!224264))))

(assert (=> b!311899 (= res!255508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441497))))

(declare-fun b!311900 () Bool)

(declare-fun lt!441500 () (_ BitVec 64))

(assert (=> b!311900 (= e!224264 (bvsle lt!441497 (bvmul lt!441500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311900 (or (= lt!441500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441500)))))

(assert (=> b!311900 (= lt!441500 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))))))

(assert (= (and d!103464 res!255507) b!311899))

(assert (= (and b!311899 res!255508) b!311900))

(assert (=> d!103464 m!449619))

(declare-fun m!449647 () Bool)

(assert (=> d!103464 m!449647))

(assert (=> b!311856 d!103464))

(declare-fun d!103466 () Bool)

(assert (=> d!103466 (= (array_inv!7822 (buf!7883 b1!97)) (bvsge (size!8270 (buf!7883 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311858 d!103466))

(declare-fun d!103468 () Bool)

(assert (=> d!103468 (= (inv!12 b1!97) (invariant!0 (currentBit!14543 b1!97) (currentByte!14548 b1!97) (size!8270 (buf!7883 b1!97))))))

(declare-fun bs!26775 () Bool)

(assert (= bs!26775 d!103468))

(assert (=> bs!26775 m!449647))

(assert (=> start!69306 d!103468))

(declare-fun d!103470 () Bool)

(assert (=> d!103470 (= (inv!12 b2!97) (invariant!0 (currentBit!14543 b2!97) (currentByte!14548 b2!97) (size!8270 (buf!7883 b2!97))))))

(declare-fun bs!26776 () Bool)

(assert (= bs!26776 d!103470))

(assert (=> bs!26776 m!449645))

(assert (=> start!69306 d!103470))

(declare-fun d!103472 () Bool)

(assert (=> d!103472 (= (array_inv!7822 (buf!7883 b2!97)) (bvsge (size!8270 (buf!7883 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311853 d!103472))

(declare-fun d!103474 () Bool)

(assert (=> d!103474 (= (remainingBits!0 ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) ((_ sign_extend 32) (currentByte!14548 b1!97)) ((_ sign_extend 32) (currentBit!14543 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8270 (buf!7883 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14548 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14543 b1!97)))))))

(assert (=> b!311854 d!103474))

(declare-fun d!103476 () Bool)

(assert (=> d!103476 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14543 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14548 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14543 b2!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14543 b2!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14548 b2!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14548 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8270 (buf!7883 b2!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14543 b2!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14548 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8270 (buf!7883 b2!97)))))))))))

(assert (=> b!311859 d!103476))

(check-sat (not d!103458) (not d!103464) (not d!103468) (not d!103470) (not d!103462))
