; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38404 () Bool)

(assert start!38404)

(declare-fun b!172442 () Bool)

(declare-fun res!142839 () Bool)

(declare-fun e!120518 () Bool)

(assert (=> b!172442 (=> (not res!142839) (not e!120518))))

(declare-datatypes ((array!9270 0))(
  ( (array!9271 (arr!5022 (Array (_ BitVec 32) (_ BitVec 8))) (size!4092 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7292 0))(
  ( (BitStream!7293 (buf!4520 array!9270) (currentByte!8592 (_ BitVec 32)) (currentBit!8587 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7292)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!172442 (= res!142839 (invariant!0 (currentBit!8587 thiss!1187) (currentByte!8592 thiss!1187) (size!4092 (buf!4520 thiss!1187))))))

(declare-fun b!172443 () Bool)

(declare-fun res!142838 () Bool)

(assert (=> b!172443 (=> (not res!142838) (not e!120518))))

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!172443 (= res!142838 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 thiss!1187))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!172444 () Bool)

(declare-fun e!120519 () Bool)

(declare-datatypes ((Unit!12309 0))(
  ( (Unit!12310) )
))
(declare-datatypes ((tuple2!14822 0))(
  ( (tuple2!14823 (_1!8053 Unit!12309) (_2!8053 BitStream!7292)) )
))
(declare-fun lt!265454 () tuple2!14822)

(assert (=> b!172444 (= e!120519 (not (invariant!0 (currentBit!8587 (_2!8053 lt!265454)) (currentByte!8592 (_2!8053 lt!265454)) (size!4092 (buf!4520 (_2!8053 lt!265454))))))))

(declare-fun b!172445 () Bool)

(assert (=> b!172445 (= e!120518 e!120519)))

(declare-fun res!142836 () Bool)

(assert (=> b!172445 (=> (not res!142836) (not e!120519))))

(assert (=> b!172445 (= res!142836 (= (size!4092 (buf!4520 (_2!8053 lt!265454))) (size!4092 (buf!4520 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7292 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14822)

(assert (=> b!172445 (= lt!265454 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun b!172446 () Bool)

(declare-fun e!120517 () Bool)

(declare-fun array_inv!3833 (array!9270) Bool)

(assert (=> b!172446 (= e!120517 (array_inv!3833 (buf!4520 thiss!1187)))))

(declare-fun res!142837 () Bool)

(assert (=> start!38404 (=> (not res!142837) (not e!120518))))

(assert (=> start!38404 (= res!142837 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38404 e!120518))

(assert (=> start!38404 true))

(declare-fun inv!12 (BitStream!7292) Bool)

(assert (=> start!38404 (and (inv!12 thiss!1187) e!120517)))

(assert (= (and start!38404 res!142837) b!172443))

(assert (= (and b!172443 res!142838) b!172442))

(assert (= (and b!172442 res!142839) b!172445))

(assert (= (and b!172445 res!142836) b!172444))

(assert (= start!38404 b!172446))

(declare-fun m!271555 () Bool)

(assert (=> b!172443 m!271555))

(declare-fun m!271557 () Bool)

(assert (=> b!172442 m!271557))

(declare-fun m!271559 () Bool)

(assert (=> b!172446 m!271559))

(declare-fun m!271561 () Bool)

(assert (=> start!38404 m!271561))

(declare-fun m!271563 () Bool)

(assert (=> b!172445 m!271563))

(declare-fun m!271565 () Bool)

(assert (=> b!172444 m!271565))

(push 1)

(assert (not b!172445))

(assert (not start!38404))

(assert (not b!172442))

(assert (not b!172446))

(assert (not b!172443))

(assert (not b!172444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61115 () Bool)

(assert (=> d!61115 (= (array_inv!3833 (buf!4520 thiss!1187)) (bvsge (size!4092 (buf!4520 thiss!1187)) #b00000000000000000000000000000000))))

(assert (=> b!172446 d!61115))

(declare-fun b!172511 () Bool)

(declare-fun e!120564 () Bool)

(declare-fun lt!265731 () (_ BitVec 64))

(assert (=> b!172511 (= e!120564 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 thiss!1187))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) lt!265731))))

(declare-fun b!172512 () Bool)

(declare-datatypes ((tuple2!14824 0))(
  ( (tuple2!14825 (_1!8054 BitStream!7292) (_2!8054 Bool)) )
))
(declare-fun lt!265697 () tuple2!14824)

(declare-fun lt!265693 () tuple2!14822)

(declare-fun readBitPure!0 (BitStream!7292) tuple2!14824)

(declare-fun readerFrom!0 (BitStream!7292 (_ BitVec 32) (_ BitVec 32)) BitStream!7292)

(assert (=> b!172512 (= lt!265697 (readBitPure!0 (readerFrom!0 (_2!8053 lt!265693) (currentBit!8587 thiss!1187) (currentByte!8592 thiss!1187))))))

(declare-fun lt!265706 () Bool)

(declare-fun res!142896 () Bool)

(assert (=> b!172512 (= res!142896 (and (= (_2!8054 lt!265697) lt!265706) (= (_1!8054 lt!265697) (_2!8053 lt!265693))))))

(declare-fun e!120559 () Bool)

(assert (=> b!172512 (=> (not res!142896) (not e!120559))))

(declare-fun e!120562 () Bool)

(assert (=> b!172512 (= e!120562 e!120559)))

(declare-fun b!172513 () Bool)

(declare-fun e!120560 () Bool)

(declare-datatypes ((tuple2!14826 0))(
  ( (tuple2!14827 (_1!8055 BitStream!7292) (_2!8055 (_ BitVec 64))) )
))
(declare-fun lt!265705 () tuple2!14826)

(declare-datatypes ((tuple2!14828 0))(
  ( (tuple2!14829 (_1!8056 BitStream!7292) (_2!8056 BitStream!7292)) )
))
(declare-fun lt!265726 () tuple2!14828)

(assert (=> b!172513 (= e!120560 (= (_1!8055 lt!265705) (_2!8056 lt!265726)))))

(declare-fun b!172514 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172514 (= e!120559 (= (bitIndex!0 (size!4092 (buf!4520 (_1!8054 lt!265697))) (currentByte!8592 (_1!8054 lt!265697)) (currentBit!8587 (_1!8054 lt!265697))) (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265693))) (currentByte!8592 (_2!8053 lt!265693)) (currentBit!8587 (_2!8053 lt!265693)))))))

(declare-fun b!172516 () Bool)

(declare-fun res!142890 () Bool)

(declare-fun e!120557 () Bool)

(assert (=> b!172516 (=> (not res!142890) (not e!120557))))

(declare-fun lt!265689 () tuple2!14822)

(declare-fun isPrefixOf!0 (BitStream!7292 BitStream!7292) Bool)

(assert (=> b!172516 (= res!142890 (isPrefixOf!0 thiss!1187 (_2!8053 lt!265689)))))

(declare-fun b!172517 () Bool)

(declare-fun res!142889 () Bool)

(assert (=> b!172517 (=> (not res!142889) (not e!120557))))

(declare-fun lt!265712 () (_ BitVec 64))

(declare-fun lt!265686 () (_ BitVec 64))

(assert (=> b!172517 (= res!142889 (= (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265689))) (currentByte!8592 (_2!8053 lt!265689)) (currentBit!8587 (_2!8053 lt!265689))) (bvsub lt!265712 lt!265686)))))

(assert (=> b!172517 (or (= (bvand lt!265712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!265712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!265712 lt!265686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172517 (= lt!265686 ((_ sign_extend 32) #b00000000000000000000000000000000))))

(declare-fun lt!265700 () (_ BitVec 64))

(declare-fun lt!265719 () (_ BitVec 64))

(assert (=> b!172517 (= lt!265712 (bvadd lt!265700 lt!265719))))

(assert (=> b!172517 (or (not (= (bvand lt!265700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!265719 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!265700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!265700 lt!265719) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172517 (= lt!265719 ((_ sign_extend 32) nBits!340))))

(assert (=> b!172517 (= lt!265700 (bitIndex!0 (size!4092 (buf!4520 thiss!1187)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)))))

(declare-fun b!172518 () Bool)

(declare-fun e!120561 () Bool)

(assert (=> b!172518 (= e!120557 e!120561)))

(declare-fun res!142891 () Bool)

(assert (=> b!172518 (=> (not res!142891) (not e!120561))))

(declare-fun lt!265713 () tuple2!14826)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!172518 (= res!142891 (= (_2!8055 lt!265713) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(declare-fun lt!265690 () tuple2!14828)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!14826)

(assert (=> b!172518 (= lt!265713 (readNBitsLSBFirstsLoopPure!0 (_1!8056 lt!265690) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun lt!265704 () Unit!12309)

(declare-fun lt!265721 () Unit!12309)

(assert (=> b!172518 (= lt!265704 lt!265721)))

(assert (=> b!172518 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 (_2!8053 lt!265689)))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) lt!265731)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7292 array!9270 (_ BitVec 64)) Unit!12309)

(assert (=> b!172518 (= lt!265721 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4520 (_2!8053 lt!265689)) lt!265731))))

(assert (=> b!172518 e!120564))

(declare-fun res!142894 () Bool)

(assert (=> b!172518 (=> (not res!142894) (not e!120564))))

(assert (=> b!172518 (= res!142894 (and (= (size!4092 (buf!4520 thiss!1187)) (size!4092 (buf!4520 (_2!8053 lt!265689)))) (bvsge lt!265731 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!172518 (= lt!265731 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(assert (=> b!172518 (or (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!340 #b10000000000000000000000000000000) (bvand (bvsub nBits!340 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!7292 BitStream!7292) tuple2!14828)

(assert (=> b!172518 (= lt!265690 (reader!0 thiss!1187 (_2!8053 lt!265689)))))

(declare-fun b!172519 () Bool)

(assert (=> b!172519 (= e!120561 (= (_1!8055 lt!265713) (_2!8056 lt!265690)))))

(declare-fun b!172520 () Bool)

(declare-fun res!142888 () Bool)

(assert (=> b!172520 (= res!142888 (isPrefixOf!0 thiss!1187 (_2!8053 lt!265693)))))

(assert (=> b!172520 (=> (not res!142888) (not e!120562))))

(declare-fun b!172521 () Bool)

(declare-fun e!120565 () (_ BitVec 64))

(assert (=> b!172521 (= e!120565 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!172522 () Bool)

(declare-fun e!120558 () tuple2!14822)

(declare-fun lt!265709 () tuple2!14822)

(assert (=> b!172522 (= e!120558 (tuple2!14823 (_1!8053 lt!265709) (_2!8053 lt!265709)))))

(assert (=> b!172522 (= lt!265706 (not (= (bvand v!186 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!7292 Bool) tuple2!14822)

(assert (=> b!172522 (= lt!265693 (appendBit!0 thiss!1187 lt!265706))))

(declare-fun res!142892 () Bool)

(assert (=> b!172522 (= res!142892 (= (size!4092 (buf!4520 thiss!1187)) (size!4092 (buf!4520 (_2!8053 lt!265693)))))))

(assert (=> b!172522 (=> (not res!142892) (not e!120562))))

(assert (=> b!172522 e!120562))

(declare-fun lt!265682 () tuple2!14822)

(assert (=> b!172522 (= lt!265682 lt!265693)))

(assert (=> b!172522 (= lt!265709 (appendBitsLSBFirstLoopTR!0 (_2!8053 lt!265682) v!186 nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!265694 () Unit!12309)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7292 BitStream!7292 BitStream!7292) Unit!12309)

(assert (=> b!172522 (= lt!265694 (lemmaIsPrefixTransitive!0 thiss!1187 (_2!8053 lt!265682) (_2!8053 lt!265709)))))

(declare-fun call!2845 () Bool)

(assert (=> b!172522 call!2845))

(declare-fun lt!265722 () Unit!12309)

(assert (=> b!172522 (= lt!265722 lt!265694)))

(assert (=> b!172522 (invariant!0 (currentBit!8587 thiss!1187) (currentByte!8592 thiss!1187) (size!4092 (buf!4520 (_2!8053 lt!265682))))))

(declare-fun lt!265703 () BitStream!7292)

(assert (=> b!172522 (= lt!265703 (BitStream!7293 (buf!4520 (_2!8053 lt!265682)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)))))

(assert (=> b!172522 (invariant!0 (currentBit!8587 lt!265703) (currentByte!8592 lt!265703) (size!4092 (buf!4520 (_2!8053 lt!265709))))))

(declare-fun lt!265715 () BitStream!7292)

(assert (=> b!172522 (= lt!265715 (BitStream!7293 (buf!4520 (_2!8053 lt!265709)) (currentByte!8592 lt!265703) (currentBit!8587 lt!265703)))))

(declare-fun lt!265718 () tuple2!14824)

(assert (=> b!172522 (= lt!265718 (readBitPure!0 lt!265703))))

(declare-fun lt!265725 () tuple2!14824)

(assert (=> b!172522 (= lt!265725 (readBitPure!0 lt!265715))))

(declare-fun lt!265688 () Unit!12309)

(declare-fun readBitPrefixLemma!0 (BitStream!7292 BitStream!7292) Unit!12309)

(assert (=> b!172522 (= lt!265688 (readBitPrefixLemma!0 lt!265703 (_2!8053 lt!265709)))))

(declare-fun res!142898 () Bool)

(assert (=> b!172522 (= res!142898 (= (bitIndex!0 (size!4092 (buf!4520 (_1!8054 lt!265718))) (currentByte!8592 (_1!8054 lt!265718)) (currentBit!8587 (_1!8054 lt!265718))) (bitIndex!0 (size!4092 (buf!4520 (_1!8054 lt!265725))) (currentByte!8592 (_1!8054 lt!265725)) (currentBit!8587 (_1!8054 lt!265725)))))))

(declare-fun e!120563 () Bool)

(assert (=> b!172522 (=> (not res!142898) (not e!120563))))

(assert (=> b!172522 e!120563))

(declare-fun lt!265727 () Unit!12309)

(assert (=> b!172522 (= lt!265727 lt!265688)))

(declare-fun lt!265714 () tuple2!14828)

(assert (=> b!172522 (= lt!265714 (reader!0 thiss!1187 (_2!8053 lt!265709)))))

(declare-fun lt!265710 () tuple2!14828)

(assert (=> b!172522 (= lt!265710 (reader!0 (_2!8053 lt!265682) (_2!8053 lt!265709)))))

(declare-fun lt!265685 () tuple2!14824)

(assert (=> b!172522 (= lt!265685 (readBitPure!0 (_1!8056 lt!265714)))))

(assert (=> b!172522 (= (_2!8054 lt!265685) lt!265706)))

(declare-fun lt!265692 () Unit!12309)

(declare-fun Unit!12313 () Unit!12309)

(assert (=> b!172522 (= lt!265692 Unit!12313)))

(declare-fun lt!265679 () (_ BitVec 64))

(assert (=> b!172522 (= lt!265679 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000)))))

(declare-fun lt!265717 () (_ BitVec 64))

(assert (=> b!172522 (= lt!265717 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!265716 () Unit!12309)

(assert (=> b!172522 (= lt!265716 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4520 (_2!8053 lt!265709)) lt!265717))))

(assert (=> b!172522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 (_2!8053 lt!265709)))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) lt!265717)))

(declare-fun lt!265724 () Unit!12309)

(assert (=> b!172522 (= lt!265724 lt!265716)))

(declare-fun lt!265733 () tuple2!14826)

(assert (=> b!172522 (= lt!265733 (readNBitsLSBFirstsLoopPure!0 (_1!8056 lt!265714) nBits!340 #b00000000000000000000000000000000 lt!265679))))

(declare-fun lt!265708 () (_ BitVec 64))

(assert (=> b!172522 (= lt!265708 ((_ sign_extend 32) (bvsub (bvsub nBits!340 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!265732 () Unit!12309)

(assert (=> b!172522 (= lt!265732 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8053 lt!265682) (buf!4520 (_2!8053 lt!265709)) lt!265708))))

(assert (=> b!172522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 (_2!8053 lt!265709)))) ((_ sign_extend 32) (currentByte!8592 (_2!8053 lt!265682))) ((_ sign_extend 32) (currentBit!8587 (_2!8053 lt!265682))) lt!265708)))

(declare-fun lt!265681 () Unit!12309)

(assert (=> b!172522 (= lt!265681 lt!265732)))

(declare-fun lt!265707 () tuple2!14826)

(assert (=> b!172522 (= lt!265707 (readNBitsLSBFirstsLoopPure!0 (_1!8056 lt!265710) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!265679 (ite (_2!8054 lt!265685) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!265720 () tuple2!14826)

(assert (=> b!172522 (= lt!265720 (readNBitsLSBFirstsLoopPure!0 (_1!8056 lt!265714) nBits!340 #b00000000000000000000000000000000 lt!265679))))

(declare-fun c!9078 () Bool)

(assert (=> b!172522 (= c!9078 (_2!8054 (readBitPure!0 (_1!8056 lt!265714))))))

(declare-fun lt!265730 () tuple2!14826)

(declare-fun withMovedBitIndex!0 (BitStream!7292 (_ BitVec 64)) BitStream!7292)

(assert (=> b!172522 (= lt!265730 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8056 lt!265714) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!265679 e!120565)))))

(declare-fun lt!265684 () Unit!12309)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!12309)

(assert (=> b!172522 (= lt!265684 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8056 lt!265714) nBits!340 #b00000000000000000000000000000000 lt!265679))))

(assert (=> b!172522 (and (= (_2!8055 lt!265720) (_2!8055 lt!265730)) (= (_1!8055 lt!265720) (_1!8055 lt!265730)))))

(declare-fun lt!265699 () Unit!12309)

(assert (=> b!172522 (= lt!265699 lt!265684)))

(assert (=> b!172522 (= (_1!8056 lt!265714) (withMovedBitIndex!0 (_2!8056 lt!265714) (bvsub (bitIndex!0 (size!4092 (buf!4520 thiss!1187)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)) (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265709))) (currentByte!8592 (_2!8053 lt!265709)) (currentBit!8587 (_2!8053 lt!265709))))))))

(declare-fun lt!265702 () Unit!12309)

(declare-fun Unit!12320 () Unit!12309)

(assert (=> b!172522 (= lt!265702 Unit!12320)))

(assert (=> b!172522 (= (_1!8056 lt!265710) (withMovedBitIndex!0 (_2!8056 lt!265710) (bvsub (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265682))) (currentByte!8592 (_2!8053 lt!265682)) (currentBit!8587 (_2!8053 lt!265682))) (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265709))) (currentByte!8592 (_2!8053 lt!265709)) (currentBit!8587 (_2!8053 lt!265709))))))))

(declare-fun lt!265687 () Unit!12309)

(declare-fun Unit!12323 () Unit!12309)

(assert (=> b!172522 (= lt!265687 Unit!12323)))

(assert (=> b!172522 (= (bitIndex!0 (size!4092 (buf!4520 thiss!1187)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)) (bvsub (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265682))) (currentByte!8592 (_2!8053 lt!265682)) (currentBit!8587 (_2!8053 lt!265682))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!265691 () Unit!12309)

(declare-fun Unit!12324 () Unit!12309)

(assert (=> b!172522 (= lt!265691 Unit!12324)))

(assert (=> b!172522 (= (_2!8055 lt!265733) (_2!8055 lt!265707))))

(declare-fun lt!265711 () Unit!12309)

(declare-fun Unit!12325 () Unit!12309)

(assert (=> b!172522 (= lt!265711 Unit!12325)))

(assert (=> b!172522 (invariant!0 (currentBit!8587 (_2!8053 lt!265709)) (currentByte!8592 (_2!8053 lt!265709)) (size!4092 (buf!4520 (_2!8053 lt!265709))))))

(declare-fun lt!265734 () Unit!12309)

(declare-fun Unit!12327 () Unit!12309)

(assert (=> b!172522 (= lt!265734 Unit!12327)))

(assert (=> b!172522 (= (size!4092 (buf!4520 thiss!1187)) (size!4092 (buf!4520 (_2!8053 lt!265709))))))

(declare-fun lt!265695 () Unit!12309)

(declare-fun Unit!12328 () Unit!12309)

(assert (=> b!172522 (= lt!265695 Unit!12328)))

(assert (=> b!172522 (= (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265709))) (currentByte!8592 (_2!8053 lt!265709)) (currentBit!8587 (_2!8053 lt!265709))) (bvsub (bvadd (bitIndex!0 (size!4092 (buf!4520 thiss!1187)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)) ((_ sign_extend 32) nBits!340)) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!265683 () Unit!12309)

(declare-fun Unit!12329 () Unit!12309)

(assert (=> b!172522 (= lt!265683 Unit!12329)))

(declare-fun lt!265696 () Unit!12309)

(declare-fun Unit!12330 () Unit!12309)

(assert (=> b!172522 (= lt!265696 Unit!12330)))

(assert (=> b!172522 (= lt!265726 (reader!0 thiss!1187 (_2!8053 lt!265709)))))

(declare-fun lt!265698 () (_ BitVec 64))

(assert (=> b!172522 (= lt!265698 ((_ sign_extend 32) (bvsub nBits!340 #b00000000000000000000000000000000)))))

(declare-fun lt!265723 () Unit!12309)

(assert (=> b!172522 (= lt!265723 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1187 (buf!4520 (_2!8053 lt!265709)) lt!265698))))

(assert (=> b!172522 (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 (_2!8053 lt!265709)))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) lt!265698)))

(declare-fun lt!265680 () Unit!12309)

(assert (=> b!172522 (= lt!265680 lt!265723)))

(assert (=> b!172522 (= lt!265705 (readNBitsLSBFirstsLoopPure!0 (_1!8056 lt!265726) nBits!340 #b00000000000000000000000000000000 (bvand v!186 (onesLSBLong!0 #b00000000000000000000000000000000))))))

(declare-fun res!142895 () Bool)

(assert (=> b!172522 (= res!142895 (= (_2!8055 lt!265705) (bvand v!186 (onesLSBLong!0 nBits!340))))))

(assert (=> b!172522 (=> (not res!142895) (not e!120560))))

(assert (=> b!172522 e!120560))

(declare-fun lt!265728 () Unit!12309)

(declare-fun Unit!12331 () Unit!12309)

(assert (=> b!172522 (= lt!265728 Unit!12331)))

(declare-fun b!172523 () Bool)

(declare-fun res!142893 () Bool)

(assert (=> b!172523 (=> (not res!142893) (not e!120557))))

(assert (=> b!172523 (= res!142893 (= (size!4092 (buf!4520 thiss!1187)) (size!4092 (buf!4520 (_2!8053 lt!265689)))))))

(declare-fun bm!2842 () Bool)

(declare-fun c!9079 () Bool)

(assert (=> bm!2842 (= call!2845 (isPrefixOf!0 thiss!1187 (ite c!9079 thiss!1187 (_2!8053 lt!265709))))))

(declare-fun b!172524 () Bool)

(declare-fun res!142899 () Bool)

(assert (=> b!172524 (= res!142899 (= (bitIndex!0 (size!4092 (buf!4520 (_2!8053 lt!265693))) (currentByte!8592 (_2!8053 lt!265693)) (currentBit!8587 (_2!8053 lt!265693))) (bvadd (bitIndex!0 (size!4092 (buf!4520 thiss!1187)) (currentByte!8592 thiss!1187) (currentBit!8587 thiss!1187)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!172524 (=> (not res!142899) (not e!120562))))

(declare-fun d!61117 () Bool)

(assert (=> d!61117 e!120557))

(declare-fun res!142897 () Bool)

(assert (=> d!61117 (=> (not res!142897) (not e!120557))))

(assert (=> d!61117 (= res!142897 (invariant!0 (currentBit!8587 (_2!8053 lt!265689)) (currentByte!8592 (_2!8053 lt!265689)) (size!4092 (buf!4520 (_2!8053 lt!265689)))))))

(assert (=> d!61117 (= lt!265689 e!120558)))

(assert (=> d!61117 (= c!9079 (= #b00000000000000000000000000000000 nBits!340))))

(assert (=> d!61117 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000))))

(assert (=> d!61117 (= (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000) lt!265689)))

(declare-fun b!172515 () Bool)

(assert (=> b!172515 (= e!120563 (= (_2!8054 lt!265718) (_2!8054 lt!265725)))))

(declare-fun b!172525 () Bool)

(assert (=> b!172525 (= e!120565 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun b!172526 () Bool)

(declare-fun Unit!12332 () Unit!12309)

(assert (=> b!172526 (= e!120558 (tuple2!14823 Unit!12332 thiss!1187))))

(declare-fun lt!265729 () Unit!12309)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7292) Unit!12309)

(assert (=> b!172526 (= lt!265729 (lemmaIsPrefixRefl!0 thiss!1187))))

(assert (=> b!172526 call!2845))

(declare-fun lt!265701 () Unit!12309)

(assert (=> b!172526 (= lt!265701 lt!265729)))

(assert (= (and d!61117 c!9079) b!172526))

(assert (= (and d!61117 (not c!9079)) b!172522))

(assert (= (and b!172522 res!142892) b!172524))

(assert (= (and b!172524 res!142899) b!172520))

(assert (= (and b!172520 res!142888) b!172512))

(assert (= (and b!172512 res!142896) b!172514))

(assert (= (and b!172522 res!142898) b!172515))

(assert (= (and b!172522 c!9078) b!172525))

(assert (= (and b!172522 (not c!9078)) b!172521))

(assert (= (and b!172522 res!142895) b!172513))

(assert (= (or b!172526 b!172522) bm!2842))

(assert (= (and d!61117 res!142897) b!172523))

(assert (= (and b!172523 res!142893) b!172517))

(assert (= (and b!172517 res!142889) b!172516))

(assert (= (and b!172516 res!142890) b!172518))

(assert (= (and b!172518 res!142894) b!172511))

(assert (= (and b!172518 res!142891) b!172519))

(declare-fun m!271571 () Bool)

(assert (=> b!172526 m!271571))

(declare-fun m!271573 () Bool)

(assert (=> b!172516 m!271573))

(declare-fun m!271575 () Bool)

(assert (=> b!172518 m!271575))

(declare-fun m!271577 () Bool)

(assert (=> b!172518 m!271577))

(declare-fun m!271579 () Bool)

(assert (=> b!172518 m!271579))

(declare-fun m!271581 () Bool)

(assert (=> b!172518 m!271581))

(declare-fun m!271583 () Bool)

(assert (=> b!172518 m!271583))

(declare-fun m!271585 () Bool)

(assert (=> b!172518 m!271585))

(declare-fun m!271587 () Bool)

(assert (=> bm!2842 m!271587))

(declare-fun m!271589 () Bool)

(assert (=> b!172514 m!271589))

(declare-fun m!271591 () Bool)

(assert (=> b!172514 m!271591))

(assert (=> b!172524 m!271591))

(declare-fun m!271593 () Bool)

(assert (=> b!172524 m!271593))

(declare-fun m!271595 () Bool)

(assert (=> b!172512 m!271595))

(assert (=> b!172512 m!271595))

(declare-fun m!271597 () Bool)

(assert (=> b!172512 m!271597))

(declare-fun m!271599 () Bool)

(assert (=> d!61117 m!271599))

(declare-fun m!271601 () Bool)

(assert (=> b!172517 m!271601))

(assert (=> b!172517 m!271593))

(declare-fun m!271603 () Bool)

(assert (=> b!172522 m!271603))

(declare-fun m!271605 () Bool)

(assert (=> b!172522 m!271605))

(assert (=> b!172522 m!271577))

(declare-fun m!271607 () Bool)

(assert (=> b!172522 m!271607))

(declare-fun m!271609 () Bool)

(assert (=> b!172522 m!271609))

(declare-fun m!271611 () Bool)

(assert (=> b!172522 m!271611))

(declare-fun m!271613 () Bool)

(assert (=> b!172522 m!271613))

(declare-fun m!271615 () Bool)

(assert (=> b!172522 m!271615))

(declare-fun m!271617 () Bool)

(assert (=> b!172522 m!271617))

(declare-fun m!271619 () Bool)

(assert (=> b!172522 m!271619))

(assert (=> b!172522 m!271593))

(declare-fun m!271621 () Bool)

(assert (=> b!172522 m!271621))

(declare-fun m!271623 () Bool)

(assert (=> b!172522 m!271623))

(declare-fun m!271625 () Bool)

(assert (=> b!172522 m!271625))

(assert (=> b!172522 m!271575))

(declare-fun m!271627 () Bool)

(assert (=> b!172522 m!271627))

(declare-fun m!271629 () Bool)

(assert (=> b!172522 m!271629))

(declare-fun m!271631 () Bool)

(assert (=> b!172522 m!271631))

(declare-fun m!271633 () Bool)

(assert (=> b!172522 m!271633))

(declare-fun m!271635 () Bool)

(assert (=> b!172522 m!271635))

(declare-fun m!271637 () Bool)

(assert (=> b!172522 m!271637))

(declare-fun m!271639 () Bool)

(assert (=> b!172522 m!271639))

(declare-fun m!271641 () Bool)

(assert (=> b!172522 m!271641))

(declare-fun m!271643 () Bool)

(assert (=> b!172522 m!271643))

(declare-fun m!271645 () Bool)

(assert (=> b!172522 m!271645))

(declare-fun m!271647 () Bool)

(assert (=> b!172522 m!271647))

(declare-fun m!271649 () Bool)

(assert (=> b!172522 m!271649))

(assert (=> b!172522 m!271609))

(declare-fun m!271651 () Bool)

(assert (=> b!172522 m!271651))

(declare-fun m!271653 () Bool)

(assert (=> b!172522 m!271653))

(declare-fun m!271655 () Bool)

(assert (=> b!172522 m!271655))

(declare-fun m!271657 () Bool)

(assert (=> b!172522 m!271657))

(declare-fun m!271659 () Bool)

(assert (=> b!172522 m!271659))

(declare-fun m!271661 () Bool)

(assert (=> b!172522 m!271661))

(declare-fun m!271663 () Bool)

(assert (=> b!172511 m!271663))

(declare-fun m!271665 () Bool)

(assert (=> b!172520 m!271665))

(assert (=> b!172445 d!61117))

(declare-fun d!61137 () Bool)

(assert (=> d!61137 (= (invariant!0 (currentBit!8587 (_2!8053 lt!265454)) (currentByte!8592 (_2!8053 lt!265454)) (size!4092 (buf!4520 (_2!8053 lt!265454)))) (and (bvsge (currentBit!8587 (_2!8053 lt!265454)) #b00000000000000000000000000000000) (bvslt (currentBit!8587 (_2!8053 lt!265454)) #b00000000000000000000000000001000) (bvsge (currentByte!8592 (_2!8053 lt!265454)) #b00000000000000000000000000000000) (or (bvslt (currentByte!8592 (_2!8053 lt!265454)) (size!4092 (buf!4520 (_2!8053 lt!265454)))) (and (= (currentBit!8587 (_2!8053 lt!265454)) #b00000000000000000000000000000000) (= (currentByte!8592 (_2!8053 lt!265454)) (size!4092 (buf!4520 (_2!8053 lt!265454))))))))))

(assert (=> b!172444 d!61137))

(declare-fun d!61139 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61139 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4092 (buf!4520 thiss!1187))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187)) ((_ sign_extend 32) nBits!340)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4092 (buf!4520 thiss!1187))) ((_ sign_extend 32) (currentByte!8592 thiss!1187)) ((_ sign_extend 32) (currentBit!8587 thiss!1187))) ((_ sign_extend 32) nBits!340)))))

(declare-fun bs!15211 () Bool)

(assert (= bs!15211 d!61139))

(declare-fun m!271709 () Bool)

(assert (=> bs!15211 m!271709))

(assert (=> b!172443 d!61139))

(declare-fun d!61141 () Bool)

(assert (=> d!61141 (= (invariant!0 (currentBit!8587 thiss!1187) (currentByte!8592 thiss!1187) (size!4092 (buf!4520 thiss!1187))) (and (bvsge (currentBit!8587 thiss!1187) #b00000000000000000000000000000000) (bvslt (currentBit!8587 thiss!1187) #b00000000000000000000000000001000) (bvsge (currentByte!8592 thiss!1187) #b00000000000000000000000000000000) (or (bvslt (currentByte!8592 thiss!1187) (size!4092 (buf!4520 thiss!1187))) (and (= (currentBit!8587 thiss!1187) #b00000000000000000000000000000000) (= (currentByte!8592 thiss!1187) (size!4092 (buf!4520 thiss!1187)))))))))

(assert (=> b!172442 d!61141))

(declare-fun d!61143 () Bool)

(assert (=> d!61143 (= (inv!12 thiss!1187) (invariant!0 (currentBit!8587 thiss!1187) (currentByte!8592 thiss!1187) (size!4092 (buf!4520 thiss!1187))))))

(declare-fun bs!15212 () Bool)

(assert (= bs!15212 d!61143))

(assert (=> bs!15212 m!271557))

(assert (=> start!38404 d!61143))

(push 1)

