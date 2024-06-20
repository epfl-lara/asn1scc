; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30024 () Bool)

(assert start!30024)

(declare-fun b!154054 () Bool)

(declare-fun e!103470 () Bool)

(declare-fun lt!240466 () (_ BitVec 64))

(declare-fun lt!240465 () (_ BitVec 64))

(assert (=> b!154054 (= e!103470 (and (= lt!240466 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= lt!240466 (bvand lt!240465 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!240464 () (_ BitVec 64))

(assert (=> b!154054 (= lt!240466 (bvand lt!240464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!154055 () Bool)

(declare-fun e!103469 () Bool)

(declare-datatypes ((array!6955 0))(
  ( (array!6956 (arr!3957 (Array (_ BitVec 32) (_ BitVec 8))) (size!3134 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5526 0))(
  ( (BitStream!5527 (buf!3637 array!6955) (currentByte!6653 (_ BitVec 32)) (currentBit!6648 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5526)

(declare-fun array_inv!2923 (array!6955) Bool)

(assert (=> b!154055 (= e!103469 (array_inv!2923 (buf!3637 bs1!10)))))

(declare-fun res!128978 () Bool)

(declare-fun e!103473 () Bool)

(assert (=> start!30024 (=> (not res!128978) (not e!103473))))

(declare-fun bs2!18 () BitStream!5526)

(assert (=> start!30024 (= res!128978 (= (size!3134 (buf!3637 bs1!10)) (size!3134 (buf!3637 bs2!18))))))

(assert (=> start!30024 e!103473))

(declare-fun inv!12 (BitStream!5526) Bool)

(assert (=> start!30024 (and (inv!12 bs1!10) e!103469)))

(declare-fun e!103468 () Bool)

(assert (=> start!30024 (and (inv!12 bs2!18) e!103468)))

(declare-fun b!154056 () Bool)

(assert (=> b!154056 (= e!103468 (array_inv!2923 (buf!3637 bs2!18)))))

(declare-fun b!154057 () Bool)

(declare-fun res!128977 () Bool)

(assert (=> b!154057 (=> (not res!128977) (not e!103470))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!154057 (= res!128977 (bvsle lt!240465 (bitIndex!0 (size!3134 (buf!3637 bs2!18)) (currentByte!6653 bs2!18) (currentBit!6648 bs2!18))))))

(declare-fun b!154058 () Bool)

(assert (=> b!154058 (= e!103473 e!103470)))

(declare-fun res!128979 () Bool)

(assert (=> b!154058 (=> (not res!128979) (not e!103470))))

(assert (=> b!154058 (= res!128979 (bvsle lt!240465 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3134 (buf!3637 bs1!10))))))))

(assert (=> b!154058 (= lt!240465 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240464))))

(assert (=> b!154058 (= lt!240464 (bitIndex!0 (size!3134 (buf!3637 bs1!10)) (currentByte!6653 bs1!10) (currentBit!6648 bs1!10)))))

(assert (= (and start!30024 res!128978) b!154058))

(assert (= (and b!154058 res!128979) b!154057))

(assert (= (and b!154057 res!128977) b!154054))

(assert (= start!30024 b!154055))

(assert (= start!30024 b!154056))

(declare-fun m!240043 () Bool)

(assert (=> b!154058 m!240043))

(declare-fun m!240045 () Bool)

(assert (=> start!30024 m!240045))

(declare-fun m!240047 () Bool)

(assert (=> start!30024 m!240047))

(declare-fun m!240049 () Bool)

(assert (=> b!154057 m!240049))

(declare-fun m!240051 () Bool)

(assert (=> b!154056 m!240051))

(declare-fun m!240053 () Bool)

(assert (=> b!154055 m!240053))

(check-sat (not b!154055) (not b!154056) (not b!154057) (not b!154058) (not start!30024))
(check-sat)
(get-model)

(declare-fun d!50796 () Bool)

(declare-fun e!103494 () Bool)

(assert (=> d!50796 e!103494))

(declare-fun res!128993 () Bool)

(assert (=> d!50796 (=> (not res!128993) (not e!103494))))

(declare-fun lt!240492 () (_ BitVec 64))

(declare-fun lt!240493 () (_ BitVec 64))

(declare-fun lt!240489 () (_ BitVec 64))

(assert (=> d!50796 (= res!128993 (= lt!240493 (bvsub lt!240489 lt!240492)))))

(assert (=> d!50796 (or (= (bvand lt!240489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240492 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240489 lt!240492) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50796 (= lt!240492 (remainingBits!0 ((_ sign_extend 32) (size!3134 (buf!3637 bs1!10))) ((_ sign_extend 32) (currentByte!6653 bs1!10)) ((_ sign_extend 32) (currentBit!6648 bs1!10))))))

(declare-fun lt!240491 () (_ BitVec 64))

(declare-fun lt!240490 () (_ BitVec 64))

(assert (=> d!50796 (= lt!240489 (bvmul lt!240491 lt!240490))))

(assert (=> d!50796 (or (= lt!240491 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240490 (bvsdiv (bvmul lt!240491 lt!240490) lt!240491)))))

(assert (=> d!50796 (= lt!240490 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50796 (= lt!240491 ((_ sign_extend 32) (size!3134 (buf!3637 bs1!10))))))

(assert (=> d!50796 (= lt!240493 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6653 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6648 bs1!10))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!50796 (invariant!0 (currentBit!6648 bs1!10) (currentByte!6653 bs1!10) (size!3134 (buf!3637 bs1!10)))))

(assert (=> d!50796 (= (bitIndex!0 (size!3134 (buf!3637 bs1!10)) (currentByte!6653 bs1!10) (currentBit!6648 bs1!10)) lt!240493)))

(declare-fun b!154078 () Bool)

(declare-fun res!128994 () Bool)

(assert (=> b!154078 (=> (not res!128994) (not e!103494))))

(assert (=> b!154078 (= res!128994 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240493))))

(declare-fun b!154079 () Bool)

(declare-fun lt!240488 () (_ BitVec 64))

(assert (=> b!154079 (= e!103494 (bvsle lt!240493 (bvmul lt!240488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154079 (or (= lt!240488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240488)))))

(assert (=> b!154079 (= lt!240488 ((_ sign_extend 32) (size!3134 (buf!3637 bs1!10))))))

(assert (= (and d!50796 res!128993) b!154078))

(assert (= (and b!154078 res!128994) b!154079))

(declare-fun m!240067 () Bool)

(assert (=> d!50796 m!240067))

(declare-fun m!240069 () Bool)

(assert (=> d!50796 m!240069))

(assert (=> b!154058 d!50796))

(declare-fun d!50800 () Bool)

(declare-fun e!103495 () Bool)

(assert (=> d!50800 e!103495))

(declare-fun res!128995 () Bool)

(assert (=> d!50800 (=> (not res!128995) (not e!103495))))

(declare-fun lt!240495 () (_ BitVec 64))

(declare-fun lt!240498 () (_ BitVec 64))

(declare-fun lt!240499 () (_ BitVec 64))

(assert (=> d!50800 (= res!128995 (= lt!240499 (bvsub lt!240495 lt!240498)))))

(assert (=> d!50800 (or (= (bvand lt!240495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240498 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240495 lt!240498) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50800 (= lt!240498 (remainingBits!0 ((_ sign_extend 32) (size!3134 (buf!3637 bs2!18))) ((_ sign_extend 32) (currentByte!6653 bs2!18)) ((_ sign_extend 32) (currentBit!6648 bs2!18))))))

(declare-fun lt!240497 () (_ BitVec 64))

(declare-fun lt!240496 () (_ BitVec 64))

(assert (=> d!50800 (= lt!240495 (bvmul lt!240497 lt!240496))))

(assert (=> d!50800 (or (= lt!240497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240496 (bvsdiv (bvmul lt!240497 lt!240496) lt!240497)))))

(assert (=> d!50800 (= lt!240496 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50800 (= lt!240497 ((_ sign_extend 32) (size!3134 (buf!3637 bs2!18))))))

(assert (=> d!50800 (= lt!240499 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6653 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6648 bs2!18))))))

(assert (=> d!50800 (invariant!0 (currentBit!6648 bs2!18) (currentByte!6653 bs2!18) (size!3134 (buf!3637 bs2!18)))))

(assert (=> d!50800 (= (bitIndex!0 (size!3134 (buf!3637 bs2!18)) (currentByte!6653 bs2!18) (currentBit!6648 bs2!18)) lt!240499)))

(declare-fun b!154080 () Bool)

(declare-fun res!128996 () Bool)

(assert (=> b!154080 (=> (not res!128996) (not e!103495))))

(assert (=> b!154080 (= res!128996 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240499))))

(declare-fun b!154081 () Bool)

(declare-fun lt!240494 () (_ BitVec 64))

(assert (=> b!154081 (= e!103495 (bvsle lt!240499 (bvmul lt!240494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!154081 (or (= lt!240494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240494)))))

(assert (=> b!154081 (= lt!240494 ((_ sign_extend 32) (size!3134 (buf!3637 bs2!18))))))

(assert (= (and d!50800 res!128995) b!154080))

(assert (= (and b!154080 res!128996) b!154081))

(declare-fun m!240071 () Bool)

(assert (=> d!50800 m!240071))

(declare-fun m!240073 () Bool)

(assert (=> d!50800 m!240073))

(assert (=> b!154057 d!50800))

(declare-fun d!50804 () Bool)

(assert (=> d!50804 (= (array_inv!2923 (buf!3637 bs2!18)) (bvsge (size!3134 (buf!3637 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!154056 d!50804))

(declare-fun d!50808 () Bool)

(assert (=> d!50808 (= (array_inv!2923 (buf!3637 bs1!10)) (bvsge (size!3134 (buf!3637 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!154055 d!50808))

(declare-fun d!50810 () Bool)

(assert (=> d!50810 (= (inv!12 bs1!10) (invariant!0 (currentBit!6648 bs1!10) (currentByte!6653 bs1!10) (size!3134 (buf!3637 bs1!10))))))

(declare-fun bs!12422 () Bool)

(assert (= bs!12422 d!50810))

(assert (=> bs!12422 m!240069))

(assert (=> start!30024 d!50810))

(declare-fun d!50812 () Bool)

(assert (=> d!50812 (= (inv!12 bs2!18) (invariant!0 (currentBit!6648 bs2!18) (currentByte!6653 bs2!18) (size!3134 (buf!3637 bs2!18))))))

(declare-fun bs!12423 () Bool)

(assert (= bs!12423 d!50812))

(assert (=> bs!12423 m!240073))

(assert (=> start!30024 d!50812))

(check-sat (not d!50800) (not d!50812) (not d!50810) (not d!50796))
