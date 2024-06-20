; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45594 () Bool)

(assert start!45594)

(declare-fun b!220554 () Bool)

(declare-fun e!149780 () Bool)

(declare-fun e!149781 () Bool)

(assert (=> b!220554 (= e!149780 e!149781)))

(declare-fun res!185790 () Bool)

(assert (=> b!220554 (=> (not res!185790) (not e!149781))))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220554 (= res!185790 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-datatypes ((array!10752 0))(
  ( (array!10753 (arr!5651 (Array (_ BitVec 32) (_ BitVec 8))) (size!4721 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8550 0))(
  ( (BitStream!8551 (buf!5268 array!10752) (currentByte!9901 (_ BitVec 32)) (currentBit!9896 (_ BitVec 32))) )
))
(declare-fun lt!348482 () BitStream!8550)

(declare-fun bs!62 () BitStream!8550)

(declare-fun withMovedBitIndex!0 (BitStream!8550 (_ BitVec 64)) BitStream!8550)

(assert (=> b!220554 (= lt!348482 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!18870 0))(
  ( (tuple2!18871 (_1!10093 BitStream!8550) (_2!10093 Bool)) )
))
(declare-fun lt!348481 () tuple2!18870)

(declare-fun readBitPure!0 (BitStream!8550) tuple2!18870)

(assert (=> b!220554 (= lt!348481 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18872 0))(
  ( (tuple2!18873 (_1!10094 BitStream!8550) (_2!10094 (_ BitVec 64))) )
))
(declare-fun lt!348480 () tuple2!18872)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18872)

(assert (=> b!220554 (= lt!348480 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun res!185793 () Bool)

(assert (=> start!45594 (=> (not res!185793) (not e!149780))))

(assert (=> start!45594 (= res!185793 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45594 e!149780))

(assert (=> start!45594 true))

(declare-fun e!149778 () Bool)

(declare-fun inv!12 (BitStream!8550) Bool)

(assert (=> start!45594 (and (inv!12 bs!62) e!149778)))

(declare-fun b!220555 () Bool)

(declare-fun array_inv!4462 (array!10752) Bool)

(assert (=> b!220555 (= e!149778 (array_inv!4462 (buf!5268 bs!62)))))

(declare-fun b!220556 () Bool)

(declare-fun res!185791 () Bool)

(assert (=> b!220556 (=> (not res!185791) (not e!149780))))

(assert (=> b!220556 (= res!185791 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220557 () Bool)

(declare-fun res!185794 () Bool)

(assert (=> b!220557 (=> (not res!185794) (not e!149781))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220557 (= res!185794 (validate_offset_bits!1 ((_ sign_extend 32) (size!4721 (buf!5268 lt!348482))) ((_ sign_extend 32) (currentByte!9901 lt!348482)) ((_ sign_extend 32) (currentBit!9896 lt!348482)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!220558 () Bool)

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220558 (= e!149781 (not (= (bvand (bvor acc!113 (ite (_2!10093 lt!348481) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!220559 () Bool)

(declare-fun res!185792 () Bool)

(assert (=> b!220559 (=> (not res!185792) (not e!149780))))

(assert (=> b!220559 (= res!185792 (validate_offset_bits!1 ((_ sign_extend 32) (size!4721 (buf!5268 bs!62))) ((_ sign_extend 32) (currentByte!9901 bs!62)) ((_ sign_extend 32) (currentBit!9896 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220560 () Bool)

(declare-fun res!185795 () Bool)

(assert (=> b!220560 (=> (not res!185795) (not e!149780))))

(assert (=> b!220560 (= res!185795 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!45594 res!185793) b!220559))

(assert (= (and b!220559 res!185792) b!220560))

(assert (= (and b!220560 res!185795) b!220556))

(assert (= (and b!220556 res!185791) b!220554))

(assert (= (and b!220554 res!185790) b!220557))

(assert (= (and b!220557 res!185794) b!220558))

(assert (= start!45594 b!220555))

(declare-fun m!339229 () Bool)

(assert (=> start!45594 m!339229))

(declare-fun m!339231 () Bool)

(assert (=> b!220559 m!339231))

(declare-fun m!339233 () Bool)

(assert (=> b!220557 m!339233))

(declare-fun m!339235 () Bool)

(assert (=> b!220558 m!339235))

(declare-fun m!339237 () Bool)

(assert (=> b!220554 m!339237))

(declare-fun m!339239 () Bool)

(assert (=> b!220554 m!339239))

(declare-fun m!339241 () Bool)

(assert (=> b!220554 m!339241))

(declare-fun m!339243 () Bool)

(assert (=> b!220555 m!339243))

(declare-fun m!339245 () Bool)

(assert (=> b!220560 m!339245))

(check-sat (not b!220560) (not b!220558) (not b!220559) (not b!220554) (not b!220557) (not b!220555) (not start!45594))
(check-sat)
(get-model)

(declare-fun d!74287 () Bool)

(declare-fun e!149796 () Bool)

(assert (=> d!74287 e!149796))

(declare-fun res!185816 () Bool)

(assert (=> d!74287 (=> (not res!185816) (not e!149796))))

(declare-fun lt!348497 () (_ BitVec 64))

(declare-fun lt!348496 () BitStream!8550)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74287 (= res!185816 (= (bvadd lt!348497 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4721 (buf!5268 lt!348496)) (currentByte!9901 lt!348496) (currentBit!9896 lt!348496))))))

(assert (=> d!74287 (or (not (= (bvand lt!348497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348497 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348497 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74287 (= lt!348497 (bitIndex!0 (size!4721 (buf!5268 bs!62)) (currentByte!9901 bs!62) (currentBit!9896 bs!62)))))

(declare-datatypes ((Unit!15607 0))(
  ( (Unit!15608) )
))
(declare-datatypes ((tuple2!18878 0))(
  ( (tuple2!18879 (_1!10097 Unit!15607) (_2!10097 BitStream!8550)) )
))
(declare-fun moveBitIndex!0 (BitStream!8550 (_ BitVec 64)) tuple2!18878)

(assert (=> d!74287 (= lt!348496 (_2!10097 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8550 (_ BitVec 64)) Bool)

(assert (=> d!74287 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74287 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348496)))

(declare-fun b!220584 () Bool)

(assert (=> b!220584 (= e!149796 (= (size!4721 (buf!5268 bs!62)) (size!4721 (buf!5268 lt!348496))))))

(assert (= (and d!74287 res!185816) b!220584))

(declare-fun m!339269 () Bool)

(assert (=> d!74287 m!339269))

(declare-fun m!339271 () Bool)

(assert (=> d!74287 m!339271))

(declare-fun m!339273 () Bool)

(assert (=> d!74287 m!339273))

(declare-fun m!339275 () Bool)

(assert (=> d!74287 m!339275))

(assert (=> b!220554 d!74287))

(declare-fun d!74299 () Bool)

(declare-datatypes ((tuple2!18880 0))(
  ( (tuple2!18881 (_1!10098 Bool) (_2!10098 BitStream!8550)) )
))
(declare-fun lt!348500 () tuple2!18880)

(declare-fun readBit!0 (BitStream!8550) tuple2!18880)

(assert (=> d!74299 (= lt!348500 (readBit!0 bs!62))))

(assert (=> d!74299 (= (readBitPure!0 bs!62) (tuple2!18871 (_2!10098 lt!348500) (_1!10098 lt!348500)))))

(declare-fun bs!18160 () Bool)

(assert (= bs!18160 d!74299))

(declare-fun m!339277 () Bool)

(assert (=> bs!18160 m!339277))

(assert (=> b!220554 d!74299))

(declare-fun d!74301 () Bool)

(declare-datatypes ((tuple2!18882 0))(
  ( (tuple2!18883 (_1!10099 (_ BitVec 64)) (_2!10099 BitStream!8550)) )
))
(declare-fun lt!348507 () tuple2!18882)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18882)

(assert (=> d!74301 (= lt!348507 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74301 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18873 (_2!10099 lt!348507) (_1!10099 lt!348507)))))

(declare-fun bs!18164 () Bool)

(assert (= bs!18164 d!74301))

(declare-fun m!339285 () Bool)

(assert (=> bs!18164 m!339285))

(assert (=> b!220554 d!74301))

(declare-fun d!74311 () Bool)

(assert (=> d!74311 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220560 d!74311))

(declare-fun d!74315 () Bool)

(assert (=> d!74315 (= (array_inv!4462 (buf!5268 bs!62)) (bvsge (size!4721 (buf!5268 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220555 d!74315))

(declare-fun d!74319 () Bool)

(assert (=> d!74319 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))))

(assert (=> b!220558 d!74319))

(declare-fun d!74321 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74321 (= (inv!12 bs!62) (invariant!0 (currentBit!9896 bs!62) (currentByte!9901 bs!62) (size!4721 (buf!5268 bs!62))))))

(declare-fun bs!18165 () Bool)

(assert (= bs!18165 d!74321))

(declare-fun m!339295 () Bool)

(assert (=> bs!18165 m!339295))

(assert (=> start!45594 d!74321))

(declare-fun d!74323 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74323 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4721 (buf!5268 bs!62))) ((_ sign_extend 32) (currentByte!9901 bs!62)) ((_ sign_extend 32) (currentBit!9896 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4721 (buf!5268 bs!62))) ((_ sign_extend 32) (currentByte!9901 bs!62)) ((_ sign_extend 32) (currentBit!9896 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18166 () Bool)

(assert (= bs!18166 d!74323))

(declare-fun m!339297 () Bool)

(assert (=> bs!18166 m!339297))

(assert (=> b!220559 d!74323))

(declare-fun d!74325 () Bool)

(assert (=> d!74325 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4721 (buf!5268 lt!348482))) ((_ sign_extend 32) (currentByte!9901 lt!348482)) ((_ sign_extend 32) (currentBit!9896 lt!348482)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4721 (buf!5268 lt!348482))) ((_ sign_extend 32) (currentByte!9901 lt!348482)) ((_ sign_extend 32) (currentBit!9896 lt!348482))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18167 () Bool)

(assert (= bs!18167 d!74325))

(declare-fun m!339299 () Bool)

(assert (=> bs!18167 m!339299))

(assert (=> b!220557 d!74325))

(check-sat (not d!74321) (not d!74323) (not d!74325) (not d!74301) (not d!74287) (not d!74299))
(check-sat)
