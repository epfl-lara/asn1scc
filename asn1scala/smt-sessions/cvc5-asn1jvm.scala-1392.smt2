; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38400 () Bool)

(assert start!38400)

(declare-fun b!172412 () Bool)

(declare-fun e!120493 () Bool)

(declare-fun e!120494 () Bool)

(assert (=> b!172412 (= e!120493 e!120494)))

(declare-fun res!142815 () Bool)

(assert (=> b!172412 (=> (not res!142815) (not e!120494))))

(declare-datatypes ((array!9266 0))(
  ( (array!9267 (arr!5020 (Array (_ BitVec 32) (_ BitVec 8))) (size!4090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7288 0))(
  ( (BitStream!7289 (buf!4518 array!9266) (currentByte!8590 (_ BitVec 32)) (currentBit!8585 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12305 0))(
  ( (Unit!12306) )
))
(declare-datatypes ((tuple2!14818 0))(
  ( (tuple2!14819 (_1!8051 Unit!12305) (_2!8051 BitStream!7288)) )
))
(declare-fun lt!265448 () tuple2!14818)

(declare-fun thiss!1187 () BitStream!7288)

(assert (=> b!172412 (= res!142815 (= (size!4090 (buf!4518 (_2!8051 lt!265448))) (size!4090 (buf!4518 thiss!1187))))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7288 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14818)

(assert (=> b!172412 (= lt!265448 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172413 () Bool)

(declare-fun res!142813 () Bool)

(assert (=> b!172413 (=> (not res!142813) (not e!120493))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172413 (= res!142813 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 thiss!1187))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172414 () Bool)

(declare-fun e!120495 () Bool)

(declare-fun array_inv!3831 (array!9266) Bool)

(assert (=> b!172414 (= e!120495 (array_inv!3831 (buf!4518 thiss!1187)))))

(declare-fun b!172415 () Bool)

(declare-fun res!142814 () Bool)

(assert (=> b!172415 (=> (not res!142814) (not e!120493))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172415 (= res!142814 (invariant!0 (currentBit!8585 thiss!1187) (currentByte!8590 thiss!1187) (size!4090 (buf!4518 thiss!1187))))))

(declare-fun res!142812 () Bool)

(assert (=> start!38400 (=> (not res!142812) (not e!120493))))

(assert (=> start!38400 (= res!142812 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38400 e!120493))

(assert (=> start!38400 true))

(declare-fun inv!12 (BitStream!7288) Bool)

(assert (=> start!38400 (and (inv!12 thiss!1187) e!120495)))

(declare-fun b!172416 () Bool)

(assert (=> b!172416 (= e!120494 (not (invariant!0 (currentBit!8585 (_2!8051 lt!265448)) (currentByte!8590 (_2!8051 lt!265448)) (size!4090 (buf!4518 (_2!8051 lt!265448))))))))

(assert (= (and start!38400 res!142812) b!172413))

(assert (= (and b!172413 res!142813) b!172415))

(assert (= (and b!172415 res!142814) b!172412))

(assert (= (and b!172412 res!142815) b!172416))

(assert (= start!38400 b!172414))

(declare-fun m!271531 () Bool)

(assert (=> b!172412 m!271531))

(declare-fun m!271533 () Bool)

(assert (=> start!38400 m!271533))

(declare-fun m!271535 () Bool)

(assert (=> b!172415 m!271535))

(declare-fun m!271537 () Bool)

(assert (=> b!172414 m!271537))

(declare-fun m!271539 () Bool)

(assert (=> b!172416 m!271539))

(declare-fun m!271541 () Bool)

(assert (=> b!172413 m!271541))

(push 1)

(assert (not start!38400))

(assert (not b!172413))

(assert (not b!172415))

(assert (not b!172416))

(assert (not b!172414))

(assert (not b!172412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61113 () Bool)

(assert (=> d!61113 (= (invariant!0 (currentBit!8585 (_2!8051 lt!265448)) (currentByte!8590 (_2!8051 lt!265448)) (size!4090 (buf!4518 (_2!8051 lt!265448)))) (and (bvsge (currentBit!8585 (_2!8051 lt!265448)) #b00000000000000000000000000000000) (bvslt (currentBit!8585 (_2!8051 lt!265448)) #b00000000000000000000000000001000) (bvsge (currentByte!8590 (_2!8051 lt!265448)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8590 (_2!8051 lt!265448)) (size!4090 (buf!4518 (_2!8051 lt!265448)))) (and (= (currentBit!8585 (_2!8051 lt!265448)) #b00000000000000000000000000000000) (= (currentByte!8590 (_2!8051 lt!265448)) (size!4090 (buf!4518 (_2!8051 lt!265448))))))))))

(assert (=> b!172416 d!61113))

(declare-fun d!61119 () Bool)

(assert (=> d!61119 (= (invariant!0 (currentBit!8585 thiss!1187) (currentByte!8590 thiss!1187) (size!4090 (buf!4518 thiss!1187))) (and (bvsge (currentBit!8585 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8585 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8590 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8590 thiss!1187) (size!4090 (buf!4518 thiss!1187))) (and (= (currentBit!8585 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8590 thiss!1187) (size!4090 (buf!4518 thiss!1187)))))))))

(assert (=> b!172415 d!61119))

(declare-fun d!61121 () Bool)

(assert (=> d!61121 (= (array_inv!3831 (buf!4518 thiss!1187)) (bvsge (size!4090 (buf!4518 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172414 d!61121))

(declare-fun d!61123 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61123 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 thiss!1187))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4090 (buf!4518 thiss!1187))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15208 () Bool)

(assert (= bs!15208 d!61123))

(declare-fun m!271567 () Bool)

(assert (=> bs!15208 m!271567))

(assert (=> b!172413 d!61123))

(declare-fun d!61125 () Bool)

(declare-fun e!120572 () Bool)

(assert (=> d!61125 e!120572))

(declare-fun res!142901 () Bool)

(assert (=> d!61125 (=> (not res!142901) (not e!120572))))

(declare-fun lt!265780 () tuple2!14818)

(assert (=> d!61125 (= res!142901 (invariant!0 (currentBit!8585 (_2!8051 lt!265780)) (currentByte!8590 (_2!8051 lt!265780)) (size!4090 (buf!4518 (_2!8051 lt!265780)))))))

(declare-fun e!120571 () tuple2!14818)

(assert (=> d!61125 (= lt!265780 e!120571)))

(declare-fun c!9081 () Bool)

(assert (=> d!61125 (= c!9081 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61125 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61125 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!265780)))

(declare-fun b!172527 () Bool)

(declare-datatypes ((tuple2!14830 0))(
  ( (tuple2!14831 (_1!8057 BitStream!7288) (_2!8057 Bool)) )
))
(declare-fun lt!265752 () tuple2!14830)

(declare-fun lt!265766 () tuple2!14818)

(declare-fun readBitPure!0 (BitStream!7288) tuple2!14830)

(declare-fun readerFrom!0 (BitStream!7288 (_ BitVec 32) (_ BitVec 32)) BitStream!7288)

(assert (=> b!172527 (= lt!265752 (readBitPure!0 (readerFrom!0 (_2!8051 lt!265766) (currentBit!8585 thiss!1187) (currentByte!8590 thiss!1187))))))

(declare-fun lt!265775 () Bool)

(declare-fun res!142909 () Bool)

(assert (=> b!172527 (= res!142909 (and (= (_2!8057 lt!265752) lt!265775) (= (_1!8057 lt!265752) (_2!8051 lt!265766))))))

(declare-fun e!120573 () Bool)

(assert (=> b!172527 (=> (not res!142909) (not e!120573))))

(declare-fun e!120574 () Bool)

(assert (=> b!172527 (= e!120574 e!120573)))

(declare-fun b!172528 () Bool)

(declare-fun e!120566 () Bool)

(assert (=> b!172528 (= e!120572 e!120566)))

(declare-fun res!142906 () Bool)

(assert (=> b!172528 (=> (not res!142906) (not e!120566))))

(declare-datatypes ((tuple2!14832 0))(
  ( (tuple2!14833 (_1!8058 BitStream!7288) (_2!8058 (_ BitVec 64))) )
))
(declare-fun lt!265786 () tuple2!14832)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172528 (= res!142906 (= (_2!8058 lt!265786) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-datatypes ((tuple2!14834 0))(
  ( (tuple2!14835 (_1!8059 BitStream!7288) (_2!8059 BitStream!7288)) )
))
(declare-fun lt!265787 () tuple2!14834)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14832)

(assert (=> b!172528 (= lt!265786 (readNBitsLSBFirstsLoopPure!0 (_1!8059 lt!265787) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!265784 () Unit!12305)

(declare-fun lt!265747 () Unit!12305)

(assert (=> b!172528 (= lt!265784 lt!265747)))

(declare-fun lt!265757 () (_ BitVec 64))

(assert (=> b!172528 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 (_2!8051 lt!265780)))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) lt!265757)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7288 array!9266 (_ BitVec 64)) Unit!12305)

(assert (=> b!172528 (= lt!265747 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4518 (_2!8051 lt!265780)) lt!265757))))

(declare-fun e!120567 () Bool)

(assert (=> b!172528 e!120567))

(declare-fun res!142911 () Bool)

(assert (=> b!172528 (=> (not res!142911) (not e!120567))))

(assert (=> b!172528 (= res!142911 (and (= (size!4090 (buf!4518 thiss!1187)) (size!4090 (buf!4518 (_2!8051 lt!265780)))) (bvsge lt!265757 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172528 (= lt!265757 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!172528 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7288 BitStream!7288) tuple2!14834)

(assert (=> b!172528 (= lt!265787 (reader!0 thiss!1187 (_2!8051 lt!265780)))))

(declare-fun b!172529 () Bool)

(declare-fun e!120570 () (_ BitVec 64))

(assert (=> b!172529 (= e!120570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!172530 () Bool)

(declare-fun res!142900 () Bool)

(declare-fun isPrefixOf!0 (BitStream!7288 BitStream!7288) Bool)

(assert (=> b!172530 (= res!142900 (isPrefixOf!0 thiss!1187 (_2!8051 lt!265766)))))

(assert (=> b!172530 (=> (not res!142900) (not e!120574))))

(declare-fun b!172531 () Bool)

(declare-fun e!120569 () Bool)

(declare-fun lt!265790 () tuple2!14832)

(declare-fun lt!265743 () tuple2!14834)

(assert (=> b!172531 (= e!120569 (= (_1!8058 lt!265790) (_2!8059 lt!265743)))))

(declare-fun b!172532 () Bool)

(declare-fun res!142907 () Bool)

(assert (=> b!172532 (=> (not res!142907) (not e!120572))))

(declare-fun lt!265785 () (_ BitVec 64))

(declare-fun lt!265769 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172532 (= res!142907 (= (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265780))) (currentByte!8590 (_2!8051 lt!265780)) (currentBit!8585 (_2!8051 lt!265780))) (bvsub lt!265785 lt!265769)))))

(assert (=> b!172532 (or (= (bvand lt!265785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265769 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265785 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265785 lt!265769) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172532 (= lt!265769 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!265742 () (_ BitVec 64))

(declare-fun lt!265761 () (_ BitVec 64))

(assert (=> b!172532 (= lt!265785 (bvadd lt!265742 lt!265761))))

(assert (=> b!172532 (or (not (= (bvand lt!265742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265761 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265742 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265742 lt!265761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172532 (= lt!265761 ((_ sign_extend 32) nBits!340))))

(assert (=> b!172532 (= lt!265742 (bitIndex!0 (size!4090 (buf!4518 thiss!1187)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)))))

(declare-fun call!2846 () Bool)

(declare-fun bm!2843 () Bool)

(declare-fun lt!265744 () tuple2!14818)

(assert (=> bm!2843 (= call!2846 (isPrefixOf!0 thiss!1187 (ite c!9081 thiss!1187 (_2!8051 lt!265744))))))

(declare-fun b!172533 () Bool)

(declare-fun res!142905 () Bool)

(assert (=> b!172533 (= res!142905 (= (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265766))) (currentByte!8590 (_2!8051 lt!265766)) (currentBit!8585 (_2!8051 lt!265766))) (bvadd (bitIndex!0 (size!4090 (buf!4518 thiss!1187)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!172533 (=> (not res!142905) (not e!120574))))

(declare-fun b!172534 () Bool)

(declare-fun Unit!12311 () Unit!12305)

(assert (=> b!172534 (= e!120571 (tuple2!14819 Unit!12311 thiss!1187))))

(declare-fun lt!265746 () Unit!12305)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7288) Unit!12305)

(assert (=> b!172534 (= lt!265746 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!172534 call!2846))

(declare-fun lt!265783 () Unit!12305)

(assert (=> b!172534 (= lt!265783 lt!265746)))

(declare-fun b!172535 () Bool)

(assert (=> b!172535 (= e!120566 (= (_1!8058 lt!265786) (_2!8059 lt!265787)))))

(declare-fun b!172536 () Bool)

(assert (=> b!172536 (= e!120571 (tuple2!14819 (_1!8051 lt!265744) (_2!8051 lt!265744)))))

(assert (=> b!172536 (= lt!265775 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7288 Bool) tuple2!14818)

(assert (=> b!172536 (= lt!265766 (appendBit!0 thiss!1187 lt!265775))))

(declare-fun res!142910 () Bool)

(assert (=> b!172536 (= res!142910 (= (size!4090 (buf!4518 thiss!1187)) (size!4090 (buf!4518 (_2!8051 lt!265766)))))))

(assert (=> b!172536 (=> (not res!142910) (not e!120574))))

(assert (=> b!172536 e!120574))

(declare-fun lt!265782 () tuple2!14818)

(assert (=> b!172536 (= lt!265782 lt!265766)))

(assert (=> b!172536 (= lt!265744 (appendBitsLSBFirstLoopTR!0 (_2!8051 lt!265782) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!265754 () Unit!12305)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7288 BitStream!7288 BitStream!7288) Unit!12305)

(assert (=> b!172536 (= lt!265754 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8051 lt!265782) (_2!8051 lt!265744)))))

(assert (=> b!172536 call!2846))

(declare-fun lt!265756 () Unit!12305)

(assert (=> b!172536 (= lt!265756 lt!265754)))

(assert (=> b!172536 (invariant!0 (currentBit!8585 thiss!1187) (currentByte!8590 thiss!1187) (size!4090 (buf!4518 (_2!8051 lt!265782))))))

(declare-fun lt!265737 () BitStream!7288)

(assert (=> b!172536 (= lt!265737 (BitStream!7289 (buf!4518 (_2!8051 lt!265782)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)))))

(assert (=> b!172536 (invariant!0 (currentBit!8585 lt!265737) (currentByte!8590 lt!265737) (size!4090 (buf!4518 (_2!8051 lt!265744))))))

(declare-fun lt!265765 () BitStream!7288)

(assert (=> b!172536 (= lt!265765 (BitStream!7289 (buf!4518 (_2!8051 lt!265744)) (currentByte!8590 lt!265737) (currentBit!8585 lt!265737)))))

(declare-fun lt!265781 () tuple2!14830)

(assert (=> b!172536 (= lt!265781 (readBitPure!0 lt!265737))))

(declare-fun lt!265753 () tuple2!14830)

(assert (=> b!172536 (= lt!265753 (readBitPure!0 lt!265765))))

(declare-fun lt!265768 () Unit!12305)

(declare-fun readBitPrefixLemma!0 (BitStream!7288 BitStream!7288) Unit!12305)

(assert (=> b!172536 (= lt!265768 (readBitPrefixLemma!0 lt!265737 (_2!8051 lt!265744)))))

(declare-fun res!142903 () Bool)

(assert (=> b!172536 (= res!142903 (= (bitIndex!0 (size!4090 (buf!4518 (_1!8057 lt!265781))) (currentByte!8590 (_1!8057 lt!265781)) (currentBit!8585 (_1!8057 lt!265781))) (bitIndex!0 (size!4090 (buf!4518 (_1!8057 lt!265753))) (currentByte!8590 (_1!8057 lt!265753)) (currentBit!8585 (_1!8057 lt!265753)))))))

(declare-fun e!120568 () Bool)

(assert (=> b!172536 (=> (not res!142903) (not e!120568))))

(assert (=> b!172536 e!120568))

(declare-fun lt!265764 () Unit!12305)

(assert (=> b!172536 (= lt!265764 lt!265768)))

(declare-fun lt!265774 () tuple2!14834)

(assert (=> b!172536 (= lt!265774 (reader!0 thiss!1187 (_2!8051 lt!265744)))))

(declare-fun lt!265740 () tuple2!14834)

(assert (=> b!172536 (= lt!265740 (reader!0 (_2!8051 lt!265782) (_2!8051 lt!265744)))))

(declare-fun lt!265767 () tuple2!14830)

(assert (=> b!172536 (= lt!265767 (readBitPure!0 (_1!8059 lt!265774)))))

(assert (=> b!172536 (= (_2!8057 lt!265767) lt!265775)))

(declare-fun lt!265760 () Unit!12305)

(declare-fun Unit!12312 () Unit!12305)

(assert (=> b!172536 (= lt!265760 Unit!12312)))

(declare-fun lt!265745 () (_ BitVec 64))

(assert (=> b!172536 (= lt!265745 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!265748 () (_ BitVec 64))

(assert (=> b!172536 (= lt!265748 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!265751 () Unit!12305)

(assert (=> b!172536 (= lt!265751 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4518 (_2!8051 lt!265744)) lt!265748))))

(assert (=> b!172536 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 (_2!8051 lt!265744)))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) lt!265748)))

(declare-fun lt!265750 () Unit!12305)

(assert (=> b!172536 (= lt!265750 lt!265751)))

(declare-fun lt!265778 () tuple2!14832)

(assert (=> b!172536 (= lt!265778 (readNBitsLSBFirstsLoopPure!0 (_1!8059 lt!265774) nBits!340 #b00000000000000000000000000000000 lt!265745))))

(declare-fun lt!265762 () (_ BitVec 64))

(assert (=> b!172536 (= lt!265762 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!265736 () Unit!12305)

(assert (=> b!172536 (= lt!265736 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8051 lt!265782) (buf!4518 (_2!8051 lt!265744)) lt!265762))))

(assert (=> b!172536 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 (_2!8051 lt!265744)))) ((_ sign_extend 32) (currentByte!8590 (_2!8051 lt!265782))) ((_ sign_extend 32) (currentBit!8585 (_2!8051 lt!265782))) lt!265762)))

(declare-fun lt!265749 () Unit!12305)

(assert (=> b!172536 (= lt!265749 lt!265736)))

(declare-fun lt!265788 () tuple2!14832)

(assert (=> b!172536 (= lt!265788 (readNBitsLSBFirstsLoopPure!0 (_1!8059 lt!265740) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!265745 (ite (_2!8057 lt!265767) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!265770 () tuple2!14832)

(assert (=> b!172536 (= lt!265770 (readNBitsLSBFirstsLoopPure!0 (_1!8059 lt!265774) nBits!340 #b00000000000000000000000000000000 lt!265745))))

(declare-fun c!9080 () Bool)

(assert (=> b!172536 (= c!9080 (_2!8057 (readBitPure!0 (_1!8059 lt!265774))))))

(declare-fun lt!265739 () tuple2!14832)

(declare-fun withMovedBitIndex!0 (BitStream!7288 (_ BitVec 64)) BitStream!7288)

(assert (=> b!172536 (= lt!265739 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8059 lt!265774) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!265745 e!120570)))))

(declare-fun lt!265771 () Unit!12305)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12305)

(assert (=> b!172536 (= lt!265771 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8059 lt!265774) nBits!340 #b00000000000000000000000000000000 lt!265745))))

(assert (=> b!172536 (and (= (_2!8058 lt!265770) (_2!8058 lt!265739)) (= (_1!8058 lt!265770) (_1!8058 lt!265739)))))

(declare-fun lt!265741 () Unit!12305)

(assert (=> b!172536 (= lt!265741 lt!265771)))

(assert (=> b!172536 (= (_1!8059 lt!265774) (withMovedBitIndex!0 (_2!8059 lt!265774) (bvsub (bitIndex!0 (size!4090 (buf!4518 thiss!1187)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)) (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265744))) (currentByte!8590 (_2!8051 lt!265744)) (currentBit!8585 (_2!8051 lt!265744))))))))

(declare-fun lt!265777 () Unit!12305)

(declare-fun Unit!12314 () Unit!12305)

(assert (=> b!172536 (= lt!265777 Unit!12314)))

(assert (=> b!172536 (= (_1!8059 lt!265740) (withMovedBitIndex!0 (_2!8059 lt!265740) (bvsub (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265782))) (currentByte!8590 (_2!8051 lt!265782)) (currentBit!8585 (_2!8051 lt!265782))) (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265744))) (currentByte!8590 (_2!8051 lt!265744)) (currentBit!8585 (_2!8051 lt!265744))))))))

(declare-fun lt!265735 () Unit!12305)

(declare-fun Unit!12315 () Unit!12305)

(assert (=> b!172536 (= lt!265735 Unit!12315)))

(assert (=> b!172536 (= (bitIndex!0 (size!4090 (buf!4518 thiss!1187)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)) (bvsub (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265782))) (currentByte!8590 (_2!8051 lt!265782)) (currentBit!8585 (_2!8051 lt!265782))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!265772 () Unit!12305)

(declare-fun Unit!12316 () Unit!12305)

(assert (=> b!172536 (= lt!265772 Unit!12316)))

(assert (=> b!172536 (= (_2!8058 lt!265778) (_2!8058 lt!265788))))

(declare-fun lt!265773 () Unit!12305)

(declare-fun Unit!12317 () Unit!12305)

(assert (=> b!172536 (= lt!265773 Unit!12317)))

(assert (=> b!172536 (invariant!0 (currentBit!8585 (_2!8051 lt!265744)) (currentByte!8590 (_2!8051 lt!265744)) (size!4090 (buf!4518 (_2!8051 lt!265744))))))

(declare-fun lt!265763 () Unit!12305)

(declare-fun Unit!12318 () Unit!12305)

(assert (=> b!172536 (= lt!265763 Unit!12318)))

(assert (=> b!172536 (= (size!4090 (buf!4518 thiss!1187)) (size!4090 (buf!4518 (_2!8051 lt!265744))))))

(declare-fun lt!265738 () Unit!12305)

(declare-fun Unit!12319 () Unit!12305)

(assert (=> b!172536 (= lt!265738 Unit!12319)))

(assert (=> b!172536 (= (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265744))) (currentByte!8590 (_2!8051 lt!265744)) (currentBit!8585 (_2!8051 lt!265744))) (bvsub (bvadd (bitIndex!0 (size!4090 (buf!4518 thiss!1187)) (currentByte!8590 thiss!1187) (currentBit!8585 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!265776 () Unit!12305)

(declare-fun Unit!12321 () Unit!12305)

(assert (=> b!172536 (= lt!265776 Unit!12321)))

(declare-fun lt!265779 () Unit!12305)

(declare-fun Unit!12322 () Unit!12305)

(assert (=> b!172536 (= lt!265779 Unit!12322)))

(assert (=> b!172536 (= lt!265743 (reader!0 thiss!1187 (_2!8051 lt!265744)))))

(declare-fun lt!265759 () (_ BitVec 64))

(assert (=> b!172536 (= lt!265759 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!265789 () Unit!12305)

(assert (=> b!172536 (= lt!265789 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4518 (_2!8051 lt!265744)) lt!265759))))

(assert (=> b!172536 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 (_2!8051 lt!265744)))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) lt!265759)))

(declare-fun lt!265758 () Unit!12305)

(assert (=> b!172536 (= lt!265758 lt!265789)))

(assert (=> b!172536 (= lt!265790 (readNBitsLSBFirstsLoopPure!0 (_1!8059 lt!265743) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!142908 () Bool)

(assert (=> b!172536 (= res!142908 (= (_2!8058 lt!265790) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!172536 (=> (not res!142908) (not e!120569))))

(assert (=> b!172536 e!120569))

(declare-fun lt!265755 () Unit!12305)

(declare-fun Unit!12326 () Unit!12305)

(assert (=> b!172536 (= lt!265755 Unit!12326)))

(declare-fun b!172537 () Bool)

(declare-fun res!142904 () Bool)

(assert (=> b!172537 (=> (not res!142904) (not e!120572))))

(assert (=> b!172537 (= res!142904 (= (size!4090 (buf!4518 thiss!1187)) (size!4090 (buf!4518 (_2!8051 lt!265780)))))))

(declare-fun b!172538 () Bool)

(assert (=> b!172538 (= e!120570 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!172539 () Bool)

(assert (=> b!172539 (= e!120573 (= (bitIndex!0 (size!4090 (buf!4518 (_1!8057 lt!265752))) (currentByte!8590 (_1!8057 lt!265752)) (currentBit!8585 (_1!8057 lt!265752))) (bitIndex!0 (size!4090 (buf!4518 (_2!8051 lt!265766))) (currentByte!8590 (_2!8051 lt!265766)) (currentBit!8585 (_2!8051 lt!265766)))))))

(declare-fun b!172540 () Bool)

(declare-fun res!142902 () Bool)

(assert (=> b!172540 (=> (not res!142902) (not e!120572))))

(assert (=> b!172540 (= res!142902 (isPrefixOf!0 thiss!1187 (_2!8051 lt!265780)))))

(declare-fun b!172541 () Bool)

(assert (=> b!172541 (= e!120567 (validate_offset_bits!1 ((_ sign_extend 32) (size!4090 (buf!4518 thiss!1187))) ((_ sign_extend 32) (currentByte!8590 thiss!1187)) ((_ sign_extend 32) (currentBit!8585 thiss!1187)) lt!265757))))

(declare-fun b!172542 () Bool)

(assert (=> b!172542 (= e!120568 (= (_2!8057 lt!265781) (_2!8057 lt!265753)))))

(assert (= (and d!61125 c!9081) b!172534))

(assert (= (and d!61125 (not c!9081)) b!172536))

(assert (= (and b!172536 res!142910) b!172533))

(assert (= (and b!172533 res!142905) b!172530))

(assert (= (and b!172530 res!142900) b!172527))

(assert (= (and b!172527 res!142909) b!172539))

(assert (= (and b!172536 res!142903) b!172542))

(assert (= (and b!172536 c!9080) b!172538))

(assert (= (and b!172536 (not c!9080)) b!172529))

(assert (= (and b!172536 res!142908) b!172531))

(assert (= (or b!172534 b!172536) bm!2843))

(assert (= (and d!61125 res!142901) b!172537))

(assert (= (and b!172537 res!142904) b!172532))

(assert (= (and b!172532 res!142907) b!172540))

(assert (= (and b!172540 res!142902) b!172528))

(assert (= (and b!172528 res!142911) b!172541))

(assert (= (and b!172528 res!142906) b!172535))

(declare-fun m!271667 () Bool)

(assert (=> d!61125 m!271667))

(declare-fun m!271669 () Bool)

(assert (=> b!172533 m!271669))

(declare-fun m!271671 () Bool)

(assert (=> b!172533 m!271671))

(declare-fun m!271673 () Bool)

(assert (=> b!172532 m!271673))

(assert (=> b!172532 m!271671))

(declare-fun m!271675 () Bool)

(assert (=> b!172541 m!271675))

(declare-fun m!271677 () Bool)

(assert (=> b!172530 m!271677))

(declare-fun m!271679 () Bool)

(assert (=> b!172536 m!271679))

(declare-fun m!271681 () Bool)

(assert (=> b!172536 m!271681))

(declare-fun m!271683 () Bool)

(assert (=> b!172536 m!271683))

(declare-fun m!271685 () Bool)

(assert (=> b!172536 m!271685))

(declare-fun m!271687 () Bool)

(assert (=> b!172536 m!271687))

(declare-fun m!271689 () Bool)

(assert (=> b!172536 m!271689))

(declare-fun m!271691 () Bool)

(assert (=> b!172536 m!271691))

(declare-fun m!271693 () Bool)

(assert (=> b!172536 m!271693))

(declare-fun m!271695 () Bool)

(assert (=> b!172536 m!271695))

(declare-fun m!271697 () Bool)

(assert (=> b!172536 m!271697))

(declare-fun m!271699 () Bool)

(assert (=> b!172536 m!271699))

(declare-fun m!271701 () Bool)

(assert (=> b!172536 m!271701))

(declare-fun m!271703 () Bool)

(assert (=> b!172536 m!271703))

(declare-fun m!271705 () Bool)

(assert (=> b!172536 m!271705))

(declare-fun m!271707 () Bool)

(assert (=> b!172536 m!271707))

(declare-fun m!271711 () Bool)

(assert (=> b!172536 m!271711))

(declare-fun m!271713 () Bool)

(assert (=> b!172536 m!271713))

(assert (=> b!172536 m!271671))

(declare-fun m!271715 () Bool)

(assert (=> b!172536 m!271715))

(declare-fun m!271717 () Bool)

(assert (=> b!172536 m!271717))

(declare-fun m!271719 () Bool)

(assert (=> b!172536 m!271719))

(declare-fun m!271721 () Bool)

(assert (=> b!172536 m!271721))

(declare-fun m!271723 () Bool)

(assert (=> b!172536 m!271723))

(declare-fun m!271725 () Bool)

(assert (=> b!172536 m!271725))

(declare-fun m!271727 () Bool)

(assert (=> b!172536 m!271727))

(declare-fun m!271729 () Bool)

(assert (=> b!172536 m!271729))

(declare-fun m!271731 () Bool)

(assert (=> b!172536 m!271731))

(declare-fun m!271733 () Bool)

(assert (=> b!172536 m!271733))

(declare-fun m!271735 () Bool)

(assert (=> b!172536 m!271735))

(declare-fun m!271737 () Bool)

(assert (=> b!172536 m!271737))

(assert (=> b!172536 m!271685))

(declare-fun m!271739 () Bool)

(assert (=> b!172536 m!271739))

(declare-fun m!271741 () Bool)

(assert (=> b!172536 m!271741))

(declare-fun m!271743 () Bool)

(assert (=> b!172536 m!271743))

(declare-fun m!271745 () Bool)

(assert (=> b!172527 m!271745))

(assert (=> b!172527 m!271745))

(declare-fun m!271747 () Bool)

(assert (=> b!172527 m!271747))

(declare-fun m!271749 () Bool)

(assert (=> b!172534 m!271749))

(declare-fun m!271751 () Bool)

(assert (=> b!172540 m!271751))

(declare-fun m!271753 () Bool)

(assert (=> bm!2843 m!271753))

(declare-fun m!271755 () Bool)

(assert (=> b!172539 m!271755))

(assert (=> b!172539 m!271669))

(assert (=> b!172528 m!271715))

(assert (=> b!172528 m!271717))

(declare-fun m!271757 () Bool)

(assert (=> b!172528 m!271757))

(declare-fun m!271759 () Bool)

(assert (=> b!172528 m!271759))

(declare-fun m!271761 () Bool)

(assert (=> b!172528 m!271761))

(declare-fun m!271763 () Bool)

(assert (=> b!172528 m!271763))

(assert (=> b!172412 d!61125))

(declare-fun d!61145 () Bool)

(assert (=> d!61145 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8585 thiss!1187) (currentByte!8590 thiss!1187) (size!4090 (buf!4518 thiss!1187))))))

(declare-fun bs!15213 () Bool)

(assert (= bs!15213 d!61145))

(assert (=> bs!15213 m!271535))

(assert (=> start!38400 d!61145))

(push 1)

(assert (not b!172536))

(assert (not bm!2843))

(assert (not b!172528))

(assert (not d!61123))

(assert (not b!172540))

(assert (not b!172530))

(assert (not b!172539))

(assert (not d!61145))

(assert (not b!172532))

(assert (not b!172527))

(assert (not b!172534))

(assert (not b!172533))

(assert (not b!172541))

(assert (not d!61125))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

