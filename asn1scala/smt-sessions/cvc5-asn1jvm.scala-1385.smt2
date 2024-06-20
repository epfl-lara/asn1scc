; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38268 () Bool)

(assert start!38268)

(declare-fun res!142571 () Bool)

(declare-fun e!120237 () Bool)

(assert (=> start!38268 (=> (not res!142571) (not e!120237))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38268 (= res!142571 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38268 e!120237))

(assert (=> start!38268 true))

(declare-datatypes ((array!9213 0))(
  ( (array!9214 (arr!4999 (Array (_ BitVec 32) (_ BitVec 8))) (size!4069 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7246 0))(
  ( (BitStream!7247 (buf!4497 array!9213) (currentByte!8552 (_ BitVec 32)) (currentBit!8547 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7246)

(declare-fun e!120236 () Bool)

(declare-fun inv!12 (BitStream!7246) Bool)

(assert (=> start!38268 (and (inv!12 thiss!1817) e!120236)))

(declare-fun lt!265136 () (_ BitVec 64))

(declare-fun b!172073 () Bool)

(declare-fun lt!265135 () (_ BitVec 64))

(assert (=> b!172073 (= e!120237 (and (= lt!265136 (bvand ((_ sign_extend 32) nBits!575) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!265136 (bvand (bvadd lt!265135 ((_ sign_extend 32) nBits!575)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!172073 (= lt!265136 (bvand lt!265135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172073 (= lt!265135 (bitIndex!0 (size!4069 (buf!4497 thiss!1817)) (currentByte!8552 thiss!1817) (currentBit!8547 thiss!1817)))))

(declare-fun b!172074 () Bool)

(declare-fun array_inv!3810 (array!9213) Bool)

(assert (=> b!172074 (= e!120236 (array_inv!3810 (buf!4497 thiss!1817)))))

(declare-fun b!172071 () Bool)

(declare-fun res!142572 () Bool)

(assert (=> b!172071 (=> (not res!142572) (not e!120237))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172071 (= res!142572 (validate_offset_bits!1 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))) ((_ sign_extend 32) (currentByte!8552 thiss!1817)) ((_ sign_extend 32) (currentBit!8547 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!172072 () Bool)

(declare-fun res!142570 () Bool)

(assert (=> b!172072 (=> (not res!142570) (not e!120237))))

(declare-datatypes ((tuple2!14786 0))(
  ( (tuple2!14787 (_1!8035 (_ BitVec 64)) (_2!8035 BitStream!7246)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14786)

(assert (=> b!172072 (= res!142570 (= (buf!4497 (_2!8035 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4497 thiss!1817)))))

(assert (= (and start!38268 res!142571) b!172071))

(assert (= (and b!172071 res!142572) b!172072))

(assert (= (and b!172072 res!142570) b!172073))

(assert (= start!38268 b!172074))

(declare-fun m!271277 () Bool)

(assert (=> b!172073 m!271277))

(declare-fun m!271279 () Bool)

(assert (=> b!172071 m!271279))

(declare-fun m!271281 () Bool)

(assert (=> b!172072 m!271281))

(declare-fun m!271283 () Bool)

(assert (=> b!172074 m!271283))

(declare-fun m!271285 () Bool)

(assert (=> start!38268 m!271285))

(push 1)

(assert (not start!38268))

(assert (not b!172071))

(assert (not b!172072))

(assert (not b!172074))

(assert (not b!172073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!172155 () Bool)

(declare-fun res!142631 () Bool)

(declare-fun e!120281 () Bool)

(assert (=> b!172155 (=> (not res!142631) (not e!120281))))

(declare-fun lt!265225 () tuple2!14786)

(declare-fun lt!265223 () (_ BitVec 64))

(declare-fun lt!265224 () (_ BitVec 64))

(assert (=> b!172155 (= res!142631 (= (bvlshr (_1!8035 lt!265225) lt!265223) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265224)))))

(assert (=> b!172155 (and (bvsge lt!265224 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265224 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172155 (= lt!265224 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172155 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172155 (and (bvsge lt!265223 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265223 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172155 (= lt!265223 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172155 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun b!172156 () Bool)

(declare-fun e!120282 () tuple2!14786)

(declare-fun lt!265222 () tuple2!14786)

(assert (=> b!172156 (= e!120282 (tuple2!14787 (_1!8035 lt!265222) (_2!8035 lt!265222)))))

(declare-datatypes ((tuple2!14798 0))(
  ( (tuple2!14799 (_1!8041 Bool) (_2!8041 BitStream!7246)) )
))
(declare-fun lt!265227 () tuple2!14798)

(declare-fun readBit!0 (BitStream!7246) tuple2!14798)

(assert (=> b!172156 (= lt!265227 (readBit!0 thiss!1817))))

(assert (=> b!172156 (= lt!265222 (readNLeastSignificantBitsLoop!0 (_2!8041 lt!265227) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8041 lt!265227) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172157 () Bool)

(declare-fun res!142632 () Bool)

(assert (=> b!172157 (=> (not res!142632) (not e!120281))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172157 (= res!142632 (= (bvand (_1!8035 lt!265225) (onesLSBLong!0 nBits!575)) (_1!8035 lt!265225)))))

(declare-fun b!172158 () Bool)

(assert (=> b!172158 (= e!120282 (tuple2!14787 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun e!120283 () Bool)

(declare-fun b!172159 () Bool)

(declare-fun lt!265229 () (_ BitVec 64))

(declare-datatypes ((tuple2!14800 0))(
  ( (tuple2!14801 (_1!8042 BitStream!7246) (_2!8042 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7246) tuple2!14800)

(assert (=> b!172159 (= e!120283 (= (= (bvand (bvlshr (_1!8035 lt!265225) lt!265229) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8042 (readBitPure!0 thiss!1817))))))

(assert (=> b!172159 (and (bvsge lt!265229 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265229 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265221 () (_ BitVec 32))

(assert (=> b!172159 (= lt!265229 ((_ sign_extend 32) (bvsub lt!265221 #b00000000000000000000000000000000)))))

(assert (=> b!172159 (or (= (bvand lt!265221 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265221 #b10000000000000000000000000000000) (bvand (bvsub lt!265221 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172159 (= lt!265221 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172159 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172160 () Bool)

(assert (=> b!172160 (= e!120281 e!120283)))

(declare-fun res!142634 () Bool)

(assert (=> b!172160 (=> res!142634 e!120283)))

(assert (=> b!172160 (= res!142634 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172161 () Bool)

(declare-fun res!142635 () Bool)

(assert (=> b!172161 (=> (not res!142635) (not e!120281))))

(declare-fun lt!265228 () (_ BitVec 64))

(declare-fun lt!265226 () (_ BitVec 64))

(assert (=> b!172161 (= res!142635 (= (bitIndex!0 (size!4069 (buf!4497 (_2!8035 lt!265225))) (currentByte!8552 (_2!8035 lt!265225)) (currentBit!8547 (_2!8035 lt!265225))) (bvadd lt!265228 lt!265226)))))

(assert (=> b!172161 (or (not (= (bvand lt!265228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265226 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265228 lt!265226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172161 (= lt!265226 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172161 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172161 (= lt!265228 (bitIndex!0 (size!4069 (buf!4497 thiss!1817)) (currentByte!8552 thiss!1817) (currentBit!8547 thiss!1817)))))

(declare-fun d!61003 () Bool)

(assert (=> d!61003 e!120281))

(declare-fun res!142633 () Bool)

(assert (=> d!61003 (=> (not res!142633) (not e!120281))))

(assert (=> d!61003 (= res!142633 (= (buf!4497 (_2!8035 lt!265225)) (buf!4497 thiss!1817)))))

(assert (=> d!61003 (= lt!265225 e!120282)))

(declare-fun c!9060 () Bool)

(assert (=> d!61003 (= c!9060 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!61003 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!61003 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265225)))

(assert (= (and d!61003 c!9060) b!172158))

(assert (= (and d!61003 (not c!9060)) b!172156))

(assert (= (and d!61003 res!142633) b!172161))

(assert (= (and b!172161 res!142635) b!172155))

(assert (= (and b!172155 res!142631) b!172157))

(assert (= (and b!172157 res!142632) b!172160))

(assert (= (and b!172160 (not res!142634)) b!172159))

(declare-fun m!271333 () Bool)

(assert (=> b!172156 m!271333))

(declare-fun m!271335 () Bool)

(assert (=> b!172156 m!271335))

(declare-fun m!271337 () Bool)

(assert (=> b!172157 m!271337))

(declare-fun m!271339 () Bool)

(assert (=> b!172159 m!271339))

(declare-fun m!271341 () Bool)

(assert (=> b!172161 m!271341))

(assert (=> b!172161 m!271277))

(assert (=> b!172072 d!61003))

(declare-fun d!61021 () Bool)

(declare-fun e!120292 () Bool)

(assert (=> d!61021 e!120292))

(declare-fun res!142653 () Bool)

(assert (=> d!61021 (=> (not res!142653) (not e!120292))))

(declare-fun lt!265282 () (_ BitVec 64))

(declare-fun lt!265278 () (_ BitVec 64))

(declare-fun lt!265281 () (_ BitVec 64))

(assert (=> d!61021 (= res!142653 (= lt!265278 (bvsub lt!265281 lt!265282)))))

(assert (=> d!61021 (or (= (bvand lt!265281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265281 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265281 lt!265282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61021 (= lt!265282 (remainingBits!0 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))) ((_ sign_extend 32) (currentByte!8552 thiss!1817)) ((_ sign_extend 32) (currentBit!8547 thiss!1817))))))

(declare-fun lt!265283 () (_ BitVec 64))

(declare-fun lt!265279 () (_ BitVec 64))

(assert (=> d!61021 (= lt!265281 (bvmul lt!265283 lt!265279))))

(assert (=> d!61021 (or (= lt!265283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265279 (bvsdiv (bvmul lt!265283 lt!265279) lt!265283)))))

(assert (=> d!61021 (= lt!265279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61021 (= lt!265283 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))))))

(assert (=> d!61021 (= lt!265278 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8552 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8547 thiss!1817))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61021 (invariant!0 (currentBit!8547 thiss!1817) (currentByte!8552 thiss!1817) (size!4069 (buf!4497 thiss!1817)))))

(assert (=> d!61021 (= (bitIndex!0 (size!4069 (buf!4497 thiss!1817)) (currentByte!8552 thiss!1817) (currentBit!8547 thiss!1817)) lt!265278)))

(declare-fun b!172178 () Bool)

(declare-fun res!142652 () Bool)

(assert (=> b!172178 (=> (not res!142652) (not e!120292))))

(assert (=> b!172178 (= res!142652 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265278))))

(declare-fun b!172179 () Bool)

(declare-fun lt!265280 () (_ BitVec 64))

(assert (=> b!172179 (= e!120292 (bvsle lt!265278 (bvmul lt!265280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172179 (or (= lt!265280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265280)))))

(assert (=> b!172179 (= lt!265280 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))))))

(assert (= (and d!61021 res!142653) b!172178))

(assert (= (and b!172178 res!142652) b!172179))

(declare-fun m!271345 () Bool)

(assert (=> d!61021 m!271345))

(declare-fun m!271347 () Bool)

(assert (=> d!61021 m!271347))

(assert (=> b!172073 d!61021))

(declare-fun d!61027 () Bool)

(assert (=> d!61027 (= (array_inv!3810 (buf!4497 thiss!1817)) (bvsge (size!4069 (buf!4497 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!172074 d!61027))

(declare-fun d!61029 () Bool)

(assert (=> d!61029 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8547 thiss!1817) (currentByte!8552 thiss!1817) (size!4069 (buf!4497 thiss!1817))))))

(declare-fun bs!15175 () Bool)

(assert (= bs!15175 d!61029))

(assert (=> bs!15175 m!271347))

(assert (=> start!38268 d!61029))

(declare-fun d!61031 () Bool)

(assert (=> d!61031 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))) ((_ sign_extend 32) (currentByte!8552 thiss!1817)) ((_ sign_extend 32) (currentBit!8547 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4069 (buf!4497 thiss!1817))) ((_ sign_extend 32) (currentByte!8552 thiss!1817)) ((_ sign_extend 32) (currentBit!8547 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15176 () Bool)

(assert (= bs!15176 d!61031))

(assert (=> bs!15176 m!271345))

(assert (=> b!172071 d!61031))

(push 1)

(assert (not d!61031))

(assert (not d!61029))

(assert (not d!61021))

(assert (not b!172157))

(assert (not b!172159))

(assert (not b!172156))

(assert (not b!172161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

