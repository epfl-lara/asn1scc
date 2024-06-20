; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16926 () Bool)

(assert start!16926)

(declare-fun b!83085 () Bool)

(declare-fun e!55126 () Bool)

(declare-fun e!55123 () Bool)

(assert (=> b!83085 (= e!55126 e!55123)))

(declare-fun res!68386 () Bool)

(assert (=> b!83085 (=> (not res!68386) (not e!55123))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!132381 () (_ BitVec 64))

(declare-datatypes ((array!3790 0))(
  ( (array!3791 (arr!2365 (Array (_ BitVec 32) (_ BitVec 8))) (size!1728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3018 0))(
  ( (BitStream!3019 (buf!2118 array!3790) (currentByte!4188 (_ BitVec 32)) (currentBit!4183 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3018)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83085 (= res!68386 (= (bvadd lt!132381 b1b2Diff!1) (bitIndex!0 (size!1728 (buf!2118 b2!98)) (currentByte!4188 b2!98) (currentBit!4183 b2!98))))))

(declare-fun b1!98 () BitStream!3018)

(assert (=> b!83085 (= lt!132381 (bitIndex!0 (size!1728 (buf!2118 b1!98)) (currentByte!4188 b1!98) (currentBit!4183 b1!98)))))

(declare-fun b!83086 () Bool)

(declare-fun e!55125 () Bool)

(declare-fun array_inv!1574 (array!3790) Bool)

(assert (=> b!83086 (= e!55125 (array_inv!1574 (buf!2118 b2!98)))))

(declare-fun lt!132379 () (_ BitVec 64))

(declare-fun b!83087 () Bool)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> b!83087 (= e!55123 (not (bvsle lt!132381 (bvsub lt!132379 b1ValidateOffsetBits!11))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83087 (= (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98))) (bvsub lt!132379 lt!132381))))

(assert (=> b!83087 (= lt!132379 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98)))))))

(declare-datatypes ((Unit!5565 0))(
  ( (Unit!5566) )
))
(declare-fun lt!132380 () Unit!5565)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3018) Unit!5565)

(assert (=> b!83087 (= lt!132380 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83088 () Bool)

(declare-fun e!55128 () Bool)

(assert (=> b!83088 (= e!55128 (array_inv!1574 (buf!2118 b1!98)))))

(declare-fun res!68385 () Bool)

(assert (=> start!16926 (=> (not res!68385) (not e!55126))))

(assert (=> start!16926 (= res!68385 (and (= (size!1728 (buf!2118 b1!98)) (size!1728 (buf!2118 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16926 e!55126))

(declare-fun inv!12 (BitStream!3018) Bool)

(assert (=> start!16926 (and (inv!12 b1!98) e!55128)))

(assert (=> start!16926 (and (inv!12 b2!98) e!55125)))

(assert (=> start!16926 true))

(declare-fun b!83089 () Bool)

(declare-fun res!68384 () Bool)

(assert (=> b!83089 (=> (not res!68384) (not e!55126))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83089 (= res!68384 (validate_offset_bits!1 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16926 res!68385) b!83089))

(assert (= (and b!83089 res!68384) b!83085))

(assert (= (and b!83085 res!68386) b!83087))

(assert (= start!16926 b!83088))

(assert (= start!16926 b!83086))

(declare-fun m!129627 () Bool)

(assert (=> b!83087 m!129627))

(declare-fun m!129629 () Bool)

(assert (=> b!83087 m!129629))

(declare-fun m!129631 () Bool)

(assert (=> b!83086 m!129631))

(declare-fun m!129633 () Bool)

(assert (=> b!83088 m!129633))

(declare-fun m!129635 () Bool)

(assert (=> start!16926 m!129635))

(declare-fun m!129637 () Bool)

(assert (=> start!16926 m!129637))

(declare-fun m!129639 () Bool)

(assert (=> b!83089 m!129639))

(declare-fun m!129641 () Bool)

(assert (=> b!83085 m!129641))

(declare-fun m!129643 () Bool)

(assert (=> b!83085 m!129643))

(check-sat (not b!83086) (not start!16926) (not b!83089) (not b!83088) (not b!83087) (not b!83085))
(check-sat)
(get-model)

(declare-fun d!26470 () Bool)

(assert (=> d!26470 (= (array_inv!1574 (buf!2118 b1!98)) (bvsge (size!1728 (buf!2118 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83088 d!26470))

(declare-fun d!26472 () Bool)

(assert (=> d!26472 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6502 () Bool)

(assert (= bs!6502 d!26472))

(assert (=> bs!6502 m!129627))

(assert (=> b!83089 d!26472))

(declare-fun d!26474 () Bool)

(declare-fun e!55149 () Bool)

(assert (=> d!26474 e!55149))

(declare-fun res!68401 () Bool)

(assert (=> d!26474 (=> (not res!68401) (not e!55149))))

(declare-fun lt!132403 () (_ BitVec 64))

(declare-fun lt!132407 () (_ BitVec 64))

(declare-fun lt!132405 () (_ BitVec 64))

(assert (=> d!26474 (= res!68401 (= lt!132405 (bvsub lt!132403 lt!132407)))))

(assert (=> d!26474 (or (= (bvand lt!132403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132403 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132403 lt!132407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26474 (= lt!132407 (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b2!98))) ((_ sign_extend 32) (currentByte!4188 b2!98)) ((_ sign_extend 32) (currentBit!4183 b2!98))))))

(declare-fun lt!132404 () (_ BitVec 64))

(declare-fun lt!132408 () (_ BitVec 64))

(assert (=> d!26474 (= lt!132403 (bvmul lt!132404 lt!132408))))

(assert (=> d!26474 (or (= lt!132404 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132408 (bvsdiv (bvmul lt!132404 lt!132408) lt!132404)))))

(assert (=> d!26474 (= lt!132408 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26474 (= lt!132404 ((_ sign_extend 32) (size!1728 (buf!2118 b2!98))))))

(assert (=> d!26474 (= lt!132405 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4188 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4183 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26474 (invariant!0 (currentBit!4183 b2!98) (currentByte!4188 b2!98) (size!1728 (buf!2118 b2!98)))))

(assert (=> d!26474 (= (bitIndex!0 (size!1728 (buf!2118 b2!98)) (currentByte!4188 b2!98) (currentBit!4183 b2!98)) lt!132405)))

(declare-fun b!83109 () Bool)

(declare-fun res!68400 () Bool)

(assert (=> b!83109 (=> (not res!68400) (not e!55149))))

(assert (=> b!83109 (= res!68400 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132405))))

(declare-fun b!83110 () Bool)

(declare-fun lt!132406 () (_ BitVec 64))

(assert (=> b!83110 (= e!55149 (bvsle lt!132405 (bvmul lt!132406 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83110 (or (= lt!132406 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132406 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132406)))))

(assert (=> b!83110 (= lt!132406 ((_ sign_extend 32) (size!1728 (buf!2118 b2!98))))))

(assert (= (and d!26474 res!68401) b!83109))

(assert (= (and b!83109 res!68400) b!83110))

(declare-fun m!129663 () Bool)

(assert (=> d!26474 m!129663))

(declare-fun m!129665 () Bool)

(assert (=> d!26474 m!129665))

(assert (=> b!83085 d!26474))

(declare-fun d!26476 () Bool)

(declare-fun e!55150 () Bool)

(assert (=> d!26476 e!55150))

(declare-fun res!68403 () Bool)

(assert (=> d!26476 (=> (not res!68403) (not e!55150))))

(declare-fun lt!132411 () (_ BitVec 64))

(declare-fun lt!132413 () (_ BitVec 64))

(declare-fun lt!132409 () (_ BitVec 64))

(assert (=> d!26476 (= res!68403 (= lt!132411 (bvsub lt!132409 lt!132413)))))

(assert (=> d!26476 (or (= (bvand lt!132409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132409 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132409 lt!132413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26476 (= lt!132413 (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98))))))

(declare-fun lt!132410 () (_ BitVec 64))

(declare-fun lt!132414 () (_ BitVec 64))

(assert (=> d!26476 (= lt!132409 (bvmul lt!132410 lt!132414))))

(assert (=> d!26476 (or (= lt!132410 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132414 (bvsdiv (bvmul lt!132410 lt!132414) lt!132410)))))

(assert (=> d!26476 (= lt!132414 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26476 (= lt!132410 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))))))

(assert (=> d!26476 (= lt!132411 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4188 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4183 b1!98))))))

(assert (=> d!26476 (invariant!0 (currentBit!4183 b1!98) (currentByte!4188 b1!98) (size!1728 (buf!2118 b1!98)))))

(assert (=> d!26476 (= (bitIndex!0 (size!1728 (buf!2118 b1!98)) (currentByte!4188 b1!98) (currentBit!4183 b1!98)) lt!132411)))

(declare-fun b!83111 () Bool)

(declare-fun res!68402 () Bool)

(assert (=> b!83111 (=> (not res!68402) (not e!55150))))

(assert (=> b!83111 (= res!68402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132411))))

(declare-fun b!83112 () Bool)

(declare-fun lt!132412 () (_ BitVec 64))

(assert (=> b!83112 (= e!55150 (bvsle lt!132411 (bvmul lt!132412 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83112 (or (= lt!132412 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132412 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132412)))))

(assert (=> b!83112 (= lt!132412 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))))))

(assert (= (and d!26476 res!68403) b!83111))

(assert (= (and b!83111 res!68402) b!83112))

(assert (=> d!26476 m!129627))

(declare-fun m!129667 () Bool)

(assert (=> d!26476 m!129667))

(assert (=> b!83085 d!26476))

(declare-fun d!26478 () Bool)

(assert (=> d!26478 (= (array_inv!1574 (buf!2118 b2!98)) (bvsge (size!1728 (buf!2118 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83086 d!26478))

(declare-fun d!26480 () Bool)

(assert (=> d!26480 (= (inv!12 b1!98) (invariant!0 (currentBit!4183 b1!98) (currentByte!4188 b1!98) (size!1728 (buf!2118 b1!98))))))

(declare-fun bs!6503 () Bool)

(assert (= bs!6503 d!26480))

(assert (=> bs!6503 m!129667))

(assert (=> start!16926 d!26480))

(declare-fun d!26482 () Bool)

(assert (=> d!26482 (= (inv!12 b2!98) (invariant!0 (currentBit!4183 b2!98) (currentByte!4188 b2!98) (size!1728 (buf!2118 b2!98))))))

(declare-fun bs!6504 () Bool)

(assert (= bs!6504 d!26482))

(assert (=> bs!6504 m!129665))

(assert (=> start!16926 d!26482))

(declare-fun d!26484 () Bool)

(assert (=> d!26484 (= (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4188 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4183 b1!98)))))))

(assert (=> b!83087 d!26484))

(declare-fun d!26486 () Bool)

(declare-fun lt!132428 () (_ BitVec 64))

(declare-fun lt!132425 () (_ BitVec 64))

(assert (=> d!26486 (= (remainingBits!0 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))) ((_ sign_extend 32) (currentByte!4188 b1!98)) ((_ sign_extend 32) (currentBit!4183 b1!98))) (bvsub lt!132428 lt!132425))))

(assert (=> d!26486 (or (= (bvand lt!132428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132428 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132428 lt!132425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26486 (= lt!132425 (bitIndex!0 (size!1728 (buf!2118 b1!98)) (currentByte!4188 b1!98) (currentBit!4183 b1!98)))))

(declare-fun lt!132426 () (_ BitVec 64))

(declare-fun lt!132427 () (_ BitVec 64))

(assert (=> d!26486 (= lt!132428 (bvmul lt!132426 lt!132427))))

(assert (=> d!26486 (or (= lt!132426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132427 (bvsdiv (bvmul lt!132426 lt!132427) lt!132426)))))

(assert (=> d!26486 (= lt!132427 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26486 (= lt!132426 ((_ sign_extend 32) (size!1728 (buf!2118 b1!98))))))

(declare-fun lt!132429 () Unit!5565)

(declare-fun choose!23 (BitStream!3018) Unit!5565)

(assert (=> d!26486 (= lt!132429 (choose!23 b1!98))))

(assert (=> d!26486 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132429)))

(declare-fun bs!6505 () Bool)

(assert (= bs!6505 d!26486))

(assert (=> bs!6505 m!129627))

(assert (=> bs!6505 m!129643))

(declare-fun m!129669 () Bool)

(assert (=> bs!6505 m!129669))

(assert (=> b!83087 d!26486))

(check-sat (not d!26486) (not d!26472) (not d!26482) (not d!26474) (not d!26480) (not d!26476))
(check-sat)
