; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45596 () Bool)

(assert start!45596)

(declare-fun b!220575 () Bool)

(declare-fun res!185808 () Bool)

(declare-fun e!149790 () Bool)

(assert (=> b!220575 (=> (not res!185808) (not e!149790))))

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220575 (= res!185808 (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113))))

(declare-fun b!220576 () Bool)

(declare-fun res!185813 () Bool)

(assert (=> b!220576 (=> (not res!185813) (not e!149790))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220576 (= res!185813 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220577 () Bool)

(declare-fun e!149793 () Bool)

(declare-datatypes ((array!10754 0))(
  ( (array!10755 (arr!5652 (Array (_ BitVec 32) (_ BitVec 8))) (size!4722 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8552 0))(
  ( (BitStream!8553 (buf!5269 array!10754) (currentByte!9902 (_ BitVec 32)) (currentBit!9897 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18874 0))(
  ( (tuple2!18875 (_1!10095 BitStream!8552) (_2!10095 Bool)) )
))
(declare-fun lt!348491 () tuple2!18874)

(assert (=> b!220577 (= e!149793 (not (= (bvand (bvor acc!113 (ite (_2!10095 lt!348491) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!541)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!220578 () Bool)

(assert (=> b!220578 (= e!149790 e!149793)))

(declare-fun res!185809 () Bool)

(assert (=> b!220578 (=> (not res!185809) (not e!149793))))

(assert (=> b!220578 (= res!185809 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!541)))))

(declare-fun lt!348489 () BitStream!8552)

(declare-fun bs!62 () BitStream!8552)

(declare-fun withMovedBitIndex!0 (BitStream!8552 (_ BitVec 64)) BitStream!8552)

(assert (=> b!220578 (= lt!348489 (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!8552) tuple2!18874)

(assert (=> b!220578 (= lt!348491 (readBitPure!0 bs!62))))

(declare-fun nBits!265 () (_ BitVec 32))

(declare-datatypes ((tuple2!18876 0))(
  ( (tuple2!18877 (_1!10096 BitStream!8552) (_2!10096 (_ BitVec 64))) )
))
(declare-fun lt!348490 () tuple2!18876)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18876)

(assert (=> b!220578 (= lt!348490 (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113))))

(declare-fun b!220579 () Bool)

(declare-fun res!185810 () Bool)

(assert (=> b!220579 (=> (not res!185810) (not e!149793))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220579 (= res!185810 (validate_offset_bits!1 ((_ sign_extend 32) (size!4722 (buf!5269 lt!348489))) ((_ sign_extend 32) (currentByte!9902 lt!348489)) ((_ sign_extend 32) (currentBit!9897 lt!348489)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun b!220580 () Bool)

(declare-fun res!185812 () Bool)

(assert (=> b!220580 (=> (not res!185812) (not e!149790))))

(assert (=> b!220580 (= res!185812 (validate_offset_bits!1 ((_ sign_extend 32) (size!4722 (buf!5269 bs!62))) ((_ sign_extend 32) (currentByte!9902 bs!62)) ((_ sign_extend 32) (currentBit!9897 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!185811 () Bool)

(assert (=> start!45596 (=> (not res!185811) (not e!149790))))

(assert (=> start!45596 (= res!185811 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45596 e!149790))

(assert (=> start!45596 true))

(declare-fun e!149791 () Bool)

(declare-fun inv!12 (BitStream!8552) Bool)

(assert (=> start!45596 (and (inv!12 bs!62) e!149791)))

(declare-fun b!220581 () Bool)

(declare-fun array_inv!4463 (array!10754) Bool)

(assert (=> b!220581 (= e!149791 (array_inv!4463 (buf!5269 bs!62)))))

(assert (= (and start!45596 res!185811) b!220580))

(assert (= (and b!220580 res!185812) b!220576))

(assert (= (and b!220576 res!185813) b!220575))

(assert (= (and b!220575 res!185808) b!220578))

(assert (= (and b!220578 res!185809) b!220579))

(assert (= (and b!220579 res!185810) b!220577))

(assert (= start!45596 b!220581))

(declare-fun m!339247 () Bool)

(assert (=> b!220579 m!339247))

(declare-fun m!339249 () Bool)

(assert (=> b!220580 m!339249))

(declare-fun m!339251 () Bool)

(assert (=> start!45596 m!339251))

(declare-fun m!339253 () Bool)

(assert (=> b!220577 m!339253))

(declare-fun m!339255 () Bool)

(assert (=> b!220576 m!339255))

(declare-fun m!339257 () Bool)

(assert (=> b!220578 m!339257))

(declare-fun m!339259 () Bool)

(assert (=> b!220578 m!339259))

(declare-fun m!339261 () Bool)

(assert (=> b!220578 m!339261))

(declare-fun m!339263 () Bool)

(assert (=> b!220581 m!339263))

(push 1)

(assert (not b!220580))

(assert (not b!220577))

(assert (not b!220579))

(assert (not b!220576))

(assert (not start!45596))

(assert (not b!220578))

(assert (not b!220581))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!74303 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!74303 (= (inv!12 bs!62) (invariant!0 (currentBit!9897 bs!62) (currentByte!9902 bs!62) (size!4722 (buf!5269 bs!62))))))

(declare-fun bs!18161 () Bool)

(assert (= bs!18161 d!74303))

(declare-fun m!339279 () Bool)

(assert (=> bs!18161 m!339279))

(assert (=> start!45596 d!74303))

(declare-fun d!74305 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!74305 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4722 (buf!5269 bs!62))) ((_ sign_extend 32) (currentByte!9902 bs!62)) ((_ sign_extend 32) (currentBit!9897 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4722 (buf!5269 bs!62))) ((_ sign_extend 32) (currentByte!9902 bs!62)) ((_ sign_extend 32) (currentBit!9897 bs!62))) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun bs!18162 () Bool)

(assert (= bs!18162 d!74305))

(declare-fun m!339281 () Bool)

(assert (=> bs!18162 m!339281))

(assert (=> b!220580 d!74305))

(declare-fun d!74307 () Bool)

(assert (=> d!74307 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4722 (buf!5269 lt!348489))) ((_ sign_extend 32) (currentByte!9902 lt!348489)) ((_ sign_extend 32) (currentBit!9897 lt!348489)) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4722 (buf!5269 lt!348489))) ((_ sign_extend 32) (currentByte!9902 lt!348489)) ((_ sign_extend 32) (currentBit!9897 lt!348489))) ((_ sign_extend 32) (bvsub nBits!265 (bvadd #b00000000000000000000000000000001 i!541)))))))

(declare-fun bs!18163 () Bool)

(assert (= bs!18163 d!74307))

(declare-fun m!339283 () Bool)

(assert (=> bs!18163 m!339283))

(assert (=> b!220579 d!74307))

(declare-fun d!74309 () Bool)

(assert (=> d!74309 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541))) (ite (= (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!541)))))))))

(assert (=> b!220577 d!74309))

(declare-fun d!74313 () Bool)

(declare-fun e!149802 () Bool)

(assert (=> d!74313 e!149802))

(declare-fun res!185822 () Bool)

(assert (=> d!74313 (=> (not res!185822) (not e!149802))))

(declare-fun lt!348521 () (_ BitVec 64))

(declare-fun lt!348520 () BitStream!8552)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!74313 (= res!185822 (= (bvadd lt!348521 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4722 (buf!5269 lt!348520)) (currentByte!9902 lt!348520) (currentBit!9897 lt!348520))))))

(assert (=> d!74313 (or (not (= (bvand lt!348521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!348521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!348521 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74313 (= lt!348521 (bitIndex!0 (size!4722 (buf!5269 bs!62)) (currentByte!9902 bs!62) (currentBit!9897 bs!62)))))

(declare-datatypes ((Unit!15611 0))(
  ( (Unit!15612) )
))
(declare-datatypes ((tuple2!18890 0))(
  ( (tuple2!18891 (_1!10103 Unit!15611) (_2!10103 BitStream!8552)) )
))
(declare-fun moveBitIndex!0 (BitStream!8552 (_ BitVec 64)) tuple2!18890)

(assert (=> d!74313 (= lt!348520 (_2!10103 (moveBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!8552 (_ BitVec 64)) Bool)

(assert (=> d!74313 (moveBitIndexPrecond!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!74313 (= (withMovedBitIndex!0 bs!62 #b0000000000000000000000000000000000000000000000000000000000000001) lt!348520)))

(declare-fun b!220590 () Bool)

(assert (=> b!220590 (= e!149802 (= (size!4722 (buf!5269 bs!62)) (size!4722 (buf!5269 lt!348520))))))

(assert (= (and d!74313 res!185822) b!220590))

(declare-fun m!339307 () Bool)

(assert (=> d!74313 m!339307))

(declare-fun m!339309 () Bool)

(assert (=> d!74313 m!339309))

(declare-fun m!339311 () Bool)

(assert (=> d!74313 m!339311))

(declare-fun m!339313 () Bool)

(assert (=> d!74313 m!339313))

(assert (=> b!220578 d!74313))

(declare-fun d!74333 () Bool)

(declare-datatypes ((tuple2!18892 0))(
  ( (tuple2!18893 (_1!10104 Bool) (_2!10104 BitStream!8552)) )
))
(declare-fun lt!348524 () tuple2!18892)

(declare-fun readBit!0 (BitStream!8552) tuple2!18892)

(assert (=> d!74333 (= lt!348524 (readBit!0 bs!62))))

(assert (=> d!74333 (= (readBitPure!0 bs!62) (tuple2!18875 (_2!10104 lt!348524) (_1!10104 lt!348524)))))

(declare-fun bs!18171 () Bool)

(assert (= bs!18171 d!74333))

(declare-fun m!339315 () Bool)

(assert (=> bs!18171 m!339315))

(assert (=> b!220578 d!74333))

(declare-fun d!74335 () Bool)

(declare-datatypes ((tuple2!18894 0))(
  ( (tuple2!18895 (_1!10105 (_ BitVec 64)) (_2!10105 BitStream!8552)) )
))
(declare-fun lt!348527 () tuple2!18894)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!8552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18894)

(assert (=> d!74335 (= lt!348527 (readNBitsLSBFirstsLoop!0 bs!62 nBits!265 i!541 acc!113))))

(assert (=> d!74335 (= (readNBitsLSBFirstsLoopPure!0 bs!62 nBits!265 i!541 acc!113) (tuple2!18877 (_2!10105 lt!348527) (_1!10105 lt!348527)))))

(declare-fun bs!18172 () Bool)

(assert (= bs!18172 d!74335))

(declare-fun m!339317 () Bool)

(assert (=> bs!18172 m!339317))

(assert (=> b!220578 d!74335))

(declare-fun d!74337 () Bool)

(assert (=> d!74337 (= (array_inv!4463 (buf!5269 bs!62)) (bvsge (size!4722 (buf!5269 bs!62)) #b00000000000000000000000000000000))))

(assert (=> b!220581 d!74337))

(declare-fun d!74339 () Bool)

(assert (=> d!74339 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541)) (ite (= (bvsub #b00000000000000000000000001000000 i!541) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!541))))))))

(assert (=> b!220576 d!74339))

(push 1)

(assert (not d!74307))

(assert (not d!74335))

(assert (not d!74305))

(assert (not d!74303))

(assert (not d!74313))

(assert (not d!74333))

(check-sat)

(pop 1)

(push 1)

(check-sat)

