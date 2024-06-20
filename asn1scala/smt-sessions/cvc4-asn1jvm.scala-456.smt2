; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12340 () Bool)

(assert start!12340)

(declare-fun b!63031 () Bool)

(declare-fun res!52418 () Bool)

(declare-fun e!41803 () Bool)

(assert (=> b!63031 (=> res!52418 e!41803)))

(declare-datatypes ((array!2801 0))(
  ( (array!2802 (arr!1846 (Array (_ BitVec 32) (_ BitVec 8))) (size!1282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2228 0))(
  ( (BitStream!2229 (buf!1663 array!2801) (currentByte!3305 (_ BitVec 32)) (currentBit!3300 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4281 0))(
  ( (Unit!4282) )
))
(declare-datatypes ((tuple2!5674 0))(
  ( (tuple2!5675 (_1!2948 Unit!4281) (_2!2948 BitStream!2228)) )
))
(declare-fun lt!99116 () tuple2!5674)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!63031 (= res!52418 (not (invariant!0 (currentBit!3300 (_2!2948 lt!99116)) (currentByte!3305 (_2!2948 lt!99116)) (size!1282 (buf!1663 (_2!2948 lt!99116))))))))

(declare-fun b!63032 () Bool)

(declare-fun e!41810 () Bool)

(declare-fun e!41802 () Bool)

(assert (=> b!63032 (= e!41810 e!41802)))

(declare-fun res!52425 () Bool)

(assert (=> b!63032 (=> res!52425 e!41802)))

(declare-fun thiss!1379 () BitStream!2228)

(declare-fun lt!99113 () tuple2!5674)

(declare-fun isPrefixOf!0 (BitStream!2228 BitStream!2228) Bool)

(assert (=> b!63032 (= res!52425 (not (isPrefixOf!0 thiss!1379 (_2!2948 lt!99113))))))

(declare-fun lt!99122 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63032 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99122)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!63032 (= lt!99122 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99117 () Unit!4281)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2228 BitStream!2228 (_ BitVec 64) (_ BitVec 64)) Unit!4281)

(assert (=> b!63032 (= lt!99117 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2948 lt!99113) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2801)

(declare-fun appendBitFromByte!0 (BitStream!2228 (_ BitVec 8) (_ BitVec 32)) tuple2!5674)

(assert (=> b!63032 (= lt!99113 (appendBitFromByte!0 thiss!1379 (select (arr!1846 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!63033 () Bool)

(declare-fun res!52426 () Bool)

(declare-fun e!41806 () Bool)

(assert (=> b!63033 (=> res!52426 e!41806)))

(assert (=> b!63033 (= res!52426 (not (invariant!0 (currentBit!3300 (_2!2948 lt!99113)) (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99116))))))))

(declare-fun b!63034 () Bool)

(declare-fun res!52423 () Bool)

(assert (=> b!63034 (=> res!52423 e!41806)))

(assert (=> b!63034 (= res!52423 (not (invariant!0 (currentBit!3300 (_2!2948 lt!99113)) (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99113))))))))

(declare-fun res!52419 () Bool)

(declare-fun e!41811 () Bool)

(assert (=> start!12340 (=> (not res!52419) (not e!41811))))

(assert (=> start!12340 (= res!52419 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1282 srcBuffer!2))))))))

(assert (=> start!12340 e!41811))

(assert (=> start!12340 true))

(declare-fun array_inv!1173 (array!2801) Bool)

(assert (=> start!12340 (array_inv!1173 srcBuffer!2)))

(declare-fun e!41812 () Bool)

(declare-fun inv!12 (BitStream!2228) Bool)

(assert (=> start!12340 (and (inv!12 thiss!1379) e!41812)))

(declare-fun e!41804 () Bool)

(declare-fun lt!99114 () (_ BitVec 64))

(declare-fun b!63035 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!63035 (= e!41804 (= lt!99114 (bvsub (bvsub (bvadd (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!63036 () Bool)

(declare-fun res!52424 () Bool)

(declare-fun e!41805 () Bool)

(assert (=> b!63036 (=> res!52424 e!41805)))

(declare-datatypes ((tuple2!5676 0))(
  ( (tuple2!5677 (_1!2949 BitStream!2228) (_2!2949 BitStream!2228)) )
))
(declare-fun lt!99115 () tuple2!5676)

(declare-fun lt!99119 () tuple2!5676)

(assert (=> b!63036 (= res!52424 (not (isPrefixOf!0 (_1!2949 lt!99115) (_1!2949 lt!99119))))))

(declare-fun b!63037 () Bool)

(declare-fun e!41809 () Bool)

(assert (=> b!63037 (= e!41809 e!41803)))

(declare-fun res!52432 () Bool)

(assert (=> b!63037 (=> res!52432 e!41803)))

(declare-fun lt!99123 () (_ BitVec 64))

(assert (=> b!63037 (= res!52432 (not (= lt!99114 (bvsub (bvadd lt!99123 to!314) i!635))))))

(assert (=> b!63037 (= lt!99114 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116))))))

(declare-fun b!63038 () Bool)

(assert (=> b!63038 (= e!41802 e!41809)))

(declare-fun res!52420 () Bool)

(assert (=> b!63038 (=> res!52420 e!41809)))

(assert (=> b!63038 (= res!52420 (not (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99116))))))

(assert (=> b!63038 (isPrefixOf!0 thiss!1379 (_2!2948 lt!99116))))

(declare-fun lt!99121 () Unit!4281)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2228 BitStream!2228 BitStream!2228) Unit!4281)

(assert (=> b!63038 (= lt!99121 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2948 lt!99113) (_2!2948 lt!99116)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2228 array!2801 (_ BitVec 64) (_ BitVec 64)) tuple2!5674)

(assert (=> b!63038 (= lt!99116 (appendBitsMSBFirstLoop!0 (_2!2948 lt!99113) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!41813 () Bool)

(assert (=> b!63038 e!41813))

(declare-fun res!52417 () Bool)

(assert (=> b!63038 (=> (not res!52417) (not e!41813))))

(assert (=> b!63038 (= res!52417 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99111 () Unit!4281)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2228 array!2801 (_ BitVec 64)) Unit!4281)

(assert (=> b!63038 (= lt!99111 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1663 (_2!2948 lt!99113)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99124 () tuple2!5676)

(declare-fun reader!0 (BitStream!2228 BitStream!2228) tuple2!5676)

(assert (=> b!63038 (= lt!99124 (reader!0 thiss!1379 (_2!2948 lt!99113)))))

(declare-fun b!63039 () Bool)

(declare-fun res!52430 () Bool)

(assert (=> b!63039 (=> (not res!52430) (not e!41811))))

(assert (=> b!63039 (= res!52430 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!63040 () Bool)

(assert (=> b!63040 (= e!41811 (not e!41810))))

(declare-fun res!52431 () Bool)

(assert (=> b!63040 (=> res!52431 e!41810)))

(assert (=> b!63040 (= res!52431 (bvsge i!635 to!314))))

(assert (=> b!63040 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!99110 () Unit!4281)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2228) Unit!4281)

(assert (=> b!63040 (= lt!99110 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!63040 (= lt!99123 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(declare-fun b!63041 () Bool)

(assert (=> b!63041 (= e!41803 e!41806)))

(declare-fun res!52429 () Bool)

(assert (=> b!63041 (=> res!52429 e!41806)))

(assert (=> b!63041 (= res!52429 (not (= (size!1282 (buf!1663 (_2!2948 lt!99113))) (size!1282 (buf!1663 (_2!2948 lt!99116))))))))

(assert (=> b!63041 e!41804))

(declare-fun res!52421 () Bool)

(assert (=> b!63041 (=> (not res!52421) (not e!41804))))

(assert (=> b!63041 (= res!52421 (= (size!1282 (buf!1663 (_2!2948 lt!99116))) (size!1282 (buf!1663 thiss!1379))))))

(declare-fun b!63042 () Bool)

(assert (=> b!63042 (= e!41812 (array_inv!1173 (buf!1663 thiss!1379)))))

(declare-fun b!63043 () Bool)

(declare-fun res!52422 () Bool)

(assert (=> b!63043 (=> res!52422 e!41805)))

(assert (=> b!63043 (= res!52422 (not (isPrefixOf!0 (_1!2949 lt!99119) (_2!2948 lt!99116))))))

(declare-fun b!63044 () Bool)

(assert (=> b!63044 (= e!41806 e!41805)))

(declare-fun res!52434 () Bool)

(assert (=> b!63044 (=> res!52434 e!41805)))

(assert (=> b!63044 (= res!52434 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!689 0))(
  ( (Nil!686) (Cons!685 (h!804 Bool) (t!1439 List!689)) )
))
(declare-fun lt!99112 () List!689)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2228 BitStream!2228 (_ BitVec 64)) List!689)

(assert (=> b!63044 (= lt!99112 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_1!2949 lt!99119) lt!99122))))

(declare-fun lt!99118 () List!689)

(assert (=> b!63044 (= lt!99118 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_1!2949 lt!99115) (bvsub to!314 i!635)))))

(assert (=> b!63044 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99122)))

(declare-fun lt!99109 () Unit!4281)

(assert (=> b!63044 (= lt!99109 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99116)) lt!99122))))

(assert (=> b!63044 (= lt!99119 (reader!0 (_2!2948 lt!99113) (_2!2948 lt!99116)))))

(assert (=> b!63044 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!99120 () Unit!4281)

(assert (=> b!63044 (= lt!99120 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1663 (_2!2948 lt!99116)) (bvsub to!314 i!635)))))

(assert (=> b!63044 (= lt!99115 (reader!0 thiss!1379 (_2!2948 lt!99116)))))

(declare-fun b!63045 () Bool)

(declare-fun res!52433 () Bool)

(assert (=> b!63045 (=> res!52433 e!41805)))

(declare-fun length!317 (List!689) Int)

(assert (=> b!63045 (= res!52433 (<= (length!317 lt!99118) 0))))

(declare-fun b!63046 () Bool)

(declare-fun res!52427 () Bool)

(assert (=> b!63046 (=> res!52427 e!41805)))

(assert (=> b!63046 (= res!52427 (not (isPrefixOf!0 (_1!2949 lt!99115) (_2!2948 lt!99116))))))

(declare-fun b!63047 () Bool)

(declare-fun head!508 (List!689) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2228 array!2801 (_ BitVec 64) (_ BitVec 64)) List!689)

(assert (=> b!63047 (= e!41813 (= (head!508 (byteArrayBitContentToList!0 (_2!2948 lt!99113) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!508 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99113) (_1!2949 lt!99124) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!63048 () Bool)

(assert (=> b!63048 (= e!41805 (or (not (= (buf!1663 (_1!2949 lt!99115)) (buf!1663 (_1!2949 lt!99119)))) (= (buf!1663 (_1!2949 lt!99115)) (buf!1663 (_2!2948 lt!99116)))))))

(declare-fun b!63049 () Bool)

(declare-fun res!52428 () Bool)

(assert (=> b!63049 (=> res!52428 e!41803)))

(assert (=> b!63049 (= res!52428 (not (= (size!1282 (buf!1663 thiss!1379)) (size!1282 (buf!1663 (_2!2948 lt!99116))))))))

(assert (= (and start!12340 res!52419) b!63039))

(assert (= (and b!63039 res!52430) b!63040))

(assert (= (and b!63040 (not res!52431)) b!63032))

(assert (= (and b!63032 (not res!52425)) b!63038))

(assert (= (and b!63038 res!52417) b!63047))

(assert (= (and b!63038 (not res!52420)) b!63037))

(assert (= (and b!63037 (not res!52432)) b!63031))

(assert (= (and b!63031 (not res!52418)) b!63049))

(assert (= (and b!63049 (not res!52428)) b!63041))

(assert (= (and b!63041 res!52421) b!63035))

(assert (= (and b!63041 (not res!52429)) b!63034))

(assert (= (and b!63034 (not res!52423)) b!63033))

(assert (= (and b!63033 (not res!52426)) b!63044))

(assert (= (and b!63044 (not res!52434)) b!63045))

(assert (= (and b!63045 (not res!52433)) b!63046))

(assert (= (and b!63046 (not res!52427)) b!63043))

(assert (= (and b!63043 (not res!52422)) b!63036))

(assert (= (and b!63036 (not res!52424)) b!63048))

(assert (= start!12340 b!63042))

(declare-fun m!99761 () Bool)

(assert (=> b!63042 m!99761))

(declare-fun m!99763 () Bool)

(assert (=> start!12340 m!99763))

(declare-fun m!99765 () Bool)

(assert (=> start!12340 m!99765))

(declare-fun m!99767 () Bool)

(assert (=> b!63033 m!99767))

(declare-fun m!99769 () Bool)

(assert (=> b!63031 m!99769))

(declare-fun m!99771 () Bool)

(assert (=> b!63046 m!99771))

(declare-fun m!99773 () Bool)

(assert (=> b!63037 m!99773))

(declare-fun m!99775 () Bool)

(assert (=> b!63034 m!99775))

(declare-fun m!99777 () Bool)

(assert (=> b!63040 m!99777))

(declare-fun m!99779 () Bool)

(assert (=> b!63040 m!99779))

(declare-fun m!99781 () Bool)

(assert (=> b!63040 m!99781))

(declare-fun m!99783 () Bool)

(assert (=> b!63035 m!99783))

(declare-fun m!99785 () Bool)

(assert (=> b!63044 m!99785))

(declare-fun m!99787 () Bool)

(assert (=> b!63044 m!99787))

(declare-fun m!99789 () Bool)

(assert (=> b!63044 m!99789))

(declare-fun m!99791 () Bool)

(assert (=> b!63044 m!99791))

(declare-fun m!99793 () Bool)

(assert (=> b!63044 m!99793))

(declare-fun m!99795 () Bool)

(assert (=> b!63044 m!99795))

(declare-fun m!99797 () Bool)

(assert (=> b!63044 m!99797))

(declare-fun m!99799 () Bool)

(assert (=> b!63044 m!99799))

(declare-fun m!99801 () Bool)

(assert (=> b!63045 m!99801))

(declare-fun m!99803 () Bool)

(assert (=> b!63032 m!99803))

(declare-fun m!99805 () Bool)

(assert (=> b!63032 m!99805))

(assert (=> b!63032 m!99803))

(declare-fun m!99807 () Bool)

(assert (=> b!63032 m!99807))

(declare-fun m!99809 () Bool)

(assert (=> b!63032 m!99809))

(declare-fun m!99811 () Bool)

(assert (=> b!63032 m!99811))

(declare-fun m!99813 () Bool)

(assert (=> b!63043 m!99813))

(declare-fun m!99815 () Bool)

(assert (=> b!63039 m!99815))

(declare-fun m!99817 () Bool)

(assert (=> b!63047 m!99817))

(assert (=> b!63047 m!99817))

(declare-fun m!99819 () Bool)

(assert (=> b!63047 m!99819))

(declare-fun m!99821 () Bool)

(assert (=> b!63047 m!99821))

(assert (=> b!63047 m!99821))

(declare-fun m!99823 () Bool)

(assert (=> b!63047 m!99823))

(declare-fun m!99825 () Bool)

(assert (=> b!63036 m!99825))

(declare-fun m!99827 () Bool)

(assert (=> b!63038 m!99827))

(declare-fun m!99829 () Bool)

(assert (=> b!63038 m!99829))

(declare-fun m!99831 () Bool)

(assert (=> b!63038 m!99831))

(declare-fun m!99833 () Bool)

(assert (=> b!63038 m!99833))

(declare-fun m!99835 () Bool)

(assert (=> b!63038 m!99835))

(declare-fun m!99837 () Bool)

(assert (=> b!63038 m!99837))

(declare-fun m!99839 () Bool)

(assert (=> b!63038 m!99839))

(push 1)

(assert (not start!12340))

(assert (not b!63037))

(assert (not b!63046))

(assert (not b!63034))

(assert (not b!63044))

(assert (not b!63036))

(assert (not b!63047))

(assert (not b!63035))

(assert (not b!63040))

(assert (not b!63042))

(assert (not b!63038))

(assert (not b!63045))

(assert (not b!63043))

(assert (not b!63032))

(assert (not b!63039))

(assert (not b!63033))

(assert (not b!63031))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!19624 () Bool)

(declare-fun res!52537 () Bool)

(declare-fun e!41899 () Bool)

(assert (=> d!19624 (=> (not res!52537) (not e!41899))))

(assert (=> d!19624 (= res!52537 (= (size!1282 (buf!1663 (_1!2949 lt!99115))) (size!1282 (buf!1663 (_1!2949 lt!99119)))))))

(assert (=> d!19624 (= (isPrefixOf!0 (_1!2949 lt!99115) (_1!2949 lt!99119)) e!41899)))

(declare-fun b!63205 () Bool)

(declare-fun res!52536 () Bool)

(assert (=> b!63205 (=> (not res!52536) (not e!41899))))

(assert (=> b!63205 (= res!52536 (bvsle (bitIndex!0 (size!1282 (buf!1663 (_1!2949 lt!99115))) (currentByte!3305 (_1!2949 lt!99115)) (currentBit!3300 (_1!2949 lt!99115))) (bitIndex!0 (size!1282 (buf!1663 (_1!2949 lt!99119))) (currentByte!3305 (_1!2949 lt!99119)) (currentBit!3300 (_1!2949 lt!99119)))))))

(declare-fun b!63206 () Bool)

(declare-fun e!41898 () Bool)

(assert (=> b!63206 (= e!41899 e!41898)))

(declare-fun res!52535 () Bool)

(assert (=> b!63206 (=> res!52535 e!41898)))

(assert (=> b!63206 (= res!52535 (= (size!1282 (buf!1663 (_1!2949 lt!99115))) #b00000000000000000000000000000000))))

(declare-fun b!63207 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2801 array!2801 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!63207 (= e!41898 (arrayBitRangesEq!0 (buf!1663 (_1!2949 lt!99115)) (buf!1663 (_1!2949 lt!99119)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1282 (buf!1663 (_1!2949 lt!99115))) (currentByte!3305 (_1!2949 lt!99115)) (currentBit!3300 (_1!2949 lt!99115)))))))

(assert (= (and d!19624 res!52537) b!63205))

(assert (= (and b!63205 res!52536) b!63206))

(assert (= (and b!63206 (not res!52535)) b!63207))

(declare-fun m!100045 () Bool)

(assert (=> b!63205 m!100045))

(declare-fun m!100047 () Bool)

(assert (=> b!63205 m!100047))

(assert (=> b!63207 m!100045))

(assert (=> b!63207 m!100045))

(declare-fun m!100049 () Bool)

(assert (=> b!63207 m!100049))

(assert (=> b!63036 d!19624))

(declare-fun d!19626 () Bool)

(declare-fun res!52540 () Bool)

(declare-fun e!41901 () Bool)

(assert (=> d!19626 (=> (not res!52540) (not e!41901))))

(assert (=> d!19626 (= res!52540 (= (size!1282 (buf!1663 (_1!2949 lt!99115))) (size!1282 (buf!1663 (_2!2948 lt!99116)))))))

(assert (=> d!19626 (= (isPrefixOf!0 (_1!2949 lt!99115) (_2!2948 lt!99116)) e!41901)))

(declare-fun b!63208 () Bool)

(declare-fun res!52539 () Bool)

(assert (=> b!63208 (=> (not res!52539) (not e!41901))))

(assert (=> b!63208 (= res!52539 (bvsle (bitIndex!0 (size!1282 (buf!1663 (_1!2949 lt!99115))) (currentByte!3305 (_1!2949 lt!99115)) (currentBit!3300 (_1!2949 lt!99115))) (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116)))))))

(declare-fun b!63209 () Bool)

(declare-fun e!41900 () Bool)

(assert (=> b!63209 (= e!41901 e!41900)))

(declare-fun res!52538 () Bool)

(assert (=> b!63209 (=> res!52538 e!41900)))

(assert (=> b!63209 (= res!52538 (= (size!1282 (buf!1663 (_1!2949 lt!99115))) #b00000000000000000000000000000000))))

(declare-fun b!63210 () Bool)

(assert (=> b!63210 (= e!41900 (arrayBitRangesEq!0 (buf!1663 (_1!2949 lt!99115)) (buf!1663 (_2!2948 lt!99116)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1282 (buf!1663 (_1!2949 lt!99115))) (currentByte!3305 (_1!2949 lt!99115)) (currentBit!3300 (_1!2949 lt!99115)))))))

(assert (= (and d!19626 res!52540) b!63208))

(assert (= (and b!63208 res!52539) b!63209))

(assert (= (and b!63209 (not res!52538)) b!63210))

(assert (=> b!63208 m!100045))

(assert (=> b!63208 m!99773))

(assert (=> b!63210 m!100045))

(assert (=> b!63210 m!100045))

(declare-fun m!100051 () Bool)

(assert (=> b!63210 m!100051))

(assert (=> b!63046 d!19626))

(declare-fun d!19628 () Bool)

(assert (=> d!19628 (= (array_inv!1173 srcBuffer!2) (bvsge (size!1282 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12340 d!19628))

(declare-fun d!19630 () Bool)

(assert (=> d!19630 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3300 thiss!1379) (currentByte!3305 thiss!1379) (size!1282 (buf!1663 thiss!1379))))))

(declare-fun bs!4849 () Bool)

(assert (= bs!4849 d!19630))

(declare-fun m!100053 () Bool)

(assert (=> bs!4849 m!100053))

(assert (=> start!12340 d!19630))

(declare-fun d!19632 () Bool)

(declare-fun e!41904 () Bool)

(assert (=> d!19632 e!41904))

(declare-fun res!52546 () Bool)

(assert (=> d!19632 (=> (not res!52546) (not e!41904))))

(declare-fun lt!99347 () (_ BitVec 64))

(declare-fun lt!99349 () (_ BitVec 64))

(declare-fun lt!99348 () (_ BitVec 64))

(assert (=> d!19632 (= res!52546 (= lt!99347 (bvsub lt!99349 lt!99348)))))

(assert (=> d!19632 (or (= (bvand lt!99349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99349 lt!99348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!19632 (= lt!99348 (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113)))))))

(declare-fun lt!99344 () (_ BitVec 64))

(declare-fun lt!99346 () (_ BitVec 64))

(assert (=> d!19632 (= lt!99349 (bvmul lt!99344 lt!99346))))

(assert (=> d!19632 (or (= lt!99344 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99346 (bvsdiv (bvmul lt!99344 lt!99346) lt!99344)))))

(assert (=> d!19632 (= lt!99346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19632 (= lt!99344 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))))))

(assert (=> d!19632 (= lt!99347 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113)))))))

(assert (=> d!19632 (invariant!0 (currentBit!3300 (_2!2948 lt!99113)) (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99113))))))

(assert (=> d!19632 (= (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))) lt!99347)))

(declare-fun b!63215 () Bool)

(declare-fun res!52545 () Bool)

(assert (=> b!63215 (=> (not res!52545) (not e!41904))))

(assert (=> b!63215 (= res!52545 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99347))))

(declare-fun b!63216 () Bool)

(declare-fun lt!99345 () (_ BitVec 64))

(assert (=> b!63216 (= e!41904 (bvsle lt!99347 (bvmul lt!99345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63216 (or (= lt!99345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99345)))))

(assert (=> b!63216 (= lt!99345 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))))))

(assert (= (and d!19632 res!52546) b!63215))

(assert (= (and b!63215 res!52545) b!63216))

(declare-fun m!100055 () Bool)

(assert (=> d!19632 m!100055))

(assert (=> d!19632 m!99775))

(assert (=> b!63035 d!19632))

(declare-fun d!19634 () Bool)

(declare-fun size!1285 (List!689) Int)

(assert (=> d!19634 (= (length!317 lt!99118) (size!1285 lt!99118))))

(declare-fun bs!4850 () Bool)

(assert (= bs!4850 d!19634))

(declare-fun m!100057 () Bool)

(assert (=> bs!4850 m!100057))

(assert (=> b!63045 d!19634))

(declare-fun d!19636 () Bool)

(assert (=> d!19636 (= (invariant!0 (currentBit!3300 (_2!2948 lt!99113)) (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99113)))) (and (bvsge (currentBit!3300 (_2!2948 lt!99113)) #b00000000000000000000000000000000) (bvslt (currentBit!3300 (_2!2948 lt!99113)) #b00000000000000000000000000001000) (bvsge (currentByte!3305 (_2!2948 lt!99113)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99113)))) (and (= (currentBit!3300 (_2!2948 lt!99113)) #b00000000000000000000000000000000) (= (currentByte!3305 (_2!2948 lt!99113)) (size!1282 (buf!1663 (_2!2948 lt!99113))))))))))

(assert (=> b!63034 d!19636))

(declare-fun d!19638 () Bool)

(declare-fun e!41909 () Bool)

(assert (=> d!19638 e!41909))

(declare-fun res!52554 () Bool)

(assert (=> d!19638 (=> (not res!52554) (not e!41909))))

(declare-fun lt!99396 () tuple2!5676)

(assert (=> d!19638 (= res!52554 (isPrefixOf!0 (_1!2949 lt!99396) (_2!2949 lt!99396)))))

(declare-fun lt!99407 () BitStream!2228)

(assert (=> d!19638 (= lt!99396 (tuple2!5677 lt!99407 (_2!2948 lt!99113)))))

(declare-fun lt!99393 () Unit!4281)

(declare-fun lt!99400 () Unit!4281)

(assert (=> d!19638 (= lt!99393 lt!99400)))

(assert (=> d!19638 (isPrefixOf!0 lt!99407 (_2!2948 lt!99113))))

(assert (=> d!19638 (= lt!99400 (lemmaIsPrefixTransitive!0 lt!99407 (_2!2948 lt!99113) (_2!2948 lt!99113)))))

(declare-fun lt!99395 () Unit!4281)

(declare-fun lt!99403 () Unit!4281)

(assert (=> d!19638 (= lt!99395 lt!99403)))

(assert (=> d!19638 (isPrefixOf!0 lt!99407 (_2!2948 lt!99113))))

(assert (=> d!19638 (= lt!99403 (lemmaIsPrefixTransitive!0 lt!99407 thiss!1379 (_2!2948 lt!99113)))))

(declare-fun lt!99392 () Unit!4281)

(declare-fun e!41910 () Unit!4281)

(assert (=> d!19638 (= lt!99392 e!41910)))

(declare-fun c!4509 () Bool)

(assert (=> d!19638 (= c!4509 (not (= (size!1282 (buf!1663 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!99399 () Unit!4281)

(declare-fun lt!99390 () Unit!4281)

(assert (=> d!19638 (= lt!99399 lt!99390)))

(assert (=> d!19638 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99113))))

(assert (=> d!19638 (= lt!99390 (lemmaIsPrefixRefl!0 (_2!2948 lt!99113)))))

(declare-fun lt!99401 () Unit!4281)

(declare-fun lt!99408 () Unit!4281)

(assert (=> d!19638 (= lt!99401 lt!99408)))

(assert (=> d!19638 (= lt!99408 (lemmaIsPrefixRefl!0 (_2!2948 lt!99113)))))

(declare-fun lt!99406 () Unit!4281)

(declare-fun lt!99404 () Unit!4281)

(assert (=> d!19638 (= lt!99406 lt!99404)))

(assert (=> d!19638 (isPrefixOf!0 lt!99407 lt!99407)))

(assert (=> d!19638 (= lt!99404 (lemmaIsPrefixRefl!0 lt!99407))))

(declare-fun lt!99405 () Unit!4281)

(declare-fun lt!99391 () Unit!4281)

(assert (=> d!19638 (= lt!99405 lt!99391)))

(assert (=> d!19638 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19638 (= lt!99391 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19638 (= lt!99407 (BitStream!2229 (buf!1663 (_2!2948 lt!99113)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(assert (=> d!19638 (isPrefixOf!0 thiss!1379 (_2!2948 lt!99113))))

(assert (=> d!19638 (= (reader!0 thiss!1379 (_2!2948 lt!99113)) lt!99396)))

(declare-fun b!63227 () Bool)

(declare-fun res!52555 () Bool)

(assert (=> b!63227 (=> (not res!52555) (not e!41909))))

(assert (=> b!63227 (= res!52555 (isPrefixOf!0 (_2!2949 lt!99396) (_2!2948 lt!99113)))))

(declare-fun lt!99402 () (_ BitVec 64))

(declare-fun lt!99394 () (_ BitVec 64))

(declare-fun b!63228 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2228 (_ BitVec 64)) BitStream!2228)

(assert (=> b!63228 (= e!41909 (= (_1!2949 lt!99396) (withMovedBitIndex!0 (_2!2949 lt!99396) (bvsub lt!99394 lt!99402))))))

(assert (=> b!63228 (or (= (bvand lt!99394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99402 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99394 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99394 lt!99402) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63228 (= lt!99402 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(assert (=> b!63228 (= lt!99394 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(declare-fun b!63229 () Bool)

(declare-fun lt!99397 () Unit!4281)

(assert (=> b!63229 (= e!41910 lt!99397)))

(declare-fun lt!99398 () (_ BitVec 64))

(assert (=> b!63229 (= lt!99398 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!99409 () (_ BitVec 64))

(assert (=> b!63229 (= lt!99409 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2801 array!2801 (_ BitVec 64) (_ BitVec 64)) Unit!4281)

(assert (=> b!63229 (= lt!99397 (arrayBitRangesEqSymmetric!0 (buf!1663 thiss!1379) (buf!1663 (_2!2948 lt!99113)) lt!99398 lt!99409))))

(assert (=> b!63229 (arrayBitRangesEq!0 (buf!1663 (_2!2948 lt!99113)) (buf!1663 thiss!1379) lt!99398 lt!99409)))

(declare-fun b!63230 () Bool)

(declare-fun res!52553 () Bool)

(assert (=> b!63230 (=> (not res!52553) (not e!41909))))

(assert (=> b!63230 (= res!52553 (isPrefixOf!0 (_1!2949 lt!99396) thiss!1379))))

(declare-fun b!63231 () Bool)

(declare-fun Unit!4303 () Unit!4281)

(assert (=> b!63231 (= e!41910 Unit!4303)))

(assert (= (and d!19638 c!4509) b!63229))

(assert (= (and d!19638 (not c!4509)) b!63231))

(assert (= (and d!19638 res!52554) b!63230))

(assert (= (and b!63230 res!52553) b!63227))

(assert (= (and b!63227 res!52555) b!63228))

(declare-fun m!100059 () Bool)

(assert (=> d!19638 m!100059))

(assert (=> d!19638 m!99805))

(declare-fun m!100061 () Bool)

(assert (=> d!19638 m!100061))

(declare-fun m!100063 () Bool)

(assert (=> d!19638 m!100063))

(assert (=> d!19638 m!99777))

(declare-fun m!100065 () Bool)

(assert (=> d!19638 m!100065))

(declare-fun m!100067 () Bool)

(assert (=> d!19638 m!100067))

(declare-fun m!100069 () Bool)

(assert (=> d!19638 m!100069))

(declare-fun m!100071 () Bool)

(assert (=> d!19638 m!100071))

(declare-fun m!100073 () Bool)

(assert (=> d!19638 m!100073))

(assert (=> d!19638 m!99779))

(declare-fun m!100075 () Bool)

(assert (=> b!63227 m!100075))

(declare-fun m!100077 () Bool)

(assert (=> b!63228 m!100077))

(assert (=> b!63228 m!99783))

(assert (=> b!63228 m!99781))

(declare-fun m!100079 () Bool)

(assert (=> b!63230 m!100079))

(assert (=> b!63229 m!99781))

(declare-fun m!100081 () Bool)

(assert (=> b!63229 m!100081))

(declare-fun m!100083 () Bool)

(assert (=> b!63229 m!100083))

(assert (=> b!63038 d!19638))

(declare-fun b!63379 () Bool)

(declare-fun res!52671 () Bool)

(declare-fun e!41977 () Bool)

(assert (=> b!63379 (=> (not res!52671) (not e!41977))))

(declare-fun lt!99981 () tuple2!5674)

(assert (=> b!63379 (= res!52671 (= (size!1282 (buf!1663 (_2!2948 lt!99981))) (size!1282 (buf!1663 (_2!2948 lt!99113)))))))

(declare-fun b!63380 () Bool)

(declare-fun res!52668 () Bool)

(assert (=> b!63380 (=> (not res!52668) (not e!41977))))

(assert (=> b!63380 (= res!52668 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99981)))))

(declare-fun b!63381 () Bool)

(declare-fun res!52673 () Bool)

(assert (=> b!63381 (=> (not res!52673) (not e!41977))))

(assert (=> b!63381 (= res!52673 (invariant!0 (currentBit!3300 (_2!2948 lt!99981)) (currentByte!3305 (_2!2948 lt!99981)) (size!1282 (buf!1663 (_2!2948 lt!99981)))))))

(declare-fun b!63382 () Bool)

(declare-fun e!41979 () Bool)

(declare-fun lt!99974 () (_ BitVec 64))

(assert (=> b!63382 (= e!41979 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99974))))

(declare-fun c!4527 () Bool)

(declare-fun call!808 () tuple2!5676)

(declare-fun lt!99979 () tuple2!5674)

(declare-fun bm!805 () Bool)

(declare-fun lt!99973 () tuple2!5674)

(assert (=> bm!805 (= call!808 (reader!0 (ite c!4527 (_2!2948 lt!99973) (_2!2948 lt!99113)) (ite c!4527 (_2!2948 lt!99979) (_2!2948 lt!99113))))))

(declare-fun b!63383 () Bool)

(declare-fun e!41978 () tuple2!5674)

(declare-fun Unit!4304 () Unit!4281)

(assert (=> b!63383 (= e!41978 (tuple2!5675 Unit!4304 (_2!2948 lt!99113)))))

(assert (=> b!63383 (= (size!1282 (buf!1663 (_2!2948 lt!99113))) (size!1282 (buf!1663 (_2!2948 lt!99113))))))

(declare-fun lt!99967 () Unit!4281)

(declare-fun Unit!4305 () Unit!4281)

(assert (=> b!63383 (= lt!99967 Unit!4305)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2228 array!2801 array!2801 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5694 0))(
  ( (tuple2!5695 (_1!2958 array!2801) (_2!2958 BitStream!2228)) )
))
(declare-fun readBits!0 (BitStream!2228 (_ BitVec 64)) tuple2!5694)

(assert (=> b!63383 (checkByteArrayBitContent!0 (_2!2948 lt!99113) srcBuffer!2 (_1!2958 (readBits!0 (_1!2949 call!808) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!19640 () Bool)

(assert (=> d!19640 e!41977))

(declare-fun res!52669 () Bool)

(assert (=> d!19640 (=> (not res!52669) (not e!41977))))

(declare-fun lt!99959 () (_ BitVec 64))

(assert (=> d!19640 (= res!52669 (= (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99981))) (currentByte!3305 (_2!2948 lt!99981)) (currentBit!3300 (_2!2948 lt!99981))) (bvsub lt!99959 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!19640 (or (= (bvand lt!99959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!99959 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!99959 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99983 () (_ BitVec 64))

(assert (=> d!19640 (= lt!99959 (bvadd lt!99983 to!314))))

(assert (=> d!19640 (or (not (= (bvand lt!99983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!99983 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!99983 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19640 (= lt!99983 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(assert (=> d!19640 (= lt!99981 e!41978)))

(assert (=> d!19640 (= c!4527 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!99985 () Unit!4281)

(declare-fun lt!99955 () Unit!4281)

(assert (=> d!19640 (= lt!99985 lt!99955)))

(assert (=> d!19640 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99113))))

(assert (=> d!19640 (= lt!99955 (lemmaIsPrefixRefl!0 (_2!2948 lt!99113)))))

(declare-fun lt!99982 () (_ BitVec 64))

(assert (=> d!19640 (= lt!99982 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(assert (=> d!19640 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19640 (= (appendBitsMSBFirstLoop!0 (_2!2948 lt!99113) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!99981)))

(declare-fun lt!99971 () tuple2!5676)

(declare-fun b!63384 () Bool)

(assert (=> b!63384 (= e!41977 (= (bitStreamReadBitsIntoList!0 (_2!2948 lt!99981) (_1!2949 lt!99971) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2948 lt!99981) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!63384 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63384 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!99948 () Unit!4281)

(declare-fun lt!99952 () Unit!4281)

(assert (=> b!63384 (= lt!99948 lt!99952)))

(assert (=> b!63384 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99981)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99974)))

(assert (=> b!63384 (= lt!99952 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99981)) lt!99974))))

(assert (=> b!63384 e!41979))

(declare-fun res!52670 () Bool)

(assert (=> b!63384 (=> (not res!52670) (not e!41979))))

(assert (=> b!63384 (= res!52670 (and (= (size!1282 (buf!1663 (_2!2948 lt!99113))) (size!1282 (buf!1663 (_2!2948 lt!99981)))) (bvsge lt!99974 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63384 (= lt!99974 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!63384 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63384 (= lt!99971 (reader!0 (_2!2948 lt!99113) (_2!2948 lt!99981)))))

(declare-fun b!63385 () Bool)

(declare-fun res!52672 () Bool)

(assert (=> b!63385 (=> (not res!52672) (not e!41977))))

(assert (=> b!63385 (= res!52672 (= (size!1282 (buf!1663 (_2!2948 lt!99113))) (size!1282 (buf!1663 (_2!2948 lt!99981)))))))

(declare-fun b!63386 () Bool)

(declare-fun Unit!4306 () Unit!4281)

(assert (=> b!63386 (= e!41978 (tuple2!5675 Unit!4306 (_2!2948 lt!99979)))))

(assert (=> b!63386 (= lt!99973 (appendBitFromByte!0 (_2!2948 lt!99113) (select (arr!1846 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!99950 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99950 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99969 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99969 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99963 () Unit!4281)

(assert (=> b!63386 (= lt!99963 (validateOffsetBitsIneqLemma!0 (_2!2948 lt!99113) (_2!2948 lt!99973) lt!99950 lt!99969))))

(assert (=> b!63386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99973)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99973))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99973))) (bvsub lt!99950 lt!99969))))

(declare-fun lt!99954 () Unit!4281)

(assert (=> b!63386 (= lt!99954 lt!99963)))

(declare-fun lt!99947 () tuple2!5676)

(assert (=> b!63386 (= lt!99947 (reader!0 (_2!2948 lt!99113) (_2!2948 lt!99973)))))

(declare-fun lt!99986 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99986 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99988 () Unit!4281)

(assert (=> b!63386 (= lt!99988 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99973)) lt!99986))))

(assert (=> b!63386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99973)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99986)))

(declare-fun lt!99965 () Unit!4281)

(assert (=> b!63386 (= lt!99965 lt!99988)))

(assert (=> b!63386 (= (head!508 (byteArrayBitContentToList!0 (_2!2948 lt!99973) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!508 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99973) (_1!2949 lt!99947) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99961 () Unit!4281)

(declare-fun Unit!4307 () Unit!4281)

(assert (=> b!63386 (= lt!99961 Unit!4307)))

(assert (=> b!63386 (= lt!99979 (appendBitsMSBFirstLoop!0 (_2!2948 lt!99973) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!99968 () Unit!4281)

(assert (=> b!63386 (= lt!99968 (lemmaIsPrefixTransitive!0 (_2!2948 lt!99113) (_2!2948 lt!99973) (_2!2948 lt!99979)))))

(assert (=> b!63386 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99979))))

(declare-fun lt!99972 () Unit!4281)

(assert (=> b!63386 (= lt!99972 lt!99968)))

(assert (=> b!63386 (= (size!1282 (buf!1663 (_2!2948 lt!99979))) (size!1282 (buf!1663 (_2!2948 lt!99113))))))

(declare-fun lt!99966 () Unit!4281)

(declare-fun Unit!4308 () Unit!4281)

(assert (=> b!63386 (= lt!99966 Unit!4308)))

(assert (=> b!63386 (= (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99979))) (currentByte!3305 (_2!2948 lt!99979)) (currentBit!3300 (_2!2948 lt!99979))) (bvsub (bvadd (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99980 () Unit!4281)

(declare-fun Unit!4309 () Unit!4281)

(assert (=> b!63386 (= lt!99980 Unit!4309)))

(assert (=> b!63386 (= (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99979))) (currentByte!3305 (_2!2948 lt!99979)) (currentBit!3300 (_2!2948 lt!99979))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99973))) (currentByte!3305 (_2!2948 lt!99973)) (currentBit!3300 (_2!2948 lt!99973))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99957 () Unit!4281)

(declare-fun Unit!4310 () Unit!4281)

(assert (=> b!63386 (= lt!99957 Unit!4310)))

(declare-fun lt!99951 () tuple2!5676)

(assert (=> b!63386 (= lt!99951 (reader!0 (_2!2948 lt!99113) (_2!2948 lt!99979)))))

(declare-fun lt!99976 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99976 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99978 () Unit!4281)

(assert (=> b!63386 (= lt!99978 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99979)) lt!99976))))

(assert (=> b!63386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99979)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99976)))

(declare-fun lt!99960 () Unit!4281)

(assert (=> b!63386 (= lt!99960 lt!99978)))

(declare-fun lt!99987 () tuple2!5676)

(assert (=> b!63386 (= lt!99987 call!808)))

(declare-fun lt!99956 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99956 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!99946 () Unit!4281)

(assert (=> b!63386 (= lt!99946 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99973) (buf!1663 (_2!2948 lt!99979)) lt!99956))))

(assert (=> b!63386 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99979)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99973))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99973))) lt!99956)))

(declare-fun lt!99949 () Unit!4281)

(assert (=> b!63386 (= lt!99949 lt!99946)))

(declare-fun lt!99962 () List!689)

(assert (=> b!63386 (= lt!99962 (byteArrayBitContentToList!0 (_2!2948 lt!99979) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99975 () List!689)

(assert (=> b!63386 (= lt!99975 (byteArrayBitContentToList!0 (_2!2948 lt!99979) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99953 () List!689)

(assert (=> b!63386 (= lt!99953 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99979) (_1!2949 lt!99951) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!99970 () List!689)

(assert (=> b!63386 (= lt!99970 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99979) (_1!2949 lt!99987) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!99964 () (_ BitVec 64))

(assert (=> b!63386 (= lt!99964 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!99958 () Unit!4281)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2228 BitStream!2228 BitStream!2228 BitStream!2228 (_ BitVec 64) List!689) Unit!4281)

(assert (=> b!63386 (= lt!99958 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2948 lt!99979) (_2!2948 lt!99979) (_1!2949 lt!99951) (_1!2949 lt!99987) lt!99964 lt!99953))))

(declare-fun tail!296 (List!689) List!689)

(assert (=> b!63386 (= (bitStreamReadBitsIntoList!0 (_2!2948 lt!99979) (_1!2949 lt!99987) (bvsub lt!99964 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!296 lt!99953))))

(declare-fun lt!99984 () Unit!4281)

(assert (=> b!63386 (= lt!99984 lt!99958)))

(declare-fun lt!99945 () Unit!4281)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2801 array!2801 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4281)

(assert (=> b!63386 (= lt!99945 (arrayBitRangesEqImpliesEq!0 (buf!1663 (_2!2948 lt!99973)) (buf!1663 (_2!2948 lt!99979)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!99982 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99973))) (currentByte!3305 (_2!2948 lt!99973)) (currentBit!3300 (_2!2948 lt!99973)))))))

(declare-fun bitAt!0 (array!2801 (_ BitVec 64)) Bool)

(assert (=> b!63386 (= (bitAt!0 (buf!1663 (_2!2948 lt!99973)) lt!99982) (bitAt!0 (buf!1663 (_2!2948 lt!99979)) lt!99982))))

(declare-fun lt!99977 () Unit!4281)

(assert (=> b!63386 (= lt!99977 lt!99945)))

(assert (= (and d!19640 c!4527) b!63386))

(assert (= (and d!19640 (not c!4527)) b!63383))

(assert (= (or b!63386 b!63383) bm!805))

(assert (= (and d!19640 res!52669) b!63381))

(assert (= (and b!63381 res!52673) b!63385))

(assert (= (and b!63385 res!52672) b!63380))

(assert (= (and b!63380 res!52668) b!63379))

(assert (= (and b!63379 res!52671) b!63384))

(assert (= (and b!63384 res!52670) b!63382))

(declare-fun m!100405 () Bool)

(assert (=> d!19640 m!100405))

(assert (=> d!19640 m!99783))

(assert (=> d!19640 m!100071))

(assert (=> d!19640 m!100065))

(declare-fun m!100407 () Bool)

(assert (=> b!63383 m!100407))

(declare-fun m!100409 () Bool)

(assert (=> b!63383 m!100409))

(declare-fun m!100411 () Bool)

(assert (=> b!63380 m!100411))

(declare-fun m!100413 () Bool)

(assert (=> b!63384 m!100413))

(declare-fun m!100415 () Bool)

(assert (=> b!63384 m!100415))

(declare-fun m!100417 () Bool)

(assert (=> b!63384 m!100417))

(declare-fun m!100419 () Bool)

(assert (=> b!63384 m!100419))

(declare-fun m!100421 () Bool)

(assert (=> b!63384 m!100421))

(declare-fun m!100423 () Bool)

(assert (=> b!63381 m!100423))

(declare-fun m!100425 () Bool)

(assert (=> b!63386 m!100425))

(declare-fun m!100427 () Bool)

(assert (=> b!63386 m!100427))

(declare-fun m!100429 () Bool)

(assert (=> b!63386 m!100429))

(declare-fun m!100431 () Bool)

(assert (=> b!63386 m!100431))

(declare-fun m!100433 () Bool)

(assert (=> b!63386 m!100433))

(declare-fun m!100435 () Bool)

(assert (=> b!63386 m!100435))

(declare-fun m!100437 () Bool)

(assert (=> b!63386 m!100437))

(declare-fun m!100439 () Bool)

(assert (=> b!63386 m!100439))

(declare-fun m!100441 () Bool)

(assert (=> b!63386 m!100441))

(declare-fun m!100443 () Bool)

(assert (=> b!63386 m!100443))

(declare-fun m!100445 () Bool)

(assert (=> b!63386 m!100445))

(declare-fun m!100447 () Bool)

(assert (=> b!63386 m!100447))

(declare-fun m!100449 () Bool)

(assert (=> b!63386 m!100449))

(declare-fun m!100451 () Bool)

(assert (=> b!63386 m!100451))

(declare-fun m!100453 () Bool)

(assert (=> b!63386 m!100453))

(declare-fun m!100455 () Bool)

(assert (=> b!63386 m!100455))

(declare-fun m!100457 () Bool)

(assert (=> b!63386 m!100457))

(declare-fun m!100459 () Bool)

(assert (=> b!63386 m!100459))

(assert (=> b!63386 m!99783))

(declare-fun m!100461 () Bool)

(assert (=> b!63386 m!100461))

(declare-fun m!100463 () Bool)

(assert (=> b!63386 m!100463))

(declare-fun m!100465 () Bool)

(assert (=> b!63386 m!100465))

(declare-fun m!100467 () Bool)

(assert (=> b!63386 m!100467))

(declare-fun m!100469 () Bool)

(assert (=> b!63386 m!100469))

(declare-fun m!100471 () Bool)

(assert (=> b!63386 m!100471))

(declare-fun m!100473 () Bool)

(assert (=> b!63386 m!100473))

(declare-fun m!100475 () Bool)

(assert (=> b!63386 m!100475))

(declare-fun m!100477 () Bool)

(assert (=> b!63386 m!100477))

(declare-fun m!100479 () Bool)

(assert (=> b!63386 m!100479))

(assert (=> b!63386 m!100453))

(declare-fun m!100481 () Bool)

(assert (=> b!63386 m!100481))

(assert (=> b!63386 m!100447))

(assert (=> b!63386 m!100459))

(declare-fun m!100483 () Bool)

(assert (=> b!63386 m!100483))

(assert (=> b!63386 m!100439))

(declare-fun m!100485 () Bool)

(assert (=> b!63386 m!100485))

(declare-fun m!100487 () Bool)

(assert (=> bm!805 m!100487))

(declare-fun m!100489 () Bool)

(assert (=> b!63382 m!100489))

(assert (=> b!63038 d!19640))

(declare-fun d!19692 () Bool)

(assert (=> d!19692 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!99991 () Unit!4281)

(declare-fun choose!9 (BitStream!2228 array!2801 (_ BitVec 64) BitStream!2228) Unit!4281)

(assert (=> d!19692 (= lt!99991 (choose!9 thiss!1379 (buf!1663 (_2!2948 lt!99113)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2229 (buf!1663 (_2!2948 lt!99113)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379))))))

(assert (=> d!19692 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1663 (_2!2948 lt!99113)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!99991)))

(declare-fun bs!4861 () Bool)

(assert (= bs!4861 d!19692))

(assert (=> bs!4861 m!99827))

(declare-fun m!100491 () Bool)

(assert (=> bs!4861 m!100491))

(assert (=> b!63038 d!19692))

(declare-fun d!19694 () Bool)

(declare-fun res!52676 () Bool)

(declare-fun e!41981 () Bool)

(assert (=> d!19694 (=> (not res!52676) (not e!41981))))

(assert (=> d!19694 (= res!52676 (= (size!1282 (buf!1663 thiss!1379)) (size!1282 (buf!1663 (_2!2948 lt!99116)))))))

(assert (=> d!19694 (= (isPrefixOf!0 thiss!1379 (_2!2948 lt!99116)) e!41981)))

(declare-fun b!63387 () Bool)

(declare-fun res!52675 () Bool)

(assert (=> b!63387 (=> (not res!52675) (not e!41981))))

(assert (=> b!63387 (= res!52675 (bvsle (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)) (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116)))))))

(declare-fun b!63388 () Bool)

(declare-fun e!41980 () Bool)

(assert (=> b!63388 (= e!41981 e!41980)))

(declare-fun res!52674 () Bool)

(assert (=> b!63388 (=> res!52674 e!41980)))

(assert (=> b!63388 (= res!52674 (= (size!1282 (buf!1663 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63389 () Bool)

(assert (=> b!63389 (= e!41980 (arrayBitRangesEq!0 (buf!1663 thiss!1379) (buf!1663 (_2!2948 lt!99116)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379))))))

(assert (= (and d!19694 res!52676) b!63387))

(assert (= (and b!63387 res!52675) b!63388))

(assert (= (and b!63388 (not res!52674)) b!63389))

(assert (=> b!63387 m!99781))

(assert (=> b!63387 m!99773))

(assert (=> b!63389 m!99781))

(assert (=> b!63389 m!99781))

(declare-fun m!100493 () Bool)

(assert (=> b!63389 m!100493))

(assert (=> b!63038 d!19694))

(declare-fun d!19696 () Bool)

(assert (=> d!19696 (isPrefixOf!0 thiss!1379 (_2!2948 lt!99116))))

(declare-fun lt!99994 () Unit!4281)

(declare-fun choose!30 (BitStream!2228 BitStream!2228 BitStream!2228) Unit!4281)

(assert (=> d!19696 (= lt!99994 (choose!30 thiss!1379 (_2!2948 lt!99113) (_2!2948 lt!99116)))))

(assert (=> d!19696 (isPrefixOf!0 thiss!1379 (_2!2948 lt!99113))))

(assert (=> d!19696 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2948 lt!99113) (_2!2948 lt!99116)) lt!99994)))

(declare-fun bs!4862 () Bool)

(assert (= bs!4862 d!19696))

(assert (=> bs!4862 m!99839))

(declare-fun m!100495 () Bool)

(assert (=> bs!4862 m!100495))

(assert (=> bs!4862 m!99805))

(assert (=> b!63038 d!19696))

(declare-fun d!19698 () Bool)

(declare-fun res!52679 () Bool)

(declare-fun e!41983 () Bool)

(assert (=> d!19698 (=> (not res!52679) (not e!41983))))

(assert (=> d!19698 (= res!52679 (= (size!1282 (buf!1663 (_2!2948 lt!99113))) (size!1282 (buf!1663 (_2!2948 lt!99116)))))))

(assert (=> d!19698 (= (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99116)) e!41983)))

(declare-fun b!63390 () Bool)

(declare-fun res!52678 () Bool)

(assert (=> b!63390 (=> (not res!52678) (not e!41983))))

(assert (=> b!63390 (= res!52678 (bvsle (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))) (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116)))))))

(declare-fun b!63391 () Bool)

(declare-fun e!41982 () Bool)

(assert (=> b!63391 (= e!41983 e!41982)))

(declare-fun res!52677 () Bool)

(assert (=> b!63391 (=> res!52677 e!41982)))

(assert (=> b!63391 (= res!52677 (= (size!1282 (buf!1663 (_2!2948 lt!99113))) #b00000000000000000000000000000000))))

(declare-fun b!63392 () Bool)

(assert (=> b!63392 (= e!41982 (arrayBitRangesEq!0 (buf!1663 (_2!2948 lt!99113)) (buf!1663 (_2!2948 lt!99116)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113)))))))

(assert (= (and d!19698 res!52679) b!63390))

(assert (= (and b!63390 res!52678) b!63391))

(assert (= (and b!63391 (not res!52677)) b!63392))

(assert (=> b!63390 m!99783))

(assert (=> b!63390 m!99773))

(assert (=> b!63392 m!99783))

(assert (=> b!63392 m!99783))

(declare-fun m!100497 () Bool)

(assert (=> b!63392 m!100497))

(assert (=> b!63038 d!19698))

(declare-fun d!19700 () Bool)

(assert (=> d!19700 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99113)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4863 () Bool)

(assert (= bs!4863 d!19700))

(declare-fun m!100499 () Bool)

(assert (=> bs!4863 m!100499))

(assert (=> b!63038 d!19700))

(declare-fun d!19702 () Bool)

(declare-fun e!41984 () Bool)

(assert (=> d!19702 e!41984))

(declare-fun res!52681 () Bool)

(assert (=> d!19702 (=> (not res!52681) (not e!41984))))

(declare-fun lt!99998 () (_ BitVec 64))

(declare-fun lt!100000 () (_ BitVec 64))

(declare-fun lt!99999 () (_ BitVec 64))

(assert (=> d!19702 (= res!52681 (= lt!99998 (bvsub lt!100000 lt!99999)))))

(assert (=> d!19702 (or (= (bvand lt!100000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!99999 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100000 lt!99999) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19702 (= lt!99999 (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99116))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99116)))))))

(declare-fun lt!99995 () (_ BitVec 64))

(declare-fun lt!99997 () (_ BitVec 64))

(assert (=> d!19702 (= lt!100000 (bvmul lt!99995 lt!99997))))

(assert (=> d!19702 (or (= lt!99995 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!99997 (bvsdiv (bvmul lt!99995 lt!99997) lt!99995)))))

(assert (=> d!19702 (= lt!99997 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19702 (= lt!99995 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))))))

(assert (=> d!19702 (= lt!99998 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99116))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99116)))))))

(assert (=> d!19702 (invariant!0 (currentBit!3300 (_2!2948 lt!99116)) (currentByte!3305 (_2!2948 lt!99116)) (size!1282 (buf!1663 (_2!2948 lt!99116))))))

(assert (=> d!19702 (= (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116))) lt!99998)))

(declare-fun b!63393 () Bool)

(declare-fun res!52680 () Bool)

(assert (=> b!63393 (=> (not res!52680) (not e!41984))))

(assert (=> b!63393 (= res!52680 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!99998))))

(declare-fun b!63394 () Bool)

(declare-fun lt!99996 () (_ BitVec 64))

(assert (=> b!63394 (= e!41984 (bvsle lt!99998 (bvmul lt!99996 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63394 (or (= lt!99996 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!99996 #b0000000000000000000000000000000000000000000000000000000000001000) lt!99996)))))

(assert (=> b!63394 (= lt!99996 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))))))

(assert (= (and d!19702 res!52681) b!63393))

(assert (= (and b!63393 res!52680) b!63394))

(declare-fun m!100501 () Bool)

(assert (=> d!19702 m!100501))

(assert (=> d!19702 m!99769))

(assert (=> b!63037 d!19702))

(declare-fun d!19704 () Bool)

(assert (=> d!19704 (= (head!508 (byteArrayBitContentToList!0 (_2!2948 lt!99113) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!804 (byteArrayBitContentToList!0 (_2!2948 lt!99113) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63047 d!19704))

(declare-fun d!19706 () Bool)

(declare-fun c!4530 () Bool)

(assert (=> d!19706 (= c!4530 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41987 () List!689)

(assert (=> d!19706 (= (byteArrayBitContentToList!0 (_2!2948 lt!99113) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!41987)))

(declare-fun b!63399 () Bool)

(assert (=> b!63399 (= e!41987 Nil!686)))

(declare-fun b!63400 () Bool)

(assert (=> b!63400 (= e!41987 (Cons!685 (not (= (bvand ((_ sign_extend 24) (select (arr!1846 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2948 lt!99113) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!19706 c!4530) b!63399))

(assert (= (and d!19706 (not c!4530)) b!63400))

(assert (=> b!63400 m!99803))

(declare-fun m!100503 () Bool)

(assert (=> b!63400 m!100503))

(declare-fun m!100505 () Bool)

(assert (=> b!63400 m!100505))

(assert (=> b!63047 d!19706))

(declare-fun d!19708 () Bool)

(assert (=> d!19708 (= (head!508 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99113) (_1!2949 lt!99124) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!804 (bitStreamReadBitsIntoList!0 (_2!2948 lt!99113) (_1!2949 lt!99124) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!63047 d!19708))

(declare-fun b!63411 () Bool)

(declare-fun e!41992 () Bool)

(declare-fun lt!100009 () List!689)

(declare-fun isEmpty!194 (List!689) Bool)

(assert (=> b!63411 (= e!41992 (isEmpty!194 lt!100009))))

(declare-fun d!19710 () Bool)

(assert (=> d!19710 e!41992))

(declare-fun c!4535 () Bool)

(assert (=> d!19710 (= c!4535 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5696 0))(
  ( (tuple2!5697 (_1!2959 List!689) (_2!2959 BitStream!2228)) )
))
(declare-fun e!41993 () tuple2!5696)

(assert (=> d!19710 (= lt!100009 (_1!2959 e!41993))))

(declare-fun c!4536 () Bool)

(assert (=> d!19710 (= c!4536 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19710 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19710 (= (bitStreamReadBitsIntoList!0 (_2!2948 lt!99113) (_1!2949 lt!99124) #b0000000000000000000000000000000000000000000000000000000000000001) lt!100009)))

(declare-fun b!63412 () Bool)

(assert (=> b!63412 (= e!41992 (> (length!317 lt!100009) 0))))

(declare-fun b!63409 () Bool)

(assert (=> b!63409 (= e!41993 (tuple2!5697 Nil!686 (_1!2949 lt!99124)))))

(declare-fun lt!100007 () (_ BitVec 64))

(declare-datatypes ((tuple2!5698 0))(
  ( (tuple2!5699 (_1!2960 Bool) (_2!2960 BitStream!2228)) )
))
(declare-fun lt!100008 () tuple2!5698)

(declare-fun b!63410 () Bool)

(assert (=> b!63410 (= e!41993 (tuple2!5697 (Cons!685 (_1!2960 lt!100008) (bitStreamReadBitsIntoList!0 (_2!2948 lt!99113) (_2!2960 lt!100008) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!100007))) (_2!2960 lt!100008)))))

(declare-fun readBit!0 (BitStream!2228) tuple2!5698)

(assert (=> b!63410 (= lt!100008 (readBit!0 (_1!2949 lt!99124)))))

(assert (=> b!63410 (= lt!100007 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19710 c!4536) b!63409))

(assert (= (and d!19710 (not c!4536)) b!63410))

(assert (= (and d!19710 c!4535) b!63411))

(assert (= (and d!19710 (not c!4535)) b!63412))

(declare-fun m!100507 () Bool)

(assert (=> b!63411 m!100507))

(declare-fun m!100509 () Bool)

(assert (=> b!63412 m!100509))

(declare-fun m!100511 () Bool)

(assert (=> b!63410 m!100511))

(declare-fun m!100513 () Bool)

(assert (=> b!63410 m!100513))

(assert (=> b!63047 d!19710))

(declare-fun d!19712 () Bool)

(declare-fun res!52684 () Bool)

(declare-fun e!41995 () Bool)

(assert (=> d!19712 (=> (not res!52684) (not e!41995))))

(assert (=> d!19712 (= res!52684 (= (size!1282 (buf!1663 thiss!1379)) (size!1282 (buf!1663 thiss!1379))))))

(assert (=> d!19712 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!41995)))

(declare-fun b!63413 () Bool)

(declare-fun res!52683 () Bool)

(assert (=> b!63413 (=> (not res!52683) (not e!41995))))

(assert (=> b!63413 (= res!52683 (bvsle (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)) (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379))))))

(declare-fun b!63414 () Bool)

(declare-fun e!41994 () Bool)

(assert (=> b!63414 (= e!41995 e!41994)))

(declare-fun res!52682 () Bool)

(assert (=> b!63414 (=> res!52682 e!41994)))

(assert (=> b!63414 (= res!52682 (= (size!1282 (buf!1663 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!63415 () Bool)

(assert (=> b!63415 (= e!41994 (arrayBitRangesEq!0 (buf!1663 thiss!1379) (buf!1663 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379))))))

(assert (= (and d!19712 res!52684) b!63413))

(assert (= (and b!63413 res!52683) b!63414))

(assert (= (and b!63414 (not res!52682)) b!63415))

(assert (=> b!63413 m!99781))

(assert (=> b!63413 m!99781))

(assert (=> b!63415 m!99781))

(assert (=> b!63415 m!99781))

(declare-fun m!100515 () Bool)

(assert (=> b!63415 m!100515))

(assert (=> b!63040 d!19712))

(declare-fun d!19714 () Bool)

(assert (=> d!19714 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!100012 () Unit!4281)

(declare-fun choose!11 (BitStream!2228) Unit!4281)

(assert (=> d!19714 (= lt!100012 (choose!11 thiss!1379))))

(assert (=> d!19714 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!100012)))

(declare-fun bs!4865 () Bool)

(assert (= bs!4865 d!19714))

(assert (=> bs!4865 m!99777))

(declare-fun m!100517 () Bool)

(assert (=> bs!4865 m!100517))

(assert (=> b!63040 d!19714))

(declare-fun d!19716 () Bool)

(declare-fun e!41996 () Bool)

(assert (=> d!19716 e!41996))

(declare-fun res!52686 () Bool)

(assert (=> d!19716 (=> (not res!52686) (not e!41996))))

(declare-fun lt!100016 () (_ BitVec 64))

(declare-fun lt!100018 () (_ BitVec 64))

(declare-fun lt!100017 () (_ BitVec 64))

(assert (=> d!19716 (= res!52686 (= lt!100016 (bvsub lt!100018 lt!100017)))))

(assert (=> d!19716 (or (= (bvand lt!100018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100017 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100018 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100018 lt!100017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!19716 (= lt!100017 (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379))))))

(declare-fun lt!100013 () (_ BitVec 64))

(declare-fun lt!100015 () (_ BitVec 64))

(assert (=> d!19716 (= lt!100018 (bvmul lt!100013 lt!100015))))

(assert (=> d!19716 (or (= lt!100013 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!100015 (bvsdiv (bvmul lt!100013 lt!100015) lt!100013)))))

(assert (=> d!19716 (= lt!100015 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!19716 (= lt!100013 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))))))

(assert (=> d!19716 (= lt!100016 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3305 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3300 thiss!1379))))))

(assert (=> d!19716 (invariant!0 (currentBit!3300 thiss!1379) (currentByte!3305 thiss!1379) (size!1282 (buf!1663 thiss!1379)))))

(assert (=> d!19716 (= (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)) lt!100016)))

(declare-fun b!63416 () Bool)

(declare-fun res!52685 () Bool)

(assert (=> b!63416 (=> (not res!52685) (not e!41996))))

(assert (=> b!63416 (= res!52685 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!100016))))

(declare-fun b!63417 () Bool)

(declare-fun lt!100014 () (_ BitVec 64))

(assert (=> b!63417 (= e!41996 (bvsle lt!100016 (bvmul lt!100014 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!63417 (or (= lt!100014 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!100014 #b0000000000000000000000000000000000000000000000000000000000001000) lt!100014)))))

(assert (=> b!63417 (= lt!100014 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))))))

(assert (= (and d!19716 res!52686) b!63416))

(assert (= (and b!63416 res!52685) b!63417))

(declare-fun m!100519 () Bool)

(assert (=> d!19716 m!100519))

(assert (=> d!19716 m!100053))

(assert (=> b!63040 d!19716))

(declare-fun d!19718 () Bool)

(assert (=> d!19718 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 thiss!1379))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4866 () Bool)

(assert (= bs!4866 d!19718))

(assert (=> bs!4866 m!100519))

(assert (=> b!63039 d!19718))

(declare-fun b!63420 () Bool)

(declare-fun e!41997 () Bool)

(declare-fun lt!100021 () List!689)

(assert (=> b!63420 (= e!41997 (isEmpty!194 lt!100021))))

(declare-fun d!19720 () Bool)

(assert (=> d!19720 e!41997))

(declare-fun c!4537 () Bool)

(assert (=> d!19720 (= c!4537 (= lt!99122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!41998 () tuple2!5696)

(assert (=> d!19720 (= lt!100021 (_1!2959 e!41998))))

(declare-fun c!4538 () Bool)

(assert (=> d!19720 (= c!4538 (= lt!99122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19720 (bvsge lt!99122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19720 (= (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_1!2949 lt!99119) lt!99122) lt!100021)))

(declare-fun b!63421 () Bool)

(assert (=> b!63421 (= e!41997 (> (length!317 lt!100021) 0))))

(declare-fun b!63418 () Bool)

(assert (=> b!63418 (= e!41998 (tuple2!5697 Nil!686 (_1!2949 lt!99119)))))

(declare-fun lt!100020 () tuple2!5698)

(declare-fun b!63419 () Bool)

(declare-fun lt!100019 () (_ BitVec 64))

(assert (=> b!63419 (= e!41998 (tuple2!5697 (Cons!685 (_1!2960 lt!100020) (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_2!2960 lt!100020) (bvsub lt!99122 lt!100019))) (_2!2960 lt!100020)))))

(assert (=> b!63419 (= lt!100020 (readBit!0 (_1!2949 lt!99119)))))

(assert (=> b!63419 (= lt!100019 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19720 c!4538) b!63418))

(assert (= (and d!19720 (not c!4538)) b!63419))

(assert (= (and d!19720 c!4537) b!63420))

(assert (= (and d!19720 (not c!4537)) b!63421))

(declare-fun m!100521 () Bool)

(assert (=> b!63420 m!100521))

(declare-fun m!100523 () Bool)

(assert (=> b!63421 m!100523))

(declare-fun m!100525 () Bool)

(assert (=> b!63419 m!100525))

(declare-fun m!100527 () Bool)

(assert (=> b!63419 m!100527))

(assert (=> b!63044 d!19720))

(declare-fun d!19722 () Bool)

(assert (=> d!19722 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99122)))

(declare-fun lt!100022 () Unit!4281)

(assert (=> d!19722 (= lt!100022 (choose!9 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99116)) lt!99122 (BitStream!2229 (buf!1663 (_2!2948 lt!99116)) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113)))))))

(assert (=> d!19722 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2948 lt!99113) (buf!1663 (_2!2948 lt!99116)) lt!99122) lt!100022)))

(declare-fun bs!4867 () Bool)

(assert (= bs!4867 d!19722))

(assert (=> bs!4867 m!99799))

(declare-fun m!100529 () Bool)

(assert (=> bs!4867 m!100529))

(assert (=> b!63044 d!19722))

(declare-fun d!19724 () Bool)

(assert (=> d!19724 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4868 () Bool)

(assert (= bs!4868 d!19724))

(declare-fun m!100531 () Bool)

(assert (=> bs!4868 m!100531))

(assert (=> b!63044 d!19724))

(declare-fun d!19726 () Bool)

(assert (=> d!19726 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113))) lt!99122) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 (_2!2948 lt!99113))) ((_ sign_extend 32) (currentBit!3300 (_2!2948 lt!99113)))) lt!99122))))

(declare-fun bs!4869 () Bool)

(assert (= bs!4869 d!19726))

(declare-fun m!100533 () Bool)

(assert (=> bs!4869 m!100533))

(assert (=> b!63044 d!19726))

(declare-fun d!19728 () Bool)

(declare-fun e!41999 () Bool)

(assert (=> d!19728 e!41999))

(declare-fun res!52688 () Bool)

(assert (=> d!19728 (=> (not res!52688) (not e!41999))))

(declare-fun lt!100029 () tuple2!5676)

(assert (=> d!19728 (= res!52688 (isPrefixOf!0 (_1!2949 lt!100029) (_2!2949 lt!100029)))))

(declare-fun lt!100040 () BitStream!2228)

(assert (=> d!19728 (= lt!100029 (tuple2!5677 lt!100040 (_2!2948 lt!99116)))))

(declare-fun lt!100026 () Unit!4281)

(declare-fun lt!100033 () Unit!4281)

(assert (=> d!19728 (= lt!100026 lt!100033)))

(assert (=> d!19728 (isPrefixOf!0 lt!100040 (_2!2948 lt!99116))))

(assert (=> d!19728 (= lt!100033 (lemmaIsPrefixTransitive!0 lt!100040 (_2!2948 lt!99116) (_2!2948 lt!99116)))))

(declare-fun lt!100028 () Unit!4281)

(declare-fun lt!100036 () Unit!4281)

(assert (=> d!19728 (= lt!100028 lt!100036)))

(assert (=> d!19728 (isPrefixOf!0 lt!100040 (_2!2948 lt!99116))))

(assert (=> d!19728 (= lt!100036 (lemmaIsPrefixTransitive!0 lt!100040 thiss!1379 (_2!2948 lt!99116)))))

(declare-fun lt!100025 () Unit!4281)

(declare-fun e!42000 () Unit!4281)

(assert (=> d!19728 (= lt!100025 e!42000)))

(declare-fun c!4539 () Bool)

(assert (=> d!19728 (= c!4539 (not (= (size!1282 (buf!1663 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!100032 () Unit!4281)

(declare-fun lt!100023 () Unit!4281)

(assert (=> d!19728 (= lt!100032 lt!100023)))

(assert (=> d!19728 (isPrefixOf!0 (_2!2948 lt!99116) (_2!2948 lt!99116))))

(assert (=> d!19728 (= lt!100023 (lemmaIsPrefixRefl!0 (_2!2948 lt!99116)))))

(declare-fun lt!100034 () Unit!4281)

(declare-fun lt!100041 () Unit!4281)

(assert (=> d!19728 (= lt!100034 lt!100041)))

(assert (=> d!19728 (= lt!100041 (lemmaIsPrefixRefl!0 (_2!2948 lt!99116)))))

(declare-fun lt!100039 () Unit!4281)

(declare-fun lt!100037 () Unit!4281)

(assert (=> d!19728 (= lt!100039 lt!100037)))

(assert (=> d!19728 (isPrefixOf!0 lt!100040 lt!100040)))

(assert (=> d!19728 (= lt!100037 (lemmaIsPrefixRefl!0 lt!100040))))

(declare-fun lt!100038 () Unit!4281)

(declare-fun lt!100024 () Unit!4281)

(assert (=> d!19728 (= lt!100038 lt!100024)))

(assert (=> d!19728 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!19728 (= lt!100024 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!19728 (= lt!100040 (BitStream!2229 (buf!1663 (_2!2948 lt!99116)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(assert (=> d!19728 (isPrefixOf!0 thiss!1379 (_2!2948 lt!99116))))

(assert (=> d!19728 (= (reader!0 thiss!1379 (_2!2948 lt!99116)) lt!100029)))

(declare-fun b!63422 () Bool)

(declare-fun res!52689 () Bool)

(assert (=> b!63422 (=> (not res!52689) (not e!41999))))

(assert (=> b!63422 (= res!52689 (isPrefixOf!0 (_2!2949 lt!100029) (_2!2948 lt!99116)))))

(declare-fun lt!100027 () (_ BitVec 64))

(declare-fun b!63423 () Bool)

(declare-fun lt!100035 () (_ BitVec 64))

(assert (=> b!63423 (= e!41999 (= (_1!2949 lt!100029) (withMovedBitIndex!0 (_2!2949 lt!100029) (bvsub lt!100027 lt!100035))))))

(assert (=> b!63423 (or (= (bvand lt!100027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100035 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100027 lt!100035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63423 (= lt!100035 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116))))))

(assert (=> b!63423 (= lt!100027 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(declare-fun b!63424 () Bool)

(declare-fun lt!100030 () Unit!4281)

(assert (=> b!63424 (= e!42000 lt!100030)))

(declare-fun lt!100031 () (_ BitVec 64))

(assert (=> b!63424 (= lt!100031 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100042 () (_ BitVec 64))

(assert (=> b!63424 (= lt!100042 (bitIndex!0 (size!1282 (buf!1663 thiss!1379)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379)))))

(assert (=> b!63424 (= lt!100030 (arrayBitRangesEqSymmetric!0 (buf!1663 thiss!1379) (buf!1663 (_2!2948 lt!99116)) lt!100031 lt!100042))))

(assert (=> b!63424 (arrayBitRangesEq!0 (buf!1663 (_2!2948 lt!99116)) (buf!1663 thiss!1379) lt!100031 lt!100042)))

(declare-fun b!63425 () Bool)

(declare-fun res!52687 () Bool)

(assert (=> b!63425 (=> (not res!52687) (not e!41999))))

(assert (=> b!63425 (= res!52687 (isPrefixOf!0 (_1!2949 lt!100029) thiss!1379))))

(declare-fun b!63426 () Bool)

(declare-fun Unit!4311 () Unit!4281)

(assert (=> b!63426 (= e!42000 Unit!4311)))

(assert (= (and d!19728 c!4539) b!63424))

(assert (= (and d!19728 (not c!4539)) b!63426))

(assert (= (and d!19728 res!52688) b!63425))

(assert (= (and b!63425 res!52687) b!63422))

(assert (= (and b!63422 res!52689) b!63423))

(declare-fun m!100535 () Bool)

(assert (=> d!19728 m!100535))

(assert (=> d!19728 m!99839))

(declare-fun m!100537 () Bool)

(assert (=> d!19728 m!100537))

(declare-fun m!100539 () Bool)

(assert (=> d!19728 m!100539))

(assert (=> d!19728 m!99777))

(declare-fun m!100541 () Bool)

(assert (=> d!19728 m!100541))

(declare-fun m!100543 () Bool)

(assert (=> d!19728 m!100543))

(declare-fun m!100545 () Bool)

(assert (=> d!19728 m!100545))

(declare-fun m!100547 () Bool)

(assert (=> d!19728 m!100547))

(declare-fun m!100549 () Bool)

(assert (=> d!19728 m!100549))

(assert (=> d!19728 m!99779))

(declare-fun m!100551 () Bool)

(assert (=> b!63422 m!100551))

(declare-fun m!100553 () Bool)

(assert (=> b!63423 m!100553))

(assert (=> b!63423 m!99773))

(assert (=> b!63423 m!99781))

(declare-fun m!100555 () Bool)

(assert (=> b!63425 m!100555))

(assert (=> b!63424 m!99781))

(declare-fun m!100557 () Bool)

(assert (=> b!63424 m!100557))

(declare-fun m!100559 () Bool)

(assert (=> b!63424 m!100559))

(assert (=> b!63044 d!19728))

(declare-fun d!19730 () Bool)

(declare-fun e!42001 () Bool)

(assert (=> d!19730 e!42001))

(declare-fun res!52691 () Bool)

(assert (=> d!19730 (=> (not res!52691) (not e!42001))))

(declare-fun lt!100049 () tuple2!5676)

(assert (=> d!19730 (= res!52691 (isPrefixOf!0 (_1!2949 lt!100049) (_2!2949 lt!100049)))))

(declare-fun lt!100060 () BitStream!2228)

(assert (=> d!19730 (= lt!100049 (tuple2!5677 lt!100060 (_2!2948 lt!99116)))))

(declare-fun lt!100046 () Unit!4281)

(declare-fun lt!100053 () Unit!4281)

(assert (=> d!19730 (= lt!100046 lt!100053)))

(assert (=> d!19730 (isPrefixOf!0 lt!100060 (_2!2948 lt!99116))))

(assert (=> d!19730 (= lt!100053 (lemmaIsPrefixTransitive!0 lt!100060 (_2!2948 lt!99116) (_2!2948 lt!99116)))))

(declare-fun lt!100048 () Unit!4281)

(declare-fun lt!100056 () Unit!4281)

(assert (=> d!19730 (= lt!100048 lt!100056)))

(assert (=> d!19730 (isPrefixOf!0 lt!100060 (_2!2948 lt!99116))))

(assert (=> d!19730 (= lt!100056 (lemmaIsPrefixTransitive!0 lt!100060 (_2!2948 lt!99113) (_2!2948 lt!99116)))))

(declare-fun lt!100045 () Unit!4281)

(declare-fun e!42002 () Unit!4281)

(assert (=> d!19730 (= lt!100045 e!42002)))

(declare-fun c!4540 () Bool)

(assert (=> d!19730 (= c!4540 (not (= (size!1282 (buf!1663 (_2!2948 lt!99113))) #b00000000000000000000000000000000)))))

(declare-fun lt!100052 () Unit!4281)

(declare-fun lt!100043 () Unit!4281)

(assert (=> d!19730 (= lt!100052 lt!100043)))

(assert (=> d!19730 (isPrefixOf!0 (_2!2948 lt!99116) (_2!2948 lt!99116))))

(assert (=> d!19730 (= lt!100043 (lemmaIsPrefixRefl!0 (_2!2948 lt!99116)))))

(declare-fun lt!100054 () Unit!4281)

(declare-fun lt!100061 () Unit!4281)

(assert (=> d!19730 (= lt!100054 lt!100061)))

(assert (=> d!19730 (= lt!100061 (lemmaIsPrefixRefl!0 (_2!2948 lt!99116)))))

(declare-fun lt!100059 () Unit!4281)

(declare-fun lt!100057 () Unit!4281)

(assert (=> d!19730 (= lt!100059 lt!100057)))

(assert (=> d!19730 (isPrefixOf!0 lt!100060 lt!100060)))

(assert (=> d!19730 (= lt!100057 (lemmaIsPrefixRefl!0 lt!100060))))

(declare-fun lt!100058 () Unit!4281)

(declare-fun lt!100044 () Unit!4281)

(assert (=> d!19730 (= lt!100058 lt!100044)))

(assert (=> d!19730 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99113))))

(assert (=> d!19730 (= lt!100044 (lemmaIsPrefixRefl!0 (_2!2948 lt!99113)))))

(assert (=> d!19730 (= lt!100060 (BitStream!2229 (buf!1663 (_2!2948 lt!99116)) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(assert (=> d!19730 (isPrefixOf!0 (_2!2948 lt!99113) (_2!2948 lt!99116))))

(assert (=> d!19730 (= (reader!0 (_2!2948 lt!99113) (_2!2948 lt!99116)) lt!100049)))

(declare-fun b!63427 () Bool)

(declare-fun res!52692 () Bool)

(assert (=> b!63427 (=> (not res!52692) (not e!42001))))

(assert (=> b!63427 (= res!52692 (isPrefixOf!0 (_2!2949 lt!100049) (_2!2948 lt!99116)))))

(declare-fun lt!100047 () (_ BitVec 64))

(declare-fun lt!100055 () (_ BitVec 64))

(declare-fun b!63428 () Bool)

(assert (=> b!63428 (= e!42001 (= (_1!2949 lt!100049) (withMovedBitIndex!0 (_2!2949 lt!100049) (bvsub lt!100047 lt!100055))))))

(assert (=> b!63428 (or (= (bvand lt!100047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!100055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!100047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!100047 lt!100055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!63428 (= lt!100055 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99116))) (currentByte!3305 (_2!2948 lt!99116)) (currentBit!3300 (_2!2948 lt!99116))))))

(assert (=> b!63428 (= lt!100047 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(declare-fun b!63429 () Bool)

(declare-fun lt!100050 () Unit!4281)

(assert (=> b!63429 (= e!42002 lt!100050)))

(declare-fun lt!100051 () (_ BitVec 64))

(assert (=> b!63429 (= lt!100051 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!100062 () (_ BitVec 64))

(assert (=> b!63429 (= lt!100062 (bitIndex!0 (size!1282 (buf!1663 (_2!2948 lt!99113))) (currentByte!3305 (_2!2948 lt!99113)) (currentBit!3300 (_2!2948 lt!99113))))))

(assert (=> b!63429 (= lt!100050 (arrayBitRangesEqSymmetric!0 (buf!1663 (_2!2948 lt!99113)) (buf!1663 (_2!2948 lt!99116)) lt!100051 lt!100062))))

(assert (=> b!63429 (arrayBitRangesEq!0 (buf!1663 (_2!2948 lt!99116)) (buf!1663 (_2!2948 lt!99113)) lt!100051 lt!100062)))

(declare-fun b!63430 () Bool)

(declare-fun res!52690 () Bool)

(assert (=> b!63430 (=> (not res!52690) (not e!42001))))

(assert (=> b!63430 (= res!52690 (isPrefixOf!0 (_1!2949 lt!100049) (_2!2948 lt!99113)))))

(declare-fun b!63431 () Bool)

(declare-fun Unit!4312 () Unit!4281)

(assert (=> b!63431 (= e!42002 Unit!4312)))

(assert (= (and d!19730 c!4540) b!63429))

(assert (= (and d!19730 (not c!4540)) b!63431))

(assert (= (and d!19730 res!52691) b!63430))

(assert (= (and b!63430 res!52690) b!63427))

(assert (= (and b!63427 res!52692) b!63428))

(declare-fun m!100561 () Bool)

(assert (=> d!19730 m!100561))

(assert (=> d!19730 m!99835))

(declare-fun m!100563 () Bool)

(assert (=> d!19730 m!100563))

(declare-fun m!100565 () Bool)

(assert (=> d!19730 m!100565))

(assert (=> d!19730 m!100071))

(assert (=> d!19730 m!100541))

(declare-fun m!100567 () Bool)

(assert (=> d!19730 m!100567))

(declare-fun m!100569 () Bool)

(assert (=> d!19730 m!100569))

(assert (=> d!19730 m!100547))

(declare-fun m!100571 () Bool)

(assert (=> d!19730 m!100571))

(assert (=> d!19730 m!100065))

(declare-fun m!100573 () Bool)

(assert (=> b!63427 m!100573))

(declare-fun m!100575 () Bool)

(assert (=> b!63428 m!100575))

(assert (=> b!63428 m!99773))

(assert (=> b!63428 m!99783))

(declare-fun m!100577 () Bool)

(assert (=> b!63430 m!100577))

(assert (=> b!63429 m!99783))

(declare-fun m!100579 () Bool)

(assert (=> b!63429 m!100579))

(declare-fun m!100581 () Bool)

(assert (=> b!63429 m!100581))

(assert (=> b!63044 d!19730))

(declare-fun d!19732 () Bool)

(assert (=> d!19732 (validate_offset_bits!1 ((_ sign_extend 32) (size!1282 (buf!1663 (_2!2948 lt!99116)))) ((_ sign_extend 32) (currentByte!3305 thiss!1379)) ((_ sign_extend 32) (currentBit!3300 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!100063 () Unit!4281)

(assert (=> d!19732 (= lt!100063 (choose!9 thiss!1379 (buf!1663 (_2!2948 lt!99116)) (bvsub to!314 i!635) (BitStream!2229 (buf!1663 (_2!2948 lt!99116)) (currentByte!3305 thiss!1379) (currentBit!3300 thiss!1379))))))

(assert (=> d!19732 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1663 (_2!2948 lt!99116)) (bvsub to!314 i!635)) lt!100063)))

(declare-fun bs!4870 () Bool)

(assert (= bs!4870 d!19732))

(assert (=> bs!4870 m!99787))

(declare-fun m!100583 () Bool)

(assert (=> bs!4870 m!100583))

(assert (=> b!63044 d!19732))

(declare-fun b!63434 () Bool)

(declare-fun e!42003 () Bool)

(declare-fun lt!100066 () List!689)

(assert (=> b!63434 (= e!42003 (isEmpty!194 lt!100066))))

(declare-fun d!19734 () Bool)

(assert (=> d!19734 e!42003))

(declare-fun c!4541 () Bool)

(assert (=> d!19734 (= c!4541 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42004 () tuple2!5696)

(assert (=> d!19734 (= lt!100066 (_1!2959 e!42004))))

(declare-fun c!4542 () Bool)

(assert (=> d!19734 (= c!4542 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!19734 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!19734 (= (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_1!2949 lt!99115) (bvsub to!314 i!635)) lt!100066)))

(declare-fun b!63435 () Bool)

(assert (=> b!63435 (= e!42003 (> (length!317 lt!100066) 0))))

(declare-fun b!63432 () Bool)

(assert (=> b!63432 (= e!42004 (tuple2!5697 Nil!686 (_1!2949 lt!99115)))))

(declare-fun lt!100065 () tuple2!5698)

(declare-fun b!63433 () Bool)

(declare-fun lt!100064 () (_ BitVec 64))

(assert (=> b!63433 (= e!42004 (tuple2!5697 (Cons!685 (_1!2960 lt!100065) (bitStreamReadBitsIntoList!0 (_2!2948 lt!99116) (_2!2960 lt!100065) (bvsub (bvsub to!314 i!635) lt!100064))) (_2!2960 lt!100065)))))

(assert (=> b!63433 (= lt!100065 (readBit!0 (_1!2949 lt!99115)))))

(assert (=> b!63433 (= lt!100064 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!19734 c!4542) b!63432))

(assert (= (and d!19734 (not c!4542)) b!63433))

(assert (= (and d!19734 c!4541) b!63434))

(assert (= (and d!19734 (not c!4541)) b!63435))

(declare-fun m!100585 () Bool)

(assert (=> b!63434 m!100585))

(declare-fun m!100587 () Bool)

(assert (=> b!63435 m!100587))

(declare-fun m!100589 () Bool)

(assert (=> b!63433 m!100589))

(declare-fun m!100591 () Bool)

