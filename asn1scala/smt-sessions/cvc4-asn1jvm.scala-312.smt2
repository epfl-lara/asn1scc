; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6630 () Bool)

(assert start!6630)

(declare-fun b!31186 () Bool)

(declare-fun e!20712 () Bool)

(declare-datatypes ((array!1800 0))(
  ( (array!1801 (arr!1258 (Array (_ BitVec 32) (_ BitVec 8))) (size!789 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1382 0))(
  ( (BitStream!1383 (buf!1117 array!1800) (currentByte!2472 (_ BitVec 32)) (currentBit!2467 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1382)

(declare-fun array_inv!744 (array!1800) Bool)

(assert (=> b!31186 (= e!20712 (array_inv!744 (buf!1117 thiss!1379)))))

(declare-datatypes ((Unit!2385 0))(
  ( (Unit!2386) )
))
(declare-datatypes ((tuple2!3246 0))(
  ( (tuple2!3247 (_1!1710 Unit!2385) (_2!1710 BitStream!1382)) )
))
(declare-fun lt!45686 () tuple2!3246)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!31187 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!45693 () (_ BitVec 64))

(declare-fun e!20723 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31187 (= e!20723 (= lt!45693 (bvsub (bvsub (bvadd (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun res!26754 () Bool)

(declare-fun e!20718 () Bool)

(assert (=> start!6630 (=> (not res!26754) (not e!20718))))

(declare-fun srcBuffer!2 () array!1800)

(assert (=> start!6630 (= res!26754 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!789 srcBuffer!2))))))))

(assert (=> start!6630 e!20718))

(assert (=> start!6630 true))

(assert (=> start!6630 (array_inv!744 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1382) Bool)

(assert (=> start!6630 (and (inv!12 thiss!1379) e!20712)))

(declare-fun b!31188 () Bool)

(declare-fun e!20716 () Bool)

(declare-fun e!20722 () Bool)

(assert (=> b!31188 (= e!20716 e!20722)))

(declare-fun res!26750 () Bool)

(assert (=> b!31188 (=> res!26750 e!20722)))

(declare-fun isPrefixOf!0 (BitStream!1382 BitStream!1382) Bool)

(assert (=> b!31188 (= res!26750 (not (isPrefixOf!0 thiss!1379 (_2!1710 lt!45686))))))

(declare-fun lt!45683 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31188 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!45683)))

(assert (=> b!31188 (= lt!45683 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45680 () Unit!2385)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1382 BitStream!1382 (_ BitVec 64) (_ BitVec 64)) Unit!2385)

(assert (=> b!31188 (= lt!45680 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1710 lt!45686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1382 (_ BitVec 8) (_ BitVec 32)) tuple2!3246)

(assert (=> b!31188 (= lt!45686 (appendBitFromByte!0 thiss!1379 (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-datatypes ((tuple2!3248 0))(
  ( (tuple2!3249 (_1!1711 BitStream!1382) (_2!1711 BitStream!1382)) )
))
(declare-fun lt!45685 () tuple2!3248)

(declare-fun e!20724 () Bool)

(declare-fun b!31189 () Bool)

(declare-datatypes ((List!392 0))(
  ( (Nil!389) (Cons!388 (h!507 Bool) (t!1142 List!392)) )
))
(declare-fun head!229 (List!392) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1382 array!1800 (_ BitVec 64) (_ BitVec 64)) List!392)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1382 BitStream!1382 (_ BitVec 64)) List!392)

(assert (=> b!31189 (= e!20724 (= (head!229 (byteArrayBitContentToList!0 (_2!1710 lt!45686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!229 (bitStreamReadBitsIntoList!0 (_2!1710 lt!45686) (_1!1711 lt!45685) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31190 () Bool)

(declare-fun e!20721 () Bool)

(declare-fun e!20720 () Bool)

(assert (=> b!31190 (= e!20721 e!20720)))

(declare-fun res!26745 () Bool)

(assert (=> b!31190 (=> res!26745 e!20720)))

(declare-fun lt!45679 () List!392)

(declare-fun lt!45697 () List!392)

(assert (=> b!31190 (= res!26745 (not (= lt!45679 lt!45697)))))

(assert (=> b!31190 (= lt!45697 lt!45679)))

(declare-fun lt!45691 () List!392)

(declare-fun tail!109 (List!392) List!392)

(assert (=> b!31190 (= lt!45679 (tail!109 lt!45691))))

(declare-fun lt!45690 () tuple2!3246)

(declare-fun lt!45689 () tuple2!3248)

(declare-fun lt!45694 () Unit!2385)

(declare-fun lt!45688 () tuple2!3248)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1382 BitStream!1382 BitStream!1382 BitStream!1382 (_ BitVec 64) List!392) Unit!2385)

(assert (=> b!31190 (= lt!45694 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1710 lt!45690) (_2!1710 lt!45690) (_1!1711 lt!45688) (_1!1711 lt!45689) (bvsub to!314 i!635) lt!45691))))

(declare-fun b!31191 () Bool)

(declare-fun e!20715 () Bool)

(assert (=> b!31191 (= e!20722 e!20715)))

(declare-fun res!26756 () Bool)

(assert (=> b!31191 (=> res!26756 e!20715)))

(assert (=> b!31191 (= res!26756 (not (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45690))))))

(assert (=> b!31191 (isPrefixOf!0 thiss!1379 (_2!1710 lt!45690))))

(declare-fun lt!45692 () Unit!2385)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1382 BitStream!1382 BitStream!1382) Unit!2385)

(assert (=> b!31191 (= lt!45692 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1710 lt!45686) (_2!1710 lt!45690)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1382 array!1800 (_ BitVec 64) (_ BitVec 64)) tuple2!3246)

(assert (=> b!31191 (= lt!45690 (appendBitsMSBFirstLoop!0 (_2!1710 lt!45686) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!31191 e!20724))

(declare-fun res!26747 () Bool)

(assert (=> b!31191 (=> (not res!26747) (not e!20724))))

(assert (=> b!31191 (= res!26747 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45696 () Unit!2385)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1382 array!1800 (_ BitVec 64)) Unit!2385)

(assert (=> b!31191 (= lt!45696 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1117 (_2!1710 lt!45686)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1382 BitStream!1382) tuple2!3248)

(assert (=> b!31191 (= lt!45685 (reader!0 thiss!1379 (_2!1710 lt!45686)))))

(declare-fun b!31192 () Bool)

(assert (=> b!31192 (= e!20718 (not e!20716))))

(declare-fun res!26752 () Bool)

(assert (=> b!31192 (=> res!26752 e!20716)))

(assert (=> b!31192 (= res!26752 (bvsge i!635 to!314))))

(assert (=> b!31192 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45684 () Unit!2385)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1382) Unit!2385)

(assert (=> b!31192 (= lt!45684 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!45681 () (_ BitVec 64))

(assert (=> b!31192 (= lt!45681 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(declare-fun b!31193 () Bool)

(declare-fun e!20717 () Bool)

(assert (=> b!31193 (= e!20717 (not (= (byteArrayBitContentToList!0 (_2!1710 lt!45690) srcBuffer!2 i!635 (bvsub to!314 i!635)) Nil!389)))))

(declare-fun b!31194 () Bool)

(declare-fun res!26759 () Bool)

(assert (=> b!31194 (=> res!26759 e!20721)))

(declare-fun length!118 (List!392) Int)

(assert (=> b!31194 (= res!26759 (<= (length!118 lt!45691) 0))))

(declare-fun b!31195 () Bool)

(declare-fun e!20719 () Bool)

(assert (=> b!31195 (= e!20715 e!20719)))

(declare-fun res!26760 () Bool)

(assert (=> b!31195 (=> res!26760 e!20719)))

(assert (=> b!31195 (= res!26760 (not (= lt!45693 (bvsub (bvadd lt!45681 to!314) i!635))))))

(assert (=> b!31195 (= lt!45693 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690))))))

(declare-fun b!31196 () Bool)

(declare-fun res!26757 () Bool)

(declare-fun e!20725 () Bool)

(assert (=> b!31196 (=> res!26757 e!20725)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31196 (= res!26757 (not (invariant!0 (currentBit!2467 (_2!1710 lt!45686)) (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45690))))))))

(declare-fun b!31197 () Bool)

(declare-fun res!26744 () Bool)

(assert (=> b!31197 (=> res!26744 e!20719)))

(assert (=> b!31197 (= res!26744 (not (invariant!0 (currentBit!2467 (_2!1710 lt!45690)) (currentByte!2472 (_2!1710 lt!45690)) (size!789 (buf!1117 (_2!1710 lt!45690))))))))

(declare-fun b!31198 () Bool)

(assert (=> b!31198 (= e!20719 e!20725)))

(declare-fun res!26743 () Bool)

(assert (=> b!31198 (=> res!26743 e!20725)))

(assert (=> b!31198 (= res!26743 (not (= (size!789 (buf!1117 (_2!1710 lt!45686))) (size!789 (buf!1117 (_2!1710 lt!45690))))))))

(assert (=> b!31198 e!20723))

(declare-fun res!26746 () Bool)

(assert (=> b!31198 (=> (not res!26746) (not e!20723))))

(assert (=> b!31198 (= res!26746 (= (size!789 (buf!1117 (_2!1710 lt!45690))) (size!789 (buf!1117 thiss!1379))))))

(declare-fun b!31199 () Bool)

(declare-fun res!26749 () Bool)

(assert (=> b!31199 (=> res!26749 e!20725)))

(assert (=> b!31199 (= res!26749 (not (invariant!0 (currentBit!2467 (_2!1710 lt!45686)) (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45686))))))))

(declare-fun b!31200 () Bool)

(assert (=> b!31200 (= e!20725 e!20721)))

(declare-fun res!26753 () Bool)

(assert (=> b!31200 (=> res!26753 e!20721)))

(assert (=> b!31200 (= res!26753 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!31200 (= lt!45697 (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_1!1711 lt!45689) lt!45683))))

(assert (=> b!31200 (= lt!45691 (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_1!1711 lt!45688) (bvsub to!314 i!635)))))

(assert (=> b!31200 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!45683)))

(declare-fun lt!45695 () Unit!2385)

(assert (=> b!31200 (= lt!45695 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!45690)) lt!45683))))

(assert (=> b!31200 (= lt!45689 (reader!0 (_2!1710 lt!45686) (_2!1710 lt!45690)))))

(assert (=> b!31200 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!45682 () Unit!2385)

(assert (=> b!31200 (= lt!45682 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1117 (_2!1710 lt!45690)) (bvsub to!314 i!635)))))

(assert (=> b!31200 (= lt!45688 (reader!0 thiss!1379 (_2!1710 lt!45690)))))

(declare-fun b!31201 () Bool)

(declare-fun res!26751 () Bool)

(assert (=> b!31201 (=> (not res!26751) (not e!20718))))

(assert (=> b!31201 (= res!26751 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31202 () Bool)

(declare-fun res!26755 () Bool)

(assert (=> b!31202 (=> res!26755 e!20719)))

(assert (=> b!31202 (= res!26755 (not (= (size!789 (buf!1117 thiss!1379)) (size!789 (buf!1117 (_2!1710 lt!45690))))))))

(declare-fun b!31203 () Bool)

(assert (=> b!31203 (= e!20720 e!20717)))

(declare-fun res!26748 () Bool)

(assert (=> b!31203 (=> res!26748 e!20717)))

(declare-fun lt!45687 () Bool)

(declare-fun bitAt!0 (array!1800 (_ BitVec 64)) Bool)

(assert (=> b!31203 (= res!26748 (not (= lt!45687 (bitAt!0 (buf!1117 (_1!1711 lt!45689)) lt!45681))))))

(assert (=> b!31203 (= lt!45687 (bitAt!0 (buf!1117 (_1!1711 lt!45688)) lt!45681))))

(declare-fun b!31204 () Bool)

(declare-fun res!26758 () Bool)

(assert (=> b!31204 (=> res!26758 e!20717)))

(assert (=> b!31204 (= res!26758 (not (= (head!229 lt!45691) lt!45687)))))

(assert (= (and start!6630 res!26754) b!31201))

(assert (= (and b!31201 res!26751) b!31192))

(assert (= (and b!31192 (not res!26752)) b!31188))

(assert (= (and b!31188 (not res!26750)) b!31191))

(assert (= (and b!31191 res!26747) b!31189))

(assert (= (and b!31191 (not res!26756)) b!31195))

(assert (= (and b!31195 (not res!26760)) b!31197))

(assert (= (and b!31197 (not res!26744)) b!31202))

(assert (= (and b!31202 (not res!26755)) b!31198))

(assert (= (and b!31198 res!26746) b!31187))

(assert (= (and b!31198 (not res!26743)) b!31199))

(assert (= (and b!31199 (not res!26749)) b!31196))

(assert (= (and b!31196 (not res!26757)) b!31200))

(assert (= (and b!31200 (not res!26753)) b!31194))

(assert (= (and b!31194 (not res!26759)) b!31190))

(assert (= (and b!31190 (not res!26745)) b!31203))

(assert (= (and b!31203 (not res!26748)) b!31204))

(assert (= (and b!31204 (not res!26758)) b!31193))

(assert (= start!6630 b!31186))

(declare-fun m!45775 () Bool)

(assert (=> b!31195 m!45775))

(declare-fun m!45777 () Bool)

(assert (=> b!31188 m!45777))

(declare-fun m!45779 () Bool)

(assert (=> b!31188 m!45779))

(declare-fun m!45781 () Bool)

(assert (=> b!31188 m!45781))

(declare-fun m!45783 () Bool)

(assert (=> b!31188 m!45783))

(assert (=> b!31188 m!45779))

(declare-fun m!45785 () Bool)

(assert (=> b!31188 m!45785))

(declare-fun m!45787 () Bool)

(assert (=> b!31194 m!45787))

(declare-fun m!45789 () Bool)

(assert (=> b!31186 m!45789))

(declare-fun m!45791 () Bool)

(assert (=> b!31187 m!45791))

(declare-fun m!45793 () Bool)

(assert (=> b!31196 m!45793))

(declare-fun m!45795 () Bool)

(assert (=> b!31200 m!45795))

(declare-fun m!45797 () Bool)

(assert (=> b!31200 m!45797))

(declare-fun m!45799 () Bool)

(assert (=> b!31200 m!45799))

(declare-fun m!45801 () Bool)

(assert (=> b!31200 m!45801))

(declare-fun m!45803 () Bool)

(assert (=> b!31200 m!45803))

(declare-fun m!45805 () Bool)

(assert (=> b!31200 m!45805))

(declare-fun m!45807 () Bool)

(assert (=> b!31200 m!45807))

(declare-fun m!45809 () Bool)

(assert (=> b!31200 m!45809))

(declare-fun m!45811 () Bool)

(assert (=> b!31192 m!45811))

(declare-fun m!45813 () Bool)

(assert (=> b!31192 m!45813))

(declare-fun m!45815 () Bool)

(assert (=> b!31192 m!45815))

(declare-fun m!45817 () Bool)

(assert (=> start!6630 m!45817))

(declare-fun m!45819 () Bool)

(assert (=> start!6630 m!45819))

(declare-fun m!45821 () Bool)

(assert (=> b!31199 m!45821))

(declare-fun m!45823 () Bool)

(assert (=> b!31193 m!45823))

(declare-fun m!45825 () Bool)

(assert (=> b!31189 m!45825))

(assert (=> b!31189 m!45825))

(declare-fun m!45827 () Bool)

(assert (=> b!31189 m!45827))

(declare-fun m!45829 () Bool)

(assert (=> b!31189 m!45829))

(assert (=> b!31189 m!45829))

(declare-fun m!45831 () Bool)

(assert (=> b!31189 m!45831))

(declare-fun m!45833 () Bool)

(assert (=> b!31197 m!45833))

(declare-fun m!45835 () Bool)

(assert (=> b!31204 m!45835))

(declare-fun m!45837 () Bool)

(assert (=> b!31203 m!45837))

(declare-fun m!45839 () Bool)

(assert (=> b!31203 m!45839))

(declare-fun m!45841 () Bool)

(assert (=> b!31191 m!45841))

(declare-fun m!45843 () Bool)

(assert (=> b!31191 m!45843))

(declare-fun m!45845 () Bool)

(assert (=> b!31191 m!45845))

(declare-fun m!45847 () Bool)

(assert (=> b!31191 m!45847))

(declare-fun m!45849 () Bool)

(assert (=> b!31191 m!45849))

(declare-fun m!45851 () Bool)

(assert (=> b!31191 m!45851))

(declare-fun m!45853 () Bool)

(assert (=> b!31191 m!45853))

(declare-fun m!45855 () Bool)

(assert (=> b!31190 m!45855))

(declare-fun m!45857 () Bool)

(assert (=> b!31190 m!45857))

(declare-fun m!45859 () Bool)

(assert (=> b!31201 m!45859))

(push 1)

(assert (not b!31191))

(assert (not b!31201))

(assert (not b!31189))

(assert (not b!31200))

(assert (not start!6630))

(assert (not b!31190))

(assert (not b!31195))

(assert (not b!31203))

(assert (not b!31204))

(assert (not b!31199))

(assert (not b!31193))

(assert (not b!31192))

(assert (not b!31196))

(assert (not b!31197))

(assert (not b!31194))

(assert (not b!31186))

(assert (not b!31187))

(assert (not b!31188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9100 () Bool)

(assert (=> d!9100 (= (array_inv!744 (buf!1117 thiss!1379)) (bvsge (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31186 d!9100))

(declare-fun d!9102 () Bool)

(assert (=> d!9102 (= (array_inv!744 srcBuffer!2) (bvsge (size!789 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6630 d!9102))

(declare-fun d!9104 () Bool)

(assert (=> d!9104 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2467 thiss!1379) (currentByte!2472 thiss!1379) (size!789 (buf!1117 thiss!1379))))))

(declare-fun bs!2517 () Bool)

(assert (= bs!2517 d!9104))

(declare-fun m!45895 () Bool)

(assert (=> bs!2517 m!45895))

(assert (=> start!6630 d!9104))

(declare-fun d!9106 () Bool)

(assert (=> d!9106 (= (invariant!0 (currentBit!2467 (_2!1710 lt!45690)) (currentByte!2472 (_2!1710 lt!45690)) (size!789 (buf!1117 (_2!1710 lt!45690)))) (and (bvsge (currentBit!2467 (_2!1710 lt!45690)) #b00000000000000000000000000000000) (bvslt (currentBit!2467 (_2!1710 lt!45690)) #b00000000000000000000000000001000) (bvsge (currentByte!2472 (_2!1710 lt!45690)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2472 (_2!1710 lt!45690)) (size!789 (buf!1117 (_2!1710 lt!45690)))) (and (= (currentBit!2467 (_2!1710 lt!45690)) #b00000000000000000000000000000000) (= (currentByte!2472 (_2!1710 lt!45690)) (size!789 (buf!1117 (_2!1710 lt!45690))))))))))

(assert (=> b!31197 d!9106))

(declare-fun d!9108 () Bool)

(assert (=> d!9108 (= (invariant!0 (currentBit!2467 (_2!1710 lt!45686)) (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45690)))) (and (bvsge (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (bvslt (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000001000) (bvsge (currentByte!2472 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45690)))) (and (= (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (= (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45690))))))))))

(assert (=> b!31196 d!9108))

(declare-fun d!9110 () Bool)

(declare-fun e!20756 () Bool)

(assert (=> d!9110 e!20756))

(declare-fun res!26796 () Bool)

(assert (=> d!9110 (=> (not res!26796) (not e!20756))))

(declare-fun lt!45760 () (_ BitVec 64))

(declare-fun lt!45757 () (_ BitVec 64))

(declare-fun lt!45758 () (_ BitVec 64))

(assert (=> d!9110 (= res!26796 (= lt!45760 (bvsub lt!45758 lt!45757)))))

(assert (=> d!9110 (or (= (bvand lt!45758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45758 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45758 lt!45757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9110 (= lt!45757 (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45690))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45690)))))))

(declare-fun lt!45761 () (_ BitVec 64))

(declare-fun lt!45759 () (_ BitVec 64))

(assert (=> d!9110 (= lt!45758 (bvmul lt!45761 lt!45759))))

(assert (=> d!9110 (or (= lt!45761 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45759 (bvsdiv (bvmul lt!45761 lt!45759) lt!45761)))))

(assert (=> d!9110 (= lt!45759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9110 (= lt!45761 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))))))

(assert (=> d!9110 (= lt!45760 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45690))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45690)))))))

(assert (=> d!9110 (invariant!0 (currentBit!2467 (_2!1710 lt!45690)) (currentByte!2472 (_2!1710 lt!45690)) (size!789 (buf!1117 (_2!1710 lt!45690))))))

(assert (=> d!9110 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690))) lt!45760)))

(declare-fun b!31258 () Bool)

(declare-fun res!26797 () Bool)

(assert (=> b!31258 (=> (not res!26797) (not e!20756))))

(assert (=> b!31258 (= res!26797 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45760))))

(declare-fun b!31259 () Bool)

(declare-fun lt!45762 () (_ BitVec 64))

(assert (=> b!31259 (= e!20756 (bvsle lt!45760 (bvmul lt!45762 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31259 (or (= lt!45762 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45762 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45762)))))

(assert (=> b!31259 (= lt!45762 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))))))

(assert (= (and d!9110 res!26796) b!31258))

(assert (= (and b!31258 res!26797) b!31259))

(declare-fun m!45903 () Bool)

(assert (=> d!9110 m!45903))

(assert (=> d!9110 m!45833))

(assert (=> b!31195 d!9110))

(declare-fun d!9120 () Bool)

(declare-fun size!791 (List!392) Int)

(assert (=> d!9120 (= (length!118 lt!45691) (size!791 lt!45691))))

(declare-fun bs!2521 () Bool)

(assert (= bs!2521 d!9120))

(declare-fun m!45905 () Bool)

(assert (=> bs!2521 m!45905))

(assert (=> b!31194 d!9120))

(declare-fun d!9122 () Bool)

(assert (=> d!9122 (= (head!229 lt!45691) (h!507 lt!45691))))

(assert (=> b!31204 d!9122))

(declare-fun d!9126 () Bool)

(declare-fun c!2103 () Bool)

(assert (=> d!9126 (= c!2103 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20759 () List!392)

(assert (=> d!9126 (= (byteArrayBitContentToList!0 (_2!1710 lt!45690) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!20759)))

(declare-fun b!31264 () Bool)

(assert (=> b!31264 (= e!20759 Nil!389)))

(declare-fun b!31265 () Bool)

(assert (=> b!31265 (= e!20759 (Cons!388 (not (= (bvand ((_ sign_extend 24) (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1710 lt!45690) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9126 c!2103) b!31264))

(assert (= (and d!9126 (not c!2103)) b!31265))

(assert (=> b!31265 m!45779))

(declare-fun m!45909 () Bool)

(assert (=> b!31265 m!45909))

(declare-fun m!45911 () Bool)

(assert (=> b!31265 m!45911))

(assert (=> b!31193 d!9126))

(declare-fun d!9128 () Bool)

(declare-fun res!26804 () Bool)

(declare-fun e!20764 () Bool)

(assert (=> d!9128 (=> (not res!26804) (not e!20764))))

(assert (=> d!9128 (= res!26804 (= (size!789 (buf!1117 thiss!1379)) (size!789 (buf!1117 thiss!1379))))))

(assert (=> d!9128 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20764)))

(declare-fun b!31272 () Bool)

(declare-fun res!26805 () Bool)

(assert (=> b!31272 (=> (not res!26805) (not e!20764))))

(assert (=> b!31272 (= res!26805 (bvsle (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)) (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(declare-fun b!31273 () Bool)

(declare-fun e!20765 () Bool)

(assert (=> b!31273 (= e!20764 e!20765)))

(declare-fun res!26806 () Bool)

(assert (=> b!31273 (=> res!26806 e!20765)))

(assert (=> b!31273 (= res!26806 (= (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31274 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1800 array!1800 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31274 (= e!20765 (arrayBitRangesEq!0 (buf!1117 thiss!1379) (buf!1117 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(assert (= (and d!9128 res!26804) b!31272))

(assert (= (and b!31272 res!26805) b!31273))

(assert (= (and b!31273 (not res!26806)) b!31274))

(assert (=> b!31272 m!45815))

(assert (=> b!31272 m!45815))

(assert (=> b!31274 m!45815))

(assert (=> b!31274 m!45815))

(declare-fun m!45913 () Bool)

(assert (=> b!31274 m!45913))

(assert (=> b!31192 d!9128))

(declare-fun d!9130 () Bool)

(assert (=> d!9130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45766 () Unit!2385)

(declare-fun choose!11 (BitStream!1382) Unit!2385)

(assert (=> d!9130 (= lt!45766 (choose!11 thiss!1379))))

(assert (=> d!9130 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!45766)))

(declare-fun bs!2523 () Bool)

(assert (= bs!2523 d!9130))

(assert (=> bs!2523 m!45811))

(declare-fun m!45915 () Bool)

(assert (=> bs!2523 m!45915))

(assert (=> b!31192 d!9130))

(declare-fun d!9132 () Bool)

(declare-fun e!20766 () Bool)

(assert (=> d!9132 e!20766))

(declare-fun res!26807 () Bool)

(assert (=> d!9132 (=> (not res!26807) (not e!20766))))

(declare-fun lt!45767 () (_ BitVec 64))

(declare-fun lt!45770 () (_ BitVec 64))

(declare-fun lt!45768 () (_ BitVec 64))

(assert (=> d!9132 (= res!26807 (= lt!45770 (bvsub lt!45768 lt!45767)))))

(assert (=> d!9132 (or (= (bvand lt!45768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45768 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45768 lt!45767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9132 (= lt!45767 (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379))))))

(declare-fun lt!45771 () (_ BitVec 64))

(declare-fun lt!45769 () (_ BitVec 64))

(assert (=> d!9132 (= lt!45768 (bvmul lt!45771 lt!45769))))

(assert (=> d!9132 (or (= lt!45771 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45769 (bvsdiv (bvmul lt!45771 lt!45769) lt!45771)))))

(assert (=> d!9132 (= lt!45769 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9132 (= lt!45771 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))))))

(assert (=> d!9132 (= lt!45770 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2472 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2467 thiss!1379))))))

(assert (=> d!9132 (invariant!0 (currentBit!2467 thiss!1379) (currentByte!2472 thiss!1379) (size!789 (buf!1117 thiss!1379)))))

(assert (=> d!9132 (= (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)) lt!45770)))

(declare-fun b!31275 () Bool)

(declare-fun res!26808 () Bool)

(assert (=> b!31275 (=> (not res!26808) (not e!20766))))

(assert (=> b!31275 (= res!26808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45770))))

(declare-fun b!31276 () Bool)

(declare-fun lt!45772 () (_ BitVec 64))

(assert (=> b!31276 (= e!20766 (bvsle lt!45770 (bvmul lt!45772 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31276 (or (= lt!45772 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45772 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45772)))))

(assert (=> b!31276 (= lt!45772 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))))))

(assert (= (and d!9132 res!26807) b!31275))

(assert (= (and b!31275 res!26808) b!31276))

(declare-fun m!45917 () Bool)

(assert (=> d!9132 m!45917))

(assert (=> d!9132 m!45895))

(assert (=> b!31192 d!9132))

(declare-fun d!9134 () Bool)

(assert (=> d!9134 (= (bitAt!0 (buf!1117 (_1!1711 lt!45689)) lt!45681) (not (= (bvand ((_ sign_extend 24) (select (arr!1258 (buf!1117 (_1!1711 lt!45689))) ((_ extract 31 0) (bvsdiv lt!45681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2524 () Bool)

(assert (= bs!2524 d!9134))

(declare-fun m!45919 () Bool)

(assert (=> bs!2524 m!45919))

(declare-fun m!45921 () Bool)

(assert (=> bs!2524 m!45921))

(assert (=> b!31203 d!9134))

(declare-fun d!9136 () Bool)

(assert (=> d!9136 (= (bitAt!0 (buf!1117 (_1!1711 lt!45688)) lt!45681) (not (= (bvand ((_ sign_extend 24) (select (arr!1258 (buf!1117 (_1!1711 lt!45688))) ((_ extract 31 0) (bvsdiv lt!45681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2525 () Bool)

(assert (= bs!2525 d!9136))

(declare-fun m!45923 () Bool)

(assert (=> bs!2525 m!45923))

(assert (=> bs!2525 m!45921))

(assert (=> b!31203 d!9136))

(declare-fun d!9138 () Bool)

(assert (=> d!9138 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45775 () Unit!2385)

(declare-fun choose!9 (BitStream!1382 array!1800 (_ BitVec 64) BitStream!1382) Unit!2385)

(assert (=> d!9138 (= lt!45775 (choose!9 thiss!1379 (buf!1117 (_2!1710 lt!45686)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1383 (buf!1117 (_2!1710 lt!45686)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(assert (=> d!9138 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1117 (_2!1710 lt!45686)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45775)))

(declare-fun bs!2526 () Bool)

(assert (= bs!2526 d!9138))

(assert (=> bs!2526 m!45841))

(declare-fun m!45925 () Bool)

(assert (=> bs!2526 m!45925))

(assert (=> b!31191 d!9138))

(declare-fun d!9140 () Bool)

(assert (=> d!9140 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2527 () Bool)

(assert (= bs!2527 d!9140))

(declare-fun m!45927 () Bool)

(assert (=> bs!2527 m!45927))

(assert (=> b!31191 d!9140))

(declare-fun call!406 () tuple2!3248)

(declare-fun bm!403 () Bool)

(declare-fun lt!46197 () tuple2!3246)

(declare-fun c!2119 () Bool)

(assert (=> bm!403 (= call!406 (reader!0 (_2!1710 lt!45686) (ite c!2119 (_2!1710 lt!46197) (_2!1710 lt!45686))))))

(declare-fun b!31402 () Bool)

(declare-fun e!20826 () tuple2!3246)

(declare-fun lt!46188 () tuple2!3246)

(declare-fun Unit!2397 () Unit!2385)

(assert (=> b!31402 (= e!20826 (tuple2!3247 Unit!2397 (_2!1710 lt!46188)))))

(assert (=> b!31402 (= lt!46197 (appendBitFromByte!0 (_2!1710 lt!45686) (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!46208 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46208 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46189 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46189 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46214 () Unit!2385)

(assert (=> b!31402 (= lt!46214 (validateOffsetBitsIneqLemma!0 (_2!1710 lt!45686) (_2!1710 lt!46197) lt!46208 lt!46189))))

(assert (=> b!31402 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!46197)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!46197))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!46197))) (bvsub lt!46208 lt!46189))))

(declare-fun lt!46212 () Unit!2385)

(assert (=> b!31402 (= lt!46212 lt!46214)))

(declare-fun lt!46205 () tuple2!3248)

(assert (=> b!31402 (= lt!46205 call!406)))

(declare-fun lt!46217 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46217 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46225 () Unit!2385)

(assert (=> b!31402 (= lt!46225 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!46197)) lt!46217))))

(assert (=> b!31402 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!46197)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!46217)))

(declare-fun lt!46200 () Unit!2385)

(assert (=> b!31402 (= lt!46200 lt!46225)))

(assert (=> b!31402 (= (head!229 (byteArrayBitContentToList!0 (_2!1710 lt!46197) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!229 (bitStreamReadBitsIntoList!0 (_2!1710 lt!46197) (_1!1711 lt!46205) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46220 () Unit!2385)

(declare-fun Unit!2398 () Unit!2385)

(assert (=> b!31402 (= lt!46220 Unit!2398)))

(assert (=> b!31402 (= lt!46188 (appendBitsMSBFirstLoop!0 (_2!1710 lt!46197) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!46190 () Unit!2385)

(assert (=> b!31402 (= lt!46190 (lemmaIsPrefixTransitive!0 (_2!1710 lt!45686) (_2!1710 lt!46197) (_2!1710 lt!46188)))))

(assert (=> b!31402 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!46188))))

(declare-fun lt!46227 () Unit!2385)

(assert (=> b!31402 (= lt!46227 lt!46190)))

(assert (=> b!31402 (= (size!789 (buf!1117 (_2!1710 lt!46188))) (size!789 (buf!1117 (_2!1710 lt!45686))))))

(declare-fun lt!46185 () Unit!2385)

(declare-fun Unit!2399 () Unit!2385)

(assert (=> b!31402 (= lt!46185 Unit!2399)))

(assert (=> b!31402 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46188))) (currentByte!2472 (_2!1710 lt!46188)) (currentBit!2467 (_2!1710 lt!46188))) (bvsub (bvadd (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46210 () Unit!2385)

(declare-fun Unit!2400 () Unit!2385)

(assert (=> b!31402 (= lt!46210 Unit!2400)))

(assert (=> b!31402 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46188))) (currentByte!2472 (_2!1710 lt!46188)) (currentBit!2467 (_2!1710 lt!46188))) (bvsub (bvsub (bvadd (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46197))) (currentByte!2472 (_2!1710 lt!46197)) (currentBit!2467 (_2!1710 lt!46197))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46223 () Unit!2385)

(declare-fun Unit!2401 () Unit!2385)

(assert (=> b!31402 (= lt!46223 Unit!2401)))

(declare-fun lt!46195 () tuple2!3248)

(assert (=> b!31402 (= lt!46195 (reader!0 (_2!1710 lt!45686) (_2!1710 lt!46188)))))

(declare-fun lt!46194 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46194 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46193 () Unit!2385)

(assert (=> b!31402 (= lt!46193 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!46188)) lt!46194))))

(assert (=> b!31402 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!46188)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!46194)))

(declare-fun lt!46201 () Unit!2385)

(assert (=> b!31402 (= lt!46201 lt!46193)))

(declare-fun lt!46228 () tuple2!3248)

(assert (=> b!31402 (= lt!46228 (reader!0 (_2!1710 lt!46197) (_2!1710 lt!46188)))))

(declare-fun lt!46209 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46209 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!46211 () Unit!2385)

(assert (=> b!31402 (= lt!46211 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!46197) (buf!1117 (_2!1710 lt!46188)) lt!46209))))

(assert (=> b!31402 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!46188)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!46197))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!46197))) lt!46209)))

(declare-fun lt!46186 () Unit!2385)

(assert (=> b!31402 (= lt!46186 lt!46211)))

(declare-fun lt!46187 () List!392)

(assert (=> b!31402 (= lt!46187 (byteArrayBitContentToList!0 (_2!1710 lt!46188) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!46196 () List!392)

(assert (=> b!31402 (= lt!46196 (byteArrayBitContentToList!0 (_2!1710 lt!46188) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46207 () List!392)

(assert (=> b!31402 (= lt!46207 (bitStreamReadBitsIntoList!0 (_2!1710 lt!46188) (_1!1711 lt!46195) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!46224 () List!392)

(assert (=> b!31402 (= lt!46224 (bitStreamReadBitsIntoList!0 (_2!1710 lt!46188) (_1!1711 lt!46228) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!46202 () (_ BitVec 64))

(assert (=> b!31402 (= lt!46202 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!46218 () Unit!2385)

(assert (=> b!31402 (= lt!46218 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1710 lt!46188) (_2!1710 lt!46188) (_1!1711 lt!46195) (_1!1711 lt!46228) lt!46202 lt!46207))))

(assert (=> b!31402 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!46188) (_1!1711 lt!46228) (bvsub lt!46202 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!109 lt!46207))))

(declare-fun lt!46191 () Unit!2385)

(assert (=> b!31402 (= lt!46191 lt!46218)))

(declare-fun lt!46192 () Unit!2385)

(declare-fun lt!46198 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1800 array!1800 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2385)

(assert (=> b!31402 (= lt!46192 (arrayBitRangesEqImpliesEq!0 (buf!1117 (_2!1710 lt!46197)) (buf!1117 (_2!1710 lt!46188)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!46198 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46197))) (currentByte!2472 (_2!1710 lt!46197)) (currentBit!2467 (_2!1710 lt!46197)))))))

(assert (=> b!31402 (= (bitAt!0 (buf!1117 (_2!1710 lt!46197)) lt!46198) (bitAt!0 (buf!1117 (_2!1710 lt!46188)) lt!46198))))

(declare-fun lt!46221 () Unit!2385)

(assert (=> b!31402 (= lt!46221 lt!46192)))

(declare-fun b!31403 () Bool)

(declare-fun Unit!2402 () Unit!2385)

(assert (=> b!31403 (= e!20826 (tuple2!3247 Unit!2402 (_2!1710 lt!45686)))))

(assert (=> b!31403 (= (size!789 (buf!1117 (_2!1710 lt!45686))) (size!789 (buf!1117 (_2!1710 lt!45686))))))

(declare-fun lt!46215 () Unit!2385)

(declare-fun Unit!2403 () Unit!2385)

(assert (=> b!31403 (= lt!46215 Unit!2403)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1382 array!1800 array!1800 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3258 0))(
  ( (tuple2!3259 (_1!1716 array!1800) (_2!1716 BitStream!1382)) )
))
(declare-fun readBits!0 (BitStream!1382 (_ BitVec 64)) tuple2!3258)

(assert (=> b!31403 (checkByteArrayBitContent!0 (_2!1710 lt!45686) srcBuffer!2 (_1!1716 (readBits!0 (_1!1711 call!406) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!31404 () Bool)

(declare-fun e!20827 () Bool)

(declare-fun lt!46219 () (_ BitVec 64))

(assert (=> b!31404 (= e!20827 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!46219))))

(declare-fun b!31405 () Bool)

(declare-fun res!26905 () Bool)

(declare-fun e!20828 () Bool)

(assert (=> b!31405 (=> (not res!26905) (not e!20828))))

(declare-fun lt!46216 () tuple2!3246)

(assert (=> b!31405 (= res!26905 (= (size!789 (buf!1117 (_2!1710 lt!46216))) (size!789 (buf!1117 (_2!1710 lt!45686)))))))

(declare-fun b!31406 () Bool)

(declare-fun res!26903 () Bool)

(assert (=> b!31406 (=> (not res!26903) (not e!20828))))

(assert (=> b!31406 (= res!26903 (invariant!0 (currentBit!2467 (_2!1710 lt!46216)) (currentByte!2472 (_2!1710 lt!46216)) (size!789 (buf!1117 (_2!1710 lt!46216)))))))

(declare-fun b!31407 () Bool)

(declare-fun res!26904 () Bool)

(assert (=> b!31407 (=> (not res!26904) (not e!20828))))

(assert (=> b!31407 (= res!26904 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!46216)))))

(declare-fun b!31409 () Bool)

(declare-fun res!26906 () Bool)

(assert (=> b!31409 (=> (not res!26906) (not e!20828))))

(assert (=> b!31409 (= res!26906 (= (size!789 (buf!1117 (_2!1710 lt!45686))) (size!789 (buf!1117 (_2!1710 lt!46216)))))))

(declare-fun d!9142 () Bool)

(assert (=> d!9142 e!20828))

(declare-fun res!26908 () Bool)

(assert (=> d!9142 (=> (not res!26908) (not e!20828))))

(declare-fun lt!46226 () (_ BitVec 64))

(assert (=> d!9142 (= res!26908 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46216))) (currentByte!2472 (_2!1710 lt!46216)) (currentBit!2467 (_2!1710 lt!46216))) (bvsub lt!46226 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9142 (or (= (bvand lt!46226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46226 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!46213 () (_ BitVec 64))

(assert (=> d!9142 (= lt!46226 (bvadd lt!46213 to!314))))

(assert (=> d!9142 (or (not (= (bvand lt!46213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!46213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!46213 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9142 (= lt!46213 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(assert (=> d!9142 (= lt!46216 e!20826)))

(assert (=> d!9142 (= c!2119 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!46222 () Unit!2385)

(declare-fun lt!46199 () Unit!2385)

(assert (=> d!9142 (= lt!46222 lt!46199)))

(assert (=> d!9142 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45686))))

(assert (=> d!9142 (= lt!46199 (lemmaIsPrefixRefl!0 (_2!1710 lt!45686)))))

(assert (=> d!9142 (= lt!46198 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(assert (=> d!9142 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9142 (= (appendBitsMSBFirstLoop!0 (_2!1710 lt!45686) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!46216)))

(declare-fun lt!46204 () tuple2!3248)

(declare-fun b!31408 () Bool)

(assert (=> b!31408 (= e!20828 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!46216) (_1!1711 lt!46204) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1710 lt!46216) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!31408 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31408 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!46206 () Unit!2385)

(declare-fun lt!46203 () Unit!2385)

(assert (=> b!31408 (= lt!46206 lt!46203)))

(assert (=> b!31408 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!46216)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!46219)))

(assert (=> b!31408 (= lt!46203 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!46216)) lt!46219))))

(assert (=> b!31408 e!20827))

(declare-fun res!26907 () Bool)

(assert (=> b!31408 (=> (not res!26907) (not e!20827))))

(assert (=> b!31408 (= res!26907 (and (= (size!789 (buf!1117 (_2!1710 lt!45686))) (size!789 (buf!1117 (_2!1710 lt!46216)))) (bvsge lt!46219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31408 (= lt!46219 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!31408 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31408 (= lt!46204 (reader!0 (_2!1710 lt!45686) (_2!1710 lt!46216)))))

(assert (= (and d!9142 c!2119) b!31402))

(assert (= (and d!9142 (not c!2119)) b!31403))

(assert (= (or b!31402 b!31403) bm!403))

(assert (= (and d!9142 res!26908) b!31406))

(assert (= (and b!31406 res!26903) b!31409))

(assert (= (and b!31409 res!26906) b!31407))

(assert (= (and b!31407 res!26904) b!31405))

(assert (= (and b!31405 res!26905) b!31408))

(assert (= (and b!31408 res!26907) b!31404))

(declare-fun m!46175 () Bool)

(assert (=> bm!403 m!46175))

(declare-fun m!46177 () Bool)

(assert (=> b!31408 m!46177))

(declare-fun m!46179 () Bool)

(assert (=> b!31408 m!46179))

(declare-fun m!46181 () Bool)

(assert (=> b!31408 m!46181))

(declare-fun m!46183 () Bool)

(assert (=> b!31408 m!46183))

(declare-fun m!46185 () Bool)

(assert (=> b!31408 m!46185))

(declare-fun m!46187 () Bool)

(assert (=> b!31402 m!46187))

(declare-fun m!46189 () Bool)

(assert (=> b!31402 m!46189))

(declare-fun m!46191 () Bool)

(assert (=> b!31402 m!46191))

(declare-fun m!46193 () Bool)

(assert (=> b!31402 m!46193))

(declare-fun m!46195 () Bool)

(assert (=> b!31402 m!46195))

(declare-fun m!46197 () Bool)

(assert (=> b!31402 m!46197))

(declare-fun m!46199 () Bool)

(assert (=> b!31402 m!46199))

(declare-fun m!46201 () Bool)

(assert (=> b!31402 m!46201))

(declare-fun m!46203 () Bool)

(assert (=> b!31402 m!46203))

(declare-fun m!46205 () Bool)

(assert (=> b!31402 m!46205))

(declare-fun m!46207 () Bool)

(assert (=> b!31402 m!46207))

(declare-fun m!46209 () Bool)

(assert (=> b!31402 m!46209))

(declare-fun m!46211 () Bool)

(assert (=> b!31402 m!46211))

(declare-fun m!46213 () Bool)

(assert (=> b!31402 m!46213))

(assert (=> b!31402 m!46205))

(declare-fun m!46215 () Bool)

(assert (=> b!31402 m!46215))

(declare-fun m!46217 () Bool)

(assert (=> b!31402 m!46217))

(declare-fun m!46219 () Bool)

(assert (=> b!31402 m!46219))

(declare-fun m!46221 () Bool)

(assert (=> b!31402 m!46221))

(declare-fun m!46223 () Bool)

(assert (=> b!31402 m!46223))

(declare-fun m!46225 () Bool)

(assert (=> b!31402 m!46225))

(declare-fun m!46227 () Bool)

(assert (=> b!31402 m!46227))

(assert (=> b!31402 m!46211))

(assert (=> b!31402 m!46223))

(declare-fun m!46229 () Bool)

(assert (=> b!31402 m!46229))

(declare-fun m!46231 () Bool)

(assert (=> b!31402 m!46231))

(assert (=> b!31402 m!46203))

(declare-fun m!46233 () Bool)

(assert (=> b!31402 m!46233))

(declare-fun m!46235 () Bool)

(assert (=> b!31402 m!46235))

(declare-fun m!46237 () Bool)

(assert (=> b!31402 m!46237))

(declare-fun m!46239 () Bool)

(assert (=> b!31402 m!46239))

(declare-fun m!46241 () Bool)

(assert (=> b!31402 m!46241))

(declare-fun m!46243 () Bool)

(assert (=> b!31402 m!46243))

(declare-fun m!46245 () Bool)

(assert (=> b!31402 m!46245))

(assert (=> b!31402 m!45791))

(declare-fun m!46247 () Bool)

(assert (=> b!31402 m!46247))

(declare-fun m!46249 () Bool)

(assert (=> b!31404 m!46249))

(declare-fun m!46251 () Bool)

(assert (=> b!31406 m!46251))

(declare-fun m!46253 () Bool)

(assert (=> b!31407 m!46253))

(declare-fun m!46255 () Bool)

(assert (=> b!31403 m!46255))

(declare-fun m!46257 () Bool)

(assert (=> b!31403 m!46257))

(declare-fun m!46259 () Bool)

(assert (=> d!9142 m!46259))

(assert (=> d!9142 m!45791))

(declare-fun m!46261 () Bool)

(assert (=> d!9142 m!46261))

(declare-fun m!46263 () Bool)

(assert (=> d!9142 m!46263))

(assert (=> b!31191 d!9142))

(declare-fun d!9206 () Bool)

(declare-fun res!26909 () Bool)

(declare-fun e!20829 () Bool)

(assert (=> d!9206 (=> (not res!26909) (not e!20829))))

(assert (=> d!9206 (= res!26909 (= (size!789 (buf!1117 (_2!1710 lt!45686))) (size!789 (buf!1117 (_2!1710 lt!45690)))))))

(assert (=> d!9206 (= (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45690)) e!20829)))

(declare-fun b!31410 () Bool)

(declare-fun res!26910 () Bool)

(assert (=> b!31410 (=> (not res!26910) (not e!20829))))

(assert (=> b!31410 (= res!26910 (bvsle (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))) (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690)))))))

(declare-fun b!31411 () Bool)

(declare-fun e!20830 () Bool)

(assert (=> b!31411 (= e!20829 e!20830)))

(declare-fun res!26911 () Bool)

(assert (=> b!31411 (=> res!26911 e!20830)))

(assert (=> b!31411 (= res!26911 (= (size!789 (buf!1117 (_2!1710 lt!45686))) #b00000000000000000000000000000000))))

(declare-fun b!31412 () Bool)

(assert (=> b!31412 (= e!20830 (arrayBitRangesEq!0 (buf!1117 (_2!1710 lt!45686)) (buf!1117 (_2!1710 lt!45690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686)))))))

(assert (= (and d!9206 res!26909) b!31410))

(assert (= (and b!31410 res!26910) b!31411))

(assert (= (and b!31411 (not res!26911)) b!31412))

(assert (=> b!31410 m!45791))

(assert (=> b!31410 m!45775))

(assert (=> b!31412 m!45791))

(assert (=> b!31412 m!45791))

(declare-fun m!46265 () Bool)

(assert (=> b!31412 m!46265))

(assert (=> b!31191 d!9206))

(declare-fun b!31427 () Bool)

(declare-fun res!26919 () Bool)

(declare-fun e!20838 () Bool)

(assert (=> b!31427 (=> (not res!26919) (not e!20838))))

(declare-fun lt!46299 () tuple2!3248)

(assert (=> b!31427 (= res!26919 (isPrefixOf!0 (_1!1711 lt!46299) thiss!1379))))

(declare-fun b!31428 () Bool)

(declare-fun lt!46317 () (_ BitVec 64))

(declare-fun lt!46313 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1382 (_ BitVec 64)) BitStream!1382)

(assert (=> b!31428 (= e!20838 (= (_1!1711 lt!46299) (withMovedBitIndex!0 (_2!1711 lt!46299) (bvsub lt!46317 lt!46313))))))

(assert (=> b!31428 (or (= (bvand lt!46317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46313 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46317 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46317 lt!46313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31428 (= lt!46313 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(assert (=> b!31428 (= lt!46317 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(declare-fun b!31429 () Bool)

(declare-fun res!26918 () Bool)

(assert (=> b!31429 (=> (not res!26918) (not e!20838))))

(assert (=> b!31429 (= res!26918 (isPrefixOf!0 (_2!1711 lt!46299) (_2!1710 lt!45686)))))

(declare-fun d!9208 () Bool)

(assert (=> d!9208 e!20838))

(declare-fun res!26920 () Bool)

(assert (=> d!9208 (=> (not res!26920) (not e!20838))))

(assert (=> d!9208 (= res!26920 (isPrefixOf!0 (_1!1711 lt!46299) (_2!1711 lt!46299)))))

(declare-fun lt!46315 () BitStream!1382)

(assert (=> d!9208 (= lt!46299 (tuple2!3249 lt!46315 (_2!1710 lt!45686)))))

(declare-fun lt!46310 () Unit!2385)

(declare-fun lt!46314 () Unit!2385)

(assert (=> d!9208 (= lt!46310 lt!46314)))

(assert (=> d!9208 (isPrefixOf!0 lt!46315 (_2!1710 lt!45686))))

(assert (=> d!9208 (= lt!46314 (lemmaIsPrefixTransitive!0 lt!46315 (_2!1710 lt!45686) (_2!1710 lt!45686)))))

(declare-fun lt!46316 () Unit!2385)

(declare-fun lt!46304 () Unit!2385)

(assert (=> d!9208 (= lt!46316 lt!46304)))

(assert (=> d!9208 (isPrefixOf!0 lt!46315 (_2!1710 lt!45686))))

(assert (=> d!9208 (= lt!46304 (lemmaIsPrefixTransitive!0 lt!46315 thiss!1379 (_2!1710 lt!45686)))))

(declare-fun lt!46318 () Unit!2385)

(declare-fun e!20837 () Unit!2385)

(assert (=> d!9208 (= lt!46318 e!20837)))

(declare-fun c!2124 () Bool)

(assert (=> d!9208 (= c!2124 (not (= (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!46305 () Unit!2385)

(declare-fun lt!46302 () Unit!2385)

(assert (=> d!9208 (= lt!46305 lt!46302)))

(assert (=> d!9208 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45686))))

(assert (=> d!9208 (= lt!46302 (lemmaIsPrefixRefl!0 (_2!1710 lt!45686)))))

(declare-fun lt!46311 () Unit!2385)

(declare-fun lt!46308 () Unit!2385)

(assert (=> d!9208 (= lt!46311 lt!46308)))

(assert (=> d!9208 (= lt!46308 (lemmaIsPrefixRefl!0 (_2!1710 lt!45686)))))

(declare-fun lt!46300 () Unit!2385)

(declare-fun lt!46303 () Unit!2385)

(assert (=> d!9208 (= lt!46300 lt!46303)))

(assert (=> d!9208 (isPrefixOf!0 lt!46315 lt!46315)))

(assert (=> d!9208 (= lt!46303 (lemmaIsPrefixRefl!0 lt!46315))))

(declare-fun lt!46312 () Unit!2385)

(declare-fun lt!46307 () Unit!2385)

(assert (=> d!9208 (= lt!46312 lt!46307)))

(assert (=> d!9208 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9208 (= lt!46307 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9208 (= lt!46315 (BitStream!1383 (buf!1117 (_2!1710 lt!45686)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(assert (=> d!9208 (isPrefixOf!0 thiss!1379 (_2!1710 lt!45686))))

(assert (=> d!9208 (= (reader!0 thiss!1379 (_2!1710 lt!45686)) lt!46299)))

(declare-fun b!31430 () Bool)

(declare-fun Unit!2404 () Unit!2385)

(assert (=> b!31430 (= e!20837 Unit!2404)))

(declare-fun b!31431 () Bool)

(declare-fun lt!46306 () Unit!2385)

(assert (=> b!31431 (= e!20837 lt!46306)))

(declare-fun lt!46309 () (_ BitVec 64))

(assert (=> b!31431 (= lt!46309 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46301 () (_ BitVec 64))

(assert (=> b!31431 (= lt!46301 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1800 array!1800 (_ BitVec 64) (_ BitVec 64)) Unit!2385)

(assert (=> b!31431 (= lt!46306 (arrayBitRangesEqSymmetric!0 (buf!1117 thiss!1379) (buf!1117 (_2!1710 lt!45686)) lt!46309 lt!46301))))

(assert (=> b!31431 (arrayBitRangesEq!0 (buf!1117 (_2!1710 lt!45686)) (buf!1117 thiss!1379) lt!46309 lt!46301)))

(assert (= (and d!9208 c!2124) b!31431))

(assert (= (and d!9208 (not c!2124)) b!31430))

(assert (= (and d!9208 res!26920) b!31427))

(assert (= (and b!31427 res!26919) b!31429))

(assert (= (and b!31429 res!26918) b!31428))

(declare-fun m!46267 () Bool)

(assert (=> b!31428 m!46267))

(assert (=> b!31428 m!45791))

(assert (=> b!31428 m!45815))

(declare-fun m!46269 () Bool)

(assert (=> b!31429 m!46269))

(declare-fun m!46271 () Bool)

(assert (=> d!9208 m!46271))

(declare-fun m!46273 () Bool)

(assert (=> d!9208 m!46273))

(assert (=> d!9208 m!46261))

(declare-fun m!46275 () Bool)

(assert (=> d!9208 m!46275))

(declare-fun m!46277 () Bool)

(assert (=> d!9208 m!46277))

(assert (=> d!9208 m!45813))

(declare-fun m!46279 () Bool)

(assert (=> d!9208 m!46279))

(assert (=> d!9208 m!45811))

(assert (=> d!9208 m!45781))

(assert (=> d!9208 m!46263))

(declare-fun m!46281 () Bool)

(assert (=> d!9208 m!46281))

(assert (=> b!31431 m!45815))

(declare-fun m!46283 () Bool)

(assert (=> b!31431 m!46283))

(declare-fun m!46285 () Bool)

(assert (=> b!31431 m!46285))

(declare-fun m!46287 () Bool)

(assert (=> b!31427 m!46287))

(assert (=> b!31191 d!9208))

(declare-fun d!9210 () Bool)

(declare-fun res!26921 () Bool)

(declare-fun e!20839 () Bool)

(assert (=> d!9210 (=> (not res!26921) (not e!20839))))

(assert (=> d!9210 (= res!26921 (= (size!789 (buf!1117 thiss!1379)) (size!789 (buf!1117 (_2!1710 lt!45690)))))))

(assert (=> d!9210 (= (isPrefixOf!0 thiss!1379 (_2!1710 lt!45690)) e!20839)))

(declare-fun b!31432 () Bool)

(declare-fun res!26922 () Bool)

(assert (=> b!31432 (=> (not res!26922) (not e!20839))))

(assert (=> b!31432 (= res!26922 (bvsle (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)) (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690)))))))

(declare-fun b!31433 () Bool)

(declare-fun e!20840 () Bool)

(assert (=> b!31433 (= e!20839 e!20840)))

(declare-fun res!26923 () Bool)

(assert (=> b!31433 (=> res!26923 e!20840)))

(assert (=> b!31433 (= res!26923 (= (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31434 () Bool)

(assert (=> b!31434 (= e!20840 (arrayBitRangesEq!0 (buf!1117 thiss!1379) (buf!1117 (_2!1710 lt!45690)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(assert (= (and d!9210 res!26921) b!31432))

(assert (= (and b!31432 res!26922) b!31433))

(assert (= (and b!31433 (not res!26923)) b!31434))

(assert (=> b!31432 m!45815))

(assert (=> b!31432 m!45775))

(assert (=> b!31434 m!45815))

(assert (=> b!31434 m!45815))

(declare-fun m!46289 () Bool)

(assert (=> b!31434 m!46289))

(assert (=> b!31191 d!9210))

(declare-fun d!9212 () Bool)

(assert (=> d!9212 (isPrefixOf!0 thiss!1379 (_2!1710 lt!45690))))

(declare-fun lt!46367 () Unit!2385)

(declare-fun choose!30 (BitStream!1382 BitStream!1382 BitStream!1382) Unit!2385)

(assert (=> d!9212 (= lt!46367 (choose!30 thiss!1379 (_2!1710 lt!45686) (_2!1710 lt!45690)))))

(assert (=> d!9212 (isPrefixOf!0 thiss!1379 (_2!1710 lt!45686))))

(assert (=> d!9212 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1710 lt!45686) (_2!1710 lt!45690)) lt!46367)))

(declare-fun bs!2541 () Bool)

(assert (= bs!2541 d!9212))

(assert (=> bs!2541 m!45851))

(declare-fun m!46291 () Bool)

(assert (=> bs!2541 m!46291))

(assert (=> bs!2541 m!45781))

(assert (=> b!31191 d!9212))

(declare-fun d!9214 () Bool)

(assert (=> d!9214 (= (tail!109 lt!45691) (t!1142 lt!45691))))

(assert (=> b!31190 d!9214))

(declare-fun d!9216 () Bool)

(declare-fun e!20847 () Bool)

(assert (=> d!9216 e!20847))

(declare-fun res!26938 () Bool)

(assert (=> d!9216 (=> (not res!26938) (not e!20847))))

(declare-fun lt!46385 () (_ BitVec 64))

(assert (=> d!9216 (= res!26938 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46385 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!46385) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9216 (= lt!46385 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!46384 () Unit!2385)

(declare-fun choose!42 (BitStream!1382 BitStream!1382 BitStream!1382 BitStream!1382 (_ BitVec 64) List!392) Unit!2385)

(assert (=> d!9216 (= lt!46384 (choose!42 (_2!1710 lt!45690) (_2!1710 lt!45690) (_1!1711 lt!45688) (_1!1711 lt!45689) (bvsub to!314 i!635) lt!45691))))

(assert (=> d!9216 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9216 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1710 lt!45690) (_2!1710 lt!45690) (_1!1711 lt!45688) (_1!1711 lt!45689) (bvsub to!314 i!635) lt!45691) lt!46384)))

(declare-fun b!31449 () Bool)

(assert (=> b!31449 (= e!20847 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_1!1711 lt!45689) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!109 lt!45691)))))

(assert (= (and d!9216 res!26938) b!31449))

(declare-fun m!46293 () Bool)

(assert (=> d!9216 m!46293))

(declare-fun m!46295 () Bool)

(assert (=> b!31449 m!46295))

(assert (=> b!31449 m!45855))

(assert (=> b!31190 d!9216))

(declare-fun d!9218 () Bool)

(assert (=> d!9218 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 thiss!1379))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2542 () Bool)

(assert (= bs!2542 d!9218))

(assert (=> bs!2542 m!45917))

(assert (=> b!31201 d!9218))

(declare-fun d!9220 () Bool)

(assert (=> d!9220 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!45683) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686)))) lt!45683))))

(declare-fun bs!2543 () Bool)

(assert (= bs!2543 d!9220))

(declare-fun m!46297 () Bool)

(assert (=> bs!2543 m!46297))

(assert (=> b!31200 d!9220))

(declare-fun d!9222 () Bool)

(assert (=> d!9222 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46386 () Unit!2385)

(assert (=> d!9222 (= lt!46386 (choose!9 thiss!1379 (buf!1117 (_2!1710 lt!45690)) (bvsub to!314 i!635) (BitStream!1383 (buf!1117 (_2!1710 lt!45690)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(assert (=> d!9222 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1117 (_2!1710 lt!45690)) (bvsub to!314 i!635)) lt!46386)))

(declare-fun bs!2544 () Bool)

(assert (= bs!2544 d!9222))

(assert (=> bs!2544 m!45807))

(declare-fun m!46299 () Bool)

(assert (=> bs!2544 m!46299))

(assert (=> b!31200 d!9222))

(declare-fun d!9224 () Bool)

(assert (=> d!9224 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!45683)))

(declare-fun lt!46387 () Unit!2385)

(assert (=> d!9224 (= lt!46387 (choose!9 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!45690)) lt!45683 (BitStream!1383 (buf!1117 (_2!1710 lt!45690)) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686)))))))

(assert (=> d!9224 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1710 lt!45686) (buf!1117 (_2!1710 lt!45690)) lt!45683) lt!46387)))

(declare-fun bs!2545 () Bool)

(assert (= bs!2545 d!9224))

(assert (=> bs!2545 m!45805))

(declare-fun m!46301 () Bool)

(assert (=> bs!2545 m!46301))

(assert (=> b!31200 d!9224))

(declare-fun d!9226 () Bool)

(assert (=> d!9226 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45690)))) ((_ sign_extend 32) (currentByte!2472 thiss!1379)) ((_ sign_extend 32) (currentBit!2467 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2546 () Bool)

(assert (= bs!2546 d!9226))

(declare-fun m!46303 () Bool)

(assert (=> bs!2546 m!46303))

(assert (=> b!31200 d!9226))

(declare-fun b!31450 () Bool)

(declare-fun res!26940 () Bool)

(declare-fun e!20849 () Bool)

(assert (=> b!31450 (=> (not res!26940) (not e!20849))))

(declare-fun lt!46388 () tuple2!3248)

(assert (=> b!31450 (= res!26940 (isPrefixOf!0 (_1!1711 lt!46388) thiss!1379))))

(declare-fun lt!46402 () (_ BitVec 64))

(declare-fun b!31451 () Bool)

(declare-fun lt!46406 () (_ BitVec 64))

(assert (=> b!31451 (= e!20849 (= (_1!1711 lt!46388) (withMovedBitIndex!0 (_2!1711 lt!46388) (bvsub lt!46406 lt!46402))))))

(assert (=> b!31451 (or (= (bvand lt!46406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46406 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46406 lt!46402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31451 (= lt!46402 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690))))))

(assert (=> b!31451 (= lt!46406 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(declare-fun b!31452 () Bool)

(declare-fun res!26939 () Bool)

(assert (=> b!31452 (=> (not res!26939) (not e!20849))))

(assert (=> b!31452 (= res!26939 (isPrefixOf!0 (_2!1711 lt!46388) (_2!1710 lt!45690)))))

(declare-fun d!9228 () Bool)

(assert (=> d!9228 e!20849))

(declare-fun res!26941 () Bool)

(assert (=> d!9228 (=> (not res!26941) (not e!20849))))

(assert (=> d!9228 (= res!26941 (isPrefixOf!0 (_1!1711 lt!46388) (_2!1711 lt!46388)))))

(declare-fun lt!46404 () BitStream!1382)

(assert (=> d!9228 (= lt!46388 (tuple2!3249 lt!46404 (_2!1710 lt!45690)))))

(declare-fun lt!46399 () Unit!2385)

(declare-fun lt!46403 () Unit!2385)

(assert (=> d!9228 (= lt!46399 lt!46403)))

(assert (=> d!9228 (isPrefixOf!0 lt!46404 (_2!1710 lt!45690))))

(assert (=> d!9228 (= lt!46403 (lemmaIsPrefixTransitive!0 lt!46404 (_2!1710 lt!45690) (_2!1710 lt!45690)))))

(declare-fun lt!46405 () Unit!2385)

(declare-fun lt!46393 () Unit!2385)

(assert (=> d!9228 (= lt!46405 lt!46393)))

(assert (=> d!9228 (isPrefixOf!0 lt!46404 (_2!1710 lt!45690))))

(assert (=> d!9228 (= lt!46393 (lemmaIsPrefixTransitive!0 lt!46404 thiss!1379 (_2!1710 lt!45690)))))

(declare-fun lt!46407 () Unit!2385)

(declare-fun e!20848 () Unit!2385)

(assert (=> d!9228 (= lt!46407 e!20848)))

(declare-fun c!2125 () Bool)

(assert (=> d!9228 (= c!2125 (not (= (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!46394 () Unit!2385)

(declare-fun lt!46391 () Unit!2385)

(assert (=> d!9228 (= lt!46394 lt!46391)))

(assert (=> d!9228 (isPrefixOf!0 (_2!1710 lt!45690) (_2!1710 lt!45690))))

(assert (=> d!9228 (= lt!46391 (lemmaIsPrefixRefl!0 (_2!1710 lt!45690)))))

(declare-fun lt!46400 () Unit!2385)

(declare-fun lt!46397 () Unit!2385)

(assert (=> d!9228 (= lt!46400 lt!46397)))

(assert (=> d!9228 (= lt!46397 (lemmaIsPrefixRefl!0 (_2!1710 lt!45690)))))

(declare-fun lt!46389 () Unit!2385)

(declare-fun lt!46392 () Unit!2385)

(assert (=> d!9228 (= lt!46389 lt!46392)))

(assert (=> d!9228 (isPrefixOf!0 lt!46404 lt!46404)))

(assert (=> d!9228 (= lt!46392 (lemmaIsPrefixRefl!0 lt!46404))))

(declare-fun lt!46401 () Unit!2385)

(declare-fun lt!46396 () Unit!2385)

(assert (=> d!9228 (= lt!46401 lt!46396)))

(assert (=> d!9228 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9228 (= lt!46396 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9228 (= lt!46404 (BitStream!1383 (buf!1117 (_2!1710 lt!45690)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(assert (=> d!9228 (isPrefixOf!0 thiss!1379 (_2!1710 lt!45690))))

(assert (=> d!9228 (= (reader!0 thiss!1379 (_2!1710 lt!45690)) lt!46388)))

(declare-fun b!31453 () Bool)

(declare-fun Unit!2412 () Unit!2385)

(assert (=> b!31453 (= e!20848 Unit!2412)))

(declare-fun b!31454 () Bool)

(declare-fun lt!46395 () Unit!2385)

(assert (=> b!31454 (= e!20848 lt!46395)))

(declare-fun lt!46398 () (_ BitVec 64))

(assert (=> b!31454 (= lt!46398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46390 () (_ BitVec 64))

(assert (=> b!31454 (= lt!46390 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(assert (=> b!31454 (= lt!46395 (arrayBitRangesEqSymmetric!0 (buf!1117 thiss!1379) (buf!1117 (_2!1710 lt!45690)) lt!46398 lt!46390))))

(assert (=> b!31454 (arrayBitRangesEq!0 (buf!1117 (_2!1710 lt!45690)) (buf!1117 thiss!1379) lt!46398 lt!46390)))

(assert (= (and d!9228 c!2125) b!31454))

(assert (= (and d!9228 (not c!2125)) b!31453))

(assert (= (and d!9228 res!26941) b!31450))

(assert (= (and b!31450 res!26940) b!31452))

(assert (= (and b!31452 res!26939) b!31451))

(declare-fun m!46305 () Bool)

(assert (=> b!31451 m!46305))

(assert (=> b!31451 m!45775))

(assert (=> b!31451 m!45815))

(declare-fun m!46307 () Bool)

(assert (=> b!31452 m!46307))

(declare-fun m!46309 () Bool)

(assert (=> d!9228 m!46309))

(declare-fun m!46311 () Bool)

(assert (=> d!9228 m!46311))

(declare-fun m!46313 () Bool)

(assert (=> d!9228 m!46313))

(declare-fun m!46315 () Bool)

(assert (=> d!9228 m!46315))

(declare-fun m!46317 () Bool)

(assert (=> d!9228 m!46317))

(assert (=> d!9228 m!45813))

(declare-fun m!46319 () Bool)

(assert (=> d!9228 m!46319))

(assert (=> d!9228 m!45811))

(assert (=> d!9228 m!45851))

(declare-fun m!46321 () Bool)

(assert (=> d!9228 m!46321))

(declare-fun m!46323 () Bool)

(assert (=> d!9228 m!46323))

(assert (=> b!31454 m!45815))

(declare-fun m!46325 () Bool)

(assert (=> b!31454 m!46325))

(declare-fun m!46327 () Bool)

(assert (=> b!31454 m!46327))

(declare-fun m!46329 () Bool)

(assert (=> b!31450 m!46329))

(assert (=> b!31200 d!9228))

(declare-datatypes ((tuple2!3262 0))(
  ( (tuple2!3263 (_1!1718 List!392) (_2!1718 BitStream!1382)) )
))
(declare-fun e!20858 () tuple2!3262)

(declare-datatypes ((tuple2!3264 0))(
  ( (tuple2!3265 (_1!1719 Bool) (_2!1719 BitStream!1382)) )
))
(declare-fun lt!46460 () tuple2!3264)

(declare-fun lt!46459 () (_ BitVec 64))

(declare-fun b!31472 () Bool)

(assert (=> b!31472 (= e!20858 (tuple2!3263 (Cons!388 (_1!1719 lt!46460) (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_2!1719 lt!46460) (bvsub (bvsub to!314 i!635) lt!46459))) (_2!1719 lt!46460)))))

(declare-fun readBit!0 (BitStream!1382) tuple2!3264)

(assert (=> b!31472 (= lt!46460 (readBit!0 (_1!1711 lt!45688)))))

(assert (=> b!31472 (= lt!46459 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31474 () Bool)

(declare-fun e!20857 () Bool)

(declare-fun lt!46458 () List!392)

(assert (=> b!31474 (= e!20857 (> (length!118 lt!46458) 0))))

(declare-fun b!31473 () Bool)

(declare-fun isEmpty!85 (List!392) Bool)

(assert (=> b!31473 (= e!20857 (isEmpty!85 lt!46458))))

(declare-fun d!9230 () Bool)

(assert (=> d!9230 e!20857))

(declare-fun c!2131 () Bool)

(assert (=> d!9230 (= c!2131 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9230 (= lt!46458 (_1!1718 e!20858))))

(declare-fun c!2132 () Bool)

(assert (=> d!9230 (= c!2132 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9230 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9230 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_1!1711 lt!45688) (bvsub to!314 i!635)) lt!46458)))

(declare-fun b!31471 () Bool)

(assert (=> b!31471 (= e!20858 (tuple2!3263 Nil!389 (_1!1711 lt!45688)))))

(assert (= (and d!9230 c!2132) b!31471))

(assert (= (and d!9230 (not c!2132)) b!31472))

(assert (= (and d!9230 c!2131) b!31473))

(assert (= (and d!9230 (not c!2131)) b!31474))

(declare-fun m!46375 () Bool)

(assert (=> b!31472 m!46375))

(declare-fun m!46377 () Bool)

(assert (=> b!31472 m!46377))

(declare-fun m!46379 () Bool)

(assert (=> b!31474 m!46379))

(declare-fun m!46381 () Bool)

(assert (=> b!31473 m!46381))

(assert (=> b!31200 d!9230))

(declare-fun b!31475 () Bool)

(declare-fun res!26949 () Bool)

(declare-fun e!20860 () Bool)

(assert (=> b!31475 (=> (not res!26949) (not e!20860))))

(declare-fun lt!46461 () tuple2!3248)

(assert (=> b!31475 (= res!26949 (isPrefixOf!0 (_1!1711 lt!46461) (_2!1710 lt!45686)))))

(declare-fun lt!46479 () (_ BitVec 64))

(declare-fun lt!46475 () (_ BitVec 64))

(declare-fun b!31476 () Bool)

(assert (=> b!31476 (= e!20860 (= (_1!1711 lt!46461) (withMovedBitIndex!0 (_2!1711 lt!46461) (bvsub lt!46479 lt!46475))))))

(assert (=> b!31476 (or (= (bvand lt!46479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46479 lt!46475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31476 (= lt!46475 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45690))) (currentByte!2472 (_2!1710 lt!45690)) (currentBit!2467 (_2!1710 lt!45690))))))

(assert (=> b!31476 (= lt!46479 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(declare-fun b!31477 () Bool)

(declare-fun res!26948 () Bool)

(assert (=> b!31477 (=> (not res!26948) (not e!20860))))

(assert (=> b!31477 (= res!26948 (isPrefixOf!0 (_2!1711 lt!46461) (_2!1710 lt!45690)))))

(declare-fun d!9232 () Bool)

(assert (=> d!9232 e!20860))

(declare-fun res!26950 () Bool)

(assert (=> d!9232 (=> (not res!26950) (not e!20860))))

(assert (=> d!9232 (= res!26950 (isPrefixOf!0 (_1!1711 lt!46461) (_2!1711 lt!46461)))))

(declare-fun lt!46477 () BitStream!1382)

(assert (=> d!9232 (= lt!46461 (tuple2!3249 lt!46477 (_2!1710 lt!45690)))))

(declare-fun lt!46472 () Unit!2385)

(declare-fun lt!46476 () Unit!2385)

(assert (=> d!9232 (= lt!46472 lt!46476)))

(assert (=> d!9232 (isPrefixOf!0 lt!46477 (_2!1710 lt!45690))))

(assert (=> d!9232 (= lt!46476 (lemmaIsPrefixTransitive!0 lt!46477 (_2!1710 lt!45690) (_2!1710 lt!45690)))))

(declare-fun lt!46478 () Unit!2385)

(declare-fun lt!46466 () Unit!2385)

(assert (=> d!9232 (= lt!46478 lt!46466)))

(assert (=> d!9232 (isPrefixOf!0 lt!46477 (_2!1710 lt!45690))))

(assert (=> d!9232 (= lt!46466 (lemmaIsPrefixTransitive!0 lt!46477 (_2!1710 lt!45686) (_2!1710 lt!45690)))))

(declare-fun lt!46480 () Unit!2385)

(declare-fun e!20859 () Unit!2385)

(assert (=> d!9232 (= lt!46480 e!20859)))

(declare-fun c!2133 () Bool)

(assert (=> d!9232 (= c!2133 (not (= (size!789 (buf!1117 (_2!1710 lt!45686))) #b00000000000000000000000000000000)))))

(declare-fun lt!46467 () Unit!2385)

(declare-fun lt!46464 () Unit!2385)

(assert (=> d!9232 (= lt!46467 lt!46464)))

(assert (=> d!9232 (isPrefixOf!0 (_2!1710 lt!45690) (_2!1710 lt!45690))))

(assert (=> d!9232 (= lt!46464 (lemmaIsPrefixRefl!0 (_2!1710 lt!45690)))))

(declare-fun lt!46473 () Unit!2385)

(declare-fun lt!46470 () Unit!2385)

(assert (=> d!9232 (= lt!46473 lt!46470)))

(assert (=> d!9232 (= lt!46470 (lemmaIsPrefixRefl!0 (_2!1710 lt!45690)))))

(declare-fun lt!46462 () Unit!2385)

(declare-fun lt!46465 () Unit!2385)

(assert (=> d!9232 (= lt!46462 lt!46465)))

(assert (=> d!9232 (isPrefixOf!0 lt!46477 lt!46477)))

(assert (=> d!9232 (= lt!46465 (lemmaIsPrefixRefl!0 lt!46477))))

(declare-fun lt!46474 () Unit!2385)

(declare-fun lt!46469 () Unit!2385)

(assert (=> d!9232 (= lt!46474 lt!46469)))

(assert (=> d!9232 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45686))))

(assert (=> d!9232 (= lt!46469 (lemmaIsPrefixRefl!0 (_2!1710 lt!45686)))))

(assert (=> d!9232 (= lt!46477 (BitStream!1383 (buf!1117 (_2!1710 lt!45690)) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(assert (=> d!9232 (isPrefixOf!0 (_2!1710 lt!45686) (_2!1710 lt!45690))))

(assert (=> d!9232 (= (reader!0 (_2!1710 lt!45686) (_2!1710 lt!45690)) lt!46461)))

(declare-fun b!31478 () Bool)

(declare-fun Unit!2413 () Unit!2385)

(assert (=> b!31478 (= e!20859 Unit!2413)))

(declare-fun b!31479 () Bool)

(declare-fun lt!46468 () Unit!2385)

(assert (=> b!31479 (= e!20859 lt!46468)))

(declare-fun lt!46471 () (_ BitVec 64))

(assert (=> b!31479 (= lt!46471 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46463 () (_ BitVec 64))

(assert (=> b!31479 (= lt!46463 (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))))))

(assert (=> b!31479 (= lt!46468 (arrayBitRangesEqSymmetric!0 (buf!1117 (_2!1710 lt!45686)) (buf!1117 (_2!1710 lt!45690)) lt!46471 lt!46463))))

(assert (=> b!31479 (arrayBitRangesEq!0 (buf!1117 (_2!1710 lt!45690)) (buf!1117 (_2!1710 lt!45686)) lt!46471 lt!46463)))

(assert (= (and d!9232 c!2133) b!31479))

(assert (= (and d!9232 (not c!2133)) b!31478))

(assert (= (and d!9232 res!26950) b!31475))

(assert (= (and b!31475 res!26949) b!31477))

(assert (= (and b!31477 res!26948) b!31476))

(declare-fun m!46421 () Bool)

(assert (=> b!31476 m!46421))

(assert (=> b!31476 m!45775))

(assert (=> b!31476 m!45791))

(declare-fun m!46427 () Bool)

(assert (=> b!31477 m!46427))

(declare-fun m!46431 () Bool)

(assert (=> d!9232 m!46431))

(declare-fun m!46433 () Bool)

(assert (=> d!9232 m!46433))

(assert (=> d!9232 m!46313))

(declare-fun m!46435 () Bool)

(assert (=> d!9232 m!46435))

(declare-fun m!46439 () Bool)

(assert (=> d!9232 m!46439))

(assert (=> d!9232 m!46263))

(declare-fun m!46441 () Bool)

(assert (=> d!9232 m!46441))

(assert (=> d!9232 m!46261))

(assert (=> d!9232 m!45843))

(assert (=> d!9232 m!46321))

(declare-fun m!46443 () Bool)

(assert (=> d!9232 m!46443))

(assert (=> b!31479 m!45791))

(declare-fun m!46445 () Bool)

(assert (=> b!31479 m!46445))

(declare-fun m!46447 () Bool)

(assert (=> b!31479 m!46447))

(declare-fun m!46449 () Bool)

(assert (=> b!31475 m!46449))

(assert (=> b!31200 d!9232))

(declare-fun lt!46483 () tuple2!3264)

(declare-fun b!31481 () Bool)

(declare-fun lt!46482 () (_ BitVec 64))

(declare-fun e!20862 () tuple2!3262)

(assert (=> b!31481 (= e!20862 (tuple2!3263 (Cons!388 (_1!1719 lt!46483) (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_2!1719 lt!46483) (bvsub lt!45683 lt!46482))) (_2!1719 lt!46483)))))

(assert (=> b!31481 (= lt!46483 (readBit!0 (_1!1711 lt!45689)))))

(assert (=> b!31481 (= lt!46482 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31483 () Bool)

(declare-fun e!20861 () Bool)

(declare-fun lt!46481 () List!392)

(assert (=> b!31483 (= e!20861 (> (length!118 lt!46481) 0))))

(declare-fun b!31482 () Bool)

(assert (=> b!31482 (= e!20861 (isEmpty!85 lt!46481))))

(declare-fun d!9236 () Bool)

(assert (=> d!9236 e!20861))

(declare-fun c!2134 () Bool)

(assert (=> d!9236 (= c!2134 (= lt!45683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9236 (= lt!46481 (_1!1718 e!20862))))

(declare-fun c!2135 () Bool)

(assert (=> d!9236 (= c!2135 (= lt!45683 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9236 (bvsge lt!45683 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9236 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!45690) (_1!1711 lt!45689) lt!45683) lt!46481)))

(declare-fun b!31480 () Bool)

(assert (=> b!31480 (= e!20862 (tuple2!3263 Nil!389 (_1!1711 lt!45689)))))

(assert (= (and d!9236 c!2135) b!31480))

(assert (= (and d!9236 (not c!2135)) b!31481))

(assert (= (and d!9236 c!2134) b!31482))

(assert (= (and d!9236 (not c!2134)) b!31483))

(declare-fun m!46451 () Bool)

(assert (=> b!31481 m!46451))

(declare-fun m!46453 () Bool)

(assert (=> b!31481 m!46453))

(declare-fun m!46455 () Bool)

(assert (=> b!31483 m!46455))

(declare-fun m!46457 () Bool)

(assert (=> b!31482 m!46457))

(assert (=> b!31200 d!9236))

(declare-fun d!9238 () Bool)

(assert (=> d!9238 (= (head!229 (byteArrayBitContentToList!0 (_2!1710 lt!45686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!507 (byteArrayBitContentToList!0 (_2!1710 lt!45686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31189 d!9238))

(declare-fun d!9240 () Bool)

(declare-fun c!2136 () Bool)

(assert (=> d!9240 (= c!2136 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20863 () List!392)

(assert (=> d!9240 (= (byteArrayBitContentToList!0 (_2!1710 lt!45686) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20863)))

(declare-fun b!31484 () Bool)

(assert (=> b!31484 (= e!20863 Nil!389)))

(declare-fun b!31485 () Bool)

(assert (=> b!31485 (= e!20863 (Cons!388 (not (= (bvand ((_ sign_extend 24) (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1710 lt!45686) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9240 c!2136) b!31484))

(assert (= (and d!9240 (not c!2136)) b!31485))

(assert (=> b!31485 m!45779))

(assert (=> b!31485 m!45909))

(declare-fun m!46459 () Bool)

(assert (=> b!31485 m!46459))

(assert (=> b!31189 d!9240))

(declare-fun d!9242 () Bool)

(assert (=> d!9242 (= (head!229 (bitStreamReadBitsIntoList!0 (_2!1710 lt!45686) (_1!1711 lt!45685) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!507 (bitStreamReadBitsIntoList!0 (_2!1710 lt!45686) (_1!1711 lt!45685) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31189 d!9242))

(declare-fun b!31487 () Bool)

(declare-fun lt!46486 () tuple2!3264)

(declare-fun e!20865 () tuple2!3262)

(declare-fun lt!46485 () (_ BitVec 64))

(assert (=> b!31487 (= e!20865 (tuple2!3263 (Cons!388 (_1!1719 lt!46486) (bitStreamReadBitsIntoList!0 (_2!1710 lt!45686) (_2!1719 lt!46486) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!46485))) (_2!1719 lt!46486)))))

(assert (=> b!31487 (= lt!46486 (readBit!0 (_1!1711 lt!45685)))))

(assert (=> b!31487 (= lt!46485 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31489 () Bool)

(declare-fun e!20864 () Bool)

(declare-fun lt!46484 () List!392)

(assert (=> b!31489 (= e!20864 (> (length!118 lt!46484) 0))))

(declare-fun b!31488 () Bool)

(assert (=> b!31488 (= e!20864 (isEmpty!85 lt!46484))))

(declare-fun d!9244 () Bool)

(assert (=> d!9244 e!20864))

(declare-fun c!2137 () Bool)

(assert (=> d!9244 (= c!2137 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9244 (= lt!46484 (_1!1718 e!20865))))

(declare-fun c!2138 () Bool)

(assert (=> d!9244 (= c!2138 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9244 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9244 (= (bitStreamReadBitsIntoList!0 (_2!1710 lt!45686) (_1!1711 lt!45685) #b0000000000000000000000000000000000000000000000000000000000000001) lt!46484)))

(declare-fun b!31486 () Bool)

(assert (=> b!31486 (= e!20865 (tuple2!3263 Nil!389 (_1!1711 lt!45685)))))

(assert (= (and d!9244 c!2138) b!31486))

(assert (= (and d!9244 (not c!2138)) b!31487))

(assert (= (and d!9244 c!2137) b!31488))

(assert (= (and d!9244 (not c!2137)) b!31489))

(declare-fun m!46461 () Bool)

(assert (=> b!31487 m!46461))

(declare-fun m!46463 () Bool)

(assert (=> b!31487 m!46463))

(declare-fun m!46465 () Bool)

(assert (=> b!31489 m!46465))

(declare-fun m!46467 () Bool)

(assert (=> b!31488 m!46467))

(assert (=> b!31189 d!9244))

(declare-fun d!9246 () Bool)

(declare-fun res!26951 () Bool)

(declare-fun e!20866 () Bool)

(assert (=> d!9246 (=> (not res!26951) (not e!20866))))

(assert (=> d!9246 (= res!26951 (= (size!789 (buf!1117 thiss!1379)) (size!789 (buf!1117 (_2!1710 lt!45686)))))))

(assert (=> d!9246 (= (isPrefixOf!0 thiss!1379 (_2!1710 lt!45686)) e!20866)))

(declare-fun b!31490 () Bool)

(declare-fun res!26952 () Bool)

(assert (=> b!31490 (=> (not res!26952) (not e!20866))))

(assert (=> b!31490 (= res!26952 (bvsle (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)) (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686)))))))

(declare-fun b!31491 () Bool)

(declare-fun e!20867 () Bool)

(assert (=> b!31491 (= e!20866 e!20867)))

(declare-fun res!26953 () Bool)

(assert (=> b!31491 (=> res!26953 e!20867)))

(assert (=> b!31491 (= res!26953 (= (size!789 (buf!1117 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31492 () Bool)

(assert (=> b!31492 (= e!20867 (arrayBitRangesEq!0 (buf!1117 thiss!1379) (buf!1117 (_2!1710 lt!45686)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379))))))

(assert (= (and d!9246 res!26951) b!31490))

(assert (= (and b!31490 res!26952) b!31491))

(assert (= (and b!31491 (not res!26953)) b!31492))

(assert (=> b!31490 m!45815))

(assert (=> b!31490 m!45791))

(assert (=> b!31492 m!45815))

(assert (=> b!31492 m!45815))

(declare-fun m!46469 () Bool)

(assert (=> b!31492 m!46469))

(assert (=> b!31188 d!9246))

(declare-fun d!9248 () Bool)

(assert (=> d!9248 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) lt!45683) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686)))) lt!45683))))

(declare-fun bs!2547 () Bool)

(assert (= bs!2547 d!9248))

(declare-fun m!46471 () Bool)

(assert (=> bs!2547 m!46471))

(assert (=> b!31188 d!9248))

(declare-fun d!9250 () Bool)

(declare-fun e!20870 () Bool)

(assert (=> d!9250 e!20870))

(declare-fun res!26956 () Bool)

(assert (=> d!9250 (=> (not res!26956) (not e!20870))))

(assert (=> d!9250 (= res!26956 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!46489 () Unit!2385)

(declare-fun choose!27 (BitStream!1382 BitStream!1382 (_ BitVec 64) (_ BitVec 64)) Unit!2385)

(assert (=> d!9250 (= lt!46489 (choose!27 thiss!1379 (_2!1710 lt!45686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9250 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9250 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1710 lt!45686) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!46489)))

(declare-fun b!31495 () Bool)

(assert (=> b!31495 (= e!20870 (validate_offset_bits!1 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9250 res!26956) b!31495))

(declare-fun m!46473 () Bool)

(assert (=> d!9250 m!46473))

(declare-fun m!46475 () Bool)

(assert (=> b!31495 m!46475))

(assert (=> b!31188 d!9250))

(declare-fun b!31537 () Bool)

(declare-fun res!26998 () Bool)

(declare-fun e!20894 () Bool)

(assert (=> b!31537 (=> (not res!26998) (not e!20894))))

(declare-fun lt!46583 () tuple2!3246)

(assert (=> b!31537 (= res!26998 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46583))) (currentByte!2472 (_2!1710 lt!46583)) (currentBit!2467 (_2!1710 lt!46583))) (bvadd (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!31538 () Bool)

(declare-fun e!20895 () Bool)

(declare-datatypes ((tuple2!3268 0))(
  ( (tuple2!3269 (_1!1721 BitStream!1382) (_2!1721 Bool)) )
))
(declare-fun lt!46590 () tuple2!3268)

(declare-fun lt!46588 () tuple2!3246)

(assert (=> b!31538 (= e!20895 (= (bitIndex!0 (size!789 (buf!1117 (_1!1721 lt!46590))) (currentByte!2472 (_1!1721 lt!46590)) (currentBit!2467 (_1!1721 lt!46590))) (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46588))) (currentByte!2472 (_2!1710 lt!46588)) (currentBit!2467 (_2!1710 lt!46588)))))))

(declare-fun b!31539 () Bool)

(declare-fun e!20893 () Bool)

(declare-fun lt!46589 () tuple2!3268)

(assert (=> b!31539 (= e!20893 (= (bitIndex!0 (size!789 (buf!1117 (_1!1721 lt!46589))) (currentByte!2472 (_1!1721 lt!46589)) (currentBit!2467 (_1!1721 lt!46589))) (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46583))) (currentByte!2472 (_2!1710 lt!46583)) (currentBit!2467 (_2!1710 lt!46583)))))))

(declare-fun b!31540 () Bool)

(declare-fun res!26993 () Bool)

(declare-fun e!20892 () Bool)

(assert (=> b!31540 (=> (not res!26993) (not e!20892))))

(declare-fun lt!46587 () (_ BitVec 64))

(declare-fun lt!46581 () (_ BitVec 64))

(assert (=> b!31540 (= res!26993 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!46588))) (currentByte!2472 (_2!1710 lt!46588)) (currentBit!2467 (_2!1710 lt!46588))) (bvadd lt!46587 lt!46581)))))

(assert (=> b!31540 (or (not (= (bvand lt!46587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46581 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!46587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!46587 lt!46581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31540 (= lt!46581 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!31540 (= lt!46587 (bitIndex!0 (size!789 (buf!1117 thiss!1379)) (currentByte!2472 thiss!1379) (currentBit!2467 thiss!1379)))))

(declare-fun b!31541 () Bool)

(assert (=> b!31541 (= e!20894 e!20893)))

(declare-fun res!26997 () Bool)

(assert (=> b!31541 (=> (not res!26997) (not e!20893))))

(declare-fun lt!46584 () Bool)

(assert (=> b!31541 (= res!26997 (and (= (_2!1721 lt!46589) lt!46584) (= (_1!1721 lt!46589) (_2!1710 lt!46583))))))

(declare-fun readBitPure!0 (BitStream!1382) tuple2!3268)

(declare-fun readerFrom!0 (BitStream!1382 (_ BitVec 32) (_ BitVec 32)) BitStream!1382)

(assert (=> b!31541 (= lt!46589 (readBitPure!0 (readerFrom!0 (_2!1710 lt!46583) (currentBit!2467 thiss!1379) (currentByte!2472 thiss!1379))))))

(declare-fun b!31542 () Bool)

(assert (=> b!31542 (= e!20892 e!20895)))

(declare-fun res!26991 () Bool)

(assert (=> b!31542 (=> (not res!26991) (not e!20895))))

(declare-fun lt!46585 () (_ BitVec 8))

(assert (=> b!31542 (= res!26991 (and (= (_2!1721 lt!46590) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!46585)) #b00000000000000000000000000000000))) (= (_1!1721 lt!46590) (_2!1710 lt!46588))))))

(declare-fun lt!46580 () tuple2!3258)

(declare-fun lt!46591 () BitStream!1382)

(assert (=> b!31542 (= lt!46580 (readBits!0 lt!46591 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!31542 (= lt!46590 (readBitPure!0 lt!46591))))

(assert (=> b!31542 (= lt!46591 (readerFrom!0 (_2!1710 lt!46588) (currentBit!2467 thiss!1379) (currentByte!2472 thiss!1379)))))

(declare-fun d!9252 () Bool)

(assert (=> d!9252 e!20892))

(declare-fun res!26995 () Bool)

(assert (=> d!9252 (=> (not res!26995) (not e!20892))))

(assert (=> d!9252 (= res!26995 (= (size!789 (buf!1117 (_2!1710 lt!46588))) (size!789 (buf!1117 thiss!1379))))))

(declare-fun lt!46582 () array!1800)

(assert (=> d!9252 (= lt!46585 (select (arr!1258 lt!46582) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9252 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!789 lt!46582)))))

(assert (=> d!9252 (= lt!46582 (array!1801 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!46586 () tuple2!3246)

(assert (=> d!9252 (= lt!46588 (tuple2!3247 (_1!1710 lt!46586) (_2!1710 lt!46586)))))

(assert (=> d!9252 (= lt!46586 lt!46583)))

(assert (=> d!9252 e!20894))

(declare-fun res!26992 () Bool)

(assert (=> d!9252 (=> (not res!26992) (not e!20894))))

(assert (=> d!9252 (= res!26992 (= (size!789 (buf!1117 thiss!1379)) (size!789 (buf!1117 (_2!1710 lt!46583)))))))

(declare-fun appendBit!0 (BitStream!1382 Bool) tuple2!3246)

(assert (=> d!9252 (= lt!46583 (appendBit!0 thiss!1379 lt!46584))))

(assert (=> d!9252 (= lt!46584 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9252 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9252 (= (appendBitFromByte!0 thiss!1379 (select (arr!1258 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!46588)))

(declare-fun b!31543 () Bool)

(declare-fun res!26994 () Bool)

(assert (=> b!31543 (=> (not res!26994) (not e!20892))))

(assert (=> b!31543 (= res!26994 (isPrefixOf!0 thiss!1379 (_2!1710 lt!46588)))))

(declare-fun b!31544 () Bool)

(declare-fun res!26996 () Bool)

(assert (=> b!31544 (=> (not res!26996) (not e!20894))))

(assert (=> b!31544 (= res!26996 (isPrefixOf!0 thiss!1379 (_2!1710 lt!46583)))))

(assert (= (and d!9252 res!26992) b!31537))

(assert (= (and b!31537 res!26998) b!31544))

(assert (= (and b!31544 res!26996) b!31541))

(assert (= (and b!31541 res!26997) b!31539))

(assert (= (and d!9252 res!26995) b!31540))

(assert (= (and b!31540 res!26993) b!31543))

(assert (= (and b!31543 res!26994) b!31542))

(assert (= (and b!31542 res!26991) b!31538))

(declare-fun m!46511 () Bool)

(assert (=> b!31540 m!46511))

(assert (=> b!31540 m!45815))

(declare-fun m!46513 () Bool)

(assert (=> b!31542 m!46513))

(declare-fun m!46515 () Bool)

(assert (=> b!31542 m!46515))

(declare-fun m!46517 () Bool)

(assert (=> b!31542 m!46517))

(declare-fun m!46519 () Bool)

(assert (=> b!31541 m!46519))

(assert (=> b!31541 m!46519))

(declare-fun m!46521 () Bool)

(assert (=> b!31541 m!46521))

(declare-fun m!46523 () Bool)

(assert (=> b!31539 m!46523))

(declare-fun m!46525 () Bool)

(assert (=> b!31539 m!46525))

(declare-fun m!46527 () Bool)

(assert (=> b!31543 m!46527))

(declare-fun m!46529 () Bool)

(assert (=> b!31538 m!46529))

(assert (=> b!31538 m!46511))

(assert (=> b!31537 m!46525))

(assert (=> b!31537 m!45815))

(declare-fun m!46531 () Bool)

(assert (=> d!9252 m!46531))

(declare-fun m!46533 () Bool)

(assert (=> d!9252 m!46533))

(assert (=> d!9252 m!45909))

(declare-fun m!46535 () Bool)

(assert (=> b!31544 m!46535))

(assert (=> b!31188 d!9252))

(declare-fun d!9268 () Bool)

(assert (=> d!9268 (= (invariant!0 (currentBit!2467 (_2!1710 lt!45686)) (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45686)))) (and (bvsge (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (bvslt (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000001000) (bvsge (currentByte!2472 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45686)))) (and (= (currentBit!2467 (_2!1710 lt!45686)) #b00000000000000000000000000000000) (= (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45686))))))))))

(assert (=> b!31199 d!9268))

(declare-fun d!9270 () Bool)

(declare-fun e!20896 () Bool)

(assert (=> d!9270 e!20896))

(declare-fun res!26999 () Bool)

(assert (=> d!9270 (=> (not res!26999) (not e!20896))))

(declare-fun lt!46595 () (_ BitVec 64))

(declare-fun lt!46592 () (_ BitVec 64))

(declare-fun lt!46593 () (_ BitVec 64))

(assert (=> d!9270 (= res!26999 (= lt!46595 (bvsub lt!46593 lt!46592)))))

(assert (=> d!9270 (or (= (bvand lt!46593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46592 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46593 lt!46592) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9270 (= lt!46592 (remainingBits!0 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))) ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686)))))))

(declare-fun lt!46596 () (_ BitVec 64))

(declare-fun lt!46594 () (_ BitVec 64))

(assert (=> d!9270 (= lt!46593 (bvmul lt!46596 lt!46594))))

(assert (=> d!9270 (or (= lt!46596 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!46594 (bvsdiv (bvmul lt!46596 lt!46594) lt!46596)))))

(assert (=> d!9270 (= lt!46594 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9270 (= lt!46596 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))))))

(assert (=> d!9270 (= lt!46595 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2472 (_2!1710 lt!45686))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2467 (_2!1710 lt!45686)))))))

(assert (=> d!9270 (invariant!0 (currentBit!2467 (_2!1710 lt!45686)) (currentByte!2472 (_2!1710 lt!45686)) (size!789 (buf!1117 (_2!1710 lt!45686))))))

(assert (=> d!9270 (= (bitIndex!0 (size!789 (buf!1117 (_2!1710 lt!45686))) (currentByte!2472 (_2!1710 lt!45686)) (currentBit!2467 (_2!1710 lt!45686))) lt!46595)))

(declare-fun b!31545 () Bool)

(declare-fun res!27000 () Bool)

(assert (=> b!31545 (=> (not res!27000) (not e!20896))))

(assert (=> b!31545 (= res!27000 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!46595))))

(declare-fun b!31546 () Bool)

(declare-fun lt!46597 () (_ BitVec 64))

(assert (=> b!31546 (= e!20896 (bvsle lt!46595 (bvmul lt!46597 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31546 (or (= lt!46597 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!46597 #b0000000000000000000000000000000000000000000000000000000000001000) lt!46597)))))

(assert (=> b!31546 (= lt!46597 ((_ sign_extend 32) (size!789 (buf!1117 (_2!1710 lt!45686)))))))

(assert (= (and d!9270 res!26999) b!31545))

(assert (= (and b!31545 res!27000) b!31546))

(assert (=> d!9270 m!46471))

(assert (=> d!9270 m!45821))

(assert (=> b!31187 d!9270))

(push 1)

(assert (not d!9228))

(assert (not b!31542))

(assert (not b!31406))

(assert (not d!9226))

(assert (not b!31495))

(assert (not d!9104))

(assert (not b!31475))

(assert (not b!31427))

(assert (not b!31451))

(assert (not b!31432))

(assert (not b!31540))

(assert (not b!31408))

(assert (not b!31404))

(assert (not b!31434))

(assert (not d!9270))

(assert (not b!31274))

(assert (not bm!403))

(assert (not d!9216))

(assert (not d!9218))

(assert (not b!31487))

(assert (not b!31452))

(assert (not b!31272))

(assert (not b!31483))

(assert (not b!31476))

(assert (not d!9140))

(assert (not b!31537))

(assert (not b!31541))

(assert (not b!31539))

(assert (not d!9222))

(assert (not b!31410))

(assert (not b!31543))

(assert (not d!9212))

(assert (not b!31488))

(assert (not b!31428))

(assert (not d!9110))

(assert (not b!31490))

(assert (not d!9138))

(assert (not b!31472))

(assert (not d!9250))

(assert (not b!31407))

(assert (not b!31431))

(assert (not b!31538))

(assert (not d!9252))

(assert (not b!31403))

(assert (not b!31477))

(assert (not b!31454))

(assert (not b!31482))

(assert (not b!31544))

(assert (not b!31412))

(assert (not d!9220))

(assert (not d!9208))

(assert (not d!9248))

(assert (not d!9120))

(assert (not b!31492))

(assert (not b!31402))

(assert (not b!31429))

(assert (not d!9142))

(assert (not b!31265))

(assert (not d!9232))

(assert (not b!31473))

(assert (not b!31481))

(assert (not d!9224))

(assert (not d!9132))

(assert (not b!31479))

(assert (not b!31489))

(assert (not b!31449))

(assert (not b!31485))

(assert (not d!9130))

(assert (not b!31474))

(assert (not b!31450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

