; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19510 () Bool)

(assert start!19510)

(declare-fun b!97312 () Bool)

(declare-fun e!63764 () Bool)

(declare-datatypes ((array!4547 0))(
  ( (array!4548 (arr!2672 (Array (_ BitVec 32) (_ BitVec 8))) (size!2079 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3632 0))(
  ( (BitStream!3633 (buf!2427 array!4547) (currentByte!4842 (_ BitVec 32)) (currentBit!4837 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3632)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!97312 (= e!63764 (not (invariant!0 (currentBit!4837 thiss!1288) (currentByte!4842 thiss!1288) (size!2079 (buf!2427 thiss!1288)))))))

(declare-fun b!97313 () Bool)

(declare-fun res!79854 () Bool)

(assert (=> b!97313 (=> (not res!79854) (not e!63764))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97313 (= res!79854 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97314 () Bool)

(declare-fun res!79856 () Bool)

(assert (=> b!97314 (=> (not res!79856) (not e!63764))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97314 (= res!79856 (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 thiss!1288))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97315 () Bool)

(declare-fun e!63763 () Bool)

(declare-fun array_inv!1881 (array!4547) Bool)

(assert (=> b!97315 (= e!63763 (array_inv!1881 (buf!2427 thiss!1288)))))

(declare-fun b!97316 () Bool)

(declare-fun res!79853 () Bool)

(assert (=> b!97316 (=> (not res!79853) (not e!63764))))

(declare-datatypes ((Unit!5916 0))(
  ( (Unit!5917) )
))
(declare-datatypes ((tuple2!7784 0))(
  ( (tuple2!7785 (_1!4144 Unit!5916) (_2!4144 BitStream!3632)) )
))
(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3632 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7784)

(assert (=> b!97316 (= res!79853 (= (size!2079 (buf!2427 thiss!1288)) (size!2079 (buf!2427 (_2!4144 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))))))

(declare-fun res!79855 () Bool)

(assert (=> start!19510 (=> (not res!79855) (not e!63764))))

(assert (=> start!19510 (= res!79855 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19510 e!63764))

(assert (=> start!19510 true))

(declare-fun inv!12 (BitStream!3632) Bool)

(assert (=> start!19510 (and (inv!12 thiss!1288) e!63763)))

(assert (= (and start!19510 res!79855) b!97314))

(assert (= (and b!97314 res!79856) b!97313))

(assert (= (and b!97313 res!79854) b!97316))

(assert (= (and b!97316 res!79853) b!97312))

(assert (= start!19510 b!97315))

(declare-fun m!141463 () Bool)

(assert (=> b!97316 m!141463))

(declare-fun m!141465 () Bool)

(assert (=> b!97314 m!141465))

(declare-fun m!141467 () Bool)

(assert (=> b!97312 m!141467))

(declare-fun m!141469 () Bool)

(assert (=> b!97315 m!141469))

(declare-fun m!141471 () Bool)

(assert (=> b!97313 m!141471))

(declare-fun m!141473 () Bool)

(assert (=> start!19510 m!141473))

(push 1)

(assert (not start!19510))

(assert (not b!97313))

(assert (not b!97314))

(assert (not b!97315))

(assert (not b!97312))

(assert (not b!97316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!30632 () Bool)

(assert (=> d!30632 (= (array_inv!1881 (buf!2427 thiss!1288)) (bvsge (size!2079 (buf!2427 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!97315 d!30632))

(declare-fun d!30636 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30636 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 thiss!1288))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2079 (buf!2427 thiss!1288))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7488 () Bool)

(assert (= bs!7488 d!30636))

(declare-fun m!141477 () Bool)

(assert (=> bs!7488 m!141477))

(assert (=> b!97314 d!30636))

(declare-datatypes ((tuple2!7788 0))(
  ( (tuple2!7789 (_1!4146 BitStream!3632) (_2!4146 (_ BitVec 64))) )
))
(declare-fun lt!141084 () tuple2!7788)

(declare-datatypes ((tuple2!7792 0))(
  ( (tuple2!7793 (_1!4148 BitStream!3632) (_2!4148 BitStream!3632)) )
))
(declare-fun lt!141091 () tuple2!7792)

(declare-fun b!97382 () Bool)

(declare-fun e!63805 () Bool)

(assert (=> b!97382 (= e!63805 (and (= (_2!4146 lt!141084) v!196) (= (_1!4146 lt!141084) (_2!4148 lt!141091))))))

(declare-fun lt!141103 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7788)

(assert (=> b!97382 (= lt!141084 (readNLeastSignificantBitsLoopPure!0 (_1!4148 lt!141091) nBits!388 #b00000000000000000000000000000000 lt!141103))))

(declare-fun lt!141087 () Unit!5916)

(declare-fun lt!141121 () Unit!5916)

(assert (=> b!97382 (= lt!141087 lt!141121)))

(declare-fun lt!141094 () tuple2!7784)

(declare-fun lt!141081 () (_ BitVec 64))

(assert (=> b!97382 (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 (_2!4144 lt!141094)))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288)) lt!141081)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3632 array!4547 (_ BitVec 64)) Unit!5916)

(assert (=> b!97382 (= lt!141121 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2427 (_2!4144 lt!141094)) lt!141081))))

(declare-fun e!63807 () Bool)

(assert (=> b!97382 e!63807))

(declare-fun res!79902 () Bool)

(assert (=> b!97382 (=> (not res!79902) (not e!63807))))

(assert (=> b!97382 (= res!79902 (and (= (size!2079 (buf!2427 thiss!1288)) (size!2079 (buf!2427 (_2!4144 lt!141094)))) (bvsge lt!141081 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97382 (= lt!141081 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97382 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97382 (= lt!141103 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!97382 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!3632 BitStream!3632) tuple2!7792)

(assert (=> b!97382 (= lt!141091 (reader!0 thiss!1288 (_2!4144 lt!141094)))))

(declare-fun b!97383 () Bool)

(declare-datatypes ((tuple2!7796 0))(
  ( (tuple2!7797 (_1!4150 BitStream!3632) (_2!4150 Bool)) )
))
(declare-fun lt!141119 () tuple2!7796)

(declare-fun lt!141082 () tuple2!7784)

(declare-fun readBitPure!0 (BitStream!3632) tuple2!7796)

(declare-fun readerFrom!0 (BitStream!3632 (_ BitVec 32) (_ BitVec 32)) BitStream!3632)

(assert (=> b!97383 (= lt!141119 (readBitPure!0 (readerFrom!0 (_2!4144 lt!141082) (currentBit!4837 thiss!1288) (currentByte!4842 thiss!1288))))))

(declare-fun lt!141080 () Bool)

(declare-fun res!79910 () Bool)

(assert (=> b!97383 (= res!79910 (and (= (_2!4150 lt!141119) lt!141080) (= (_1!4150 lt!141119) (_2!4144 lt!141082))))))

(declare-fun e!63801 () Bool)

(assert (=> b!97383 (=> (not res!79910) (not e!63801))))

(declare-fun e!63802 () Bool)

(assert (=> b!97383 (= e!63802 e!63801)))

(declare-fun call!1201 () Bool)

(declare-fun lt!141093 () BitStream!3632)

(declare-fun c!6163 () Bool)

(declare-fun bm!1198 () Bool)

(declare-fun lt!141097 () tuple2!7784)

(declare-fun isPrefixOf!0 (BitStream!3632 BitStream!3632) Bool)

(assert (=> bm!1198 (= call!1201 (isPrefixOf!0 (ite c!6163 thiss!1288 lt!141093) (ite c!6163 (_2!4144 lt!141097) lt!141093)))))

(declare-fun b!97384 () Bool)

(assert (=> b!97384 (= e!63807 (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 thiss!1288))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288)) lt!141081))))

(declare-fun b!97385 () Bool)

(declare-fun e!63806 () Bool)

(declare-fun lt!141086 () tuple2!7796)

(declare-fun lt!141083 () tuple2!7796)

(assert (=> b!97385 (= e!63806 (= (_2!4150 lt!141086) (_2!4150 lt!141083)))))

(declare-fun b!97386 () Bool)

(declare-fun e!63803 () (_ BitVec 64))

(assert (=> b!97386 (= e!63803 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun d!30640 () Bool)

(assert (=> d!30640 e!63805))

(declare-fun res!79909 () Bool)

(assert (=> d!30640 (=> (not res!79909) (not e!63805))))

(assert (=> d!30640 (= res!79909 (= (size!2079 (buf!2427 thiss!1288)) (size!2079 (buf!2427 (_2!4144 lt!141094)))))))

(declare-fun e!63804 () tuple2!7784)

(assert (=> d!30640 (= lt!141094 e!63804)))

(assert (=> d!30640 (= c!6163 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30640 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30640 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!141094)))

(declare-fun b!97387 () Bool)

(declare-fun res!79904 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97387 (= res!79904 (= (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141082))) (currentByte!4842 (_2!4144 lt!141082)) (currentBit!4837 (_2!4144 lt!141082))) (bvadd (bitIndex!0 (size!2079 (buf!2427 thiss!1288)) (currentByte!4842 thiss!1288) (currentBit!4837 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!97387 (=> (not res!79904) (not e!63802))))

(declare-fun b!97388 () Bool)

(assert (=> b!97388 (= e!63801 (= (bitIndex!0 (size!2079 (buf!2427 (_1!4150 lt!141119))) (currentByte!4842 (_1!4150 lt!141119)) (currentBit!4837 (_1!4150 lt!141119))) (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141082))) (currentByte!4842 (_2!4144 lt!141082)) (currentBit!4837 (_2!4144 lt!141082)))))))

(declare-fun b!97389 () Bool)

(declare-fun lt!141096 () Unit!5916)

(assert (=> b!97389 (= e!63804 (tuple2!7785 lt!141096 thiss!1288))))

(assert (=> b!97389 (= lt!141093 thiss!1288)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3632) Unit!5916)

(assert (=> b!97389 (= lt!141096 (lemmaIsPrefixRefl!0 lt!141093))))

(assert (=> b!97389 call!1201))

(declare-fun b!97390 () Bool)

(declare-fun res!79903 () Bool)

(assert (=> b!97390 (=> (not res!79903) (not e!63805))))

(assert (=> b!97390 (= res!79903 (isPrefixOf!0 thiss!1288 (_2!4144 lt!141094)))))

(declare-fun b!97391 () Bool)

(assert (=> b!97391 (= e!63803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!97392 () Bool)

(declare-fun res!79908 () Bool)

(assert (=> b!97392 (=> (not res!79908) (not e!63805))))

(declare-fun lt!141102 () (_ BitVec 64))

(declare-fun lt!141108 () (_ BitVec 64))

(assert (=> b!97392 (= res!79908 (= (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141094))) (currentByte!4842 (_2!4144 lt!141094)) (currentBit!4837 (_2!4144 lt!141094))) (bvadd lt!141102 lt!141108)))))

(assert (=> b!97392 (or (not (= (bvand lt!141102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!141108 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!141102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!141102 lt!141108) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!97392 (= lt!141108 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!97392 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!97392 (= lt!141102 (bitIndex!0 (size!2079 (buf!2427 thiss!1288)) (currentByte!4842 thiss!1288) (currentBit!4837 thiss!1288)))))

(declare-fun b!97393 () Bool)

(declare-fun Unit!5922 () Unit!5916)

(assert (=> b!97393 (= e!63804 (tuple2!7785 Unit!5922 (_2!4144 lt!141097)))))

(assert (=> b!97393 (= lt!141080 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3632 Bool) tuple2!7784)

(assert (=> b!97393 (= lt!141082 (appendBit!0 thiss!1288 lt!141080))))

(declare-fun res!79907 () Bool)

(assert (=> b!97393 (= res!79907 (= (size!2079 (buf!2427 thiss!1288)) (size!2079 (buf!2427 (_2!4144 lt!141082)))))))

(assert (=> b!97393 (=> (not res!79907) (not e!63802))))

(assert (=> b!97393 e!63802))

(declare-fun lt!141077 () tuple2!7784)

(assert (=> b!97393 (= lt!141077 lt!141082)))

(assert (=> b!97393 (= lt!141097 (appendNLeastSignificantBitsLoop!0 (_2!4144 lt!141077) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!141110 () Unit!5916)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3632 BitStream!3632 BitStream!3632) Unit!5916)

(assert (=> b!97393 (= lt!141110 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4144 lt!141077) (_2!4144 lt!141097)))))

(assert (=> b!97393 call!1201))

(declare-fun lt!141114 () Unit!5916)

(assert (=> b!97393 (= lt!141114 lt!141110)))

(assert (=> b!97393 (invariant!0 (currentBit!4837 thiss!1288) (currentByte!4842 thiss!1288) (size!2079 (buf!2427 (_2!4144 lt!141077))))))

(declare-fun lt!141113 () BitStream!3632)

(assert (=> b!97393 (= lt!141113 (BitStream!3633 (buf!2427 (_2!4144 lt!141077)) (currentByte!4842 thiss!1288) (currentBit!4837 thiss!1288)))))

(assert (=> b!97393 (invariant!0 (currentBit!4837 lt!141113) (currentByte!4842 lt!141113) (size!2079 (buf!2427 (_2!4144 lt!141097))))))

(declare-fun lt!141111 () BitStream!3632)

(assert (=> b!97393 (= lt!141111 (BitStream!3633 (buf!2427 (_2!4144 lt!141097)) (currentByte!4842 lt!141113) (currentBit!4837 lt!141113)))))

(assert (=> b!97393 (= lt!141086 (readBitPure!0 lt!141113))))

(assert (=> b!97393 (= lt!141083 (readBitPure!0 lt!141111))))

(declare-fun lt!141116 () Unit!5916)

(declare-fun readBitPrefixLemma!0 (BitStream!3632 BitStream!3632) Unit!5916)

(assert (=> b!97393 (= lt!141116 (readBitPrefixLemma!0 lt!141113 (_2!4144 lt!141097)))))

(declare-fun res!79906 () Bool)

(assert (=> b!97393 (= res!79906 (= (bitIndex!0 (size!2079 (buf!2427 (_1!4150 lt!141086))) (currentByte!4842 (_1!4150 lt!141086)) (currentBit!4837 (_1!4150 lt!141086))) (bitIndex!0 (size!2079 (buf!2427 (_1!4150 lt!141083))) (currentByte!4842 (_1!4150 lt!141083)) (currentBit!4837 (_1!4150 lt!141083)))))))

(assert (=> b!97393 (=> (not res!79906) (not e!63806))))

(assert (=> b!97393 e!63806))

(declare-fun lt!141107 () Unit!5916)

(assert (=> b!97393 (= lt!141107 lt!141116)))

(declare-fun lt!141104 () tuple2!7792)

(assert (=> b!97393 (= lt!141104 (reader!0 thiss!1288 (_2!4144 lt!141097)))))

(declare-fun lt!141117 () tuple2!7792)

(assert (=> b!97393 (= lt!141117 (reader!0 (_2!4144 lt!141077) (_2!4144 lt!141097)))))

(declare-fun lt!141120 () tuple2!7796)

(assert (=> b!97393 (= lt!141120 (readBitPure!0 (_1!4148 lt!141104)))))

(assert (=> b!97393 (= (_2!4150 lt!141120) lt!141080)))

(declare-fun lt!141095 () Unit!5916)

(declare-fun Unit!5925 () Unit!5916)

(assert (=> b!97393 (= lt!141095 Unit!5925)))

(declare-fun lt!141092 () (_ BitVec 64))

(assert (=> b!97393 (= lt!141092 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!141079 () (_ BitVec 64))

(assert (=> b!97393 (= lt!141079 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!141112 () Unit!5916)

(assert (=> b!97393 (= lt!141112 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2427 (_2!4144 lt!141097)) lt!141079))))

(assert (=> b!97393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 (_2!4144 lt!141097)))) ((_ sign_extend 32) (currentByte!4842 thiss!1288)) ((_ sign_extend 32) (currentBit!4837 thiss!1288)) lt!141079)))

(declare-fun lt!141105 () Unit!5916)

(assert (=> b!97393 (= lt!141105 lt!141112)))

(declare-fun lt!141109 () tuple2!7788)

(assert (=> b!97393 (= lt!141109 (readNLeastSignificantBitsLoopPure!0 (_1!4148 lt!141104) nBits!388 #b00000000000000000000000000000000 lt!141092))))

(declare-fun lt!141100 () (_ BitVec 64))

(assert (=> b!97393 (= lt!141100 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!141090 () Unit!5916)

(assert (=> b!97393 (= lt!141090 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4144 lt!141077) (buf!2427 (_2!4144 lt!141097)) lt!141100))))

(assert (=> b!97393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2079 (buf!2427 (_2!4144 lt!141097)))) ((_ sign_extend 32) (currentByte!4842 (_2!4144 lt!141077))) ((_ sign_extend 32) (currentBit!4837 (_2!4144 lt!141077))) lt!141100)))

(declare-fun lt!141085 () Unit!5916)

(assert (=> b!97393 (= lt!141085 lt!141090)))

(declare-fun lt!141115 () tuple2!7788)

(assert (=> b!97393 (= lt!141115 (readNLeastSignificantBitsLoopPure!0 (_1!4148 lt!141117) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141092 (ite (_2!4150 lt!141120) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!141098 () tuple2!7788)

(assert (=> b!97393 (= lt!141098 (readNLeastSignificantBitsLoopPure!0 (_1!4148 lt!141104) nBits!388 #b00000000000000000000000000000000 lt!141092))))

(declare-fun c!6164 () Bool)

(assert (=> b!97393 (= c!6164 (_2!4150 (readBitPure!0 (_1!4148 lt!141104))))))

(declare-fun lt!141088 () tuple2!7788)

(declare-fun withMovedBitIndex!0 (BitStream!3632 (_ BitVec 64)) BitStream!3632)

(assert (=> b!97393 (= lt!141088 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4148 lt!141104) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!141092 e!63803)))))

(declare-fun lt!141099 () Unit!5916)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!5916)

(assert (=> b!97393 (= lt!141099 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4148 lt!141104) nBits!388 #b00000000000000000000000000000000 lt!141092))))

(assert (=> b!97393 (and (= (_2!4146 lt!141098) (_2!4146 lt!141088)) (= (_1!4146 lt!141098) (_1!4146 lt!141088)))))

(declare-fun lt!141078 () Unit!5916)

(assert (=> b!97393 (= lt!141078 lt!141099)))

(assert (=> b!97393 (= (_1!4148 lt!141104) (withMovedBitIndex!0 (_2!4148 lt!141104) (bvsub (bitIndex!0 (size!2079 (buf!2427 thiss!1288)) (currentByte!4842 thiss!1288) (currentBit!4837 thiss!1288)) (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141097))) (currentByte!4842 (_2!4144 lt!141097)) (currentBit!4837 (_2!4144 lt!141097))))))))

(declare-fun lt!141118 () Unit!5916)

(declare-fun Unit!5926 () Unit!5916)

(assert (=> b!97393 (= lt!141118 Unit!5926)))

(assert (=> b!97393 (= (_1!4148 lt!141117) (withMovedBitIndex!0 (_2!4148 lt!141117) (bvsub (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141077))) (currentByte!4842 (_2!4144 lt!141077)) (currentBit!4837 (_2!4144 lt!141077))) (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141097))) (currentByte!4842 (_2!4144 lt!141097)) (currentBit!4837 (_2!4144 lt!141097))))))))

(declare-fun lt!141101 () Unit!5916)

(declare-fun Unit!5927 () Unit!5916)

(assert (=> b!97393 (= lt!141101 Unit!5927)))

(assert (=> b!97393 (= (bitIndex!0 (size!2079 (buf!2427 thiss!1288)) (currentByte!4842 thiss!1288) (currentBit!4837 thiss!1288)) (bvsub (bitIndex!0 (size!2079 (buf!2427 (_2!4144 lt!141077))) (currentByte!4842 (_2!4144 lt!141077)) (currentBit!4837 (_2!4144 lt!141077))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!141089 () Unit!5916)

(declare-fun Unit!5928 () Unit!5916)

(assert (=> b!97393 (= lt!141089 Unit!5928)))

(assert (=> b!97393 (= (_2!4146 lt!141109) (_2!4146 lt!141115))))

(declare-fun lt!141106 () Unit!5916)

(declare-fun Unit!5929 () Unit!5916)

(assert (=> b!97393 (= lt!141106 Unit!5929)))

(assert (=> b!97393 (= (_1!4146 lt!141109) (_2!4148 lt!141104))))

(declare-fun b!97394 () Bool)

(declare-fun res!79905 () Bool)

(assert (=> b!97394 (= res!79905 (isPrefixOf!0 thiss!1288 (_2!4144 lt!141082)))))

(assert (=> b!97394 (=> (not res!79905) (not e!63802))))

(assert (= (and d!30640 c!6163) b!97393))

(assert (= (and d!30640 (not c!6163)) b!97389))

(assert (= (and b!97393 res!79907) b!97387))

(assert (= (and b!97387 res!79904) b!97394))

(assert (= (and b!97394 res!79905) b!97383))

(assert (= (and b!97383 res!79910) b!97388))

(assert (= (and b!97393 res!79906) b!97385))

(assert (= (and b!97393 c!6164) b!97386))

(assert (= (and b!97393 (not c!6164)) b!97391))

(assert (= (or b!97393 b!97389) bm!1198))

(assert (= (and d!30640 res!79909) b!97392))

(assert (= (and b!97392 res!79908) b!97390))

(assert (= (and b!97390 res!79903) b!97382))

(assert (= (and b!97382 res!79902) b!97384))

(declare-fun m!141533 () Bool)

(assert (=> b!97383 m!141533))

(assert (=> b!97383 m!141533))

(declare-fun m!141537 () Bool)

(assert (=> b!97383 m!141537))

(declare-fun m!141539 () Bool)

(assert (=> b!97389 m!141539))

(declare-fun m!141543 () Bool)

(assert (=> b!97394 m!141543))

(declare-fun m!141547 () Bool)

(assert (=> b!97382 m!141547))

(declare-fun m!141549 () Bool)

(assert (=> b!97382 m!141549))

(declare-fun m!141553 () Bool)

(assert (=> b!97382 m!141553))

(declare-fun m!141555 () Bool)

(assert (=> b!97382 m!141555))

(declare-fun m!141559 () Bool)

(assert (=> b!97382 m!141559))

(declare-fun m!141565 () Bool)

(assert (=> b!97388 m!141565))

(declare-fun m!141569 () Bool)

(assert (=> b!97388 m!141569))

(declare-fun m!141575 () Bool)

(assert (=> b!97392 m!141575))

(declare-fun m!141577 () Bool)

(assert (=> b!97392 m!141577))

(declare-fun m!141581 () Bool)

(assert (=> b!97390 m!141581))

(declare-fun m!141587 () Bool)

(assert (=> b!97393 m!141587))

(declare-fun m!141591 () Bool)

(assert (=> b!97393 m!141591))

(declare-fun m!141593 () Bool)

(assert (=> b!97393 m!141593))

(declare-fun m!141595 () Bool)

(assert (=> b!97393 m!141595))

(declare-fun m!141599 () Bool)

(assert (=> b!97393 m!141599))

(declare-fun m!141601 () Bool)

(assert (=> b!97393 m!141601))

(assert (=> b!97393 m!141591))

(declare-fun m!141603 () Bool)

(assert (=> b!97393 m!141603))

(declare-fun m!141605 () Bool)

(assert (=> b!97393 m!141605))

(declare-fun m!141607 () Bool)

(assert (=> b!97393 m!141607))

(declare-fun m!141609 () Bool)

(assert (=> b!97393 m!141609))

(declare-fun m!141611 () Bool)

(assert (=> b!97393 m!141611))

(declare-fun m!141613 () Bool)

(assert (=> b!97393 m!141613))

(declare-fun m!141615 () Bool)

(assert (=> b!97393 m!141615))

(declare-fun m!141617 () Bool)

(assert (=> b!97393 m!141617))

(declare-fun m!141619 () Bool)

(assert (=> b!97393 m!141619))

(assert (=> b!97393 m!141577))

(declare-fun m!141621 () Bool)

(assert (=> b!97393 m!141621))

(declare-fun m!141623 () Bool)

(assert (=> b!97393 m!141623))

(declare-fun m!141625 () Bool)

(assert (=> b!97393 m!141625))

(declare-fun m!141627 () Bool)

(assert (=> b!97393 m!141627))

(declare-fun m!141629 () Bool)

(assert (=> b!97393 m!141629))

(declare-fun m!141631 () Bool)

(assert (=> b!97393 m!141631))

(declare-fun m!141633 () Bool)

(assert (=> b!97393 m!141633))

(declare-fun m!141635 () Bool)

(assert (=> b!97393 m!141635))

(declare-fun m!141637 () Bool)

(assert (=> b!97393 m!141637))

(assert (=> b!97393 m!141553))

(declare-fun m!141639 () Bool)

(assert (=> b!97393 m!141639))

(declare-fun m!141641 () Bool)

(assert (=> b!97393 m!141641))

(declare-fun m!141643 () Bool)

(assert (=> b!97384 m!141643))

(declare-fun m!141645 () Bool)

(assert (=> bm!1198 m!141645))

(assert (=> b!97387 m!141569))

(assert (=> b!97387 m!141577))

(assert (=> b!97316 d!30640))

(declare-fun d!30648 () Bool)

(assert (=> d!30648 (= (invariant!0 (currentBit!4837 thiss!1288) (currentByte!4842 thiss!1288) (size!2079 (buf!2427 thiss!1288))) (and (bvsge (currentBit!4837 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4837 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4842 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4842 thiss!1288) (size!2079 (buf!2427 thiss!1288))) (and (= (currentBit!4837 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4842 thiss!1288) (size!2079 (buf!2427 thiss!1288)))))))))

(assert (=> b!97312 d!30648))

(declare-fun d!30650 () Bool)

