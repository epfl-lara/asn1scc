; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69226 () Bool)

(assert start!69226)

(declare-fun b!311539 () Bool)

(declare-fun e!224002 () Bool)

(declare-datatypes ((array!19042 0))(
  ( (array!19043 (arr!9340 (Array (_ BitVec 32) (_ BitVec 8))) (size!8260 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13624 0))(
  ( (BitStream!13625 (buf!7873 array!19042) (currentByte!14519 (_ BitVec 32)) (currentBit!14514 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13624)

(declare-fun array_inv!7812 (array!19042) Bool)

(assert (=> b!311539 (= e!224002 (array_inv!7812 (buf!7873 b2!97)))))

(declare-fun b!311540 () Bool)

(declare-fun res!255218 () Bool)

(declare-fun e!224005 () Bool)

(assert (=> b!311540 (=> (not res!255218) (not e!224005))))

(declare-fun b1!97 () BitStream!13624)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311540 (= res!255218 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun res!255216 () Bool)

(assert (=> start!69226 (=> (not res!255216) (not e!224005))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(assert (=> start!69226 (= res!255216 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8260 (buf!7873 b1!97)) (size!8260 (buf!7873 b2!97)))))))

(assert (=> start!69226 e!224005))

(assert (=> start!69226 true))

(declare-fun e!224003 () Bool)

(declare-fun inv!12 (BitStream!13624) Bool)

(assert (=> start!69226 (and (inv!12 b1!97) e!224003)))

(assert (=> start!69226 (and (inv!12 b2!97) e!224002)))

(declare-fun b!311541 () Bool)

(declare-fun e!224001 () Bool)

(declare-fun e!224004 () Bool)

(assert (=> b!311541 (= e!224001 e!224004)))

(declare-fun res!255215 () Bool)

(assert (=> b!311541 (=> (not res!255215) (not e!224004))))

(declare-fun lt!441238 () (_ BitVec 64))

(declare-fun lt!441239 () (_ BitVec 64))

(declare-fun lt!441237 () (_ BitVec 64))

(assert (=> b!311541 (= res!255215 (and (bvsle lt!441238 (bvadd lt!441237 advancedAtMostBits!9)) (bvsge (bvsub lt!441239 lt!441238) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)) (bvsle ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14519 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14514 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14519 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14514 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!311541 (= lt!441238 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14519 b2!97))) ((_ sign_extend 32) (currentBit!14514 b2!97))))))

(declare-fun b!311542 () Bool)

(declare-fun res!255217 () Bool)

(assert (=> b!311542 (=> (not res!255217) (not e!224005))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311542 (= res!255217 (validate_offset_bits!1 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!311543 () Bool)

(assert (=> b!311543 (= e!224003 (array_inv!7812 (buf!7873 b1!97)))))

(declare-fun b!311544 () Bool)

(assert (=> b!311544 (= e!224005 e!224001)))

(declare-fun res!255219 () Bool)

(assert (=> b!311544 (=> (not res!255219) (not e!224001))))

(assert (=> b!311544 (= res!255219 (bvsge (bvsub lt!441239 lt!441237) b1ValidateOffsetBits!10))))

(assert (=> b!311544 (= lt!441237 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14519 b1!97))) ((_ sign_extend 32) (currentBit!14514 b1!97))))))

(assert (=> b!311544 (= lt!441239 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97)))))))

(declare-fun b!311545 () Bool)

(declare-fun res!255220 () Bool)

(assert (=> b!311545 (=> (not res!255220) (not e!224005))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311545 (= res!255220 (bvsle (bitIndex!0 (size!8260 (buf!7873 b2!97)) (currentByte!14519 b2!97) (currentBit!14514 b2!97)) (bvadd (bitIndex!0 (size!8260 (buf!7873 b1!97)) (currentByte!14519 b1!97) (currentBit!14514 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311546 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311546 (= e!224004 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14514 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14519 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8260 (buf!7873 b2!97)))))))))

(assert (= (and start!69226 res!255216) b!311542))

(assert (= (and b!311542 res!255217) b!311545))

(assert (= (and b!311545 res!255220) b!311540))

(assert (= (and b!311540 res!255218) b!311544))

(assert (= (and b!311544 res!255219) b!311541))

(assert (= (and b!311541 res!255215) b!311546))

(assert (= start!69226 b!311543))

(assert (= start!69226 b!311539))

(declare-fun m!449399 () Bool)

(assert (=> start!69226 m!449399))

(declare-fun m!449401 () Bool)

(assert (=> start!69226 m!449401))

(declare-fun m!449403 () Bool)

(assert (=> b!311543 m!449403))

(declare-fun m!449405 () Bool)

(assert (=> b!311540 m!449405))

(declare-fun m!449407 () Bool)

(assert (=> b!311546 m!449407))

(declare-fun m!449409 () Bool)

(assert (=> b!311542 m!449409))

(declare-fun m!449411 () Bool)

(assert (=> b!311545 m!449411))

(declare-fun m!449413 () Bool)

(assert (=> b!311545 m!449413))

(declare-fun m!449415 () Bool)

(assert (=> b!311539 m!449415))

(push 1)

(assert (not b!311540))

(assert (not b!311543))

(assert (not b!311546))

(assert (not b!311545))

(assert (not b!311539))

(assert (not start!69226))

(assert (not b!311542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103372 () Bool)

(assert (=> d!103372 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14514 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14519 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14514 b2!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14514 b2!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14519 b2!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14519 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14514 b2!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14519 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8260 (buf!7873 b2!97)))))))))))

(assert (=> b!311546 d!103372))

(declare-fun d!103374 () Bool)

(assert (=> d!103374 (= (remainingBits!0 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14519 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14514 b1!97)))))))

(assert (=> b!311540 d!103374))

(declare-fun d!103376 () Bool)

(assert (=> d!103376 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26753 () Bool)

(assert (= bs!26753 d!103376))

(assert (=> bs!26753 m!449405))

(assert (=> b!311542 d!103376))

(declare-fun d!103378 () Bool)

(assert (=> d!103378 (= (array_inv!7812 (buf!7873 b1!97)) (bvsge (size!8260 (buf!7873 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311543 d!103378))

(declare-fun d!103380 () Bool)

(declare-fun e!224055 () Bool)

(assert (=> d!103380 e!224055))

(declare-fun res!255269 () Bool)

(assert (=> d!103380 (=> (not res!255269) (not e!224055))))

(declare-fun lt!441297 () (_ BitVec 64))

(declare-fun lt!441294 () (_ BitVec 64))

(declare-fun lt!441299 () (_ BitVec 64))

(assert (=> d!103380 (= res!255269 (= lt!441294 (bvsub lt!441299 lt!441297)))))

(assert (=> d!103380 (or (= (bvand lt!441299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441297 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441299 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441299 lt!441297) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103380 (= lt!441297 (remainingBits!0 ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))) ((_ sign_extend 32) (currentByte!14519 b2!97)) ((_ sign_extend 32) (currentBit!14514 b2!97))))))

(declare-fun lt!441296 () (_ BitVec 64))

(declare-fun lt!441295 () (_ BitVec 64))

(assert (=> d!103380 (= lt!441299 (bvmul lt!441296 lt!441295))))

(assert (=> d!103380 (or (= lt!441296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441295 (bvsdiv (bvmul lt!441296 lt!441295) lt!441296)))))

(assert (=> d!103380 (= lt!441295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103380 (= lt!441296 ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))))))

(assert (=> d!103380 (= lt!441294 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14519 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14514 b2!97))))))

(assert (=> d!103380 (invariant!0 (currentBit!14514 b2!97) (currentByte!14519 b2!97) (size!8260 (buf!7873 b2!97)))))

(assert (=> d!103380 (= (bitIndex!0 (size!8260 (buf!7873 b2!97)) (currentByte!14519 b2!97) (currentBit!14514 b2!97)) lt!441294)))

(declare-fun b!311607 () Bool)

(declare-fun res!255270 () Bool)

(assert (=> b!311607 (=> (not res!255270) (not e!224055))))

(assert (=> b!311607 (= res!255270 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441294))))

(declare-fun b!311608 () Bool)

(declare-fun lt!441298 () (_ BitVec 64))

(assert (=> b!311608 (= e!224055 (bvsle lt!441294 (bvmul lt!441298 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311608 (or (= lt!441298 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441298 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441298)))))

(assert (=> b!311608 (= lt!441298 ((_ sign_extend 32) (size!8260 (buf!7873 b2!97))))))

(assert (= (and d!103380 res!255269) b!311607))

(assert (= (and b!311607 res!255270) b!311608))

(declare-fun m!449459 () Bool)

(assert (=> d!103380 m!449459))

(declare-fun m!449461 () Bool)

(assert (=> d!103380 m!449461))

(assert (=> b!311545 d!103380))

(declare-fun d!103382 () Bool)

(declare-fun e!224056 () Bool)

(assert (=> d!103382 e!224056))

(declare-fun res!255271 () Bool)

(assert (=> d!103382 (=> (not res!255271) (not e!224056))))

(declare-fun lt!441300 () (_ BitVec 64))

(declare-fun lt!441305 () (_ BitVec 64))

(declare-fun lt!441303 () (_ BitVec 64))

(assert (=> d!103382 (= res!255271 (= lt!441300 (bvsub lt!441305 lt!441303)))))

(assert (=> d!103382 (or (= (bvand lt!441305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441305 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441305 lt!441303) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103382 (= lt!441303 (remainingBits!0 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))) ((_ sign_extend 32) (currentByte!14519 b1!97)) ((_ sign_extend 32) (currentBit!14514 b1!97))))))

(declare-fun lt!441302 () (_ BitVec 64))

(declare-fun lt!441301 () (_ BitVec 64))

(assert (=> d!103382 (= lt!441305 (bvmul lt!441302 lt!441301))))

(assert (=> d!103382 (or (= lt!441302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441301 (bvsdiv (bvmul lt!441302 lt!441301) lt!441302)))))

(assert (=> d!103382 (= lt!441301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103382 (= lt!441302 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))))))

(assert (=> d!103382 (= lt!441300 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14519 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14514 b1!97))))))

(assert (=> d!103382 (invariant!0 (currentBit!14514 b1!97) (currentByte!14519 b1!97) (size!8260 (buf!7873 b1!97)))))

(assert (=> d!103382 (= (bitIndex!0 (size!8260 (buf!7873 b1!97)) (currentByte!14519 b1!97) (currentBit!14514 b1!97)) lt!441300)))

(declare-fun b!311609 () Bool)

(declare-fun res!255272 () Bool)

(assert (=> b!311609 (=> (not res!255272) (not e!224056))))

(assert (=> b!311609 (= res!255272 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441300))))

(declare-fun b!311610 () Bool)

(declare-fun lt!441304 () (_ BitVec 64))

(assert (=> b!311610 (= e!224056 (bvsle lt!441300 (bvmul lt!441304 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311610 (or (= lt!441304 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441304 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441304)))))

(assert (=> b!311610 (= lt!441304 ((_ sign_extend 32) (size!8260 (buf!7873 b1!97))))))

(assert (= (and d!103382 res!255271) b!311609))

(assert (= (and b!311609 res!255272) b!311610))

(assert (=> d!103382 m!449405))

(declare-fun m!449463 () Bool)

(assert (=> d!103382 m!449463))

(assert (=> b!311545 d!103382))

(declare-fun d!103384 () Bool)

(assert (=> d!103384 (= (inv!12 b1!97) (invariant!0 (currentBit!14514 b1!97) (currentByte!14519 b1!97) (size!8260 (buf!7873 b1!97))))))

(declare-fun bs!26754 () Bool)

(assert (= bs!26754 d!103384))

(assert (=> bs!26754 m!449463))

(assert (=> start!69226 d!103384))

(declare-fun d!103386 () Bool)

(assert (=> d!103386 (= (inv!12 b2!97) (invariant!0 (currentBit!14514 b2!97) (currentByte!14519 b2!97) (size!8260 (buf!7873 b2!97))))))

(declare-fun bs!26755 () Bool)

(assert (= bs!26755 d!103386))

(assert (=> bs!26755 m!449461))

(assert (=> start!69226 d!103386))

(declare-fun d!103388 () Bool)

(assert (=> d!103388 (= (array_inv!7812 (buf!7873 b2!97)) (bvsge (size!8260 (buf!7873 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311539 d!103388))

(push 1)

(assert (not d!103376))

(assert (not d!103384))

(assert (not d!103386))

(assert (not d!103380))

(assert (not d!103382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

