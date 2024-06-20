; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38272 () Bool)

(assert start!38272)

(declare-fun res!142589 () Bool)

(declare-fun e!120254 () Bool)

(assert (=> start!38272 (=> (not res!142589) (not e!120254))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38272 (= res!142589 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38272 e!120254))

(assert (=> start!38272 true))

(declare-datatypes ((array!9217 0))(
  ( (array!9218 (arr!5001 (Array (_ BitVec 32) (_ BitVec 8))) (size!4071 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7250 0))(
  ( (BitStream!7251 (buf!4499 array!9217) (currentByte!8554 (_ BitVec 32)) (currentBit!8549 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7250)

(declare-fun e!120255 () Bool)

(declare-fun inv!12 (BitStream!7250) Bool)

(assert (=> start!38272 (and (inv!12 thiss!1817) e!120255)))

(declare-fun lt!265148 () (_ BitVec 64))

(declare-fun b!172097 () Bool)

(declare-fun lt!265147 () (_ BitVec 64))

(assert (=> b!172097 (= e!120254 (and (= lt!265148 (bvand ((_ sign_extend 32) nBits!575) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!265148 (bvand (bvadd lt!265147 ((_ sign_extend 32) nBits!575)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!172097 (= lt!265148 (bvand lt!265147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172097 (= lt!265147 (bitIndex!0 (size!4071 (buf!4499 thiss!1817)) (currentByte!8554 thiss!1817) (currentBit!8549 thiss!1817)))))

(declare-fun b!172098 () Bool)

(declare-fun array_inv!3812 (array!9217) Bool)

(assert (=> b!172098 (= e!120255 (array_inv!3812 (buf!4499 thiss!1817)))))

(declare-fun b!172095 () Bool)

(declare-fun res!142590 () Bool)

(assert (=> b!172095 (=> (not res!142590) (not e!120254))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172095 (= res!142590 (validate_offset_bits!1 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))) ((_ sign_extend 32) (currentByte!8554 thiss!1817)) ((_ sign_extend 32) (currentBit!8549 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun b!172096 () Bool)

(declare-fun res!142588 () Bool)

(assert (=> b!172096 (=> (not res!142588) (not e!120254))))

(declare-datatypes ((tuple2!14790 0))(
  ( (tuple2!14791 (_1!8037 (_ BitVec 64)) (_2!8037 BitStream!7250)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14790)

(assert (=> b!172096 (= res!142588 (= (buf!4499 (_2!8037 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4499 thiss!1817)))))

(assert (= (and start!38272 res!142589) b!172095))

(assert (= (and b!172095 res!142590) b!172096))

(assert (= (and b!172096 res!142588) b!172097))

(assert (= start!38272 b!172098))

(declare-fun m!271297 () Bool)

(assert (=> b!172097 m!271297))

(declare-fun m!271299 () Bool)

(assert (=> start!38272 m!271299))

(declare-fun m!271301 () Bool)

(assert (=> b!172095 m!271301))

(declare-fun m!271303 () Bool)

(assert (=> b!172096 m!271303))

(declare-fun m!271305 () Bool)

(assert (=> b!172098 m!271305))

(push 1)

(assert (not b!172098))

(assert (not b!172096))

(assert (not start!38272))

(assert (not b!172095))

(assert (not b!172097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61013 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61013 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))) ((_ sign_extend 32) (currentByte!8554 thiss!1817)) ((_ sign_extend 32) (currentBit!8549 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))) ((_ sign_extend 32) (currentByte!8554 thiss!1817)) ((_ sign_extend 32) (currentBit!8549 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15173 () Bool)

(assert (= bs!15173 d!61013))

(declare-fun m!271311 () Bool)

(assert (=> bs!15173 m!271311))

(assert (=> b!172095 d!61013))

(declare-fun b!172148 () Bool)

(declare-fun res!142629 () Bool)

(declare-fun e!120278 () Bool)

(assert (=> b!172148 (=> (not res!142629) (not e!120278))))

(declare-fun lt!265212 () (_ BitVec 64))

(declare-fun lt!265213 () tuple2!14790)

(declare-fun lt!265214 () (_ BitVec 64))

(assert (=> b!172148 (= res!142629 (= (bitIndex!0 (size!4071 (buf!4499 (_2!8037 lt!265213))) (currentByte!8554 (_2!8037 lt!265213)) (currentBit!8549 (_2!8037 lt!265213))) (bvadd lt!265214 lt!265212)))))

(assert (=> b!172148 (or (not (= (bvand lt!265214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265212 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265214 lt!265212) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172148 (= lt!265212 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172148 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172148 (= lt!265214 (bitIndex!0 (size!4071 (buf!4499 thiss!1817)) (currentByte!8554 thiss!1817) (currentBit!8549 thiss!1817)))))

(declare-fun b!172149 () Bool)

(declare-fun e!120280 () Bool)

(assert (=> b!172149 (= e!120278 e!120280)))

(declare-fun res!142626 () Bool)

(assert (=> b!172149 (=> res!142626 e!120280)))

(assert (=> b!172149 (= res!142626 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun lt!265216 () (_ BitVec 64))

(declare-fun b!172150 () Bool)

(declare-datatypes ((tuple2!14794 0))(
  ( (tuple2!14795 (_1!8039 BitStream!7250) (_2!8039 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7250) tuple2!14794)

(assert (=> b!172150 (= e!120280 (= (= (bvand (bvlshr (_1!8037 lt!265213) lt!265216) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8039 (readBitPure!0 thiss!1817))))))

(assert (=> b!172150 (and (bvsge lt!265216 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265216 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265217 () (_ BitVec 32))

(assert (=> b!172150 (= lt!265216 ((_ sign_extend 32) (bvsub lt!265217 #b00000000000000000000000000000000)))))

(assert (=> b!172150 (or (= (bvand lt!265217 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265217 #b10000000000000000000000000000000) (bvand (bvsub lt!265217 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172150 (= lt!265217 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172150 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172151 () Bool)

(declare-fun res!142627 () Bool)

(assert (=> b!172151 (=> (not res!142627) (not e!120278))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172151 (= res!142627 (= (bvand (_1!8037 lt!265213) (onesLSBLong!0 nBits!575)) (_1!8037 lt!265213)))))

(declare-fun b!172152 () Bool)

(declare-fun e!120279 () tuple2!14790)

(assert (=> b!172152 (= e!120279 (tuple2!14791 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun b!172153 () Bool)

(declare-fun res!142628 () Bool)

(assert (=> b!172153 (=> (not res!142628) (not e!120278))))

(declare-fun lt!265218 () (_ BitVec 64))

(declare-fun lt!265220 () (_ BitVec 64))

(assert (=> b!172153 (= res!142628 (= (bvlshr (_1!8037 lt!265213) lt!265220) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265218)))))

(assert (=> b!172153 (and (bvsge lt!265218 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265218 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172153 (= lt!265218 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172153 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172153 (and (bvsge lt!265220 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265220 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172153 (= lt!265220 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172153 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun d!61015 () Bool)

(assert (=> d!61015 e!120278))

(declare-fun res!142630 () Bool)

(assert (=> d!61015 (=> (not res!142630) (not e!120278))))

(assert (=> d!61015 (= res!142630 (= (buf!4499 (_2!8037 lt!265213)) (buf!4499 thiss!1817)))))

(assert (=> d!61015 (= lt!265213 e!120279)))

(declare-fun c!9059 () Bool)

(assert (=> d!61015 (= c!9059 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!61015 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!61015 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265213)))

(declare-fun b!172154 () Bool)

(declare-fun lt!265215 () tuple2!14790)

(assert (=> b!172154 (= e!120279 (tuple2!14791 (_1!8037 lt!265215) (_2!8037 lt!265215)))))

(declare-datatypes ((tuple2!14802 0))(
  ( (tuple2!14803 (_1!8043 Bool) (_2!8043 BitStream!7250)) )
))
(declare-fun lt!265219 () tuple2!14802)

(declare-fun readBit!0 (BitStream!7250) tuple2!14802)

(assert (=> b!172154 (= lt!265219 (readBit!0 thiss!1817))))

(assert (=> b!172154 (= lt!265215 (readNLeastSignificantBitsLoop!0 (_2!8043 lt!265219) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8043 lt!265219) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!61015 c!9059) b!172152))

(assert (= (and d!61015 (not c!9059)) b!172154))

(assert (= (and d!61015 res!142630) b!172148))

(assert (= (and b!172148 res!142629) b!172153))

(assert (= (and b!172153 res!142628) b!172151))

(assert (= (and b!172151 res!142627) b!172149))

(assert (= (and b!172149 (not res!142626)) b!172150))

(declare-fun m!271323 () Bool)

(assert (=> b!172148 m!271323))

(assert (=> b!172148 m!271297))

(declare-fun m!271325 () Bool)

(assert (=> b!172150 m!271325))

(declare-fun m!271327 () Bool)

(assert (=> b!172151 m!271327))

(declare-fun m!271329 () Bool)

(assert (=> b!172154 m!271329))

(declare-fun m!271331 () Bool)

(assert (=> b!172154 m!271331))

(assert (=> b!172096 d!61015))

(declare-fun d!61019 () Bool)

(declare-fun e!120289 () Bool)

(assert (=> d!61019 e!120289))

(declare-fun res!142647 () Bool)

(assert (=> d!61019 (=> (not res!142647) (not e!120289))))

(declare-fun lt!265262 () (_ BitVec 64))

(declare-fun lt!265261 () (_ BitVec 64))

(declare-fun lt!265263 () (_ BitVec 64))

(assert (=> d!61019 (= res!142647 (= lt!265261 (bvsub lt!265263 lt!265262)))))

(assert (=> d!61019 (or (= (bvand lt!265263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265262 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265263 lt!265262) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!61019 (= lt!265262 (remainingBits!0 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))) ((_ sign_extend 32) (currentByte!8554 thiss!1817)) ((_ sign_extend 32) (currentBit!8549 thiss!1817))))))

(declare-fun lt!265264 () (_ BitVec 64))

(declare-fun lt!265265 () (_ BitVec 64))

(assert (=> d!61019 (= lt!265263 (bvmul lt!265264 lt!265265))))

(assert (=> d!61019 (or (= lt!265264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!265265 (bvsdiv (bvmul lt!265264 lt!265265) lt!265264)))))

(assert (=> d!61019 (= lt!265265 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61019 (= lt!265264 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))))))

(assert (=> d!61019 (= lt!265261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8554 thiss!1817)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8549 thiss!1817))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!61019 (invariant!0 (currentBit!8549 thiss!1817) (currentByte!8554 thiss!1817) (size!4071 (buf!4499 thiss!1817)))))

(assert (=> d!61019 (= (bitIndex!0 (size!4071 (buf!4499 thiss!1817)) (currentByte!8554 thiss!1817) (currentBit!8549 thiss!1817)) lt!265261)))

(declare-fun b!172172 () Bool)

(declare-fun res!142646 () Bool)

(assert (=> b!172172 (=> (not res!142646) (not e!120289))))

(assert (=> b!172172 (= res!142646 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!265261))))

(declare-fun b!172173 () Bool)

(declare-fun lt!265260 () (_ BitVec 64))

(assert (=> b!172173 (= e!120289 (bvsle lt!265261 (bvmul lt!265260 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!172173 (or (= lt!265260 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!265260 #b0000000000000000000000000000000000000000000000000000000000001000) lt!265260)))))

(assert (=> b!172173 (= lt!265260 ((_ sign_extend 32) (size!4071 (buf!4499 thiss!1817))))))

(assert (= (and d!61019 res!142647) b!172172))

(assert (= (and b!172172 res!142646) b!172173))

(assert (=> d!61019 m!271311))

(declare-fun m!271343 () Bool)

(assert (=> d!61019 m!271343))

(assert (=> b!172097 d!61019))

(declare-fun d!61023 () Bool)

(assert (=> d!61023 (= (array_inv!3812 (buf!4499 thiss!1817)) (bvsge (size!4071 (buf!4499 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!172098 d!61023))

(declare-fun d!61025 () Bool)

(assert (=> d!61025 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8549 thiss!1817) (currentByte!8554 thiss!1817) (size!4071 (buf!4499 thiss!1817))))))

(declare-fun bs!15174 () Bool)

(assert (= bs!15174 d!61025))

(assert (=> bs!15174 m!271343))

(assert (=> start!38272 d!61025))

(push 1)

(assert (not b!172150))

(assert (not d!61025))

(assert (not b!172154))

(assert (not d!61013))

(assert (not b!172151))

(assert (not b!172148))

(assert (not d!61019))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

