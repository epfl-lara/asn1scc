; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69308 () Bool)

(assert start!69308)

(declare-fun b!311883 () Bool)

(declare-fun e!224256 () Bool)

(declare-datatypes ((array!19070 0))(
  ( (array!19071 (arr!9351 (Array (_ BitVec 32) (_ BitVec 8))) (size!8271 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13646 0))(
  ( (BitStream!13647 (buf!7884 array!19070) (currentByte!14549 (_ BitVec 32)) (currentBit!14544 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13646)

(declare-fun array_inv!7823 (array!19070) Bool)

(assert (=> b!311883 (= e!224256 (array_inv!7823 (buf!7884 b2!97)))))

(declare-fun b!311884 () Bool)

(declare-fun e!224254 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!311884 (= e!224254 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14544 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14549 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8271 (buf!7884 b2!97)))))))))

(declare-fun b!311885 () Bool)

(declare-fun res!255495 () Bool)

(assert (=> b!311885 (=> (not res!255495) (not e!224254))))

(assert (=> b!311885 (= res!255495 (and (bvsle ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14549 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14544 b2!97)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14549 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14544 b2!97)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!311886 () Bool)

(declare-fun e!224255 () Bool)

(declare-fun e!224258 () Bool)

(assert (=> b!311886 (= e!224255 e!224258)))

(declare-fun res!255493 () Bool)

(assert (=> b!311886 (=> (not res!255493) (not e!224258))))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!441474 () (_ BitVec 64))

(declare-fun lt!441475 () (_ BitVec 64))

(assert (=> b!311886 (= res!255493 (bvsge (bvsub lt!441474 lt!441475) b1ValidateOffsetBits!10))))

(declare-fun b1!97 () BitStream!13646)

(assert (=> b!311886 (= lt!441475 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14549 b1!97))) ((_ sign_extend 32) (currentBit!14544 b1!97))))))

(assert (=> b!311886 (= lt!441474 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97)))))))

(declare-fun b!311887 () Bool)

(declare-fun res!255499 () Bool)

(assert (=> b!311887 (=> (not res!255499) (not e!224255))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!311887 (= res!255499 (bvsle (bitIndex!0 (size!8271 (buf!7884 b2!97)) (currentByte!14549 b2!97) (currentBit!14544 b2!97)) (bvadd (bitIndex!0 (size!8271 (buf!7884 b1!97)) (currentByte!14549 b1!97) (currentBit!14544 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!311888 () Bool)

(assert (=> b!311888 (= e!224258 e!224254)))

(declare-fun res!255500 () Bool)

(assert (=> b!311888 (=> (not res!255500) (not e!224254))))

(declare-fun lt!441476 () (_ BitVec 64))

(assert (=> b!311888 (= res!255500 (and (bvsle lt!441476 (bvadd lt!441475 advancedAtMostBits!9)) (bvsge (bvsub lt!441474 lt!441476) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(assert (=> b!311888 (= lt!441476 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14549 b2!97))) ((_ sign_extend 32) (currentBit!14544 b2!97))))))

(declare-fun b!311889 () Bool)

(declare-fun res!255498 () Bool)

(assert (=> b!311889 (=> (not res!255498) (not e!224255))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!311889 (= res!255498 (validate_offset_bits!1 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255496 () Bool)

(assert (=> start!69308 (=> (not res!255496) (not e!224255))))

(assert (=> start!69308 (= res!255496 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8271 (buf!7884 b1!97)) (size!8271 (buf!7884 b2!97)))))))

(assert (=> start!69308 e!224255))

(assert (=> start!69308 true))

(declare-fun e!224259 () Bool)

(declare-fun inv!12 (BitStream!13646) Bool)

(assert (=> start!69308 (and (inv!12 b1!97) e!224259)))

(assert (=> start!69308 (and (inv!12 b2!97) e!224256)))

(declare-fun b!311890 () Bool)

(declare-fun res!255497 () Bool)

(assert (=> b!311890 (=> (not res!255497) (not e!224255))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!311890 (= res!255497 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!311891 () Bool)

(assert (=> b!311891 (= e!224259 (array_inv!7823 (buf!7884 b1!97)))))

(declare-fun b!311892 () Bool)

(declare-fun res!255494 () Bool)

(assert (=> b!311892 (=> (not res!255494) (not e!224254))))

(assert (=> b!311892 (= res!255494 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) ((_ sign_extend 32) (currentByte!14549 b2!97)) ((_ sign_extend 32) (currentBit!14544 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(assert (= (and start!69308 res!255496) b!311889))

(assert (= (and b!311889 res!255498) b!311887))

(assert (= (and b!311887 res!255499) b!311890))

(assert (= (and b!311890 res!255497) b!311886))

(assert (= (and b!311886 res!255493) b!311888))

(assert (= (and b!311888 res!255500) b!311892))

(assert (= (and b!311892 res!255494) b!311885))

(assert (= (and b!311885 res!255495) b!311884))

(assert (= start!69308 b!311891))

(assert (= start!69308 b!311883))

(declare-fun m!449625 () Bool)

(assert (=> b!311890 m!449625))

(declare-fun m!449627 () Bool)

(assert (=> b!311891 m!449627))

(declare-fun m!449629 () Bool)

(assert (=> b!311889 m!449629))

(declare-fun m!449631 () Bool)

(assert (=> b!311884 m!449631))

(declare-fun m!449633 () Bool)

(assert (=> b!311883 m!449633))

(declare-fun m!449635 () Bool)

(assert (=> b!311887 m!449635))

(declare-fun m!449637 () Bool)

(assert (=> b!311887 m!449637))

(declare-fun m!449639 () Bool)

(assert (=> start!69308 m!449639))

(declare-fun m!449641 () Bool)

(assert (=> start!69308 m!449641))

(declare-fun m!449643 () Bool)

(assert (=> b!311892 m!449643))

(push 1)

(assert (not b!311890))

(assert (not b!311883))

(assert (not start!69308))

(assert (not b!311892))

(assert (not b!311889))

(assert (not b!311887))

(assert (not b!311884))

(assert (not b!311891))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103479 () Bool)

(declare-fun e!224267 () Bool)

(assert (=> d!103479 e!224267))

(declare-fun res!255514 () Bool)

(assert (=> d!103479 (=> (not res!255514) (not e!224267))))

(declare-fun lt!441516 () (_ BitVec 64))

(declare-fun lt!441515 () (_ BitVec 64))

(declare-fun lt!441514 () (_ BitVec 64))

(assert (=> d!103479 (= res!255514 (= lt!441514 (bvsub lt!441515 lt!441516)))))

(assert (=> d!103479 (or (= (bvand lt!441515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441515 lt!441516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103479 (= lt!441516 (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) ((_ sign_extend 32) (currentByte!14549 b2!97)) ((_ sign_extend 32) (currentBit!14544 b2!97))))))

(declare-fun lt!441513 () (_ BitVec 64))

(declare-fun lt!441517 () (_ BitVec 64))

(assert (=> d!103479 (= lt!441515 (bvmul lt!441513 lt!441517))))

(assert (=> d!103479 (or (= lt!441513 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441517 (bvsdiv (bvmul lt!441513 lt!441517) lt!441513)))))

(assert (=> d!103479 (= lt!441517 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103479 (= lt!441513 ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))))))

(assert (=> d!103479 (= lt!441514 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14549 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14544 b2!97))))))

(assert (=> d!103479 (invariant!0 (currentBit!14544 b2!97) (currentByte!14549 b2!97) (size!8271 (buf!7884 b2!97)))))

(assert (=> d!103479 (= (bitIndex!0 (size!8271 (buf!7884 b2!97)) (currentByte!14549 b2!97) (currentBit!14544 b2!97)) lt!441514)))

(declare-fun b!311905 () Bool)

(declare-fun res!255513 () Bool)

(assert (=> b!311905 (=> (not res!255513) (not e!224267))))

(assert (=> b!311905 (= res!255513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441514))))

(declare-fun b!311906 () Bool)

(declare-fun lt!441518 () (_ BitVec 64))

(assert (=> b!311906 (= e!224267 (bvsle lt!441514 (bvmul lt!441518 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311906 (or (= lt!441518 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441518 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441518)))))

(assert (=> b!311906 (= lt!441518 ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))))))

(assert (= (and d!103479 res!255514) b!311905))

(assert (= (and b!311905 res!255513) b!311906))

(assert (=> d!103479 m!449643))

(declare-fun m!449649 () Bool)

(assert (=> d!103479 m!449649))

(assert (=> b!311887 d!103479))

(declare-fun d!103490 () Bool)

(declare-fun e!224268 () Bool)

(assert (=> d!103490 e!224268))

(declare-fun res!255516 () Bool)

(assert (=> d!103490 (=> (not res!255516) (not e!224268))))

(declare-fun lt!441520 () (_ BitVec 64))

(declare-fun lt!441522 () (_ BitVec 64))

(declare-fun lt!441521 () (_ BitVec 64))

(assert (=> d!103490 (= res!255516 (= lt!441520 (bvsub lt!441521 lt!441522)))))

(assert (=> d!103490 (or (= (bvand lt!441521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441522 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441521 lt!441522) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103490 (= lt!441522 (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97))))))

(declare-fun lt!441519 () (_ BitVec 64))

(declare-fun lt!441523 () (_ BitVec 64))

(assert (=> d!103490 (= lt!441521 (bvmul lt!441519 lt!441523))))

(assert (=> d!103490 (or (= lt!441519 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441523 (bvsdiv (bvmul lt!441519 lt!441523) lt!441519)))))

(assert (=> d!103490 (= lt!441523 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103490 (= lt!441519 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))))))

(assert (=> d!103490 (= lt!441520 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14549 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14544 b1!97))))))

(assert (=> d!103490 (invariant!0 (currentBit!14544 b1!97) (currentByte!14549 b1!97) (size!8271 (buf!7884 b1!97)))))

(assert (=> d!103490 (= (bitIndex!0 (size!8271 (buf!7884 b1!97)) (currentByte!14549 b1!97) (currentBit!14544 b1!97)) lt!441520)))

(declare-fun b!311907 () Bool)

(declare-fun res!255515 () Bool)

(assert (=> b!311907 (=> (not res!255515) (not e!224268))))

(assert (=> b!311907 (= res!255515 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441520))))

(declare-fun b!311908 () Bool)

(declare-fun lt!441524 () (_ BitVec 64))

(assert (=> b!311908 (= e!224268 (bvsle lt!441520 (bvmul lt!441524 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!311908 (or (= lt!441524 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441524 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441524)))))

(assert (=> b!311908 (= lt!441524 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))))))

(assert (= (and d!103490 res!255516) b!311907))

(assert (= (and b!311907 res!255515) b!311908))

(assert (=> d!103490 m!449625))

(declare-fun m!449651 () Bool)

(assert (=> d!103490 m!449651))

(assert (=> b!311887 d!103490))

(declare-fun d!103492 () Bool)

(assert (=> d!103492 (= (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) ((_ sign_extend 32) (currentByte!14549 b2!97)) ((_ sign_extend 32) (currentBit!14544 b2!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14549 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14544 b2!97)))))))

(assert (=> b!311892 d!103492))

(declare-fun d!103494 () Bool)

(assert (=> d!103494 (= (inv!12 b1!97) (invariant!0 (currentBit!14544 b1!97) (currentByte!14549 b1!97) (size!8271 (buf!7884 b1!97))))))

(declare-fun bs!26778 () Bool)

(assert (= bs!26778 d!103494))

(assert (=> bs!26778 m!449651))

(assert (=> start!69308 d!103494))

(declare-fun d!103496 () Bool)

(assert (=> d!103496 (= (inv!12 b2!97) (invariant!0 (currentBit!14544 b2!97) (currentByte!14549 b2!97) (size!8271 (buf!7884 b2!97))))))

(declare-fun bs!26779 () Bool)

(assert (= bs!26779 d!103496))

(assert (=> bs!26779 m!449649))

(assert (=> start!69308 d!103496))

(declare-fun d!103498 () Bool)

(assert (=> d!103498 (= (array_inv!7823 (buf!7884 b2!97)) (bvsge (size!8271 (buf!7884 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!311883 d!103498))

(declare-fun d!103500 () Bool)

(assert (=> d!103500 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26780 () Bool)

(assert (= bs!26780 d!103500))

(assert (=> bs!26780 m!449625))

(assert (=> b!311889 d!103500))

(declare-fun d!103502 () Bool)

(assert (=> d!103502 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14544 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14549 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14544 b2!97))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14544 b2!97))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14549 b2!97))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14549 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8271 (buf!7884 b2!97))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14544 b2!97))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14549 b2!97))) ((_ extract 31 0) ((_ sign_extend 32) (size!8271 (buf!7884 b2!97)))))))))))

(assert (=> b!311884 d!103502))

(declare-fun d!103510 () Bool)

(assert (=> d!103510 (= (remainingBits!0 ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) ((_ sign_extend 32) (currentByte!14549 b1!97)) ((_ sign_extend 32) (currentBit!14544 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8271 (buf!7884 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14549 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14544 b1!97)))))))

(assert (=> b!311890 d!103510))

(declare-fun d!103512 () Bool)

(assert (=> d!103512 (= (array_inv!7823 (buf!7884 b1!97)) (bvsge (size!8271 (buf!7884 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!311891 d!103512))

(push 1)

