; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21748 () Bool)

(assert start!21748)

(declare-fun b!110025 () Bool)

(declare-fun res!90818 () Bool)

(declare-fun e!72123 () Bool)

(assert (=> b!110025 (=> (not res!90818) (not e!72123))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110025 (= res!90818 (bvsge i!615 nBits!396))))

(declare-fun b!110026 () Bool)

(declare-datatypes ((array!5006 0))(
  ( (array!5007 (arr!2871 (Array (_ BitVec 32) (_ BitVec 8))) (size!2278 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4030 0))(
  ( (BitStream!4031 (buf!2672 array!5006) (currentByte!5214 (_ BitVec 32)) (currentBit!5209 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4030)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110026 (= e!72123 (not (invariant!0 (currentBit!5209 thiss!1305) (currentByte!5214 thiss!1305) (size!2278 (buf!2672 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4030 BitStream!4030) Bool)

(assert (=> b!110026 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6721 0))(
  ( (Unit!6722) )
))
(declare-fun lt!166919 () Unit!6721)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4030) Unit!6721)

(assert (=> b!110026 (= lt!166919 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110027 () Bool)

(declare-fun res!90819 () Bool)

(assert (=> b!110027 (=> (not res!90819) (not e!72123))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110027 (= res!90819 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110028 () Bool)

(declare-fun e!72124 () Bool)

(declare-fun array_inv!2080 (array!5006) Bool)

(assert (=> b!110028 (= e!72124 (array_inv!2080 (buf!2672 thiss!1305)))))

(declare-fun res!90820 () Bool)

(assert (=> start!21748 (=> (not res!90820) (not e!72123))))

(assert (=> start!21748 (= res!90820 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21748 e!72123))

(assert (=> start!21748 true))

(declare-fun inv!12 (BitStream!4030) Bool)

(assert (=> start!21748 (and (inv!12 thiss!1305) e!72124)))

(declare-fun b!110029 () Bool)

(declare-fun res!90817 () Bool)

(assert (=> b!110029 (=> (not res!90817) (not e!72123))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110029 (= res!90817 (validate_offset_bits!1 ((_ sign_extend 32) (size!2278 (buf!2672 thiss!1305))) ((_ sign_extend 32) (currentByte!5214 thiss!1305)) ((_ sign_extend 32) (currentBit!5209 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!21748 res!90820) b!110029))

(assert (= (and b!110029 res!90817) b!110027))

(assert (= (and b!110027 res!90819) b!110025))

(assert (= (and b!110025 res!90818) b!110026))

(assert (= start!21748 b!110028))

(declare-fun m!163631 () Bool)

(assert (=> b!110027 m!163631))

(declare-fun m!163633 () Bool)

(assert (=> start!21748 m!163633))

(declare-fun m!163635 () Bool)

(assert (=> b!110026 m!163635))

(declare-fun m!163637 () Bool)

(assert (=> b!110026 m!163637))

(declare-fun m!163639 () Bool)

(assert (=> b!110026 m!163639))

(declare-fun m!163641 () Bool)

(assert (=> b!110028 m!163641))

(declare-fun m!163643 () Bool)

(assert (=> b!110029 m!163643))

(push 1)

(assert (not start!21748))

(assert (not b!110026))

(assert (not b!110028))

(assert (not b!110029))

(assert (not b!110027))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34654 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34654 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2278 (buf!2672 thiss!1305))) ((_ sign_extend 32) (currentByte!5214 thiss!1305)) ((_ sign_extend 32) (currentBit!5209 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2278 (buf!2672 thiss!1305))) ((_ sign_extend 32) (currentByte!5214 thiss!1305)) ((_ sign_extend 32) (currentBit!5209 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8465 () Bool)

(assert (= bs!8465 d!34654))

(declare-fun m!163673 () Bool)

(assert (=> bs!8465 m!163673))

(assert (=> b!110029 d!34654))

(declare-fun d!34656 () Bool)

(assert (=> d!34656 (= (array_inv!2080 (buf!2672 thiss!1305)) (bvsge (size!2278 (buf!2672 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110028 d!34656))

(declare-fun d!34658 () Bool)

(assert (=> d!34658 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5209 thiss!1305) (currentByte!5214 thiss!1305) (size!2278 (buf!2672 thiss!1305))))))

(declare-fun bs!8466 () Bool)

(assert (= bs!8466 d!34658))

(assert (=> bs!8466 m!163635))

(assert (=> start!21748 d!34658))

(declare-fun d!34662 () Bool)

(assert (=> d!34662 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110027 d!34662))

(declare-fun d!34666 () Bool)

(assert (=> d!34666 (= (invariant!0 (currentBit!5209 thiss!1305) (currentByte!5214 thiss!1305) (size!2278 (buf!2672 thiss!1305))) (and (bvsge (currentBit!5209 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5209 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5214 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5214 thiss!1305) (size!2278 (buf!2672 thiss!1305))) (and (= (currentBit!5209 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5214 thiss!1305) (size!2278 (buf!2672 thiss!1305)))))))))

(assert (=> b!110026 d!34666))

(declare-fun d!34672 () Bool)

(declare-fun res!90861 () Bool)

(declare-fun e!72154 () Bool)

(assert (=> d!34672 (=> (not res!90861) (not e!72154))))

(assert (=> d!34672 (= res!90861 (= (size!2278 (buf!2672 thiss!1305)) (size!2278 (buf!2672 thiss!1305))))))

(assert (=> d!34672 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72154)))

(declare-fun b!110075 () Bool)

(declare-fun res!90860 () Bool)

(assert (=> b!110075 (=> (not res!90860) (not e!72154))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110075 (= res!90860 (bvsle (bitIndex!0 (size!2278 (buf!2672 thiss!1305)) (currentByte!5214 thiss!1305) (currentBit!5209 thiss!1305)) (bitIndex!0 (size!2278 (buf!2672 thiss!1305)) (currentByte!5214 thiss!1305) (currentBit!5209 thiss!1305))))))

(declare-fun b!110076 () Bool)

(declare-fun e!72155 () Bool)

(assert (=> b!110076 (= e!72154 e!72155)))

(declare-fun res!90862 () Bool)

(assert (=> b!110076 (=> res!90862 e!72155)))

(assert (=> b!110076 (= res!90862 (= (size!2278 (buf!2672 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110077 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5006 array!5006 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110077 (= e!72155 (arrayBitRangesEq!0 (buf!2672 thiss!1305) (buf!2672 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2278 (buf!2672 thiss!1305)) (currentByte!5214 thiss!1305) (currentBit!5209 thiss!1305))))))

(assert (= (and d!34672 res!90861) b!110075))

(assert (= (and b!110075 res!90860) b!110076))

(assert (= (and b!110076 (not res!90862)) b!110077))

(declare-fun m!163685 () Bool)

(assert (=> b!110075 m!163685))

(assert (=> b!110075 m!163685))

(assert (=> b!110077 m!163685))

(assert (=> b!110077 m!163685))

(declare-fun m!163687 () Bool)

(assert (=> b!110077 m!163687))

(assert (=> b!110026 d!34672))

(declare-fun d!34686 () Bool)

(assert (=> d!34686 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!166931 () Unit!6721)

(declare-fun choose!11 (BitStream!4030) Unit!6721)

(assert (=> d!34686 (= lt!166931 (choose!11 thiss!1305))))

(assert (=> d!34686 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!166931)))

(declare-fun bs!8474 () Bool)

(assert (= bs!8474 d!34686))

(assert (=> bs!8474 m!163637))

(declare-fun m!163693 () Bool)

(assert (=> bs!8474 m!163693))

(assert (=> b!110026 d!34686))

(push 1)

