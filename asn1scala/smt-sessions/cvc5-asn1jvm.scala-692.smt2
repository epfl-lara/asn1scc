; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19506 () Bool)

(assert start!19506)

(declare-fun b!97282 () Bool)

(declare-fun res!79829 () Bool)

(declare-fun e!63745 () Bool)

(assert (=> b!97282 (=> (not res!79829) (not e!63745))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-datatypes ((array!4543 0))(
  ( (array!4544 (arr!2670 (Array (_ BitVec 32) (_ BitVec 8))) (size!2077 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3628 0))(
  ( (BitStream!3629 (buf!2425 array!4543) (currentByte!4840 (_ BitVec 32)) (currentBit!4835 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3628)

(declare-datatypes ((Unit!5912 0))(
  ( (Unit!5913) )
))
(declare-datatypes ((tuple2!7780 0))(
  ( (tuple2!7781 (_1!4142 Unit!5912) (_2!4142 BitStream!3628)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3628 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7780)

(assert (=> b!97282 (= res!79829 (= (size!2077 (buf!2425 thiss!1288)) (size!2077 (buf!2425 (_2!4142 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(declare-fun b!97283 () Bool)

(declare-fun res!79832 () Bool)

(assert (=> b!97283 (=> (not res!79832) (not e!63745))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97283 (= res!79832 (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 thiss!1288))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97284 () Bool)

(declare-fun res!79830 () Bool)

(assert (=> b!97284 (=> (not res!79830) (not e!63745))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97284 (= res!79830 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!79831 () Bool)

(assert (=> start!19506 (=> (not res!79831) (not e!63745))))

(assert (=> start!19506 (= res!79831 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19506 e!63745))

(assert (=> start!19506 true))

(declare-fun e!63747 () Bool)

(declare-fun inv!12 (BitStream!3628) Bool)

(assert (=> start!19506 (and (inv!12 thiss!1288) e!63747)))

(declare-fun b!97285 () Bool)

(declare-fun array_inv!1879 (array!4543) Bool)

(assert (=> b!97285 (= e!63747 (array_inv!1879 (buf!2425 thiss!1288)))))

(declare-fun b!97286 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!97286 (= e!63745 (not (invariant!0 (currentBit!4835 thiss!1288) (currentByte!4840 thiss!1288) (size!2077 (buf!2425 thiss!1288)))))))

(assert (= (and start!19506 res!79831) b!97283))

(assert (= (and b!97283 res!79832) b!97284))

(assert (= (and b!97284 res!79830) b!97282))

(assert (= (and b!97282 res!79829) b!97286))

(assert (= start!19506 b!97285))

(declare-fun m!141439 () Bool)

(assert (=> b!97282 m!141439))

(declare-fun m!141441 () Bool)

(assert (=> b!97283 m!141441))

(declare-fun m!141443 () Bool)

(assert (=> b!97284 m!141443))

(declare-fun m!141445 () Bool)

(assert (=> start!19506 m!141445))

(declare-fun m!141447 () Bool)

(assert (=> b!97285 m!141447))

(declare-fun m!141449 () Bool)

(assert (=> b!97286 m!141449))

(push 1)

(assert (not b!97282))

(assert (not b!97285))

(assert (not b!97283))

(assert (not start!19506))

(assert (not b!97284))

(assert (not b!97286))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30628 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 thiss!1288))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2077 (buf!2425 thiss!1288))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7487 () Bool)

(assert (= bs!7487 d!30628))

(declare-fun m!141475 () Bool)

(assert (=> bs!7487 m!141475))

(assert (=> b!97283 d!30628))

(declare-fun d!30630 () Bool)

(assert (=> d!30630 (= (array_inv!1879 (buf!2425 thiss!1288)) (bvsge (size!2077 (buf!2425 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!97285 d!30630))

(declare-fun d!30634 () Bool)

(assert (=> d!30634 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!97284 d!30634))

(declare-fun d!30638 () Bool)

(assert (=> d!30638 (= (invariant!0 (currentBit!4835 thiss!1288) (currentByte!4840 thiss!1288) (size!2077 (buf!2425 thiss!1288))) (and (bvsge (currentBit!4835 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4835 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4840 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4840 thiss!1288) (size!2077 (buf!2425 thiss!1288))) (and (= (currentBit!4835 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4840 thiss!1288) (size!2077 (buf!2425 thiss!1288)))))))))

(assert (=> b!97286 d!30638))

(declare-fun b!97369 () Bool)

(declare-fun res!79899 () Bool)

(declare-fun e!63796 () Bool)

(assert (=> b!97369 (=> (not res!79899) (not e!63796))))

(declare-fun lt!141070 () (_ BitVec 64))

(declare-fun lt!141033 () tuple2!7780)

(declare-fun lt!141034 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97369 (= res!79899 (= (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141033))) (currentByte!4840 (_2!4142 lt!141033)) (currentBit!4835 (_2!4142 lt!141033))) (bvadd lt!141070 lt!141034)))))

(assert (=> b!97369 (or (not (= (bvand lt!141070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141034 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141070 lt!141034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97369 (= lt!141034 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97369 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97369 (= lt!141070 (bitIndex!0 (size!2077 (buf!2425 thiss!1288)) (currentByte!4840 thiss!1288) (currentBit!4835 thiss!1288)))))

(declare-fun b!97370 () Bool)

(declare-datatypes ((tuple2!7786 0))(
  ( (tuple2!7787 (_1!4145 BitStream!3628) (_2!4145 BitStream!3628)) )
))
(declare-fun lt!141060 () tuple2!7786)

(declare-datatypes ((tuple2!7790 0))(
  ( (tuple2!7791 (_1!4147 BitStream!3628) (_2!4147 (_ BitVec 64))) )
))
(declare-fun lt!141071 () tuple2!7790)

(assert (=> b!97370 (= e!63796 (and (= (_2!4147 lt!141071) v!196) (= (_1!4147 lt!141071) (_2!4145 lt!141060))))))

(declare-fun lt!141039 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7790)

(assert (=> b!97370 (= lt!141071 (readNLeastSignificantBitsLoopPure!0 (_1!4145 lt!141060) nBits!388 #b00000000000000000000000000000000 lt!141039))))

(declare-fun lt!141043 () Unit!5912)

(declare-fun lt!141051 () Unit!5912)

(assert (=> b!97370 (= lt!141043 lt!141051)))

(declare-fun lt!141074 () (_ BitVec 64))

(assert (=> b!97370 (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 (_2!4142 lt!141033)))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288)) lt!141074)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3628 array!4543 (_ BitVec 64)) Unit!5912)

(assert (=> b!97370 (= lt!141051 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2425 (_2!4142 lt!141033)) lt!141074))))

(declare-fun e!63795 () Bool)

(assert (=> b!97370 e!63795))

(declare-fun res!79897 () Bool)

(assert (=> b!97370 (=> (not res!79897) (not e!63795))))

(assert (=> b!97370 (= res!79897 (and (= (size!2077 (buf!2425 thiss!1288)) (size!2077 (buf!2425 (_2!4142 lt!141033)))) (bvsge lt!141074 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97370 (= lt!141074 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97370 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97370 (= lt!141039 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97370 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3628 BitStream!3628) tuple2!7786)

(assert (=> b!97370 (= lt!141060 (reader!0 thiss!1288 (_2!4142 lt!141033)))))

(declare-fun b!97371 () Bool)

(declare-datatypes ((tuple2!7794 0))(
  ( (tuple2!7795 (_1!4149 BitStream!3628) (_2!4149 Bool)) )
))
(declare-fun lt!141045 () tuple2!7794)

(declare-fun lt!141076 () tuple2!7780)

(declare-fun readBitPure!0 (BitStream!3628) tuple2!7794)

(declare-fun readerFrom!0 (BitStream!3628 (_ BitVec 32) (_ BitVec 32)) BitStream!3628)

(assert (=> b!97371 (= lt!141045 (readBitPure!0 (readerFrom!0 (_2!4142 lt!141076) (currentBit!4835 thiss!1288) (currentByte!4840 thiss!1288))))))

(declare-fun res!79895 () Bool)

(declare-fun lt!141059 () Bool)

(assert (=> b!97371 (= res!79895 (and (= (_2!4149 lt!141045) lt!141059) (= (_1!4149 lt!141045) (_2!4142 lt!141076))))))

(declare-fun e!63797 () Bool)

(assert (=> b!97371 (=> (not res!79895) (not e!63797))))

(declare-fun e!63800 () Bool)

(assert (=> b!97371 (= e!63800 e!63797)))

(declare-fun b!97372 () Bool)

(declare-fun e!63799 () tuple2!7780)

(declare-fun lt!141042 () tuple2!7780)

(declare-fun Unit!5918 () Unit!5912)

(assert (=> b!97372 (= e!63799 (tuple2!7781 Unit!5918 (_2!4142 lt!141042)))))

(assert (=> b!97372 (= lt!141059 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3628 Bool) tuple2!7780)

(assert (=> b!97372 (= lt!141076 (appendBit!0 thiss!1288 lt!141059))))

(declare-fun res!79894 () Bool)

(assert (=> b!97372 (= res!79894 (= (size!2077 (buf!2425 thiss!1288)) (size!2077 (buf!2425 (_2!4142 lt!141076)))))))

(assert (=> b!97372 (=> (not res!79894) (not e!63800))))

(assert (=> b!97372 e!63800))

(declare-fun lt!141052 () tuple2!7780)

(assert (=> b!97372 (= lt!141052 lt!141076)))

(assert (=> b!97372 (= lt!141042 (appendNLeastSignificantBitsLoop!0 (_2!4142 lt!141052) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!141053 () Unit!5912)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3628 BitStream!3628 BitStream!3628) Unit!5912)

(assert (=> b!97372 (= lt!141053 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4142 lt!141052) (_2!4142 lt!141042)))))

(declare-fun call!1200 () Bool)

(assert (=> b!97372 call!1200))

(declare-fun lt!141035 () Unit!5912)

(assert (=> b!97372 (= lt!141035 lt!141053)))

(assert (=> b!97372 (invariant!0 (currentBit!4835 thiss!1288) (currentByte!4840 thiss!1288) (size!2077 (buf!2425 (_2!4142 lt!141052))))))

(declare-fun lt!141063 () BitStream!3628)

(assert (=> b!97372 (= lt!141063 (BitStream!3629 (buf!2425 (_2!4142 lt!141052)) (currentByte!4840 thiss!1288) (currentBit!4835 thiss!1288)))))

(assert (=> b!97372 (invariant!0 (currentBit!4835 lt!141063) (currentByte!4840 lt!141063) (size!2077 (buf!2425 (_2!4142 lt!141042))))))

(declare-fun lt!141044 () BitStream!3628)

(assert (=> b!97372 (= lt!141044 (BitStream!3629 (buf!2425 (_2!4142 lt!141042)) (currentByte!4840 lt!141063) (currentBit!4835 lt!141063)))))

(declare-fun lt!141075 () tuple2!7794)

(assert (=> b!97372 (= lt!141075 (readBitPure!0 lt!141063))))

(declare-fun lt!141066 () tuple2!7794)

(assert (=> b!97372 (= lt!141066 (readBitPure!0 lt!141044))))

(declare-fun lt!141065 () Unit!5912)

(declare-fun readBitPrefixLemma!0 (BitStream!3628 BitStream!3628) Unit!5912)

(assert (=> b!97372 (= lt!141065 (readBitPrefixLemma!0 lt!141063 (_2!4142 lt!141042)))))

(declare-fun res!79893 () Bool)

(assert (=> b!97372 (= res!79893 (= (bitIndex!0 (size!2077 (buf!2425 (_1!4149 lt!141075))) (currentByte!4840 (_1!4149 lt!141075)) (currentBit!4835 (_1!4149 lt!141075))) (bitIndex!0 (size!2077 (buf!2425 (_1!4149 lt!141066))) (currentByte!4840 (_1!4149 lt!141066)) (currentBit!4835 (_1!4149 lt!141066)))))))

(declare-fun e!63794 () Bool)

(assert (=> b!97372 (=> (not res!79893) (not e!63794))))

(assert (=> b!97372 e!63794))

(declare-fun lt!141040 () Unit!5912)

(assert (=> b!97372 (= lt!141040 lt!141065)))

(declare-fun lt!141046 () tuple2!7786)

(assert (=> b!97372 (= lt!141046 (reader!0 thiss!1288 (_2!4142 lt!141042)))))

(declare-fun lt!141037 () tuple2!7786)

(assert (=> b!97372 (= lt!141037 (reader!0 (_2!4142 lt!141052) (_2!4142 lt!141042)))))

(declare-fun lt!141038 () tuple2!7794)

(assert (=> b!97372 (= lt!141038 (readBitPure!0 (_1!4145 lt!141046)))))

(assert (=> b!97372 (= (_2!4149 lt!141038) lt!141059)))

(declare-fun lt!141073 () Unit!5912)

(declare-fun Unit!5919 () Unit!5912)

(assert (=> b!97372 (= lt!141073 Unit!5919)))

(declare-fun lt!141067 () (_ BitVec 64))

(assert (=> b!97372 (= lt!141067 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!141072 () (_ BitVec 64))

(assert (=> b!97372 (= lt!141072 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!141062 () Unit!5912)

(assert (=> b!97372 (= lt!141062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2425 (_2!4142 lt!141042)) lt!141072))))

(assert (=> b!97372 (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 (_2!4142 lt!141042)))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288)) lt!141072)))

(declare-fun lt!141041 () Unit!5912)

(assert (=> b!97372 (= lt!141041 lt!141062)))

(declare-fun lt!141068 () tuple2!7790)

(assert (=> b!97372 (= lt!141068 (readNLeastSignificantBitsLoopPure!0 (_1!4145 lt!141046) nBits!388 #b00000000000000000000000000000000 lt!141067))))

(declare-fun lt!141050 () (_ BitVec 64))

(assert (=> b!97372 (= lt!141050 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!141058 () Unit!5912)

(assert (=> b!97372 (= lt!141058 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4142 lt!141052) (buf!2425 (_2!4142 lt!141042)) lt!141050))))

(assert (=> b!97372 (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 (_2!4142 lt!141042)))) ((_ sign_extend 32) (currentByte!4840 (_2!4142 lt!141052))) ((_ sign_extend 32) (currentBit!4835 (_2!4142 lt!141052))) lt!141050)))

(declare-fun lt!141064 () Unit!5912)

(assert (=> b!97372 (= lt!141064 lt!141058)))

(declare-fun lt!141036 () tuple2!7790)

(assert (=> b!97372 (= lt!141036 (readNLeastSignificantBitsLoopPure!0 (_1!4145 lt!141037) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141067 (ite (_2!4149 lt!141038) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!141056 () tuple2!7790)

(assert (=> b!97372 (= lt!141056 (readNLeastSignificantBitsLoopPure!0 (_1!4145 lt!141046) nBits!388 #b00000000000000000000000000000000 lt!141067))))

(declare-fun c!6162 () Bool)

(assert (=> b!97372 (= c!6162 (_2!4149 (readBitPure!0 (_1!4145 lt!141046))))))

(declare-fun lt!141049 () tuple2!7790)

(declare-fun e!63798 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3628 (_ BitVec 64)) BitStream!3628)

(assert (=> b!97372 (= lt!141049 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4145 lt!141046) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141067 e!63798)))))

(declare-fun lt!141057 () Unit!5912)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5912)

(assert (=> b!97372 (= lt!141057 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4145 lt!141046) nBits!388 #b00000000000000000000000000000000 lt!141067))))

(assert (=> b!97372 (and (= (_2!4147 lt!141056) (_2!4147 lt!141049)) (= (_1!4147 lt!141056) (_1!4147 lt!141049)))))

(declare-fun lt!141032 () Unit!5912)

(assert (=> b!97372 (= lt!141032 lt!141057)))

(assert (=> b!97372 (= (_1!4145 lt!141046) (withMovedBitIndex!0 (_2!4145 lt!141046) (bvsub (bitIndex!0 (size!2077 (buf!2425 thiss!1288)) (currentByte!4840 thiss!1288) (currentBit!4835 thiss!1288)) (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141042))) (currentByte!4840 (_2!4142 lt!141042)) (currentBit!4835 (_2!4142 lt!141042))))))))

(declare-fun lt!141054 () Unit!5912)

(declare-fun Unit!5920 () Unit!5912)

(assert (=> b!97372 (= lt!141054 Unit!5920)))

(assert (=> b!97372 (= (_1!4145 lt!141037) (withMovedBitIndex!0 (_2!4145 lt!141037) (bvsub (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141052))) (currentByte!4840 (_2!4142 lt!141052)) (currentBit!4835 (_2!4142 lt!141052))) (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141042))) (currentByte!4840 (_2!4142 lt!141042)) (currentBit!4835 (_2!4142 lt!141042))))))))

(declare-fun lt!141048 () Unit!5912)

(declare-fun Unit!5921 () Unit!5912)

(assert (=> b!97372 (= lt!141048 Unit!5921)))

(assert (=> b!97372 (= (bitIndex!0 (size!2077 (buf!2425 thiss!1288)) (currentByte!4840 thiss!1288) (currentBit!4835 thiss!1288)) (bvsub (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141052))) (currentByte!4840 (_2!4142 lt!141052)) (currentBit!4835 (_2!4142 lt!141052))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!141061 () Unit!5912)

(declare-fun Unit!5923 () Unit!5912)

(assert (=> b!97372 (= lt!141061 Unit!5923)))

(assert (=> b!97372 (= (_2!4147 lt!141068) (_2!4147 lt!141036))))

(declare-fun lt!141069 () Unit!5912)

(declare-fun Unit!5924 () Unit!5912)

(assert (=> b!97372 (= lt!141069 Unit!5924)))

(assert (=> b!97372 (= (_1!4147 lt!141068) (_2!4145 lt!141046))))

(declare-fun b!97373 () Bool)

(assert (=> b!97373 (= e!63798 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!97374 () Bool)

(declare-fun res!79900 () Bool)

(assert (=> b!97374 (=> (not res!79900) (not e!63796))))

(declare-fun isPrefixOf!0 (BitStream!3628 BitStream!3628) Bool)

(assert (=> b!97374 (= res!79900 (isPrefixOf!0 thiss!1288 (_2!4142 lt!141033)))))

(declare-fun b!97375 () Bool)

(assert (=> b!97375 (= e!63797 (= (bitIndex!0 (size!2077 (buf!2425 (_1!4149 lt!141045))) (currentByte!4840 (_1!4149 lt!141045)) (currentBit!4835 (_1!4149 lt!141045))) (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141076))) (currentByte!4840 (_2!4142 lt!141076)) (currentBit!4835 (_2!4142 lt!141076)))))))

(declare-fun b!97376 () Bool)

(declare-fun res!79898 () Bool)

(assert (=> b!97376 (= res!79898 (= (bitIndex!0 (size!2077 (buf!2425 (_2!4142 lt!141076))) (currentByte!4840 (_2!4142 lt!141076)) (currentBit!4835 (_2!4142 lt!141076))) (bvadd (bitIndex!0 (size!2077 (buf!2425 thiss!1288)) (currentByte!4840 thiss!1288) (currentBit!4835 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97376 (=> (not res!79898) (not e!63800))))

(declare-fun b!97377 () Bool)

(declare-fun lt!141047 () Unit!5912)

(assert (=> b!97377 (= e!63799 (tuple2!7781 lt!141047 thiss!1288))))

(declare-fun lt!141055 () BitStream!3628)

(assert (=> b!97377 (= lt!141055 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3628) Unit!5912)

(assert (=> b!97377 (= lt!141047 (lemmaIsPrefixRefl!0 lt!141055))))

(assert (=> b!97377 call!1200))

(declare-fun d!30642 () Bool)

(assert (=> d!30642 e!63796))

(declare-fun res!79901 () Bool)

(assert (=> d!30642 (=> (not res!79901) (not e!63796))))

(assert (=> d!30642 (= res!79901 (= (size!2077 (buf!2425 thiss!1288)) (size!2077 (buf!2425 (_2!4142 lt!141033)))))))

(assert (=> d!30642 (= lt!141033 e!63799)))

(declare-fun c!6161 () Bool)

(assert (=> d!30642 (= c!6161 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30642 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30642 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!141033)))

(declare-fun b!97378 () Bool)

(assert (=> b!97378 (= e!63795 (validate_offset_bits!1 ((_ sign_extend 32) (size!2077 (buf!2425 thiss!1288))) ((_ sign_extend 32) (currentByte!4840 thiss!1288)) ((_ sign_extend 32) (currentBit!4835 thiss!1288)) lt!141074))))

(declare-fun b!97379 () Bool)

(assert (=> b!97379 (= e!63794 (= (_2!4149 lt!141075) (_2!4149 lt!141066)))))

(declare-fun b!97380 () Bool)

(declare-fun res!79896 () Bool)

(assert (=> b!97380 (= res!79896 (isPrefixOf!0 thiss!1288 (_2!4142 lt!141076)))))

(assert (=> b!97380 (=> (not res!79896) (not e!63800))))

(declare-fun bm!1197 () Bool)

(assert (=> bm!1197 (= call!1200 (isPrefixOf!0 (ite c!6161 thiss!1288 lt!141055) (ite c!6161 (_2!4142 lt!141042) lt!141055)))))

(declare-fun b!97381 () Bool)

(assert (=> b!97381 (= e!63798 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (= (and d!30642 c!6161) b!97372))

(assert (= (and d!30642 (not c!6161)) b!97377))

(assert (= (and b!97372 res!79894) b!97376))

(assert (= (and b!97376 res!79898) b!97380))

(assert (= (and b!97380 res!79896) b!97371))

(assert (= (and b!97371 res!79895) b!97375))

(assert (= (and b!97372 res!79893) b!97379))

(assert (= (and b!97372 c!6162) b!97373))

(assert (= (and b!97372 (not c!6162)) b!97381))

(assert (= (or b!97372 b!97377) bm!1197))

(assert (= (and d!30642 res!79901) b!97369))

(assert (= (and b!97369 res!79899) b!97374))

(assert (= (and b!97374 res!79900) b!97370))

(assert (= (and b!97370 res!79897) b!97378))

(declare-fun m!141479 () Bool)

(assert (=> b!97371 m!141479))

(assert (=> b!97371 m!141479))

(declare-fun m!141481 () Bool)

(assert (=> b!97371 m!141481))

(declare-fun m!141483 () Bool)

(assert (=> bm!1197 m!141483))

(declare-fun m!141485 () Bool)

(assert (=> b!97376 m!141485))

(declare-fun m!141487 () Bool)

(assert (=> b!97376 m!141487))

(declare-fun m!141489 () Bool)

(assert (=> b!97380 m!141489))

(declare-fun m!141491 () Bool)

(assert (=> b!97372 m!141491))

(declare-fun m!141493 () Bool)

(assert (=> b!97372 m!141493))

(declare-fun m!141495 () Bool)

(assert (=> b!97372 m!141495))

(declare-fun m!141497 () Bool)

(assert (=> b!97372 m!141497))

(declare-fun m!141499 () Bool)

(assert (=> b!97372 m!141499))

(assert (=> b!97372 m!141487))

(declare-fun m!141501 () Bool)

(assert (=> b!97372 m!141501))

(assert (=> b!97372 m!141497))

(declare-fun m!141503 () Bool)

(assert (=> b!97372 m!141503))

(declare-fun m!141505 () Bool)

(assert (=> b!97372 m!141505))

(declare-fun m!141507 () Bool)

(assert (=> b!97372 m!141507))

(declare-fun m!141509 () Bool)

(assert (=> b!97372 m!141509))

(declare-fun m!141511 () Bool)

(assert (=> b!97372 m!141511))

(declare-fun m!141513 () Bool)

(assert (=> b!97372 m!141513))

(declare-fun m!141515 () Bool)

(assert (=> b!97372 m!141515))

(declare-fun m!141517 () Bool)

(assert (=> b!97372 m!141517))

(declare-fun m!141519 () Bool)

(assert (=> b!97372 m!141519))

(declare-fun m!141521 () Bool)

(assert (=> b!97372 m!141521))

(declare-fun m!141523 () Bool)

(assert (=> b!97372 m!141523))

(declare-fun m!141525 () Bool)

(assert (=> b!97372 m!141525))

(declare-fun m!141527 () Bool)

(assert (=> b!97372 m!141527))

(declare-fun m!141529 () Bool)

(assert (=> b!97372 m!141529))

(declare-fun m!141531 () Bool)

(assert (=> b!97372 m!141531))

(declare-fun m!141535 () Bool)

(assert (=> b!97372 m!141535))

(declare-fun m!141541 () Bool)

(assert (=> b!97372 m!141541))

(declare-fun m!141545 () Bool)

(assert (=> b!97372 m!141545))

(declare-fun m!141551 () Bool)

(assert (=> b!97372 m!141551))

(declare-fun m!141557 () Bool)

(assert (=> b!97372 m!141557))

(declare-fun m!141561 () Bool)

(assert (=> b!97372 m!141561))

(declare-fun m!141563 () Bool)

(assert (=> b!97377 m!141563))

(declare-fun m!141567 () Bool)

(assert (=> b!97378 m!141567))

(declare-fun m!141571 () Bool)

(assert (=> b!97370 m!141571))

(declare-fun m!141573 () Bool)

(assert (=> b!97370 m!141573))

(assert (=> b!97370 m!141509))

(declare-fun m!141579 () Bool)

(assert (=> b!97370 m!141579))

(declare-fun m!141583 () Bool)

(assert (=> b!97370 m!141583))

(declare-fun m!141585 () Bool)

(assert (=> b!97374 m!141585))

(declare-fun m!141589 () Bool)

(assert (=> b!97369 m!141589))

(assert (=> b!97369 m!141487))

(declare-fun m!141597 () Bool)

(assert (=> b!97375 m!141597))

(assert (=> b!97375 m!141485))

(assert (=> b!97282 d!30642))

(declare-fun d!30646 () Bool)

(assert (=> d!30646 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4835 thiss!1288) (currentByte!4840 thiss!1288) (size!2077 (buf!2425 thiss!1288))))))

(declare-fun bs!7489 () Bool)

(assert (= bs!7489 d!30646))

(assert (=> bs!7489 m!141449))

(assert (=> start!19506 d!30646))

(push 1)

(assert (not b!97370))

(assert (not d!30628))

(assert (not b!97380))

(assert (not b!97375))

(assert (not b!97374))

(assert (not b!97378))

(assert (not b!97372))

(assert (not bm!1197))

(assert (not b!97376))

(assert (not b!97377))

(assert (not d!30646))

(assert (not b!97371))

(assert (not b!97369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

