; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22536 () Bool)

(assert start!22536)

(declare-fun b!113940 () Bool)

(declare-fun e!74732 () Bool)

(declare-fun e!74734 () Bool)

(assert (=> b!113940 (= e!74732 e!74734)))

(declare-fun res!94126 () Bool)

(assert (=> b!113940 (=> (not res!94126) (not e!74734))))

(declare-fun lt!173249 () (_ BitVec 64))

(declare-fun lt!173250 () (_ BitVec 64))

(assert (=> b!113940 (= res!94126 (= lt!173249 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!173250)))))

(declare-datatypes ((array!5174 0))(
  ( (array!5175 (arr!2943 (Array (_ BitVec 32) (_ BitVec 8))) (size!2350 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4174 0))(
  ( (BitStream!4175 (buf!2758 array!5174) (currentByte!5353 (_ BitVec 32)) (currentBit!5348 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7003 0))(
  ( (Unit!7004) )
))
(declare-datatypes ((tuple2!9396 0))(
  ( (tuple2!9397 (_1!4960 Unit!7003) (_2!4960 BitStream!4174)) )
))
(declare-fun lt!173251 () tuple2!9396)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113940 (= lt!173249 (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))))))

(declare-fun thiss!1305 () BitStream!4174)

(assert (=> b!113940 (= lt!173250 (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)))))

(declare-fun res!94120 () Bool)

(declare-fun e!74735 () Bool)

(assert (=> start!22536 (=> (not res!94120) (not e!74735))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22536 (= res!94120 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22536 e!74735))

(assert (=> start!22536 true))

(declare-fun e!74731 () Bool)

(declare-fun inv!12 (BitStream!4174) Bool)

(assert (=> start!22536 (and (inv!12 thiss!1305) e!74731)))

(declare-fun b!113941 () Bool)

(declare-fun res!94127 () Bool)

(assert (=> b!113941 (=> (not res!94127) (not e!74734))))

(declare-fun isPrefixOf!0 (BitStream!4174 BitStream!4174) Bool)

(assert (=> b!113941 (= res!94127 (isPrefixOf!0 thiss!1305 (_2!4960 lt!173251)))))

(declare-fun b!113942 () Bool)

(declare-fun e!74729 () Bool)

(assert (=> b!113942 (= e!74734 e!74729)))

(declare-fun res!94122 () Bool)

(assert (=> b!113942 (=> (not res!94122) (not e!74729))))

(declare-fun lt!173253 () Bool)

(declare-datatypes ((tuple2!9398 0))(
  ( (tuple2!9399 (_1!4961 BitStream!4174) (_2!4961 Bool)) )
))
(declare-fun lt!173254 () tuple2!9398)

(assert (=> b!113942 (= res!94122 (and (= (_2!4961 lt!173254) lt!173253) (= (_1!4961 lt!173254) (_2!4960 lt!173251))))))

(declare-fun readBitPure!0 (BitStream!4174) tuple2!9398)

(declare-fun readerFrom!0 (BitStream!4174 (_ BitVec 32) (_ BitVec 32)) BitStream!4174)

(assert (=> b!113942 (= lt!173254 (readBitPure!0 (readerFrom!0 (_2!4960 lt!173251) (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305))))))

(declare-fun b!113943 () Bool)

(declare-fun e!74733 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113943 (= e!74733 (validate_offset_bit!0 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305))))))

(declare-fun b!113944 () Bool)

(declare-fun res!94121 () Bool)

(assert (=> b!113944 (=> (not res!94121) (not e!74735))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113944 (= res!94121 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113945 () Bool)

(declare-fun res!94119 () Bool)

(assert (=> b!113945 (=> (not res!94119) (not e!74735))))

(assert (=> b!113945 (= res!94119 (bvslt i!615 nBits!396))))

(declare-fun b!113946 () Bool)

(declare-fun e!74730 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!113946 (= e!74730 (invariant!0 (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(declare-fun b!113947 () Bool)

(declare-fun res!94118 () Bool)

(assert (=> b!113947 (=> (not res!94118) (not e!74735))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113947 (= res!94118 (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113948 () Bool)

(declare-fun array_inv!2152 (array!5174) Bool)

(assert (=> b!113948 (= e!74731 (array_inv!2152 (buf!2758 thiss!1305)))))

(declare-fun b!113949 () Bool)

(assert (=> b!113949 (= e!74735 (not e!74733))))

(declare-fun res!94123 () Bool)

(assert (=> b!113949 (=> res!94123 e!74733)))

(declare-fun lt!173255 () tuple2!9396)

(assert (=> b!113949 (= res!94123 (not (= (size!2350 (buf!2758 (_2!4960 lt!173251))) (size!2350 (buf!2758 (_2!4960 lt!173255))))))))

(assert (=> b!113949 e!74730))

(declare-fun res!94125 () Bool)

(assert (=> b!113949 (=> (not res!94125) (not e!74730))))

(assert (=> b!113949 (= res!94125 (isPrefixOf!0 thiss!1305 (_2!4960 lt!173255)))))

(declare-fun lt!173252 () Unit!7003)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4174 BitStream!4174 BitStream!4174) Unit!7003)

(assert (=> b!113949 (= lt!173252 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4960 lt!173251) (_2!4960 lt!173255)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4174 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9396)

(assert (=> b!113949 (= lt!173255 (appendNLeastSignificantBitsLoop!0 (_2!4960 lt!173251) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113949 e!74732))

(declare-fun res!94124 () Bool)

(assert (=> b!113949 (=> (not res!94124) (not e!74732))))

(assert (=> b!113949 (= res!94124 (= (size!2350 (buf!2758 thiss!1305)) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(declare-fun appendBit!0 (BitStream!4174 Bool) tuple2!9396)

(assert (=> b!113949 (= lt!173251 (appendBit!0 thiss!1305 lt!173253))))

(assert (=> b!113949 (= lt!173253 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113950 () Bool)

(assert (=> b!113950 (= e!74729 (= (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173254))) (currentByte!5353 (_1!4961 lt!173254)) (currentBit!5348 (_1!4961 lt!173254))) lt!173249))))

(assert (= (and start!22536 res!94120) b!113947))

(assert (= (and b!113947 res!94118) b!113944))

(assert (= (and b!113944 res!94121) b!113945))

(assert (= (and b!113945 res!94119) b!113949))

(assert (= (and b!113949 res!94124) b!113940))

(assert (= (and b!113940 res!94126) b!113941))

(assert (= (and b!113941 res!94127) b!113942))

(assert (= (and b!113942 res!94122) b!113950))

(assert (= (and b!113949 res!94125) b!113946))

(assert (= (and b!113949 (not res!94123)) b!113943))

(assert (= start!22536 b!113948))

(declare-fun m!170191 () Bool)

(assert (=> b!113941 m!170191))

(declare-fun m!170193 () Bool)

(assert (=> b!113949 m!170193))

(declare-fun m!170195 () Bool)

(assert (=> b!113949 m!170195))

(declare-fun m!170197 () Bool)

(assert (=> b!113949 m!170197))

(declare-fun m!170199 () Bool)

(assert (=> b!113949 m!170199))

(declare-fun m!170201 () Bool)

(assert (=> start!22536 m!170201))

(declare-fun m!170203 () Bool)

(assert (=> b!113940 m!170203))

(declare-fun m!170205 () Bool)

(assert (=> b!113940 m!170205))

(declare-fun m!170207 () Bool)

(assert (=> b!113947 m!170207))

(declare-fun m!170209 () Bool)

(assert (=> b!113943 m!170209))

(declare-fun m!170211 () Bool)

(assert (=> b!113942 m!170211))

(assert (=> b!113942 m!170211))

(declare-fun m!170213 () Bool)

(assert (=> b!113942 m!170213))

(declare-fun m!170215 () Bool)

(assert (=> b!113948 m!170215))

(declare-fun m!170217 () Bool)

(assert (=> b!113944 m!170217))

(declare-fun m!170219 () Bool)

(assert (=> b!113946 m!170219))

(declare-fun m!170221 () Bool)

(assert (=> b!113950 m!170221))

(push 1)

(assert (not b!113946))

(assert (not b!113947))

(assert (not b!113950))

(assert (not b!113944))

(assert (not b!113948))

(assert (not start!22536))

(assert (not b!113941))

(assert (not b!113942))

(assert (not b!113940))

(assert (not b!113949))

(assert (not b!113943))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36586 () Bool)

(declare-datatypes ((tuple2!9416 0))(
  ( (tuple2!9417 (_1!4970 Bool) (_2!4970 BitStream!4174)) )
))
(declare-fun lt!173303 () tuple2!9416)

(declare-fun readBit!0 (BitStream!4174) tuple2!9416)

(assert (=> d!36586 (= lt!173303 (readBit!0 (readerFrom!0 (_2!4960 lt!173251) (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305))))))

(assert (=> d!36586 (= (readBitPure!0 (readerFrom!0 (_2!4960 lt!173251) (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305))) (tuple2!9399 (_2!4970 lt!173303) (_1!4970 lt!173303)))))

(declare-fun bs!8888 () Bool)

(assert (= bs!8888 d!36586))

(assert (=> bs!8888 m!170211))

(declare-fun m!170295 () Bool)

(assert (=> bs!8888 m!170295))

(assert (=> b!113942 d!36586))

(declare-fun d!36588 () Bool)

(declare-fun e!74793 () Bool)

(assert (=> d!36588 e!74793))

(declare-fun res!94200 () Bool)

(assert (=> d!36588 (=> (not res!94200) (not e!74793))))

(assert (=> d!36588 (= res!94200 (invariant!0 (currentBit!5348 (_2!4960 lt!173251)) (currentByte!5353 (_2!4960 lt!173251)) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(assert (=> d!36588 (= (readerFrom!0 (_2!4960 lt!173251) (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305)) (BitStream!4175 (buf!2758 (_2!4960 lt!173251)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)))))

(declare-fun b!114028 () Bool)

(assert (=> b!114028 (= e!74793 (invariant!0 (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(assert (= (and d!36588 res!94200) b!114028))

(declare-fun m!170297 () Bool)

(assert (=> d!36588 m!170297))

(assert (=> b!114028 m!170219))

(assert (=> b!113942 d!36588))

(declare-fun d!36590 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36590 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8889 () Bool)

(assert (= bs!8889 d!36590))

(declare-fun m!170299 () Bool)

(assert (=> bs!8889 m!170299))

(assert (=> b!113947 d!36590))

(declare-fun d!36592 () Bool)

(assert (=> d!36592 (= (array_inv!2152 (buf!2758 thiss!1305)) (bvsge (size!2350 (buf!2758 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113948 d!36592))

(declare-fun d!36594 () Bool)

(assert (=> d!36594 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305) (size!2350 (buf!2758 thiss!1305))))))

(declare-fun bs!8890 () Bool)

(assert (= bs!8890 d!36594))

(declare-fun m!170301 () Bool)

(assert (=> bs!8890 m!170301))

(assert (=> start!22536 d!36594))

(declare-fun d!36596 () Bool)

(assert (=> d!36596 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8891 () Bool)

(assert (= bs!8891 d!36596))

(declare-fun m!170303 () Bool)

(assert (=> bs!8891 m!170303))

(assert (=> b!113943 d!36596))

(declare-fun d!36598 () Bool)

(assert (=> d!36598 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113944 d!36598))

(declare-fun d!36600 () Bool)

(declare-fun res!94208 () Bool)

(declare-fun e!74798 () Bool)

(assert (=> d!36600 (=> (not res!94208) (not e!74798))))

(assert (=> d!36600 (= res!94208 (= (size!2350 (buf!2758 thiss!1305)) (size!2350 (buf!2758 (_2!4960 lt!173255)))))))

(assert (=> d!36600 (= (isPrefixOf!0 thiss!1305 (_2!4960 lt!173255)) e!74798)))

(declare-fun b!114035 () Bool)

(declare-fun res!94207 () Bool)

(assert (=> b!114035 (=> (not res!94207) (not e!74798))))

(assert (=> b!114035 (= res!94207 (bvsle (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173255))) (currentByte!5353 (_2!4960 lt!173255)) (currentBit!5348 (_2!4960 lt!173255)))))))

(declare-fun b!114036 () Bool)

(declare-fun e!74799 () Bool)

(assert (=> b!114036 (= e!74798 e!74799)))

(declare-fun res!94209 () Bool)

(assert (=> b!114036 (=> res!94209 e!74799)))

(assert (=> b!114036 (= res!94209 (= (size!2350 (buf!2758 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114037 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5174 array!5174 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!114037 (= e!74799 (arrayBitRangesEq!0 (buf!2758 thiss!1305) (buf!2758 (_2!4960 lt!173255)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305))))))

(assert (= (and d!36600 res!94208) b!114035))

(assert (= (and b!114035 res!94207) b!114036))

(assert (= (and b!114036 (not res!94209)) b!114037))

(assert (=> b!114035 m!170205))

(declare-fun m!170305 () Bool)

(assert (=> b!114035 m!170305))

(assert (=> b!114037 m!170205))

(assert (=> b!114037 m!170205))

(declare-fun m!170307 () Bool)

(assert (=> b!114037 m!170307))

(assert (=> b!113949 d!36600))

(declare-fun d!36602 () Bool)

(assert (=> d!36602 (isPrefixOf!0 thiss!1305 (_2!4960 lt!173255))))

(declare-fun lt!173306 () Unit!7003)

(declare-fun choose!30 (BitStream!4174 BitStream!4174 BitStream!4174) Unit!7003)

(assert (=> d!36602 (= lt!173306 (choose!30 thiss!1305 (_2!4960 lt!173251) (_2!4960 lt!173255)))))

(assert (=> d!36602 (isPrefixOf!0 thiss!1305 (_2!4960 lt!173251))))

(assert (=> d!36602 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4960 lt!173251) (_2!4960 lt!173255)) lt!173306)))

(declare-fun bs!8892 () Bool)

(assert (= bs!8892 d!36602))

(assert (=> bs!8892 m!170193))

(declare-fun m!170309 () Bool)

(assert (=> bs!8892 m!170309))

(assert (=> bs!8892 m!170191))

(assert (=> b!113949 d!36602))

(declare-fun b!114191 () Bool)

(declare-fun e!74890 () (_ BitVec 64))

(assert (=> b!114191 (= e!74890 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-datatypes ((tuple2!9418 0))(
  ( (tuple2!9419 (_1!4971 BitStream!4174) (_2!4971 BitStream!4174)) )
))
(declare-fun lt!173758 () tuple2!9418)

(declare-datatypes ((tuple2!9420 0))(
  ( (tuple2!9421 (_1!4972 BitStream!4174) (_2!4972 (_ BitVec 64))) )
))
(declare-fun lt!173768 () tuple2!9420)

(declare-fun e!74888 () Bool)

(declare-fun b!114192 () Bool)

(assert (=> b!114192 (= e!74888 (and (= (_2!4972 lt!173768) v!199) (= (_1!4972 lt!173768) (_2!4971 lt!173758))))))

(declare-fun lt!173779 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9420)

(assert (=> b!114192 (= lt!173768 (readNLeastSignificantBitsLoopPure!0 (_1!4971 lt!173758) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173779))))

(declare-fun lt!173743 () Unit!7003)

(declare-fun lt!173748 () Unit!7003)

(assert (=> b!114192 (= lt!173743 lt!173748)))

(declare-fun lt!173762 () tuple2!9396)

(declare-fun lt!173784 () (_ BitVec 64))

(assert (=> b!114192 (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173762)))) ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173251))) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173251))) lt!173784)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4174 array!5174 (_ BitVec 64)) Unit!7003)

(assert (=> b!114192 (= lt!173748 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4960 lt!173251) (buf!2758 (_2!4960 lt!173762)) lt!173784))))

(declare-fun e!74887 () Bool)

(assert (=> b!114192 e!74887))

(declare-fun res!94340 () Bool)

(assert (=> b!114192 (=> (not res!94340) (not e!74887))))

(assert (=> b!114192 (= res!94340 (and (= (size!2350 (buf!2758 (_2!4960 lt!173251))) (size!2350 (buf!2758 (_2!4960 lt!173762)))) (bvsge lt!173784 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114192 (= lt!173784 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114192 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114192 (= lt!173779 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!114192 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4174 BitStream!4174) tuple2!9418)

(assert (=> b!114192 (= lt!173758 (reader!0 (_2!4960 lt!173251) (_2!4960 lt!173762)))))

(declare-fun b!114193 () Bool)

(declare-fun res!94339 () Bool)

(declare-fun lt!173778 () tuple2!9396)

(assert (=> b!114193 (= res!94339 (= (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173778))) (currentByte!5353 (_2!4960 lt!173778)) (currentBit!5348 (_2!4960 lt!173778))) (bvadd (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!74885 () Bool)

(assert (=> b!114193 (=> (not res!94339) (not e!74885))))

(declare-fun b!114194 () Bool)

(declare-fun e!74886 () Bool)

(declare-fun lt!173744 () tuple2!9398)

(assert (=> b!114194 (= e!74886 (= (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173744))) (currentByte!5353 (_1!4961 lt!173744)) (currentBit!5348 (_1!4961 lt!173744))) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173778))) (currentByte!5353 (_2!4960 lt!173778)) (currentBit!5348 (_2!4960 lt!173778)))))))

(declare-fun lt!173773 () BitStream!4174)

(declare-fun bm!1463 () Bool)

(declare-fun call!1466 () Bool)

(declare-fun c!6924 () Bool)

(assert (=> bm!1463 (= call!1466 (isPrefixOf!0 (ite c!6924 (_2!4960 lt!173251) lt!173773) (ite c!6924 (_2!4960 lt!173778) lt!173773)))))

(declare-fun b!114195 () Bool)

(assert (=> b!114195 (= e!74890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!114196 () Bool)

(declare-fun res!94333 () Bool)

(assert (=> b!114196 (=> (not res!94333) (not e!74888))))

(declare-fun lt!173776 () (_ BitVec 64))

(declare-fun lt!173749 () (_ BitVec 64))

(assert (=> b!114196 (= res!94333 (= (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173762))) (currentByte!5353 (_2!4960 lt!173762)) (currentBit!5348 (_2!4960 lt!173762))) (bvadd lt!173776 lt!173749)))))

(assert (=> b!114196 (or (not (= (bvand lt!173776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173749 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173776 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173776 lt!173749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114196 (= lt!173749 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!114196 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!114196 (= lt!173776 (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))))))

(declare-fun b!114197 () Bool)

(declare-fun res!94338 () Bool)

(assert (=> b!114197 (=> (not res!94338) (not e!74888))))

(assert (=> b!114197 (= res!94338 (isPrefixOf!0 (_2!4960 lt!173251) (_2!4960 lt!173762)))))

(declare-fun d!36604 () Bool)

(assert (=> d!36604 e!74888))

(declare-fun res!94336 () Bool)

(assert (=> d!36604 (=> (not res!94336) (not e!74888))))

(assert (=> d!36604 (= res!94336 (= (size!2350 (buf!2758 (_2!4960 lt!173251))) (size!2350 (buf!2758 (_2!4960 lt!173762)))))))

(declare-fun e!74889 () tuple2!9396)

(assert (=> d!36604 (= lt!173762 e!74889)))

(assert (=> d!36604 (= c!6924 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36604 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36604 (= (appendNLeastSignificantBitsLoop!0 (_2!4960 lt!173251) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!173762)))

(declare-fun b!114198 () Bool)

(declare-fun lt!173785 () tuple2!9396)

(declare-fun Unit!7016 () Unit!7003)

(assert (=> b!114198 (= e!74889 (tuple2!9397 Unit!7016 (_2!4960 lt!173785)))))

(declare-fun lt!173783 () Bool)

(assert (=> b!114198 (= lt!173783 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114198 (= lt!173778 (appendBit!0 (_2!4960 lt!173251) lt!173783))))

(declare-fun res!94332 () Bool)

(assert (=> b!114198 (= res!94332 (= (size!2350 (buf!2758 (_2!4960 lt!173251))) (size!2350 (buf!2758 (_2!4960 lt!173778)))))))

(assert (=> b!114198 (=> (not res!94332) (not e!74885))))

(assert (=> b!114198 e!74885))

(declare-fun lt!173761 () tuple2!9396)

(assert (=> b!114198 (= lt!173761 lt!173778)))

(assert (=> b!114198 (= lt!173785 (appendNLeastSignificantBitsLoop!0 (_2!4960 lt!173761) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!173769 () Unit!7003)

(assert (=> b!114198 (= lt!173769 (lemmaIsPrefixTransitive!0 (_2!4960 lt!173251) (_2!4960 lt!173761) (_2!4960 lt!173785)))))

(assert (=> b!114198 (isPrefixOf!0 (_2!4960 lt!173251) (_2!4960 lt!173785))))

(declare-fun lt!173782 () Unit!7003)

(assert (=> b!114198 (= lt!173782 lt!173769)))

(assert (=> b!114198 (invariant!0 (currentBit!5348 (_2!4960 lt!173251)) (currentByte!5353 (_2!4960 lt!173251)) (size!2350 (buf!2758 (_2!4960 lt!173761))))))

(declare-fun lt!173760 () BitStream!4174)

(assert (=> b!114198 (= lt!173760 (BitStream!4175 (buf!2758 (_2!4960 lt!173761)) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))))))

(assert (=> b!114198 (invariant!0 (currentBit!5348 lt!173760) (currentByte!5353 lt!173760) (size!2350 (buf!2758 (_2!4960 lt!173785))))))

(declare-fun lt!173775 () BitStream!4174)

(assert (=> b!114198 (= lt!173775 (BitStream!4175 (buf!2758 (_2!4960 lt!173785)) (currentByte!5353 lt!173760) (currentBit!5348 lt!173760)))))

(declare-fun lt!173753 () tuple2!9398)

(assert (=> b!114198 (= lt!173753 (readBitPure!0 lt!173760))))

(declare-fun lt!173747 () tuple2!9398)

(assert (=> b!114198 (= lt!173747 (readBitPure!0 lt!173775))))

(declare-fun lt!173745 () Unit!7003)

(declare-fun readBitPrefixLemma!0 (BitStream!4174 BitStream!4174) Unit!7003)

(assert (=> b!114198 (= lt!173745 (readBitPrefixLemma!0 lt!173760 (_2!4960 lt!173785)))))

(declare-fun res!94335 () Bool)

(assert (=> b!114198 (= res!94335 (= (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173753))) (currentByte!5353 (_1!4961 lt!173753)) (currentBit!5348 (_1!4961 lt!173753))) (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173747))) (currentByte!5353 (_1!4961 lt!173747)) (currentBit!5348 (_1!4961 lt!173747)))))))

(declare-fun e!74891 () Bool)

(assert (=> b!114198 (=> (not res!94335) (not e!74891))))

(assert (=> b!114198 e!74891))

(declare-fun lt!173781 () Unit!7003)

(assert (=> b!114198 (= lt!173781 lt!173745)))

(declare-fun lt!173750 () tuple2!9418)

(assert (=> b!114198 (= lt!173750 (reader!0 (_2!4960 lt!173251) (_2!4960 lt!173785)))))

(declare-fun lt!173764 () tuple2!9418)

(assert (=> b!114198 (= lt!173764 (reader!0 (_2!4960 lt!173761) (_2!4960 lt!173785)))))

(declare-fun lt!173772 () tuple2!9398)

(assert (=> b!114198 (= lt!173772 (readBitPure!0 (_1!4971 lt!173750)))))

(assert (=> b!114198 (= (_2!4961 lt!173772) lt!173783)))

(declare-fun lt!173765 () Unit!7003)

(declare-fun Unit!7017 () Unit!7003)

(assert (=> b!114198 (= lt!173765 Unit!7017)))

(declare-fun lt!173759 () (_ BitVec 64))

(assert (=> b!114198 (= lt!173759 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!173754 () (_ BitVec 64))

(assert (=> b!114198 (= lt!173754 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!173746 () Unit!7003)

(assert (=> b!114198 (= lt!173746 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4960 lt!173251) (buf!2758 (_2!4960 lt!173785)) lt!173754))))

(assert (=> b!114198 (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173785)))) ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173251))) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173251))) lt!173754)))

(declare-fun lt!173751 () Unit!7003)

(assert (=> b!114198 (= lt!173751 lt!173746)))

(declare-fun lt!173755 () tuple2!9420)

(assert (=> b!114198 (= lt!173755 (readNLeastSignificantBitsLoopPure!0 (_1!4971 lt!173750) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173759))))

(declare-fun lt!173766 () (_ BitVec 64))

(assert (=> b!114198 (= lt!173766 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!173774 () Unit!7003)

(assert (=> b!114198 (= lt!173774 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4960 lt!173761) (buf!2758 (_2!4960 lt!173785)) lt!173766))))

(assert (=> b!114198 (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173785)))) ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173761))) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173761))) lt!173766)))

(declare-fun lt!173777 () Unit!7003)

(assert (=> b!114198 (= lt!173777 lt!173774)))

(declare-fun lt!173756 () tuple2!9420)

(assert (=> b!114198 (= lt!173756 (readNLeastSignificantBitsLoopPure!0 (_1!4971 lt!173764) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173759 (ite (_2!4961 lt!173772) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!173770 () tuple2!9420)

(assert (=> b!114198 (= lt!173770 (readNLeastSignificantBitsLoopPure!0 (_1!4971 lt!173750) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173759))))

(declare-fun c!6925 () Bool)

(assert (=> b!114198 (= c!6925 (_2!4961 (readBitPure!0 (_1!4971 lt!173750))))))

(declare-fun lt!173780 () tuple2!9420)

(declare-fun withMovedBitIndex!0 (BitStream!4174 (_ BitVec 64)) BitStream!4174)

(assert (=> b!114198 (= lt!173780 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4971 lt!173750) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173759 e!74890)))))

(declare-fun lt!173763 () Unit!7003)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7003)

(assert (=> b!114198 (= lt!173763 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4971 lt!173750) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173759))))

(assert (=> b!114198 (and (= (_2!4972 lt!173770) (_2!4972 lt!173780)) (= (_1!4972 lt!173770) (_1!4972 lt!173780)))))

(declare-fun lt!173752 () Unit!7003)

(assert (=> b!114198 (= lt!173752 lt!173763)))

(assert (=> b!114198 (= (_1!4971 lt!173750) (withMovedBitIndex!0 (_2!4971 lt!173750) (bvsub (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173785))) (currentByte!5353 (_2!4960 lt!173785)) (currentBit!5348 (_2!4960 lt!173785))))))))

(declare-fun lt!173757 () Unit!7003)

(declare-fun Unit!7019 () Unit!7003)

(assert (=> b!114198 (= lt!173757 Unit!7019)))

(assert (=> b!114198 (= (_1!4971 lt!173764) (withMovedBitIndex!0 (_2!4971 lt!173764) (bvsub (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173761))) (currentByte!5353 (_2!4960 lt!173761)) (currentBit!5348 (_2!4960 lt!173761))) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173785))) (currentByte!5353 (_2!4960 lt!173785)) (currentBit!5348 (_2!4960 lt!173785))))))))

(declare-fun lt!173767 () Unit!7003)

(declare-fun Unit!7020 () Unit!7003)

(assert (=> b!114198 (= lt!173767 Unit!7020)))

(assert (=> b!114198 (= (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))) (bvsub (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173761))) (currentByte!5353 (_2!4960 lt!173761)) (currentBit!5348 (_2!4960 lt!173761))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!173771 () Unit!7003)

(declare-fun Unit!7021 () Unit!7003)

(assert (=> b!114198 (= lt!173771 Unit!7021)))

(assert (=> b!114198 (= (_2!4972 lt!173755) (_2!4972 lt!173756))))

(declare-fun lt!173742 () Unit!7003)

(declare-fun Unit!7022 () Unit!7003)

(assert (=> b!114198 (= lt!173742 Unit!7022)))

(assert (=> b!114198 (= (_1!4972 lt!173755) (_2!4971 lt!173750))))

(declare-fun b!114199 () Bool)

(assert (=> b!114199 (= e!74887 (validate_offset_bits!1 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))) ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173251))) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173251))) lt!173784))))

(declare-fun b!114200 () Bool)

(declare-fun lt!173786 () Unit!7003)

(assert (=> b!114200 (= e!74889 (tuple2!9397 lt!173786 (_2!4960 lt!173251)))))

(assert (=> b!114200 (= lt!173773 (_2!4960 lt!173251))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4174) Unit!7003)

(assert (=> b!114200 (= lt!173786 (lemmaIsPrefixRefl!0 lt!173773))))

(assert (=> b!114200 call!1466))

(declare-fun b!114201 () Bool)

(declare-fun res!94337 () Bool)

(assert (=> b!114201 (= res!94337 call!1466)))

(assert (=> b!114201 (=> (not res!94337) (not e!74885))))

(declare-fun b!114202 () Bool)

(assert (=> b!114202 (= lt!173744 (readBitPure!0 (readerFrom!0 (_2!4960 lt!173778) (currentBit!5348 (_2!4960 lt!173251)) (currentByte!5353 (_2!4960 lt!173251)))))))

(declare-fun res!94334 () Bool)

(assert (=> b!114202 (= res!94334 (and (= (_2!4961 lt!173744) lt!173783) (= (_1!4961 lt!173744) (_2!4960 lt!173778))))))

(assert (=> b!114202 (=> (not res!94334) (not e!74886))))

(assert (=> b!114202 (= e!74885 e!74886)))

(declare-fun b!114203 () Bool)

(assert (=> b!114203 (= e!74891 (= (_2!4961 lt!173753) (_2!4961 lt!173747)))))

(assert (= (and d!36604 c!6924) b!114198))

(assert (= (and d!36604 (not c!6924)) b!114200))

(assert (= (and b!114198 res!94332) b!114193))

(assert (= (and b!114193 res!94339) b!114201))

(assert (= (and b!114201 res!94337) b!114202))

(assert (= (and b!114202 res!94334) b!114194))

(assert (= (and b!114198 res!94335) b!114203))

(assert (= (and b!114198 c!6925) b!114191))

(assert (= (and b!114198 (not c!6925)) b!114195))

(assert (= (or b!114201 b!114200) bm!1463))

(assert (= (and d!36604 res!94336) b!114196))

(assert (= (and b!114196 res!94333) b!114197))

(assert (= (and b!114197 res!94338) b!114192))

(assert (= (and b!114192 res!94340) b!114199))

(declare-fun m!170521 () Bool)

(assert (=> b!114198 m!170521))

(declare-fun m!170523 () Bool)

(assert (=> b!114198 m!170523))

(declare-fun m!170525 () Bool)

(assert (=> b!114198 m!170525))

(declare-fun m!170527 () Bool)

(assert (=> b!114198 m!170527))

(declare-fun m!170529 () Bool)

(assert (=> b!114198 m!170529))

(declare-fun m!170531 () Bool)

(assert (=> b!114198 m!170531))

(declare-fun m!170533 () Bool)

(assert (=> b!114198 m!170533))

(declare-fun m!170535 () Bool)

(assert (=> b!114198 m!170535))

(declare-fun m!170537 () Bool)

(assert (=> b!114198 m!170537))

(declare-fun m!170539 () Bool)

(assert (=> b!114198 m!170539))

(assert (=> b!114198 m!170203))

(declare-fun m!170541 () Bool)

(assert (=> b!114198 m!170541))

(declare-fun m!170543 () Bool)

(assert (=> b!114198 m!170543))

(assert (=> b!114198 m!170543))

(declare-fun m!170545 () Bool)

(assert (=> b!114198 m!170545))

(declare-fun m!170547 () Bool)

(assert (=> b!114198 m!170547))

(declare-fun m!170549 () Bool)

(assert (=> b!114198 m!170549))

(declare-fun m!170551 () Bool)

(assert (=> b!114198 m!170551))

(declare-fun m!170553 () Bool)

(assert (=> b!114198 m!170553))

(declare-fun m!170555 () Bool)

(assert (=> b!114198 m!170555))

(declare-fun m!170557 () Bool)

(assert (=> b!114198 m!170557))

(declare-fun m!170559 () Bool)

(assert (=> b!114198 m!170559))

(declare-fun m!170561 () Bool)

(assert (=> b!114198 m!170561))

(declare-fun m!170563 () Bool)

(assert (=> b!114198 m!170563))

(declare-fun m!170565 () Bool)

(assert (=> b!114198 m!170565))

(declare-fun m!170567 () Bool)

(assert (=> b!114198 m!170567))

(declare-fun m!170569 () Bool)

(assert (=> b!114198 m!170569))

(declare-fun m!170571 () Bool)

(assert (=> b!114198 m!170571))

(declare-fun m!170573 () Bool)

(assert (=> b!114198 m!170573))

(declare-fun m!170575 () Bool)

(assert (=> b!114198 m!170575))

(declare-fun m!170577 () Bool)

(assert (=> b!114197 m!170577))

(declare-fun m!170579 () Bool)

(assert (=> b!114196 m!170579))

(assert (=> b!114196 m!170203))

(declare-fun m!170581 () Bool)

(assert (=> b!114194 m!170581))

(declare-fun m!170583 () Bool)

(assert (=> b!114194 m!170583))

(declare-fun m!170585 () Bool)

(assert (=> b!114202 m!170585))

(assert (=> b!114202 m!170585))

(declare-fun m!170587 () Bool)

(assert (=> b!114202 m!170587))

(assert (=> b!114193 m!170583))

(assert (=> b!114193 m!170203))

(declare-fun m!170589 () Bool)

(assert (=> b!114192 m!170589))

(declare-fun m!170591 () Bool)

(assert (=> b!114192 m!170591))

(declare-fun m!170593 () Bool)

(assert (=> b!114192 m!170593))

(declare-fun m!170595 () Bool)

(assert (=> b!114192 m!170595))

(assert (=> b!114192 m!170575))

(declare-fun m!170597 () Bool)

(assert (=> bm!1463 m!170597))

(declare-fun m!170599 () Bool)

(assert (=> b!114199 m!170599))

(declare-fun m!170601 () Bool)

(assert (=> b!114200 m!170601))

(assert (=> b!113949 d!36604))

(declare-fun d!36654 () Bool)

(declare-fun e!74906 () Bool)

(assert (=> d!36654 e!74906))

(declare-fun res!94369 () Bool)

(assert (=> d!36654 (=> (not res!94369) (not e!74906))))

(declare-fun lt!173813 () tuple2!9396)

(assert (=> d!36654 (= res!94369 (= (size!2350 (buf!2758 thiss!1305)) (size!2350 (buf!2758 (_2!4960 lt!173813)))))))

(declare-fun choose!16 (BitStream!4174 Bool) tuple2!9396)

(assert (=> d!36654 (= lt!173813 (choose!16 thiss!1305 lt!173253))))

(assert (=> d!36654 (validate_offset_bit!0 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305)))))

(assert (=> d!36654 (= (appendBit!0 thiss!1305 lt!173253) lt!173813)))

(declare-fun b!114232 () Bool)

(declare-fun res!94366 () Bool)

(assert (=> b!114232 (=> (not res!94366) (not e!74906))))

(assert (=> b!114232 (= res!94366 (isPrefixOf!0 thiss!1305 (_2!4960 lt!173813)))))

(declare-fun b!114231 () Bool)

(declare-fun res!94367 () Bool)

(assert (=> b!114231 (=> (not res!94367) (not e!74906))))

(declare-fun lt!173814 () (_ BitVec 64))

(declare-fun lt!173815 () (_ BitVec 64))

(assert (=> b!114231 (= res!94367 (= (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173813))) (currentByte!5353 (_2!4960 lt!173813)) (currentBit!5348 (_2!4960 lt!173813))) (bvadd lt!173814 lt!173815)))))

(assert (=> b!114231 (or (not (= (bvand lt!173814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173815 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173814 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173814 lt!173815) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!114231 (= lt!173815 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!114231 (= lt!173814 (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)))))

(declare-fun b!114233 () Bool)

(declare-fun e!74905 () Bool)

(assert (=> b!114233 (= e!74906 e!74905)))

(declare-fun res!94368 () Bool)

(assert (=> b!114233 (=> (not res!94368) (not e!74905))))

(declare-fun lt!173816 () tuple2!9398)

(assert (=> b!114233 (= res!94368 (and (= (_2!4961 lt!173816) lt!173253) (= (_1!4961 lt!173816) (_2!4960 lt!173813))))))

(assert (=> b!114233 (= lt!173816 (readBitPure!0 (readerFrom!0 (_2!4960 lt!173813) (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305))))))

(declare-fun b!114234 () Bool)

(assert (=> b!114234 (= e!74905 (= (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173816))) (currentByte!5353 (_1!4961 lt!173816)) (currentBit!5348 (_1!4961 lt!173816))) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173813))) (currentByte!5353 (_2!4960 lt!173813)) (currentBit!5348 (_2!4960 lt!173813)))))))

(assert (= (and d!36654 res!94369) b!114231))

(assert (= (and b!114231 res!94367) b!114232))

(assert (= (and b!114232 res!94366) b!114233))

(assert (= (and b!114233 res!94368) b!114234))

(declare-fun m!170625 () Bool)

(assert (=> b!114231 m!170625))

(assert (=> b!114231 m!170205))

(declare-fun m!170627 () Bool)

(assert (=> d!36654 m!170627))

(declare-fun m!170629 () Bool)

(assert (=> d!36654 m!170629))

(declare-fun m!170631 () Bool)

(assert (=> b!114232 m!170631))

(declare-fun m!170633 () Bool)

(assert (=> b!114234 m!170633))

(assert (=> b!114234 m!170625))

(declare-fun m!170635 () Bool)

(assert (=> b!114233 m!170635))

(assert (=> b!114233 m!170635))

(declare-fun m!170637 () Bool)

(assert (=> b!114233 m!170637))

(assert (=> b!113949 d!36654))

(declare-fun d!36664 () Bool)

(declare-fun e!74909 () Bool)

(assert (=> d!36664 e!74909))

(declare-fun res!94374 () Bool)

(assert (=> d!36664 (=> (not res!94374) (not e!74909))))

(declare-fun lt!173834 () (_ BitVec 64))

(declare-fun lt!173833 () (_ BitVec 64))

(declare-fun lt!173829 () (_ BitVec 64))

(assert (=> d!36664 (= res!94374 (= lt!173829 (bvsub lt!173833 lt!173834)))))

(assert (=> d!36664 (or (= (bvand lt!173833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173834 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173833 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173833 lt!173834) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36664 (= lt!173834 (remainingBits!0 ((_ sign_extend 32) (size!2350 (buf!2758 (_1!4961 lt!173254)))) ((_ sign_extend 32) (currentByte!5353 (_1!4961 lt!173254))) ((_ sign_extend 32) (currentBit!5348 (_1!4961 lt!173254)))))))

(declare-fun lt!173832 () (_ BitVec 64))

(declare-fun lt!173831 () (_ BitVec 64))

(assert (=> d!36664 (= lt!173833 (bvmul lt!173832 lt!173831))))

(assert (=> d!36664 (or (= lt!173832 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173831 (bvsdiv (bvmul lt!173832 lt!173831) lt!173832)))))

(assert (=> d!36664 (= lt!173831 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36664 (= lt!173832 ((_ sign_extend 32) (size!2350 (buf!2758 (_1!4961 lt!173254)))))))

(assert (=> d!36664 (= lt!173829 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5353 (_1!4961 lt!173254))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5348 (_1!4961 lt!173254)))))))

(assert (=> d!36664 (invariant!0 (currentBit!5348 (_1!4961 lt!173254)) (currentByte!5353 (_1!4961 lt!173254)) (size!2350 (buf!2758 (_1!4961 lt!173254))))))

(assert (=> d!36664 (= (bitIndex!0 (size!2350 (buf!2758 (_1!4961 lt!173254))) (currentByte!5353 (_1!4961 lt!173254)) (currentBit!5348 (_1!4961 lt!173254))) lt!173829)))

(declare-fun b!114239 () Bool)

(declare-fun res!94375 () Bool)

(assert (=> b!114239 (=> (not res!94375) (not e!74909))))

(assert (=> b!114239 (= res!94375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173829))))

(declare-fun b!114240 () Bool)

(declare-fun lt!173830 () (_ BitVec 64))

(assert (=> b!114240 (= e!74909 (bvsle lt!173829 (bvmul lt!173830 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114240 (or (= lt!173830 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173830 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173830)))))

(assert (=> b!114240 (= lt!173830 ((_ sign_extend 32) (size!2350 (buf!2758 (_1!4961 lt!173254)))))))

(assert (= (and d!36664 res!94374) b!114239))

(assert (= (and b!114239 res!94375) b!114240))

(declare-fun m!170639 () Bool)

(assert (=> d!36664 m!170639))

(declare-fun m!170641 () Bool)

(assert (=> d!36664 m!170641))

(assert (=> b!113950 d!36664))

(declare-fun d!36666 () Bool)

(declare-fun e!74910 () Bool)

(assert (=> d!36666 e!74910))

(declare-fun res!94376 () Bool)

(assert (=> d!36666 (=> (not res!94376) (not e!74910))))

(declare-fun lt!173840 () (_ BitVec 64))

(declare-fun lt!173839 () (_ BitVec 64))

(declare-fun lt!173835 () (_ BitVec 64))

(assert (=> d!36666 (= res!94376 (= lt!173835 (bvsub lt!173839 lt!173840)))))

(assert (=> d!36666 (or (= (bvand lt!173839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173839 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173839 lt!173840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36666 (= lt!173840 (remainingBits!0 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))) ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173251))) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173251)))))))

(declare-fun lt!173838 () (_ BitVec 64))

(declare-fun lt!173837 () (_ BitVec 64))

(assert (=> d!36666 (= lt!173839 (bvmul lt!173838 lt!173837))))

(assert (=> d!36666 (or (= lt!173838 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173837 (bvsdiv (bvmul lt!173838 lt!173837) lt!173838)))))

(assert (=> d!36666 (= lt!173837 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36666 (= lt!173838 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(assert (=> d!36666 (= lt!173835 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5353 (_2!4960 lt!173251))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5348 (_2!4960 lt!173251)))))))

(assert (=> d!36666 (invariant!0 (currentBit!5348 (_2!4960 lt!173251)) (currentByte!5353 (_2!4960 lt!173251)) (size!2350 (buf!2758 (_2!4960 lt!173251))))))

(assert (=> d!36666 (= (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251))) lt!173835)))

(declare-fun b!114241 () Bool)

(declare-fun res!94377 () Bool)

(assert (=> b!114241 (=> (not res!94377) (not e!74910))))

(assert (=> b!114241 (= res!94377 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173835))))

(declare-fun b!114242 () Bool)

(declare-fun lt!173836 () (_ BitVec 64))

(assert (=> b!114242 (= e!74910 (bvsle lt!173835 (bvmul lt!173836 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114242 (or (= lt!173836 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173836 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173836)))))

(assert (=> b!114242 (= lt!173836 ((_ sign_extend 32) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(assert (= (and d!36666 res!94376) b!114241))

(assert (= (and b!114241 res!94377) b!114242))

(declare-fun m!170643 () Bool)

(assert (=> d!36666 m!170643))

(assert (=> d!36666 m!170297))

(assert (=> b!113940 d!36666))

(declare-fun d!36668 () Bool)

(declare-fun e!74911 () Bool)

(assert (=> d!36668 e!74911))

(declare-fun res!94378 () Bool)

(assert (=> d!36668 (=> (not res!94378) (not e!74911))))

(declare-fun lt!173841 () (_ BitVec 64))

(declare-fun lt!173846 () (_ BitVec 64))

(declare-fun lt!173845 () (_ BitVec 64))

(assert (=> d!36668 (= res!94378 (= lt!173841 (bvsub lt!173845 lt!173846)))))

(assert (=> d!36668 (or (= (bvand lt!173845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173846 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173845 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173845 lt!173846) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36668 (= lt!173846 (remainingBits!0 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))) ((_ sign_extend 32) (currentByte!5353 thiss!1305)) ((_ sign_extend 32) (currentBit!5348 thiss!1305))))))

(declare-fun lt!173844 () (_ BitVec 64))

(declare-fun lt!173843 () (_ BitVec 64))

(assert (=> d!36668 (= lt!173845 (bvmul lt!173844 lt!173843))))

(assert (=> d!36668 (or (= lt!173844 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173843 (bvsdiv (bvmul lt!173844 lt!173843) lt!173844)))))

(assert (=> d!36668 (= lt!173843 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36668 (= lt!173844 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))))))

(assert (=> d!36668 (= lt!173841 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5353 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5348 thiss!1305))))))

(assert (=> d!36668 (invariant!0 (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305) (size!2350 (buf!2758 thiss!1305)))))

(assert (=> d!36668 (= (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)) lt!173841)))

(declare-fun b!114243 () Bool)

(declare-fun res!94379 () Bool)

(assert (=> b!114243 (=> (not res!94379) (not e!74911))))

(assert (=> b!114243 (= res!94379 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173841))))

(declare-fun b!114244 () Bool)

(declare-fun lt!173842 () (_ BitVec 64))

(assert (=> b!114244 (= e!74911 (bvsle lt!173841 (bvmul lt!173842 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!114244 (or (= lt!173842 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173842 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173842)))))

(assert (=> b!114244 (= lt!173842 ((_ sign_extend 32) (size!2350 (buf!2758 thiss!1305))))))

(assert (= (and d!36668 res!94378) b!114243))

(assert (= (and b!114243 res!94379) b!114244))

(assert (=> d!36668 m!170299))

(assert (=> d!36668 m!170301))

(assert (=> b!113940 d!36668))

(declare-fun d!36670 () Bool)

(assert (=> d!36670 (= (invariant!0 (currentBit!5348 thiss!1305) (currentByte!5353 thiss!1305) (size!2350 (buf!2758 (_2!4960 lt!173251)))) (and (bvsge (currentBit!5348 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5348 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5353 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5353 thiss!1305) (size!2350 (buf!2758 (_2!4960 lt!173251)))) (and (= (currentBit!5348 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5353 thiss!1305) (size!2350 (buf!2758 (_2!4960 lt!173251))))))))))

(assert (=> b!113946 d!36670))

(declare-fun d!36672 () Bool)

(declare-fun res!94381 () Bool)

(declare-fun e!74912 () Bool)

(assert (=> d!36672 (=> (not res!94381) (not e!74912))))

(assert (=> d!36672 (= res!94381 (= (size!2350 (buf!2758 thiss!1305)) (size!2350 (buf!2758 (_2!4960 lt!173251)))))))

(assert (=> d!36672 (= (isPrefixOf!0 thiss!1305 (_2!4960 lt!173251)) e!74912)))

(declare-fun b!114245 () Bool)

(declare-fun res!94380 () Bool)

(assert (=> b!114245 (=> (not res!94380) (not e!74912))))

(assert (=> b!114245 (= res!94380 (bvsle (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305)) (bitIndex!0 (size!2350 (buf!2758 (_2!4960 lt!173251))) (currentByte!5353 (_2!4960 lt!173251)) (currentBit!5348 (_2!4960 lt!173251)))))))

(declare-fun b!114246 () Bool)

(declare-fun e!74913 () Bool)

(assert (=> b!114246 (= e!74912 e!74913)))

(declare-fun res!94382 () Bool)

(assert (=> b!114246 (=> res!94382 e!74913)))

(assert (=> b!114246 (= res!94382 (= (size!2350 (buf!2758 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!114247 () Bool)

(assert (=> b!114247 (= e!74913 (arrayBitRangesEq!0 (buf!2758 thiss!1305) (buf!2758 (_2!4960 lt!173251)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2350 (buf!2758 thiss!1305)) (currentByte!5353 thiss!1305) (currentBit!5348 thiss!1305))))))

(assert (= (and d!36672 res!94381) b!114245))

(assert (= (and b!114245 res!94380) b!114246))

(assert (= (and b!114246 (not res!94382)) b!114247))

(assert (=> b!114245 m!170205))

(assert (=> b!114245 m!170203))

(assert (=> b!114247 m!170205))

(assert (=> b!114247 m!170205))

(declare-fun m!170645 () Bool)

(assert (=> b!114247 m!170645))

(assert (=> b!113941 d!36672))

(push 1)

(assert (not b!114197))

(assert (not d!36602))

(assert (not d!36590))

(assert (not b!114245))

(assert (not b!114202))

(assert (not b!114232))

(assert (not b!114234))

(assert (not d!36664))

(assert (not d!36586))

(assert (not d!36668))

(assert (not b!114200))

(assert (not bm!1463))

(assert (not b!114192))

(assert (not b!114035))

(assert (not b!114247))

(assert (not b!114231))

(assert (not d!36594))

(assert (not b!114193))

(assert (not d!36588))

(assert (not b!114199))

(assert (not b!114196))

(assert (not b!114194))

(assert (not b!114037))

(assert (not b!114198))

(assert (not d!36596))

(assert (not b!114233))

(assert (not d!36654))

(assert (not d!36666))

(assert (not b!114028))

(check-sat)

(pop 1)

(push 1)

(check-sat)

