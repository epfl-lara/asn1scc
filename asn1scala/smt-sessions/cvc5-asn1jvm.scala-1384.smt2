; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38232 () Bool)

(assert start!38232)

(declare-fun res!142498 () Bool)

(declare-fun e!120184 () Bool)

(assert (=> start!38232 (=> (not res!142498) (not e!120184))))

(declare-fun nBits!575 () (_ BitVec 32))

(assert (=> start!38232 (= res!142498 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38232 e!120184))

(assert (=> start!38232 true))

(declare-datatypes ((array!9204 0))(
  ( (array!9205 (arr!4996 (Array (_ BitVec 32) (_ BitVec 8))) (size!4066 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7240 0))(
  ( (BitStream!7241 (buf!4494 array!9204) (currentByte!8543 (_ BitVec 32)) (currentBit!8538 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7240)

(declare-fun e!120183 () Bool)

(declare-fun inv!12 (BitStream!7240) Bool)

(assert (=> start!38232 (and (inv!12 thiss!1817) e!120183)))

(declare-fun b!171973 () Bool)

(declare-fun res!142500 () Bool)

(assert (=> b!171973 (=> (not res!142500) (not e!120184))))

(declare-datatypes ((tuple2!14768 0))(
  ( (tuple2!14769 (_1!8026 (_ BitVec 64)) (_2!8026 BitStream!7240)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7240 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14768)

(assert (=> b!171973 (= res!142500 (= (buf!4494 (_2!8026 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4494 thiss!1817)))))

(declare-fun b!171975 () Bool)

(declare-fun array_inv!3807 (array!9204) Bool)

(assert (=> b!171975 (= e!120183 (array_inv!3807 (buf!4494 thiss!1817)))))

(declare-fun b!171974 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171974 (= e!120184 (not (invariant!0 (currentBit!8538 thiss!1817) (currentByte!8543 thiss!1817) (size!4066 (buf!4494 thiss!1817)))))))

(declare-fun b!171972 () Bool)

(declare-fun res!142499 () Bool)

(assert (=> b!171972 (=> (not res!142499) (not e!120184))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171972 (= res!142499 (validate_offset_bits!1 ((_ sign_extend 32) (size!4066 (buf!4494 thiss!1817))) ((_ sign_extend 32) (currentByte!8543 thiss!1817)) ((_ sign_extend 32) (currentBit!8538 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(assert (= (and start!38232 res!142498) b!171972))

(assert (= (and b!171972 res!142499) b!171973))

(assert (= (and b!171973 res!142500) b!171974))

(assert (= start!38232 b!171975))

(declare-fun m!271205 () Bool)

(assert (=> b!171975 m!271205))

(declare-fun m!271207 () Bool)

(assert (=> b!171973 m!271207))

(declare-fun m!271209 () Bool)

(assert (=> b!171972 m!271209))

(declare-fun m!271211 () Bool)

(assert (=> b!171974 m!271211))

(declare-fun m!271213 () Bool)

(assert (=> start!38232 m!271213))

(push 1)

(assert (not b!171972))

(assert (not b!171973))

(assert (not start!38232))

(assert (not b!171974))

(assert (not b!171975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60973 () Bool)

(assert (=> d!60973 (= (invariant!0 (currentBit!8538 thiss!1817) (currentByte!8543 thiss!1817) (size!4066 (buf!4494 thiss!1817))) (and (bvsge (currentBit!8538 thiss!1817) #b00000000000000000000000000000000) (bvslt (currentBit!8538 thiss!1817) #b00000000000000000000000000001000) (bvsge (currentByte!8543 thiss!1817) #b00000000000000000000000000000000) (or (bvslt (currentByte!8543 thiss!1817) (size!4066 (buf!4494 thiss!1817))) (and (= (currentBit!8538 thiss!1817) #b00000000000000000000000000000000) (= (currentByte!8543 thiss!1817) (size!4066 (buf!4494 thiss!1817)))))))))

(assert (=> b!171974 d!60973))

(declare-fun d!60979 () Bool)

(assert (=> d!60979 (= (array_inv!3807 (buf!4494 thiss!1817)) (bvsge (size!4066 (buf!4494 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171975 d!60979))

(declare-fun d!60981 () Bool)

(assert (=> d!60981 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8538 thiss!1817) (currentByte!8543 thiss!1817) (size!4066 (buf!4494 thiss!1817))))))

(declare-fun bs!15163 () Bool)

(assert (= bs!15163 d!60981))

(assert (=> bs!15163 m!271211))

(assert (=> start!38232 d!60981))

(declare-fun b!172049 () Bool)

(declare-fun res!142557 () Bool)

(declare-fun e!120225 () Bool)

(assert (=> b!172049 (=> (not res!142557) (not e!120225))))

(declare-fun lt!265117 () tuple2!14768)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172049 (= res!142557 (= (bvand (_1!8026 lt!265117) (onesLSBLong!0 nBits!575)) (_1!8026 lt!265117)))))

(declare-fun b!172050 () Bool)

(declare-fun e!120224 () tuple2!14768)

(assert (=> b!172050 (= e!120224 (tuple2!14769 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun d!60987 () Bool)

(assert (=> d!60987 e!120225))

(declare-fun res!142555 () Bool)

(assert (=> d!60987 (=> (not res!142555) (not e!120225))))

(assert (=> d!60987 (= res!142555 (= (buf!4494 (_2!8026 lt!265117)) (buf!4494 thiss!1817)))))

(assert (=> d!60987 (= lt!265117 e!120224)))

(declare-fun c!9050 () Bool)

(assert (=> d!60987 (= c!9050 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!60987 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!60987 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265117)))

(declare-fun b!172051 () Bool)

(declare-fun res!142556 () Bool)

(assert (=> b!172051 (=> (not res!142556) (not e!120225))))

(declare-fun lt!265115 () (_ BitVec 64))

(declare-fun lt!265116 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172051 (= res!142556 (= (bitIndex!0 (size!4066 (buf!4494 (_2!8026 lt!265117))) (currentByte!8543 (_2!8026 lt!265117)) (currentBit!8538 (_2!8026 lt!265117))) (bvadd lt!265115 lt!265116)))))

(assert (=> b!172051 (or (not (= (bvand lt!265115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265116 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265115 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265115 lt!265116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172051 (= lt!265116 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172051 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172051 (= lt!265115 (bitIndex!0 (size!4066 (buf!4494 thiss!1817)) (currentByte!8543 thiss!1817) (currentBit!8538 thiss!1817)))))

(declare-fun b!172052 () Bool)

(declare-fun e!120226 () Bool)

(assert (=> b!172052 (= e!120225 e!120226)))

(declare-fun res!142554 () Bool)

(assert (=> b!172052 (=> res!142554 e!120226)))

(assert (=> b!172052 (= res!142554 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172053 () Bool)

(declare-fun lt!265121 () tuple2!14768)

(assert (=> b!172053 (= e!120224 (tuple2!14769 (_1!8026 lt!265121) (_2!8026 lt!265121)))))

(declare-datatypes ((tuple2!14776 0))(
  ( (tuple2!14777 (_1!8030 Bool) (_2!8030 BitStream!7240)) )
))
(declare-fun lt!265114 () tuple2!14776)

(declare-fun readBit!0 (BitStream!7240) tuple2!14776)

(assert (=> b!172053 (= lt!265114 (readBit!0 thiss!1817))))

(assert (=> b!172053 (= lt!265121 (readNLeastSignificantBitsLoop!0 (_2!8030 lt!265114) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8030 lt!265114) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!265120 () (_ BitVec 64))

(declare-fun b!172054 () Bool)

(declare-datatypes ((tuple2!14778 0))(
  ( (tuple2!14779 (_1!8031 BitStream!7240) (_2!8031 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7240) tuple2!14778)

(assert (=> b!172054 (= e!120226 (= (= (bvand (bvlshr (_1!8026 lt!265117) lt!265120) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8031 (readBitPure!0 thiss!1817))))))

(assert (=> b!172054 (and (bvsge lt!265120 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265120 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265118 () (_ BitVec 32))

(assert (=> b!172054 (= lt!265120 ((_ sign_extend 32) (bvsub lt!265118 #b00000000000000000000000000000000)))))

(assert (=> b!172054 (or (= (bvand lt!265118 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265118 #b10000000000000000000000000000000) (bvand (bvsub lt!265118 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172054 (= lt!265118 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172054 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172055 () Bool)

(declare-fun res!142558 () Bool)

(assert (=> b!172055 (=> (not res!142558) (not e!120225))))

(declare-fun lt!265119 () (_ BitVec 64))

(declare-fun lt!265113 () (_ BitVec 64))

(assert (=> b!172055 (= res!142558 (= (bvlshr (_1!8026 lt!265117) lt!265119) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265113)))))

(assert (=> b!172055 (and (bvsge lt!265113 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265113 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172055 (= lt!265113 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172055 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172055 (and (bvsge lt!265119 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265119 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172055 (= lt!265119 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172055 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (= (and d!60987 c!9050) b!172050))

(assert (= (and d!60987 (not c!9050)) b!172053))

(assert (= (and d!60987 res!142555) b!172051))

(assert (= (and b!172051 res!142556) b!172055))

(assert (= (and b!172055 res!142558) b!172049))

(assert (= (and b!172049 res!142557) b!172052))

(assert (= (and b!172052 (not res!142554)) b!172054))

(declare-fun m!271249 () Bool)

(assert (=> b!172049 m!271249))

(declare-fun m!271251 () Bool)

(assert (=> b!172051 m!271251))

(declare-fun m!271253 () Bool)

(assert (=> b!172051 m!271253))

(declare-fun m!271255 () Bool)

(assert (=> b!172053 m!271255))

(declare-fun m!271259 () Bool)

(assert (=> b!172053 m!271259))

(declare-fun m!271263 () Bool)

(assert (=> b!172054 m!271263))

(assert (=> b!171973 d!60987))

(declare-fun d!60997 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!60997 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4066 (buf!4494 thiss!1817))) ((_ sign_extend 32) (currentByte!8543 thiss!1817)) ((_ sign_extend 32) (currentBit!8538 thiss!1817)) ((_ sign_extend 32) nBits!575)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4066 (buf!4494 thiss!1817))) ((_ sign_extend 32) (currentByte!8543 thiss!1817)) ((_ sign_extend 32) (currentBit!8538 thiss!1817))) ((_ sign_extend 32) nBits!575)))))

(declare-fun bs!15166 () Bool)

(assert (= bs!15166 d!60997))

(declare-fun m!271273 () Bool)

(assert (=> bs!15166 m!271273))

(assert (=> b!171972 d!60997))

(push 1)

(assert (not b!172053))

(assert (not b!172054))

(assert (not d!60997))

(assert (not b!172051))

(assert (not b!172049))

(assert (not d!60981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

