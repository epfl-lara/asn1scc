; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38236 () Bool)

(assert start!38236)

(declare-fun b!171998 () Bool)

(declare-fun e!120200 () Bool)

(declare-datatypes ((array!9208 0))(
  ( (array!9209 (arr!4998 (Array (_ BitVec 32) (_ BitVec 8))) (size!4068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7244 0))(
  ( (BitStream!7245 (buf!4496 array!9208) (currentByte!8545 (_ BitVec 32)) (currentBit!8540 (_ BitVec 32))) )
))
(declare-fun thiss!1817 () BitStream!7244)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!171998 (= e!120200 (not (invariant!0 (currentBit!8540 thiss!1817) (currentByte!8545 thiss!1817) (size!4068 (buf!4496 thiss!1817)))))))

(declare-fun b!171996 () Bool)

(declare-fun res!142517 () Bool)

(assert (=> b!171996 (=> (not res!142517) (not e!120200))))

(declare-fun nBits!575 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!171996 (= res!142517 (validate_offset_bits!1 ((_ sign_extend 32) (size!4068 (buf!4496 thiss!1817))) ((_ sign_extend 32) (currentByte!8545 thiss!1817)) ((_ sign_extend 32) (currentBit!8540 thiss!1817)) ((_ sign_extend 32) nBits!575)))))

(declare-fun res!142516 () Bool)

(assert (=> start!38236 (=> (not res!142516) (not e!120200))))

(assert (=> start!38236 (= res!142516 (and (bvsge nBits!575 #b00000000000000000000000000000000) (bvsle nBits!575 #b00000000000000000000000001000000)))))

(assert (=> start!38236 e!120200))

(assert (=> start!38236 true))

(declare-fun e!120202 () Bool)

(declare-fun inv!12 (BitStream!7244) Bool)

(assert (=> start!38236 (and (inv!12 thiss!1817) e!120202)))

(declare-fun b!171997 () Bool)

(declare-fun res!142518 () Bool)

(assert (=> b!171997 (=> (not res!142518) (not e!120200))))

(declare-datatypes ((tuple2!14772 0))(
  ( (tuple2!14773 (_1!8028 (_ BitVec 64)) (_2!8028 BitStream!7244)) )
))
(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!7244 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14772)

(assert (=> b!171997 (= res!142518 (= (buf!4496 (_2!8028 (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))) (buf!4496 thiss!1817)))))

(declare-fun b!171999 () Bool)

(declare-fun array_inv!3809 (array!9208) Bool)

(assert (=> b!171999 (= e!120202 (array_inv!3809 (buf!4496 thiss!1817)))))

(assert (= (and start!38236 res!142516) b!171996))

(assert (= (and b!171996 res!142517) b!171997))

(assert (= (and b!171997 res!142518) b!171998))

(assert (= start!38236 b!171999))

(declare-fun m!271225 () Bool)

(assert (=> b!171999 m!271225))

(declare-fun m!271227 () Bool)

(assert (=> b!171998 m!271227))

(declare-fun m!271229 () Bool)

(assert (=> b!171996 m!271229))

(declare-fun m!271231 () Bool)

(assert (=> start!38236 m!271231))

(declare-fun m!271233 () Bool)

(assert (=> b!171997 m!271233))

(push 1)

(assert (not b!171997))

(assert (not b!171996))

(assert (not b!171998))

(assert (not start!38236))

(assert (not b!171999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!60977 () Bool)

(assert (=> d!60977 (= (invariant!0 (currentBit!8540 thiss!1817) (currentByte!8545 thiss!1817) (size!4068 (buf!4496 thiss!1817))) (and (bvsge (currentBit!8540 thiss!1817) #b00000000000000000000000000000000) (bvslt (currentBit!8540 thiss!1817) #b00000000000000000000000000001000) (bvsge (currentByte!8545 thiss!1817) #b00000000000000000000000000000000) (or (bvslt (currentByte!8545 thiss!1817) (size!4068 (buf!4496 thiss!1817))) (and (= (currentBit!8540 thiss!1817) #b00000000000000000000000000000000) (= (currentByte!8545 thiss!1817) (size!4068 (buf!4496 thiss!1817)))))))))

(assert (=> b!171998 d!60977))

(declare-fun d!60983 () Bool)

(assert (=> d!60983 (= (array_inv!3809 (buf!4496 thiss!1817)) (bvsge (size!4068 (buf!4496 thiss!1817)) #b00000000000000000000000000000000))))

(assert (=> b!171999 d!60983))

(declare-fun d!60985 () Bool)

(assert (=> d!60985 (= (inv!12 thiss!1817) (invariant!0 (currentBit!8540 thiss!1817) (currentByte!8545 thiss!1817) (size!4068 (buf!4496 thiss!1817))))))

(declare-fun bs!15164 () Bool)

(assert (= bs!15164 d!60985))

(assert (=> bs!15164 m!271227))

(assert (=> start!38236 d!60985))

(declare-fun b!172056 () Bool)

(declare-fun e!120229 () tuple2!14772)

(assert (=> b!172056 (= e!120229 (tuple2!14773 #b0000000000000000000000000000000000000000000000000000000000000000 thiss!1817))))

(declare-fun b!172057 () Bool)

(declare-fun res!142563 () Bool)

(declare-fun e!120228 () Bool)

(assert (=> b!172057 (=> (not res!142563) (not e!120228))))

(declare-fun lt!265123 () (_ BitVec 64))

(declare-fun lt!265127 () (_ BitVec 64))

(declare-fun lt!265128 () tuple2!14772)

(assert (=> b!172057 (= res!142563 (= (bvlshr (_1!8028 lt!265128) lt!265123) (bvlshr #b0000000000000000000000000000000000000000000000000000000000000000 lt!265127)))))

(assert (=> b!172057 (and (bvsge lt!265127 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265127 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172057 (= lt!265127 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172057 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172057 (and (bvsge lt!265123 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265123 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!172057 (= lt!265123 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172057 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun d!60989 () Bool)

(assert (=> d!60989 e!120228))

(declare-fun res!142560 () Bool)

(assert (=> d!60989 (=> (not res!142560) (not e!120228))))

(assert (=> d!60989 (= res!142560 (= (buf!4496 (_2!8028 lt!265128)) (buf!4496 thiss!1817)))))

(assert (=> d!60989 (= lt!265128 e!120229)))

(declare-fun c!9051 () Bool)

(assert (=> d!60989 (= c!9051 (= nBits!575 #b00000000000000000000000000000000))))

(assert (=> d!60989 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!575) (bvsle nBits!575 #b00000000000000000000000001000000))))

(assert (=> d!60989 (= (readNLeastSignificantBitsLoop!0 thiss!1817 nBits!575 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) lt!265128)))

(declare-fun b!172058 () Bool)

(declare-fun lt!265122 () (_ BitVec 64))

(declare-fun e!120227 () Bool)

(declare-datatypes ((tuple2!14782 0))(
  ( (tuple2!14783 (_1!8033 BitStream!7244) (_2!8033 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!7244) tuple2!14782)

(assert (=> b!172058 (= e!120227 (= (= (bvand (bvlshr (_1!8028 lt!265128) lt!265122) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!8033 (readBitPure!0 thiss!1817))))))

(assert (=> b!172058 (and (bvsge lt!265122 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!265122 #b0000000000000000000000000000000000000000000000000000000001000000))))

(declare-fun lt!265130 () (_ BitVec 32))

(assert (=> b!172058 (= lt!265122 ((_ sign_extend 32) (bvsub lt!265130 #b00000000000000000000000000000000)))))

(assert (=> b!172058 (or (= (bvand lt!265130 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand lt!265130 #b10000000000000000000000000000000) (bvand (bvsub lt!265130 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172058 (= lt!265130 (bvsub nBits!575 #b00000000000000000000000000000001))))

(assert (=> b!172058 (or (= (bvand nBits!575 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))

(declare-fun b!172059 () Bool)

(assert (=> b!172059 (= e!120228 e!120227)))

(declare-fun res!142561 () Bool)

(assert (=> b!172059 (=> res!142561 e!120227)))

(assert (=> b!172059 (= res!142561 (bvsge #b00000000000000000000000000000000 nBits!575))))

(declare-fun b!172060 () Bool)

(declare-fun res!142562 () Bool)

(assert (=> b!172060 (=> (not res!142562) (not e!120228))))

(declare-fun lt!265125 () (_ BitVec 64))

(declare-fun lt!265124 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172060 (= res!142562 (= (bitIndex!0 (size!4068 (buf!4496 (_2!8028 lt!265128))) (currentByte!8545 (_2!8028 lt!265128)) (currentBit!8540 (_2!8028 lt!265128))) (bvadd lt!265125 lt!265124)))))

(assert (=> b!172060 (or (not (= (bvand lt!265125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265124 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265125 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265125 lt!265124) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172060 (= lt!265124 ((_ sign_extend 32) (bvsub nBits!575 #b00000000000000000000000000000000)))))

(assert (=> b!172060 (or (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!575 #b10000000000000000000000000000000) (bvand (bvsub nBits!575 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!172060 (= lt!265125 (bitIndex!0 (size!4068 (buf!4496 thiss!1817)) (currentByte!8545 thiss!1817) (currentBit!8540 thiss!1817)))))

(declare-fun b!172061 () Bool)

(declare-fun lt!265126 () tuple2!14772)

(assert (=> b!172061 (= e!120229 (tuple2!14773 (_1!8028 lt!265126) (_2!8028 lt!265126)))))

(declare-datatypes ((tuple2!14784 0))(
  ( (tuple2!14785 (_1!8034 Bool) (_2!8034 BitStream!7244)) )
))
(declare-fun lt!265129 () tuple2!14784)

(declare-fun readBit!0 (BitStream!7244) tuple2!14784)

(assert (=> b!172061 (= lt!265129 (readBit!0 thiss!1817))))

(assert (=> b!172061 (= lt!265126 (readNLeastSignificantBitsLoop!0 (_2!8034 lt!265129) nBits!575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor #b0000000000000000000000000000000000000000000000000000000000000000 (ite (_1!8034 lt!265129) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!575 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172062 () Bool)

(declare-fun res!142559 () Bool)

(assert (=> b!172062 (=> (not res!142559) (not e!120228))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172062 (= res!142559 (= (bvand (_1!8028 lt!265128) (onesLSBLong!0 nBits!575)) (_1!8028 lt!265128)))))

(assert (= (and d!60989 c!9051) b!172056))

(assert (= (and d!60989 (not c!9051)) b!172061))

(assert (= (and d!60989 res!142560) b!172060))

(assert (= (and b!172060 res!142562) b!172057))

(assert (= (and b!172057 res!142563) b!172062))

(assert (= (and b!172062 res!142559) b!172059))

(assert (= (and b!172059 (not res!142561)) b!172058))

