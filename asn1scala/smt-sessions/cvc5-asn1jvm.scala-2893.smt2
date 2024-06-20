; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69266 () Bool)

(assert start!69266)

(declare-fun res!255359 () Bool)

(declare-fun e!224141 () Bool)

(assert (=> start!69266 (=> (not res!255359) (not e!224141))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19057 0))(
  ( (array!19058 (arr!9346 (Array (_ BitVec 32) (_ BitVec 8))) (size!8266 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13636 0))(
  ( (BitStream!13637 (buf!7879 array!19057) (currentByte!14534 (_ BitVec 32)) (currentBit!14529 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13636)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13636)

(assert (=> start!69266 (= res!255359 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8266 (buf!7879 b1!97)) (size!8266 (buf!7879 b2!97)))))))

(assert (=> start!69266 e!224141))

(assert (=> start!69266 true))

(declare-fun e!224143 () Bool)

(declare-fun inv!12 (BitStream!13636) Bool)

(assert (=> start!69266 (and (inv!12 b1!97) e!224143)))

(declare-fun e!224138 () Bool)

(assert (=> start!69266 (and (inv!12 b2!97) e!224138)))

(declare-fun b!311716 () Bool)

(declare-fun res!255361 () Bool)

(declare-fun e!224137 () Bool)

(assert (=> b!311716 (=> (not res!255361) (not e!224137))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311716 (= res!255361 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) ((_ sign_extend 32) (currentByte!14534 b2!97)) ((_ sign_extend 32) (currentBit!14529 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!311717 () Bool)

(declare-fun array_inv!7818 (array!19057) Bool)

(assert (=> b!311717 (= e!224143 (array_inv!7818 (buf!7879 b1!97)))))

(declare-fun b!311718 () Bool)

(declare-fun e!224142 () Bool)

(assert (=> b!311718 (= e!224142 e!224137)))

(declare-fun res!255362 () Bool)

(assert (=> b!311718 (=> (not res!255362) (not e!224137))))

(declare-fun lt!441359 () (_ BitVec 64))

(declare-fun lt!441357 () (_ BitVec 64))

(declare-fun lt!441358 () (_ BitVec 64))

(assert (=> b!311718 (= res!255362 (and (bvsle lt!441359 (bvadd lt!441358 advancedAtMostBits!9)) (bvsge (bvsub lt!441357 lt!441359) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311718 (= lt!441359 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14534 b2!97))) ((_ sign_extend 32) (currentBit!14529 b2!97))))))

(declare-fun b!311719 () Bool)

(declare-fun res!255360 () Bool)

(assert (=> b!311719 (=> (not res!255360) (not e!224141))))

(assert (=> b!311719 (= res!255360 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311720 () Bool)

(assert (=> b!311720 (= e!224141 e!224142)))

(declare-fun res!255356 () Bool)

(assert (=> b!311720 (=> (not res!255356) (not e!224142))))

(assert (=> b!311720 (= res!255356 (bvsge (bvsub lt!441357 lt!441358) b1ValidateOffsetBits!10))))

(assert (=> b!311720 (= lt!441358 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14534 b1!97))) ((_ sign_extend 32) (currentBit!14529 b1!97))))))

(assert (=> b!311720 (= lt!441357 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97)))))))

(declare-fun b!311721 () Bool)

(declare-fun res!255358 () Bool)

(assert (=> b!311721 (=> (not res!255358) (not e!224141))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311721 (= res!255358 (bvsle (bitIndex!0 (size!8266 (buf!7879 b2!97)) (currentByte!14534 b2!97) (currentBit!14529 b2!97)) (bvadd (bitIndex!0 (size!8266 (buf!7879 b1!97)) (currentByte!14534 b1!97) (currentBit!14529 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311722 () Bool)

(assert (=> b!311722 (= e!224138 (array_inv!7818 (buf!7879 b2!97)))))

(declare-fun b!311723 () Bool)

(assert (=> b!311723 (= e!224137 (and (bvsle ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14534 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14529 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!14534 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!14529 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!311724 () Bool)

(declare-fun res!255357 () Bool)

(assert (=> b!311724 (=> (not res!255357) (not e!224141))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311724 (= res!255357 (validate_offset_bits!1 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97)) b1ValidateOffsetBits!10))))

(assert (= (and start!69266 res!255359) b!311724))

(assert (= (and b!311724 res!255357) b!311721))

(assert (= (and b!311721 res!255358) b!311719))

(assert (= (and b!311719 res!255360) b!311720))

(assert (= (and b!311720 res!255356) b!311718))

(assert (= (and b!311718 res!255362) b!311716))

(assert (= (and b!311716 res!255361) b!311723))

(assert (= start!69266 b!311717))

(assert (= start!69266 b!311722))

(declare-fun m!449519 () Bool)

(assert (=> b!311724 m!449519))

(declare-fun m!449521 () Bool)

(assert (=> b!311716 m!449521))

(declare-fun m!449523 () Bool)

(assert (=> b!311719 m!449523))

(declare-fun m!449525 () Bool)

(assert (=> b!311722 m!449525))

(declare-fun m!449527 () Bool)

(assert (=> b!311717 m!449527))

(declare-fun m!449529 () Bool)

(assert (=> b!311721 m!449529))

(declare-fun m!449531 () Bool)

(assert (=> b!311721 m!449531))

(declare-fun m!449533 () Bool)

(assert (=> start!69266 m!449533))

(declare-fun m!449535 () Bool)

(assert (=> start!69266 m!449535))

(push 1)

(assert (not b!311717))

(assert (not b!311722))

(assert (not start!69266))

(assert (not b!311716))

(assert (not b!311721))

(assert (not b!311719))

(assert (not b!311724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103428 () Bool)

(assert (=> d!103428 (= (array_inv!7818 (buf!7879 b1!97)) (bvsge (size!8266 (buf!7879 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311717 d!103428))

(declare-fun d!103432 () Bool)

(assert (=> d!103432 (= (array_inv!7818 (buf!7879 b2!97)) (bvsge (size!8266 (buf!7879 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311722 d!103432))

(declare-fun d!103434 () Bool)

(assert (=> d!103434 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26768 () Bool)

(assert (= bs!26768 d!103434))

(assert (=> bs!26768 m!449523))

(assert (=> b!311724 d!103434))

(declare-fun d!103440 () Bool)

(assert (=> d!103440 (= (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14534 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14529 b1!97)))))))

(assert (=> b!311719 d!103440))

(declare-fun d!103442 () Bool)

(declare-fun e!224196 () Bool)

(assert (=> d!103442 e!224196))

(declare-fun res!255425 () Bool)

(assert (=> d!103442 (=> (not res!255425) (not e!224196))))

(declare-fun lt!441438 () (_ BitVec 64))

(declare-fun lt!441439 () (_ BitVec 64))

(declare-fun lt!441441 () (_ BitVec 64))

(assert (=> d!103442 (= res!255425 (= lt!441438 (bvsub lt!441441 lt!441439)))))

(assert (=> d!103442 (or (= (bvand lt!441441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441439 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441441 lt!441439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103442 (= lt!441439 (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) ((_ sign_extend 32) (currentByte!14534 b2!97)) ((_ sign_extend 32) (currentBit!14529 b2!97))))))

(declare-fun lt!441443 () (_ BitVec 64))

(declare-fun lt!441440 () (_ BitVec 64))

(assert (=> d!103442 (= lt!441441 (bvmul lt!441443 lt!441440))))

(assert (=> d!103442 (or (= lt!441443 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441440 (bvsdiv (bvmul lt!441443 lt!441440) lt!441443)))))

(assert (=> d!103442 (= lt!441440 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103442 (= lt!441443 ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))))))

(assert (=> d!103442 (= lt!441438 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14534 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14529 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103442 (invariant!0 (currentBit!14529 b2!97) (currentByte!14534 b2!97) (size!8266 (buf!7879 b2!97)))))

(assert (=> d!103442 (= (bitIndex!0 (size!8266 (buf!7879 b2!97)) (currentByte!14534 b2!97) (currentBit!14529 b2!97)) lt!441438)))

(declare-fun b!311799 () Bool)

(declare-fun res!255426 () Bool)

(assert (=> b!311799 (=> (not res!255426) (not e!224196))))

(assert (=> b!311799 (= res!255426 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441438))))

(declare-fun b!311800 () Bool)

(declare-fun lt!441442 () (_ BitVec 64))

(assert (=> b!311800 (= e!224196 (bvsle lt!441438 (bvmul lt!441442 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311800 (or (= lt!441442 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441442 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441442)))))

(assert (=> b!311800 (= lt!441442 ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))))))

(assert (= (and d!103442 res!255425) b!311799))

(assert (= (and b!311799 res!255426) b!311800))

(assert (=> d!103442 m!449521))

(declare-fun m!449581 () Bool)

(assert (=> d!103442 m!449581))

(assert (=> b!311721 d!103442))

(declare-fun d!103444 () Bool)

(declare-fun e!224197 () Bool)

(assert (=> d!103444 e!224197))

(declare-fun res!255427 () Bool)

(assert (=> d!103444 (=> (not res!255427) (not e!224197))))

(declare-fun lt!441444 () (_ BitVec 64))

(declare-fun lt!441445 () (_ BitVec 64))

(declare-fun lt!441447 () (_ BitVec 64))

(assert (=> d!103444 (= res!255427 (= lt!441444 (bvsub lt!441447 lt!441445)))))

(assert (=> d!103444 (or (= (bvand lt!441447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441445 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441447 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441447 lt!441445) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103444 (= lt!441445 (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))) ((_ sign_extend 32) (currentByte!14534 b1!97)) ((_ sign_extend 32) (currentBit!14529 b1!97))))))

(declare-fun lt!441449 () (_ BitVec 64))

(declare-fun lt!441446 () (_ BitVec 64))

(assert (=> d!103444 (= lt!441447 (bvmul lt!441449 lt!441446))))

(assert (=> d!103444 (or (= lt!441449 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441446 (bvsdiv (bvmul lt!441449 lt!441446) lt!441449)))))

(assert (=> d!103444 (= lt!441446 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103444 (= lt!441449 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))))))

(assert (=> d!103444 (= lt!441444 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14534 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14529 b1!97))))))

(assert (=> d!103444 (invariant!0 (currentBit!14529 b1!97) (currentByte!14534 b1!97) (size!8266 (buf!7879 b1!97)))))

(assert (=> d!103444 (= (bitIndex!0 (size!8266 (buf!7879 b1!97)) (currentByte!14534 b1!97) (currentBit!14529 b1!97)) lt!441444)))

(declare-fun b!311801 () Bool)

(declare-fun res!255428 () Bool)

(assert (=> b!311801 (=> (not res!255428) (not e!224197))))

(assert (=> b!311801 (= res!255428 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441444))))

(declare-fun b!311802 () Bool)

(declare-fun lt!441448 () (_ BitVec 64))

(assert (=> b!311802 (= e!224197 (bvsle lt!441444 (bvmul lt!441448 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311802 (or (= lt!441448 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441448 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441448)))))

(assert (=> b!311802 (= lt!441448 ((_ sign_extend 32) (size!8266 (buf!7879 b1!97))))))

(assert (= (and d!103444 res!255427) b!311801))

(assert (= (and b!311801 res!255428) b!311802))

(assert (=> d!103444 m!449523))

(declare-fun m!449583 () Bool)

(assert (=> d!103444 m!449583))

(assert (=> b!311721 d!103444))

(declare-fun d!103446 () Bool)

(assert (=> d!103446 (= (remainingBits!0 ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) ((_ sign_extend 32) (currentByte!14534 b2!97)) ((_ sign_extend 32) (currentBit!14529 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8266 (buf!7879 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14534 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14529 b2!97)))))))

(assert (=> b!311716 d!103446))

(declare-fun d!103448 () Bool)

(assert (=> d!103448 (= (inv!12 b1!97) (invariant!0 (currentBit!14529 b1!97) (currentByte!14534 b1!97) (size!8266 (buf!7879 b1!97))))))

(declare-fun bs!26769 () Bool)

(assert (= bs!26769 d!103448))

(assert (=> bs!26769 m!449583))

(assert (=> start!69266 d!103448))

(declare-fun d!103450 () Bool)

(assert (=> d!103450 (= (inv!12 b2!97) (invariant!0 (currentBit!14529 b2!97) (currentByte!14534 b2!97) (size!8266 (buf!7879 b2!97))))))

(declare-fun bs!26770 () Bool)

(assert (= bs!26770 d!103450))

(assert (=> bs!26770 m!449581))

(assert (=> start!69266 d!103450))

(push 1)

(assert (not d!103444))

(assert (not d!103450))

(assert (not d!103448))

(assert (not d!103434))

(assert (not d!103442))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103452 () Bool)

(assert (=> d!103452 (= (invariant!0 (currentBit!14529 b2!97) (currentByte!14534 b2!97) (size!8266 (buf!7879 b2!97))) (and (bvsge (currentBit!14529 b2!97) #b00000000000000000000000000000000) (bvslt (currentBit!14529 b2!97) #b00000000000000000000000000001000) (bvsge (currentByte!14534 b2!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14534 b2!97) (size!8266 (buf!7879 b2!97))) (and (= (currentBit!14529 b2!97) #b00000000000000000000000000000000) (= (currentByte!14534 b2!97) (size!8266 (buf!7879 b2!97)))))))))

(assert (=> d!103450 d!103452))

(assert (=> d!103442 d!103446))

(assert (=> d!103442 d!103452))

(declare-fun d!103454 () Bool)

(assert (=> d!103454 (= (invariant!0 (currentBit!14529 b1!97) (currentByte!14534 b1!97) (size!8266 (buf!7879 b1!97))) (and (bvsge (currentBit!14529 b1!97) #b00000000000000000000000000000000) (bvslt (currentBit!14529 b1!97) #b00000000000000000000000000001000) (bvsge (currentByte!14534 b1!97) #b00000000000000000000000000000000) (or (bvslt (currentByte!14534 b1!97) (size!8266 (buf!7879 b1!97))) (and (= (currentBit!14529 b1!97) #b00000000000000000000000000000000) (= (currentByte!14534 b1!97) (size!8266 (buf!7879 b1!97)))))))))

(assert (=> d!103448 d!103454))

(assert (=> d!103434 d!103440))

(assert (=> d!103444 d!103440))

(assert (=> d!103444 d!103454))

(push 1)

(check-sat)

(pop 1)

