; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18962 () Bool)

(assert start!18962)

(declare-fun b!94783 () Bool)

(declare-fun res!78076 () Bool)

(declare-fun e!62157 () Bool)

(assert (=> b!94783 (=> (not res!78076) (not e!62157))))

(declare-datatypes ((array!4431 0))(
  ( (array!4432 (arr!2625 (Array (_ BitVec 32) (_ BitVec 8))) (size!2017 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3538 0))(
  ( (BitStream!3539 (buf!2378 array!4431) (currentByte!4741 (_ BitVec 32)) (currentBit!4736 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3538)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94783 (= res!78076 (validate_offset_bits!1 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))) ((_ sign_extend 32) (currentByte!4741 bitStream1!8)) ((_ sign_extend 32) (currentBit!4736 bitStream1!8)) nBits!484))))

(declare-fun b!94784 () Bool)

(declare-fun res!78074 () Bool)

(assert (=> b!94784 (=> (not res!78074) (not e!62157))))

(declare-fun bitStream2!8 () BitStream!3538)

(assert (=> b!94784 (= res!78074 (validate_offset_bits!1 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))) ((_ sign_extend 32) (currentByte!4741 bitStream2!8)) ((_ sign_extend 32) (currentBit!4736 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94785 () Bool)

(declare-fun res!78081 () Bool)

(assert (=> b!94785 (=> (not res!78081) (not e!62157))))

(declare-datatypes ((List!875 0))(
  ( (Nil!872) (Cons!871 (h!990 Bool) (t!1625 List!875)) )
))
(declare-fun listBits!13 () List!875)

(declare-fun length!466 (List!875) Int)

(assert (=> b!94785 (= res!78081 (> (length!466 listBits!13) 0))))

(declare-fun b!94786 () Bool)

(declare-fun e!62156 () Bool)

(declare-fun thiss!1534 () BitStream!3538)

(declare-fun array_inv!1834 (array!4431) Bool)

(assert (=> b!94786 (= e!62156 (array_inv!1834 (buf!2378 thiss!1534)))))

(declare-fun b!94787 () Bool)

(declare-fun e!62158 () Bool)

(assert (=> b!94787 (= e!62158 (array_inv!1834 (buf!2378 bitStream2!8)))))

(declare-fun b!94788 () Bool)

(declare-fun e!62159 () Bool)

(assert (=> b!94788 (= e!62159 (array_inv!1834 (buf!2378 bitStream1!8)))))

(declare-fun b!94789 () Bool)

(assert (=> b!94789 (= e!62157 (= listBits!13 Nil!872))))

(declare-fun b!94791 () Bool)

(declare-fun res!78073 () Bool)

(assert (=> b!94791 (=> (not res!78073) (not e!62157))))

(assert (=> b!94791 (= res!78073 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94792 () Bool)

(declare-fun res!78072 () Bool)

(assert (=> b!94792 (=> (not res!78072) (not e!62157))))

(declare-datatypes ((tuple2!7666 0))(
  ( (tuple2!7667 (_1!4080 BitStream!3538) (_2!4080 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!3538) tuple2!7666)

(declare-fun head!587 (List!875) Bool)

(assert (=> b!94792 (= res!78072 (= (_2!4080 (readBitPure!0 bitStream1!8)) (head!587 listBits!13)))))

(declare-fun b!94793 () Bool)

(declare-fun res!78079 () Bool)

(assert (=> b!94793 (=> (not res!78079) (not e!62157))))

(declare-fun base!8 () BitStream!3538)

(declare-fun isPrefixOf!0 (BitStream!3538 BitStream!3538) Bool)

(assert (=> b!94793 (= res!78079 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94794 () Bool)

(declare-fun res!78069 () Bool)

(assert (=> b!94794 (=> (not res!78069) (not e!62157))))

(assert (=> b!94794 (= res!78069 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!94795 () Bool)

(declare-fun res!78075 () Bool)

(assert (=> b!94795 (=> (not res!78075) (not e!62157))))

(assert (=> b!94795 (= res!78075 (and (= (buf!2378 bitStream1!8) (buf!2378 bitStream2!8)) (= (buf!2378 bitStream1!8) (buf!2378 base!8))))))

(declare-fun b!94796 () Bool)

(declare-fun res!78071 () Bool)

(assert (=> b!94796 (=> (not res!78071) (not e!62157))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94796 (= res!78071 (bvslt (bitIndex!0 (size!2017 (buf!2378 base!8)) (currentByte!4741 base!8) (currentBit!4736 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94797 () Bool)

(declare-fun e!62154 () Bool)

(assert (=> b!94797 (= e!62154 (array_inv!1834 (buf!2378 base!8)))))

(declare-fun b!94798 () Bool)

(declare-fun res!78078 () Bool)

(assert (=> b!94798 (=> (not res!78078) (not e!62157))))

(assert (=> b!94798 (= res!78078 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8))) (bitIndex!0 (size!2017 (buf!2378 bitStream2!8)) (currentByte!4741 bitStream2!8) (currentBit!4736 bitStream2!8))))))

(declare-fun b!94799 () Bool)

(declare-fun res!78080 () Bool)

(assert (=> b!94799 (=> (not res!78080) (not e!62157))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3538 BitStream!3538 (_ BitVec 64)) List!875)

(assert (=> b!94799 (= res!78080 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94790 () Bool)

(declare-fun res!78077 () Bool)

(assert (=> b!94790 (=> (not res!78077) (not e!62157))))

(assert (=> b!94790 (= res!78077 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!78070 () Bool)

(assert (=> start!18962 (=> (not res!78070) (not e!62157))))

(assert (=> start!18962 (= res!78070 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18962 e!62157))

(assert (=> start!18962 true))

(declare-fun inv!12 (BitStream!3538) Bool)

(assert (=> start!18962 (and (inv!12 bitStream1!8) e!62159)))

(assert (=> start!18962 (and (inv!12 bitStream2!8) e!62158)))

(assert (=> start!18962 (and (inv!12 base!8) e!62154)))

(assert (=> start!18962 (and (inv!12 thiss!1534) e!62156)))

(assert (= (and start!18962 res!78070) b!94785))

(assert (= (and b!94785 res!78081) b!94793))

(assert (= (and b!94793 res!78079) b!94790))

(assert (= (and b!94790 res!78077) b!94794))

(assert (= (and b!94794 res!78069) b!94795))

(assert (= (and b!94795 res!78075) b!94796))

(assert (= (and b!94796 res!78071) b!94798))

(assert (= (and b!94798 res!78078) b!94783))

(assert (= (and b!94783 res!78076) b!94784))

(assert (= (and b!94784 res!78074) b!94799))

(assert (= (and b!94799 res!78080) b!94791))

(assert (= (and b!94791 res!78073) b!94792))

(assert (= (and b!94792 res!78072) b!94789))

(assert (= start!18962 b!94788))

(assert (= start!18962 b!94787))

(assert (= start!18962 b!94797))

(assert (= start!18962 b!94786))

(declare-fun m!138305 () Bool)

(assert (=> b!94788 m!138305))

(declare-fun m!138307 () Bool)

(assert (=> b!94792 m!138307))

(declare-fun m!138309 () Bool)

(assert (=> b!94792 m!138309))

(declare-fun m!138311 () Bool)

(assert (=> b!94784 m!138311))

(declare-fun m!138313 () Bool)

(assert (=> start!18962 m!138313))

(declare-fun m!138315 () Bool)

(assert (=> start!18962 m!138315))

(declare-fun m!138317 () Bool)

(assert (=> start!18962 m!138317))

(declare-fun m!138319 () Bool)

(assert (=> start!18962 m!138319))

(declare-fun m!138321 () Bool)

(assert (=> b!94798 m!138321))

(declare-fun m!138323 () Bool)

(assert (=> b!94798 m!138323))

(declare-fun m!138325 () Bool)

(assert (=> b!94790 m!138325))

(declare-fun m!138327 () Bool)

(assert (=> b!94796 m!138327))

(declare-fun m!138329 () Bool)

(assert (=> b!94799 m!138329))

(declare-fun m!138331 () Bool)

(assert (=> b!94783 m!138331))

(declare-fun m!138333 () Bool)

(assert (=> b!94785 m!138333))

(declare-fun m!138335 () Bool)

(assert (=> b!94787 m!138335))

(declare-fun m!138337 () Bool)

(assert (=> b!94794 m!138337))

(declare-fun m!138339 () Bool)

(assert (=> b!94797 m!138339))

(declare-fun m!138341 () Bool)

(assert (=> b!94793 m!138341))

(declare-fun m!138343 () Bool)

(assert (=> b!94786 m!138343))

(push 1)

(assert (not b!94794))

(assert (not b!94799))

(assert (not b!94790))

(assert (not b!94788))

(assert (not b!94787))

(assert (not b!94783))

(assert (not b!94793))

(assert (not b!94785))

(assert (not b!94792))

(assert (not b!94798))

(assert (not b!94796))

(assert (not b!94786))

(assert (not start!18962))

(assert (not b!94784))

(assert (not b!94797))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29478 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29478 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))) ((_ sign_extend 32) (currentByte!4741 bitStream1!8)) ((_ sign_extend 32) (currentBit!4736 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))) ((_ sign_extend 32) (currentByte!4741 bitStream1!8)) ((_ sign_extend 32) (currentBit!4736 bitStream1!8))) nBits!484))))

(declare-fun bs!7255 () Bool)

(assert (= bs!7255 d!29478))

(declare-fun m!138455 () Bool)

(assert (=> bs!7255 m!138455))

(assert (=> b!94783 d!29478))

(declare-fun d!29480 () Bool)

(declare-fun res!78193 () Bool)

(declare-fun e!62241 () Bool)

(assert (=> d!29480 (=> (not res!78193) (not e!62241))))

(assert (=> d!29480 (= res!78193 (= (size!2017 (buf!2378 bitStream1!8)) (size!2017 (buf!2378 base!8))))))

(assert (=> d!29480 (= (isPrefixOf!0 bitStream1!8 base!8) e!62241)))

(declare-fun b!94945 () Bool)

(declare-fun res!78191 () Bool)

(assert (=> b!94945 (=> (not res!78191) (not e!62241))))

(assert (=> b!94945 (= res!78191 (bvsle (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8)) (bitIndex!0 (size!2017 (buf!2378 base!8)) (currentByte!4741 base!8) (currentBit!4736 base!8))))))

(declare-fun b!94946 () Bool)

(declare-fun e!62240 () Bool)

(assert (=> b!94946 (= e!62241 e!62240)))

(declare-fun res!78192 () Bool)

(assert (=> b!94946 (=> res!78192 e!62240)))

(assert (=> b!94946 (= res!78192 (= (size!2017 (buf!2378 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94947 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4431 array!4431 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94947 (= e!62240 (arrayBitRangesEq!0 (buf!2378 bitStream1!8) (buf!2378 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8))))))

(assert (= (and d!29480 res!78193) b!94945))

(assert (= (and b!94945 res!78191) b!94946))

(assert (= (and b!94946 (not res!78192)) b!94947))

(assert (=> b!94945 m!138321))

(assert (=> b!94945 m!138327))

(assert (=> b!94947 m!138321))

(assert (=> b!94947 m!138321))

(declare-fun m!138457 () Bool)

(assert (=> b!94947 m!138457))

(assert (=> b!94793 d!29480))

(declare-fun d!29482 () Bool)

(assert (=> d!29482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))) ((_ sign_extend 32) (currentByte!4741 bitStream2!8)) ((_ sign_extend 32) (currentBit!4736 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))) ((_ sign_extend 32) (currentByte!4741 bitStream2!8)) ((_ sign_extend 32) (currentBit!4736 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7256 () Bool)

(assert (= bs!7256 d!29482))

(declare-fun m!138459 () Bool)

(assert (=> bs!7256 m!138459))

(assert (=> b!94784 d!29482))

(declare-fun d!29484 () Bool)

(declare-fun res!78196 () Bool)

(declare-fun e!62243 () Bool)

(assert (=> d!29484 (=> (not res!78196) (not e!62243))))

(assert (=> d!29484 (= res!78196 (= (size!2017 (buf!2378 bitStream1!8)) (size!2017 (buf!2378 bitStream2!8))))))

(assert (=> d!29484 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!62243)))

(declare-fun b!94948 () Bool)

(declare-fun res!78194 () Bool)

(assert (=> b!94948 (=> (not res!78194) (not e!62243))))

(assert (=> b!94948 (= res!78194 (bvsle (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8)) (bitIndex!0 (size!2017 (buf!2378 bitStream2!8)) (currentByte!4741 bitStream2!8) (currentBit!4736 bitStream2!8))))))

(declare-fun b!94949 () Bool)

(declare-fun e!62242 () Bool)

(assert (=> b!94949 (= e!62243 e!62242)))

(declare-fun res!78195 () Bool)

(assert (=> b!94949 (=> res!78195 e!62242)))

(assert (=> b!94949 (= res!78195 (= (size!2017 (buf!2378 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!94950 () Bool)

(assert (=> b!94950 (= e!62242 (arrayBitRangesEq!0 (buf!2378 bitStream1!8) (buf!2378 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8))))))

(assert (= (and d!29484 res!78196) b!94948))

(assert (= (and b!94948 res!78194) b!94949))

(assert (= (and b!94949 (not res!78195)) b!94950))

(assert (=> b!94948 m!138321))

(assert (=> b!94948 m!138323))

(assert (=> b!94950 m!138321))

(assert (=> b!94950 m!138321))

(declare-fun m!138461 () Bool)

(assert (=> b!94950 m!138461))

(assert (=> b!94794 d!29484))

(declare-fun d!29486 () Bool)

(declare-fun e!62250 () Bool)

(assert (=> d!29486 e!62250))

(declare-fun res!78208 () Bool)

(assert (=> d!29486 (=> (not res!78208) (not e!62250))))

(declare-fun lt!138905 () (_ BitVec 64))

(declare-fun lt!138904 () (_ BitVec 64))

(declare-fun lt!138907 () (_ BitVec 64))

(assert (=> d!29486 (= res!78208 (= lt!138904 (bvsub lt!138905 lt!138907)))))

(assert (=> d!29486 (or (= (bvand lt!138905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138907 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138905 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138905 lt!138907) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29486 (= lt!138907 (remainingBits!0 ((_ sign_extend 32) (size!2017 (buf!2378 base!8))) ((_ sign_extend 32) (currentByte!4741 base!8)) ((_ sign_extend 32) (currentBit!4736 base!8))))))

(declare-fun lt!138906 () (_ BitVec 64))

(declare-fun lt!138909 () (_ BitVec 64))

(assert (=> d!29486 (= lt!138905 (bvmul lt!138906 lt!138909))))

(assert (=> d!29486 (or (= lt!138906 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138909 (bvsdiv (bvmul lt!138906 lt!138909) lt!138906)))))

(assert (=> d!29486 (= lt!138909 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29486 (= lt!138906 ((_ sign_extend 32) (size!2017 (buf!2378 base!8))))))

(assert (=> d!29486 (= lt!138904 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4741 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4736 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29486 (invariant!0 (currentBit!4736 base!8) (currentByte!4741 base!8) (size!2017 (buf!2378 base!8)))))

(assert (=> d!29486 (= (bitIndex!0 (size!2017 (buf!2378 base!8)) (currentByte!4741 base!8) (currentBit!4736 base!8)) lt!138904)))

(declare-fun b!94961 () Bool)

(declare-fun res!78207 () Bool)

(assert (=> b!94961 (=> (not res!78207) (not e!62250))))

(assert (=> b!94961 (= res!78207 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138904))))

(declare-fun b!94962 () Bool)

(declare-fun lt!138908 () (_ BitVec 64))

(assert (=> b!94962 (= e!62250 (bvsle lt!138904 (bvmul lt!138908 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94962 (or (= lt!138908 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138908 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138908)))))

(assert (=> b!94962 (= lt!138908 ((_ sign_extend 32) (size!2017 (buf!2378 base!8))))))

(assert (= (and d!29486 res!78208) b!94961))

(assert (= (and b!94961 res!78207) b!94962))

(declare-fun m!138463 () Bool)

(assert (=> d!29486 m!138463))

(declare-fun m!138465 () Bool)

(assert (=> d!29486 m!138465))

(assert (=> b!94796 d!29486))

(declare-fun d!29492 () Bool)

(declare-fun size!2021 (List!875) Int)

(assert (=> d!29492 (= (length!466 listBits!13) (size!2021 listBits!13))))

(declare-fun bs!7257 () Bool)

(assert (= bs!7257 d!29492))

(declare-fun m!138467 () Bool)

(assert (=> bs!7257 m!138467))

(assert (=> b!94785 d!29492))

(declare-fun d!29494 () Bool)

(assert (=> d!29494 (= (array_inv!1834 (buf!2378 bitStream2!8)) (bvsge (size!2017 (buf!2378 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!94787 d!29494))

(declare-fun d!29496 () Bool)

(assert (=> d!29496 (= (array_inv!1834 (buf!2378 thiss!1534)) (bvsge (size!2017 (buf!2378 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!94786 d!29496))

(declare-fun d!29500 () Bool)

(assert (=> d!29500 (= (array_inv!1834 (buf!2378 base!8)) (bvsge (size!2017 (buf!2378 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!94797 d!29500))

(declare-fun d!29502 () Bool)

(assert (=> d!29502 (= (array_inv!1834 (buf!2378 bitStream1!8)) (bvsge (size!2017 (buf!2378 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!94788 d!29502))

(declare-fun b!94982 () Bool)

(declare-datatypes ((tuple2!7676 0))(
  ( (tuple2!7677 (_1!4085 List!875) (_2!4085 BitStream!3538)) )
))
(declare-fun e!62262 () tuple2!7676)

(assert (=> b!94982 (= e!62262 (tuple2!7677 Nil!872 bitStream1!8))))

(declare-fun lt!138922 () (_ BitVec 64))

(declare-datatypes ((tuple2!7678 0))(
  ( (tuple2!7679 (_1!4086 Bool) (_2!4086 BitStream!3538)) )
))
(declare-fun lt!138924 () tuple2!7678)

(declare-fun b!94983 () Bool)

(assert (=> b!94983 (= e!62262 (tuple2!7677 (Cons!871 (_1!4086 lt!138924) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4086 lt!138924) (bvsub nBits!484 lt!138922))) (_2!4086 lt!138924)))))

(declare-fun readBit!0 (BitStream!3538) tuple2!7678)

(assert (=> b!94983 (= lt!138924 (readBit!0 bitStream1!8))))

(assert (=> b!94983 (= lt!138922 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!94985 () Bool)

(declare-fun e!62261 () Bool)

(declare-fun lt!138923 () List!875)

(assert (=> b!94985 (= e!62261 (> (length!466 lt!138923) 0))))

(declare-fun b!94984 () Bool)

(declare-fun isEmpty!258 (List!875) Bool)

(assert (=> b!94984 (= e!62261 (isEmpty!258 lt!138923))))

(declare-fun d!29504 () Bool)

(assert (=> d!29504 e!62261))

(declare-fun c!5971 () Bool)

(assert (=> d!29504 (= c!5971 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29504 (= lt!138923 (_1!4085 e!62262))))

(declare-fun c!5970 () Bool)

(assert (=> d!29504 (= c!5970 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29504 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29504 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138923)))

(assert (= (and d!29504 c!5970) b!94982))

(assert (= (and d!29504 (not c!5970)) b!94983))

(assert (= (and d!29504 c!5971) b!94984))

(assert (= (and d!29504 (not c!5971)) b!94985))

(declare-fun m!138471 () Bool)

(assert (=> b!94983 m!138471))

(declare-fun m!138475 () Bool)

(assert (=> b!94983 m!138475))

(declare-fun m!138479 () Bool)

(assert (=> b!94985 m!138479))

(declare-fun m!138481 () Bool)

(assert (=> b!94984 m!138481))

(assert (=> b!94799 d!29504))

(declare-fun d!29506 () Bool)

(declare-fun e!62267 () Bool)

(assert (=> d!29506 e!62267))

(declare-fun res!78216 () Bool)

(assert (=> d!29506 (=> (not res!78216) (not e!62267))))

(declare-fun lt!138928 () (_ BitVec 64))

(declare-fun lt!138929 () (_ BitVec 64))

(declare-fun lt!138931 () (_ BitVec 64))

(assert (=> d!29506 (= res!78216 (= lt!138928 (bvsub lt!138929 lt!138931)))))

(assert (=> d!29506 (or (= (bvand lt!138929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138929 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138929 lt!138931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29506 (= lt!138931 (remainingBits!0 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))) ((_ sign_extend 32) (currentByte!4741 bitStream1!8)) ((_ sign_extend 32) (currentBit!4736 bitStream1!8))))))

(declare-fun lt!138930 () (_ BitVec 64))

(declare-fun lt!138933 () (_ BitVec 64))

(assert (=> d!29506 (= lt!138929 (bvmul lt!138930 lt!138933))))

(assert (=> d!29506 (or (= lt!138930 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138933 (bvsdiv (bvmul lt!138930 lt!138933) lt!138930)))))

(assert (=> d!29506 (= lt!138933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29506 (= lt!138930 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))))))

(assert (=> d!29506 (= lt!138928 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4741 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4736 bitStream1!8))))))

(assert (=> d!29506 (invariant!0 (currentBit!4736 bitStream1!8) (currentByte!4741 bitStream1!8) (size!2017 (buf!2378 bitStream1!8)))))

(assert (=> d!29506 (= (bitIndex!0 (size!2017 (buf!2378 bitStream1!8)) (currentByte!4741 bitStream1!8) (currentBit!4736 bitStream1!8)) lt!138928)))

(declare-fun b!94993 () Bool)

(declare-fun res!78215 () Bool)

(assert (=> b!94993 (=> (not res!78215) (not e!62267))))

(assert (=> b!94993 (= res!78215 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138928))))

(declare-fun b!94994 () Bool)

(declare-fun lt!138932 () (_ BitVec 64))

(assert (=> b!94994 (= e!62267 (bvsle lt!138928 (bvmul lt!138932 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94994 (or (= lt!138932 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138932 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138932)))))

(assert (=> b!94994 (= lt!138932 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream1!8))))))

(assert (= (and d!29506 res!78216) b!94993))

(assert (= (and b!94993 res!78215) b!94994))

(assert (=> d!29506 m!138455))

(declare-fun m!138487 () Bool)

(assert (=> d!29506 m!138487))

(assert (=> b!94798 d!29506))

(declare-fun d!29510 () Bool)

(declare-fun e!62268 () Bool)

(assert (=> d!29510 e!62268))

(declare-fun res!78218 () Bool)

(assert (=> d!29510 (=> (not res!78218) (not e!62268))))

(declare-fun lt!138934 () (_ BitVec 64))

(declare-fun lt!138935 () (_ BitVec 64))

(declare-fun lt!138937 () (_ BitVec 64))

(assert (=> d!29510 (= res!78218 (= lt!138934 (bvsub lt!138935 lt!138937)))))

(assert (=> d!29510 (or (= (bvand lt!138935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138937 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138935 lt!138937) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29510 (= lt!138937 (remainingBits!0 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))) ((_ sign_extend 32) (currentByte!4741 bitStream2!8)) ((_ sign_extend 32) (currentBit!4736 bitStream2!8))))))

(declare-fun lt!138936 () (_ BitVec 64))

(declare-fun lt!138939 () (_ BitVec 64))

(assert (=> d!29510 (= lt!138935 (bvmul lt!138936 lt!138939))))

(assert (=> d!29510 (or (= lt!138936 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138939 (bvsdiv (bvmul lt!138936 lt!138939) lt!138936)))))

(assert (=> d!29510 (= lt!138939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29510 (= lt!138936 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))))))

(assert (=> d!29510 (= lt!138934 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4741 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4736 bitStream2!8))))))

(assert (=> d!29510 (invariant!0 (currentBit!4736 bitStream2!8) (currentByte!4741 bitStream2!8) (size!2017 (buf!2378 bitStream2!8)))))

(assert (=> d!29510 (= (bitIndex!0 (size!2017 (buf!2378 bitStream2!8)) (currentByte!4741 bitStream2!8) (currentBit!4736 bitStream2!8)) lt!138934)))

(declare-fun b!94995 () Bool)

(declare-fun res!78217 () Bool)

(assert (=> b!94995 (=> (not res!78217) (not e!62268))))

(assert (=> b!94995 (= res!78217 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138934))))

(declare-fun b!94996 () Bool)

(declare-fun lt!138938 () (_ BitVec 64))

(assert (=> b!94996 (= e!62268 (bvsle lt!138934 (bvmul lt!138938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!94996 (or (= lt!138938 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138938 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138938)))))

(assert (=> b!94996 (= lt!138938 ((_ sign_extend 32) (size!2017 (buf!2378 bitStream2!8))))))

(assert (= (and d!29510 res!78218) b!94995))

(assert (= (and b!94995 res!78217) b!94996))

(assert (=> d!29510 m!138459))

(declare-fun m!138491 () Bool)

(assert (=> d!29510 m!138491))

(assert (=> b!94798 d!29510))

(declare-fun d!29514 () Bool)

(assert (=> d!29514 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4736 bitStream1!8) (currentByte!4741 bitStream1!8) (size!2017 (buf!2378 bitStream1!8))))))

(declare-fun bs!7259 () Bool)

(assert (= bs!7259 d!29514))

(assert (=> bs!7259 m!138487))

(assert (=> start!18962 d!29514))

(declare-fun d!29518 () Bool)

(assert (=> d!29518 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4736 bitStream2!8) (currentByte!4741 bitStream2!8) (size!2017 (buf!2378 bitStream2!8))))))

(declare-fun bs!7260 () Bool)

(assert (= bs!7260 d!29518))

(assert (=> bs!7260 m!138491))

(assert (=> start!18962 d!29518))

(declare-fun d!29520 () Bool)

(assert (=> d!29520 (= (inv!12 base!8) (invariant!0 (currentBit!4736 base!8) (currentByte!4741 base!8) (size!2017 (buf!2378 base!8))))))

(declare-fun bs!7261 () Bool)

(assert (= bs!7261 d!29520))

(assert (=> bs!7261 m!138465))

(assert (=> start!18962 d!29520))

(declare-fun d!29522 () Bool)

(assert (=> d!29522 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4736 thiss!1534) (currentByte!4741 thiss!1534) (size!2017 (buf!2378 thiss!1534))))))

(declare-fun bs!7262 () Bool)

(assert (= bs!7262 d!29522))

(declare-fun m!138495 () Bool)

(assert (=> bs!7262 m!138495))

(assert (=> start!18962 d!29522))

(declare-fun d!29524 () Bool)

(declare-fun res!78221 () Bool)

(declare-fun e!62270 () Bool)

(assert (=> d!29524 (=> (not res!78221) (not e!62270))))

(assert (=> d!29524 (= res!78221 (= (size!2017 (buf!2378 bitStream2!8)) (size!2017 (buf!2378 base!8))))))

(assert (=> d!29524 (= (isPrefixOf!0 bitStream2!8 base!8) e!62270)))

(declare-fun b!94997 () Bool)

(declare-fun res!78219 () Bool)

(assert (=> b!94997 (=> (not res!78219) (not e!62270))))

(assert (=> b!94997 (= res!78219 (bvsle (bitIndex!0 (size!2017 (buf!2378 bitStream2!8)) (currentByte!4741 bitStream2!8) (currentBit!4736 bitStream2!8)) (bitIndex!0 (size!2017 (buf!2378 base!8)) (currentByte!4741 base!8) (currentBit!4736 base!8))))))

(declare-fun b!94998 () Bool)

(declare-fun e!62269 () Bool)

(assert (=> b!94998 (= e!62270 e!62269)))

(declare-fun res!78220 () Bool)

(assert (=> b!94998 (=> res!78220 e!62269)))

(assert (=> b!94998 (= res!78220 (= (size!2017 (buf!2378 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!94999 () Bool)

(assert (=> b!94999 (= e!62269 (arrayBitRangesEq!0 (buf!2378 bitStream2!8) (buf!2378 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2017 (buf!2378 bitStream2!8)) (currentByte!4741 bitStream2!8) (currentBit!4736 bitStream2!8))))))

(assert (= (and d!29524 res!78221) b!94997))

(assert (= (and b!94997 res!78219) b!94998))

(assert (= (and b!94998 (not res!78220)) b!94999))

(assert (=> b!94997 m!138323))

(assert (=> b!94997 m!138327))

(assert (=> b!94999 m!138323))

(assert (=> b!94999 m!138323))

(declare-fun m!138497 () Bool)

(assert (=> b!94999 m!138497))

(assert (=> b!94790 d!29524))

(declare-fun d!29526 () Bool)

(declare-fun lt!138942 () tuple2!7678)

(assert (=> d!29526 (= lt!138942 (readBit!0 bitStream1!8))))

(assert (=> d!29526 (= (readBitPure!0 bitStream1!8) (tuple2!7667 (_2!4086 lt!138942) (_1!4086 lt!138942)))))

(declare-fun bs!7263 () Bool)

(assert (= bs!7263 d!29526))

(assert (=> bs!7263 m!138475))

(assert (=> b!94792 d!29526))

(declare-fun d!29528 () Bool)

(assert (=> d!29528 (= (head!587 listBits!13) (h!990 listBits!13))))

(assert (=> b!94792 d!29528))

(push 1)

(assert (not b!94985))

(assert (not d!29478))

(assert (not b!94984))

(assert (not b!94947))

(assert (not b!94999))

(assert (not d!29518))

(assert (not d!29520))

(assert (not d!29492))

(assert (not d!29514))

(assert (not d!29510))

(assert (not d!29526))

(assert (not b!94945))

(assert (not b!94983))

(assert (not d!29482))

(assert (not b!94997))

(assert (not d!29486))

(assert (not b!94950))

(assert (not d!29522))

(assert (not b!94948))

(assert (not d!29506))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

