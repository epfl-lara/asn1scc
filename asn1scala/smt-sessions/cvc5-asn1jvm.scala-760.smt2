; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21796 () Bool)

(assert start!21796)

(declare-fun b!110097 () Bool)

(declare-fun res!90882 () Bool)

(declare-fun e!72170 () Bool)

(assert (=> b!110097 (=> (not res!90882) (not e!72170))))

(declare-datatypes ((array!5015 0))(
  ( (array!5016 (arr!2874 (Array (_ BitVec 32) (_ BitVec 8))) (size!2281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4036 0))(
  ( (BitStream!4037 (buf!2675 array!5015) (currentByte!5223 (_ BitVec 32)) (currentBit!5218 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4036)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110097 (= res!90882 (validate_offset_bits!1 ((_ sign_extend 32) (size!2281 (buf!2675 thiss!1305))) ((_ sign_extend 32) (currentByte!5223 thiss!1305)) ((_ sign_extend 32) (currentBit!5218 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!110098 () Bool)

(declare-fun e!72169 () Bool)

(declare-fun array_inv!2083 (array!5015) Bool)

(assert (=> b!110098 (= e!72169 (array_inv!2083 (buf!2675 thiss!1305)))))

(declare-fun b!110099 () Bool)

(declare-fun res!90881 () Bool)

(assert (=> b!110099 (=> (not res!90881) (not e!72170))))

(assert (=> b!110099 (= res!90881 (bvsge i!615 nBits!396))))

(declare-fun b!110100 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!110100 (= e!72170 (not (invariant!0 (currentBit!5218 thiss!1305) (currentByte!5223 thiss!1305) (size!2281 (buf!2675 thiss!1305)))))))

(declare-fun isPrefixOf!0 (BitStream!4036 BitStream!4036) Bool)

(assert (=> b!110100 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6727 0))(
  ( (Unit!6728) )
))
(declare-fun lt!166937 () Unit!6727)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4036) Unit!6727)

(assert (=> b!110100 (= lt!166937 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110101 () Bool)

(declare-fun res!90880 () Bool)

(assert (=> b!110101 (=> (not res!90880) (not e!72170))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110101 (= res!90880 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!90883 () Bool)

(assert (=> start!21796 (=> (not res!90883) (not e!72170))))

(assert (=> start!21796 (= res!90883 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21796 e!72170))

(assert (=> start!21796 true))

(declare-fun inv!12 (BitStream!4036) Bool)

(assert (=> start!21796 (and (inv!12 thiss!1305) e!72169)))

(assert (= (and start!21796 res!90883) b!110097))

(assert (= (and b!110097 res!90882) b!110101))

(assert (= (and b!110101 res!90880) b!110099))

(assert (= (and b!110099 res!90881) b!110100))

(assert (= start!21796 b!110098))

(declare-fun m!163697 () Bool)

(assert (=> b!110097 m!163697))

(declare-fun m!163699 () Bool)

(assert (=> b!110098 m!163699))

(declare-fun m!163701 () Bool)

(assert (=> b!110101 m!163701))

(declare-fun m!163703 () Bool)

(assert (=> b!110100 m!163703))

(declare-fun m!163705 () Bool)

(assert (=> b!110100 m!163705))

(declare-fun m!163707 () Bool)

(assert (=> b!110100 m!163707))

(declare-fun m!163709 () Bool)

(assert (=> start!21796 m!163709))

(push 1)

(assert (not b!110101))

(assert (not b!110098))

(assert (not b!110100))

(assert (not start!21796))

(assert (not b!110097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!34700 () Bool)

(assert (=> d!34700 (= (invariant!0 (currentBit!5218 thiss!1305) (currentByte!5223 thiss!1305) (size!2281 (buf!2675 thiss!1305))) (and (bvsge (currentBit!5218 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5218 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5223 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5223 thiss!1305) (size!2281 (buf!2675 thiss!1305))) (and (= (currentBit!5218 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5223 thiss!1305) (size!2281 (buf!2675 thiss!1305)))))))))

(assert (=> b!110100 d!34700))

(declare-fun d!34702 () Bool)

(declare-fun res!90925 () Bool)

(declare-fun e!72199 () Bool)

(assert (=> d!34702 (=> (not res!90925) (not e!72199))))

(assert (=> d!34702 (= res!90925 (= (size!2281 (buf!2675 thiss!1305)) (size!2281 (buf!2675 thiss!1305))))))

(assert (=> d!34702 (= (isPrefixOf!0 thiss!1305 thiss!1305) e!72199)))

(declare-fun b!110147 () Bool)

(declare-fun res!90924 () Bool)

(assert (=> b!110147 (=> (not res!90924) (not e!72199))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110147 (= res!90924 (bvsle (bitIndex!0 (size!2281 (buf!2675 thiss!1305)) (currentByte!5223 thiss!1305) (currentBit!5218 thiss!1305)) (bitIndex!0 (size!2281 (buf!2675 thiss!1305)) (currentByte!5223 thiss!1305) (currentBit!5218 thiss!1305))))))

(declare-fun b!110148 () Bool)

(declare-fun e!72200 () Bool)

(assert (=> b!110148 (= e!72199 e!72200)))

(declare-fun res!90923 () Bool)

(assert (=> b!110148 (=> res!90923 e!72200)))

(assert (=> b!110148 (= res!90923 (= (size!2281 (buf!2675 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!110149 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5015 array!5015 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110149 (= e!72200 (arrayBitRangesEq!0 (buf!2675 thiss!1305) (buf!2675 thiss!1305) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2281 (buf!2675 thiss!1305)) (currentByte!5223 thiss!1305) (currentBit!5218 thiss!1305))))))

(assert (= (and d!34702 res!90925) b!110147))

(assert (= (and b!110147 res!90924) b!110148))

(assert (= (and b!110148 (not res!90923)) b!110149))

(declare-fun m!163745 () Bool)

(assert (=> b!110147 m!163745))

(assert (=> b!110147 m!163745))

(assert (=> b!110149 m!163745))

(assert (=> b!110149 m!163745))

(declare-fun m!163747 () Bool)

(assert (=> b!110149 m!163747))

(assert (=> b!110100 d!34702))

(declare-fun d!34718 () Bool)

(assert (=> d!34718 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!166949 () Unit!6727)

(declare-fun choose!11 (BitStream!4036) Unit!6727)

(assert (=> d!34718 (= lt!166949 (choose!11 thiss!1305))))

(assert (=> d!34718 (= (lemmaIsPrefixRefl!0 thiss!1305) lt!166949)))

(declare-fun bs!8487 () Bool)

(assert (= bs!8487 d!34718))

(assert (=> bs!8487 m!163705))

(declare-fun m!163753 () Bool)

(assert (=> bs!8487 m!163753))

(assert (=> b!110100 d!34718))

(declare-fun d!34726 () Bool)

(assert (=> d!34726 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5218 thiss!1305) (currentByte!5223 thiss!1305) (size!2281 (buf!2675 thiss!1305))))))

(declare-fun bs!8488 () Bool)

(assert (= bs!8488 d!34726))

(assert (=> bs!8488 m!163703))

(assert (=> start!21796 d!34726))

(declare-fun d!34728 () Bool)

(assert (=> d!34728 (= (array_inv!2083 (buf!2675 thiss!1305)) (bvsge (size!2281 (buf!2675 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!110098 d!34728))

(declare-fun d!34730 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!34730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2281 (buf!2675 thiss!1305))) ((_ sign_extend 32) (currentByte!5223 thiss!1305)) ((_ sign_extend 32) (currentBit!5218 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2281 (buf!2675 thiss!1305))) ((_ sign_extend 32) (currentByte!5223 thiss!1305)) ((_ sign_extend 32) (currentBit!5218 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8489 () Bool)

(assert (= bs!8489 d!34730))

(declare-fun m!163755 () Bool)

(assert (=> bs!8489 m!163755))

(assert (=> b!110097 d!34730))

(declare-fun d!34732 () Bool)

(assert (=> d!34732 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!110101 d!34732))

(push 1)

