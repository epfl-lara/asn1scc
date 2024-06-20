; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10026 () Bool)

(assert start!10026)

(declare-fun b!50942 () Bool)

(declare-fun e!33686 () Bool)

(declare-fun e!33688 () Bool)

(assert (=> b!50942 (= e!33686 e!33688)))

(declare-fun res!42700 () Bool)

(assert (=> b!50942 (=> res!42700 e!33688)))

(declare-fun lt!78844 () Bool)

(declare-fun lt!78823 () Bool)

(assert (=> b!50942 (= res!42700 (not (= lt!78844 lt!78823)))))

(declare-fun lt!78824 () Bool)

(assert (=> b!50942 (= lt!78824 lt!78844)))

(declare-datatypes ((array!2348 0))(
  ( (array!2349 (arr!1597 (Array (_ BitVec 32) (_ BitVec 8))) (size!1068 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1850 0))(
  ( (BitStream!1851 (buf!1423 array!2348) (currentByte!2946 (_ BitVec 32)) (currentBit!2941 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3511 0))(
  ( (Unit!3512) )
))
(declare-datatypes ((tuple2!4692 0))(
  ( (tuple2!4693 (_1!2451 Unit!3511) (_2!2451 BitStream!1850)) )
))
(declare-fun lt!78842 () tuple2!4692)

(declare-fun lt!78843 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2348 (_ BitVec 64)) Bool)

(assert (=> b!50942 (= lt!78844 (bitAt!0 (buf!1423 (_2!2451 lt!78842)) lt!78843))))

(declare-fun lt!78832 () tuple2!4692)

(declare-fun lt!78840 () (_ BitVec 64))

(declare-fun lt!78839 () Unit!3511)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2348 array!2348 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3511)

(assert (=> b!50942 (= lt!78839 (arrayBitRangesEqImpliesEq!0 (buf!1423 (_2!2451 lt!78832)) (buf!1423 (_2!2451 lt!78842)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78843 lt!78840))))

(declare-fun b!50943 () Bool)

(declare-fun e!33699 () Bool)

(declare-fun e!33698 () Bool)

(assert (=> b!50943 (= e!33699 (not e!33698))))

(declare-fun res!42693 () Bool)

(assert (=> b!50943 (=> res!42693 e!33698)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!50943 (= res!42693 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1850)

(declare-fun isPrefixOf!0 (BitStream!1850 BitStream!1850) Bool)

(assert (=> b!50943 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78837 () Unit!3511)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1850) Unit!3511)

(assert (=> b!50943 (= lt!78837 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50943 (= lt!78843 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(declare-fun b!50944 () Bool)

(declare-fun e!33689 () Bool)

(assert (=> b!50944 (= e!33689 e!33686)))

(declare-fun res!42699 () Bool)

(assert (=> b!50944 (=> res!42699 e!33686)))

(assert (=> b!50944 (= res!42699 (not (= lt!78824 lt!78823)))))

(assert (=> b!50944 (= lt!78824 (bitAt!0 (buf!1423 (_2!2451 lt!78832)) lt!78843))))

(declare-fun b!50945 () Bool)

(declare-fun e!33692 () Bool)

(assert (=> b!50945 (= e!33692 e!33689)))

(declare-fun res!42695 () Bool)

(assert (=> b!50945 (=> res!42695 e!33689)))

(declare-fun srcBuffer!2 () array!2348)

(declare-datatypes ((List!566 0))(
  ( (Nil!563) (Cons!562 (h!681 Bool) (t!1316 List!566)) )
))
(declare-fun head!385 (List!566) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1850 array!2348 (_ BitVec 64) (_ BitVec 64)) List!566)

(assert (=> b!50945 (= res!42695 (not (= (head!385 (byteArrayBitContentToList!0 (_2!2451 lt!78842) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78823)))))

(assert (=> b!50945 (= lt!78823 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50946 () Bool)

(declare-fun e!33687 () Bool)

(declare-fun e!33696 () Bool)

(assert (=> b!50946 (= e!33687 e!33696)))

(declare-fun res!42690 () Bool)

(assert (=> b!50946 (=> res!42690 e!33696)))

(assert (=> b!50946 (= res!42690 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78831 () (_ BitVec 64))

(declare-fun lt!78827 () List!566)

(declare-datatypes ((tuple2!4694 0))(
  ( (tuple2!4695 (_1!2452 BitStream!1850) (_2!2452 BitStream!1850)) )
))
(declare-fun lt!78826 () tuple2!4694)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1850 BitStream!1850 (_ BitVec 64)) List!566)

(assert (=> b!50946 (= lt!78827 (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_1!2452 lt!78826) lt!78831))))

(declare-fun lt!78833 () List!566)

(declare-fun lt!78841 () tuple2!4694)

(assert (=> b!50946 (= lt!78833 (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_1!2452 lt!78841) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!78831)))

(declare-fun lt!78822 () Unit!3511)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1850 array!2348 (_ BitVec 64)) Unit!3511)

(assert (=> b!50946 (= lt!78822 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!78842)) lt!78831))))

(declare-fun reader!0 (BitStream!1850 BitStream!1850) tuple2!4694)

(assert (=> b!50946 (= lt!78826 (reader!0 (_2!2451 lt!78832) (_2!2451 lt!78842)))))

(assert (=> b!50946 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78838 () Unit!3511)

(assert (=> b!50946 (= lt!78838 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1423 (_2!2451 lt!78842)) (bvsub to!314 i!635)))))

(assert (=> b!50946 (= lt!78841 (reader!0 thiss!1379 (_2!2451 lt!78842)))))

(declare-fun b!50947 () Bool)

(declare-fun e!33693 () Bool)

(assert (=> b!50947 (= e!33696 e!33693)))

(declare-fun res!42705 () Bool)

(assert (=> b!50947 (=> res!42705 e!33693)))

(declare-fun lt!78830 () List!566)

(assert (=> b!50947 (= res!42705 (not (= lt!78830 lt!78827)))))

(assert (=> b!50947 (= lt!78827 lt!78830)))

(declare-fun tail!252 (List!566) List!566)

(assert (=> b!50947 (= lt!78830 (tail!252 lt!78833))))

(declare-fun lt!78821 () Unit!3511)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1850 BitStream!1850 BitStream!1850 BitStream!1850 (_ BitVec 64) List!566) Unit!3511)

(assert (=> b!50947 (= lt!78821 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2451 lt!78842) (_2!2451 lt!78842) (_1!2452 lt!78841) (_1!2452 lt!78826) (bvsub to!314 i!635) lt!78833))))

(declare-fun b!50948 () Bool)

(declare-fun e!33694 () Bool)

(declare-fun e!33701 () Bool)

(assert (=> b!50948 (= e!33694 e!33701)))

(declare-fun res!42689 () Bool)

(assert (=> b!50948 (=> res!42689 e!33701)))

(declare-fun lt!78825 () (_ BitVec 64))

(assert (=> b!50948 (= res!42689 (not (= lt!78825 (bvsub (bvadd lt!78843 to!314) i!635))))))

(assert (=> b!50948 (= lt!78825 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842))))))

(declare-fun b!50949 () Bool)

(declare-fun res!42698 () Bool)

(assert (=> b!50949 (=> res!42698 e!33687)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50949 (= res!42698 (not (invariant!0 (currentBit!2941 (_2!2451 lt!78832)) (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78832))))))))

(declare-fun b!50950 () Bool)

(declare-fun res!42703 () Bool)

(assert (=> b!50950 (=> res!42703 e!33701)))

(assert (=> b!50950 (= res!42703 (not (invariant!0 (currentBit!2941 (_2!2451 lt!78842)) (currentByte!2946 (_2!2451 lt!78842)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))

(declare-fun b!50951 () Bool)

(declare-fun res!42694 () Bool)

(assert (=> b!50951 (=> (not res!42694) (not e!33699))))

(assert (=> b!50951 (= res!42694 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50952 () Bool)

(declare-fun e!33700 () Bool)

(assert (=> b!50952 (= e!33698 e!33700)))

(declare-fun res!42701 () Bool)

(assert (=> b!50952 (=> res!42701 e!33700)))

(assert (=> b!50952 (= res!42701 (not (isPrefixOf!0 thiss!1379 (_2!2451 lt!78832))))))

(assert (=> b!50952 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!78831)))

(assert (=> b!50952 (= lt!78831 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78836 () Unit!3511)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1850 BitStream!1850 (_ BitVec 64) (_ BitVec 64)) Unit!3511)

(assert (=> b!50952 (= lt!78836 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2451 lt!78832) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1850 (_ BitVec 8) (_ BitVec 32)) tuple2!4692)

(assert (=> b!50952 (= lt!78832 (appendBitFromByte!0 thiss!1379 (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50953 () Bool)

(assert (=> b!50953 (= e!33700 e!33694)))

(declare-fun res!42692 () Bool)

(assert (=> b!50953 (=> res!42692 e!33694)))

(assert (=> b!50953 (= res!42692 (not (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78842))))))

(assert (=> b!50953 (isPrefixOf!0 thiss!1379 (_2!2451 lt!78842))))

(declare-fun lt!78834 () Unit!3511)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1850 BitStream!1850 BitStream!1850) Unit!3511)

(assert (=> b!50953 (= lt!78834 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2451 lt!78832) (_2!2451 lt!78842)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1850 array!2348 (_ BitVec 64) (_ BitVec 64)) tuple2!4692)

(assert (=> b!50953 (= lt!78842 (appendBitsMSBFirstLoop!0 (_2!2451 lt!78832) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!33690 () Bool)

(assert (=> b!50953 e!33690))

(declare-fun res!42691 () Bool)

(assert (=> b!50953 (=> (not res!42691) (not e!33690))))

(assert (=> b!50953 (= res!42691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78829 () Unit!3511)

(assert (=> b!50953 (= lt!78829 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1423 (_2!2451 lt!78832)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78835 () tuple2!4694)

(assert (=> b!50953 (= lt!78835 (reader!0 thiss!1379 (_2!2451 lt!78832)))))

(declare-fun b!50954 () Bool)

(declare-fun res!42708 () Bool)

(assert (=> b!50954 (=> res!42708 e!33687)))

(assert (=> b!50954 (= res!42708 (not (invariant!0 (currentBit!2941 (_2!2451 lt!78832)) (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))

(declare-fun b!50955 () Bool)

(declare-fun e!33691 () Bool)

(declare-fun array_inv!978 (array!2348) Bool)

(assert (=> b!50955 (= e!33691 (array_inv!978 (buf!1423 thiss!1379)))))

(declare-fun res!42702 () Bool)

(assert (=> start!10026 (=> (not res!42702) (not e!33699))))

(assert (=> start!10026 (= res!42702 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1068 srcBuffer!2))))))))

(assert (=> start!10026 e!33699))

(assert (=> start!10026 true))

(assert (=> start!10026 (array_inv!978 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1850) Bool)

(assert (=> start!10026 (and (inv!12 thiss!1379) e!33691)))

(declare-fun b!50956 () Bool)

(assert (=> b!50956 (= e!33693 e!33692)))

(declare-fun res!42706 () Bool)

(assert (=> b!50956 (=> res!42706 e!33692)))

(declare-fun lt!78828 () Bool)

(assert (=> b!50956 (= res!42706 (not (= lt!78828 (bitAt!0 (buf!1423 (_1!2452 lt!78826)) lt!78843))))))

(assert (=> b!50956 (= lt!78828 (bitAt!0 (buf!1423 (_1!2452 lt!78841)) lt!78843))))

(declare-fun b!50957 () Bool)

(assert (=> b!50957 (= e!33701 e!33687)))

(declare-fun res!42697 () Bool)

(assert (=> b!50957 (=> res!42697 e!33687)))

(assert (=> b!50957 (= res!42697 (not (= (size!1068 (buf!1423 (_2!2451 lt!78832))) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))

(assert (=> b!50957 (= lt!78825 (bvsub (bvsub (bvadd lt!78840 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50957 (= lt!78840 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(assert (=> b!50957 (= (size!1068 (buf!1423 (_2!2451 lt!78842))) (size!1068 (buf!1423 thiss!1379)))))

(declare-fun b!50958 () Bool)

(assert (=> b!50958 (= e!33690 (= (head!385 (byteArrayBitContentToList!0 (_2!2451 lt!78832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!385 (bitStreamReadBitsIntoList!0 (_2!2451 lt!78832) (_1!2452 lt!78835) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!50959 () Bool)

(declare-fun res!42704 () Bool)

(assert (=> b!50959 (=> res!42704 e!33692)))

(assert (=> b!50959 (= res!42704 (not (= (head!385 lt!78833) lt!78828)))))

(declare-fun b!50960 () Bool)

(declare-fun res!42707 () Bool)

(assert (=> b!50960 (=> res!42707 e!33696)))

(declare-fun length!261 (List!566) Int)

(assert (=> b!50960 (= res!42707 (<= (length!261 lt!78833) 0))))

(declare-fun b!50961 () Bool)

(declare-datatypes ((tuple2!4696 0))(
  ( (tuple2!4697 (_1!2453 BitStream!1850) (_2!2453 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1850) tuple2!4696)

(assert (=> b!50961 (= e!33688 (= (_2!2453 (readBitPure!0 (_1!2452 lt!78841))) lt!78823))))

(declare-fun b!50962 () Bool)

(declare-fun res!42696 () Bool)

(assert (=> b!50962 (=> res!42696 e!33701)))

(assert (=> b!50962 (= res!42696 (not (= (size!1068 (buf!1423 thiss!1379)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))

(assert (= (and start!10026 res!42702) b!50951))

(assert (= (and b!50951 res!42694) b!50943))

(assert (= (and b!50943 (not res!42693)) b!50952))

(assert (= (and b!50952 (not res!42701)) b!50953))

(assert (= (and b!50953 res!42691) b!50958))

(assert (= (and b!50953 (not res!42692)) b!50948))

(assert (= (and b!50948 (not res!42689)) b!50950))

(assert (= (and b!50950 (not res!42703)) b!50962))

(assert (= (and b!50962 (not res!42696)) b!50957))

(assert (= (and b!50957 (not res!42697)) b!50949))

(assert (= (and b!50949 (not res!42698)) b!50954))

(assert (= (and b!50954 (not res!42708)) b!50946))

(assert (= (and b!50946 (not res!42690)) b!50960))

(assert (= (and b!50960 (not res!42707)) b!50947))

(assert (= (and b!50947 (not res!42705)) b!50956))

(assert (= (and b!50956 (not res!42706)) b!50959))

(assert (= (and b!50959 (not res!42704)) b!50945))

(assert (= (and b!50945 (not res!42695)) b!50944))

(assert (= (and b!50944 (not res!42699)) b!50942))

(assert (= (and b!50942 (not res!42700)) b!50961))

(assert (= start!10026 b!50955))

(declare-fun m!80143 () Bool)

(assert (=> b!50953 m!80143))

(declare-fun m!80145 () Bool)

(assert (=> b!50953 m!80145))

(declare-fun m!80147 () Bool)

(assert (=> b!50953 m!80147))

(declare-fun m!80149 () Bool)

(assert (=> b!50953 m!80149))

(declare-fun m!80151 () Bool)

(assert (=> b!50953 m!80151))

(declare-fun m!80153 () Bool)

(assert (=> b!50953 m!80153))

(declare-fun m!80155 () Bool)

(assert (=> b!50953 m!80155))

(declare-fun m!80157 () Bool)

(assert (=> b!50945 m!80157))

(assert (=> b!50945 m!80157))

(declare-fun m!80159 () Bool)

(assert (=> b!50945 m!80159))

(declare-fun m!80161 () Bool)

(assert (=> b!50945 m!80161))

(declare-fun m!80163 () Bool)

(assert (=> b!50960 m!80163))

(declare-fun m!80165 () Bool)

(assert (=> b!50949 m!80165))

(declare-fun m!80167 () Bool)

(assert (=> b!50958 m!80167))

(assert (=> b!50958 m!80167))

(declare-fun m!80169 () Bool)

(assert (=> b!50958 m!80169))

(declare-fun m!80171 () Bool)

(assert (=> b!50958 m!80171))

(assert (=> b!50958 m!80171))

(declare-fun m!80173 () Bool)

(assert (=> b!50958 m!80173))

(declare-fun m!80175 () Bool)

(assert (=> b!50948 m!80175))

(declare-fun m!80177 () Bool)

(assert (=> start!10026 m!80177))

(declare-fun m!80179 () Bool)

(assert (=> start!10026 m!80179))

(declare-fun m!80181 () Bool)

(assert (=> b!50957 m!80181))

(declare-fun m!80183 () Bool)

(assert (=> b!50954 m!80183))

(declare-fun m!80185 () Bool)

(assert (=> b!50944 m!80185))

(declare-fun m!80187 () Bool)

(assert (=> b!50961 m!80187))

(declare-fun m!80189 () Bool)

(assert (=> b!50946 m!80189))

(declare-fun m!80191 () Bool)

(assert (=> b!50946 m!80191))

(declare-fun m!80193 () Bool)

(assert (=> b!50946 m!80193))

(declare-fun m!80195 () Bool)

(assert (=> b!50946 m!80195))

(declare-fun m!80197 () Bool)

(assert (=> b!50946 m!80197))

(declare-fun m!80199 () Bool)

(assert (=> b!50946 m!80199))

(declare-fun m!80201 () Bool)

(assert (=> b!50946 m!80201))

(declare-fun m!80203 () Bool)

(assert (=> b!50946 m!80203))

(declare-fun m!80205 () Bool)

(assert (=> b!50943 m!80205))

(declare-fun m!80207 () Bool)

(assert (=> b!50943 m!80207))

(declare-fun m!80209 () Bool)

(assert (=> b!50943 m!80209))

(declare-fun m!80211 () Bool)

(assert (=> b!50959 m!80211))

(declare-fun m!80213 () Bool)

(assert (=> b!50947 m!80213))

(declare-fun m!80215 () Bool)

(assert (=> b!50947 m!80215))

(declare-fun m!80217 () Bool)

(assert (=> b!50956 m!80217))

(declare-fun m!80219 () Bool)

(assert (=> b!50956 m!80219))

(declare-fun m!80221 () Bool)

(assert (=> b!50952 m!80221))

(declare-fun m!80223 () Bool)

(assert (=> b!50952 m!80223))

(assert (=> b!50952 m!80221))

(declare-fun m!80225 () Bool)

(assert (=> b!50952 m!80225))

(declare-fun m!80227 () Bool)

(assert (=> b!50952 m!80227))

(declare-fun m!80229 () Bool)

(assert (=> b!50952 m!80229))

(declare-fun m!80231 () Bool)

(assert (=> b!50955 m!80231))

(declare-fun m!80233 () Bool)

(assert (=> b!50951 m!80233))

(declare-fun m!80235 () Bool)

(assert (=> b!50942 m!80235))

(declare-fun m!80237 () Bool)

(assert (=> b!50942 m!80237))

(declare-fun m!80239 () Bool)

(assert (=> b!50950 m!80239))

(push 1)

(assert (not b!50956))

(assert (not b!50945))

(assert (not b!50946))

(assert (not b!50944))

(assert (not b!50954))

(assert (not b!50961))

(assert (not b!50950))

(assert (not b!50959))

(assert (not b!50951))

(assert (not b!50960))

(assert (not b!50953))

(assert (not b!50958))

(assert (not b!50949))

(assert (not start!10026))

(assert (not b!50943))

(assert (not b!50952))

(assert (not b!50957))

(assert (not b!50955))

(assert (not b!50947))

(assert (not b!50942))

(assert (not b!50948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!15986 () Bool)

(assert (=> d!15986 (= (bitAt!0 (buf!1423 (_1!2452 lt!78826)) lt!78843) (not (= (bvand ((_ sign_extend 24) (select (arr!1597 (buf!1423 (_1!2452 lt!78826))) ((_ extract 31 0) (bvsdiv lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4018 () Bool)

(assert (= bs!4018 d!15986))

(declare-fun m!80275 () Bool)

(assert (=> bs!4018 m!80275))

(declare-fun m!80277 () Bool)

(assert (=> bs!4018 m!80277))

(assert (=> b!50956 d!15986))

(declare-fun d!15988 () Bool)

(assert (=> d!15988 (= (bitAt!0 (buf!1423 (_1!2452 lt!78841)) lt!78843) (not (= (bvand ((_ sign_extend 24) (select (arr!1597 (buf!1423 (_1!2452 lt!78841))) ((_ extract 31 0) (bvsdiv lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4019 () Bool)

(assert (= bs!4019 d!15988))

(declare-fun m!80279 () Bool)

(assert (=> bs!4019 m!80279))

(assert (=> bs!4019 m!80277))

(assert (=> b!50956 d!15988))

(declare-fun d!15990 () Bool)

(assert (=> d!15990 (= (head!385 (byteArrayBitContentToList!0 (_2!2451 lt!78842) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!681 (byteArrayBitContentToList!0 (_2!2451 lt!78842) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!50945 d!15990))

(declare-fun d!15992 () Bool)

(declare-fun c!3618 () Bool)

(assert (=> d!15992 (= c!3618 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33716 () List!566)

(assert (=> d!15992 (= (byteArrayBitContentToList!0 (_2!2451 lt!78842) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!33716)))

(declare-fun b!50991 () Bool)

(assert (=> b!50991 (= e!33716 Nil!563)))

(declare-fun b!50992 () Bool)

(assert (=> b!50992 (= e!33716 (Cons!562 (not (= (bvand ((_ sign_extend 24) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2451 lt!78842) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!15992 c!3618) b!50991))

(assert (= (and d!15992 (not c!3618)) b!50992))

(assert (=> b!50992 m!80221))

(declare-fun m!80281 () Bool)

(assert (=> b!50992 m!80281))

(declare-fun m!80283 () Bool)

(assert (=> b!50992 m!80283))

(assert (=> b!50945 d!15992))

(declare-fun d!15996 () Bool)

(assert (=> d!15996 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4020 () Bool)

(assert (= bs!4020 d!15996))

(assert (=> bs!4020 m!80221))

(assert (=> bs!4020 m!80281))

(assert (=> b!50945 d!15996))

(declare-fun d!15998 () Bool)

(assert (=> d!15998 (= (array_inv!978 (buf!1423 thiss!1379)) (bvsge (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!50955 d!15998))

(declare-fun d!16002 () Bool)

(assert (=> d!16002 (= (bitAt!0 (buf!1423 (_2!2451 lt!78832)) lt!78843) (not (= (bvand ((_ sign_extend 24) (select (arr!1597 (buf!1423 (_2!2451 lt!78832))) ((_ extract 31 0) (bvsdiv lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4022 () Bool)

(assert (= bs!4022 d!16002))

(declare-fun m!80287 () Bool)

(assert (=> bs!4022 m!80287))

(assert (=> bs!4022 m!80277))

(assert (=> b!50944 d!16002))

(declare-fun d!16004 () Bool)

(assert (=> d!16004 (= (invariant!0 (currentBit!2941 (_2!2451 lt!78832)) (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78842)))) (and (bvsge (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (bvslt (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000001000) (bvsge (currentByte!2946 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78842)))) (and (= (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (= (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))))

(assert (=> b!50954 d!16004))

(declare-fun d!16006 () Bool)

(declare-fun res!42735 () Bool)

(declare-fun e!33722 () Bool)

(assert (=> d!16006 (=> (not res!42735) (not e!33722))))

(assert (=> d!16006 (= res!42735 (= (size!1068 (buf!1423 thiss!1379)) (size!1068 (buf!1423 thiss!1379))))))

(assert (=> d!16006 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!33722)))

(declare-fun b!50999 () Bool)

(declare-fun res!42733 () Bool)

(assert (=> b!50999 (=> (not res!42733) (not e!33722))))

(assert (=> b!50999 (= res!42733 (bvsle (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)) (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(declare-fun b!51000 () Bool)

(declare-fun e!33721 () Bool)

(assert (=> b!51000 (= e!33722 e!33721)))

(declare-fun res!42734 () Bool)

(assert (=> b!51000 (=> res!42734 e!33721)))

(assert (=> b!51000 (= res!42734 (= (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51001 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2348 array!2348 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51001 (= e!33721 (arrayBitRangesEq!0 (buf!1423 thiss!1379) (buf!1423 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(assert (= (and d!16006 res!42735) b!50999))

(assert (= (and b!50999 res!42733) b!51000))

(assert (= (and b!51000 (not res!42734)) b!51001))

(assert (=> b!50999 m!80209))

(assert (=> b!50999 m!80209))

(assert (=> b!51001 m!80209))

(assert (=> b!51001 m!80209))

(declare-fun m!80289 () Bool)

(assert (=> b!51001 m!80289))

(assert (=> b!50943 d!16006))

(declare-fun d!16012 () Bool)

(assert (=> d!16012 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78913 () Unit!3511)

(declare-fun choose!11 (BitStream!1850) Unit!3511)

(assert (=> d!16012 (= lt!78913 (choose!11 thiss!1379))))

(assert (=> d!16012 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!78913)))

(declare-fun bs!4024 () Bool)

(assert (= bs!4024 d!16012))

(assert (=> bs!4024 m!80205))

(declare-fun m!80291 () Bool)

(assert (=> bs!4024 m!80291))

(assert (=> b!50943 d!16012))

(declare-fun d!16014 () Bool)

(declare-fun e!33731 () Bool)

(assert (=> d!16014 e!33731))

(declare-fun res!42749 () Bool)

(assert (=> d!16014 (=> (not res!42749) (not e!33731))))

(declare-fun lt!78930 () (_ BitVec 64))

(declare-fun lt!78927 () (_ BitVec 64))

(declare-fun lt!78928 () (_ BitVec 64))

(assert (=> d!16014 (= res!42749 (= lt!78930 (bvsub lt!78927 lt!78928)))))

(assert (=> d!16014 (or (= (bvand lt!78927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!78928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!78927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!78927 lt!78928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!16014 (= lt!78928 (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379))))))

(declare-fun lt!78931 () (_ BitVec 64))

(declare-fun lt!78929 () (_ BitVec 64))

(assert (=> d!16014 (= lt!78927 (bvmul lt!78931 lt!78929))))

(assert (=> d!16014 (or (= lt!78931 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!78929 (bvsdiv (bvmul lt!78931 lt!78929) lt!78931)))))

(assert (=> d!16014 (= lt!78929 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16014 (= lt!78931 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))))))

(assert (=> d!16014 (= lt!78930 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2946 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2941 thiss!1379))))))

(assert (=> d!16014 (invariant!0 (currentBit!2941 thiss!1379) (currentByte!2946 thiss!1379) (size!1068 (buf!1423 thiss!1379)))))

(assert (=> d!16014 (= (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)) lt!78930)))

(declare-fun b!51015 () Bool)

(declare-fun res!42750 () Bool)

(assert (=> b!51015 (=> (not res!42750) (not e!33731))))

(assert (=> b!51015 (= res!42750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!78930))))

(declare-fun b!51016 () Bool)

(declare-fun lt!78926 () (_ BitVec 64))

(assert (=> b!51016 (= e!33731 (bvsle lt!78930 (bvmul lt!78926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51016 (or (= lt!78926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!78926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!78926)))))

(assert (=> b!51016 (= lt!78926 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))))))

(assert (= (and d!16014 res!42749) b!51015))

(assert (= (and b!51015 res!42750) b!51016))

(declare-fun m!80295 () Bool)

(assert (=> d!16014 m!80295))

(declare-fun m!80297 () Bool)

(assert (=> d!16014 m!80297))

(assert (=> b!50943 d!16014))

(declare-fun d!16018 () Bool)

(assert (=> d!16018 (= (array_inv!978 srcBuffer!2) (bvsge (size!1068 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!10026 d!16018))

(declare-fun d!16020 () Bool)

(assert (=> d!16020 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2941 thiss!1379) (currentByte!2946 thiss!1379) (size!1068 (buf!1423 thiss!1379))))))

(declare-fun bs!4025 () Bool)

(assert (= bs!4025 d!16020))

(assert (=> bs!4025 m!80297))

(assert (=> start!10026 d!16020))

(declare-fun b!51145 () Bool)

(declare-fun res!42838 () Bool)

(declare-fun e!33794 () Bool)

(assert (=> b!51145 (=> (not res!42838) (not e!33794))))

(declare-fun lt!79332 () tuple2!4692)

(assert (=> b!51145 (= res!42838 (invariant!0 (currentBit!2941 (_2!2451 lt!79332)) (currentByte!2946 (_2!2451 lt!79332)) (size!1068 (buf!1423 (_2!2451 lt!79332)))))))

(declare-fun d!16022 () Bool)

(assert (=> d!16022 e!33794))

(declare-fun res!42837 () Bool)

(assert (=> d!16022 (=> (not res!42837) (not e!33794))))

(declare-fun lt!79327 () (_ BitVec 64))

(assert (=> d!16022 (= res!42837 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79332))) (currentByte!2946 (_2!2451 lt!79332)) (currentBit!2941 (_2!2451 lt!79332))) (bvsub lt!79327 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!16022 (or (= (bvand lt!79327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79327 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79334 () (_ BitVec 64))

(assert (=> d!16022 (= lt!79327 (bvadd lt!79334 to!314))))

(assert (=> d!16022 (or (not (= (bvand lt!79334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79334 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16022 (= lt!79334 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(declare-fun e!33796 () tuple2!4692)

(assert (=> d!16022 (= lt!79332 e!33796)))

(declare-fun c!3640 () Bool)

(assert (=> d!16022 (= c!3640 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!79298 () Unit!3511)

(declare-fun lt!79320 () Unit!3511)

(assert (=> d!16022 (= lt!79298 lt!79320)))

(assert (=> d!16022 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78832))))

(assert (=> d!16022 (= lt!79320 (lemmaIsPrefixRefl!0 (_2!2451 lt!78832)))))

(declare-fun lt!79304 () (_ BitVec 64))

(assert (=> d!16022 (= lt!79304 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(assert (=> d!16022 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16022 (= (appendBitsMSBFirstLoop!0 (_2!2451 lt!78832) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!79332)))

(declare-fun b!51146 () Bool)

(declare-fun lt!79310 () tuple2!4692)

(declare-fun Unit!3523 () Unit!3511)

(assert (=> b!51146 (= e!33796 (tuple2!4693 Unit!3523 (_2!2451 lt!79310)))))

(declare-fun lt!79322 () tuple2!4692)

(assert (=> b!51146 (= lt!79322 (appendBitFromByte!0 (_2!2451 lt!78832) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!79297 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79297 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79323 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79323 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79301 () Unit!3511)

(assert (=> b!51146 (= lt!79301 (validateOffsetBitsIneqLemma!0 (_2!2451 lt!78832) (_2!2451 lt!79322) lt!79297 lt!79323))))

(assert (=> b!51146 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!79322)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!79322))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!79322))) (bvsub lt!79297 lt!79323))))

(declare-fun lt!79326 () Unit!3511)

(assert (=> b!51146 (= lt!79326 lt!79301)))

(declare-fun lt!79294 () tuple2!4694)

(assert (=> b!51146 (= lt!79294 (reader!0 (_2!2451 lt!78832) (_2!2451 lt!79322)))))

(declare-fun lt!79316 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79316 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79296 () Unit!3511)

(assert (=> b!51146 (= lt!79296 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!79322)) lt!79316))))

(assert (=> b!51146 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!79322)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!79316)))

(declare-fun lt!79314 () Unit!3511)

(assert (=> b!51146 (= lt!79314 lt!79296)))

(assert (=> b!51146 (= (head!385 (byteArrayBitContentToList!0 (_2!2451 lt!79322) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!385 (bitStreamReadBitsIntoList!0 (_2!2451 lt!79322) (_1!2452 lt!79294) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79306 () Unit!3511)

(declare-fun Unit!3524 () Unit!3511)

(assert (=> b!51146 (= lt!79306 Unit!3524)))

(assert (=> b!51146 (= lt!79310 (appendBitsMSBFirstLoop!0 (_2!2451 lt!79322) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!79324 () Unit!3511)

(assert (=> b!51146 (= lt!79324 (lemmaIsPrefixTransitive!0 (_2!2451 lt!78832) (_2!2451 lt!79322) (_2!2451 lt!79310)))))

(assert (=> b!51146 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!79310))))

(declare-fun lt!79293 () Unit!3511)

(assert (=> b!51146 (= lt!79293 lt!79324)))

(assert (=> b!51146 (= (size!1068 (buf!1423 (_2!2451 lt!79310))) (size!1068 (buf!1423 (_2!2451 lt!78832))))))

(declare-fun lt!79300 () Unit!3511)

(declare-fun Unit!3525 () Unit!3511)

(assert (=> b!51146 (= lt!79300 Unit!3525)))

(assert (=> b!51146 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79310))) (currentByte!2946 (_2!2451 lt!79310)) (currentBit!2941 (_2!2451 lt!79310))) (bvsub (bvadd (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79329 () Unit!3511)

(declare-fun Unit!3526 () Unit!3511)

(assert (=> b!51146 (= lt!79329 Unit!3526)))

(assert (=> b!51146 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79310))) (currentByte!2946 (_2!2451 lt!79310)) (currentBit!2941 (_2!2451 lt!79310))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79322))) (currentByte!2946 (_2!2451 lt!79322)) (currentBit!2941 (_2!2451 lt!79322))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79299 () Unit!3511)

(declare-fun Unit!3527 () Unit!3511)

(assert (=> b!51146 (= lt!79299 Unit!3527)))

(declare-fun lt!79328 () tuple2!4694)

(assert (=> b!51146 (= lt!79328 (reader!0 (_2!2451 lt!78832) (_2!2451 lt!79310)))))

(declare-fun lt!79312 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79312 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79315 () Unit!3511)

(assert (=> b!51146 (= lt!79315 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!79310)) lt!79312))))

(assert (=> b!51146 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!79310)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!79312)))

(declare-fun lt!79302 () Unit!3511)

(assert (=> b!51146 (= lt!79302 lt!79315)))

(declare-fun lt!79305 () tuple2!4694)

(declare-fun call!655 () tuple2!4694)

(assert (=> b!51146 (= lt!79305 call!655)))

(declare-fun lt!79319 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79319 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!79335 () Unit!3511)

(assert (=> b!51146 (= lt!79335 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!79322) (buf!1423 (_2!2451 lt!79310)) lt!79319))))

(assert (=> b!51146 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!79310)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!79322))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!79322))) lt!79319)))

(declare-fun lt!79331 () Unit!3511)

(assert (=> b!51146 (= lt!79331 lt!79335)))

(declare-fun lt!79313 () List!566)

(assert (=> b!51146 (= lt!79313 (byteArrayBitContentToList!0 (_2!2451 lt!79310) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79318 () List!566)

(assert (=> b!51146 (= lt!79318 (byteArrayBitContentToList!0 (_2!2451 lt!79310) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79330 () List!566)

(assert (=> b!51146 (= lt!79330 (bitStreamReadBitsIntoList!0 (_2!2451 lt!79310) (_1!2452 lt!79328) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!79325 () List!566)

(assert (=> b!51146 (= lt!79325 (bitStreamReadBitsIntoList!0 (_2!2451 lt!79310) (_1!2452 lt!79305) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!79317 () (_ BitVec 64))

(assert (=> b!51146 (= lt!79317 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!79308 () Unit!3511)

(assert (=> b!51146 (= lt!79308 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2451 lt!79310) (_2!2451 lt!79310) (_1!2452 lt!79328) (_1!2452 lt!79305) lt!79317 lt!79330))))

(assert (=> b!51146 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!79310) (_1!2452 lt!79305) (bvsub lt!79317 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!252 lt!79330))))

(declare-fun lt!79295 () Unit!3511)

(assert (=> b!51146 (= lt!79295 lt!79308)))

(declare-fun lt!79311 () Unit!3511)

(assert (=> b!51146 (= lt!79311 (arrayBitRangesEqImpliesEq!0 (buf!1423 (_2!2451 lt!79322)) (buf!1423 (_2!2451 lt!79310)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!79304 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79322))) (currentByte!2946 (_2!2451 lt!79322)) (currentBit!2941 (_2!2451 lt!79322)))))))

(assert (=> b!51146 (= (bitAt!0 (buf!1423 (_2!2451 lt!79322)) lt!79304) (bitAt!0 (buf!1423 (_2!2451 lt!79310)) lt!79304))))

(declare-fun lt!79307 () Unit!3511)

(assert (=> b!51146 (= lt!79307 lt!79311)))

(declare-fun b!51147 () Bool)

(declare-fun res!42840 () Bool)

(assert (=> b!51147 (=> (not res!42840) (not e!33794))))

(assert (=> b!51147 (= res!42840 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!79332)))))

(declare-fun b!51148 () Bool)

(declare-fun lt!79333 () tuple2!4694)

(assert (=> b!51148 (= e!33794 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!79332) (_1!2452 lt!79333) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2451 lt!79332) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!51148 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51148 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!79321 () Unit!3511)

(declare-fun lt!79309 () Unit!3511)

(assert (=> b!51148 (= lt!79321 lt!79309)))

(declare-fun lt!79303 () (_ BitVec 64))

(assert (=> b!51148 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!79332)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!79303)))

(assert (=> b!51148 (= lt!79309 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!79332)) lt!79303))))

(declare-fun e!33795 () Bool)

(assert (=> b!51148 e!33795))

(declare-fun res!42841 () Bool)

(assert (=> b!51148 (=> (not res!42841) (not e!33795))))

(assert (=> b!51148 (= res!42841 (and (= (size!1068 (buf!1423 (_2!2451 lt!78832))) (size!1068 (buf!1423 (_2!2451 lt!79332)))) (bvsge lt!79303 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51148 (= lt!79303 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!51148 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51148 (= lt!79333 (reader!0 (_2!2451 lt!78832) (_2!2451 lt!79332)))))

(declare-fun bm!652 () Bool)

(assert (=> bm!652 (= call!655 (reader!0 (ite c!3640 (_2!2451 lt!79322) (_2!2451 lt!78832)) (ite c!3640 (_2!2451 lt!79310) (_2!2451 lt!78832))))))

(declare-fun b!51149 () Bool)

(declare-fun Unit!3528 () Unit!3511)

(assert (=> b!51149 (= e!33796 (tuple2!4693 Unit!3528 (_2!2451 lt!78832)))))

(assert (=> b!51149 (= (size!1068 (buf!1423 (_2!2451 lt!78832))) (size!1068 (buf!1423 (_2!2451 lt!78832))))))

(declare-fun lt!79336 () Unit!3511)

(declare-fun Unit!3529 () Unit!3511)

(assert (=> b!51149 (= lt!79336 Unit!3529)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1850 array!2348 array!2348 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4704 0))(
  ( (tuple2!4705 (_1!2457 array!2348) (_2!2457 BitStream!1850)) )
))
(declare-fun readBits!0 (BitStream!1850 (_ BitVec 64)) tuple2!4704)

(assert (=> b!51149 (checkByteArrayBitContent!0 (_2!2451 lt!78832) srcBuffer!2 (_1!2457 (readBits!0 (_1!2452 call!655) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!51150 () Bool)

(assert (=> b!51150 (= e!33795 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!79303))))

(declare-fun b!51151 () Bool)

(declare-fun res!42839 () Bool)

(assert (=> b!51151 (=> (not res!42839) (not e!33794))))

(assert (=> b!51151 (= res!42839 (= (size!1068 (buf!1423 (_2!2451 lt!79332))) (size!1068 (buf!1423 (_2!2451 lt!78832)))))))

(declare-fun b!51152 () Bool)

(declare-fun res!42836 () Bool)

(assert (=> b!51152 (=> (not res!42836) (not e!33794))))

(assert (=> b!51152 (= res!42836 (= (size!1068 (buf!1423 (_2!2451 lt!78832))) (size!1068 (buf!1423 (_2!2451 lt!79332)))))))

(assert (= (and d!16022 c!3640) b!51146))

(assert (= (and d!16022 (not c!3640)) b!51149))

(assert (= (or b!51146 b!51149) bm!652))

(assert (= (and d!16022 res!42837) b!51145))

(assert (= (and b!51145 res!42838) b!51152))

(assert (= (and b!51152 res!42836) b!51147))

(assert (= (and b!51147 res!42840) b!51151))

(assert (= (and b!51151 res!42839) b!51148))

(assert (= (and b!51148 res!42841) b!51150))

(declare-fun m!80535 () Bool)

(assert (=> b!51145 m!80535))

(declare-fun m!80537 () Bool)

(assert (=> bm!652 m!80537))

(declare-fun m!80539 () Bool)

(assert (=> b!51147 m!80539))

(declare-fun m!80541 () Bool)

(assert (=> b!51146 m!80541))

(declare-fun m!80543 () Bool)

(assert (=> b!51146 m!80543))

(declare-fun m!80545 () Bool)

(assert (=> b!51146 m!80545))

(declare-fun m!80547 () Bool)

(assert (=> b!51146 m!80547))

(declare-fun m!80549 () Bool)

(assert (=> b!51146 m!80549))

(declare-fun m!80551 () Bool)

(assert (=> b!51146 m!80551))

(declare-fun m!80553 () Bool)

(assert (=> b!51146 m!80553))

(declare-fun m!80555 () Bool)

(assert (=> b!51146 m!80555))

(declare-fun m!80557 () Bool)

(assert (=> b!51146 m!80557))

(declare-fun m!80559 () Bool)

(assert (=> b!51146 m!80559))

(declare-fun m!80561 () Bool)

(assert (=> b!51146 m!80561))

(declare-fun m!80563 () Bool)

(assert (=> b!51146 m!80563))

(assert (=> b!51146 m!80545))

(declare-fun m!80565 () Bool)

(assert (=> b!51146 m!80565))

(assert (=> b!51146 m!80543))

(declare-fun m!80567 () Bool)

(assert (=> b!51146 m!80567))

(assert (=> b!51146 m!80561))

(declare-fun m!80569 () Bool)

(assert (=> b!51146 m!80569))

(declare-fun m!80571 () Bool)

(assert (=> b!51146 m!80571))

(declare-fun m!80573 () Bool)

(assert (=> b!51146 m!80573))

(declare-fun m!80575 () Bool)

(assert (=> b!51146 m!80575))

(declare-fun m!80577 () Bool)

(assert (=> b!51146 m!80577))

(declare-fun m!80579 () Bool)

(assert (=> b!51146 m!80579))

(declare-fun m!80581 () Bool)

(assert (=> b!51146 m!80581))

(declare-fun m!80583 () Bool)

(assert (=> b!51146 m!80583))

(declare-fun m!80585 () Bool)

(assert (=> b!51146 m!80585))

(declare-fun m!80587 () Bool)

(assert (=> b!51146 m!80587))

(declare-fun m!80589 () Bool)

(assert (=> b!51146 m!80589))

(declare-fun m!80591 () Bool)

(assert (=> b!51146 m!80591))

(assert (=> b!51146 m!80181))

(assert (=> b!51146 m!80549))

(declare-fun m!80593 () Bool)

(assert (=> b!51146 m!80593))

(declare-fun m!80595 () Bool)

(assert (=> b!51146 m!80595))

(declare-fun m!80597 () Bool)

(assert (=> b!51146 m!80597))

(declare-fun m!80599 () Bool)

(assert (=> b!51146 m!80599))

(declare-fun m!80601 () Bool)

(assert (=> b!51146 m!80601))

(declare-fun m!80603 () Bool)

(assert (=> b!51149 m!80603))

(declare-fun m!80605 () Bool)

(assert (=> b!51149 m!80605))

(declare-fun m!80607 () Bool)

(assert (=> d!16022 m!80607))

(assert (=> d!16022 m!80181))

(declare-fun m!80609 () Bool)

(assert (=> d!16022 m!80609))

(declare-fun m!80611 () Bool)

(assert (=> d!16022 m!80611))

(declare-fun m!80613 () Bool)

(assert (=> b!51150 m!80613))

(declare-fun m!80615 () Bool)

(assert (=> b!51148 m!80615))

(declare-fun m!80617 () Bool)

(assert (=> b!51148 m!80617))

(declare-fun m!80619 () Bool)

(assert (=> b!51148 m!80619))

(declare-fun m!80621 () Bool)

(assert (=> b!51148 m!80621))

(declare-fun m!80623 () Bool)

(assert (=> b!51148 m!80623))

(assert (=> b!50953 d!16022))

(declare-fun d!16108 () Bool)

(assert (=> d!16108 (isPrefixOf!0 thiss!1379 (_2!2451 lt!78842))))

(declare-fun lt!79339 () Unit!3511)

(declare-fun choose!30 (BitStream!1850 BitStream!1850 BitStream!1850) Unit!3511)

(assert (=> d!16108 (= lt!79339 (choose!30 thiss!1379 (_2!2451 lt!78832) (_2!2451 lt!78842)))))

(assert (=> d!16108 (isPrefixOf!0 thiss!1379 (_2!2451 lt!78832))))

(assert (=> d!16108 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2451 lt!78832) (_2!2451 lt!78842)) lt!79339)))

(declare-fun bs!4043 () Bool)

(assert (= bs!4043 d!16108))

(assert (=> bs!4043 m!80153))

(declare-fun m!80625 () Bool)

(assert (=> bs!4043 m!80625))

(assert (=> bs!4043 m!80227))

(assert (=> b!50953 d!16108))

(declare-fun d!16110 () Bool)

(assert (=> d!16110 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79342 () Unit!3511)

(declare-fun choose!9 (BitStream!1850 array!2348 (_ BitVec 64) BitStream!1850) Unit!3511)

(assert (=> d!16110 (= lt!79342 (choose!9 thiss!1379 (buf!1423 (_2!2451 lt!78832)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1851 (buf!1423 (_2!2451 lt!78832)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(assert (=> d!16110 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1423 (_2!2451 lt!78832)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79342)))

(declare-fun bs!4044 () Bool)

(assert (= bs!4044 d!16110))

(assert (=> bs!4044 m!80149))

(declare-fun m!80627 () Bool)

(assert (=> bs!4044 m!80627))

(assert (=> b!50953 d!16110))

(declare-fun d!16112 () Bool)

(assert (=> d!16112 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4045 () Bool)

(assert (= bs!4045 d!16112))

(declare-fun m!80629 () Bool)

(assert (=> bs!4045 m!80629))

(assert (=> b!50953 d!16112))

(declare-fun d!16114 () Bool)

(declare-fun res!42844 () Bool)

(declare-fun e!33798 () Bool)

(assert (=> d!16114 (=> (not res!42844) (not e!33798))))

(assert (=> d!16114 (= res!42844 (= (size!1068 (buf!1423 thiss!1379)) (size!1068 (buf!1423 (_2!2451 lt!78842)))))))

(assert (=> d!16114 (= (isPrefixOf!0 thiss!1379 (_2!2451 lt!78842)) e!33798)))

(declare-fun b!51153 () Bool)

(declare-fun res!42842 () Bool)

(assert (=> b!51153 (=> (not res!42842) (not e!33798))))

(assert (=> b!51153 (= res!42842 (bvsle (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)) (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842)))))))

(declare-fun b!51154 () Bool)

(declare-fun e!33797 () Bool)

(assert (=> b!51154 (= e!33798 e!33797)))

(declare-fun res!42843 () Bool)

(assert (=> b!51154 (=> res!42843 e!33797)))

(assert (=> b!51154 (= res!42843 (= (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51155 () Bool)

(assert (=> b!51155 (= e!33797 (arrayBitRangesEq!0 (buf!1423 thiss!1379) (buf!1423 (_2!2451 lt!78842)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(assert (= (and d!16114 res!42844) b!51153))

(assert (= (and b!51153 res!42842) b!51154))

(assert (= (and b!51154 (not res!42843)) b!51155))

(assert (=> b!51153 m!80209))

(assert (=> b!51153 m!80175))

(assert (=> b!51155 m!80209))

(assert (=> b!51155 m!80209))

(declare-fun m!80631 () Bool)

(assert (=> b!51155 m!80631))

(assert (=> b!50953 d!16114))

(declare-fun d!16116 () Bool)

(declare-fun res!42847 () Bool)

(declare-fun e!33800 () Bool)

(assert (=> d!16116 (=> (not res!42847) (not e!33800))))

(assert (=> d!16116 (= res!42847 (= (size!1068 (buf!1423 (_2!2451 lt!78832))) (size!1068 (buf!1423 (_2!2451 lt!78842)))))))

(assert (=> d!16116 (= (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78842)) e!33800)))

(declare-fun b!51156 () Bool)

(declare-fun res!42845 () Bool)

(assert (=> b!51156 (=> (not res!42845) (not e!33800))))

(assert (=> b!51156 (= res!42845 (bvsle (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))) (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842)))))))

(declare-fun b!51157 () Bool)

(declare-fun e!33799 () Bool)

(assert (=> b!51157 (= e!33800 e!33799)))

(declare-fun res!42846 () Bool)

(assert (=> b!51157 (=> res!42846 e!33799)))

(assert (=> b!51157 (= res!42846 (= (size!1068 (buf!1423 (_2!2451 lt!78832))) #b00000000000000000000000000000000))))

(declare-fun b!51158 () Bool)

(assert (=> b!51158 (= e!33799 (arrayBitRangesEq!0 (buf!1423 (_2!2451 lt!78832)) (buf!1423 (_2!2451 lt!78842)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832)))))))

(assert (= (and d!16116 res!42847) b!51156))

(assert (= (and b!51156 res!42845) b!51157))

(assert (= (and b!51157 (not res!42846)) b!51158))

(assert (=> b!51156 m!80181))

(assert (=> b!51156 m!80175))

(assert (=> b!51158 m!80181))

(assert (=> b!51158 m!80181))

(declare-fun m!80633 () Bool)

(assert (=> b!51158 m!80633))

(assert (=> b!50953 d!16116))

(declare-fun b!51173 () Bool)

(declare-fun e!33807 () Unit!3511)

(declare-fun Unit!3535 () Unit!3511)

(assert (=> b!51173 (= e!33807 Unit!3535)))

(declare-fun b!51174 () Bool)

(declare-fun res!42856 () Bool)

(declare-fun e!33808 () Bool)

(assert (=> b!51174 (=> (not res!42856) (not e!33808))))

(declare-fun lt!79464 () tuple2!4694)

(assert (=> b!51174 (= res!42856 (isPrefixOf!0 (_2!2452 lt!79464) (_2!2451 lt!78832)))))

(declare-fun b!51175 () Bool)

(declare-fun lt!79468 () Unit!3511)

(assert (=> b!51175 (= e!33807 lt!79468)))

(declare-fun lt!79465 () (_ BitVec 64))

(assert (=> b!51175 (= lt!79465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79459 () (_ BitVec 64))

(assert (=> b!51175 (= lt!79459 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2348 array!2348 (_ BitVec 64) (_ BitVec 64)) Unit!3511)

(assert (=> b!51175 (= lt!79468 (arrayBitRangesEqSymmetric!0 (buf!1423 thiss!1379) (buf!1423 (_2!2451 lt!78832)) lt!79465 lt!79459))))

(assert (=> b!51175 (arrayBitRangesEq!0 (buf!1423 (_2!2451 lt!78832)) (buf!1423 thiss!1379) lt!79465 lt!79459)))

(declare-fun b!51176 () Bool)

(declare-fun lt!79475 () (_ BitVec 64))

(declare-fun lt!79474 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1850 (_ BitVec 64)) BitStream!1850)

(assert (=> b!51176 (= e!33808 (= (_1!2452 lt!79464) (withMovedBitIndex!0 (_2!2452 lt!79464) (bvsub lt!79474 lt!79475))))))

(assert (=> b!51176 (or (= (bvand lt!79474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79475 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79474 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79474 lt!79475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51176 (= lt!79475 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(assert (=> b!51176 (= lt!79474 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(declare-fun d!16118 () Bool)

(assert (=> d!16118 e!33808))

(declare-fun res!42854 () Bool)

(assert (=> d!16118 (=> (not res!42854) (not e!33808))))

(assert (=> d!16118 (= res!42854 (isPrefixOf!0 (_1!2452 lt!79464) (_2!2452 lt!79464)))))

(declare-fun lt!79478 () BitStream!1850)

(assert (=> d!16118 (= lt!79464 (tuple2!4695 lt!79478 (_2!2451 lt!78832)))))

(declare-fun lt!79471 () Unit!3511)

(declare-fun lt!79469 () Unit!3511)

(assert (=> d!16118 (= lt!79471 lt!79469)))

(assert (=> d!16118 (isPrefixOf!0 lt!79478 (_2!2451 lt!78832))))

(assert (=> d!16118 (= lt!79469 (lemmaIsPrefixTransitive!0 lt!79478 (_2!2451 lt!78832) (_2!2451 lt!78832)))))

(declare-fun lt!79463 () Unit!3511)

(declare-fun lt!79461 () Unit!3511)

(assert (=> d!16118 (= lt!79463 lt!79461)))

(assert (=> d!16118 (isPrefixOf!0 lt!79478 (_2!2451 lt!78832))))

(assert (=> d!16118 (= lt!79461 (lemmaIsPrefixTransitive!0 lt!79478 thiss!1379 (_2!2451 lt!78832)))))

(declare-fun lt!79462 () Unit!3511)

(assert (=> d!16118 (= lt!79462 e!33807)))

(declare-fun c!3645 () Bool)

(assert (=> d!16118 (= c!3645 (not (= (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!79476 () Unit!3511)

(declare-fun lt!79466 () Unit!3511)

(assert (=> d!16118 (= lt!79476 lt!79466)))

(assert (=> d!16118 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78832))))

(assert (=> d!16118 (= lt!79466 (lemmaIsPrefixRefl!0 (_2!2451 lt!78832)))))

(declare-fun lt!79477 () Unit!3511)

(declare-fun lt!79473 () Unit!3511)

(assert (=> d!16118 (= lt!79477 lt!79473)))

(assert (=> d!16118 (= lt!79473 (lemmaIsPrefixRefl!0 (_2!2451 lt!78832)))))

(declare-fun lt!79472 () Unit!3511)

(declare-fun lt!79470 () Unit!3511)

(assert (=> d!16118 (= lt!79472 lt!79470)))

(assert (=> d!16118 (isPrefixOf!0 lt!79478 lt!79478)))

(assert (=> d!16118 (= lt!79470 (lemmaIsPrefixRefl!0 lt!79478))))

(declare-fun lt!79460 () Unit!3511)

(declare-fun lt!79467 () Unit!3511)

(assert (=> d!16118 (= lt!79460 lt!79467)))

(assert (=> d!16118 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16118 (= lt!79467 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16118 (= lt!79478 (BitStream!1851 (buf!1423 (_2!2451 lt!78832)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(assert (=> d!16118 (isPrefixOf!0 thiss!1379 (_2!2451 lt!78832))))

(assert (=> d!16118 (= (reader!0 thiss!1379 (_2!2451 lt!78832)) lt!79464)))

(declare-fun b!51177 () Bool)

(declare-fun res!42855 () Bool)

(assert (=> b!51177 (=> (not res!42855) (not e!33808))))

(assert (=> b!51177 (= res!42855 (isPrefixOf!0 (_1!2452 lt!79464) thiss!1379))))

(assert (= (and d!16118 c!3645) b!51175))

(assert (= (and d!16118 (not c!3645)) b!51173))

(assert (= (and d!16118 res!42854) b!51177))

(assert (= (and b!51177 res!42855) b!51174))

(assert (= (and b!51174 res!42856) b!51176))

(declare-fun m!80635 () Bool)

(assert (=> d!16118 m!80635))

(assert (=> d!16118 m!80205))

(assert (=> d!16118 m!80611))

(declare-fun m!80637 () Bool)

(assert (=> d!16118 m!80637))

(declare-fun m!80639 () Bool)

(assert (=> d!16118 m!80639))

(assert (=> d!16118 m!80227))

(declare-fun m!80641 () Bool)

(assert (=> d!16118 m!80641))

(assert (=> d!16118 m!80609))

(declare-fun m!80643 () Bool)

(assert (=> d!16118 m!80643))

(declare-fun m!80645 () Bool)

(assert (=> d!16118 m!80645))

(assert (=> d!16118 m!80207))

(declare-fun m!80647 () Bool)

(assert (=> b!51176 m!80647))

(assert (=> b!51176 m!80181))

(assert (=> b!51176 m!80209))

(declare-fun m!80649 () Bool)

(assert (=> b!51174 m!80649))

(declare-fun m!80651 () Bool)

(assert (=> b!51177 m!80651))

(assert (=> b!51175 m!80209))

(declare-fun m!80653 () Bool)

(assert (=> b!51175 m!80653))

(declare-fun m!80655 () Bool)

(assert (=> b!51175 m!80655))

(assert (=> b!50953 d!16118))

(declare-fun d!16120 () Bool)

(assert (=> d!16120 (= (bitAt!0 (buf!1423 (_2!2451 lt!78842)) lt!78843) (not (= (bvand ((_ sign_extend 24) (select (arr!1597 (buf!1423 (_2!2451 lt!78842))) ((_ extract 31 0) (bvsdiv lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!78843 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!4046 () Bool)

(assert (= bs!4046 d!16120))

(declare-fun m!80657 () Bool)

(assert (=> bs!4046 m!80657))

(assert (=> bs!4046 m!80277))

(assert (=> b!50942 d!16120))

(declare-fun d!16122 () Bool)

(assert (=> d!16122 (= (bitAt!0 (buf!1423 (_2!2451 lt!78832)) lt!78843) (bitAt!0 (buf!1423 (_2!2451 lt!78842)) lt!78843))))

(declare-fun lt!79493 () Unit!3511)

(declare-fun choose!31 (array!2348 array!2348 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3511)

(assert (=> d!16122 (= lt!79493 (choose!31 (buf!1423 (_2!2451 lt!78832)) (buf!1423 (_2!2451 lt!78842)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78843 lt!78840))))

(assert (=> d!16122 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!78840))))

(assert (=> d!16122 (= (arrayBitRangesEqImpliesEq!0 (buf!1423 (_2!2451 lt!78832)) (buf!1423 (_2!2451 lt!78842)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78843 lt!78840) lt!79493)))

(declare-fun bs!4047 () Bool)

(assert (= bs!4047 d!16122))

(assert (=> bs!4047 m!80185))

(assert (=> bs!4047 m!80235))

(declare-fun m!80659 () Bool)

(assert (=> bs!4047 m!80659))

(assert (=> b!50942 d!16122))

(declare-fun d!16124 () Bool)

(declare-fun res!42871 () Bool)

(declare-fun e!33814 () Bool)

(assert (=> d!16124 (=> (not res!42871) (not e!33814))))

(assert (=> d!16124 (= res!42871 (= (size!1068 (buf!1423 thiss!1379)) (size!1068 (buf!1423 (_2!2451 lt!78832)))))))

(assert (=> d!16124 (= (isPrefixOf!0 thiss!1379 (_2!2451 lt!78832)) e!33814)))

(declare-fun b!51190 () Bool)

(declare-fun res!42869 () Bool)

(assert (=> b!51190 (=> (not res!42869) (not e!33814))))

(assert (=> b!51190 (= res!42869 (bvsle (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)) (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832)))))))

(declare-fun b!51191 () Bool)

(declare-fun e!33813 () Bool)

(assert (=> b!51191 (= e!33814 e!33813)))

(declare-fun res!42870 () Bool)

(assert (=> b!51191 (=> res!42870 e!33813)))

(assert (=> b!51191 (= res!42870 (= (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!51192 () Bool)

(assert (=> b!51192 (= e!33813 (arrayBitRangesEq!0 (buf!1423 thiss!1379) (buf!1423 (_2!2451 lt!78832)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(assert (= (and d!16124 res!42871) b!51190))

(assert (= (and b!51190 res!42869) b!51191))

(assert (= (and b!51191 (not res!42870)) b!51192))

(assert (=> b!51190 m!80209))

(assert (=> b!51190 m!80181))

(assert (=> b!51192 m!80209))

(assert (=> b!51192 m!80209))

(declare-fun m!80661 () Bool)

(assert (=> b!51192 m!80661))

(assert (=> b!50952 d!16124))

(declare-fun d!16126 () Bool)

(assert (=> d!16126 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!78831) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832)))) lt!78831))))

(declare-fun bs!4048 () Bool)

(assert (= bs!4048 d!16126))

(declare-fun m!80663 () Bool)

(assert (=> bs!4048 m!80663))

(assert (=> b!50952 d!16126))

(declare-fun d!16128 () Bool)

(declare-fun e!33817 () Bool)

(assert (=> d!16128 e!33817))

(declare-fun res!42874 () Bool)

(assert (=> d!16128 (=> (not res!42874) (not e!33817))))

(assert (=> d!16128 (= res!42874 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!79496 () Unit!3511)

(declare-fun choose!27 (BitStream!1850 BitStream!1850 (_ BitVec 64) (_ BitVec 64)) Unit!3511)

(assert (=> d!16128 (= lt!79496 (choose!27 thiss!1379 (_2!2451 lt!78832) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!16128 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!16128 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2451 lt!78832) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79496)))

(declare-fun b!51195 () Bool)

(assert (=> b!51195 (= e!33817 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!16128 res!42874) b!51195))

(declare-fun m!80665 () Bool)

(assert (=> d!16128 m!80665))

(declare-fun m!80667 () Bool)

(assert (=> b!51195 m!80667))

(assert (=> b!50952 d!16128))

(declare-fun b!51251 () Bool)

(declare-fun e!33847 () Bool)

(declare-fun e!33848 () Bool)

(assert (=> b!51251 (= e!33847 e!33848)))

(declare-fun res!42918 () Bool)

(assert (=> b!51251 (=> (not res!42918) (not e!33848))))

(declare-fun lt!79645 () (_ BitVec 8))

(declare-fun lt!79641 () tuple2!4692)

(declare-fun lt!79639 () tuple2!4696)

(assert (=> b!51251 (= res!42918 (and (= (_2!2453 lt!79639) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!79645)) #b00000000000000000000000000000000))) (= (_1!2453 lt!79639) (_2!2451 lt!79641))))))

(declare-fun lt!79642 () tuple2!4704)

(declare-fun lt!79640 () BitStream!1850)

(assert (=> b!51251 (= lt!79642 (readBits!0 lt!79640 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!51251 (= lt!79639 (readBitPure!0 lt!79640))))

(declare-fun readerFrom!0 (BitStream!1850 (_ BitVec 32) (_ BitVec 32)) BitStream!1850)

(assert (=> b!51251 (= lt!79640 (readerFrom!0 (_2!2451 lt!79641) (currentBit!2941 thiss!1379) (currentByte!2946 thiss!1379)))))

(declare-fun b!51252 () Bool)

(declare-fun e!33846 () Bool)

(declare-fun lt!79643 () tuple2!4696)

(declare-fun lt!79647 () tuple2!4692)

(assert (=> b!51252 (= e!33846 (= (bitIndex!0 (size!1068 (buf!1423 (_1!2453 lt!79643))) (currentByte!2946 (_1!2453 lt!79643)) (currentBit!2941 (_1!2453 lt!79643))) (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79647))) (currentByte!2946 (_2!2451 lt!79647)) (currentBit!2941 (_2!2451 lt!79647)))))))

(declare-fun d!16130 () Bool)

(assert (=> d!16130 e!33847))

(declare-fun res!42920 () Bool)

(assert (=> d!16130 (=> (not res!42920) (not e!33847))))

(assert (=> d!16130 (= res!42920 (= (size!1068 (buf!1423 (_2!2451 lt!79641))) (size!1068 (buf!1423 thiss!1379))))))

(declare-fun lt!79644 () array!2348)

(assert (=> d!16130 (= lt!79645 (select (arr!1597 lt!79644) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!16130 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1068 lt!79644)))))

(assert (=> d!16130 (= lt!79644 (array!2349 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!79648 () tuple2!4692)

(assert (=> d!16130 (= lt!79641 (tuple2!4693 (_1!2451 lt!79648) (_2!2451 lt!79648)))))

(assert (=> d!16130 (= lt!79648 lt!79647)))

(declare-fun e!33845 () Bool)

(assert (=> d!16130 e!33845))

(declare-fun res!42919 () Bool)

(assert (=> d!16130 (=> (not res!42919) (not e!33845))))

(assert (=> d!16130 (= res!42919 (= (size!1068 (buf!1423 thiss!1379)) (size!1068 (buf!1423 (_2!2451 lt!79647)))))))

(declare-fun lt!79637 () Bool)

(declare-fun appendBit!0 (BitStream!1850 Bool) tuple2!4692)

(assert (=> d!16130 (= lt!79647 (appendBit!0 thiss!1379 lt!79637))))

(assert (=> d!16130 (= lt!79637 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!16130 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!16130 (= (appendBitFromByte!0 thiss!1379 (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!79641)))

(declare-fun b!51253 () Bool)

(assert (=> b!51253 (= e!33845 e!33846)))

(declare-fun res!42915 () Bool)

(assert (=> b!51253 (=> (not res!42915) (not e!33846))))

(assert (=> b!51253 (= res!42915 (and (= (_2!2453 lt!79643) lt!79637) (= (_1!2453 lt!79643) (_2!2451 lt!79647))))))

(assert (=> b!51253 (= lt!79643 (readBitPure!0 (readerFrom!0 (_2!2451 lt!79647) (currentBit!2941 thiss!1379) (currentByte!2946 thiss!1379))))))

(declare-fun b!51254 () Bool)

(assert (=> b!51254 (= e!33848 (= (bitIndex!0 (size!1068 (buf!1423 (_1!2453 lt!79639))) (currentByte!2946 (_1!2453 lt!79639)) (currentBit!2941 (_1!2453 lt!79639))) (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79641))) (currentByte!2946 (_2!2451 lt!79641)) (currentBit!2941 (_2!2451 lt!79641)))))))

(declare-fun b!51255 () Bool)

(declare-fun res!42917 () Bool)

(assert (=> b!51255 (=> (not res!42917) (not e!33847))))

(assert (=> b!51255 (= res!42917 (isPrefixOf!0 thiss!1379 (_2!2451 lt!79641)))))

(declare-fun b!51256 () Bool)

(declare-fun res!42916 () Bool)

(assert (=> b!51256 (=> (not res!42916) (not e!33845))))

(assert (=> b!51256 (= res!42916 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79647))) (currentByte!2946 (_2!2451 lt!79647)) (currentBit!2941 (_2!2451 lt!79647))) (bvadd (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!51257 () Bool)

(declare-fun res!42922 () Bool)

(assert (=> b!51257 (=> (not res!42922) (not e!33847))))

(declare-fun lt!79638 () (_ BitVec 64))

(declare-fun lt!79646 () (_ BitVec 64))

(assert (=> b!51257 (= res!42922 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!79641))) (currentByte!2946 (_2!2451 lt!79641)) (currentBit!2941 (_2!2451 lt!79641))) (bvadd lt!79646 lt!79638)))))

(assert (=> b!51257 (or (not (= (bvand lt!79646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79638 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!79646 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!79646 lt!79638) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51257 (= lt!79638 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!51257 (= lt!79646 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(declare-fun b!51258 () Bool)

(declare-fun res!42921 () Bool)

(assert (=> b!51258 (=> (not res!42921) (not e!33845))))

(assert (=> b!51258 (= res!42921 (isPrefixOf!0 thiss!1379 (_2!2451 lt!79647)))))

(assert (= (and d!16130 res!42919) b!51256))

(assert (= (and b!51256 res!42916) b!51258))

(assert (= (and b!51258 res!42921) b!51253))

(assert (= (and b!51253 res!42915) b!51252))

(assert (= (and d!16130 res!42920) b!51257))

(assert (= (and b!51257 res!42922) b!51255))

(assert (= (and b!51255 res!42917) b!51251))

(assert (= (and b!51251 res!42918) b!51254))

(declare-fun m!80807 () Bool)

(assert (=> d!16130 m!80807))

(declare-fun m!80809 () Bool)

(assert (=> d!16130 m!80809))

(assert (=> d!16130 m!80281))

(declare-fun m!80811 () Bool)

(assert (=> b!51255 m!80811))

(declare-fun m!80813 () Bool)

(assert (=> b!51258 m!80813))

(declare-fun m!80815 () Bool)

(assert (=> b!51256 m!80815))

(assert (=> b!51256 m!80209))

(declare-fun m!80817 () Bool)

(assert (=> b!51254 m!80817))

(declare-fun m!80819 () Bool)

(assert (=> b!51254 m!80819))

(declare-fun m!80821 () Bool)

(assert (=> b!51251 m!80821))

(declare-fun m!80823 () Bool)

(assert (=> b!51251 m!80823))

(declare-fun m!80825 () Bool)

(assert (=> b!51251 m!80825))

(assert (=> b!51257 m!80819))

(assert (=> b!51257 m!80209))

(declare-fun m!80827 () Bool)

(assert (=> b!51252 m!80827))

(assert (=> b!51252 m!80815))

(declare-fun m!80829 () Bool)

(assert (=> b!51253 m!80829))

(assert (=> b!51253 m!80829))

(declare-fun m!80831 () Bool)

(assert (=> b!51253 m!80831))

(assert (=> b!50952 d!16130))

(declare-fun d!16162 () Bool)

(assert (=> d!16162 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 thiss!1379))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4056 () Bool)

(assert (= bs!4056 d!16162))

(assert (=> bs!4056 m!80295))

(assert (=> b!50951 d!16162))

(declare-fun d!16164 () Bool)

(declare-datatypes ((tuple2!4708 0))(
  ( (tuple2!4709 (_1!2459 Bool) (_2!2459 BitStream!1850)) )
))
(declare-fun lt!79651 () tuple2!4708)

(declare-fun readBit!0 (BitStream!1850) tuple2!4708)

(assert (=> d!16164 (= lt!79651 (readBit!0 (_1!2452 lt!78841)))))

(assert (=> d!16164 (= (readBitPure!0 (_1!2452 lt!78841)) (tuple2!4697 (_2!2459 lt!79651) (_1!2459 lt!79651)))))

(declare-fun bs!4057 () Bool)

(assert (= bs!4057 d!16164))

(declare-fun m!80833 () Bool)

(assert (=> bs!4057 m!80833))

(assert (=> b!50961 d!16164))

(declare-fun d!16166 () Bool)

(assert (=> d!16166 (= (invariant!0 (currentBit!2941 (_2!2451 lt!78842)) (currentByte!2946 (_2!2451 lt!78842)) (size!1068 (buf!1423 (_2!2451 lt!78842)))) (and (bvsge (currentBit!2941 (_2!2451 lt!78842)) #b00000000000000000000000000000000) (bvslt (currentBit!2941 (_2!2451 lt!78842)) #b00000000000000000000000000001000) (bvsge (currentByte!2946 (_2!2451 lt!78842)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2946 (_2!2451 lt!78842)) (size!1068 (buf!1423 (_2!2451 lt!78842)))) (and (= (currentBit!2941 (_2!2451 lt!78842)) #b00000000000000000000000000000000) (= (currentByte!2946 (_2!2451 lt!78842)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))))))

(assert (=> b!50950 d!16166))

(declare-fun d!16168 () Bool)

(declare-fun size!1071 (List!566) Int)

(assert (=> d!16168 (= (length!261 lt!78833) (size!1071 lt!78833))))

(declare-fun bs!4058 () Bool)

(assert (= bs!4058 d!16168))

(declare-fun m!80835 () Bool)

(assert (=> bs!4058 m!80835))

(assert (=> b!50960 d!16168))

(declare-fun d!16170 () Bool)

(assert (=> d!16170 (= (invariant!0 (currentBit!2941 (_2!2451 lt!78832)) (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78832)))) (and (bvsge (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (bvslt (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000001000) (bvsge (currentByte!2946 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78832)))) (and (= (currentBit!2941 (_2!2451 lt!78832)) #b00000000000000000000000000000000) (= (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78832))))))))))

(assert (=> b!50949 d!16170))

(declare-fun d!16172 () Bool)

(assert (=> d!16172 (= (head!385 lt!78833) (h!681 lt!78833))))

(assert (=> b!50959 d!16172))

(declare-fun d!16174 () Bool)

(declare-fun e!33849 () Bool)

(assert (=> d!16174 e!33849))

(declare-fun res!42923 () Bool)

(assert (=> d!16174 (=> (not res!42923) (not e!33849))))

(declare-fun lt!79653 () (_ BitVec 64))

(declare-fun lt!79654 () (_ BitVec 64))

(declare-fun lt!79656 () (_ BitVec 64))

(assert (=> d!16174 (= res!42923 (= lt!79656 (bvsub lt!79653 lt!79654)))))

(assert (=> d!16174 (or (= (bvand lt!79653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79653 lt!79654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16174 (= lt!79654 (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78842))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78842)))))))

(declare-fun lt!79657 () (_ BitVec 64))

(declare-fun lt!79655 () (_ BitVec 64))

(assert (=> d!16174 (= lt!79653 (bvmul lt!79657 lt!79655))))

(assert (=> d!16174 (or (= lt!79657 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79655 (bvsdiv (bvmul lt!79657 lt!79655) lt!79657)))))

(assert (=> d!16174 (= lt!79655 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16174 (= lt!79657 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))))))

(assert (=> d!16174 (= lt!79656 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78842))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78842)))))))

(assert (=> d!16174 (invariant!0 (currentBit!2941 (_2!2451 lt!78842)) (currentByte!2946 (_2!2451 lt!78842)) (size!1068 (buf!1423 (_2!2451 lt!78842))))))

(assert (=> d!16174 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842))) lt!79656)))

(declare-fun b!51259 () Bool)

(declare-fun res!42924 () Bool)

(assert (=> b!51259 (=> (not res!42924) (not e!33849))))

(assert (=> b!51259 (= res!42924 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79656))))

(declare-fun b!51260 () Bool)

(declare-fun lt!79652 () (_ BitVec 64))

(assert (=> b!51260 (= e!33849 (bvsle lt!79656 (bvmul lt!79652 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51260 (or (= lt!79652 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79652 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79652)))))

(assert (=> b!51260 (= lt!79652 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))))))

(assert (= (and d!16174 res!42923) b!51259))

(assert (= (and b!51259 res!42924) b!51260))

(declare-fun m!80837 () Bool)

(assert (=> d!16174 m!80837))

(assert (=> d!16174 m!80239))

(assert (=> b!50948 d!16174))

(declare-fun d!16176 () Bool)

(assert (=> d!16176 (= (head!385 (byteArrayBitContentToList!0 (_2!2451 lt!78832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!681 (byteArrayBitContentToList!0 (_2!2451 lt!78832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50958 d!16176))

(declare-fun d!16178 () Bool)

(declare-fun c!3653 () Bool)

(assert (=> d!16178 (= c!3653 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33850 () List!566)

(assert (=> d!16178 (= (byteArrayBitContentToList!0 (_2!2451 lt!78832) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!33850)))

(declare-fun b!51261 () Bool)

(assert (=> b!51261 (= e!33850 Nil!563)))

(declare-fun b!51262 () Bool)

(assert (=> b!51262 (= e!33850 (Cons!562 (not (= (bvand ((_ sign_extend 24) (select (arr!1597 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2451 lt!78832) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!16178 c!3653) b!51261))

(assert (= (and d!16178 (not c!3653)) b!51262))

(assert (=> b!51262 m!80221))

(assert (=> b!51262 m!80281))

(declare-fun m!80839 () Bool)

(assert (=> b!51262 m!80839))

(assert (=> b!50958 d!16178))

(declare-fun d!16180 () Bool)

(assert (=> d!16180 (= (head!385 (bitStreamReadBitsIntoList!0 (_2!2451 lt!78832) (_1!2452 lt!78835) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!681 (bitStreamReadBitsIntoList!0 (_2!2451 lt!78832) (_1!2452 lt!78835) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!50958 d!16180))

(declare-fun b!51273 () Bool)

(declare-fun e!33856 () Bool)

(declare-fun lt!79665 () List!566)

(declare-fun isEmpty!147 (List!566) Bool)

(assert (=> b!51273 (= e!33856 (isEmpty!147 lt!79665))))

(declare-fun d!16182 () Bool)

(assert (=> d!16182 e!33856))

(declare-fun c!3659 () Bool)

(assert (=> d!16182 (= c!3659 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4712 0))(
  ( (tuple2!4713 (_1!2461 List!566) (_2!2461 BitStream!1850)) )
))
(declare-fun e!33855 () tuple2!4712)

(assert (=> d!16182 (= lt!79665 (_1!2461 e!33855))))

(declare-fun c!3658 () Bool)

(assert (=> d!16182 (= c!3658 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16182 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16182 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!78832) (_1!2452 lt!78835) #b0000000000000000000000000000000000000000000000000000000000000001) lt!79665)))

(declare-fun b!51271 () Bool)

(assert (=> b!51271 (= e!33855 (tuple2!4713 Nil!563 (_1!2452 lt!78835)))))

(declare-fun lt!79664 () (_ BitVec 64))

(declare-fun lt!79666 () tuple2!4708)

(declare-fun b!51272 () Bool)

(assert (=> b!51272 (= e!33855 (tuple2!4713 (Cons!562 (_1!2459 lt!79666) (bitStreamReadBitsIntoList!0 (_2!2451 lt!78832) (_2!2459 lt!79666) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!79664))) (_2!2459 lt!79666)))))

(assert (=> b!51272 (= lt!79666 (readBit!0 (_1!2452 lt!78835)))))

(assert (=> b!51272 (= lt!79664 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!51274 () Bool)

(assert (=> b!51274 (= e!33856 (> (length!261 lt!79665) 0))))

(assert (= (and d!16182 c!3658) b!51271))

(assert (= (and d!16182 (not c!3658)) b!51272))

(assert (= (and d!16182 c!3659) b!51273))

(assert (= (and d!16182 (not c!3659)) b!51274))

(declare-fun m!80841 () Bool)

(assert (=> b!51273 m!80841))

(declare-fun m!80843 () Bool)

(assert (=> b!51272 m!80843))

(declare-fun m!80845 () Bool)

(assert (=> b!51272 m!80845))

(declare-fun m!80847 () Bool)

(assert (=> b!51274 m!80847))

(assert (=> b!50958 d!16182))

(declare-fun d!16184 () Bool)

(assert (=> d!16184 (= (tail!252 lt!78833) (t!1316 lt!78833))))

(assert (=> b!50947 d!16184))

(declare-fun d!16186 () Bool)

(declare-fun e!33859 () Bool)

(assert (=> d!16186 e!33859))

(declare-fun res!42927 () Bool)

(assert (=> d!16186 (=> (not res!42927) (not e!33859))))

(declare-fun lt!79672 () (_ BitVec 64))

(assert (=> d!16186 (= res!42927 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79672 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!79672) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!16186 (= lt!79672 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!79671 () Unit!3511)

(declare-fun choose!42 (BitStream!1850 BitStream!1850 BitStream!1850 BitStream!1850 (_ BitVec 64) List!566) Unit!3511)

(assert (=> d!16186 (= lt!79671 (choose!42 (_2!2451 lt!78842) (_2!2451 lt!78842) (_1!2452 lt!78841) (_1!2452 lt!78826) (bvsub to!314 i!635) lt!78833))))

(assert (=> d!16186 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16186 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2451 lt!78842) (_2!2451 lt!78842) (_1!2452 lt!78841) (_1!2452 lt!78826) (bvsub to!314 i!635) lt!78833) lt!79671)))

(declare-fun b!51277 () Bool)

(assert (=> b!51277 (= e!33859 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_1!2452 lt!78826) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!252 lt!78833)))))

(assert (= (and d!16186 res!42927) b!51277))

(declare-fun m!80849 () Bool)

(assert (=> d!16186 m!80849))

(declare-fun m!80851 () Bool)

(assert (=> b!51277 m!80851))

(assert (=> b!51277 m!80213))

(assert (=> b!50947 d!16186))

(declare-fun d!16188 () Bool)

(declare-fun e!33860 () Bool)

(assert (=> d!16188 e!33860))

(declare-fun res!42928 () Bool)

(assert (=> d!16188 (=> (not res!42928) (not e!33860))))

(declare-fun lt!79677 () (_ BitVec 64))

(declare-fun lt!79674 () (_ BitVec 64))

(declare-fun lt!79675 () (_ BitVec 64))

(assert (=> d!16188 (= res!42928 (= lt!79677 (bvsub lt!79674 lt!79675)))))

(assert (=> d!16188 (or (= (bvand lt!79674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79674 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79674 lt!79675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!16188 (= lt!79675 (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832)))))))

(declare-fun lt!79678 () (_ BitVec 64))

(declare-fun lt!79676 () (_ BitVec 64))

(assert (=> d!16188 (= lt!79674 (bvmul lt!79678 lt!79676))))

(assert (=> d!16188 (or (= lt!79678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!79676 (bvsdiv (bvmul lt!79678 lt!79676) lt!79678)))))

(assert (=> d!16188 (= lt!79676 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!16188 (= lt!79678 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))))))

(assert (=> d!16188 (= lt!79677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832)))))))

(assert (=> d!16188 (invariant!0 (currentBit!2941 (_2!2451 lt!78832)) (currentByte!2946 (_2!2451 lt!78832)) (size!1068 (buf!1423 (_2!2451 lt!78832))))))

(assert (=> d!16188 (= (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))) lt!79677)))

(declare-fun b!51278 () Bool)

(declare-fun res!42929 () Bool)

(assert (=> b!51278 (=> (not res!42929) (not e!33860))))

(assert (=> b!51278 (= res!42929 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!79677))))

(declare-fun b!51279 () Bool)

(declare-fun lt!79673 () (_ BitVec 64))

(assert (=> b!51279 (= e!33860 (bvsle lt!79677 (bvmul lt!79673 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!51279 (or (= lt!79673 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!79673 #b0000000000000000000000000000000000000000000000000000000000001000) lt!79673)))))

(assert (=> b!51279 (= lt!79673 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78832)))))))

(assert (= (and d!16188 res!42928) b!51278))

(assert (= (and b!51278 res!42929) b!51279))

(assert (=> d!16188 m!80663))

(assert (=> d!16188 m!80165))

(assert (=> b!50957 d!16188))

(declare-fun b!51282 () Bool)

(declare-fun e!33862 () Bool)

(declare-fun lt!79680 () List!566)

(assert (=> b!51282 (= e!33862 (isEmpty!147 lt!79680))))

(declare-fun d!16190 () Bool)

(assert (=> d!16190 e!33862))

(declare-fun c!3661 () Bool)

(assert (=> d!16190 (= c!3661 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33861 () tuple2!4712)

(assert (=> d!16190 (= lt!79680 (_1!2461 e!33861))))

(declare-fun c!3660 () Bool)

(assert (=> d!16190 (= c!3660 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16190 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16190 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_1!2452 lt!78841) (bvsub to!314 i!635)) lt!79680)))

(declare-fun b!51280 () Bool)

(assert (=> b!51280 (= e!33861 (tuple2!4713 Nil!563 (_1!2452 lt!78841)))))

(declare-fun lt!79681 () tuple2!4708)

(declare-fun b!51281 () Bool)

(declare-fun lt!79679 () (_ BitVec 64))

(assert (=> b!51281 (= e!33861 (tuple2!4713 (Cons!562 (_1!2459 lt!79681) (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_2!2459 lt!79681) (bvsub (bvsub to!314 i!635) lt!79679))) (_2!2459 lt!79681)))))

(assert (=> b!51281 (= lt!79681 (readBit!0 (_1!2452 lt!78841)))))

(assert (=> b!51281 (= lt!79679 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!51283 () Bool)

(assert (=> b!51283 (= e!33862 (> (length!261 lt!79680) 0))))

(assert (= (and d!16190 c!3660) b!51280))

(assert (= (and d!16190 (not c!3660)) b!51281))

(assert (= (and d!16190 c!3661) b!51282))

(assert (= (and d!16190 (not c!3661)) b!51283))

(declare-fun m!80853 () Bool)

(assert (=> b!51282 m!80853))

(declare-fun m!80855 () Bool)

(assert (=> b!51281 m!80855))

(assert (=> b!51281 m!80833))

(declare-fun m!80857 () Bool)

(assert (=> b!51283 m!80857))

(assert (=> b!50946 d!16190))

(declare-fun d!16192 () Bool)

(assert (=> d!16192 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!79682 () Unit!3511)

(assert (=> d!16192 (= lt!79682 (choose!9 thiss!1379 (buf!1423 (_2!2451 lt!78842)) (bvsub to!314 i!635) (BitStream!1851 (buf!1423 (_2!2451 lt!78842)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379))))))

(assert (=> d!16192 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1423 (_2!2451 lt!78842)) (bvsub to!314 i!635)) lt!79682)))

(declare-fun bs!4059 () Bool)

(assert (= bs!4059 d!16192))

(assert (=> bs!4059 m!80201))

(declare-fun m!80859 () Bool)

(assert (=> bs!4059 m!80859))

(assert (=> b!50946 d!16192))

(declare-fun d!16194 () Bool)

(assert (=> d!16194 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 thiss!1379)) ((_ sign_extend 32) (currentBit!2941 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4060 () Bool)

(assert (= bs!4060 d!16194))

(declare-fun m!80861 () Bool)

(assert (=> bs!4060 m!80861))

(assert (=> b!50946 d!16194))

(declare-fun b!51286 () Bool)

(declare-fun e!33864 () Bool)

(declare-fun lt!79684 () List!566)

(assert (=> b!51286 (= e!33864 (isEmpty!147 lt!79684))))

(declare-fun d!16196 () Bool)

(assert (=> d!16196 e!33864))

(declare-fun c!3663 () Bool)

(assert (=> d!16196 (= c!3663 (= lt!78831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!33863 () tuple2!4712)

(assert (=> d!16196 (= lt!79684 (_1!2461 e!33863))))

(declare-fun c!3662 () Bool)

(assert (=> d!16196 (= c!3662 (= lt!78831 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!16196 (bvsge lt!78831 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!16196 (= (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_1!2452 lt!78826) lt!78831) lt!79684)))

(declare-fun b!51284 () Bool)

(assert (=> b!51284 (= e!33863 (tuple2!4713 Nil!563 (_1!2452 lt!78826)))))

(declare-fun b!51285 () Bool)

(declare-fun lt!79685 () tuple2!4708)

(declare-fun lt!79683 () (_ BitVec 64))

(assert (=> b!51285 (= e!33863 (tuple2!4713 (Cons!562 (_1!2459 lt!79685) (bitStreamReadBitsIntoList!0 (_2!2451 lt!78842) (_2!2459 lt!79685) (bvsub lt!78831 lt!79683))) (_2!2459 lt!79685)))))

(assert (=> b!51285 (= lt!79685 (readBit!0 (_1!2452 lt!78826)))))

(assert (=> b!51285 (= lt!79683 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!51287 () Bool)

(assert (=> b!51287 (= e!33864 (> (length!261 lt!79684) 0))))

(assert (= (and d!16196 c!3662) b!51284))

(assert (= (and d!16196 (not c!3662)) b!51285))

(assert (= (and d!16196 c!3663) b!51286))

(assert (= (and d!16196 (not c!3663)) b!51287))

(declare-fun m!80863 () Bool)

(assert (=> b!51286 m!80863))

(declare-fun m!80865 () Bool)

(assert (=> b!51285 m!80865))

(declare-fun m!80867 () Bool)

(assert (=> b!51285 m!80867))

(declare-fun m!80869 () Bool)

(assert (=> b!51287 m!80869))

(assert (=> b!50946 d!16196))

(declare-fun b!51288 () Bool)

(declare-fun e!33865 () Unit!3511)

(declare-fun Unit!3539 () Unit!3511)

(assert (=> b!51288 (= e!33865 Unit!3539)))

(declare-fun b!51289 () Bool)

(declare-fun res!42932 () Bool)

(declare-fun e!33866 () Bool)

(assert (=> b!51289 (=> (not res!42932) (not e!33866))))

(declare-fun lt!79691 () tuple2!4694)

(assert (=> b!51289 (= res!42932 (isPrefixOf!0 (_2!2452 lt!79691) (_2!2451 lt!78842)))))

(declare-fun b!51290 () Bool)

(declare-fun lt!79695 () Unit!3511)

(assert (=> b!51290 (= e!33865 lt!79695)))

(declare-fun lt!79692 () (_ BitVec 64))

(assert (=> b!51290 (= lt!79692 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79686 () (_ BitVec 64))

(assert (=> b!51290 (= lt!79686 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(assert (=> b!51290 (= lt!79695 (arrayBitRangesEqSymmetric!0 (buf!1423 thiss!1379) (buf!1423 (_2!2451 lt!78842)) lt!79692 lt!79686))))

(assert (=> b!51290 (arrayBitRangesEq!0 (buf!1423 (_2!2451 lt!78842)) (buf!1423 thiss!1379) lt!79692 lt!79686)))

(declare-fun lt!79702 () (_ BitVec 64))

(declare-fun b!51291 () Bool)

(declare-fun lt!79701 () (_ BitVec 64))

(assert (=> b!51291 (= e!33866 (= (_1!2452 lt!79691) (withMovedBitIndex!0 (_2!2452 lt!79691) (bvsub lt!79701 lt!79702))))))

(assert (=> b!51291 (or (= (bvand lt!79701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79702 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79701 lt!79702) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51291 (= lt!79702 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842))))))

(assert (=> b!51291 (= lt!79701 (bitIndex!0 (size!1068 (buf!1423 thiss!1379)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(declare-fun d!16198 () Bool)

(assert (=> d!16198 e!33866))

(declare-fun res!42930 () Bool)

(assert (=> d!16198 (=> (not res!42930) (not e!33866))))

(assert (=> d!16198 (= res!42930 (isPrefixOf!0 (_1!2452 lt!79691) (_2!2452 lt!79691)))))

(declare-fun lt!79705 () BitStream!1850)

(assert (=> d!16198 (= lt!79691 (tuple2!4695 lt!79705 (_2!2451 lt!78842)))))

(declare-fun lt!79698 () Unit!3511)

(declare-fun lt!79696 () Unit!3511)

(assert (=> d!16198 (= lt!79698 lt!79696)))

(assert (=> d!16198 (isPrefixOf!0 lt!79705 (_2!2451 lt!78842))))

(assert (=> d!16198 (= lt!79696 (lemmaIsPrefixTransitive!0 lt!79705 (_2!2451 lt!78842) (_2!2451 lt!78842)))))

(declare-fun lt!79690 () Unit!3511)

(declare-fun lt!79688 () Unit!3511)

(assert (=> d!16198 (= lt!79690 lt!79688)))

(assert (=> d!16198 (isPrefixOf!0 lt!79705 (_2!2451 lt!78842))))

(assert (=> d!16198 (= lt!79688 (lemmaIsPrefixTransitive!0 lt!79705 thiss!1379 (_2!2451 lt!78842)))))

(declare-fun lt!79689 () Unit!3511)

(assert (=> d!16198 (= lt!79689 e!33865)))

(declare-fun c!3664 () Bool)

(assert (=> d!16198 (= c!3664 (not (= (size!1068 (buf!1423 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!79703 () Unit!3511)

(declare-fun lt!79693 () Unit!3511)

(assert (=> d!16198 (= lt!79703 lt!79693)))

(assert (=> d!16198 (isPrefixOf!0 (_2!2451 lt!78842) (_2!2451 lt!78842))))

(assert (=> d!16198 (= lt!79693 (lemmaIsPrefixRefl!0 (_2!2451 lt!78842)))))

(declare-fun lt!79704 () Unit!3511)

(declare-fun lt!79700 () Unit!3511)

(assert (=> d!16198 (= lt!79704 lt!79700)))

(assert (=> d!16198 (= lt!79700 (lemmaIsPrefixRefl!0 (_2!2451 lt!78842)))))

(declare-fun lt!79699 () Unit!3511)

(declare-fun lt!79697 () Unit!3511)

(assert (=> d!16198 (= lt!79699 lt!79697)))

(assert (=> d!16198 (isPrefixOf!0 lt!79705 lt!79705)))

(assert (=> d!16198 (= lt!79697 (lemmaIsPrefixRefl!0 lt!79705))))

(declare-fun lt!79687 () Unit!3511)

(declare-fun lt!79694 () Unit!3511)

(assert (=> d!16198 (= lt!79687 lt!79694)))

(assert (=> d!16198 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!16198 (= lt!79694 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!16198 (= lt!79705 (BitStream!1851 (buf!1423 (_2!2451 lt!78842)) (currentByte!2946 thiss!1379) (currentBit!2941 thiss!1379)))))

(assert (=> d!16198 (isPrefixOf!0 thiss!1379 (_2!2451 lt!78842))))

(assert (=> d!16198 (= (reader!0 thiss!1379 (_2!2451 lt!78842)) lt!79691)))

(declare-fun b!51292 () Bool)

(declare-fun res!42931 () Bool)

(assert (=> b!51292 (=> (not res!42931) (not e!33866))))

(assert (=> b!51292 (= res!42931 (isPrefixOf!0 (_1!2452 lt!79691) thiss!1379))))

(assert (= (and d!16198 c!3664) b!51290))

(assert (= (and d!16198 (not c!3664)) b!51288))

(assert (= (and d!16198 res!42930) b!51292))

(assert (= (and b!51292 res!42931) b!51289))

(assert (= (and b!51289 res!42932) b!51291))

(declare-fun m!80871 () Bool)

(assert (=> d!16198 m!80871))

(assert (=> d!16198 m!80205))

(declare-fun m!80873 () Bool)

(assert (=> d!16198 m!80873))

(declare-fun m!80875 () Bool)

(assert (=> d!16198 m!80875))

(declare-fun m!80877 () Bool)

(assert (=> d!16198 m!80877))

(assert (=> d!16198 m!80153))

(declare-fun m!80879 () Bool)

(assert (=> d!16198 m!80879))

(declare-fun m!80881 () Bool)

(assert (=> d!16198 m!80881))

(declare-fun m!80883 () Bool)

(assert (=> d!16198 m!80883))

(declare-fun m!80885 () Bool)

(assert (=> d!16198 m!80885))

(assert (=> d!16198 m!80207))

(declare-fun m!80887 () Bool)

(assert (=> b!51291 m!80887))

(assert (=> b!51291 m!80175))

(assert (=> b!51291 m!80209))

(declare-fun m!80889 () Bool)

(assert (=> b!51289 m!80889))

(declare-fun m!80891 () Bool)

(assert (=> b!51292 m!80891))

(assert (=> b!51290 m!80209))

(declare-fun m!80893 () Bool)

(assert (=> b!51290 m!80893))

(declare-fun m!80895 () Bool)

(assert (=> b!51290 m!80895))

(assert (=> b!50946 d!16198))

(declare-fun d!16200 () Bool)

(assert (=> d!16200 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!78831) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832)))) lt!78831))))

(declare-fun bs!4061 () Bool)

(assert (= bs!4061 d!16200))

(declare-fun m!80897 () Bool)

(assert (=> bs!4061 m!80897))

(assert (=> b!50946 d!16200))

(declare-fun b!51293 () Bool)

(declare-fun e!33867 () Unit!3511)

(declare-fun Unit!3541 () Unit!3511)

(assert (=> b!51293 (= e!33867 Unit!3541)))

(declare-fun b!51294 () Bool)

(declare-fun res!42935 () Bool)

(declare-fun e!33868 () Bool)

(assert (=> b!51294 (=> (not res!42935) (not e!33868))))

(declare-fun lt!79711 () tuple2!4694)

(assert (=> b!51294 (= res!42935 (isPrefixOf!0 (_2!2452 lt!79711) (_2!2451 lt!78842)))))

(declare-fun b!51295 () Bool)

(declare-fun lt!79715 () Unit!3511)

(assert (=> b!51295 (= e!33867 lt!79715)))

(declare-fun lt!79712 () (_ BitVec 64))

(assert (=> b!51295 (= lt!79712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!79706 () (_ BitVec 64))

(assert (=> b!51295 (= lt!79706 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(assert (=> b!51295 (= lt!79715 (arrayBitRangesEqSymmetric!0 (buf!1423 (_2!2451 lt!78832)) (buf!1423 (_2!2451 lt!78842)) lt!79712 lt!79706))))

(assert (=> b!51295 (arrayBitRangesEq!0 (buf!1423 (_2!2451 lt!78842)) (buf!1423 (_2!2451 lt!78832)) lt!79712 lt!79706)))

(declare-fun lt!79721 () (_ BitVec 64))

(declare-fun b!51296 () Bool)

(declare-fun lt!79722 () (_ BitVec 64))

(assert (=> b!51296 (= e!33868 (= (_1!2452 lt!79711) (withMovedBitIndex!0 (_2!2452 lt!79711) (bvsub lt!79721 lt!79722))))))

(assert (=> b!51296 (or (= (bvand lt!79721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!79722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!79721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!79721 lt!79722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!51296 (= lt!79722 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78842))) (currentByte!2946 (_2!2451 lt!78842)) (currentBit!2941 (_2!2451 lt!78842))))))

(assert (=> b!51296 (= lt!79721 (bitIndex!0 (size!1068 (buf!1423 (_2!2451 lt!78832))) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(declare-fun d!16202 () Bool)

(assert (=> d!16202 e!33868))

(declare-fun res!42933 () Bool)

(assert (=> d!16202 (=> (not res!42933) (not e!33868))))

(assert (=> d!16202 (= res!42933 (isPrefixOf!0 (_1!2452 lt!79711) (_2!2452 lt!79711)))))

(declare-fun lt!79725 () BitStream!1850)

(assert (=> d!16202 (= lt!79711 (tuple2!4695 lt!79725 (_2!2451 lt!78842)))))

(declare-fun lt!79718 () Unit!3511)

(declare-fun lt!79716 () Unit!3511)

(assert (=> d!16202 (= lt!79718 lt!79716)))

(assert (=> d!16202 (isPrefixOf!0 lt!79725 (_2!2451 lt!78842))))

(assert (=> d!16202 (= lt!79716 (lemmaIsPrefixTransitive!0 lt!79725 (_2!2451 lt!78842) (_2!2451 lt!78842)))))

(declare-fun lt!79710 () Unit!3511)

(declare-fun lt!79708 () Unit!3511)

(assert (=> d!16202 (= lt!79710 lt!79708)))

(assert (=> d!16202 (isPrefixOf!0 lt!79725 (_2!2451 lt!78842))))

(assert (=> d!16202 (= lt!79708 (lemmaIsPrefixTransitive!0 lt!79725 (_2!2451 lt!78832) (_2!2451 lt!78842)))))

(declare-fun lt!79709 () Unit!3511)

(assert (=> d!16202 (= lt!79709 e!33867)))

(declare-fun c!3665 () Bool)

(assert (=> d!16202 (= c!3665 (not (= (size!1068 (buf!1423 (_2!2451 lt!78832))) #b00000000000000000000000000000000)))))

(declare-fun lt!79723 () Unit!3511)

(declare-fun lt!79713 () Unit!3511)

(assert (=> d!16202 (= lt!79723 lt!79713)))

(assert (=> d!16202 (isPrefixOf!0 (_2!2451 lt!78842) (_2!2451 lt!78842))))

(assert (=> d!16202 (= lt!79713 (lemmaIsPrefixRefl!0 (_2!2451 lt!78842)))))

(declare-fun lt!79724 () Unit!3511)

(declare-fun lt!79720 () Unit!3511)

(assert (=> d!16202 (= lt!79724 lt!79720)))

(assert (=> d!16202 (= lt!79720 (lemmaIsPrefixRefl!0 (_2!2451 lt!78842)))))

(declare-fun lt!79719 () Unit!3511)

(declare-fun lt!79717 () Unit!3511)

(assert (=> d!16202 (= lt!79719 lt!79717)))

(assert (=> d!16202 (isPrefixOf!0 lt!79725 lt!79725)))

(assert (=> d!16202 (= lt!79717 (lemmaIsPrefixRefl!0 lt!79725))))

(declare-fun lt!79707 () Unit!3511)

(declare-fun lt!79714 () Unit!3511)

(assert (=> d!16202 (= lt!79707 lt!79714)))

(assert (=> d!16202 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78832))))

(assert (=> d!16202 (= lt!79714 (lemmaIsPrefixRefl!0 (_2!2451 lt!78832)))))

(assert (=> d!16202 (= lt!79725 (BitStream!1851 (buf!1423 (_2!2451 lt!78842)) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832))))))

(assert (=> d!16202 (isPrefixOf!0 (_2!2451 lt!78832) (_2!2451 lt!78842))))

(assert (=> d!16202 (= (reader!0 (_2!2451 lt!78832) (_2!2451 lt!78842)) lt!79711)))

(declare-fun b!51297 () Bool)

(declare-fun res!42934 () Bool)

(assert (=> b!51297 (=> (not res!42934) (not e!33868))))

(assert (=> b!51297 (= res!42934 (isPrefixOf!0 (_1!2452 lt!79711) (_2!2451 lt!78832)))))

(assert (= (and d!16202 c!3665) b!51295))

(assert (= (and d!16202 (not c!3665)) b!51293))

(assert (= (and d!16202 res!42933) b!51297))

(assert (= (and b!51297 res!42934) b!51294))

(assert (= (and b!51294 res!42935) b!51296))

(declare-fun m!80899 () Bool)

(assert (=> d!16202 m!80899))

(assert (=> d!16202 m!80609))

(assert (=> d!16202 m!80873))

(declare-fun m!80901 () Bool)

(assert (=> d!16202 m!80901))

(declare-fun m!80903 () Bool)

(assert (=> d!16202 m!80903))

(assert (=> d!16202 m!80143))

(declare-fun m!80905 () Bool)

(assert (=> d!16202 m!80905))

(assert (=> d!16202 m!80881))

(declare-fun m!80907 () Bool)

(assert (=> d!16202 m!80907))

(declare-fun m!80909 () Bool)

(assert (=> d!16202 m!80909))

(assert (=> d!16202 m!80611))

(declare-fun m!80911 () Bool)

(assert (=> b!51296 m!80911))

(assert (=> b!51296 m!80175))

(assert (=> b!51296 m!80181))

(declare-fun m!80913 () Bool)

(assert (=> b!51294 m!80913))

(declare-fun m!80915 () Bool)

(assert (=> b!51297 m!80915))

(assert (=> b!51295 m!80181))

(declare-fun m!80917 () Bool)

(assert (=> b!51295 m!80917))

(declare-fun m!80919 () Bool)

(assert (=> b!51295 m!80919))

(assert (=> b!50946 d!16202))

(declare-fun d!16204 () Bool)

(assert (=> d!16204 (validate_offset_bits!1 ((_ sign_extend 32) (size!1068 (buf!1423 (_2!2451 lt!78842)))) ((_ sign_extend 32) (currentByte!2946 (_2!2451 lt!78832))) ((_ sign_extend 32) (currentBit!2941 (_2!2451 lt!78832))) lt!78831)))

(declare-fun lt!79726 () Unit!3511)

(assert (=> d!16204 (= lt!79726 (choose!9 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!78842)) lt!78831 (BitStream!1851 (buf!1423 (_2!2451 lt!78842)) (currentByte!2946 (_2!2451 lt!78832)) (currentBit!2941 (_2!2451 lt!78832)))))))

(assert (=> d!16204 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2451 lt!78832) (buf!1423 (_2!2451 lt!78842)) lt!78831) lt!79726)))

(declare-fun bs!4062 () Bool)

(assert (= bs!4062 d!16204))

(assert (=> bs!4062 m!80197))

(declare-fun m!80921 () Bool)

(assert (=> bs!4062 m!80921))

(assert (=> b!50946 d!16204))

(push 1)

(assert (not b!51258))

(assert (not b!51176))

(assert (not d!16022))

(assert (not d!16186))

(assert (not d!16130))

(assert (not b!51158))

(assert (not d!16204))

(assert (not d!16188))

(assert (not d!16126))

(assert (not b!51282))

(assert (not b!51149))

(assert (not b!51145))

(assert (not d!16012))

(assert (not b!51285))

(assert (not b!50999))

(assert (not b!51192))

(assert (not d!16014))

(assert (not b!51155))

(assert (not b!51281))

(assert (not b!51297))

(assert (not d!16162))

(assert (not b!51296))

(assert (not b!51295))

(assert (not b!51274))

(assert (not b!51001))

(assert (not b!51283))

(assert (not d!16200))

(assert (not b!51156))

(assert (not d!16198))

(assert (not d!16194))

(assert (not b!51251))

(assert (not d!16122))

(assert (not b!51148))

(assert (not b!51262))

(assert (not b!51273))

(assert (not b!51146))

(assert (not d!16020))

(assert (not d!16174))

(assert (not b!51253))

(assert (not b!51291))

(assert (not b!50992))

(assert (not d!16164))

(assert (not b!51277))

(assert (not b!51147))

(assert (not b!51175))

(assert (not b!51292))

(assert (not b!51190))

(assert (not d!16108))

(assert (not d!16202))

(assert (not b!51177))

(assert (not d!16118))

(assert (not b!51272))

(assert (not b!51255))

(assert (not d!16192))

(assert (not b!51257))

(assert (not bm!652))

(assert (not b!51286))

(assert (not b!51150))

(assert (not b!51256))

(assert (not b!51254))

(assert (not b!51290))

(assert (not d!16168))

(assert (not d!16112))

(assert (not b!51174))

(assert (not b!51195))

(assert (not b!51252))

(assert (not b!51294))

(assert (not d!16110))

(assert (not d!16128))

(assert (not b!51287))

(assert (not b!51153))

(assert (not b!51289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

