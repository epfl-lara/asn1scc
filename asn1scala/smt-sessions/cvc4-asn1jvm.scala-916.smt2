; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25682 () Bool)

(assert start!25682)

(declare-fun b!131089 () Bool)

(declare-fun res!108722 () Bool)

(declare-fun e!86901 () Bool)

(assert (=> b!131089 (=> (not res!108722) (not e!86901))))

(declare-datatypes ((array!6062 0))(
  ( (array!6063 (arr!3368 (Array (_ BitVec 32) (_ BitVec 8))) (size!2745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4754 0))(
  ( (BitStream!4755 (buf!3106 array!6062) (currentByte!5879 (_ BitVec 32)) (currentBit!5874 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8104 0))(
  ( (Unit!8105) )
))
(declare-datatypes ((tuple2!11324 0))(
  ( (tuple2!11325 (_1!5962 Unit!8104) (_2!5962 BitStream!4754)) )
))
(declare-fun lt!202164 () tuple2!11324)

(declare-fun thiss!1634 () BitStream!4754)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131089 (= res!108722 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))))

(declare-fun b!131090 () Bool)

(declare-fun res!108727 () Bool)

(declare-fun e!86895 () Bool)

(assert (=> b!131090 (=> (not res!108727) (not e!86895))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!131090 (= res!108727 (bvslt from!447 to!404))))

(declare-fun b!131091 () Bool)

(declare-fun res!108721 () Bool)

(assert (=> b!131091 (=> (not res!108721) (not e!86895))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131091 (= res!108721 (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634))))))

(declare-fun b!131092 () Bool)

(declare-fun e!86899 () Bool)

(declare-fun arr!237 () array!6062)

(declare-datatypes ((tuple2!11326 0))(
  ( (tuple2!11327 (_1!5963 BitStream!4754) (_2!5963 array!6062)) )
))
(declare-fun lt!202166 () tuple2!11326)

(declare-fun arrayRangesEq!148 (array!6062 array!6062 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131092 (= e!86899 (not (arrayRangesEq!148 arr!237 (_2!5963 lt!202166) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131093 () Bool)

(declare-fun e!86898 () Bool)

(declare-fun array_inv!2534 (array!6062) Bool)

(assert (=> b!131093 (= e!86898 (array_inv!2534 (buf!3106 thiss!1634)))))

(declare-datatypes ((tuple2!11328 0))(
  ( (tuple2!11329 (_1!5964 BitStream!4754) (_2!5964 (_ BitVec 8))) )
))
(declare-fun lt!202150 () tuple2!11328)

(declare-fun b!131094 () Bool)

(declare-datatypes ((tuple2!11330 0))(
  ( (tuple2!11331 (_1!5965 BitStream!4754) (_2!5965 BitStream!4754)) )
))
(declare-fun lt!202159 () tuple2!11330)

(assert (=> b!131094 (= e!86901 (and (= (_2!5964 lt!202150) (select (arr!3368 arr!237) from!447)) (= (_1!5964 lt!202150) (_2!5965 lt!202159))))))

(declare-fun readBytePure!0 (BitStream!4754) tuple2!11328)

(assert (=> b!131094 (= lt!202150 (readBytePure!0 (_1!5965 lt!202159)))))

(declare-fun reader!0 (BitStream!4754 BitStream!4754) tuple2!11330)

(assert (=> b!131094 (= lt!202159 (reader!0 thiss!1634 (_2!5962 lt!202164)))))

(declare-fun b!131095 () Bool)

(declare-fun res!108726 () Bool)

(assert (=> b!131095 (=> (not res!108726) (not e!86901))))

(declare-fun isPrefixOf!0 (BitStream!4754 BitStream!4754) Bool)

(assert (=> b!131095 (= res!108726 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202164)))))

(declare-fun b!131096 () Bool)

(declare-fun e!86900 () Bool)

(declare-fun lt!202160 () tuple2!11328)

(declare-fun lt!202158 () tuple2!11328)

(assert (=> b!131096 (= e!86900 (= (_2!5964 lt!202160) (_2!5964 lt!202158)))))

(declare-fun b!131097 () Bool)

(declare-fun res!108732 () Bool)

(assert (=> b!131097 (=> (not res!108732) (not e!86895))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131097 (= res!108732 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131098 () Bool)

(declare-fun e!86903 () Bool)

(assert (=> b!131098 (= e!86903 (not e!86899))))

(declare-fun res!108729 () Bool)

(assert (=> b!131098 (=> res!108729 e!86899)))

(declare-fun lt!202153 () tuple2!11330)

(assert (=> b!131098 (= res!108729 (or (not (= (size!2745 (_2!5963 lt!202166)) (size!2745 arr!237))) (not (= (_1!5963 lt!202166) (_2!5965 lt!202153)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4754 array!6062 (_ BitVec 32) (_ BitVec 32)) tuple2!11326)

(assert (=> b!131098 (= lt!202166 (readByteArrayLoopPure!0 (_1!5965 lt!202153) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202155 () tuple2!11324)

(declare-fun lt!202162 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131098 (validate_offset_bits!1 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) lt!202162)))

(declare-fun lt!202157 () Unit!8104)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4754 array!6062 (_ BitVec 64)) Unit!8104)

(assert (=> b!131098 (= lt!202157 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5962 lt!202164) (buf!3106 (_2!5962 lt!202155)) lt!202162))))

(assert (=> b!131098 (= lt!202153 (reader!0 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(declare-fun b!131100 () Bool)

(declare-fun res!108728 () Bool)

(assert (=> b!131100 (=> (not res!108728) (not e!86903))))

(assert (=> b!131100 (= res!108728 (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(declare-fun lt!202165 () tuple2!11330)

(declare-fun b!131101 () Bool)

(assert (=> b!131101 (= e!86895 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5965 lt!202165)))) ((_ sign_extend 32) (currentByte!5879 (_1!5965 lt!202165))) ((_ sign_extend 32) (currentBit!5874 (_1!5965 lt!202165))) (bvsub to!404 from!447))))))

(assert (=> b!131101 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202163 () Unit!8104)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4754 array!6062 (_ BitVec 32)) Unit!8104)

(assert (=> b!131101 (= lt!202163 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3106 (_2!5962 lt!202155)) (bvsub to!404 from!447)))))

(assert (=> b!131101 (= (_2!5964 (readBytePure!0 (_1!5965 lt!202165))) (select (arr!3368 arr!237) from!447))))

(declare-fun lt!202152 () tuple2!11330)

(assert (=> b!131101 (= lt!202152 (reader!0 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(assert (=> b!131101 (= lt!202165 (reader!0 thiss!1634 (_2!5962 lt!202155)))))

(assert (=> b!131101 e!86900))

(declare-fun res!108724 () Bool)

(assert (=> b!131101 (=> (not res!108724) (not e!86900))))

(assert (=> b!131101 (= res!108724 (= (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202160))) (currentByte!5879 (_1!5964 lt!202160)) (currentBit!5874 (_1!5964 lt!202160))) (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202158))) (currentByte!5879 (_1!5964 lt!202158)) (currentBit!5874 (_1!5964 lt!202158)))))))

(declare-fun lt!202161 () Unit!8104)

(declare-fun lt!202151 () BitStream!4754)

(declare-fun readBytePrefixLemma!0 (BitStream!4754 BitStream!4754) Unit!8104)

(assert (=> b!131101 (= lt!202161 (readBytePrefixLemma!0 lt!202151 (_2!5962 lt!202155)))))

(assert (=> b!131101 (= lt!202158 (readBytePure!0 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))))))

(assert (=> b!131101 (= lt!202160 (readBytePure!0 lt!202151))))

(assert (=> b!131101 (= lt!202151 (BitStream!4755 (buf!3106 (_2!5962 lt!202164)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(declare-fun e!86897 () Bool)

(assert (=> b!131101 e!86897))

(declare-fun res!108730 () Bool)

(assert (=> b!131101 (=> (not res!108730) (not e!86897))))

(assert (=> b!131101 (= res!108730 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202155)))))

(declare-fun lt!202156 () Unit!8104)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4754 BitStream!4754 BitStream!4754) Unit!8104)

(assert (=> b!131101 (= lt!202156 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(declare-fun e!86894 () Bool)

(assert (=> b!131101 e!86894))

(declare-fun res!108731 () Bool)

(assert (=> b!131101 (=> (not res!108731) (not e!86894))))

(assert (=> b!131101 (= res!108731 (= (size!2745 (buf!3106 (_2!5962 lt!202164))) (size!2745 (buf!3106 (_2!5962 lt!202155)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4754 array!6062 (_ BitVec 32) (_ BitVec 32)) tuple2!11324)

(assert (=> b!131101 (= lt!202155 (appendByteArrayLoop!0 (_2!5962 lt!202164) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131101 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!202154 () Unit!8104)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4754 BitStream!4754 (_ BitVec 64) (_ BitVec 32)) Unit!8104)

(assert (=> b!131101 (= lt!202154 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5962 lt!202164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131101 e!86901))

(declare-fun res!108725 () Bool)

(assert (=> b!131101 (=> (not res!108725) (not e!86901))))

(assert (=> b!131101 (= res!108725 (= (size!2745 (buf!3106 thiss!1634)) (size!2745 (buf!3106 (_2!5962 lt!202164)))))))

(declare-fun appendByte!0 (BitStream!4754 (_ BitVec 8)) tuple2!11324)

(assert (=> b!131101 (= lt!202164 (appendByte!0 thiss!1634 (select (arr!3368 arr!237) from!447)))))

(declare-fun b!131102 () Bool)

(assert (=> b!131102 (= e!86897 (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 (_2!5962 lt!202164)))))))

(declare-fun res!108733 () Bool)

(assert (=> start!25682 (=> (not res!108733) (not e!86895))))

(assert (=> start!25682 (= res!108733 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2745 arr!237))))))

(assert (=> start!25682 e!86895))

(assert (=> start!25682 true))

(assert (=> start!25682 (array_inv!2534 arr!237)))

(declare-fun inv!12 (BitStream!4754) Bool)

(assert (=> start!25682 (and (inv!12 thiss!1634) e!86898)))

(declare-fun b!131099 () Bool)

(assert (=> b!131099 (= e!86894 e!86903)))

(declare-fun res!108723 () Bool)

(assert (=> b!131099 (=> (not res!108723) (not e!86903))))

(assert (=> b!131099 (= res!108723 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155))) (bvadd (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!202162))))))

(assert (=> b!131099 (= lt!202162 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (= (and start!25682 res!108733) b!131097))

(assert (= (and b!131097 res!108732) b!131090))

(assert (= (and b!131090 res!108727) b!131091))

(assert (= (and b!131091 res!108721) b!131101))

(assert (= (and b!131101 res!108725) b!131089))

(assert (= (and b!131089 res!108722) b!131095))

(assert (= (and b!131095 res!108726) b!131094))

(assert (= (and b!131101 res!108731) b!131099))

(assert (= (and b!131099 res!108723) b!131100))

(assert (= (and b!131100 res!108728) b!131098))

(assert (= (and b!131098 (not res!108729)) b!131092))

(assert (= (and b!131101 res!108730) b!131102))

(assert (= (and b!131101 res!108724) b!131096))

(assert (= start!25682 b!131093))

(declare-fun m!197757 () Bool)

(assert (=> b!131098 m!197757))

(declare-fun m!197759 () Bool)

(assert (=> b!131098 m!197759))

(declare-fun m!197761 () Bool)

(assert (=> b!131098 m!197761))

(declare-fun m!197763 () Bool)

(assert (=> b!131098 m!197763))

(declare-fun m!197765 () Bool)

(assert (=> b!131095 m!197765))

(declare-fun m!197767 () Bool)

(assert (=> b!131092 m!197767))

(declare-fun m!197769 () Bool)

(assert (=> b!131101 m!197769))

(declare-fun m!197771 () Bool)

(assert (=> b!131101 m!197771))

(declare-fun m!197773 () Bool)

(assert (=> b!131101 m!197773))

(declare-fun m!197775 () Bool)

(assert (=> b!131101 m!197775))

(declare-fun m!197777 () Bool)

(assert (=> b!131101 m!197777))

(declare-fun m!197779 () Bool)

(assert (=> b!131101 m!197779))

(declare-fun m!197781 () Bool)

(assert (=> b!131101 m!197781))

(declare-fun m!197783 () Bool)

(assert (=> b!131101 m!197783))

(declare-fun m!197785 () Bool)

(assert (=> b!131101 m!197785))

(declare-fun m!197787 () Bool)

(assert (=> b!131101 m!197787))

(declare-fun m!197789 () Bool)

(assert (=> b!131101 m!197789))

(declare-fun m!197791 () Bool)

(assert (=> b!131101 m!197791))

(assert (=> b!131101 m!197763))

(declare-fun m!197793 () Bool)

(assert (=> b!131101 m!197793))

(declare-fun m!197795 () Bool)

(assert (=> b!131101 m!197795))

(declare-fun m!197797 () Bool)

(assert (=> b!131101 m!197797))

(assert (=> b!131101 m!197789))

(declare-fun m!197799 () Bool)

(assert (=> b!131101 m!197799))

(declare-fun m!197801 () Bool)

(assert (=> b!131101 m!197801))

(declare-fun m!197803 () Bool)

(assert (=> start!25682 m!197803))

(declare-fun m!197805 () Bool)

(assert (=> start!25682 m!197805))

(declare-fun m!197807 () Bool)

(assert (=> b!131099 m!197807))

(declare-fun m!197809 () Bool)

(assert (=> b!131099 m!197809))

(declare-fun m!197811 () Bool)

(assert (=> b!131093 m!197811))

(declare-fun m!197813 () Bool)

(assert (=> b!131091 m!197813))

(declare-fun m!197815 () Bool)

(assert (=> b!131100 m!197815))

(declare-fun m!197817 () Bool)

(assert (=> b!131097 m!197817))

(assert (=> b!131089 m!197809))

(declare-fun m!197819 () Bool)

(assert (=> b!131089 m!197819))

(assert (=> b!131094 m!197789))

(declare-fun m!197821 () Bool)

(assert (=> b!131094 m!197821))

(declare-fun m!197823 () Bool)

(assert (=> b!131094 m!197823))

(declare-fun m!197825 () Bool)

(assert (=> b!131102 m!197825))

(push 1)

(assert (not b!131094))

(assert (not b!131091))

(assert (not b!131099))

(assert (not b!131089))

(assert (not b!131093))

(assert (not b!131092))

(assert (not b!131102))

(assert (not b!131100))

(assert (not start!25682))

(assert (not b!131101))

(assert (not b!131095))

(assert (not b!131098))

(assert (not b!131097))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!41717 () Bool)

(declare-datatypes ((tuple3!490 0))(
  ( (tuple3!491 (_1!5966 Unit!8104) (_2!5966 BitStream!4754) (_3!300 array!6062)) )
))
(declare-fun lt!202169 () tuple3!490)

(declare-fun readByteArrayLoop!0 (BitStream!4754 array!6062 (_ BitVec 32) (_ BitVec 32)) tuple3!490)

(assert (=> d!41717 (= lt!202169 (readByteArrayLoop!0 (_1!5965 lt!202153) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41717 (= (readByteArrayLoopPure!0 (_1!5965 lt!202153) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!11327 (_2!5966 lt!202169) (_3!300 lt!202169)))))

(declare-fun bs!10188 () Bool)

(assert (= bs!10188 d!41717))

(declare-fun m!197827 () Bool)

(assert (=> bs!10188 m!197827))

(assert (=> b!131098 d!41717))

(declare-fun d!41721 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!41721 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) lt!202162) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164)))) lt!202162))))

(declare-fun bs!10189 () Bool)

(assert (= bs!10189 d!41721))

(declare-fun m!197829 () Bool)

(assert (=> bs!10189 m!197829))

(assert (=> b!131098 d!41721))

(declare-fun d!41723 () Bool)

(assert (=> d!41723 (validate_offset_bits!1 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) lt!202162)))

(declare-fun lt!202172 () Unit!8104)

(declare-fun choose!9 (BitStream!4754 array!6062 (_ BitVec 64) BitStream!4754) Unit!8104)

(assert (=> d!41723 (= lt!202172 (choose!9 (_2!5962 lt!202164) (buf!3106 (_2!5962 lt!202155)) lt!202162 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164)))))))

(assert (=> d!41723 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5962 lt!202164) (buf!3106 (_2!5962 lt!202155)) lt!202162) lt!202172)))

(declare-fun bs!10190 () Bool)

(assert (= bs!10190 d!41723))

(assert (=> bs!10190 m!197759))

(declare-fun m!197833 () Bool)

(assert (=> bs!10190 m!197833))

(assert (=> b!131098 d!41723))

(declare-fun b!131125 () Bool)

(declare-fun res!108753 () Bool)

(declare-fun e!86917 () Bool)

(assert (=> b!131125 (=> (not res!108753) (not e!86917))))

(declare-fun lt!202223 () tuple2!11330)

(assert (=> b!131125 (= res!108753 (isPrefixOf!0 (_2!5965 lt!202223) (_2!5962 lt!202155)))))

(declare-fun b!131126 () Bool)

(declare-fun e!86916 () Unit!8104)

(declare-fun lt!202230 () Unit!8104)

(assert (=> b!131126 (= e!86916 lt!202230)))

(declare-fun lt!202231 () (_ BitVec 64))

(assert (=> b!131126 (= lt!202231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202232 () (_ BitVec 64))

(assert (=> b!131126 (= lt!202232 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6062 array!6062 (_ BitVec 64) (_ BitVec 64)) Unit!8104)

(assert (=> b!131126 (= lt!202230 (arrayBitRangesEqSymmetric!0 (buf!3106 (_2!5962 lt!202164)) (buf!3106 (_2!5962 lt!202155)) lt!202231 lt!202232))))

(declare-fun arrayBitRangesEq!0 (array!6062 array!6062 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131126 (arrayBitRangesEq!0 (buf!3106 (_2!5962 lt!202155)) (buf!3106 (_2!5962 lt!202164)) lt!202231 lt!202232)))

(declare-fun d!41731 () Bool)

(assert (=> d!41731 e!86917))

(declare-fun res!108752 () Bool)

(assert (=> d!41731 (=> (not res!108752) (not e!86917))))

(assert (=> d!41731 (= res!108752 (isPrefixOf!0 (_1!5965 lt!202223) (_2!5965 lt!202223)))))

(declare-fun lt!202220 () BitStream!4754)

(assert (=> d!41731 (= lt!202223 (tuple2!11331 lt!202220 (_2!5962 lt!202155)))))

(declare-fun lt!202219 () Unit!8104)

(declare-fun lt!202233 () Unit!8104)

(assert (=> d!41731 (= lt!202219 lt!202233)))

(assert (=> d!41731 (isPrefixOf!0 lt!202220 (_2!5962 lt!202155))))

(assert (=> d!41731 (= lt!202233 (lemmaIsPrefixTransitive!0 lt!202220 (_2!5962 lt!202155) (_2!5962 lt!202155)))))

(declare-fun lt!202228 () Unit!8104)

(declare-fun lt!202225 () Unit!8104)

(assert (=> d!41731 (= lt!202228 lt!202225)))

(assert (=> d!41731 (isPrefixOf!0 lt!202220 (_2!5962 lt!202155))))

(assert (=> d!41731 (= lt!202225 (lemmaIsPrefixTransitive!0 lt!202220 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(declare-fun lt!202234 () Unit!8104)

(assert (=> d!41731 (= lt!202234 e!86916)))

(declare-fun c!7557 () Bool)

(assert (=> d!41731 (= c!7557 (not (= (size!2745 (buf!3106 (_2!5962 lt!202164))) #b00000000000000000000000000000000)))))

(declare-fun lt!202238 () Unit!8104)

(declare-fun lt!202221 () Unit!8104)

(assert (=> d!41731 (= lt!202238 lt!202221)))

(assert (=> d!41731 (isPrefixOf!0 (_2!5962 lt!202155) (_2!5962 lt!202155))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4754) Unit!8104)

(assert (=> d!41731 (= lt!202221 (lemmaIsPrefixRefl!0 (_2!5962 lt!202155)))))

(declare-fun lt!202237 () Unit!8104)

(declare-fun lt!202229 () Unit!8104)

(assert (=> d!41731 (= lt!202237 lt!202229)))

(assert (=> d!41731 (= lt!202229 (lemmaIsPrefixRefl!0 (_2!5962 lt!202155)))))

(declare-fun lt!202226 () Unit!8104)

(declare-fun lt!202236 () Unit!8104)

(assert (=> d!41731 (= lt!202226 lt!202236)))

(assert (=> d!41731 (isPrefixOf!0 lt!202220 lt!202220)))

(assert (=> d!41731 (= lt!202236 (lemmaIsPrefixRefl!0 lt!202220))))

(declare-fun lt!202227 () Unit!8104)

(declare-fun lt!202235 () Unit!8104)

(assert (=> d!41731 (= lt!202227 lt!202235)))

(assert (=> d!41731 (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202164))))

(assert (=> d!41731 (= lt!202235 (lemmaIsPrefixRefl!0 (_2!5962 lt!202164)))))

(assert (=> d!41731 (= lt!202220 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))))))

(assert (=> d!41731 (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202155))))

(assert (=> d!41731 (= (reader!0 (_2!5962 lt!202164) (_2!5962 lt!202155)) lt!202223)))

(declare-fun lt!202222 () (_ BitVec 64))

(declare-fun b!131127 () Bool)

(declare-fun lt!202224 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4754 (_ BitVec 64)) BitStream!4754)

(assert (=> b!131127 (= e!86917 (= (_1!5965 lt!202223) (withMovedBitIndex!0 (_2!5965 lt!202223) (bvsub lt!202222 lt!202224))))))

(assert (=> b!131127 (or (= (bvand lt!202222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202222 lt!202224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131127 (= lt!202224 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155))))))

(assert (=> b!131127 (= lt!202222 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))))))

(declare-fun b!131128 () Bool)

(declare-fun res!108754 () Bool)

(assert (=> b!131128 (=> (not res!108754) (not e!86917))))

(assert (=> b!131128 (= res!108754 (isPrefixOf!0 (_1!5965 lt!202223) (_2!5962 lt!202164)))))

(declare-fun b!131129 () Bool)

(declare-fun Unit!8106 () Unit!8104)

(assert (=> b!131129 (= e!86916 Unit!8106)))

(assert (= (and d!41731 c!7557) b!131126))

(assert (= (and d!41731 (not c!7557)) b!131129))

(assert (= (and d!41731 res!108752) b!131128))

(assert (= (and b!131128 res!108754) b!131125))

(assert (= (and b!131125 res!108753) b!131127))

(declare-fun m!197843 () Bool)

(assert (=> b!131127 m!197843))

(assert (=> b!131127 m!197807))

(assert (=> b!131127 m!197809))

(declare-fun m!197845 () Bool)

(assert (=> b!131128 m!197845))

(assert (=> b!131126 m!197809))

(declare-fun m!197847 () Bool)

(assert (=> b!131126 m!197847))

(declare-fun m!197849 () Bool)

(assert (=> b!131126 m!197849))

(declare-fun m!197851 () Bool)

(assert (=> b!131125 m!197851))

(declare-fun m!197853 () Bool)

(assert (=> d!41731 m!197853))

(declare-fun m!197855 () Bool)

(assert (=> d!41731 m!197855))

(declare-fun m!197857 () Bool)

(assert (=> d!41731 m!197857))

(assert (=> d!41731 m!197815))

(declare-fun m!197859 () Bool)

(assert (=> d!41731 m!197859))

(declare-fun m!197861 () Bool)

(assert (=> d!41731 m!197861))

(declare-fun m!197863 () Bool)

(assert (=> d!41731 m!197863))

(declare-fun m!197865 () Bool)

(assert (=> d!41731 m!197865))

(declare-fun m!197867 () Bool)

(assert (=> d!41731 m!197867))

(declare-fun m!197869 () Bool)

(assert (=> d!41731 m!197869))

(declare-fun m!197871 () Bool)

(assert (=> d!41731 m!197871))

(assert (=> b!131098 d!41731))

(declare-fun d!41741 () Bool)

(declare-fun e!86920 () Bool)

(assert (=> d!41741 e!86920))

(declare-fun res!108759 () Bool)

(assert (=> d!41741 (=> (not res!108759) (not e!86920))))

(declare-fun lt!202254 () (_ BitVec 64))

(declare-fun lt!202253 () (_ BitVec 64))

(declare-fun lt!202255 () (_ BitVec 64))

(assert (=> d!41741 (= res!108759 (= lt!202255 (bvsub lt!202253 lt!202254)))))

(assert (=> d!41741 (or (= (bvand lt!202253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202254 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202253 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202253 lt!202254) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41741 (= lt!202254 (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164)))))))

(declare-fun lt!202252 () (_ BitVec 64))

(declare-fun lt!202251 () (_ BitVec 64))

(assert (=> d!41741 (= lt!202253 (bvmul lt!202252 lt!202251))))

(assert (=> d!41741 (or (= lt!202252 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202251 (bvsdiv (bvmul lt!202252 lt!202251) lt!202252)))))

(assert (=> d!41741 (= lt!202251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41741 (= lt!202252 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))))))

(assert (=> d!41741 (= lt!202255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164)))))))

(assert (=> d!41741 (invariant!0 (currentBit!5874 (_2!5962 lt!202164)) (currentByte!5879 (_2!5962 lt!202164)) (size!2745 (buf!3106 (_2!5962 lt!202164))))))

(assert (=> d!41741 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))) lt!202255)))

(declare-fun b!131134 () Bool)

(declare-fun res!108760 () Bool)

(assert (=> b!131134 (=> (not res!108760) (not e!86920))))

(assert (=> b!131134 (= res!108760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202255))))

(declare-fun b!131135 () Bool)

(declare-fun lt!202256 () (_ BitVec 64))

(assert (=> b!131135 (= e!86920 (bvsle lt!202255 (bvmul lt!202256 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131135 (or (= lt!202256 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202256 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202256)))))

(assert (=> b!131135 (= lt!202256 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))))))

(assert (= (and d!41741 res!108759) b!131134))

(assert (= (and b!131134 res!108760) b!131135))

(declare-fun m!197873 () Bool)

(assert (=> d!41741 m!197873))

(declare-fun m!197875 () Bool)

(assert (=> d!41741 m!197875))

(assert (=> b!131089 d!41741))

(declare-fun d!41743 () Bool)

(declare-fun e!86921 () Bool)

(assert (=> d!41743 e!86921))

(declare-fun res!108761 () Bool)

(assert (=> d!41743 (=> (not res!108761) (not e!86921))))

(declare-fun lt!202261 () (_ BitVec 64))

(declare-fun lt!202260 () (_ BitVec 64))

(declare-fun lt!202259 () (_ BitVec 64))

(assert (=> d!41743 (= res!108761 (= lt!202261 (bvsub lt!202259 lt!202260)))))

(assert (=> d!41743 (or (= (bvand lt!202259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202260 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202259 lt!202260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41743 (= lt!202260 (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634))))))

(declare-fun lt!202258 () (_ BitVec 64))

(declare-fun lt!202257 () (_ BitVec 64))

(assert (=> d!41743 (= lt!202259 (bvmul lt!202258 lt!202257))))

(assert (=> d!41743 (or (= lt!202258 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202257 (bvsdiv (bvmul lt!202258 lt!202257) lt!202258)))))

(assert (=> d!41743 (= lt!202257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41743 (= lt!202258 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))))))

(assert (=> d!41743 (= lt!202261 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5879 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5874 thiss!1634))))))

(assert (=> d!41743 (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634)))))

(assert (=> d!41743 (= (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)) lt!202261)))

(declare-fun b!131136 () Bool)

(declare-fun res!108762 () Bool)

(assert (=> b!131136 (=> (not res!108762) (not e!86921))))

(assert (=> b!131136 (= res!108762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202261))))

(declare-fun b!131137 () Bool)

(declare-fun lt!202262 () (_ BitVec 64))

(assert (=> b!131137 (= e!86921 (bvsle lt!202261 (bvmul lt!202262 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131137 (or (= lt!202262 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202262 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202262)))))

(assert (=> b!131137 (= lt!202262 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))))))

(assert (= (and d!41743 res!108761) b!131136))

(assert (= (and b!131136 res!108762) b!131137))

(declare-fun m!197877 () Bool)

(assert (=> d!41743 m!197877))

(assert (=> d!41743 m!197813))

(assert (=> b!131089 d!41743))

(declare-fun d!41745 () Bool)

(declare-fun e!86922 () Bool)

(assert (=> d!41745 e!86922))

(declare-fun res!108763 () Bool)

(assert (=> d!41745 (=> (not res!108763) (not e!86922))))

(declare-fun lt!202266 () (_ BitVec 64))

(declare-fun lt!202267 () (_ BitVec 64))

(declare-fun lt!202265 () (_ BitVec 64))

(assert (=> d!41745 (= res!108763 (= lt!202267 (bvsub lt!202265 lt!202266)))))

(assert (=> d!41745 (or (= (bvand lt!202265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202266 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202265 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202265 lt!202266) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41745 (= lt!202266 (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202155))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202155)))))))

(declare-fun lt!202264 () (_ BitVec 64))

(declare-fun lt!202263 () (_ BitVec 64))

(assert (=> d!41745 (= lt!202265 (bvmul lt!202264 lt!202263))))

(assert (=> d!41745 (or (= lt!202264 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202263 (bvsdiv (bvmul lt!202264 lt!202263) lt!202264)))))

(assert (=> d!41745 (= lt!202263 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41745 (= lt!202264 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))))))

(assert (=> d!41745 (= lt!202267 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202155))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202155)))))))

(assert (=> d!41745 (invariant!0 (currentBit!5874 (_2!5962 lt!202155)) (currentByte!5879 (_2!5962 lt!202155)) (size!2745 (buf!3106 (_2!5962 lt!202155))))))

(assert (=> d!41745 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155))) lt!202267)))

(declare-fun b!131138 () Bool)

(declare-fun res!108764 () Bool)

(assert (=> b!131138 (=> (not res!108764) (not e!86922))))

(assert (=> b!131138 (= res!108764 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202267))))

(declare-fun b!131139 () Bool)

(declare-fun lt!202268 () (_ BitVec 64))

(assert (=> b!131139 (= e!86922 (bvsle lt!202267 (bvmul lt!202268 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131139 (or (= lt!202268 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202268 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202268)))))

(assert (=> b!131139 (= lt!202268 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))))))

(assert (= (and d!41745 res!108763) b!131138))

(assert (= (and b!131138 res!108764) b!131139))

(declare-fun m!197879 () Bool)

(assert (=> d!41745 m!197879))

(declare-fun m!197881 () Bool)

(assert (=> d!41745 m!197881))

(assert (=> b!131099 d!41745))

(assert (=> b!131099 d!41741))

(declare-fun d!41747 () Bool)

(assert (=> d!41747 (= (array_inv!2534 arr!237) (bvsge (size!2745 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!25682 d!41747))

(declare-fun d!41749 () Bool)

(assert (=> d!41749 (= (inv!12 thiss!1634) (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634))))))

(declare-fun bs!10194 () Bool)

(assert (= bs!10194 d!41749))

(assert (=> bs!10194 m!197813))

(assert (=> start!25682 d!41749))

(declare-fun d!41751 () Bool)

(declare-fun res!108771 () Bool)

(declare-fun e!86928 () Bool)

(assert (=> d!41751 (=> (not res!108771) (not e!86928))))

(assert (=> d!41751 (= res!108771 (= (size!2745 (buf!3106 thiss!1634)) (size!2745 (buf!3106 (_2!5962 lt!202164)))))))

(assert (=> d!41751 (= (isPrefixOf!0 thiss!1634 (_2!5962 lt!202164)) e!86928)))

(declare-fun b!131146 () Bool)

(declare-fun res!108773 () Bool)

(assert (=> b!131146 (=> (not res!108773) (not e!86928))))

(assert (=> b!131146 (= res!108773 (bvsle (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)) (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164)))))))

(declare-fun b!131147 () Bool)

(declare-fun e!86927 () Bool)

(assert (=> b!131147 (= e!86928 e!86927)))

(declare-fun res!108772 () Bool)

(assert (=> b!131147 (=> res!108772 e!86927)))

(assert (=> b!131147 (= res!108772 (= (size!2745 (buf!3106 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131148 () Bool)

(assert (=> b!131148 (= e!86927 (arrayBitRangesEq!0 (buf!3106 thiss!1634) (buf!3106 (_2!5962 lt!202164)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))))))

(assert (= (and d!41751 res!108771) b!131146))

(assert (= (and b!131146 res!108773) b!131147))

(assert (= (and b!131147 (not res!108772)) b!131148))

(assert (=> b!131146 m!197819))

(assert (=> b!131146 m!197809))

(assert (=> b!131148 m!197819))

(assert (=> b!131148 m!197819))

(declare-fun m!197883 () Bool)

(assert (=> b!131148 m!197883))

(assert (=> b!131095 d!41751))

(declare-fun d!41753 () Bool)

(assert (=> d!41753 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10195 () Bool)

(assert (= bs!10195 d!41753))

(assert (=> bs!10195 m!197877))

(assert (=> b!131097 d!41753))

(declare-fun d!41755 () Bool)

(assert (=> d!41755 (= (array_inv!2534 (buf!3106 thiss!1634)) (bvsge (size!2745 (buf!3106 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!131093 d!41755))

(declare-fun d!41757 () Bool)

(declare-fun res!108778 () Bool)

(declare-fun e!86933 () Bool)

(assert (=> d!41757 (=> res!108778 e!86933)))

(assert (=> d!41757 (= res!108778 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!41757 (= (arrayRangesEq!148 arr!237 (_2!5963 lt!202166) #b00000000000000000000000000000000 to!404) e!86933)))

(declare-fun b!131153 () Bool)

(declare-fun e!86934 () Bool)

(assert (=> b!131153 (= e!86933 e!86934)))

(declare-fun res!108779 () Bool)

(assert (=> b!131153 (=> (not res!108779) (not e!86934))))

(assert (=> b!131153 (= res!108779 (= (select (arr!3368 arr!237) #b00000000000000000000000000000000) (select (arr!3368 (_2!5963 lt!202166)) #b00000000000000000000000000000000)))))

(declare-fun b!131154 () Bool)

(assert (=> b!131154 (= e!86934 (arrayRangesEq!148 arr!237 (_2!5963 lt!202166) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!41757 (not res!108778)) b!131153))

(assert (= (and b!131153 res!108779) b!131154))

(declare-fun m!197885 () Bool)

(assert (=> b!131153 m!197885))

(declare-fun m!197887 () Bool)

(assert (=> b!131153 m!197887))

(declare-fun m!197889 () Bool)

(assert (=> b!131154 m!197889))

(assert (=> b!131092 d!41757))

(declare-fun d!41759 () Bool)

(declare-datatypes ((tuple2!11334 0))(
  ( (tuple2!11335 (_1!5968 (_ BitVec 8)) (_2!5968 BitStream!4754)) )
))
(declare-fun lt!202289 () tuple2!11334)

(declare-fun readByte!0 (BitStream!4754) tuple2!11334)

(assert (=> d!41759 (= lt!202289 (readByte!0 (_1!5965 lt!202159)))))

(assert (=> d!41759 (= (readBytePure!0 (_1!5965 lt!202159)) (tuple2!11329 (_2!5968 lt!202289) (_1!5968 lt!202289)))))

(declare-fun bs!10196 () Bool)

(assert (= bs!10196 d!41759))

(declare-fun m!197891 () Bool)

(assert (=> bs!10196 m!197891))

(assert (=> b!131094 d!41759))

(declare-fun b!131165 () Bool)

(declare-fun res!108791 () Bool)

(declare-fun e!86942 () Bool)

(assert (=> b!131165 (=> (not res!108791) (not e!86942))))

(declare-fun lt!202294 () tuple2!11330)

(assert (=> b!131165 (= res!108791 (isPrefixOf!0 (_2!5965 lt!202294) (_2!5962 lt!202164)))))

(declare-fun b!131166 () Bool)

(declare-fun e!86941 () Unit!8104)

(declare-fun lt!202301 () Unit!8104)

(assert (=> b!131166 (= e!86941 lt!202301)))

(declare-fun lt!202302 () (_ BitVec 64))

(assert (=> b!131166 (= lt!202302 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202303 () (_ BitVec 64))

(assert (=> b!131166 (= lt!202303 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(assert (=> b!131166 (= lt!202301 (arrayBitRangesEqSymmetric!0 (buf!3106 thiss!1634) (buf!3106 (_2!5962 lt!202164)) lt!202302 lt!202303))))

(assert (=> b!131166 (arrayBitRangesEq!0 (buf!3106 (_2!5962 lt!202164)) (buf!3106 thiss!1634) lt!202302 lt!202303)))

(declare-fun d!41761 () Bool)

(assert (=> d!41761 e!86942))

(declare-fun res!108790 () Bool)

(assert (=> d!41761 (=> (not res!108790) (not e!86942))))

(assert (=> d!41761 (= res!108790 (isPrefixOf!0 (_1!5965 lt!202294) (_2!5965 lt!202294)))))

(declare-fun lt!202291 () BitStream!4754)

(assert (=> d!41761 (= lt!202294 (tuple2!11331 lt!202291 (_2!5962 lt!202164)))))

(declare-fun lt!202290 () Unit!8104)

(declare-fun lt!202304 () Unit!8104)

(assert (=> d!41761 (= lt!202290 lt!202304)))

(assert (=> d!41761 (isPrefixOf!0 lt!202291 (_2!5962 lt!202164))))

(assert (=> d!41761 (= lt!202304 (lemmaIsPrefixTransitive!0 lt!202291 (_2!5962 lt!202164) (_2!5962 lt!202164)))))

(declare-fun lt!202299 () Unit!8104)

(declare-fun lt!202296 () Unit!8104)

(assert (=> d!41761 (= lt!202299 lt!202296)))

(assert (=> d!41761 (isPrefixOf!0 lt!202291 (_2!5962 lt!202164))))

(assert (=> d!41761 (= lt!202296 (lemmaIsPrefixTransitive!0 lt!202291 thiss!1634 (_2!5962 lt!202164)))))

(declare-fun lt!202305 () Unit!8104)

(assert (=> d!41761 (= lt!202305 e!86941)))

(declare-fun c!7558 () Bool)

(assert (=> d!41761 (= c!7558 (not (= (size!2745 (buf!3106 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202309 () Unit!8104)

(declare-fun lt!202292 () Unit!8104)

(assert (=> d!41761 (= lt!202309 lt!202292)))

(assert (=> d!41761 (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202164))))

(assert (=> d!41761 (= lt!202292 (lemmaIsPrefixRefl!0 (_2!5962 lt!202164)))))

(declare-fun lt!202308 () Unit!8104)

(declare-fun lt!202300 () Unit!8104)

(assert (=> d!41761 (= lt!202308 lt!202300)))

(assert (=> d!41761 (= lt!202300 (lemmaIsPrefixRefl!0 (_2!5962 lt!202164)))))

(declare-fun lt!202297 () Unit!8104)

(declare-fun lt!202307 () Unit!8104)

(assert (=> d!41761 (= lt!202297 lt!202307)))

(assert (=> d!41761 (isPrefixOf!0 lt!202291 lt!202291)))

(assert (=> d!41761 (= lt!202307 (lemmaIsPrefixRefl!0 lt!202291))))

(declare-fun lt!202298 () Unit!8104)

(declare-fun lt!202306 () Unit!8104)

(assert (=> d!41761 (= lt!202298 lt!202306)))

(assert (=> d!41761 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41761 (= lt!202306 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41761 (= lt!202291 (BitStream!4755 (buf!3106 (_2!5962 lt!202164)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(assert (=> d!41761 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202164))))

(assert (=> d!41761 (= (reader!0 thiss!1634 (_2!5962 lt!202164)) lt!202294)))

(declare-fun lt!202293 () (_ BitVec 64))

(declare-fun lt!202295 () (_ BitVec 64))

(declare-fun b!131167 () Bool)

(assert (=> b!131167 (= e!86942 (= (_1!5965 lt!202294) (withMovedBitIndex!0 (_2!5965 lt!202294) (bvsub lt!202293 lt!202295))))))

(assert (=> b!131167 (or (= (bvand lt!202293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202295 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202293 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202293 lt!202295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131167 (= lt!202295 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))))))

(assert (=> b!131167 (= lt!202293 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(declare-fun b!131168 () Bool)

(declare-fun res!108792 () Bool)

(assert (=> b!131168 (=> (not res!108792) (not e!86942))))

(assert (=> b!131168 (= res!108792 (isPrefixOf!0 (_1!5965 lt!202294) thiss!1634))))

(declare-fun b!131169 () Bool)

(declare-fun Unit!8109 () Unit!8104)

(assert (=> b!131169 (= e!86941 Unit!8109)))

(assert (= (and d!41761 c!7558) b!131166))

(assert (= (and d!41761 (not c!7558)) b!131169))

(assert (= (and d!41761 res!108790) b!131168))

(assert (= (and b!131168 res!108792) b!131165))

(assert (= (and b!131165 res!108791) b!131167))

(declare-fun m!197893 () Bool)

(assert (=> b!131167 m!197893))

(assert (=> b!131167 m!197809))

(assert (=> b!131167 m!197819))

(declare-fun m!197895 () Bool)

(assert (=> b!131168 m!197895))

(assert (=> b!131166 m!197819))

(declare-fun m!197897 () Bool)

(assert (=> b!131166 m!197897))

(declare-fun m!197899 () Bool)

(assert (=> b!131166 m!197899))

(declare-fun m!197901 () Bool)

(assert (=> b!131165 m!197901))

(declare-fun m!197903 () Bool)

(assert (=> d!41761 m!197903))

(declare-fun m!197905 () Bool)

(assert (=> d!41761 m!197905))

(declare-fun m!197907 () Bool)

(assert (=> d!41761 m!197907))

(assert (=> d!41761 m!197765))

(declare-fun m!197909 () Bool)

(assert (=> d!41761 m!197909))

(declare-fun m!197911 () Bool)

(assert (=> d!41761 m!197911))

(assert (=> d!41761 m!197857))

(declare-fun m!197913 () Bool)

(assert (=> d!41761 m!197913))

(declare-fun m!197915 () Bool)

(assert (=> d!41761 m!197915))

(assert (=> d!41761 m!197867))

(declare-fun m!197917 () Bool)

(assert (=> d!41761 m!197917))

(assert (=> b!131094 d!41761))

(declare-fun d!41763 () Bool)

(assert (=> d!41763 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202155))))

(declare-fun lt!202321 () Unit!8104)

(declare-fun choose!30 (BitStream!4754 BitStream!4754 BitStream!4754) Unit!8104)

(assert (=> d!41763 (= lt!202321 (choose!30 thiss!1634 (_2!5962 lt!202164) (_2!5962 lt!202155)))))

(assert (=> d!41763 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202164))))

(assert (=> d!41763 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5962 lt!202164) (_2!5962 lt!202155)) lt!202321)))

(declare-fun bs!10197 () Bool)

(assert (= bs!10197 d!41763))

(assert (=> bs!10197 m!197797))

(declare-fun m!197923 () Bool)

(assert (=> bs!10197 m!197923))

(assert (=> bs!10197 m!197765))

(assert (=> b!131101 d!41763))

(declare-fun b!131175 () Bool)

(declare-fun res!108799 () Bool)

(declare-fun e!86947 () Bool)

(assert (=> b!131175 (=> (not res!108799) (not e!86947))))

(declare-fun lt!202326 () tuple2!11330)

(assert (=> b!131175 (= res!108799 (isPrefixOf!0 (_2!5965 lt!202326) (_2!5962 lt!202155)))))

(declare-fun b!131176 () Bool)

(declare-fun e!86946 () Unit!8104)

(declare-fun lt!202333 () Unit!8104)

(assert (=> b!131176 (= e!86946 lt!202333)))

(declare-fun lt!202334 () (_ BitVec 64))

(assert (=> b!131176 (= lt!202334 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!202335 () (_ BitVec 64))

(assert (=> b!131176 (= lt!202335 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(assert (=> b!131176 (= lt!202333 (arrayBitRangesEqSymmetric!0 (buf!3106 thiss!1634) (buf!3106 (_2!5962 lt!202155)) lt!202334 lt!202335))))

(assert (=> b!131176 (arrayBitRangesEq!0 (buf!3106 (_2!5962 lt!202155)) (buf!3106 thiss!1634) lt!202334 lt!202335)))

(declare-fun d!41765 () Bool)

(assert (=> d!41765 e!86947))

(declare-fun res!108798 () Bool)

(assert (=> d!41765 (=> (not res!108798) (not e!86947))))

(assert (=> d!41765 (= res!108798 (isPrefixOf!0 (_1!5965 lt!202326) (_2!5965 lt!202326)))))

(declare-fun lt!202323 () BitStream!4754)

(assert (=> d!41765 (= lt!202326 (tuple2!11331 lt!202323 (_2!5962 lt!202155)))))

(declare-fun lt!202322 () Unit!8104)

(declare-fun lt!202336 () Unit!8104)

(assert (=> d!41765 (= lt!202322 lt!202336)))

(assert (=> d!41765 (isPrefixOf!0 lt!202323 (_2!5962 lt!202155))))

(assert (=> d!41765 (= lt!202336 (lemmaIsPrefixTransitive!0 lt!202323 (_2!5962 lt!202155) (_2!5962 lt!202155)))))

(declare-fun lt!202331 () Unit!8104)

(declare-fun lt!202328 () Unit!8104)

(assert (=> d!41765 (= lt!202331 lt!202328)))

(assert (=> d!41765 (isPrefixOf!0 lt!202323 (_2!5962 lt!202155))))

(assert (=> d!41765 (= lt!202328 (lemmaIsPrefixTransitive!0 lt!202323 thiss!1634 (_2!5962 lt!202155)))))

(declare-fun lt!202337 () Unit!8104)

(assert (=> d!41765 (= lt!202337 e!86946)))

(declare-fun c!7559 () Bool)

(assert (=> d!41765 (= c!7559 (not (= (size!2745 (buf!3106 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!202341 () Unit!8104)

(declare-fun lt!202324 () Unit!8104)

(assert (=> d!41765 (= lt!202341 lt!202324)))

(assert (=> d!41765 (isPrefixOf!0 (_2!5962 lt!202155) (_2!5962 lt!202155))))

(assert (=> d!41765 (= lt!202324 (lemmaIsPrefixRefl!0 (_2!5962 lt!202155)))))

(declare-fun lt!202340 () Unit!8104)

(declare-fun lt!202332 () Unit!8104)

(assert (=> d!41765 (= lt!202340 lt!202332)))

(assert (=> d!41765 (= lt!202332 (lemmaIsPrefixRefl!0 (_2!5962 lt!202155)))))

(declare-fun lt!202329 () Unit!8104)

(declare-fun lt!202339 () Unit!8104)

(assert (=> d!41765 (= lt!202329 lt!202339)))

(assert (=> d!41765 (isPrefixOf!0 lt!202323 lt!202323)))

(assert (=> d!41765 (= lt!202339 (lemmaIsPrefixRefl!0 lt!202323))))

(declare-fun lt!202330 () Unit!8104)

(declare-fun lt!202338 () Unit!8104)

(assert (=> d!41765 (= lt!202330 lt!202338)))

(assert (=> d!41765 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!41765 (= lt!202338 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!41765 (= lt!202323 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(assert (=> d!41765 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202155))))

(assert (=> d!41765 (= (reader!0 thiss!1634 (_2!5962 lt!202155)) lt!202326)))

(declare-fun lt!202327 () (_ BitVec 64))

(declare-fun b!131177 () Bool)

(declare-fun lt!202325 () (_ BitVec 64))

(assert (=> b!131177 (= e!86947 (= (_1!5965 lt!202326) (withMovedBitIndex!0 (_2!5965 lt!202326) (bvsub lt!202325 lt!202327))))))

(assert (=> b!131177 (or (= (bvand lt!202325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202325 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202325 lt!202327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131177 (= lt!202327 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155))))))

(assert (=> b!131177 (= lt!202325 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(declare-fun b!131178 () Bool)

(declare-fun res!108800 () Bool)

(assert (=> b!131178 (=> (not res!108800) (not e!86947))))

(assert (=> b!131178 (= res!108800 (isPrefixOf!0 (_1!5965 lt!202326) thiss!1634))))

(declare-fun b!131179 () Bool)

(declare-fun Unit!8110 () Unit!8104)

(assert (=> b!131179 (= e!86946 Unit!8110)))

(assert (= (and d!41765 c!7559) b!131176))

(assert (= (and d!41765 (not c!7559)) b!131179))

(assert (= (and d!41765 res!108798) b!131178))

(assert (= (and b!131178 res!108800) b!131175))

(assert (= (and b!131175 res!108799) b!131177))

(declare-fun m!197939 () Bool)

(assert (=> b!131177 m!197939))

(assert (=> b!131177 m!197807))

(assert (=> b!131177 m!197819))

(declare-fun m!197941 () Bool)

(assert (=> b!131178 m!197941))

(assert (=> b!131176 m!197819))

(declare-fun m!197943 () Bool)

(assert (=> b!131176 m!197943))

(declare-fun m!197945 () Bool)

(assert (=> b!131176 m!197945))

(declare-fun m!197947 () Bool)

(assert (=> b!131175 m!197947))

(declare-fun m!197949 () Bool)

(assert (=> d!41765 m!197949))

(declare-fun m!197951 () Bool)

(assert (=> d!41765 m!197951))

(assert (=> d!41765 m!197907))

(assert (=> d!41765 m!197797))

(declare-fun m!197953 () Bool)

(assert (=> d!41765 m!197953))

(declare-fun m!197955 () Bool)

(assert (=> d!41765 m!197955))

(assert (=> d!41765 m!197863))

(declare-fun m!197957 () Bool)

(assert (=> d!41765 m!197957))

(assert (=> d!41765 m!197915))

(assert (=> d!41765 m!197869))

(declare-fun m!197959 () Bool)

(assert (=> d!41765 m!197959))

(assert (=> b!131101 d!41765))

(declare-fun d!41769 () Bool)

(declare-fun e!86948 () Bool)

(assert (=> d!41769 e!86948))

(declare-fun res!108801 () Bool)

(assert (=> d!41769 (=> (not res!108801) (not e!86948))))

(declare-fun lt!202345 () (_ BitVec 64))

(declare-fun lt!202344 () (_ BitVec 64))

(declare-fun lt!202346 () (_ BitVec 64))

(assert (=> d!41769 (= res!108801 (= lt!202346 (bvsub lt!202344 lt!202345)))))

(assert (=> d!41769 (or (= (bvand lt!202344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202345 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202344 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202344 lt!202345) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41769 (= lt!202345 (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202158)))) ((_ sign_extend 32) (currentByte!5879 (_1!5964 lt!202158))) ((_ sign_extend 32) (currentBit!5874 (_1!5964 lt!202158)))))))

(declare-fun lt!202343 () (_ BitVec 64))

(declare-fun lt!202342 () (_ BitVec 64))

(assert (=> d!41769 (= lt!202344 (bvmul lt!202343 lt!202342))))

(assert (=> d!41769 (or (= lt!202343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202342 (bvsdiv (bvmul lt!202343 lt!202342) lt!202343)))))

(assert (=> d!41769 (= lt!202342 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41769 (= lt!202343 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202158)))))))

(assert (=> d!41769 (= lt!202346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5879 (_1!5964 lt!202158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5874 (_1!5964 lt!202158)))))))

(assert (=> d!41769 (invariant!0 (currentBit!5874 (_1!5964 lt!202158)) (currentByte!5879 (_1!5964 lt!202158)) (size!2745 (buf!3106 (_1!5964 lt!202158))))))

(assert (=> d!41769 (= (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202158))) (currentByte!5879 (_1!5964 lt!202158)) (currentBit!5874 (_1!5964 lt!202158))) lt!202346)))

(declare-fun b!131180 () Bool)

(declare-fun res!108802 () Bool)

(assert (=> b!131180 (=> (not res!108802) (not e!86948))))

(assert (=> b!131180 (= res!108802 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202346))))

(declare-fun b!131181 () Bool)

(declare-fun lt!202347 () (_ BitVec 64))

(assert (=> b!131181 (= e!86948 (bvsle lt!202346 (bvmul lt!202347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131181 (or (= lt!202347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202347)))))

(assert (=> b!131181 (= lt!202347 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202158)))))))

(assert (= (and d!41769 res!108801) b!131180))

(assert (= (and b!131180 res!108802) b!131181))

(declare-fun m!197961 () Bool)

(assert (=> d!41769 m!197961))

(declare-fun m!197963 () Bool)

(assert (=> d!41769 m!197963))

(assert (=> b!131101 d!41769))

(declare-fun d!41771 () Bool)

(assert (=> d!41771 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10198 () Bool)

(assert (= bs!10198 d!41771))

(assert (=> bs!10198 m!197873))

(assert (=> b!131101 d!41771))

(declare-fun d!41773 () Bool)

(assert (=> d!41773 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5965 lt!202165)))) ((_ sign_extend 32) (currentByte!5879 (_1!5965 lt!202165))) ((_ sign_extend 32) (currentBit!5874 (_1!5965 lt!202165))) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5965 lt!202165)))) ((_ sign_extend 32) (currentByte!5879 (_1!5965 lt!202165))) ((_ sign_extend 32) (currentBit!5874 (_1!5965 lt!202165)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10199 () Bool)

(assert (= bs!10199 d!41773))

(declare-fun m!197965 () Bool)

(assert (=> bs!10199 m!197965))

(assert (=> b!131101 d!41773))

(declare-fun d!41775 () Bool)

(declare-fun e!86949 () Bool)

(assert (=> d!41775 e!86949))

(declare-fun res!108803 () Bool)

(assert (=> d!41775 (=> (not res!108803) (not e!86949))))

(declare-fun lt!202351 () (_ BitVec 64))

(declare-fun lt!202352 () (_ BitVec 64))

(declare-fun lt!202350 () (_ BitVec 64))

(assert (=> d!41775 (= res!108803 (= lt!202352 (bvsub lt!202350 lt!202351)))))

(assert (=> d!41775 (or (= (bvand lt!202350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202351 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!202350 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!202350 lt!202351) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!41775 (= lt!202351 (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202160)))) ((_ sign_extend 32) (currentByte!5879 (_1!5964 lt!202160))) ((_ sign_extend 32) (currentBit!5874 (_1!5964 lt!202160)))))))

(declare-fun lt!202349 () (_ BitVec 64))

(declare-fun lt!202348 () (_ BitVec 64))

(assert (=> d!41775 (= lt!202350 (bvmul lt!202349 lt!202348))))

(assert (=> d!41775 (or (= lt!202349 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!202348 (bvsdiv (bvmul lt!202349 lt!202348) lt!202349)))))

(assert (=> d!41775 (= lt!202348 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!41775 (= lt!202349 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202160)))))))

(assert (=> d!41775 (= lt!202352 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5879 (_1!5964 lt!202160))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5874 (_1!5964 lt!202160)))))))

(assert (=> d!41775 (invariant!0 (currentBit!5874 (_1!5964 lt!202160)) (currentByte!5879 (_1!5964 lt!202160)) (size!2745 (buf!3106 (_1!5964 lt!202160))))))

(assert (=> d!41775 (= (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202160))) (currentByte!5879 (_1!5964 lt!202160)) (currentBit!5874 (_1!5964 lt!202160))) lt!202352)))

(declare-fun b!131182 () Bool)

(declare-fun res!108804 () Bool)

(assert (=> b!131182 (=> (not res!108804) (not e!86949))))

(assert (=> b!131182 (= res!108804 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!202352))))

(declare-fun b!131183 () Bool)

(declare-fun lt!202353 () (_ BitVec 64))

(assert (=> b!131183 (= e!86949 (bvsle lt!202352 (bvmul lt!202353 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!131183 (or (= lt!202353 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202353 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202353)))))

(assert (=> b!131183 (= lt!202353 ((_ sign_extend 32) (size!2745 (buf!3106 (_1!5964 lt!202160)))))))

(assert (= (and d!41775 res!108803) b!131182))

(assert (= (and b!131182 res!108804) b!131183))

(declare-fun m!197967 () Bool)

(assert (=> d!41775 m!197967))

(declare-fun m!197969 () Bool)

(assert (=> d!41775 m!197969))

(assert (=> b!131101 d!41775))

(declare-fun d!41777 () Bool)

(declare-fun e!86955 () Bool)

(assert (=> d!41777 e!86955))

(declare-fun res!108810 () Bool)

(assert (=> d!41777 (=> (not res!108810) (not e!86955))))

(assert (=> d!41777 (= res!108810 (and (or (let ((rhs!3079 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3079 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3079) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!41778 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!41778 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!41778 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3078 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3078 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3078) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!202372 () Unit!8104)

(declare-fun choose!57 (BitStream!4754 BitStream!4754 (_ BitVec 64) (_ BitVec 32)) Unit!8104)

(assert (=> d!41777 (= lt!202372 (choose!57 thiss!1634 (_2!5962 lt!202164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!41777 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5962 lt!202164) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!202372)))

(declare-fun b!131189 () Bool)

(declare-fun lt!202374 () (_ BitVec 32))

(assert (=> b!131189 (= e!86955 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) (bvsub (bvsub to!404 from!447) lt!202374)))))

(assert (=> b!131189 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!202374 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!202374) #b10000000000000000000000000000000)))))

(declare-fun lt!202373 () (_ BitVec 64))

(assert (=> b!131189 (= lt!202374 ((_ extract 31 0) lt!202373))))

(assert (=> b!131189 (and (bvslt lt!202373 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!202373 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!131189 (= lt!202373 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!41777 res!108810) b!131189))

(declare-fun m!197979 () Bool)

(assert (=> d!41777 m!197979))

(declare-fun m!197981 () Bool)

(assert (=> b!131189 m!197981))

(assert (=> b!131101 d!41777))

(declare-fun d!41783 () Bool)

(declare-fun e!86961 () Bool)

(assert (=> d!41783 e!86961))

(declare-fun res!108822 () Bool)

(assert (=> d!41783 (=> (not res!108822) (not e!86961))))

(declare-fun lt!202398 () tuple2!11324)

(assert (=> d!41783 (= res!108822 (= (size!2745 (buf!3106 thiss!1634)) (size!2745 (buf!3106 (_2!5962 lt!202398)))))))

(declare-fun choose!6 (BitStream!4754 (_ BitVec 8)) tuple2!11324)

(assert (=> d!41783 (= lt!202398 (choose!6 thiss!1634 (select (arr!3368 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!41783 (validate_offset_byte!0 ((_ sign_extend 32) (size!2745 (buf!3106 thiss!1634))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)))))

(assert (=> d!41783 (= (appendByte!0 thiss!1634 (select (arr!3368 arr!237) from!447)) lt!202398)))

(declare-fun b!131199 () Bool)

(declare-fun res!108821 () Bool)

(assert (=> b!131199 (=> (not res!108821) (not e!86961))))

(declare-fun lt!202396 () (_ BitVec 64))

(declare-fun lt!202397 () (_ BitVec 64))

(assert (=> b!131199 (= res!108821 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202398))) (currentByte!5879 (_2!5962 lt!202398)) (currentBit!5874 (_2!5962 lt!202398))) (bvadd lt!202397 lt!202396)))))

(assert (=> b!131199 (or (not (= (bvand lt!202397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202396 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202397 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202397 lt!202396) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131199 (= lt!202396 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!131199 (= lt!202397 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)))))

(declare-fun b!131200 () Bool)

(declare-fun res!108820 () Bool)

(assert (=> b!131200 (=> (not res!108820) (not e!86961))))

(assert (=> b!131200 (= res!108820 (isPrefixOf!0 thiss!1634 (_2!5962 lt!202398)))))

(declare-fun b!131201 () Bool)

(declare-fun lt!202394 () tuple2!11330)

(declare-fun lt!202395 () tuple2!11328)

(assert (=> b!131201 (= e!86961 (and (= (_2!5964 lt!202395) (select (arr!3368 arr!237) from!447)) (= (_1!5964 lt!202395) (_2!5965 lt!202394))))))

(assert (=> b!131201 (= lt!202395 (readBytePure!0 (_1!5965 lt!202394)))))

(assert (=> b!131201 (= lt!202394 (reader!0 thiss!1634 (_2!5962 lt!202398)))))

(assert (= (and d!41783 res!108822) b!131199))

(assert (= (and b!131199 res!108821) b!131200))

(assert (= (and b!131200 res!108820) b!131201))

(assert (=> d!41783 m!197789))

(declare-fun m!197987 () Bool)

(assert (=> d!41783 m!197987))

(declare-fun m!197989 () Bool)

(assert (=> d!41783 m!197989))

(declare-fun m!197991 () Bool)

(assert (=> b!131199 m!197991))

(assert (=> b!131199 m!197819))

(declare-fun m!197993 () Bool)

(assert (=> b!131200 m!197993))

(declare-fun m!197995 () Bool)

(assert (=> b!131201 m!197995))

(declare-fun m!197997 () Bool)

(assert (=> b!131201 m!197997))

(assert (=> b!131101 d!41783))

(declare-fun b!131247 () Bool)

(declare-fun res!108863 () Bool)

(declare-fun e!86984 () Bool)

(assert (=> b!131247 (=> (not res!108863) (not e!86984))))

(declare-fun lt!202537 () tuple2!11324)

(assert (=> b!131247 (= res!108863 (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202537)))))

(declare-fun b!131248 () Bool)

(declare-fun e!86983 () Bool)

(declare-fun lt!202535 () (_ BitVec 64))

(assert (=> b!131248 (= e!86983 (validate_offset_bits!1 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202164)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) lt!202535))))

(declare-fun b!131249 () Bool)

(declare-fun res!108861 () Bool)

(assert (=> b!131249 (=> (not res!108861) (not e!86984))))

(declare-fun lt!202538 () (_ BitVec 64))

(declare-fun lt!202539 () (_ BitVec 64))

(assert (=> b!131249 (= res!108861 (= (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202537))) (currentByte!5879 (_2!5962 lt!202537)) (currentBit!5874 (_2!5962 lt!202537))) (bvadd lt!202538 lt!202539)))))

(assert (=> b!131249 (or (not (= (bvand lt!202538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!202539 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!202538 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!202538 lt!202539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!202542 () (_ BitVec 64))

(assert (=> b!131249 (= lt!202539 (bvmul lt!202542 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!131249 (or (= lt!202542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!202542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!202542)))))

(assert (=> b!131249 (= lt!202542 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131249 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131249 (= lt!202538 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))))))

(declare-fun b!131250 () Bool)

(declare-fun e!86982 () Bool)

(assert (=> b!131250 (= e!86984 e!86982)))

(declare-fun res!108862 () Bool)

(assert (=> b!131250 (=> (not res!108862) (not e!86982))))

(declare-fun lt!202536 () tuple2!11326)

(declare-fun lt!202540 () tuple2!11330)

(assert (=> b!131250 (= res!108862 (and (= (size!2745 (_2!5963 lt!202536)) (size!2745 arr!237)) (= (_1!5963 lt!202536) (_2!5965 lt!202540))))))

(assert (=> b!131250 (= lt!202536 (readByteArrayLoopPure!0 (_1!5965 lt!202540) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!202534 () Unit!8104)

(declare-fun lt!202541 () Unit!8104)

(assert (=> b!131250 (= lt!202534 lt!202541)))

(assert (=> b!131250 (validate_offset_bits!1 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202537)))) ((_ sign_extend 32) (currentByte!5879 (_2!5962 lt!202164))) ((_ sign_extend 32) (currentBit!5874 (_2!5962 lt!202164))) lt!202535)))

(assert (=> b!131250 (= lt!202541 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5962 lt!202164) (buf!3106 (_2!5962 lt!202537)) lt!202535))))

(assert (=> b!131250 e!86983))

(declare-fun res!108864 () Bool)

(assert (=> b!131250 (=> (not res!108864) (not e!86983))))

(assert (=> b!131250 (= res!108864 (and (= (size!2745 (buf!3106 (_2!5962 lt!202164))) (size!2745 (buf!3106 (_2!5962 lt!202537)))) (bvsge lt!202535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!131250 (= lt!202535 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!131250 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!131250 (= lt!202540 (reader!0 (_2!5962 lt!202164) (_2!5962 lt!202537)))))

(declare-fun b!131251 () Bool)

(assert (=> b!131251 (= e!86982 (arrayRangesEq!148 arr!237 (_2!5963 lt!202536) #b00000000000000000000000000000000 to!404))))

(declare-fun d!41787 () Bool)

(assert (=> d!41787 e!86984))

(declare-fun res!108860 () Bool)

(assert (=> d!41787 (=> (not res!108860) (not e!86984))))

(assert (=> d!41787 (= res!108860 (= (size!2745 (buf!3106 (_2!5962 lt!202164))) (size!2745 (buf!3106 (_2!5962 lt!202537)))))))

(declare-fun choose!64 (BitStream!4754 array!6062 (_ BitVec 32) (_ BitVec 32)) tuple2!11324)

(assert (=> d!41787 (= lt!202537 (choose!64 (_2!5962 lt!202164) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!41787 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2745 arr!237)))))

(assert (=> d!41787 (= (appendByteArrayLoop!0 (_2!5962 lt!202164) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!202537)))

(assert (= (and d!41787 res!108860) b!131249))

(assert (= (and b!131249 res!108861) b!131247))

(assert (= (and b!131247 res!108863) b!131250))

(assert (= (and b!131250 res!108864) b!131248))

(assert (= (and b!131250 res!108862) b!131251))

(declare-fun m!198081 () Bool)

(assert (=> b!131247 m!198081))

(declare-fun m!198083 () Bool)

(assert (=> b!131250 m!198083))

(declare-fun m!198085 () Bool)

(assert (=> b!131250 m!198085))

(declare-fun m!198087 () Bool)

(assert (=> b!131250 m!198087))

(declare-fun m!198089 () Bool)

(assert (=> b!131250 m!198089))

(declare-fun m!198091 () Bool)

(assert (=> b!131248 m!198091))

(declare-fun m!198093 () Bool)

(assert (=> b!131251 m!198093))

(declare-fun m!198095 () Bool)

(assert (=> b!131249 m!198095))

(assert (=> b!131249 m!197809))

(declare-fun m!198097 () Bool)

(assert (=> d!41787 m!198097))

(assert (=> b!131101 d!41787))

(declare-fun d!41807 () Bool)

(declare-fun lt!202550 () tuple2!11334)

(assert (=> d!41807 (= lt!202550 (readByte!0 (_1!5965 lt!202165)))))

(assert (=> d!41807 (= (readBytePure!0 (_1!5965 lt!202165)) (tuple2!11329 (_2!5968 lt!202550) (_1!5968 lt!202550)))))

(declare-fun bs!10205 () Bool)

(assert (= bs!10205 d!41807))

(declare-fun m!198103 () Bool)

(assert (=> bs!10205 m!198103))

(assert (=> b!131101 d!41807))

(declare-fun d!41811 () Bool)

(declare-fun e!86990 () Bool)

(assert (=> d!41811 e!86990))

(declare-fun res!108873 () Bool)

(assert (=> d!41811 (=> (not res!108873) (not e!86990))))

(declare-fun lt!202576 () tuple2!11328)

(declare-fun lt!202574 () tuple2!11328)

(assert (=> d!41811 (= res!108873 (= (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202576))) (currentByte!5879 (_1!5964 lt!202576)) (currentBit!5874 (_1!5964 lt!202576))) (bitIndex!0 (size!2745 (buf!3106 (_1!5964 lt!202574))) (currentByte!5879 (_1!5964 lt!202574)) (currentBit!5874 (_1!5964 lt!202574)))))))

(declare-fun lt!202575 () Unit!8104)

(declare-fun lt!202577 () BitStream!4754)

(declare-fun choose!14 (BitStream!4754 BitStream!4754 BitStream!4754 tuple2!11328 tuple2!11328 BitStream!4754 (_ BitVec 8) tuple2!11328 tuple2!11328 BitStream!4754 (_ BitVec 8)) Unit!8104)

(assert (=> d!41811 (= lt!202575 (choose!14 lt!202151 (_2!5962 lt!202155) lt!202577 lt!202576 (tuple2!11329 (_1!5964 lt!202576) (_2!5964 lt!202576)) (_1!5964 lt!202576) (_2!5964 lt!202576) lt!202574 (tuple2!11329 (_1!5964 lt!202574) (_2!5964 lt!202574)) (_1!5964 lt!202574) (_2!5964 lt!202574)))))

(assert (=> d!41811 (= lt!202574 (readBytePure!0 lt!202577))))

(assert (=> d!41811 (= lt!202576 (readBytePure!0 lt!202151))))

(assert (=> d!41811 (= lt!202577 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 lt!202151) (currentBit!5874 lt!202151)))))

(assert (=> d!41811 (= (readBytePrefixLemma!0 lt!202151 (_2!5962 lt!202155)) lt!202575)))

(declare-fun b!131260 () Bool)

(assert (=> b!131260 (= e!86990 (= (_2!5964 lt!202576) (_2!5964 lt!202574)))))

(assert (= (and d!41811 res!108873) b!131260))

(declare-fun m!198111 () Bool)

(assert (=> d!41811 m!198111))

(assert (=> d!41811 m!197787))

(declare-fun m!198113 () Bool)

(assert (=> d!41811 m!198113))

(declare-fun m!198115 () Bool)

(assert (=> d!41811 m!198115))

(declare-fun m!198117 () Bool)

(assert (=> d!41811 m!198117))

(assert (=> b!131101 d!41811))

(declare-fun d!41827 () Bool)

(declare-fun res!108874 () Bool)

(declare-fun e!86992 () Bool)

(assert (=> d!41827 (=> (not res!108874) (not e!86992))))

(assert (=> d!41827 (= res!108874 (= (size!2745 (buf!3106 thiss!1634)) (size!2745 (buf!3106 (_2!5962 lt!202155)))))))

(assert (=> d!41827 (= (isPrefixOf!0 thiss!1634 (_2!5962 lt!202155)) e!86992)))

(declare-fun b!131261 () Bool)

(declare-fun res!108876 () Bool)

(assert (=> b!131261 (=> (not res!108876) (not e!86992))))

(assert (=> b!131261 (= res!108876 (bvsle (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634)) (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155)))))))

(declare-fun b!131262 () Bool)

(declare-fun e!86991 () Bool)

(assert (=> b!131262 (= e!86992 e!86991)))

(declare-fun res!108875 () Bool)

(assert (=> b!131262 (=> res!108875 e!86991)))

(assert (=> b!131262 (= res!108875 (= (size!2745 (buf!3106 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!131263 () Bool)

(assert (=> b!131263 (= e!86991 (arrayBitRangesEq!0 (buf!3106 thiss!1634) (buf!3106 (_2!5962 lt!202155)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2745 (buf!3106 thiss!1634)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))))))

(assert (= (and d!41827 res!108874) b!131261))

(assert (= (and b!131261 res!108876) b!131262))

(assert (= (and b!131262 (not res!108875)) b!131263))

(assert (=> b!131261 m!197819))

(assert (=> b!131261 m!197807))

(assert (=> b!131263 m!197819))

(assert (=> b!131263 m!197819))

(declare-fun m!198121 () Bool)

(assert (=> b!131263 m!198121))

(assert (=> b!131101 d!41827))

(declare-fun d!41831 () Bool)

(assert (=> d!41831 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10210 () Bool)

(assert (= bs!10210 d!41831))

(declare-fun m!198123 () Bool)

(assert (=> bs!10210 m!198123))

(assert (=> b!131101 d!41831))

(declare-fun d!41833 () Bool)

(declare-fun lt!202578 () tuple2!11334)

(assert (=> d!41833 (= lt!202578 (readByte!0 lt!202151))))

(assert (=> d!41833 (= (readBytePure!0 lt!202151) (tuple2!11329 (_2!5968 lt!202578) (_1!5968 lt!202578)))))

(declare-fun bs!10211 () Bool)

(assert (= bs!10211 d!41833))

(declare-fun m!198125 () Bool)

(assert (=> bs!10211 m!198125))

(assert (=> b!131101 d!41833))

(declare-fun d!41835 () Bool)

(assert (=> d!41835 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2745 (buf!3106 (_2!5962 lt!202155)))) ((_ sign_extend 32) (currentByte!5879 thiss!1634)) ((_ sign_extend 32) (currentBit!5874 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!202605 () Unit!8104)

(declare-fun choose!26 (BitStream!4754 array!6062 (_ BitVec 32) BitStream!4754) Unit!8104)

(assert (=> d!41835 (= lt!202605 (choose!26 thiss!1634 (buf!3106 (_2!5962 lt!202155)) (bvsub to!404 from!447) (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))))))

(assert (=> d!41835 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3106 (_2!5962 lt!202155)) (bvsub to!404 from!447)) lt!202605)))

(declare-fun bs!10214 () Bool)

(assert (= bs!10214 d!41835))

(assert (=> bs!10214 m!197769))

(declare-fun m!198131 () Bool)

(assert (=> bs!10214 m!198131))

(assert (=> b!131101 d!41835))

(assert (=> b!131101 d!41731))

(declare-fun d!41841 () Bool)

(declare-fun lt!202606 () tuple2!11334)

(assert (=> d!41841 (= lt!202606 (readByte!0 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))))))

(assert (=> d!41841 (= (readBytePure!0 (BitStream!4755 (buf!3106 (_2!5962 lt!202155)) (currentByte!5879 thiss!1634) (currentBit!5874 thiss!1634))) (tuple2!11329 (_2!5968 lt!202606) (_1!5968 lt!202606)))))

(declare-fun bs!10215 () Bool)

(assert (= bs!10215 d!41841))

(declare-fun m!198143 () Bool)

(assert (=> bs!10215 m!198143))

(assert (=> b!131101 d!41841))

(declare-fun d!41843 () Bool)

(declare-fun res!108880 () Bool)

(declare-fun e!86996 () Bool)

(assert (=> d!41843 (=> (not res!108880) (not e!86996))))

(assert (=> d!41843 (= res!108880 (= (size!2745 (buf!3106 (_2!5962 lt!202164))) (size!2745 (buf!3106 (_2!5962 lt!202155)))))))

(assert (=> d!41843 (= (isPrefixOf!0 (_2!5962 lt!202164) (_2!5962 lt!202155)) e!86996)))

(declare-fun b!131269 () Bool)

(declare-fun res!108882 () Bool)

(assert (=> b!131269 (=> (not res!108882) (not e!86996))))

(assert (=> b!131269 (= res!108882 (bvsle (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164))) (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202155))) (currentByte!5879 (_2!5962 lt!202155)) (currentBit!5874 (_2!5962 lt!202155)))))))

(declare-fun b!131270 () Bool)

(declare-fun e!86995 () Bool)

(assert (=> b!131270 (= e!86996 e!86995)))

(declare-fun res!108881 () Bool)

(assert (=> b!131270 (=> res!108881 e!86995)))

(assert (=> b!131270 (= res!108881 (= (size!2745 (buf!3106 (_2!5962 lt!202164))) #b00000000000000000000000000000000))))

(declare-fun b!131271 () Bool)

(assert (=> b!131271 (= e!86995 (arrayBitRangesEq!0 (buf!3106 (_2!5962 lt!202164)) (buf!3106 (_2!5962 lt!202155)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2745 (buf!3106 (_2!5962 lt!202164))) (currentByte!5879 (_2!5962 lt!202164)) (currentBit!5874 (_2!5962 lt!202164)))))))

(assert (= (and d!41843 res!108880) b!131269))

(assert (= (and b!131269 res!108882) b!131270))

(assert (= (and b!131270 (not res!108881)) b!131271))

(assert (=> b!131269 m!197809))

(assert (=> b!131269 m!197807))

(assert (=> b!131271 m!197809))

(assert (=> b!131271 m!197809))

(declare-fun m!198157 () Bool)

(assert (=> b!131271 m!198157))

(assert (=> b!131100 d!41843))

(declare-fun d!41847 () Bool)

(assert (=> d!41847 (= (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 (_2!5962 lt!202164)))) (and (bvsge (currentBit!5874 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5874 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5879 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5879 thiss!1634) (size!2745 (buf!3106 (_2!5962 lt!202164)))) (and (= (currentBit!5874 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5879 thiss!1634) (size!2745 (buf!3106 (_2!5962 lt!202164))))))))))

(assert (=> b!131102 d!41847))

(declare-fun d!41853 () Bool)

(assert (=> d!41853 (= (invariant!0 (currentBit!5874 thiss!1634) (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634))) (and (bvsge (currentBit!5874 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!5874 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!5879 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634))) (and (= (currentBit!5874 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!5879 thiss!1634) (size!2745 (buf!3106 thiss!1634)))))))))

(assert (=> b!131091 d!41853))

(push 1)

(assert (not b!131165))

(assert (not d!41721))

(assert (not d!41783))

(assert (not b!131271))

(assert (not b!131251))

(assert (not d!41787))

(assert (not d!41723))

(assert (not b!131178))

(assert (not d!41759))

(assert (not b!131166))

(assert (not d!41807))

(assert (not b!131176))

(assert (not b!131269))

(assert (not d!41743))

(assert (not d!41753))

(assert (not b!131189))

(assert (not b!131127))

(assert (not b!131261))

(assert (not b!131201))

(assert (not d!41777))

(assert (not b!131249))

(assert (not b!131175))

(assert (not d!41749))

(assert (not d!41831))

(assert (not d!41765))

(assert (not b!131199))

(assert (not d!41833))

(assert (not b!131200))

(assert (not d!41741))

(assert (not d!41841))

(assert (not d!41717))

(assert (not d!41835))

(assert (not b!131148))

(assert (not d!41745))

(assert (not d!41775))

(assert (not d!41771))

(assert (not d!41763))

(assert (not b!131248))

(assert (not b!131146))

(assert (not b!131168))

(assert (not d!41811))

(assert (not b!131125))

(assert (not d!41731))

(assert (not b!131128))

(assert (not b!131263))

(assert (not d!41769))

(assert (not d!41773))

(assert (not b!131177))

(assert (not d!41761))

(assert (not b!131126))

(assert (not b!131154))

(assert (not b!131250))

(assert (not b!131247))

(assert (not b!131167))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

