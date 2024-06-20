; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47670 () Bool)

(assert start!47670)

(declare-fun res!190441 () Bool)

(declare-fun e!155243 () Bool)

(assert (=> start!47670 (=> (not res!190441) (not e!155243))))

(declare-datatypes ((array!11376 0))(
  ( (array!11377 (arr!5961 (Array (_ BitVec 32) (_ BitVec 8))) (size!4989 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11376)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!47670 (= res!190441 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4989 arr!308))))))

(assert (=> start!47670 e!155243))

(assert (=> start!47670 true))

(declare-fun array_inv!4730 (array!11376) Bool)

(assert (=> start!47670 (array_inv!4730 arr!308)))

(declare-datatypes ((BitStream!9074 0))(
  ( (BitStream!9075 (buf!5530 array!11376) (currentByte!10362 (_ BitVec 32)) (currentBit!10357 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9074)

(declare-fun e!155242 () Bool)

(declare-fun inv!12 (BitStream!9074) Bool)

(assert (=> start!47670 (and (inv!12 thiss!1870) e!155242)))

(declare-fun b!226978 () Bool)

(declare-fun res!190440 () Bool)

(assert (=> b!226978 (=> (not res!190440) (not e!155243))))

(assert (=> b!226978 (= res!190440 (bvslt i!761 to!496))))

(declare-fun b!226980 () Bool)

(assert (=> b!226980 (= e!155242 (array_inv!4730 (buf!5530 thiss!1870)))))

(declare-fun b!226979 () Bool)

(declare-datatypes ((Unit!16888 0))(
  ( (Unit!16889) )
))
(declare-datatypes ((tuple3!1360 0))(
  ( (tuple3!1361 (_1!10566 Unit!16888) (_2!10566 BitStream!9074) (_3!822 array!11376)) )
))
(declare-fun lt!362205 () tuple3!1360)

(assert (=> b!226979 (= e!155243 (not (and (= (buf!5530 thiss!1870) (buf!5530 (_2!10566 lt!362205))) (= (size!4989 arr!308) (size!4989 (_3!822 lt!362205))))))))

(declare-fun lt!362206 () (_ BitVec 64))

(declare-fun lt!362209 () (_ BitVec 64))

(declare-fun lt!362210 () (_ BitVec 64))

(declare-fun lt!362211 () (_ BitVec 32))

(assert (=> b!226979 (and (= (bvadd lt!362209 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362211))) lt!362206) (= (bvadd lt!362210 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362206))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!226979 (= lt!362206 (bitIndex!0 (size!4989 (buf!5530 (_2!10566 lt!362205))) (currentByte!10362 (_2!10566 lt!362205)) (currentBit!10357 (_2!10566 lt!362205))))))

(assert (=> b!226979 (= lt!362209 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362210))))

(declare-datatypes ((tuple2!19488 0))(
  ( (tuple2!19489 (_1!10567 (_ BitVec 8)) (_2!10567 BitStream!9074)) )
))
(declare-fun lt!362208 () tuple2!19488)

(assert (=> b!226979 (= lt!362209 (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362208))) (currentByte!10362 (_2!10567 lt!362208)) (currentBit!10357 (_2!10567 lt!362208))))))

(assert (=> b!226979 (= lt!362210 (bitIndex!0 (size!4989 (buf!5530 thiss!1870)) (currentByte!10362 thiss!1870) (currentBit!10357 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9074 array!11376 (_ BitVec 32) (_ BitVec 32)) tuple3!1360)

(assert (=> b!226979 (= lt!362205 (readByteArrayLoop!0 (_2!10567 lt!362208) (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226979 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208))) lt!362211)))

(assert (=> b!226979 (= lt!362211 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362207 () Unit!16888)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9074 BitStream!9074 (_ BitVec 64) (_ BitVec 32)) Unit!16888)

(assert (=> b!226979 (= lt!362207 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10567 lt!362208) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(declare-fun readByte!0 (BitStream!9074) tuple2!19488)

(assert (=> b!226979 (= lt!362208 (readByte!0 thiss!1870))))

(declare-fun b!226977 () Bool)

(declare-fun res!190439 () Bool)

(assert (=> b!226977 (=> (not res!190439) (not e!155243))))

(assert (=> b!226977 (= res!190439 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))) ((_ sign_extend 32) (currentByte!10362 thiss!1870)) ((_ sign_extend 32) (currentBit!10357 thiss!1870)) (bvsub to!496 i!761)))))

(assert (= (and start!47670 res!190441) b!226977))

(assert (= (and b!226977 res!190439) b!226978))

(assert (= (and b!226978 res!190440) b!226979))

(assert (= start!47670 b!226980))

(declare-fun m!348841 () Bool)

(assert (=> start!47670 m!348841))

(declare-fun m!348843 () Bool)

(assert (=> start!47670 m!348843))

(declare-fun m!348845 () Bool)

(assert (=> b!226980 m!348845))

(declare-fun m!348847 () Bool)

(assert (=> b!226979 m!348847))

(declare-fun m!348849 () Bool)

(assert (=> b!226979 m!348849))

(declare-fun m!348851 () Bool)

(assert (=> b!226979 m!348851))

(declare-fun m!348853 () Bool)

(assert (=> b!226979 m!348853))

(declare-fun m!348855 () Bool)

(assert (=> b!226979 m!348855))

(declare-fun m!348857 () Bool)

(assert (=> b!226979 m!348857))

(declare-fun m!348859 () Bool)

(assert (=> b!226979 m!348859))

(declare-fun m!348861 () Bool)

(assert (=> b!226979 m!348861))

(declare-fun m!348863 () Bool)

(assert (=> b!226977 m!348863))

(push 1)

(assert (not b!226979))

(assert (not start!47670))

(assert (not b!226980))

(assert (not b!226977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!77054 () Bool)

(declare-fun e!155251 () Bool)

(assert (=> d!77054 e!155251))

(declare-fun res!190447 () Bool)

(assert (=> d!77054 (=> (not res!190447) (not e!155251))))

(assert (=> d!77054 (= res!190447 (and (or (let ((rhs!3935 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3935 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3935) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!77055 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!77055 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!77055 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3934 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3934 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3934) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!362227 () Unit!16888)

(declare-fun choose!57 (BitStream!9074 BitStream!9074 (_ BitVec 64) (_ BitVec 32)) Unit!16888)

(assert (=> d!77054 (= lt!362227 (choose!57 thiss!1870 (_2!10567 lt!362208) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> d!77054 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10567 lt!362208) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)) lt!362227)))

(declare-fun lt!362228 () (_ BitVec 32))

(declare-fun b!226986 () Bool)

(assert (=> b!226986 (= e!155251 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208))) (bvsub (bvsub to!496 i!761) lt!362228)))))

(assert (=> b!226986 (or (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand lt!362228 #b10000000000000000000000000000000)) (= (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!496 i!761) lt!362228) #b10000000000000000000000000000000)))))

(declare-fun lt!362229 () (_ BitVec 64))

(assert (=> b!226986 (= lt!362228 ((_ extract 31 0) lt!362229))))

(assert (=> b!226986 (and (bvslt lt!362229 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!362229 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!226986 (= lt!362229 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!77054 res!190447) b!226986))

(declare-fun m!348873 () Bool)

(assert (=> d!77054 m!348873))

(declare-fun m!348875 () Bool)

(assert (=> b!226986 m!348875))

(assert (=> b!226979 d!77054))

(declare-fun d!77057 () Bool)

(declare-fun lt!362248 () (_ BitVec 8))

(declare-fun lt!362246 () (_ BitVec 8))

(assert (=> d!77057 (= lt!362248 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5961 (buf!5530 thiss!1870)) (currentByte!10362 thiss!1870))) ((_ sign_extend 24) lt!362246))))))

(assert (=> d!77057 (= lt!362246 ((_ extract 7 0) (currentBit!10357 thiss!1870)))))

(declare-fun e!155257 () Bool)

(assert (=> d!77057 e!155257))

(declare-fun res!190454 () Bool)

(assert (=> d!77057 (=> (not res!190454) (not e!155257))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!77057 (= res!190454 (validate_offset_bits!1 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))) ((_ sign_extend 32) (currentByte!10362 thiss!1870)) ((_ sign_extend 32) (currentBit!10357 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!19496 0))(
  ( (tuple2!19497 (_1!10571 Unit!16888) (_2!10571 (_ BitVec 8))) )
))
(declare-fun Unit!16908 () Unit!16888)

(declare-fun Unit!16909 () Unit!16888)

(assert (=> d!77057 (= (readByte!0 thiss!1870) (tuple2!19489 (_2!10571 (ite (bvsgt ((_ sign_extend 24) lt!362246) #b00000000000000000000000000000000) (tuple2!19497 Unit!16908 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362248) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5961 (buf!5530 thiss!1870)) (bvadd (currentByte!10362 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362246)))))))) (tuple2!19497 Unit!16909 lt!362248))) (BitStream!9075 (buf!5530 thiss!1870) (bvadd (currentByte!10362 thiss!1870) #b00000000000000000000000000000001) (currentBit!10357 thiss!1870))))))

(declare-fun b!226991 () Bool)

(declare-fun e!155256 () Bool)

(assert (=> b!226991 (= e!155257 e!155256)))

(declare-fun res!190453 () Bool)

(assert (=> b!226991 (=> (not res!190453) (not e!155256))))

(declare-fun lt!362250 () tuple2!19488)

(assert (=> b!226991 (= res!190453 (= (buf!5530 (_2!10567 lt!362250)) (buf!5530 thiss!1870)))))

(declare-fun lt!362249 () (_ BitVec 8))

(declare-fun lt!362244 () (_ BitVec 8))

(declare-fun Unit!16910 () Unit!16888)

(declare-fun Unit!16911 () Unit!16888)

(assert (=> b!226991 (= lt!362250 (tuple2!19489 (_2!10571 (ite (bvsgt ((_ sign_extend 24) lt!362244) #b00000000000000000000000000000000) (tuple2!19497 Unit!16910 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!362249) (bvlshr (bvand ((_ sign_extend 24) (select (arr!5961 (buf!5530 thiss!1870)) (bvadd (currentByte!10362 thiss!1870) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!362244)))))))) (tuple2!19497 Unit!16911 lt!362249))) (BitStream!9075 (buf!5530 thiss!1870) (bvadd (currentByte!10362 thiss!1870) #b00000000000000000000000000000001) (currentBit!10357 thiss!1870))))))

(assert (=> b!226991 (= lt!362249 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!5961 (buf!5530 thiss!1870)) (currentByte!10362 thiss!1870))) ((_ sign_extend 24) lt!362244))))))

(assert (=> b!226991 (= lt!362244 ((_ extract 7 0) (currentBit!10357 thiss!1870)))))

(declare-fun b!226992 () Bool)

(declare-fun lt!362247 () (_ BitVec 64))

(declare-fun lt!362245 () (_ BitVec 64))

(assert (=> b!226992 (= e!155256 (= (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362250))) (currentByte!10362 (_2!10567 lt!362250)) (currentBit!10357 (_2!10567 lt!362250))) (bvadd lt!362247 lt!362245)))))

(assert (=> b!226992 (or (not (= (bvand lt!362247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362245 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362247 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362247 lt!362245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!226992 (= lt!362245 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!226992 (= lt!362247 (bitIndex!0 (size!4989 (buf!5530 thiss!1870)) (currentByte!10362 thiss!1870) (currentBit!10357 thiss!1870)))))

(assert (= (and d!77057 res!190454) b!226991))

(assert (= (and b!226991 res!190453) b!226992))

(declare-fun m!348877 () Bool)

(assert (=> d!77057 m!348877))

(declare-fun m!348879 () Bool)

(assert (=> d!77057 m!348879))

(declare-fun m!348881 () Bool)

(assert (=> d!77057 m!348881))

(assert (=> b!226991 m!348881))

(assert (=> b!226991 m!348877))

(declare-fun m!348883 () Bool)

(assert (=> b!226992 m!348883))

(assert (=> b!226992 m!348859))

(assert (=> b!226979 d!77057))

(declare-fun d!77059 () Bool)

(declare-fun e!155260 () Bool)

(assert (=> d!77059 e!155260))

(declare-fun res!190460 () Bool)

(assert (=> d!77059 (=> (not res!190460) (not e!155260))))

(declare-fun lt!362263 () (_ BitVec 64))

(declare-fun lt!362265 () (_ BitVec 64))

(declare-fun lt!362267 () (_ BitVec 64))

(assert (=> d!77059 (= res!190460 (= lt!362265 (bvsub lt!362263 lt!362267)))))

(assert (=> d!77059 (or (= (bvand lt!362263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362267 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362263 lt!362267) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!77059 (= lt!362267 (remainingBits!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208)))))))

(declare-fun lt!362268 () (_ BitVec 64))

(declare-fun lt!362264 () (_ BitVec 64))

(assert (=> d!77059 (= lt!362263 (bvmul lt!362268 lt!362264))))

(assert (=> d!77059 (or (= lt!362268 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362264 (bvsdiv (bvmul lt!362268 lt!362264) lt!362268)))))

(assert (=> d!77059 (= lt!362264 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77059 (= lt!362268 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))))))

(assert (=> d!77059 (= lt!362265 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!77059 (invariant!0 (currentBit!10357 (_2!10567 lt!362208)) (currentByte!10362 (_2!10567 lt!362208)) (size!4989 (buf!5530 (_2!10567 lt!362208))))))

(assert (=> d!77059 (= (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362208))) (currentByte!10362 (_2!10567 lt!362208)) (currentBit!10357 (_2!10567 lt!362208))) lt!362265)))

(declare-fun b!226997 () Bool)

(declare-fun res!190459 () Bool)

(assert (=> b!226997 (=> (not res!190459) (not e!155260))))

(assert (=> b!226997 (= res!190459 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362265))))

(declare-fun b!226998 () Bool)

(declare-fun lt!362266 () (_ BitVec 64))

(assert (=> b!226998 (= e!155260 (bvsle lt!362265 (bvmul lt!362266 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!226998 (or (= lt!362266 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362266 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362266)))))

(assert (=> b!226998 (= lt!362266 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))))))

(assert (= (and d!77059 res!190460) b!226997))

(assert (= (and b!226997 res!190459) b!226998))

(declare-fun m!348885 () Bool)

(assert (=> d!77059 m!348885))

(declare-fun m!348887 () Bool)

(assert (=> d!77059 m!348887))

(assert (=> b!226979 d!77059))

(declare-fun d!77061 () Bool)

(declare-fun e!155261 () Bool)

(assert (=> d!77061 e!155261))

(declare-fun res!190462 () Bool)

(assert (=> d!77061 (=> (not res!190462) (not e!155261))))

(declare-fun lt!362273 () (_ BitVec 64))

(declare-fun lt!362271 () (_ BitVec 64))

(declare-fun lt!362269 () (_ BitVec 64))

(assert (=> d!77061 (= res!190462 (= lt!362271 (bvsub lt!362269 lt!362273)))))

(assert (=> d!77061 (or (= (bvand lt!362269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362269 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362269 lt!362273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77061 (= lt!362273 (remainingBits!0 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))) ((_ sign_extend 32) (currentByte!10362 thiss!1870)) ((_ sign_extend 32) (currentBit!10357 thiss!1870))))))

(declare-fun lt!362274 () (_ BitVec 64))

(declare-fun lt!362270 () (_ BitVec 64))

(assert (=> d!77061 (= lt!362269 (bvmul lt!362274 lt!362270))))

(assert (=> d!77061 (or (= lt!362274 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362270 (bvsdiv (bvmul lt!362274 lt!362270) lt!362274)))))

(assert (=> d!77061 (= lt!362270 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77061 (= lt!362274 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))))))

(assert (=> d!77061 (= lt!362271 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10362 thiss!1870)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10357 thiss!1870))))))

(assert (=> d!77061 (invariant!0 (currentBit!10357 thiss!1870) (currentByte!10362 thiss!1870) (size!4989 (buf!5530 thiss!1870)))))

(assert (=> d!77061 (= (bitIndex!0 (size!4989 (buf!5530 thiss!1870)) (currentByte!10362 thiss!1870) (currentBit!10357 thiss!1870)) lt!362271)))

(declare-fun b!226999 () Bool)

(declare-fun res!190461 () Bool)

(assert (=> b!226999 (=> (not res!190461) (not e!155261))))

(assert (=> b!226999 (= res!190461 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362271))))

(declare-fun b!227000 () Bool)

(declare-fun lt!362272 () (_ BitVec 64))

(assert (=> b!227000 (= e!155261 (bvsle lt!362271 (bvmul lt!362272 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227000 (or (= lt!362272 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362272 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362272)))))

(assert (=> b!227000 (= lt!362272 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))))))

(assert (= (and d!77061 res!190462) b!226999))

(assert (= (and b!226999 res!190461) b!227000))

(declare-fun m!348889 () Bool)

(assert (=> d!77061 m!348889))

(declare-fun m!348891 () Bool)

(assert (=> d!77061 m!348891))

(assert (=> b!226979 d!77061))

(declare-fun d!77063 () Bool)

(declare-fun e!155262 () Bool)

(assert (=> d!77063 e!155262))

(declare-fun res!190464 () Bool)

(assert (=> d!77063 (=> (not res!190464) (not e!155262))))

(declare-fun lt!362275 () (_ BitVec 64))

(declare-fun lt!362279 () (_ BitVec 64))

(declare-fun lt!362277 () (_ BitVec 64))

(assert (=> d!77063 (= res!190464 (= lt!362277 (bvsub lt!362275 lt!362279)))))

(assert (=> d!77063 (or (= (bvand lt!362275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!362275 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!362275 lt!362279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!77063 (= lt!362279 (remainingBits!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10566 lt!362205)))) ((_ sign_extend 32) (currentByte!10362 (_2!10566 lt!362205))) ((_ sign_extend 32) (currentBit!10357 (_2!10566 lt!362205)))))))

(declare-fun lt!362280 () (_ BitVec 64))

(declare-fun lt!362276 () (_ BitVec 64))

(assert (=> d!77063 (= lt!362275 (bvmul lt!362280 lt!362276))))

(assert (=> d!77063 (or (= lt!362280 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!362276 (bvsdiv (bvmul lt!362280 lt!362276) lt!362280)))))

(assert (=> d!77063 (= lt!362276 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!77063 (= lt!362280 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10566 lt!362205)))))))

(assert (=> d!77063 (= lt!362277 (bvadd (bvmul ((_ sign_extend 32) (currentByte!10362 (_2!10566 lt!362205))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!10357 (_2!10566 lt!362205)))))))

(assert (=> d!77063 (invariant!0 (currentBit!10357 (_2!10566 lt!362205)) (currentByte!10362 (_2!10566 lt!362205)) (size!4989 (buf!5530 (_2!10566 lt!362205))))))

(assert (=> d!77063 (= (bitIndex!0 (size!4989 (buf!5530 (_2!10566 lt!362205))) (currentByte!10362 (_2!10566 lt!362205)) (currentBit!10357 (_2!10566 lt!362205))) lt!362277)))

(declare-fun b!227001 () Bool)

(declare-fun res!190463 () Bool)

(assert (=> b!227001 (=> (not res!190463) (not e!155262))))

(assert (=> b!227001 (= res!190463 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!362277))))

(declare-fun b!227002 () Bool)

(declare-fun lt!362278 () (_ BitVec 64))

(assert (=> b!227002 (= e!155262 (bvsle lt!362277 (bvmul lt!362278 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!227002 (or (= lt!362278 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362278 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362278)))))

(assert (=> b!227002 (= lt!362278 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10566 lt!362205)))))))

(assert (= (and d!77063 res!190464) b!227001))

(assert (= (and b!227001 res!190463) b!227002))

(declare-fun m!348893 () Bool)

(assert (=> d!77063 m!348893))

(declare-fun m!348895 () Bool)

(assert (=> d!77063 m!348895))

(assert (=> b!226979 d!77063))

(declare-fun d!77065 () Bool)

(declare-fun e!155312 () Bool)

(assert (=> d!77065 e!155312))

(declare-fun res!190527 () Bool)

(assert (=> d!77065 (=> res!190527 e!155312)))

(assert (=> d!77065 (= res!190527 (bvsge (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(declare-fun lt!362692 () Bool)

(declare-fun e!155314 () Bool)

(assert (=> d!77065 (= lt!362692 e!155314)))

(declare-fun res!190528 () Bool)

(assert (=> d!77065 (=> (not res!190528) (not e!155314))))

(declare-fun lt!362709 () (_ BitVec 64))

(declare-fun lt!362697 () tuple3!1360)

(declare-fun lt!362691 () (_ BitVec 64))

(assert (=> d!77065 (= res!190528 (= (bvadd lt!362709 lt!362691) (bitIndex!0 (size!4989 (buf!5530 (_2!10566 lt!362697))) (currentByte!10362 (_2!10566 lt!362697)) (currentBit!10357 (_2!10566 lt!362697)))))))

(assert (=> d!77065 (or (not (= (bvand lt!362709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!362691 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!362709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!362709 lt!362691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!362701 () (_ BitVec 64))

(assert (=> d!77065 (= lt!362691 (bvmul lt!362701 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!77065 (or (= lt!362701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!362701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!362701)))))

(assert (=> d!77065 (= lt!362701 ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))))))

(assert (=> d!77065 (or (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!761) #b10000000000000000000000000000000)) (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b10000000000000000000000000000000)))))

(assert (=> d!77065 (= lt!362709 (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362208))) (currentByte!10362 (_2!10567 lt!362208)) (currentBit!10357 (_2!10567 lt!362208))))))

(declare-fun e!155313 () tuple3!1360)

(assert (=> d!77065 (= lt!362697 e!155313)))

(declare-fun c!11203 () Bool)

(assert (=> d!77065 (= c!11203 (bvslt (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> d!77065 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)) (bvsle (bvadd #b00000000000000000000000000000001 i!761) to!496) (bvsle to!496 (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)))))))

(assert (=> d!77065 (= (readByteArrayLoop!0 (_2!10567 lt!362208) (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) to!496) lt!362697)))

(declare-fun b!227078 () Bool)

(declare-datatypes ((tuple2!19500 0))(
  ( (tuple2!19501 (_1!10573 BitStream!9074) (_2!10573 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!9074) tuple2!19500)

(assert (=> b!227078 (= e!155312 (= (select (arr!5961 (_3!822 lt!362697)) (bvadd #b00000000000000000000000000000001 i!761)) (_2!10573 (readBytePure!0 (_2!10567 lt!362208)))))))

(assert (=> b!227078 (and (bvsge (bvadd #b00000000000000000000000000000001 i!761) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!761) (size!4989 (_3!822 lt!362697))))))

(declare-fun b!227079 () Bool)

(declare-fun res!190526 () Bool)

(assert (=> b!227079 (=> (not res!190526) (not e!155314))))

(assert (=> b!227079 (= res!190526 (and (= (buf!5530 (_2!10567 lt!362208)) (buf!5530 (_2!10566 lt!362697))) (= (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) (size!4989 (_3!822 lt!362697)))))))

(declare-fun b!227080 () Bool)

(declare-fun lt!362706 () Unit!16888)

(declare-fun lt!362695 () tuple3!1360)

(assert (=> b!227080 (= e!155313 (tuple3!1361 lt!362706 (_2!10566 lt!362695) (_3!822 lt!362695)))))

(declare-fun lt!362710 () tuple2!19488)

(assert (=> b!227080 (= lt!362710 (readByte!0 (_2!10567 lt!362208)))))

(declare-fun lt!362680 () array!11376)

(assert (=> b!227080 (= lt!362680 (array!11377 (store (arr!5961 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10567 lt!362710)) (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)))))))

(declare-fun lt!362687 () (_ BitVec 64))

(assert (=> b!227080 (= lt!362687 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!362708 () (_ BitVec 32))

(assert (=> b!227080 (= lt!362708 (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362683 () Unit!16888)

(assert (=> b!227080 (= lt!362683 (validateOffsetBytesFromBitIndexLemma!0 (_2!10567 lt!362208) (_2!10567 lt!362710) lt!362687 lt!362708))))

(assert (=> b!227080 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362710)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362710))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362710))) (bvsub lt!362708 ((_ extract 31 0) (bvsdiv (bvadd lt!362687 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!362693 () Unit!16888)

(assert (=> b!227080 (= lt!362693 lt!362683)))

(assert (=> b!227080 (= lt!362695 (readByteArrayLoop!0 (_2!10567 lt!362710) lt!362680 (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001) to!496))))

(declare-fun call!3828 () (_ BitVec 64))

(assert (=> b!227080 (= call!3828 (bvadd (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362208))) (currentByte!10362 (_2!10567 lt!362208)) (currentBit!10357 (_2!10567 lt!362208))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!362711 () Unit!16888)

(declare-fun Unit!16916 () Unit!16888)

(assert (=> b!227080 (= lt!362711 Unit!16916)))

(assert (=> b!227080 (= (bvadd call!3828 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4989 (buf!5530 (_2!10566 lt!362695))) (currentByte!10362 (_2!10566 lt!362695)) (currentBit!10357 (_2!10566 lt!362695))))))

(declare-fun lt!362703 () Unit!16888)

(declare-fun Unit!16917 () Unit!16888)

(assert (=> b!227080 (= lt!362703 Unit!16917)))

(assert (=> b!227080 (= (bvadd (bitIndex!0 (size!4989 (buf!5530 (_2!10567 lt!362208))) (currentByte!10362 (_2!10567 lt!362208)) (currentBit!10357 (_2!10567 lt!362208))) (bvmul ((_ sign_extend 32) (bvsub to!496 (bvadd #b00000000000000000000000000000001 i!761))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!4989 (buf!5530 (_2!10566 lt!362695))) (currentByte!10362 (_2!10566 lt!362695)) (currentBit!10357 (_2!10566 lt!362695))))))

(declare-fun lt!362681 () Unit!16888)

(declare-fun Unit!16918 () Unit!16888)

(assert (=> b!227080 (= lt!362681 Unit!16918)))

(assert (=> b!227080 (and (= (buf!5530 (_2!10567 lt!362208)) (buf!5530 (_2!10566 lt!362695))) (= (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) (size!4989 (_3!822 lt!362695))))))

(declare-fun lt!362688 () Unit!16888)

(declare-fun Unit!16919 () Unit!16888)

(assert (=> b!227080 (= lt!362688 Unit!16919)))

(declare-fun lt!362699 () Unit!16888)

(declare-fun arrayUpdatedAtPrefixLemma!387 (array!11376 (_ BitVec 32) (_ BitVec 8)) Unit!16888)

(assert (=> b!227080 (= lt!362699 (arrayUpdatedAtPrefixLemma!387 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (bvadd #b00000000000000000000000000000001 i!761) (_1!10567 lt!362710)))))

(declare-fun arrayRangesEq!828 (array!11376 array!11376 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227080 (arrayRangesEq!828 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (array!11377 (store (arr!5961 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10567 lt!362710)) (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)))) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun lt!362698 () Unit!16888)

(assert (=> b!227080 (= lt!362698 lt!362699)))

(declare-fun lt!362707 () (_ BitVec 32))

(assert (=> b!227080 (= lt!362707 #b00000000000000000000000000000000)))

(declare-fun lt!362705 () Unit!16888)

(declare-fun arrayRangesEqTransitive!266 (array!11376 array!11376 array!11376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16888)

(assert (=> b!227080 (= lt!362705 (arrayRangesEqTransitive!266 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) lt!362680 (_3!822 lt!362695) lt!362707 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(declare-fun call!3827 () Bool)

(assert (=> b!227080 call!3827))

(declare-fun lt!362704 () Unit!16888)

(assert (=> b!227080 (= lt!362704 lt!362705)))

(declare-fun call!3826 () Bool)

(assert (=> b!227080 call!3826))

(declare-fun lt!362714 () Unit!16888)

(declare-fun Unit!16920 () Unit!16888)

(assert (=> b!227080 (= lt!362714 Unit!16920)))

(declare-fun lt!362690 () Unit!16888)

(declare-fun arrayRangesEqImpliesEq!117 (array!11376 array!11376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16888)

(assert (=> b!227080 (= lt!362690 (arrayRangesEqImpliesEq!117 lt!362680 (_3!822 lt!362695) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761) (bvadd #b00000000000000000000000000000001 i!761 #b00000000000000000000000000000001)))))

(assert (=> b!227080 (= (select (store (arr!5961 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) (bvadd #b00000000000000000000000000000001 i!761) (_1!10567 lt!362710)) (bvadd #b00000000000000000000000000000001 i!761)) (select (arr!5961 (_3!822 lt!362695)) (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun lt!362682 () Unit!16888)

(assert (=> b!227080 (= lt!362682 lt!362690)))

(declare-fun lt!362713 () Bool)

(assert (=> b!227080 (= lt!362713 (= (select (arr!5961 (_3!822 lt!362695)) (bvadd #b00000000000000000000000000000001 i!761)) (_1!10567 lt!362710)))))

(declare-fun Unit!16921 () Unit!16888)

(assert (=> b!227080 (= lt!362706 Unit!16921)))

(assert (=> b!227080 lt!362713))

(declare-fun bm!3823 () Bool)

(assert (=> bm!3823 (= call!3826 (arrayRangesEq!828 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (ite c!11203 (_3!822 lt!362695) (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))) #b00000000000000000000000000000000 (ite c!11203 (bvadd #b00000000000000000000000000000001 i!761) (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))))))))

(declare-fun lt!362696 () (_ BitVec 32))

(declare-fun lt!362685 () array!11376)

(declare-fun bm!3824 () Bool)

(declare-fun lt!362686 () (_ BitVec 32))

(declare-fun lt!362684 () array!11376)

(assert (=> bm!3824 (= call!3827 (arrayRangesEq!828 (ite c!11203 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) lt!362685) (ite c!11203 (_3!822 lt!362695) lt!362684) (ite c!11203 lt!362707 lt!362696) (ite c!11203 (bvadd #b00000000000000000000000000000001 i!761) lt!362686)))))

(declare-fun b!227081 () Bool)

(declare-fun lt!362694 () Unit!16888)

(assert (=> b!227081 (= e!155313 (tuple3!1361 lt!362694 (_2!10567 lt!362208) (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))))))

(assert (=> b!227081 (= call!3828 call!3828)))

(declare-fun lt!362700 () Unit!16888)

(declare-fun Unit!16922 () Unit!16888)

(assert (=> b!227081 (= lt!362700 Unit!16922)))

(declare-fun lt!362702 () Unit!16888)

(declare-fun arrayRangesEqReflexiveLemma!132 (array!11376) Unit!16888)

(assert (=> b!227081 (= lt!362702 (arrayRangesEqReflexiveLemma!132 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))))))

(assert (=> b!227081 call!3826))

(declare-fun lt!362712 () Unit!16888)

(assert (=> b!227081 (= lt!362712 lt!362702)))

(assert (=> b!227081 (= lt!362685 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)))))

(assert (=> b!227081 (= lt!362684 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)))))

(declare-fun lt!362689 () (_ BitVec 32))

(assert (=> b!227081 (= lt!362689 #b00000000000000000000000000000000)))

(declare-fun lt!362715 () (_ BitVec 32))

(assert (=> b!227081 (= lt!362715 (size!4989 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308))))))

(assert (=> b!227081 (= lt!362696 #b00000000000000000000000000000000)))

(assert (=> b!227081 (= lt!362686 (bvadd #b00000000000000000000000000000001 i!761))))

(declare-fun arrayRangesEqSlicedLemma!117 (array!11376 array!11376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16888)

(assert (=> b!227081 (= lt!362694 (arrayRangesEqSlicedLemma!117 lt!362685 lt!362684 lt!362689 lt!362715 lt!362696 lt!362686))))

(assert (=> b!227081 call!3827))

(declare-fun b!227082 () Bool)

(assert (=> b!227082 (= e!155314 (arrayRangesEq!828 (array!11377 (store (arr!5961 arr!308) i!761 (_1!10567 lt!362208)) (size!4989 arr!308)) (_3!822 lt!362697) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun bm!3825 () Bool)

(assert (=> bm!3825 (= call!3828 (bitIndex!0 (ite c!11203 (size!4989 (buf!5530 (_2!10567 lt!362710))) (size!4989 (buf!5530 (_2!10567 lt!362208)))) (ite c!11203 (currentByte!10362 (_2!10567 lt!362710)) (currentByte!10362 (_2!10567 lt!362208))) (ite c!11203 (currentBit!10357 (_2!10567 lt!362710)) (currentBit!10357 (_2!10567 lt!362208)))))))

(assert (= (and d!77065 c!11203) b!227080))

(assert (= (and d!77065 (not c!11203)) b!227081))

(assert (= (or b!227080 b!227081) bm!3824))

(assert (= (or b!227080 b!227081) bm!3823))

(assert (= (or b!227080 b!227081) bm!3825))

(assert (= (and d!77065 res!190528) b!227079))

(assert (= (and b!227079 res!190526) b!227082))

(assert (= (and d!77065 (not res!190527)) b!227078))

(declare-fun m!349021 () Bool)

(assert (=> b!227078 m!349021))

(declare-fun m!349023 () Bool)

(assert (=> b!227078 m!349023))

(declare-fun m!349025 () Bool)

(assert (=> b!227080 m!349025))

(declare-fun m!349027 () Bool)

(assert (=> b!227080 m!349027))

(declare-fun m!349029 () Bool)

(assert (=> b!227080 m!349029))

(declare-fun m!349031 () Bool)

(assert (=> b!227080 m!349031))

(declare-fun m!349033 () Bool)

(assert (=> b!227080 m!349033))

(declare-fun m!349035 () Bool)

(assert (=> b!227080 m!349035))

(declare-fun m!349037 () Bool)

(assert (=> b!227080 m!349037))

(declare-fun m!349039 () Bool)

(assert (=> b!227080 m!349039))

(declare-fun m!349041 () Bool)

(assert (=> b!227080 m!349041))

(declare-fun m!349043 () Bool)

(assert (=> b!227080 m!349043))

(declare-fun m!349045 () Bool)

(assert (=> b!227080 m!349045))

(assert (=> b!227080 m!348855))

(declare-fun m!349047 () Bool)

(assert (=> b!227080 m!349047))

(declare-fun m!349049 () Bool)

(assert (=> b!227082 m!349049))

(declare-fun m!349051 () Bool)

(assert (=> bm!3824 m!349051))

(declare-fun m!349053 () Bool)

(assert (=> d!77065 m!349053))

(assert (=> d!77065 m!348855))

(declare-fun m!349055 () Bool)

(assert (=> b!227081 m!349055))

(declare-fun m!349057 () Bool)

(assert (=> b!227081 m!349057))

(declare-fun m!349059 () Bool)

(assert (=> bm!3823 m!349059))

(declare-fun m!349061 () Bool)

(assert (=> bm!3825 m!349061))

(assert (=> b!226979 d!77065))

(declare-fun d!77102 () Bool)

(assert (=> d!77102 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208))) lt!362211) (bvsle ((_ sign_extend 32) lt!362211) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4989 (buf!5530 (_2!10567 lt!362208)))) ((_ sign_extend 32) (currentByte!10362 (_2!10567 lt!362208))) ((_ sign_extend 32) (currentBit!10357 (_2!10567 lt!362208)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18837 () Bool)

(assert (= bs!18837 d!77102))

(assert (=> bs!18837 m!348885))

(assert (=> b!226979 d!77102))

(declare-fun d!77104 () Bool)

(assert (=> d!77104 (= (array_inv!4730 arr!308) (bvsge (size!4989 arr!308) #b00000000000000000000000000000000))))

(assert (=> start!47670 d!77104))

(declare-fun d!77106 () Bool)

(assert (=> d!77106 (= (inv!12 thiss!1870) (invariant!0 (currentBit!10357 thiss!1870) (currentByte!10362 thiss!1870) (size!4989 (buf!5530 thiss!1870))))))

(declare-fun bs!18838 () Bool)

(assert (= bs!18838 d!77106))

(assert (=> bs!18838 m!348891))

(assert (=> start!47670 d!77106))

(declare-fun d!77108 () Bool)

(assert (=> d!77108 (= (array_inv!4730 (buf!5530 thiss!1870)) (bvsge (size!4989 (buf!5530 thiss!1870)) #b00000000000000000000000000000000))))

(assert (=> b!226980 d!77108))

(declare-fun d!77110 () Bool)

(assert (=> d!77110 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))) ((_ sign_extend 32) (currentByte!10362 thiss!1870)) ((_ sign_extend 32) (currentBit!10357 thiss!1870)) (bvsub to!496 i!761)) (bvsle ((_ sign_extend 32) (bvsub to!496 i!761)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!4989 (buf!5530 thiss!1870))) ((_ sign_extend 32) (currentByte!10362 thiss!1870)) ((_ sign_extend 32) (currentBit!10357 thiss!1870))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!18839 () Bool)

(assert (= bs!18839 d!77110))

(assert (=> bs!18839 m!348889))

(assert (=> b!226977 d!77110))

(push 1)

