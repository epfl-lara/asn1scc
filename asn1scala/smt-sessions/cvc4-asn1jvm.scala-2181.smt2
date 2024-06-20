; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55232 () Bool)

(assert start!55232)

(declare-fun b!257772 () Bool)

(declare-fun res!216005 () Bool)

(declare-fun e!178778 () Bool)

(assert (=> b!257772 (=> (not res!216005) (not e!178778))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!257772 (= res!216005 (not (= from!526 nBits!535)))))

(declare-fun b!257773 () Bool)

(declare-fun e!178780 () Bool)

(declare-datatypes ((array!14029 0))(
  ( (array!14030 (arr!7140 (Array (_ BitVec 32) (_ BitVec 8))) (size!6153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11228 0))(
  ( (BitStream!11229 (buf!6675 array!14029) (currentByte!12226 (_ BitVec 32)) (currentBit!12221 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22068 0))(
  ( (tuple2!22069 (_1!11970 Bool) (_2!11970 BitStream!11228)) )
))
(declare-fun lt!399003 () tuple2!22068)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!257773 (= e!178780 (not (invariant!0 (currentBit!12221 (_2!11970 lt!399003)) (currentByte!12226 (_2!11970 lt!399003)) (size!6153 (buf!6675 (_2!11970 lt!399003))))))))

(declare-fun expected!109 () Bool)

(declare-fun lt!399004 () tuple2!22068)

(declare-fun checkBitsLoop!0 (BitStream!11228 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!22068)

(assert (=> b!257773 (= lt!399003 (checkBitsLoop!0 (_2!11970 lt!399004) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!257773 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!18409 0))(
  ( (Unit!18410) )
))
(declare-fun lt!399005 () Unit!18409)

(declare-fun thiss!1754 () BitStream!11228)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11228 BitStream!11228 (_ BitVec 64) (_ BitVec 64)) Unit!18409)

(assert (=> b!257773 (= lt!399005 (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11970 lt!399004) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun res!216004 () Bool)

(assert (=> start!55232 (=> (not res!216004) (not e!178778))))

(assert (=> start!55232 (= res!216004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55232 e!178778))

(assert (=> start!55232 true))

(declare-fun e!178779 () Bool)

(declare-fun inv!12 (BitStream!11228) Bool)

(assert (=> start!55232 (and (inv!12 thiss!1754) e!178779)))

(declare-fun b!257774 () Bool)

(declare-fun array_inv!5894 (array!14029) Bool)

(assert (=> b!257774 (= e!178779 (array_inv!5894 (buf!6675 thiss!1754)))))

(declare-fun b!257775 () Bool)

(declare-fun res!216006 () Bool)

(assert (=> b!257775 (=> (not res!216006) (not e!178778))))

(assert (=> b!257775 (= res!216006 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!257776 () Bool)

(assert (=> b!257776 (= e!178778 e!178780)))

(declare-fun res!216007 () Bool)

(assert (=> b!257776 (=> (not res!216007) (not e!178780))))

(assert (=> b!257776 (= res!216007 (= (_1!11970 lt!399004) expected!109))))

(declare-fun readBit!0 (BitStream!11228) tuple2!22068)

(assert (=> b!257776 (= lt!399004 (readBit!0 thiss!1754))))

(assert (= (and start!55232 res!216004) b!257775))

(assert (= (and b!257775 res!216006) b!257772))

(assert (= (and b!257772 res!216005) b!257776))

(assert (= (and b!257776 res!216007) b!257773))

(assert (= start!55232 b!257774))

(declare-fun m!387247 () Bool)

(assert (=> b!257774 m!387247))

(declare-fun m!387249 () Bool)

(assert (=> start!55232 m!387249))

(declare-fun m!387251 () Bool)

(assert (=> b!257775 m!387251))

(declare-fun m!387253 () Bool)

(assert (=> b!257773 m!387253))

(declare-fun m!387255 () Bool)

(assert (=> b!257773 m!387255))

(declare-fun m!387257 () Bool)

(assert (=> b!257773 m!387257))

(declare-fun m!387259 () Bool)

(assert (=> b!257773 m!387259))

(declare-fun m!387261 () Bool)

(assert (=> b!257776 m!387261))

(push 1)

(assert (not b!257774))

(assert (not b!257773))

(assert (not start!55232))

(assert (not b!257776))

(assert (not b!257775))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86430 () Bool)

(assert (=> d!86430 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12221 thiss!1754) (currentByte!12226 thiss!1754) (size!6153 (buf!6675 thiss!1754))))))

(declare-fun bs!21879 () Bool)

(assert (= bs!21879 d!86430))

(declare-fun m!387263 () Bool)

(assert (=> bs!21879 m!387263))

(assert (=> start!55232 d!86430))

(declare-fun d!86432 () Bool)

(declare-fun e!178794 () Bool)

(assert (=> d!86432 e!178794))

(declare-fun res!216013 () Bool)

(assert (=> d!86432 (=> (not res!216013) (not e!178794))))

(declare-datatypes ((tuple2!22074 0))(
  ( (tuple2!22075 (_1!11973 Unit!18409) (_2!11973 BitStream!11228)) )
))
(declare-fun increaseBitIndex!0 (BitStream!11228) tuple2!22074)

(assert (=> d!86432 (= res!216013 (= (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754))) (buf!6675 thiss!1754)))))

(declare-fun lt!399047 () Bool)

(assert (=> d!86432 (= lt!399047 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399044 () tuple2!22068)

(assert (=> d!86432 (= lt!399044 (tuple2!22069 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 thiss!1754)))) #b00000000000000000000000000000000)) (_2!11973 (increaseBitIndex!0 thiss!1754))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!86432 (validate_offset_bit!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754)))))

(assert (=> d!86432 (= (readBit!0 thiss!1754) lt!399044)))

(declare-fun b!257782 () Bool)

(declare-fun lt!399045 () (_ BitVec 64))

(declare-fun lt!399042 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!257782 (= e!178794 (= (bitIndex!0 (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754)))) (currentByte!12226 (_2!11973 (increaseBitIndex!0 thiss!1754))) (currentBit!12221 (_2!11973 (increaseBitIndex!0 thiss!1754)))) (bvadd lt!399042 lt!399045)))))

(assert (=> b!257782 (or (not (= (bvand lt!399042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399045 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399042 lt!399045) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257782 (= lt!399045 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257782 (= lt!399042 (bitIndex!0 (size!6153 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754) (currentBit!12221 thiss!1754)))))

(declare-fun lt!399046 () Bool)

(assert (=> b!257782 (= lt!399046 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399043 () Bool)

(assert (=> b!257782 (= lt!399043 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 thiss!1754)))) #b00000000000000000000000000000000)))))

(declare-fun lt!399041 () Bool)

(assert (=> b!257782 (= lt!399041 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 thiss!1754)))) #b00000000000000000000000000000000)))))

(assert (= (and d!86432 res!216013) b!257782))

(declare-fun m!387279 () Bool)

(assert (=> d!86432 m!387279))

(declare-fun m!387281 () Bool)

(assert (=> d!86432 m!387281))

(declare-fun m!387283 () Bool)

(assert (=> d!86432 m!387283))

(declare-fun m!387285 () Bool)

(assert (=> d!86432 m!387285))

(declare-fun m!387287 () Bool)

(assert (=> b!257782 m!387287))

(declare-fun m!387289 () Bool)

(assert (=> b!257782 m!387289))

(assert (=> b!257782 m!387279))

(assert (=> b!257782 m!387283))

(assert (=> b!257782 m!387281))

(assert (=> b!257776 d!86432))

(declare-fun d!86440 () Bool)

(assert (=> d!86440 (= (invariant!0 (currentBit!12221 (_2!11970 lt!399003)) (currentByte!12226 (_2!11970 lt!399003)) (size!6153 (buf!6675 (_2!11970 lt!399003)))) (and (bvsge (currentBit!12221 (_2!11970 lt!399003)) #b00000000000000000000000000000000) (bvslt (currentBit!12221 (_2!11970 lt!399003)) #b00000000000000000000000000001000) (bvsge (currentByte!12226 (_2!11970 lt!399003)) #b00000000000000000000000000000000) (or (bvslt (currentByte!12226 (_2!11970 lt!399003)) (size!6153 (buf!6675 (_2!11970 lt!399003)))) (and (= (currentBit!12221 (_2!11970 lt!399003)) #b00000000000000000000000000000000) (= (currentByte!12226 (_2!11970 lt!399003)) (size!6153 (buf!6675 (_2!11970 lt!399003))))))))))

(assert (=> b!257773 d!86440))

(declare-fun lt!399165 () tuple2!22068)

(declare-fun b!257864 () Bool)

(declare-fun lt!399172 () tuple2!22068)

(assert (=> b!257864 (= lt!399172 (checkBitsLoop!0 (_2!11970 lt!399165) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399168 () Unit!18409)

(declare-fun lt!399171 () Unit!18409)

(assert (=> b!257864 (= lt!399168 lt!399171)))

(declare-fun lt!399173 () (_ BitVec 64))

(declare-fun lt!399166 () (_ BitVec 64))

(assert (=> b!257864 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399165)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399165))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399165))) (bvsub lt!399173 lt!399166))))

(assert (=> b!257864 (= lt!399171 (validateOffsetBitsIneqLemma!0 (_2!11970 lt!399004) (_2!11970 lt!399165) lt!399173 lt!399166))))

(assert (=> b!257864 (= lt!399166 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257864 (= lt!399173 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)))))

(declare-fun e!178850 () tuple2!22068)

(assert (=> b!257864 (= e!178850 (tuple2!22069 (_1!11970 lt!399172) (_2!11970 lt!399172)))))

(declare-fun b!257865 () Bool)

(declare-fun res!216064 () Bool)

(declare-fun e!178852 () Bool)

(assert (=> b!257865 (=> (not res!216064) (not e!178852))))

(declare-fun lt!399167 () tuple2!22068)

(assert (=> b!257865 (= res!216064 (and (= (buf!6675 (_2!11970 lt!399004)) (buf!6675 (_2!11970 lt!399167))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526))) (_1!11970 lt!399167))))))

(declare-fun b!257866 () Bool)

(declare-fun e!178848 () Bool)

(declare-datatypes ((tuple2!22080 0))(
  ( (tuple2!22081 (_1!11976 BitStream!11228) (_2!11976 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!11228) tuple2!22080)

(assert (=> b!257866 (= e!178848 (= expected!109 (_2!11976 (readBitPure!0 (_2!11970 lt!399004)))))))

(declare-fun b!257867 () Bool)

(declare-fun e!178849 () tuple2!22068)

(assert (=> b!257867 (= e!178849 e!178850)))

(assert (=> b!257867 (= lt!399165 (readBit!0 (_2!11970 lt!399004)))))

(declare-fun c!11834 () Bool)

(assert (=> b!257867 (= c!11834 (not (= (_1!11970 lt!399165) expected!109)))))

(declare-fun b!257868 () Bool)

(assert (=> b!257868 (= e!178850 (tuple2!22069 false (_2!11970 lt!399165)))))

(declare-fun d!86442 () Bool)

(assert (=> d!86442 e!178852))

(declare-fun res!216063 () Bool)

(assert (=> d!86442 (=> (not res!216063) (not e!178852))))

(declare-fun lt!399164 () (_ BitVec 64))

(assert (=> d!86442 (= res!216063 (bvsge (bvsub lt!399164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399167))) (currentByte!12226 (_2!11970 lt!399167)) (currentBit!12221 (_2!11970 lt!399167)))))))

(assert (=> d!86442 (or (= (bvand lt!399164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399164 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399164 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399169 () (_ BitVec 64))

(assert (=> d!86442 (= lt!399164 (bvadd lt!399169 nBits!535))))

(assert (=> d!86442 (or (not (= (bvand lt!399169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399169 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399169 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86442 (= lt!399169 (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)) (currentBit!12221 (_2!11970 lt!399004))))))

(assert (=> d!86442 (= lt!399167 e!178849)))

(declare-fun c!11835 () Bool)

(assert (=> d!86442 (= c!11835 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535))))

(assert (=> d!86442 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86442 (= (checkBitsLoop!0 (_2!11970 lt!399004) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) lt!399167)))

(declare-fun b!257869 () Bool)

(assert (=> b!257869 (= e!178849 (tuple2!22069 true (_2!11970 lt!399004)))))

(declare-fun b!257870 () Bool)

(declare-fun e!178851 () Bool)

(declare-fun lt!399163 () (_ BitVec 64))

(assert (=> b!257870 (= e!178851 (= (bvsub lt!399163 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399167))) (currentByte!12226 (_2!11970 lt!399167)) (currentBit!12221 (_2!11970 lt!399167)))))))

(assert (=> b!257870 (or (= (bvand lt!399163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399163 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399163 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399170 () (_ BitVec 64))

(assert (=> b!257870 (= lt!399163 (bvadd lt!399170 nBits!535))))

(assert (=> b!257870 (or (not (= (bvand lt!399170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399170 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399170 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257870 (= lt!399170 (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)) (currentBit!12221 (_2!11970 lt!399004))))))

(declare-fun b!257871 () Bool)

(assert (=> b!257871 (= e!178852 e!178848)))

(declare-fun res!216066 () Bool)

(assert (=> b!257871 (=> res!216066 e!178848)))

(assert (=> b!257871 (= res!216066 (or (not (_1!11970 lt!399167)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526) nBits!535)))))

(declare-fun b!257872 () Bool)

(declare-fun res!216067 () Bool)

(assert (=> b!257872 (=> (not res!216067) (not e!178852))))

(assert (=> b!257872 (= res!216067 e!178851)))

(declare-fun res!216065 () Bool)

(assert (=> b!257872 (=> res!216065 e!178851)))

(assert (=> b!257872 (= res!216065 (not (_1!11970 lt!399167)))))

(assert (= (and d!86442 c!11835) b!257869))

(assert (= (and d!86442 (not c!11835)) b!257867))

(assert (= (and b!257867 c!11834) b!257868))

(assert (= (and b!257867 (not c!11834)) b!257864))

(assert (= (and d!86442 res!216063) b!257865))

(assert (= (and b!257865 res!216064) b!257872))

(assert (= (and b!257872 (not res!216065)) b!257870))

(assert (= (and b!257872 res!216067) b!257871))

(assert (= (and b!257871 (not res!216066)) b!257866))

(declare-fun m!387345 () Bool)

(assert (=> b!257866 m!387345))

(declare-fun m!387347 () Bool)

(assert (=> b!257864 m!387347))

(declare-fun m!387349 () Bool)

(assert (=> b!257864 m!387349))

(declare-fun m!387351 () Bool)

(assert (=> b!257864 m!387351))

(declare-fun m!387353 () Bool)

(assert (=> b!257870 m!387353))

(declare-fun m!387355 () Bool)

(assert (=> b!257870 m!387355))

(declare-fun m!387357 () Bool)

(assert (=> b!257867 m!387357))

(assert (=> d!86442 m!387353))

(assert (=> d!86442 m!387355))

(assert (=> b!257773 d!86442))

(declare-fun d!86462 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004)))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21886 () Bool)

(assert (= bs!21886 d!86462))

(declare-fun m!387359 () Bool)

(assert (=> bs!21886 m!387359))

(assert (=> b!257773 d!86462))

(declare-fun d!86464 () Bool)

(declare-fun e!178855 () Bool)

(assert (=> d!86464 e!178855))

(declare-fun res!216070 () Bool)

(assert (=> d!86464 (=> (not res!216070) (not e!178855))))

(assert (=> d!86464 (= res!216070 (or (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!535 from!526) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399176 () Unit!18409)

(declare-fun choose!27 (BitStream!11228 BitStream!11228 (_ BitVec 64) (_ BitVec 64)) Unit!18409)

(assert (=> d!86464 (= lt!399176 (choose!27 thiss!1754 (_2!11970 lt!399004) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86464 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!535 from!526)))))

(assert (=> d!86464 (= (validateOffsetBitsIneqLemma!0 thiss!1754 (_2!11970 lt!399004) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) lt!399176)))

(declare-fun b!257875 () Bool)

(assert (=> b!257875 (= e!178855 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!86464 res!216070) b!257875))

(declare-fun m!387361 () Bool)

(assert (=> d!86464 m!387361))

(assert (=> b!257875 m!387257))

(assert (=> b!257773 d!86464))

(declare-fun d!86466 () Bool)

(assert (=> d!86466 (= (array_inv!5894 (buf!6675 thiss!1754)) (bvsge (size!6153 (buf!6675 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!257774 d!86466))

(declare-fun d!86468 () Bool)

(assert (=> d!86468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21887 () Bool)

(assert (= bs!21887 d!86468))

(declare-fun m!387363 () Bool)

(assert (=> bs!21887 m!387363))

(assert (=> b!257775 d!86468))

(push 1)

(assert (not b!257875))

(assert (not b!257864))

(assert (not d!86442))

(assert (not b!257870))

(assert (not d!86462))

(assert (not b!257866))

(assert (not d!86432))

(assert (not d!86468))

(assert (not b!257782))

(assert (not d!86464))

(assert (not d!86430))

(assert (not b!257867))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86500 () Bool)

(declare-fun e!178874 () Bool)

(assert (=> d!86500 e!178874))

(declare-fun res!216101 () Bool)

(assert (=> d!86500 (=> (not res!216101) (not e!178874))))

(declare-fun lt!399262 () (_ BitVec 64))

(declare-fun lt!399266 () (_ BitVec 64))

(declare-fun lt!399265 () (_ BitVec 64))

(assert (=> d!86500 (= res!216101 (= lt!399262 (bvsub lt!399265 lt!399266)))))

(assert (=> d!86500 (or (= (bvand lt!399265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399265 lt!399266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86500 (= lt!399266 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754))))) ((_ sign_extend 32) (currentByte!12226 (_2!11973 (increaseBitIndex!0 thiss!1754)))) ((_ sign_extend 32) (currentBit!12221 (_2!11973 (increaseBitIndex!0 thiss!1754))))))))

(declare-fun lt!399263 () (_ BitVec 64))

(declare-fun lt!399264 () (_ BitVec 64))

(assert (=> d!86500 (= lt!399265 (bvmul lt!399263 lt!399264))))

(assert (=> d!86500 (or (= lt!399263 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399264 (bvsdiv (bvmul lt!399263 lt!399264) lt!399263)))))

(assert (=> d!86500 (= lt!399264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86500 (= lt!399263 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86500 (= lt!399262 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 (_2!11973 (increaseBitIndex!0 thiss!1754)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 (_2!11973 (increaseBitIndex!0 thiss!1754))))))))

(assert (=> d!86500 (invariant!0 (currentBit!12221 (_2!11973 (increaseBitIndex!0 thiss!1754))) (currentByte!12226 (_2!11973 (increaseBitIndex!0 thiss!1754))) (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754)))))))

(assert (=> d!86500 (= (bitIndex!0 (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754)))) (currentByte!12226 (_2!11973 (increaseBitIndex!0 thiss!1754))) (currentBit!12221 (_2!11973 (increaseBitIndex!0 thiss!1754)))) lt!399262)))

(declare-fun b!257909 () Bool)

(declare-fun res!216100 () Bool)

(assert (=> b!257909 (=> (not res!216100) (not e!178874))))

(assert (=> b!257909 (= res!216100 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399262))))

(declare-fun b!257910 () Bool)

(declare-fun lt!399267 () (_ BitVec 64))

(assert (=> b!257910 (= e!178874 (bvsle lt!399262 (bvmul lt!399267 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257910 (or (= lt!399267 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399267 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399267)))))

(assert (=> b!257910 (= lt!399267 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 thiss!1754))))))))

(assert (= (and d!86500 res!216101) b!257909))

(assert (= (and b!257909 res!216100) b!257910))

(declare-fun m!387407 () Bool)

(assert (=> d!86500 m!387407))

(declare-fun m!387409 () Bool)

(assert (=> d!86500 m!387409))

(assert (=> b!257782 d!86500))

(declare-fun d!86502 () Bool)

(declare-fun e!178877 () Bool)

(assert (=> d!86502 e!178877))

(declare-fun res!216106 () Bool)

(assert (=> d!86502 (=> (not res!216106) (not e!178877))))

(declare-fun lt!399282 () tuple2!22074)

(declare-fun lt!399279 () (_ BitVec 64))

(declare-fun lt!399281 () (_ BitVec 64))

(assert (=> d!86502 (= res!216106 (= (bvadd lt!399279 lt!399281) (bitIndex!0 (size!6153 (buf!6675 (_2!11973 lt!399282))) (currentByte!12226 (_2!11973 lt!399282)) (currentBit!12221 (_2!11973 lt!399282)))))))

(assert (=> d!86502 (or (not (= (bvand lt!399279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399281 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399279 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399279 lt!399281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86502 (= lt!399281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!86502 (= lt!399279 (bitIndex!0 (size!6153 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754) (currentBit!12221 thiss!1754)))))

(declare-fun Unit!18413 () Unit!18409)

(declare-fun Unit!18414 () Unit!18409)

(assert (=> d!86502 (= lt!399282 (ite (bvslt (currentBit!12221 thiss!1754) #b00000000000000000000000000000111) (tuple2!22075 Unit!18413 (BitStream!11229 (buf!6675 thiss!1754) (currentByte!12226 thiss!1754) (bvadd (currentBit!12221 thiss!1754) #b00000000000000000000000000000001))) (tuple2!22075 Unit!18414 (BitStream!11229 (buf!6675 thiss!1754) (bvadd (currentByte!12226 thiss!1754) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!86502 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!86502 (= (increaseBitIndex!0 thiss!1754) lt!399282)))

(declare-fun b!257915 () Bool)

(declare-fun res!216107 () Bool)

(assert (=> b!257915 (=> (not res!216107) (not e!178877))))

(declare-fun lt!399280 () (_ BitVec 64))

(declare-fun lt!399278 () (_ BitVec 64))

(assert (=> b!257915 (= res!216107 (= (bvsub lt!399280 lt!399278) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!257915 (or (= (bvand lt!399280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399278 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399280 lt!399278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257915 (= lt!399278 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11973 lt!399282)))) ((_ sign_extend 32) (currentByte!12226 (_2!11973 lt!399282))) ((_ sign_extend 32) (currentBit!12221 (_2!11973 lt!399282)))))))

(assert (=> b!257915 (= lt!399280 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))))))

(declare-fun b!257916 () Bool)

(assert (=> b!257916 (= e!178877 (= (size!6153 (buf!6675 thiss!1754)) (size!6153 (buf!6675 (_2!11973 lt!399282)))))))

(assert (= (and d!86502 res!216106) b!257915))

(assert (= (and b!257915 res!216107) b!257916))

(declare-fun m!387411 () Bool)

(assert (=> d!86502 m!387411))

(assert (=> d!86502 m!387289))

(assert (=> d!86502 m!387363))

(declare-fun m!387413 () Bool)

(assert (=> b!257915 m!387413))

(assert (=> b!257915 m!387363))

(assert (=> b!257782 d!86502))

(declare-fun d!86504 () Bool)

(declare-fun e!178878 () Bool)

(assert (=> d!86504 e!178878))

(declare-fun res!216109 () Bool)

(assert (=> d!86504 (=> (not res!216109) (not e!178878))))

(declare-fun lt!399286 () (_ BitVec 64))

(declare-fun lt!399283 () (_ BitVec 64))

(declare-fun lt!399287 () (_ BitVec 64))

(assert (=> d!86504 (= res!216109 (= lt!399283 (bvsub lt!399286 lt!399287)))))

(assert (=> d!86504 (or (= (bvand lt!399286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399287 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399286 lt!399287) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86504 (= lt!399287 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))))))

(declare-fun lt!399284 () (_ BitVec 64))

(declare-fun lt!399285 () (_ BitVec 64))

(assert (=> d!86504 (= lt!399286 (bvmul lt!399284 lt!399285))))

(assert (=> d!86504 (or (= lt!399284 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399285 (bvsdiv (bvmul lt!399284 lt!399285) lt!399284)))))

(assert (=> d!86504 (= lt!399285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86504 (= lt!399284 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))))))

(assert (=> d!86504 (= lt!399283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 thiss!1754))))))

(assert (=> d!86504 (invariant!0 (currentBit!12221 thiss!1754) (currentByte!12226 thiss!1754) (size!6153 (buf!6675 thiss!1754)))))

(assert (=> d!86504 (= (bitIndex!0 (size!6153 (buf!6675 thiss!1754)) (currentByte!12226 thiss!1754) (currentBit!12221 thiss!1754)) lt!399283)))

(declare-fun b!257917 () Bool)

(declare-fun res!216108 () Bool)

(assert (=> b!257917 (=> (not res!216108) (not e!178878))))

(assert (=> b!257917 (= res!216108 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399283))))

(declare-fun b!257918 () Bool)

(declare-fun lt!399288 () (_ BitVec 64))

(assert (=> b!257918 (= e!178878 (bvsle lt!399283 (bvmul lt!399288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257918 (or (= lt!399288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399288)))))

(assert (=> b!257918 (= lt!399288 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))))))

(assert (= (and d!86504 res!216109) b!257917))

(assert (= (and b!257917 res!216108) b!257918))

(assert (=> d!86504 m!387363))

(assert (=> d!86504 m!387263))

(assert (=> b!257782 d!86504))

(declare-fun d!86506 () Bool)

(declare-fun e!178879 () Bool)

(assert (=> d!86506 e!178879))

(declare-fun res!216111 () Bool)

(assert (=> d!86506 (=> (not res!216111) (not e!178879))))

(declare-fun lt!399289 () (_ BitVec 64))

(declare-fun lt!399292 () (_ BitVec 64))

(declare-fun lt!399293 () (_ BitVec 64))

(assert (=> d!86506 (= res!216111 (= lt!399289 (bvsub lt!399292 lt!399293)))))

(assert (=> d!86506 (or (= (bvand lt!399292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399292 lt!399293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86506 (= lt!399293 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399167)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399167))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399167)))))))

(declare-fun lt!399290 () (_ BitVec 64))

(declare-fun lt!399291 () (_ BitVec 64))

(assert (=> d!86506 (= lt!399292 (bvmul lt!399290 lt!399291))))

(assert (=> d!86506 (or (= lt!399290 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399291 (bvsdiv (bvmul lt!399290 lt!399291) lt!399290)))))

(assert (=> d!86506 (= lt!399291 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86506 (= lt!399290 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399167)))))))

(assert (=> d!86506 (= lt!399289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399167))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399167)))))))

(assert (=> d!86506 (invariant!0 (currentBit!12221 (_2!11970 lt!399167)) (currentByte!12226 (_2!11970 lt!399167)) (size!6153 (buf!6675 (_2!11970 lt!399167))))))

(assert (=> d!86506 (= (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399167))) (currentByte!12226 (_2!11970 lt!399167)) (currentBit!12221 (_2!11970 lt!399167))) lt!399289)))

(declare-fun b!257919 () Bool)

(declare-fun res!216110 () Bool)

(assert (=> b!257919 (=> (not res!216110) (not e!178879))))

(assert (=> b!257919 (= res!216110 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399289))))

(declare-fun b!257920 () Bool)

(declare-fun lt!399294 () (_ BitVec 64))

(assert (=> b!257920 (= e!178879 (bvsle lt!399289 (bvmul lt!399294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257920 (or (= lt!399294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399294)))))

(assert (=> b!257920 (= lt!399294 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399167)))))))

(assert (= (and d!86506 res!216111) b!257919))

(assert (= (and b!257919 res!216110) b!257920))

(declare-fun m!387415 () Bool)

(assert (=> d!86506 m!387415))

(declare-fun m!387417 () Bool)

(assert (=> d!86506 m!387417))

(assert (=> d!86442 d!86506))

(declare-fun d!86508 () Bool)

(declare-fun e!178880 () Bool)

(assert (=> d!86508 e!178880))

(declare-fun res!216113 () Bool)

(assert (=> d!86508 (=> (not res!216113) (not e!178880))))

(declare-fun lt!399295 () (_ BitVec 64))

(declare-fun lt!399298 () (_ BitVec 64))

(declare-fun lt!399299 () (_ BitVec 64))

(assert (=> d!86508 (= res!216113 (= lt!399295 (bvsub lt!399298 lt!399299)))))

(assert (=> d!86508 (or (= (bvand lt!399298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399298 lt!399299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86508 (= lt!399299 (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004)))))))

(declare-fun lt!399296 () (_ BitVec 64))

(declare-fun lt!399297 () (_ BitVec 64))

(assert (=> d!86508 (= lt!399298 (bvmul lt!399296 lt!399297))))

(assert (=> d!86508 (or (= lt!399296 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!399297 (bvsdiv (bvmul lt!399296 lt!399297) lt!399296)))))

(assert (=> d!86508 (= lt!399297 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86508 (= lt!399296 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))))))

(assert (=> d!86508 (= lt!399295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004)))))))

(assert (=> d!86508 (invariant!0 (currentBit!12221 (_2!11970 lt!399004)) (currentByte!12226 (_2!11970 lt!399004)) (size!6153 (buf!6675 (_2!11970 lt!399004))))))

(assert (=> d!86508 (= (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)) (currentBit!12221 (_2!11970 lt!399004))) lt!399295)))

(declare-fun b!257921 () Bool)

(declare-fun res!216112 () Bool)

(assert (=> b!257921 (=> (not res!216112) (not e!178880))))

(assert (=> b!257921 (= res!216112 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399295))))

(declare-fun b!257922 () Bool)

(declare-fun lt!399300 () (_ BitVec 64))

(assert (=> b!257922 (= e!178880 (bvsle lt!399295 (bvmul lt!399300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!257922 (or (= lt!399300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399300)))))

(assert (=> b!257922 (= lt!399300 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))))))

(assert (= (and d!86508 res!216113) b!257921))

(assert (= (and b!257921 res!216112) b!257922))

(assert (=> d!86508 m!387359))

(declare-fun m!387419 () Bool)

(assert (=> d!86508 m!387419))

(assert (=> d!86442 d!86508))

(declare-fun d!86510 () Bool)

(assert (=> d!86510 (= (invariant!0 (currentBit!12221 thiss!1754) (currentByte!12226 thiss!1754) (size!6153 (buf!6675 thiss!1754))) (and (bvsge (currentBit!12221 thiss!1754) #b00000000000000000000000000000000) (bvslt (currentBit!12221 thiss!1754) #b00000000000000000000000000001000) (bvsge (currentByte!12226 thiss!1754) #b00000000000000000000000000000000) (or (bvslt (currentByte!12226 thiss!1754) (size!6153 (buf!6675 thiss!1754))) (and (= (currentBit!12221 thiss!1754) #b00000000000000000000000000000000) (= (currentByte!12226 thiss!1754) (size!6153 (buf!6675 thiss!1754)))))))))

(assert (=> d!86430 d!86510))

(declare-fun d!86512 () Bool)

(assert (=> d!86512 (= (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004)))) (bvsub (bvmul ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))))))))

(assert (=> d!86462 d!86512))

(declare-fun lt!399303 () tuple2!22068)

(declare-fun lt!399310 () tuple2!22068)

(declare-fun b!257923 () Bool)

(assert (=> b!257923 (= lt!399310 (checkBitsLoop!0 (_2!11970 lt!399303) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!399306 () Unit!18409)

(declare-fun lt!399309 () Unit!18409)

(assert (=> b!257923 (= lt!399306 lt!399309)))

(declare-fun lt!399311 () (_ BitVec 64))

(declare-fun lt!399304 () (_ BitVec 64))

(assert (=> b!257923 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399303)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399303))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399303))) (bvsub lt!399311 lt!399304))))

(assert (=> b!257923 (= lt!399309 (validateOffsetBitsIneqLemma!0 (_2!11970 lt!399165) (_2!11970 lt!399303) lt!399311 lt!399304))))

(assert (=> b!257923 (= lt!399304 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257923 (= lt!399311 (bvsub nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!178883 () tuple2!22068)

(assert (=> b!257923 (= e!178883 (tuple2!22069 (_1!11970 lt!399310) (_2!11970 lt!399310)))))

(declare-fun b!257924 () Bool)

(declare-fun res!216115 () Bool)

(declare-fun e!178885 () Bool)

(assert (=> b!257924 (=> (not res!216115) (not e!178885))))

(declare-fun lt!399305 () tuple2!22068)

(assert (=> b!257924 (= res!216115 (and (= (buf!6675 (_2!11970 lt!399165)) (buf!6675 (_2!11970 lt!399305))) (or (not (= nBits!535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001))) (_1!11970 lt!399305))))))

(declare-fun b!257925 () Bool)

(declare-fun e!178881 () Bool)

(assert (=> b!257925 (= e!178881 (= expected!109 (_2!11976 (readBitPure!0 (_2!11970 lt!399165)))))))

(declare-fun b!257926 () Bool)

(declare-fun e!178882 () tuple2!22068)

(assert (=> b!257926 (= e!178882 e!178883)))

(assert (=> b!257926 (= lt!399303 (readBit!0 (_2!11970 lt!399165)))))

(declare-fun c!11838 () Bool)

(assert (=> b!257926 (= c!11838 (not (= (_1!11970 lt!399303) expected!109)))))

(declare-fun b!257927 () Bool)

(assert (=> b!257927 (= e!178883 (tuple2!22069 false (_2!11970 lt!399303)))))

(declare-fun d!86514 () Bool)

(assert (=> d!86514 e!178885))

(declare-fun res!216114 () Bool)

(assert (=> d!86514 (=> (not res!216114) (not e!178885))))

(declare-fun lt!399302 () (_ BitVec 64))

(assert (=> d!86514 (= res!216114 (bvsge (bvsub lt!399302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399305))) (currentByte!12226 (_2!11970 lt!399305)) (currentBit!12221 (_2!11970 lt!399305)))))))

(assert (=> d!86514 (or (= (bvand lt!399302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399302 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399302 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399307 () (_ BitVec 64))

(assert (=> d!86514 (= lt!399302 (bvadd lt!399307 nBits!535))))

(assert (=> d!86514 (or (not (= (bvand lt!399307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399307 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399307 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86514 (= lt!399307 (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399165))) (currentByte!12226 (_2!11970 lt!399165)) (currentBit!12221 (_2!11970 lt!399165))))))

(assert (=> d!86514 (= lt!399305 e!178882)))

(declare-fun c!11839 () Bool)

(assert (=> d!86514 (= c!11839 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535))))

(assert (=> d!86514 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!86514 (= (checkBitsLoop!0 (_2!11970 lt!399165) nBits!535 expected!109 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!399305)))

(declare-fun b!257928 () Bool)

(assert (=> b!257928 (= e!178882 (tuple2!22069 true (_2!11970 lt!399165)))))

(declare-fun lt!399301 () (_ BitVec 64))

(declare-fun b!257929 () Bool)

(declare-fun e!178884 () Bool)

(assert (=> b!257929 (= e!178884 (= (bvsub lt!399301 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399305))) (currentByte!12226 (_2!11970 lt!399305)) (currentBit!12221 (_2!11970 lt!399305)))))))

(assert (=> b!257929 (or (= (bvand lt!399301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399301 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!399308 () (_ BitVec 64))

(assert (=> b!257929 (= lt!399301 (bvadd lt!399308 nBits!535))))

(assert (=> b!257929 (or (not (= (bvand lt!399308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399308 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399308 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257929 (= lt!399308 (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399165))) (currentByte!12226 (_2!11970 lt!399165)) (currentBit!12221 (_2!11970 lt!399165))))))

(declare-fun b!257930 () Bool)

(assert (=> b!257930 (= e!178885 e!178881)))

(declare-fun res!216117 () Bool)

(assert (=> b!257930 (=> res!216117 e!178881)))

(assert (=> b!257930 (= res!216117 (or (not (_1!11970 lt!399305)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!526 #b0000000000000000000000000000000000000000000000000000000000000001) nBits!535)))))

(declare-fun b!257931 () Bool)

(declare-fun res!216118 () Bool)

(assert (=> b!257931 (=> (not res!216118) (not e!178885))))

(assert (=> b!257931 (= res!216118 e!178884)))

(declare-fun res!216116 () Bool)

(assert (=> b!257931 (=> res!216116 e!178884)))

(assert (=> b!257931 (= res!216116 (not (_1!11970 lt!399305)))))

(assert (= (and d!86514 c!11839) b!257928))

(assert (= (and d!86514 (not c!11839)) b!257926))

(assert (= (and b!257926 c!11838) b!257927))

(assert (= (and b!257926 (not c!11838)) b!257923))

(assert (= (and d!86514 res!216114) b!257924))

(assert (= (and b!257924 res!216115) b!257931))

(assert (= (and b!257931 (not res!216116)) b!257929))

(assert (= (and b!257931 res!216118) b!257930))

(assert (= (and b!257930 (not res!216117)) b!257925))

(declare-fun m!387421 () Bool)

(assert (=> b!257925 m!387421))

(declare-fun m!387423 () Bool)

(assert (=> b!257923 m!387423))

(declare-fun m!387425 () Bool)

(assert (=> b!257923 m!387425))

(declare-fun m!387427 () Bool)

(assert (=> b!257923 m!387427))

(declare-fun m!387429 () Bool)

(assert (=> b!257929 m!387429))

(declare-fun m!387431 () Bool)

(assert (=> b!257929 m!387431))

(declare-fun m!387433 () Bool)

(assert (=> b!257926 m!387433))

(assert (=> d!86514 m!387429))

(assert (=> d!86514 m!387431))

(assert (=> b!257864 d!86514))

(declare-fun d!86516 () Bool)

(assert (=> d!86516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399165)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399165))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399165))) (bvsub lt!399173 lt!399166)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399165)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399165))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399165)))) (bvsub lt!399173 lt!399166)))))

(declare-fun bs!21892 () Bool)

(assert (= bs!21892 d!86516))

(declare-fun m!387435 () Bool)

(assert (=> bs!21892 m!387435))

(assert (=> b!257864 d!86516))

(declare-fun d!86518 () Bool)

(declare-fun e!178886 () Bool)

(assert (=> d!86518 e!178886))

(declare-fun res!216119 () Bool)

(assert (=> d!86518 (=> (not res!216119) (not e!178886))))

(assert (=> d!86518 (= res!216119 (or (= (bvand lt!399173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399166 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!399173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!399173 lt!399166) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!399312 () Unit!18409)

(assert (=> d!86518 (= lt!399312 (choose!27 (_2!11970 lt!399004) (_2!11970 lt!399165) lt!399173 lt!399166))))

(assert (=> d!86518 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!399166) (bvsle lt!399166 lt!399173))))

(assert (=> d!86518 (= (validateOffsetBitsIneqLemma!0 (_2!11970 lt!399004) (_2!11970 lt!399165) lt!399173 lt!399166) lt!399312)))

(declare-fun b!257932 () Bool)

(assert (=> b!257932 (= e!178886 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399165)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399165))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399165))) (bvsub lt!399173 lt!399166)))))

(assert (= (and d!86518 res!216119) b!257932))

(declare-fun m!387437 () Bool)

(assert (=> d!86518 m!387437))

(assert (=> b!257932 m!387349))

(assert (=> b!257864 d!86518))

(declare-fun d!86520 () Bool)

(assert (=> d!86520 (validate_offset_bits!1 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))) (bvsub (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!86520 true))

(declare-fun _$1!348 () Unit!18409)

(assert (=> d!86520 (= (choose!27 thiss!1754 (_2!11970 lt!399004) (bvsub nBits!535 from!526) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!348)))

(declare-fun bs!21893 () Bool)

(assert (= bs!21893 d!86520))

(assert (=> bs!21893 m!387257))

(assert (=> d!86464 d!86520))

(declare-fun d!86522 () Bool)

(declare-fun lt!399315 () tuple2!22068)

(assert (=> d!86522 (= lt!399315 (readBit!0 (_2!11970 lt!399004)))))

(assert (=> d!86522 (= (readBitPure!0 (_2!11970 lt!399004)) (tuple2!22081 (_2!11970 lt!399315) (_1!11970 lt!399315)))))

(declare-fun bs!21894 () Bool)

(assert (= bs!21894 d!86522))

(assert (=> bs!21894 m!387357))

(assert (=> b!257866 d!86522))

(declare-fun d!86524 () Bool)

(declare-fun e!178887 () Bool)

(assert (=> d!86524 e!178887))

(declare-fun res!216120 () Bool)

(assert (=> d!86524 (=> (not res!216120) (not e!178887))))

(assert (=> d!86524 (= res!216120 (= (buf!6675 (_2!11973 (increaseBitIndex!0 (_2!11970 lt!399004)))) (buf!6675 (_2!11970 lt!399004))))))

(declare-fun lt!399322 () Bool)

(assert (=> d!86524 (= lt!399322 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 (_2!11970 lt!399004))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399319 () tuple2!22068)

(assert (=> d!86524 (= lt!399319 (tuple2!22069 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 (_2!11970 lt!399004))))) #b00000000000000000000000000000000)) (_2!11973 (increaseBitIndex!0 (_2!11970 lt!399004)))))))

(assert (=> d!86524 (validate_offset_bit!0 ((_ sign_extend 32) (size!6153 (buf!6675 (_2!11970 lt!399004)))) ((_ sign_extend 32) (currentByte!12226 (_2!11970 lt!399004))) ((_ sign_extend 32) (currentBit!12221 (_2!11970 lt!399004))))))

(assert (=> d!86524 (= (readBit!0 (_2!11970 lt!399004)) lt!399319)))

(declare-fun lt!399317 () (_ BitVec 64))

(declare-fun lt!399320 () (_ BitVec 64))

(declare-fun b!257933 () Bool)

(assert (=> b!257933 (= e!178887 (= (bitIndex!0 (size!6153 (buf!6675 (_2!11973 (increaseBitIndex!0 (_2!11970 lt!399004))))) (currentByte!12226 (_2!11973 (increaseBitIndex!0 (_2!11970 lt!399004)))) (currentBit!12221 (_2!11973 (increaseBitIndex!0 (_2!11970 lt!399004))))) (bvadd lt!399317 lt!399320)))))

(assert (=> b!257933 (or (not (= (bvand lt!399317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!399320 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!399317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!399317 lt!399320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!257933 (= lt!399320 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!257933 (= lt!399317 (bitIndex!0 (size!6153 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)) (currentBit!12221 (_2!11970 lt!399004))))))

(declare-fun lt!399321 () Bool)

(assert (=> b!257933 (= lt!399321 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 (_2!11970 lt!399004))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399318 () Bool)

(assert (=> b!257933 (= lt!399318 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 (_2!11970 lt!399004))))) #b00000000000000000000000000000000)))))

(declare-fun lt!399316 () Bool)

(assert (=> b!257933 (= lt!399316 (not (= (bvand ((_ sign_extend 24) (select (arr!7140 (buf!6675 (_2!11970 lt!399004))) (currentByte!12226 (_2!11970 lt!399004)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!12221 (_2!11970 lt!399004))))) #b00000000000000000000000000000000)))))

(assert (= (and d!86524 res!216120) b!257933))

(declare-fun m!387439 () Bool)

(assert (=> d!86524 m!387439))

(declare-fun m!387441 () Bool)

(assert (=> d!86524 m!387441))

(declare-fun m!387443 () Bool)

(assert (=> d!86524 m!387443))

(declare-fun m!387445 () Bool)

(assert (=> d!86524 m!387445))

(declare-fun m!387447 () Bool)

(assert (=> b!257933 m!387447))

(assert (=> b!257933 m!387355))

(assert (=> b!257933 m!387439))

(assert (=> b!257933 m!387443))

(assert (=> b!257933 m!387441))

(assert (=> b!257867 d!86524))

(declare-fun d!86526 () Bool)

(assert (=> d!86526 (= (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))) (bvsub (bvmul ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!12226 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12221 thiss!1754)))))))

(assert (=> d!86468 d!86526))

(assert (=> b!257870 d!86506))

(assert (=> b!257870 d!86508))

(assert (=> d!86432 d!86502))

(declare-fun d!86528 () Bool)

(assert (=> d!86528 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6153 (buf!6675 thiss!1754))) ((_ sign_extend 32) (currentByte!12226 thiss!1754)) ((_ sign_extend 32) (currentBit!12221 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21895 () Bool)

(assert (= bs!21895 d!86528))

(assert (=> bs!21895 m!387363))

(assert (=> d!86432 d!86528))

(assert (=> b!257875 d!86462))

(push 1)

(assert (not d!86502))

(assert (not d!86522))

(assert (not d!86520))

(assert (not b!257915))

(assert (not d!86516))

(assert (not b!257932))

(assert (not b!257923))

(assert (not d!86514))

(assert (not d!86528))

(assert (not d!86508))

(assert (not b!257933))

(assert (not d!86518))

(assert (not d!86506))

(assert (not d!86524))

(assert (not d!86500))

(assert (not d!86504))

(assert (not b!257926))

(assert (not b!257925))

(assert (not b!257929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

