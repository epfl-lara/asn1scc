; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17054 () Bool)

(assert start!17054)

(declare-fun b!83406 () Bool)

(declare-fun res!68604 () Bool)

(declare-fun e!55455 () Bool)

(assert (=> b!83406 (=> (not res!68604) (not e!55455))))

(declare-datatypes ((array!3831 0))(
  ( (array!3832 (arr!2381 (Array (_ BitVec 32) (_ BitVec 8))) (size!1744 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3050 0))(
  ( (BitStream!3051 (buf!2134 array!3831) (currentByte!4228 (_ BitVec 32)) (currentBit!4223 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3050)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83406 (= res!68604 (validate_offset_bits!1 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68605 () Bool)

(assert (=> start!17054 (=> (not res!68605) (not e!55455))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3050)

(assert (=> start!17054 (= res!68605 (and (= (size!1744 (buf!2134 b1!98)) (size!1744 (buf!2134 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17054 e!55455))

(declare-fun e!55457 () Bool)

(declare-fun inv!12 (BitStream!3050) Bool)

(assert (=> start!17054 (and (inv!12 b1!98) e!55457)))

(declare-fun e!55458 () Bool)

(assert (=> start!17054 (and (inv!12 b2!98) e!55458)))

(assert (=> start!17054 true))

(declare-fun b!83407 () Bool)

(declare-fun e!55453 () Bool)

(assert (=> b!83407 (= e!55455 e!55453)))

(declare-fun res!68603 () Bool)

(assert (=> b!83407 (=> (not res!68603) (not e!55453))))

(declare-fun lt!132927 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83407 (= res!68603 (= (bvadd lt!132927 b1b2Diff!1) (bitIndex!0 (size!1744 (buf!2134 b2!98)) (currentByte!4228 b2!98) (currentBit!4223 b2!98))))))

(assert (=> b!83407 (= lt!132927 (bitIndex!0 (size!1744 (buf!2134 b1!98)) (currentByte!4228 b1!98) (currentBit!4223 b1!98)))))

(declare-fun lt!132923 () (_ BitVec 64))

(declare-fun lt!132924 () (_ BitVec 64))

(declare-fun b!83408 () Bool)

(assert (=> b!83408 (= e!55453 (not (or (= lt!132924 (bvand lt!132927 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!132924 (bvand lt!132923 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!132925 () (_ BitVec 64))

(assert (=> b!83408 (= lt!132924 (bvand lt!132925 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83408 (= (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98))) lt!132923)))

(assert (=> b!83408 (= lt!132923 (bvsub lt!132925 lt!132927))))

(assert (=> b!83408 (= lt!132925 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98)))))))

(declare-datatypes ((Unit!5591 0))(
  ( (Unit!5592) )
))
(declare-fun lt!132926 () Unit!5591)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3050) Unit!5591)

(assert (=> b!83408 (= lt!132926 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83409 () Bool)

(declare-fun array_inv!1590 (array!3831) Bool)

(assert (=> b!83409 (= e!55457 (array_inv!1590 (buf!2134 b1!98)))))

(declare-fun b!83410 () Bool)

(assert (=> b!83410 (= e!55458 (array_inv!1590 (buf!2134 b2!98)))))

(assert (= (and start!17054 res!68605) b!83406))

(assert (= (and b!83406 res!68604) b!83407))

(assert (= (and b!83407 res!68603) b!83408))

(assert (= start!17054 b!83409))

(assert (= start!17054 b!83410))

(declare-fun m!129987 () Bool)

(assert (=> b!83407 m!129987))

(declare-fun m!129989 () Bool)

(assert (=> b!83407 m!129989))

(declare-fun m!129991 () Bool)

(assert (=> b!83408 m!129991))

(declare-fun m!129993 () Bool)

(assert (=> b!83408 m!129993))

(declare-fun m!129995 () Bool)

(assert (=> b!83409 m!129995))

(declare-fun m!129997 () Bool)

(assert (=> b!83410 m!129997))

(declare-fun m!129999 () Bool)

(assert (=> start!17054 m!129999))

(declare-fun m!130001 () Bool)

(assert (=> start!17054 m!130001))

(declare-fun m!130003 () Bool)

(assert (=> b!83406 m!130003))

(push 1)

(assert (not b!83407))

(assert (not b!83410))

(assert (not b!83409))

(assert (not start!17054))

(assert (not b!83406))

(assert (not b!83408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26658 () Bool)

(assert (=> d!26658 (= (array_inv!1590 (buf!2134 b2!98)) (bvsge (size!1744 (buf!2134 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83410 d!26658))

(declare-fun d!26664 () Bool)

(assert (=> d!26664 (= (array_inv!1590 (buf!2134 b1!98)) (bvsge (size!1744 (buf!2134 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83409 d!26664))

(declare-fun d!26666 () Bool)

(assert (=> d!26666 (= (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4228 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4223 b1!98)))))))

(assert (=> b!83408 d!26666))

(declare-fun d!26668 () Bool)

(declare-fun lt!132996 () (_ BitVec 64))

(declare-fun lt!132992 () (_ BitVec 64))

(assert (=> d!26668 (= (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98))) (bvsub lt!132996 lt!132992))))

(assert (=> d!26668 (or (= (bvand lt!132996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132992 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132996 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132996 lt!132992) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26668 (= lt!132992 (bitIndex!0 (size!1744 (buf!2134 b1!98)) (currentByte!4228 b1!98) (currentBit!4223 b1!98)))))

(declare-fun lt!132993 () (_ BitVec 64))

(declare-fun lt!132994 () (_ BitVec 64))

(assert (=> d!26668 (= lt!132996 (bvmul lt!132993 lt!132994))))

(assert (=> d!26668 (or (= lt!132993 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132994 (bvsdiv (bvmul lt!132993 lt!132994) lt!132993)))))

(assert (=> d!26668 (= lt!132994 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26668 (= lt!132993 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))))))

(declare-fun lt!132995 () Unit!5591)

(declare-fun choose!23 (BitStream!3050) Unit!5591)

(assert (=> d!26668 (= lt!132995 (choose!23 b1!98))))

(assert (=> d!26668 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132995)))

(declare-fun bs!6561 () Bool)

(assert (= bs!6561 d!26668))

(assert (=> bs!6561 m!129991))

(assert (=> bs!6561 m!129989))

(declare-fun m!130019 () Bool)

(assert (=> bs!6561 m!130019))

(assert (=> b!83408 d!26668))

(declare-fun d!26678 () Bool)

(declare-fun e!55469 () Bool)

(assert (=> d!26678 e!55469))

(declare-fun res!68627 () Bool)

(assert (=> d!26678 (=> (not res!68627) (not e!55469))))

(declare-fun lt!133035 () (_ BitVec 64))

(declare-fun lt!133033 () (_ BitVec 64))

(declare-fun lt!133037 () (_ BitVec 64))

(assert (=> d!26678 (= res!68627 (= lt!133033 (bvsub lt!133037 lt!133035)))))

(assert (=> d!26678 (or (= (bvand lt!133037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133037 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133037 lt!133035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26678 (= lt!133035 (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b2!98))) ((_ sign_extend 32) (currentByte!4228 b2!98)) ((_ sign_extend 32) (currentBit!4223 b2!98))))))

(declare-fun lt!133036 () (_ BitVec 64))

(declare-fun lt!133034 () (_ BitVec 64))

(assert (=> d!26678 (= lt!133037 (bvmul lt!133036 lt!133034))))

(assert (=> d!26678 (or (= lt!133036 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133034 (bvsdiv (bvmul lt!133036 lt!133034) lt!133036)))))

(assert (=> d!26678 (= lt!133034 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26678 (= lt!133036 ((_ sign_extend 32) (size!1744 (buf!2134 b2!98))))))

(assert (=> d!26678 (= lt!133033 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4228 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4223 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26678 (invariant!0 (currentBit!4223 b2!98) (currentByte!4228 b2!98) (size!1744 (buf!2134 b2!98)))))

(assert (=> d!26678 (= (bitIndex!0 (size!1744 (buf!2134 b2!98)) (currentByte!4228 b2!98) (currentBit!4223 b2!98)) lt!133033)))

(declare-fun b!83434 () Bool)

(declare-fun res!68626 () Bool)

(assert (=> b!83434 (=> (not res!68626) (not e!55469))))

(assert (=> b!83434 (= res!68626 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133033))))

(declare-fun b!83435 () Bool)

(declare-fun lt!133038 () (_ BitVec 64))

(assert (=> b!83435 (= e!55469 (bvsle lt!133033 (bvmul lt!133038 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83435 (or (= lt!133038 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133038 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133038)))))

(assert (=> b!83435 (= lt!133038 ((_ sign_extend 32) (size!1744 (buf!2134 b2!98))))))

(assert (= (and d!26678 res!68627) b!83434))

(assert (= (and b!83434 res!68626) b!83435))

(declare-fun m!130023 () Bool)

(assert (=> d!26678 m!130023))

(declare-fun m!130025 () Bool)

(assert (=> d!26678 m!130025))

(assert (=> b!83407 d!26678))

(declare-fun d!26682 () Bool)

(declare-fun e!55470 () Bool)

(assert (=> d!26682 e!55470))

(declare-fun res!68629 () Bool)

(assert (=> d!26682 (=> (not res!68629) (not e!55470))))

(declare-fun lt!133039 () (_ BitVec 64))

(declare-fun lt!133041 () (_ BitVec 64))

(declare-fun lt!133043 () (_ BitVec 64))

(assert (=> d!26682 (= res!68629 (= lt!133039 (bvsub lt!133043 lt!133041)))))

(assert (=> d!26682 (or (= (bvand lt!133043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133041 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133043 lt!133041) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26682 (= lt!133041 (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98))))))

(declare-fun lt!133042 () (_ BitVec 64))

(declare-fun lt!133040 () (_ BitVec 64))

(assert (=> d!26682 (= lt!133043 (bvmul lt!133042 lt!133040))))

(assert (=> d!26682 (or (= lt!133042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133040 (bvsdiv (bvmul lt!133042 lt!133040) lt!133042)))))

(assert (=> d!26682 (= lt!133040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26682 (= lt!133042 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))))))

(assert (=> d!26682 (= lt!133039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4228 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4223 b1!98))))))

(assert (=> d!26682 (invariant!0 (currentBit!4223 b1!98) (currentByte!4228 b1!98) (size!1744 (buf!2134 b1!98)))))

(assert (=> d!26682 (= (bitIndex!0 (size!1744 (buf!2134 b1!98)) (currentByte!4228 b1!98) (currentBit!4223 b1!98)) lt!133039)))

(declare-fun b!83436 () Bool)

(declare-fun res!68628 () Bool)

(assert (=> b!83436 (=> (not res!68628) (not e!55470))))

(assert (=> b!83436 (= res!68628 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133039))))

(declare-fun b!83437 () Bool)

(declare-fun lt!133044 () (_ BitVec 64))

(assert (=> b!83437 (= e!55470 (bvsle lt!133039 (bvmul lt!133044 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83437 (or (= lt!133044 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133044 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133044)))))

(assert (=> b!83437 (= lt!133044 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))))))

(assert (= (and d!26682 res!68629) b!83436))

(assert (= (and b!83436 res!68628) b!83437))

(assert (=> d!26682 m!129991))

(declare-fun m!130027 () Bool)

(assert (=> d!26682 m!130027))

(assert (=> b!83407 d!26682))

(declare-fun d!26684 () Bool)

(assert (=> d!26684 (= (inv!12 b1!98) (invariant!0 (currentBit!4223 b1!98) (currentByte!4228 b1!98) (size!1744 (buf!2134 b1!98))))))

(declare-fun bs!6562 () Bool)

(assert (= bs!6562 d!26684))

(assert (=> bs!6562 m!130027))

(assert (=> start!17054 d!26684))

(declare-fun d!26686 () Bool)

(assert (=> d!26686 (= (inv!12 b2!98) (invariant!0 (currentBit!4223 b2!98) (currentByte!4228 b2!98) (size!1744 (buf!2134 b2!98))))))

(declare-fun bs!6563 () Bool)

(assert (= bs!6563 d!26686))

(assert (=> bs!6563 m!130025))

(assert (=> start!17054 d!26686))

(declare-fun d!26688 () Bool)

(assert (=> d!26688 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1744 (buf!2134 b1!98))) ((_ sign_extend 32) (currentByte!4228 b1!98)) ((_ sign_extend 32) (currentBit!4223 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6564 () Bool)

(assert (= bs!6564 d!26688))

(assert (=> bs!6564 m!129991))

(assert (=> b!83406 d!26688))

(push 1)

(assert (not d!26684))

(assert (not d!26682))

(assert (not d!26668))

(assert (not d!26688))

(assert (not d!26678))

(assert (not d!26686))

(check-sat)

(pop 1)

(push 1)

(check-sat)

