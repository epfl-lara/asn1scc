; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22872 () Bool)

(assert start!22872)

(declare-fun b!115634 () Bool)

(declare-fun res!95574 () Bool)

(declare-fun e!75792 () Bool)

(assert (=> b!115634 (=> (not res!95574) (not e!75792))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!115634 (= res!95574 (bvslt i!615 nBits!396))))

(declare-fun b!115635 () Bool)

(declare-fun e!75793 () Bool)

(declare-fun e!75791 () Bool)

(assert (=> b!115635 (= e!75793 e!75791)))

(declare-fun res!95575 () Bool)

(assert (=> b!115635 (=> (not res!95575) (not e!75791))))

(declare-datatypes ((array!5217 0))(
  ( (array!5218 (arr!2960 (Array (_ BitVec 32) (_ BitVec 8))) (size!2367 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4208 0))(
  ( (BitStream!4209 (buf!2777 array!5217) (currentByte!5405 (_ BitVec 32)) (currentBit!5400 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7115 0))(
  ( (Unit!7116) )
))
(declare-datatypes ((tuple2!9538 0))(
  ( (tuple2!9539 (_1!5034 Unit!7115) (_2!5034 BitStream!4208)) )
))
(declare-fun lt!176438 () tuple2!9538)

(declare-fun lt!176439 () Bool)

(declare-datatypes ((tuple2!9540 0))(
  ( (tuple2!9541 (_1!5035 BitStream!4208) (_2!5035 Bool)) )
))
(declare-fun lt!176429 () tuple2!9540)

(assert (=> b!115635 (= res!95575 (and (= (_2!5035 lt!176429) lt!176439) (= (_1!5035 lt!176429) (_2!5034 lt!176438))))))

(declare-fun thiss!1305 () BitStream!4208)

(declare-fun readBitPure!0 (BitStream!4208) tuple2!9540)

(declare-fun readerFrom!0 (BitStream!4208 (_ BitVec 32) (_ BitVec 32)) BitStream!4208)

(assert (=> b!115635 (= lt!176429 (readBitPure!0 (readerFrom!0 (_2!5034 lt!176438) (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305))))))

(declare-fun b!115636 () Bool)

(declare-fun res!95567 () Bool)

(declare-fun e!75795 () Bool)

(assert (=> b!115636 (=> (not res!95567) (not e!75795))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!115636 (= res!95567 (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(declare-fun b!115637 () Bool)

(declare-fun e!75794 () Bool)

(declare-fun lt!176435 () tuple2!9540)

(declare-fun lt!176428 () tuple2!9540)

(assert (=> b!115637 (= e!75794 (= (_2!5035 lt!176435) (_2!5035 lt!176428)))))

(declare-fun b!115638 () Bool)

(declare-fun e!75790 () Bool)

(assert (=> b!115638 (= e!75790 e!75793)))

(declare-fun res!95576 () Bool)

(assert (=> b!115638 (=> (not res!95576) (not e!75793))))

(declare-fun lt!176436 () (_ BitVec 64))

(declare-fun lt!176433 () (_ BitVec 64))

(assert (=> b!115638 (= res!95576 (= lt!176436 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!176433)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115638 (= lt!176436 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))))))

(assert (=> b!115638 (= lt!176433 (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(declare-fun b!115640 () Bool)

(assert (=> b!115640 (= e!75791 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!176429))) (currentByte!5405 (_1!5035 lt!176429)) (currentBit!5400 (_1!5035 lt!176429))) lt!176436))))

(declare-fun b!115641 () Bool)

(declare-fun lt!176432 () tuple2!9538)

(assert (=> b!115641 (= e!75795 (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176432)))))))

(declare-fun b!115642 () Bool)

(assert (=> b!115642 (= e!75792 (not (= (size!2367 (buf!2777 thiss!1305)) (size!2367 (buf!2777 (_2!5034 lt!176432))))))))

(declare-datatypes ((tuple2!9542 0))(
  ( (tuple2!9543 (_1!5036 BitStream!4208) (_2!5036 BitStream!4208)) )
))
(declare-fun lt!176434 () tuple2!9542)

(assert (=> b!115642 (= (_2!5035 (readBitPure!0 (_1!5036 lt!176434))) lt!176439)))

(declare-fun lt!176437 () tuple2!9542)

(declare-fun reader!0 (BitStream!4208 BitStream!4208) tuple2!9542)

(assert (=> b!115642 (= lt!176437 (reader!0 (_2!5034 lt!176438) (_2!5034 lt!176432)))))

(assert (=> b!115642 (= lt!176434 (reader!0 thiss!1305 (_2!5034 lt!176432)))))

(assert (=> b!115642 e!75794))

(declare-fun res!95568 () Bool)

(assert (=> b!115642 (=> (not res!95568) (not e!75794))))

(assert (=> b!115642 (= res!95568 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!176435))) (currentByte!5405 (_1!5035 lt!176435)) (currentBit!5400 (_1!5035 lt!176435))) (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!176428))) (currentByte!5405 (_1!5035 lt!176428)) (currentBit!5400 (_1!5035 lt!176428)))))))

(declare-fun lt!176430 () Unit!7115)

(declare-fun lt!176427 () BitStream!4208)

(declare-fun readBitPrefixLemma!0 (BitStream!4208 BitStream!4208) Unit!7115)

(assert (=> b!115642 (= lt!176430 (readBitPrefixLemma!0 lt!176427 (_2!5034 lt!176432)))))

(assert (=> b!115642 (= lt!176428 (readBitPure!0 (BitStream!4209 (buf!2777 (_2!5034 lt!176432)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305))))))

(assert (=> b!115642 (= lt!176435 (readBitPure!0 lt!176427))))

(assert (=> b!115642 (= lt!176427 (BitStream!4209 (buf!2777 (_2!5034 lt!176438)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(assert (=> b!115642 e!75795))

(declare-fun res!95571 () Bool)

(assert (=> b!115642 (=> (not res!95571) (not e!75795))))

(declare-fun isPrefixOf!0 (BitStream!4208 BitStream!4208) Bool)

(assert (=> b!115642 (= res!95571 (isPrefixOf!0 thiss!1305 (_2!5034 lt!176432)))))

(declare-fun lt!176431 () Unit!7115)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4208 BitStream!4208 BitStream!4208) Unit!7115)

(assert (=> b!115642 (= lt!176431 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5034 lt!176438) (_2!5034 lt!176432)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4208 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9538)

(assert (=> b!115642 (= lt!176432 (appendNLeastSignificantBitsLoop!0 (_2!5034 lt!176438) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!115642 e!75790))

(declare-fun res!95573 () Bool)

(assert (=> b!115642 (=> (not res!95573) (not e!75790))))

(assert (=> b!115642 (= res!95573 (= (size!2367 (buf!2777 thiss!1305)) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(declare-fun appendBit!0 (BitStream!4208 Bool) tuple2!9538)

(assert (=> b!115642 (= lt!176438 (appendBit!0 thiss!1305 lt!176439))))

(assert (=> b!115642 (= lt!176439 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!115643 () Bool)

(declare-fun e!75789 () Bool)

(declare-fun array_inv!2169 (array!5217) Bool)

(assert (=> b!115643 (= e!75789 (array_inv!2169 (buf!2777 thiss!1305)))))

(declare-fun b!115644 () Bool)

(declare-fun res!95570 () Bool)

(assert (=> b!115644 (=> (not res!95570) (not e!75793))))

(assert (=> b!115644 (= res!95570 (isPrefixOf!0 thiss!1305 (_2!5034 lt!176438)))))

(declare-fun b!115645 () Bool)

(declare-fun res!95577 () Bool)

(assert (=> b!115645 (=> (not res!95577) (not e!75792))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115645 (= res!95577 (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))) ((_ sign_extend 32) (currentByte!5405 thiss!1305)) ((_ sign_extend 32) (currentBit!5400 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!95572 () Bool)

(assert (=> start!22872 (=> (not res!95572) (not e!75792))))

(assert (=> start!22872 (= res!95572 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22872 e!75792))

(assert (=> start!22872 true))

(declare-fun inv!12 (BitStream!4208) Bool)

(assert (=> start!22872 (and (inv!12 thiss!1305) e!75789)))

(declare-fun b!115639 () Bool)

(declare-fun res!95569 () Bool)

(assert (=> b!115639 (=> (not res!95569) (not e!75792))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!115639 (= res!95569 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22872 res!95572) b!115645))

(assert (= (and b!115645 res!95577) b!115639))

(assert (= (and b!115639 res!95569) b!115634))

(assert (= (and b!115634 res!95574) b!115642))

(assert (= (and b!115642 res!95573) b!115638))

(assert (= (and b!115638 res!95576) b!115644))

(assert (= (and b!115644 res!95570) b!115635))

(assert (= (and b!115635 res!95575) b!115640))

(assert (= (and b!115642 res!95571) b!115636))

(assert (= (and b!115636 res!95567) b!115641))

(assert (= (and b!115642 res!95568) b!115637))

(assert (= start!22872 b!115643))

(declare-fun m!173051 () Bool)

(assert (=> b!115641 m!173051))

(declare-fun m!173053 () Bool)

(assert (=> b!115638 m!173053))

(declare-fun m!173055 () Bool)

(assert (=> b!115638 m!173055))

(declare-fun m!173057 () Bool)

(assert (=> b!115644 m!173057))

(declare-fun m!173059 () Bool)

(assert (=> b!115645 m!173059))

(declare-fun m!173061 () Bool)

(assert (=> b!115643 m!173061))

(declare-fun m!173063 () Bool)

(assert (=> b!115642 m!173063))

(declare-fun m!173065 () Bool)

(assert (=> b!115642 m!173065))

(declare-fun m!173067 () Bool)

(assert (=> b!115642 m!173067))

(declare-fun m!173069 () Bool)

(assert (=> b!115642 m!173069))

(declare-fun m!173071 () Bool)

(assert (=> b!115642 m!173071))

(declare-fun m!173073 () Bool)

(assert (=> b!115642 m!173073))

(declare-fun m!173075 () Bool)

(assert (=> b!115642 m!173075))

(declare-fun m!173077 () Bool)

(assert (=> b!115642 m!173077))

(declare-fun m!173079 () Bool)

(assert (=> b!115642 m!173079))

(declare-fun m!173081 () Bool)

(assert (=> b!115642 m!173081))

(declare-fun m!173083 () Bool)

(assert (=> b!115642 m!173083))

(declare-fun m!173085 () Bool)

(assert (=> b!115642 m!173085))

(declare-fun m!173087 () Bool)

(assert (=> b!115636 m!173087))

(declare-fun m!173089 () Bool)

(assert (=> start!22872 m!173089))

(declare-fun m!173091 () Bool)

(assert (=> b!115635 m!173091))

(assert (=> b!115635 m!173091))

(declare-fun m!173093 () Bool)

(assert (=> b!115635 m!173093))

(declare-fun m!173095 () Bool)

(assert (=> b!115640 m!173095))

(declare-fun m!173097 () Bool)

(assert (=> b!115639 m!173097))

(push 1)

(assert (not b!115638))

(assert (not b!115635))

(assert (not b!115643))

(assert (not b!115642))

(assert (not b!115641))

(assert (not b!115636))

(assert (not start!22872))

(assert (not b!115645))

(assert (not b!115639))

(assert (not b!115644))

(assert (not b!115640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37238 () Bool)

(declare-fun res!95657 () Bool)

(declare-fun e!75842 () Bool)

(assert (=> d!37238 (=> (not res!95657) (not e!75842))))

(assert (=> d!37238 (= res!95657 (= (size!2367 (buf!2777 thiss!1305)) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(assert (=> d!37238 (= (isPrefixOf!0 thiss!1305 (_2!5034 lt!176438)) e!75842)))

(declare-fun b!115731 () Bool)

(declare-fun res!95658 () Bool)

(assert (=> b!115731 (=> (not res!95658) (not e!75842))))

(assert (=> b!115731 (= res!95658 (bvsle (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)) (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438)))))))

(declare-fun b!115732 () Bool)

(declare-fun e!75843 () Bool)

(assert (=> b!115732 (= e!75842 e!75843)))

(declare-fun res!95656 () Bool)

(assert (=> b!115732 (=> res!95656 e!75843)))

(assert (=> b!115732 (= res!95656 (= (size!2367 (buf!2777 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!115733 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5217 array!5217 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!115733 (= e!75843 (arrayBitRangesEq!0 (buf!2777 thiss!1305) (buf!2777 (_2!5034 lt!176438)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305))))))

(assert (= (and d!37238 res!95657) b!115731))

(assert (= (and b!115731 res!95658) b!115732))

(assert (= (and b!115732 (not res!95656)) b!115733))

(assert (=> b!115731 m!173055))

(assert (=> b!115731 m!173053))

(assert (=> b!115733 m!173055))

(assert (=> b!115733 m!173055))

(declare-fun m!173201 () Bool)

(assert (=> b!115733 m!173201))

(assert (=> b!115644 d!37238))

(declare-fun d!37240 () Bool)

(assert (=> d!37240 (= (array_inv!2169 (buf!2777 thiss!1305)) (bvsge (size!2367 (buf!2777 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!115643 d!37240))

(declare-fun d!37242 () Bool)

(assert (=> d!37242 (= (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176438)))) (and (bvsge (currentBit!5400 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5400 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5405 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176438)))) (and (= (currentBit!5400 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176438))))))))))

(assert (=> b!115636 d!37242))

(declare-fun d!37244 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37244 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))) ((_ sign_extend 32) (currentByte!5405 thiss!1305)) ((_ sign_extend 32) (currentBit!5400 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))) ((_ sign_extend 32) (currentByte!5405 thiss!1305)) ((_ sign_extend 32) (currentBit!5400 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!9004 () Bool)

(assert (= bs!9004 d!37244))

(declare-fun m!173203 () Bool)

(assert (=> bs!9004 m!173203))

(assert (=> b!115645 d!37244))

(declare-fun d!37246 () Bool)

(declare-datatypes ((tuple2!9548 0))(
  ( (tuple2!9549 (_1!5039 Bool) (_2!5039 BitStream!4208)) )
))
(declare-fun lt!176613 () tuple2!9548)

(declare-fun readBit!0 (BitStream!4208) tuple2!9548)

(assert (=> d!37246 (= lt!176613 (readBit!0 (readerFrom!0 (_2!5034 lt!176438) (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305))))))

(assert (=> d!37246 (= (readBitPure!0 (readerFrom!0 (_2!5034 lt!176438) (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305))) (tuple2!9541 (_2!5039 lt!176613) (_1!5039 lt!176613)))))

(declare-fun bs!9005 () Bool)

(assert (= bs!9005 d!37246))

(assert (=> bs!9005 m!173091))

(declare-fun m!173215 () Bool)

(assert (=> bs!9005 m!173215))

(assert (=> b!115635 d!37246))

(declare-fun d!37250 () Bool)

(declare-fun e!75849 () Bool)

(assert (=> d!37250 e!75849))

(declare-fun res!95665 () Bool)

(assert (=> d!37250 (=> (not res!95665) (not e!75849))))

(assert (=> d!37250 (= res!95665 (invariant!0 (currentBit!5400 (_2!5034 lt!176438)) (currentByte!5405 (_2!5034 lt!176438)) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(assert (=> d!37250 (= (readerFrom!0 (_2!5034 lt!176438) (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305)) (BitStream!4209 (buf!2777 (_2!5034 lt!176438)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(declare-fun b!115739 () Bool)

(assert (=> b!115739 (= e!75849 (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(assert (= (and d!37250 res!95665) b!115739))

(declare-fun m!173217 () Bool)

(assert (=> d!37250 m!173217))

(assert (=> b!115739 m!173087))

(assert (=> b!115635 d!37250))

(declare-fun d!37252 () Bool)

(assert (=> d!37252 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!115639 d!37252))

(declare-fun d!37254 () Bool)

(declare-fun e!75852 () Bool)

(assert (=> d!37254 e!75852))

(declare-fun res!95671 () Bool)

(assert (=> d!37254 (=> (not res!95671) (not e!75852))))

(declare-fun lt!176627 () (_ BitVec 64))

(declare-fun lt!176628 () (_ BitVec 64))

(declare-fun lt!176629 () (_ BitVec 64))

(assert (=> d!37254 (= res!95671 (= lt!176627 (bvsub lt!176629 lt!176628)))))

(assert (=> d!37254 (or (= (bvand lt!176629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176628 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176629 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176629 lt!176628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37254 (= lt!176628 (remainingBits!0 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!176438)))) ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!176438))) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!176438)))))))

(declare-fun lt!176630 () (_ BitVec 64))

(declare-fun lt!176626 () (_ BitVec 64))

(assert (=> d!37254 (= lt!176629 (bvmul lt!176630 lt!176626))))

(assert (=> d!37254 (or (= lt!176630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176626 (bvsdiv (bvmul lt!176630 lt!176626) lt!176630)))))

(assert (=> d!37254 (= lt!176626 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37254 (= lt!176630 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(assert (=> d!37254 (= lt!176627 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!176438))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!176438)))))))

(assert (=> d!37254 (invariant!0 (currentBit!5400 (_2!5034 lt!176438)) (currentByte!5405 (_2!5034 lt!176438)) (size!2367 (buf!2777 (_2!5034 lt!176438))))))

(assert (=> d!37254 (= (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))) lt!176627)))

(declare-fun b!115744 () Bool)

(declare-fun res!95670 () Bool)

(assert (=> b!115744 (=> (not res!95670) (not e!75852))))

(assert (=> b!115744 (= res!95670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176627))))

(declare-fun b!115745 () Bool)

(declare-fun lt!176631 () (_ BitVec 64))

(assert (=> b!115745 (= e!75852 (bvsle lt!176627 (bvmul lt!176631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115745 (or (= lt!176631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176631)))))

(assert (=> b!115745 (= lt!176631 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!176438)))))))

(assert (= (and d!37254 res!95671) b!115744))

(assert (= (and b!115744 res!95670) b!115745))

(declare-fun m!173219 () Bool)

(assert (=> d!37254 m!173219))

(assert (=> d!37254 m!173217))

(assert (=> b!115638 d!37254))

(declare-fun d!37256 () Bool)

(declare-fun e!75853 () Bool)

(assert (=> d!37256 e!75853))

(declare-fun res!95673 () Bool)

(assert (=> d!37256 (=> (not res!95673) (not e!75853))))

(declare-fun lt!176635 () (_ BitVec 64))

(declare-fun lt!176634 () (_ BitVec 64))

(declare-fun lt!176633 () (_ BitVec 64))

(assert (=> d!37256 (= res!95673 (= lt!176633 (bvsub lt!176635 lt!176634)))))

(assert (=> d!37256 (or (= (bvand lt!176635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176635 lt!176634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37256 (= lt!176634 (remainingBits!0 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))) ((_ sign_extend 32) (currentByte!5405 thiss!1305)) ((_ sign_extend 32) (currentBit!5400 thiss!1305))))))

(declare-fun lt!176636 () (_ BitVec 64))

(declare-fun lt!176632 () (_ BitVec 64))

(assert (=> d!37256 (= lt!176635 (bvmul lt!176636 lt!176632))))

(assert (=> d!37256 (or (= lt!176636 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176632 (bvsdiv (bvmul lt!176636 lt!176632) lt!176636)))))

(assert (=> d!37256 (= lt!176632 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37256 (= lt!176636 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))))))

(assert (=> d!37256 (= lt!176633 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5405 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5400 thiss!1305))))))

(assert (=> d!37256 (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 thiss!1305)))))

(assert (=> d!37256 (= (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)) lt!176633)))

(declare-fun b!115746 () Bool)

(declare-fun res!95672 () Bool)

(assert (=> b!115746 (=> (not res!95672) (not e!75853))))

(assert (=> b!115746 (= res!95672 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176633))))

(declare-fun b!115747 () Bool)

(declare-fun lt!176637 () (_ BitVec 64))

(assert (=> b!115747 (= e!75853 (bvsle lt!176633 (bvmul lt!176637 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115747 (or (= lt!176637 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176637 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176637)))))

(assert (=> b!115747 (= lt!176637 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))))))

(assert (= (and d!37256 res!95673) b!115746))

(assert (= (and b!115746 res!95672) b!115747))

(assert (=> d!37256 m!173203))

(declare-fun m!173221 () Bool)

(assert (=> d!37256 m!173221))

(assert (=> b!115638 d!37256))

(declare-fun d!37258 () Bool)

(assert (=> d!37258 (= (invariant!0 (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176432)))) (and (bvsge (currentBit!5400 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5400 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5405 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176432)))) (and (= (currentBit!5400 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5405 thiss!1305) (size!2367 (buf!2777 (_2!5034 lt!176432))))))))))

(assert (=> b!115641 d!37258))

(declare-fun d!37260 () Bool)

(declare-fun e!75864 () Bool)

(assert (=> d!37260 e!75864))

(declare-fun res!95691 () Bool)

(assert (=> d!37260 (=> (not res!95691) (not e!75864))))

(declare-fun lt!176710 () tuple2!9538)

(assert (=> d!37260 (= res!95691 (= (size!2367 (buf!2777 thiss!1305)) (size!2367 (buf!2777 (_2!5034 lt!176710)))))))

(declare-fun choose!16 (BitStream!4208 Bool) tuple2!9538)

(assert (=> d!37260 (= lt!176710 (choose!16 thiss!1305 lt!176439))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37260 (validate_offset_bit!0 ((_ sign_extend 32) (size!2367 (buf!2777 thiss!1305))) ((_ sign_extend 32) (currentByte!5405 thiss!1305)) ((_ sign_extend 32) (currentBit!5400 thiss!1305)))))

(assert (=> d!37260 (= (appendBit!0 thiss!1305 lt!176439) lt!176710)))

(declare-fun b!115775 () Bool)

(declare-fun e!75865 () Bool)

(declare-fun lt!176708 () tuple2!9540)

(assert (=> b!115775 (= e!75865 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!176708))) (currentByte!5405 (_1!5035 lt!176708)) (currentBit!5400 (_1!5035 lt!176708))) (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176710))) (currentByte!5405 (_2!5034 lt!176710)) (currentBit!5400 (_2!5034 lt!176710)))))))

(declare-fun b!115774 () Bool)

(assert (=> b!115774 (= e!75864 e!75865)))

(declare-fun res!95692 () Bool)

(assert (=> b!115774 (=> (not res!95692) (not e!75865))))

(assert (=> b!115774 (= res!95692 (and (= (_2!5035 lt!176708) lt!176439) (= (_1!5035 lt!176708) (_2!5034 lt!176710))))))

(assert (=> b!115774 (= lt!176708 (readBitPure!0 (readerFrom!0 (_2!5034 lt!176710) (currentBit!5400 thiss!1305) (currentByte!5405 thiss!1305))))))

(declare-fun b!115773 () Bool)

(declare-fun res!95694 () Bool)

(assert (=> b!115773 (=> (not res!95694) (not e!75864))))

(assert (=> b!115773 (= res!95694 (isPrefixOf!0 thiss!1305 (_2!5034 lt!176710)))))

(declare-fun b!115772 () Bool)

(declare-fun res!95693 () Bool)

(assert (=> b!115772 (=> (not res!95693) (not e!75864))))

(declare-fun lt!176709 () (_ BitVec 64))

(declare-fun lt!176707 () (_ BitVec 64))

(assert (=> b!115772 (= res!95693 (= (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176710))) (currentByte!5405 (_2!5034 lt!176710)) (currentBit!5400 (_2!5034 lt!176710))) (bvadd lt!176709 lt!176707)))))

(assert (=> b!115772 (or (not (= (bvand lt!176709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176707 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!176709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!176709 lt!176707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115772 (= lt!176707 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!115772 (= lt!176709 (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(assert (= (and d!37260 res!95691) b!115772))

(assert (= (and b!115772 res!95693) b!115773))

(assert (= (and b!115773 res!95694) b!115774))

(assert (= (and b!115774 res!95692) b!115775))

(declare-fun m!173257 () Bool)

(assert (=> b!115775 m!173257))

(declare-fun m!173259 () Bool)

(assert (=> b!115775 m!173259))

(declare-fun m!173261 () Bool)

(assert (=> b!115773 m!173261))

(assert (=> b!115772 m!173259))

(assert (=> b!115772 m!173055))

(declare-fun m!173263 () Bool)

(assert (=> d!37260 m!173263))

(declare-fun m!173265 () Bool)

(assert (=> d!37260 m!173265))

(declare-fun m!173267 () Bool)

(assert (=> b!115774 m!173267))

(assert (=> b!115774 m!173267))

(declare-fun m!173269 () Bool)

(assert (=> b!115774 m!173269))

(assert (=> b!115642 d!37260))

(declare-fun d!37266 () Bool)

(declare-fun lt!176711 () tuple2!9548)

(assert (=> d!37266 (= lt!176711 (readBit!0 (BitStream!4209 (buf!2777 (_2!5034 lt!176432)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305))))))

(assert (=> d!37266 (= (readBitPure!0 (BitStream!4209 (buf!2777 (_2!5034 lt!176432)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305))) (tuple2!9541 (_2!5039 lt!176711) (_1!5039 lt!176711)))))

(declare-fun bs!9007 () Bool)

(assert (= bs!9007 d!37266))

(declare-fun m!173271 () Bool)

(assert (=> bs!9007 m!173271))

(assert (=> b!115642 d!37266))

(declare-fun d!37268 () Bool)

(declare-fun lt!176712 () tuple2!9548)

(assert (=> d!37268 (= lt!176712 (readBit!0 lt!176427))))

(assert (=> d!37268 (= (readBitPure!0 lt!176427) (tuple2!9541 (_2!5039 lt!176712) (_1!5039 lt!176712)))))

(declare-fun bs!9008 () Bool)

(assert (= bs!9008 d!37268))

(declare-fun m!173273 () Bool)

(assert (=> bs!9008 m!173273))

(assert (=> b!115642 d!37268))

(declare-fun d!37270 () Bool)

(declare-fun e!75866 () Bool)

(assert (=> d!37270 e!75866))

(declare-fun res!95696 () Bool)

(assert (=> d!37270 (=> (not res!95696) (not e!75866))))

(declare-fun lt!176716 () (_ BitVec 64))

(declare-fun lt!176714 () (_ BitVec 64))

(declare-fun lt!176715 () (_ BitVec 64))

(assert (=> d!37270 (= res!95696 (= lt!176714 (bvsub lt!176716 lt!176715)))))

(assert (=> d!37270 (or (= (bvand lt!176716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176715 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176716 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176716 lt!176715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37270 (= lt!176715 (remainingBits!0 ((_ sign_extend 32) (size!2367 (buf!2777 (_1!5035 lt!176435)))) ((_ sign_extend 32) (currentByte!5405 (_1!5035 lt!176435))) ((_ sign_extend 32) (currentBit!5400 (_1!5035 lt!176435)))))))

(declare-fun lt!176717 () (_ BitVec 64))

(declare-fun lt!176713 () (_ BitVec 64))

(assert (=> d!37270 (= lt!176716 (bvmul lt!176717 lt!176713))))

(assert (=> d!37270 (or (= lt!176717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!176713 (bvsdiv (bvmul lt!176717 lt!176713) lt!176717)))))

(assert (=> d!37270 (= lt!176713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37270 (= lt!176717 ((_ sign_extend 32) (size!2367 (buf!2777 (_1!5035 lt!176435)))))))

(assert (=> d!37270 (= lt!176714 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5405 (_1!5035 lt!176435))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5400 (_1!5035 lt!176435)))))))

(assert (=> d!37270 (invariant!0 (currentBit!5400 (_1!5035 lt!176435)) (currentByte!5405 (_1!5035 lt!176435)) (size!2367 (buf!2777 (_1!5035 lt!176435))))))

(assert (=> d!37270 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!176435))) (currentByte!5405 (_1!5035 lt!176435)) (currentBit!5400 (_1!5035 lt!176435))) lt!176714)))

(declare-fun b!115776 () Bool)

(declare-fun res!95695 () Bool)

(assert (=> b!115776 (=> (not res!95695) (not e!75866))))

(assert (=> b!115776 (= res!95695 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!176714))))

(declare-fun b!115777 () Bool)

(declare-fun lt!176718 () (_ BitVec 64))

(assert (=> b!115777 (= e!75866 (bvsle lt!176714 (bvmul lt!176718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!115777 (or (= lt!176718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!176718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!176718)))))

(assert (=> b!115777 (= lt!176718 ((_ sign_extend 32) (size!2367 (buf!2777 (_1!5035 lt!176435)))))))

(assert (= (and d!37270 res!95696) b!115776))

(assert (= (and b!115776 res!95695) b!115777))

(declare-fun m!173275 () Bool)

(assert (=> d!37270 m!173275))

(declare-fun m!173277 () Bool)

(assert (=> d!37270 m!173277))

(assert (=> b!115642 d!37270))

(declare-fun b!115804 () Bool)

(declare-fun e!75880 () Unit!7115)

(declare-fun Unit!7133 () Unit!7115)

(assert (=> b!115804 (= e!75880 Unit!7133)))

(declare-fun b!115805 () Bool)

(declare-fun lt!176803 () Unit!7115)

(assert (=> b!115805 (= e!75880 lt!176803)))

(declare-fun lt!176791 () (_ BitVec 64))

(assert (=> b!115805 (= lt!176791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!176795 () (_ BitVec 64))

(assert (=> b!115805 (= lt!176795 (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5217 array!5217 (_ BitVec 64) (_ BitVec 64)) Unit!7115)

(assert (=> b!115805 (= lt!176803 (arrayBitRangesEqSymmetric!0 (buf!2777 thiss!1305) (buf!2777 (_2!5034 lt!176432)) lt!176791 lt!176795))))

(assert (=> b!115805 (arrayBitRangesEq!0 (buf!2777 (_2!5034 lt!176432)) (buf!2777 thiss!1305) lt!176791 lt!176795)))

(declare-fun b!115806 () Bool)

(declare-fun lt!176804 () (_ BitVec 64))

(declare-fun e!75881 () Bool)

(declare-fun lt!176796 () (_ BitVec 64))

(declare-fun lt!176808 () tuple2!9542)

(declare-fun withMovedBitIndex!0 (BitStream!4208 (_ BitVec 64)) BitStream!4208)

(assert (=> b!115806 (= e!75881 (= (_1!5036 lt!176808) (withMovedBitIndex!0 (_2!5036 lt!176808) (bvsub lt!176796 lt!176804))))))

(assert (=> b!115806 (or (= (bvand lt!176796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!176804 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!176796 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!176796 lt!176804) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115806 (= lt!176804 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176432))) (currentByte!5405 (_2!5034 lt!176432)) (currentBit!5400 (_2!5034 lt!176432))))))

(assert (=> b!115806 (= lt!176796 (bitIndex!0 (size!2367 (buf!2777 thiss!1305)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(declare-fun b!115807 () Bool)

(declare-fun res!95717 () Bool)

(assert (=> b!115807 (=> (not res!95717) (not e!75881))))

(assert (=> b!115807 (= res!95717 (isPrefixOf!0 (_1!5036 lt!176808) thiss!1305))))

(declare-fun d!37272 () Bool)

(assert (=> d!37272 e!75881))

(declare-fun res!95718 () Bool)

(assert (=> d!37272 (=> (not res!95718) (not e!75881))))

(assert (=> d!37272 (= res!95718 (isPrefixOf!0 (_1!5036 lt!176808) (_2!5036 lt!176808)))))

(declare-fun lt!176802 () BitStream!4208)

(assert (=> d!37272 (= lt!176808 (tuple2!9543 lt!176802 (_2!5034 lt!176432)))))

(declare-fun lt!176798 () Unit!7115)

(declare-fun lt!176800 () Unit!7115)

(assert (=> d!37272 (= lt!176798 lt!176800)))

(assert (=> d!37272 (isPrefixOf!0 lt!176802 (_2!5034 lt!176432))))

(assert (=> d!37272 (= lt!176800 (lemmaIsPrefixTransitive!0 lt!176802 (_2!5034 lt!176432) (_2!5034 lt!176432)))))

(declare-fun lt!176805 () Unit!7115)

(declare-fun lt!176809 () Unit!7115)

(assert (=> d!37272 (= lt!176805 lt!176809)))

(assert (=> d!37272 (isPrefixOf!0 lt!176802 (_2!5034 lt!176432))))

(assert (=> d!37272 (= lt!176809 (lemmaIsPrefixTransitive!0 lt!176802 thiss!1305 (_2!5034 lt!176432)))))

(declare-fun lt!176793 () Unit!7115)

(assert (=> d!37272 (= lt!176793 e!75880)))

(declare-fun c!7010 () Bool)

(assert (=> d!37272 (= c!7010 (not (= (size!2367 (buf!2777 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!176792 () Unit!7115)

(declare-fun lt!176801 () Unit!7115)

(assert (=> d!37272 (= lt!176792 lt!176801)))

(assert (=> d!37272 (isPrefixOf!0 (_2!5034 lt!176432) (_2!5034 lt!176432))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4208) Unit!7115)

(assert (=> d!37272 (= lt!176801 (lemmaIsPrefixRefl!0 (_2!5034 lt!176432)))))

(declare-fun lt!176794 () Unit!7115)

(declare-fun lt!176807 () Unit!7115)

(assert (=> d!37272 (= lt!176794 lt!176807)))

(assert (=> d!37272 (= lt!176807 (lemmaIsPrefixRefl!0 (_2!5034 lt!176432)))))

(declare-fun lt!176799 () Unit!7115)

(declare-fun lt!176797 () Unit!7115)

(assert (=> d!37272 (= lt!176799 lt!176797)))

(assert (=> d!37272 (isPrefixOf!0 lt!176802 lt!176802)))

(assert (=> d!37272 (= lt!176797 (lemmaIsPrefixRefl!0 lt!176802))))

(declare-fun lt!176790 () Unit!7115)

(declare-fun lt!176806 () Unit!7115)

(assert (=> d!37272 (= lt!176790 lt!176806)))

(assert (=> d!37272 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!37272 (= lt!176806 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!37272 (= lt!176802 (BitStream!4209 (buf!2777 (_2!5034 lt!176432)) (currentByte!5405 thiss!1305) (currentBit!5400 thiss!1305)))))

(assert (=> d!37272 (isPrefixOf!0 thiss!1305 (_2!5034 lt!176432))))

(assert (=> d!37272 (= (reader!0 thiss!1305 (_2!5034 lt!176432)) lt!176808)))

(declare-fun b!115808 () Bool)

(declare-fun res!95719 () Bool)

(assert (=> b!115808 (=> (not res!95719) (not e!75881))))

(assert (=> b!115808 (= res!95719 (isPrefixOf!0 (_2!5036 lt!176808) (_2!5034 lt!176432)))))

(assert (= (and d!37272 c!7010) b!115805))

(assert (= (and d!37272 (not c!7010)) b!115804))

(assert (= (and d!37272 res!95718) b!115807))

(assert (= (and b!115807 res!95717) b!115808))

(assert (= (and b!115808 res!95719) b!115806))

(assert (=> b!115805 m!173055))

(declare-fun m!173319 () Bool)

(assert (=> b!115805 m!173319))

(declare-fun m!173321 () Bool)

(assert (=> b!115805 m!173321))

(declare-fun m!173323 () Bool)

(assert (=> b!115807 m!173323))

(declare-fun m!173325 () Bool)

(assert (=> d!37272 m!173325))

(declare-fun m!173327 () Bool)

(assert (=> d!37272 m!173327))

(declare-fun m!173329 () Bool)

(assert (=> d!37272 m!173329))

(declare-fun m!173331 () Bool)

(assert (=> d!37272 m!173331))

(declare-fun m!173333 () Bool)

(assert (=> d!37272 m!173333))

(declare-fun m!173335 () Bool)

(assert (=> d!37272 m!173335))

(declare-fun m!173337 () Bool)

(assert (=> d!37272 m!173337))

(declare-fun m!173339 () Bool)

(assert (=> d!37272 m!173339))

(declare-fun m!173341 () Bool)

(assert (=> d!37272 m!173341))

(declare-fun m!173343 () Bool)

(assert (=> d!37272 m!173343))

(assert (=> d!37272 m!173067))

(declare-fun m!173345 () Bool)

(assert (=> b!115808 m!173345))

(declare-fun m!173347 () Bool)

(assert (=> b!115806 m!173347))

(declare-fun m!173349 () Bool)

(assert (=> b!115806 m!173349))

(assert (=> b!115806 m!173055))

(assert (=> b!115642 d!37272))

(declare-fun b!115930 () Bool)

(declare-fun e!75954 () (_ BitVec 64))

(assert (=> b!115930 (= e!75954 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun call!1508 () Bool)

(declare-fun c!7028 () Bool)

(declare-fun bm!1505 () Bool)

(declare-fun lt!177257 () BitStream!4208)

(declare-fun lt!177245 () tuple2!9538)

(assert (=> bm!1505 (= call!1508 (isPrefixOf!0 (ite c!7028 (_2!5034 lt!176438) lt!177257) (ite c!7028 (_2!5034 lt!177245) lt!177257)))))

(declare-fun b!115931 () Bool)

(declare-fun e!75953 () Bool)

(declare-fun lt!177236 () tuple2!9540)

(declare-fun lt!177219 () tuple2!9538)

(assert (=> b!115931 (= e!75953 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!177236))) (currentByte!5405 (_1!5035 lt!177236)) (currentBit!5400 (_1!5035 lt!177236))) (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177219))) (currentByte!5405 (_2!5034 lt!177219)) (currentBit!5400 (_2!5034 lt!177219)))))))

(declare-fun b!115932 () Bool)

(declare-fun res!95815 () Bool)

(assert (=> b!115932 (= res!95815 (isPrefixOf!0 (_2!5034 lt!176438) (_2!5034 lt!177219)))))

(declare-fun e!75948 () Bool)

(assert (=> b!115932 (=> (not res!95815) (not e!75948))))

(declare-fun b!115933 () Bool)

(declare-fun e!75952 () tuple2!9538)

(declare-fun Unit!7134 () Unit!7115)

(assert (=> b!115933 (= e!75952 (tuple2!9539 Unit!7134 (_2!5034 lt!177245)))))

(declare-fun lt!177231 () Bool)

(assert (=> b!115933 (= lt!177231 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115933 (= lt!177219 (appendBit!0 (_2!5034 lt!176438) lt!177231))))

(declare-fun res!95810 () Bool)

(assert (=> b!115933 (= res!95810 (= (size!2367 (buf!2777 (_2!5034 lt!176438))) (size!2367 (buf!2777 (_2!5034 lt!177219)))))))

(assert (=> b!115933 (=> (not res!95810) (not e!75948))))

(assert (=> b!115933 e!75948))

(declare-fun lt!177246 () tuple2!9538)

(assert (=> b!115933 (= lt!177246 lt!177219)))

(assert (=> b!115933 (= lt!177245 (appendNLeastSignificantBitsLoop!0 (_2!5034 lt!177246) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!177247 () Unit!7115)

(assert (=> b!115933 (= lt!177247 (lemmaIsPrefixTransitive!0 (_2!5034 lt!176438) (_2!5034 lt!177246) (_2!5034 lt!177245)))))

(assert (=> b!115933 call!1508))

(declare-fun lt!177256 () Unit!7115)

(assert (=> b!115933 (= lt!177256 lt!177247)))

(assert (=> b!115933 (invariant!0 (currentBit!5400 (_2!5034 lt!176438)) (currentByte!5405 (_2!5034 lt!176438)) (size!2367 (buf!2777 (_2!5034 lt!177246))))))

(declare-fun lt!177244 () BitStream!4208)

(assert (=> b!115933 (= lt!177244 (BitStream!4209 (buf!2777 (_2!5034 lt!177246)) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))))))

(assert (=> b!115933 (invariant!0 (currentBit!5400 lt!177244) (currentByte!5405 lt!177244) (size!2367 (buf!2777 (_2!5034 lt!177245))))))

(declare-fun lt!177248 () BitStream!4208)

(assert (=> b!115933 (= lt!177248 (BitStream!4209 (buf!2777 (_2!5034 lt!177245)) (currentByte!5405 lt!177244) (currentBit!5400 lt!177244)))))

(declare-fun lt!177228 () tuple2!9540)

(assert (=> b!115933 (= lt!177228 (readBitPure!0 lt!177244))))

(declare-fun lt!177237 () tuple2!9540)

(assert (=> b!115933 (= lt!177237 (readBitPure!0 lt!177248))))

(declare-fun lt!177258 () Unit!7115)

(assert (=> b!115933 (= lt!177258 (readBitPrefixLemma!0 lt!177244 (_2!5034 lt!177245)))))

(declare-fun res!95814 () Bool)

(assert (=> b!115933 (= res!95814 (= (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!177228))) (currentByte!5405 (_1!5035 lt!177228)) (currentBit!5400 (_1!5035 lt!177228))) (bitIndex!0 (size!2367 (buf!2777 (_1!5035 lt!177237))) (currentByte!5405 (_1!5035 lt!177237)) (currentBit!5400 (_1!5035 lt!177237)))))))

(declare-fun e!75949 () Bool)

(assert (=> b!115933 (=> (not res!95814) (not e!75949))))

(assert (=> b!115933 e!75949))

(declare-fun lt!177223 () Unit!7115)

(assert (=> b!115933 (= lt!177223 lt!177258)))

(declare-fun lt!177227 () tuple2!9542)

(assert (=> b!115933 (= lt!177227 (reader!0 (_2!5034 lt!176438) (_2!5034 lt!177245)))))

(declare-fun lt!177225 () tuple2!9542)

(assert (=> b!115933 (= lt!177225 (reader!0 (_2!5034 lt!177246) (_2!5034 lt!177245)))))

(declare-fun lt!177252 () tuple2!9540)

(assert (=> b!115933 (= lt!177252 (readBitPure!0 (_1!5036 lt!177227)))))

(assert (=> b!115933 (= (_2!5035 lt!177252) lt!177231)))

(declare-fun lt!177232 () Unit!7115)

(declare-fun Unit!7135 () Unit!7115)

(assert (=> b!115933 (= lt!177232 Unit!7135)))

(declare-fun lt!177221 () (_ BitVec 64))

(assert (=> b!115933 (= lt!177221 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!177233 () (_ BitVec 64))

(assert (=> b!115933 (= lt!177233 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!177218 () Unit!7115)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4208 array!5217 (_ BitVec 64)) Unit!7115)

(assert (=> b!115933 (= lt!177218 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5034 lt!176438) (buf!2777 (_2!5034 lt!177245)) lt!177233))))

(assert (=> b!115933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!177245)))) ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!176438))) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!176438))) lt!177233)))

(declare-fun lt!177253 () Unit!7115)

(assert (=> b!115933 (= lt!177253 lt!177218)))

(declare-datatypes ((tuple2!9554 0))(
  ( (tuple2!9555 (_1!5042 BitStream!4208) (_2!5042 (_ BitVec 64))) )
))
(declare-fun lt!177242 () tuple2!9554)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9554)

(assert (=> b!115933 (= lt!177242 (readNLeastSignificantBitsLoopPure!0 (_1!5036 lt!177227) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177221))))

(declare-fun lt!177239 () (_ BitVec 64))

(assert (=> b!115933 (= lt!177239 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!177243 () Unit!7115)

(assert (=> b!115933 (= lt!177243 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5034 lt!177246) (buf!2777 (_2!5034 lt!177245)) lt!177239))))

(assert (=> b!115933 (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!177245)))) ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!177246))) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!177246))) lt!177239)))

(declare-fun lt!177220 () Unit!7115)

(assert (=> b!115933 (= lt!177220 lt!177243)))

(declare-fun lt!177230 () tuple2!9554)

(assert (=> b!115933 (= lt!177230 (readNLeastSignificantBitsLoopPure!0 (_1!5036 lt!177225) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!177221 (ite (_2!5035 lt!177252) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!177259 () tuple2!9554)

(assert (=> b!115933 (= lt!177259 (readNLeastSignificantBitsLoopPure!0 (_1!5036 lt!177227) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177221))))

(declare-fun c!7029 () Bool)

(assert (=> b!115933 (= c!7029 (_2!5035 (readBitPure!0 (_1!5036 lt!177227))))))

(declare-fun lt!177235 () tuple2!9554)

(assert (=> b!115933 (= lt!177235 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5036 lt!177227) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!177221 e!75954)))))

(declare-fun lt!177249 () Unit!7115)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7115)

(assert (=> b!115933 (= lt!177249 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5036 lt!177227) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177221))))

(assert (=> b!115933 (and (= (_2!5042 lt!177259) (_2!5042 lt!177235)) (= (_1!5042 lt!177259) (_1!5042 lt!177235)))))

(declare-fun lt!177217 () Unit!7115)

(assert (=> b!115933 (= lt!177217 lt!177249)))

(assert (=> b!115933 (= (_1!5036 lt!177227) (withMovedBitIndex!0 (_2!5036 lt!177227) (bvsub (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))) (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177245))) (currentByte!5405 (_2!5034 lt!177245)) (currentBit!5400 (_2!5034 lt!177245))))))))

(declare-fun lt!177255 () Unit!7115)

(declare-fun Unit!7136 () Unit!7115)

(assert (=> b!115933 (= lt!177255 Unit!7136)))

(assert (=> b!115933 (= (_1!5036 lt!177225) (withMovedBitIndex!0 (_2!5036 lt!177225) (bvsub (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177246))) (currentByte!5405 (_2!5034 lt!177246)) (currentBit!5400 (_2!5034 lt!177246))) (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177245))) (currentByte!5405 (_2!5034 lt!177245)) (currentBit!5400 (_2!5034 lt!177245))))))))

(declare-fun lt!177226 () Unit!7115)

(declare-fun Unit!7137 () Unit!7115)

(assert (=> b!115933 (= lt!177226 Unit!7137)))

(assert (=> b!115933 (= (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))) (bvsub (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177246))) (currentByte!5405 (_2!5034 lt!177246)) (currentBit!5400 (_2!5034 lt!177246))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!177238 () Unit!7115)

(declare-fun Unit!7138 () Unit!7115)

(assert (=> b!115933 (= lt!177238 Unit!7138)))

(assert (=> b!115933 (= (_2!5042 lt!177242) (_2!5042 lt!177230))))

(declare-fun lt!177261 () Unit!7115)

(declare-fun Unit!7139 () Unit!7115)

(assert (=> b!115933 (= lt!177261 Unit!7139)))

(assert (=> b!115933 (= (_1!5042 lt!177242) (_2!5036 lt!177227))))

(declare-fun b!115934 () Bool)

(declare-fun res!95816 () Bool)

(declare-fun e!75951 () Bool)

(assert (=> b!115934 (=> (not res!95816) (not e!75951))))

(declare-fun lt!177229 () (_ BitVec 64))

(declare-fun lt!177240 () tuple2!9538)

(declare-fun lt!177224 () (_ BitVec 64))

(assert (=> b!115934 (= res!95816 (= (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177240))) (currentByte!5405 (_2!5034 lt!177240)) (currentBit!5400 (_2!5034 lt!177240))) (bvadd lt!177224 lt!177229)))))

(assert (=> b!115934 (or (not (= (bvand lt!177224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!177229 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!177224 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!177224 lt!177229) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115934 (= lt!177229 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115934 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115934 (= lt!177224 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))))))

(declare-fun lt!177234 () tuple2!9542)

(declare-fun b!115935 () Bool)

(declare-fun lt!177250 () tuple2!9554)

(assert (=> b!115935 (= e!75951 (and (= (_2!5042 lt!177250) v!199) (= (_1!5042 lt!177250) (_2!5036 lt!177234))))))

(declare-fun lt!177260 () (_ BitVec 64))

(assert (=> b!115935 (= lt!177250 (readNLeastSignificantBitsLoopPure!0 (_1!5036 lt!177234) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!177260))))

(declare-fun lt!177222 () Unit!7115)

(declare-fun lt!177254 () Unit!7115)

(assert (=> b!115935 (= lt!177222 lt!177254)))

(declare-fun lt!177251 () (_ BitVec 64))

(assert (=> b!115935 (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!177240)))) ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!176438))) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!176438))) lt!177251)))

(assert (=> b!115935 (= lt!177254 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5034 lt!176438) (buf!2777 (_2!5034 lt!177240)) lt!177251))))

(declare-fun e!75950 () Bool)

(assert (=> b!115935 e!75950))

(declare-fun res!95809 () Bool)

(assert (=> b!115935 (=> (not res!95809) (not e!75950))))

(assert (=> b!115935 (= res!95809 (and (= (size!2367 (buf!2777 (_2!5034 lt!176438))) (size!2367 (buf!2777 (_2!5034 lt!177240)))) (bvsge lt!177251 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115935 (= lt!177251 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!115935 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115935 (= lt!177260 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!115935 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!115935 (= lt!177234 (reader!0 (_2!5034 lt!176438) (_2!5034 lt!177240)))))

(declare-fun b!115936 () Bool)

(assert (=> b!115936 (= e!75954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!115937 () Bool)

(assert (=> b!115937 (= lt!177236 (readBitPure!0 (readerFrom!0 (_2!5034 lt!177219) (currentBit!5400 (_2!5034 lt!176438)) (currentByte!5405 (_2!5034 lt!176438)))))))

(declare-fun res!95811 () Bool)

(assert (=> b!115937 (= res!95811 (and (= (_2!5035 lt!177236) lt!177231) (= (_1!5035 lt!177236) (_2!5034 lt!177219))))))

(assert (=> b!115937 (=> (not res!95811) (not e!75953))))

(assert (=> b!115937 (= e!75948 e!75953)))

(declare-fun b!115938 () Bool)

(assert (=> b!115938 (= e!75949 (= (_2!5035 lt!177228) (_2!5035 lt!177237)))))

(declare-fun d!37286 () Bool)

(assert (=> d!37286 e!75951))

(declare-fun res!95808 () Bool)

(assert (=> d!37286 (=> (not res!95808) (not e!75951))))

(assert (=> d!37286 (= res!95808 (= (size!2367 (buf!2777 (_2!5034 lt!176438))) (size!2367 (buf!2777 (_2!5034 lt!177240)))))))

(assert (=> d!37286 (= lt!177240 e!75952)))

(assert (=> d!37286 (= c!7028 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37286 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37286 (= (appendNLeastSignificantBitsLoop!0 (_2!5034 lt!176438) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!177240)))

(declare-fun b!115939 () Bool)

(declare-fun res!95812 () Bool)

(assert (=> b!115939 (=> (not res!95812) (not e!75951))))

(assert (=> b!115939 (= res!95812 (isPrefixOf!0 (_2!5034 lt!176438) (_2!5034 lt!177240)))))

(declare-fun b!115940 () Bool)

(assert (=> b!115940 (= e!75950 (validate_offset_bits!1 ((_ sign_extend 32) (size!2367 (buf!2777 (_2!5034 lt!176438)))) ((_ sign_extend 32) (currentByte!5405 (_2!5034 lt!176438))) ((_ sign_extend 32) (currentBit!5400 (_2!5034 lt!176438))) lt!177251))))

(declare-fun b!115941 () Bool)

(declare-fun res!95813 () Bool)

(assert (=> b!115941 (= res!95813 (= (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!177219))) (currentByte!5405 (_2!5034 lt!177219)) (currentBit!5400 (_2!5034 lt!177219))) (bvadd (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!115941 (=> (not res!95813) (not e!75948))))

(declare-fun b!115942 () Bool)

(declare-fun lt!177241 () Unit!7115)

(assert (=> b!115942 (= e!75952 (tuple2!9539 lt!177241 (_2!5034 lt!176438)))))

(assert (=> b!115942 (= lt!177257 (_2!5034 lt!176438))))

(assert (=> b!115942 (= lt!177241 (lemmaIsPrefixRefl!0 lt!177257))))

(assert (=> b!115942 call!1508))

(assert (= (and d!37286 c!7028) b!115933))

(assert (= (and d!37286 (not c!7028)) b!115942))

(assert (= (and b!115933 res!95810) b!115941))

(assert (= (and b!115941 res!95813) b!115932))

(assert (= (and b!115932 res!95815) b!115937))

(assert (= (and b!115937 res!95811) b!115931))

(assert (= (and b!115933 res!95814) b!115938))

(assert (= (and b!115933 c!7029) b!115930))

(assert (= (and b!115933 (not c!7029)) b!115936))

(assert (= (or b!115933 b!115942) bm!1505))

(assert (= (and d!37286 res!95808) b!115934))

(assert (= (and b!115934 res!95816) b!115939))

(assert (= (and b!115939 res!95812) b!115935))

(assert (= (and b!115935 res!95809) b!115940))

(declare-fun m!173565 () Bool)

(assert (=> b!115934 m!173565))

(assert (=> b!115934 m!173053))

(declare-fun m!173567 () Bool)

(assert (=> b!115933 m!173567))

(declare-fun m!173569 () Bool)

(assert (=> b!115933 m!173569))

(assert (=> b!115933 m!173053))

(declare-fun m!173571 () Bool)

(assert (=> b!115933 m!173571))

(declare-fun m!173573 () Bool)

(assert (=> b!115933 m!173573))

(declare-fun m!173575 () Bool)

(assert (=> b!115933 m!173575))

(declare-fun m!173577 () Bool)

(assert (=> b!115933 m!173577))

(declare-fun m!173579 () Bool)

(assert (=> b!115933 m!173579))

(declare-fun m!173581 () Bool)

(assert (=> b!115933 m!173581))

(declare-fun m!173583 () Bool)

(assert (=> b!115933 m!173583))

(declare-fun m!173585 () Bool)

(assert (=> b!115933 m!173585))

(declare-fun m!173587 () Bool)

(assert (=> b!115933 m!173587))

(declare-fun m!173589 () Bool)

(assert (=> b!115933 m!173589))

(declare-fun m!173591 () Bool)

(assert (=> b!115933 m!173591))

(declare-fun m!173593 () Bool)

(assert (=> b!115933 m!173593))

(declare-fun m!173595 () Bool)

(assert (=> b!115933 m!173595))

(declare-fun m!173597 () Bool)

(assert (=> b!115933 m!173597))

(declare-fun m!173599 () Bool)

(assert (=> b!115933 m!173599))

(declare-fun m!173601 () Bool)

(assert (=> b!115933 m!173601))

(declare-fun m!173603 () Bool)

(assert (=> b!115933 m!173603))

(declare-fun m!173605 () Bool)

(assert (=> b!115933 m!173605))

(declare-fun m!173607 () Bool)

(assert (=> b!115933 m!173607))

(declare-fun m!173609 () Bool)

(assert (=> b!115933 m!173609))

(declare-fun m!173611 () Bool)

(assert (=> b!115933 m!173611))

(declare-fun m!173613 () Bool)

(assert (=> b!115933 m!173613))

(declare-fun m!173615 () Bool)

(assert (=> b!115933 m!173615))

(declare-fun m!173617 () Bool)

(assert (=> b!115933 m!173617))

(assert (=> b!115933 m!173615))

(declare-fun m!173619 () Bool)

(assert (=> b!115933 m!173619))

(declare-fun m!173621 () Bool)

(assert (=> b!115941 m!173621))

(assert (=> b!115941 m!173053))

(declare-fun m!173623 () Bool)

(assert (=> b!115937 m!173623))

(assert (=> b!115937 m!173623))

(declare-fun m!173625 () Bool)

(assert (=> b!115937 m!173625))

(declare-fun m!173627 () Bool)

(assert (=> b!115939 m!173627))

(declare-fun m!173629 () Bool)

(assert (=> bm!1505 m!173629))

(declare-fun m!173631 () Bool)

(assert (=> b!115931 m!173631))

(assert (=> b!115931 m!173621))

(declare-fun m!173633 () Bool)

(assert (=> b!115942 m!173633))

(declare-fun m!173635 () Bool)

(assert (=> b!115932 m!173635))

(declare-fun m!173637 () Bool)

(assert (=> b!115940 m!173637))

(declare-fun m!173639 () Bool)

(assert (=> b!115935 m!173639))

(declare-fun m!173641 () Bool)

(assert (=> b!115935 m!173641))

(assert (=> b!115935 m!173579))

(declare-fun m!173643 () Bool)

(assert (=> b!115935 m!173643))

(declare-fun m!173645 () Bool)

(assert (=> b!115935 m!173645))

(assert (=> b!115642 d!37286))

(declare-fun b!115943 () Bool)

(declare-fun e!75955 () Unit!7115)

(declare-fun Unit!7140 () Unit!7115)

(assert (=> b!115943 (= e!75955 Unit!7140)))

(declare-fun b!115944 () Bool)

(declare-fun lt!177275 () Unit!7115)

(assert (=> b!115944 (= e!75955 lt!177275)))

(declare-fun lt!177263 () (_ BitVec 64))

(assert (=> b!115944 (= lt!177263 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!177267 () (_ BitVec 64))

(assert (=> b!115944 (= lt!177267 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))))))

(assert (=> b!115944 (= lt!177275 (arrayBitRangesEqSymmetric!0 (buf!2777 (_2!5034 lt!176438)) (buf!2777 (_2!5034 lt!176432)) lt!177263 lt!177267))))

(assert (=> b!115944 (arrayBitRangesEq!0 (buf!2777 (_2!5034 lt!176432)) (buf!2777 (_2!5034 lt!176438)) lt!177263 lt!177267)))

(declare-fun e!75956 () Bool)

(declare-fun b!115945 () Bool)

(declare-fun lt!177268 () (_ BitVec 64))

(declare-fun lt!177280 () tuple2!9542)

(declare-fun lt!177276 () (_ BitVec 64))

(assert (=> b!115945 (= e!75956 (= (_1!5036 lt!177280) (withMovedBitIndex!0 (_2!5036 lt!177280) (bvsub lt!177268 lt!177276))))))

(assert (=> b!115945 (or (= (bvand lt!177268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!177276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!177268 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!177268 lt!177276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!115945 (= lt!177276 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176432))) (currentByte!5405 (_2!5034 lt!176432)) (currentBit!5400 (_2!5034 lt!176432))))))

(assert (=> b!115945 (= lt!177268 (bitIndex!0 (size!2367 (buf!2777 (_2!5034 lt!176438))) (currentByte!5405 (_2!5034 lt!176438)) (currentBit!5400 (_2!5034 lt!176438))))))

(declare-fun b!115946 () Bool)

(declare-fun res!95817 () Bool)

(assert (=> b!115946 (=> (not res!95817) (not e!75956))))

(assert (=> b!115946 (= res!95817 (isPrefixOf!0 (_1!5036 lt!177280) (_2!5034 lt!176438)))))

(declare-fun d!37320 () Bool)

(assert (=> d!37320 e!75956))

(declare-fun res!95818 () Bool)

(assert (=> d!37320 (=> (not res!95818) (not e!75956))))

(assert (=> d!37320 (= res!95818 (isPrefixOf!0 (_1!5036 lt!177280) (_2!5036 lt!177280)))))

