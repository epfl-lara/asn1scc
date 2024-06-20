; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7770 () Bool)

(assert start!7770)

(declare-fun b!38046 () Bool)

(declare-fun res!32340 () Bool)

(declare-fun e!25031 () Bool)

(assert (=> b!38046 (=> res!32340 e!25031)))

(declare-datatypes ((array!1950 0))(
  ( (array!1951 (arr!1369 (Array (_ BitVec 32) (_ BitVec 8))) (size!876 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1508 0))(
  ( (BitStream!1509 (buf!1204 array!1950) (currentByte!2610 (_ BitVec 32)) (currentBit!2605 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2749 0))(
  ( (Unit!2750) )
))
(declare-datatypes ((tuple2!3700 0))(
  ( (tuple2!3701 (_1!1937 Unit!2749) (_2!1937 BitStream!1508)) )
))
(declare-fun lt!57672 () tuple2!3700)

(declare-fun lt!57673 () tuple2!3700)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!38046 (= res!32340 (not (invariant!0 (currentBit!2605 (_2!1937 lt!57672)) (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57673))))))))

(declare-fun b!38047 () Bool)

(declare-fun e!25034 () Bool)

(declare-fun e!25027 () Bool)

(assert (=> b!38047 (= e!25034 (not e!25027))))

(declare-fun res!32351 () Bool)

(assert (=> b!38047 (=> res!32351 e!25027)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!38047 (= res!32351 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1508)

(declare-fun isPrefixOf!0 (BitStream!1508 BitStream!1508) Bool)

(assert (=> b!38047 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!57683 () Unit!2749)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1508) Unit!2749)

(assert (=> b!38047 (= lt!57683 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!57681 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!38047 (= lt!57681 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(declare-fun b!38048 () Bool)

(declare-fun res!32347 () Bool)

(declare-fun e!25039 () Bool)

(assert (=> b!38048 (=> res!32347 e!25039)))

(declare-datatypes ((tuple2!3702 0))(
  ( (tuple2!3703 (_1!1938 BitStream!1508) (_2!1938 BitStream!1508)) )
))
(declare-fun lt!57690 () tuple2!3702)

(declare-fun lt!57693 () Bool)

(declare-datatypes ((tuple2!3704 0))(
  ( (tuple2!3705 (_1!1939 BitStream!1508) (_2!1939 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!1508) tuple2!3704)

(assert (=> b!38048 (= res!32347 (not (= (_2!1939 (readBitPure!0 (_1!1938 lt!57690))) lt!57693)))))

(declare-fun b!38050 () Bool)

(assert (=> b!38050 (= e!25039 (invariant!0 (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379))))))

(declare-fun b!38051 () Bool)

(declare-fun e!25024 () Bool)

(declare-fun e!25032 () Bool)

(assert (=> b!38051 (= e!25024 e!25032)))

(declare-fun res!32354 () Bool)

(assert (=> b!38051 (=> res!32354 e!25032)))

(declare-fun lt!57676 () Bool)

(assert (=> b!38051 (= res!32354 (not (= lt!57676 lt!57693)))))

(declare-fun srcBuffer!2 () array!1950)

(declare-fun bitAt!0 (array!1950 (_ BitVec 64)) Bool)

(assert (=> b!38051 (= lt!57693 (bitAt!0 srcBuffer!2 i!635))))

(declare-datatypes ((List!455 0))(
  ( (Nil!452) (Cons!451 (h!570 Bool) (t!1205 List!455)) )
))
(declare-fun head!292 (List!455) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1508 array!1950 (_ BitVec 64) (_ BitVec 64)) List!455)

(assert (=> b!38051 (= lt!57676 (head!292 (byteArrayBitContentToList!0 (_2!1937 lt!57673) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!38052 () Bool)

(declare-fun res!32335 () Bool)

(assert (=> b!38052 (=> res!32335 e!25039)))

(declare-fun lt!57685 () Bool)

(assert (=> b!38052 (= res!32335 (not (= lt!57685 lt!57676)))))

(declare-fun b!38053 () Bool)

(declare-fun e!25030 () Bool)

(assert (=> b!38053 (= e!25030 e!25031)))

(declare-fun res!32352 () Bool)

(assert (=> b!38053 (=> res!32352 e!25031)))

(assert (=> b!38053 (= res!32352 (not (= (size!876 (buf!1204 (_2!1937 lt!57672))) (size!876 (buf!1204 (_2!1937 lt!57673))))))))

(declare-fun lt!57686 () (_ BitVec 64))

(declare-fun lt!57689 () (_ BitVec 64))

(assert (=> b!38053 (= lt!57686 (bvsub (bvsub (bvadd lt!57689 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38053 (= lt!57689 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> b!38053 (= (size!876 (buf!1204 (_2!1937 lt!57673))) (size!876 (buf!1204 thiss!1379)))))

(declare-fun b!38054 () Bool)

(declare-fun lt!57669 () tuple2!3702)

(declare-fun e!25035 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1508 BitStream!1508 (_ BitVec 64)) List!455)

(assert (=> b!38054 (= e!25035 (= (head!292 (byteArrayBitContentToList!0 (_2!1937 lt!57672) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!292 (bitStreamReadBitsIntoList!0 (_2!1937 lt!57672) (_1!1938 lt!57669) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!38055 () Bool)

(declare-fun e!25036 () Bool)

(declare-fun e!25025 () Bool)

(assert (=> b!38055 (= e!25036 e!25025)))

(declare-fun res!32349 () Bool)

(assert (=> b!38055 (=> res!32349 e!25025)))

(declare-fun lt!57692 () List!455)

(declare-fun lt!57670 () List!455)

(assert (=> b!38055 (= res!32349 (not (= lt!57692 lt!57670)))))

(assert (=> b!38055 (= lt!57670 lt!57692)))

(declare-fun lt!57675 () List!455)

(declare-fun tail!172 (List!455) List!455)

(assert (=> b!38055 (= lt!57692 (tail!172 lt!57675))))

(declare-fun lt!57691 () Unit!2749)

(declare-fun lt!57677 () tuple2!3702)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1508 BitStream!1508 BitStream!1508 BitStream!1508 (_ BitVec 64) List!455) Unit!2749)

(assert (=> b!38055 (= lt!57691 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1937 lt!57673) (_2!1937 lt!57673) (_1!1938 lt!57690) (_1!1938 lt!57677) (bvsub to!314 i!635) lt!57675))))

(declare-fun b!38056 () Bool)

(assert (=> b!38056 (= e!25031 e!25036)))

(declare-fun res!32343 () Bool)

(assert (=> b!38056 (=> res!32343 e!25036)))

(assert (=> b!38056 (= res!32343 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!57671 () (_ BitVec 64))

(assert (=> b!38056 (= lt!57670 (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_1!1938 lt!57677) lt!57671))))

(assert (=> b!38056 (= lt!57675 (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_1!1938 lt!57690) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38056 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!57671)))

(declare-fun lt!57679 () Unit!2749)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1508 array!1950 (_ BitVec 64)) Unit!2749)

(assert (=> b!38056 (= lt!57679 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!57673)) lt!57671))))

(declare-fun reader!0 (BitStream!1508 BitStream!1508) tuple2!3702)

(assert (=> b!38056 (= lt!57677 (reader!0 (_2!1937 lt!57672) (_2!1937 lt!57673)))))

(assert (=> b!38056 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!57694 () Unit!2749)

(assert (=> b!38056 (= lt!57694 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1204 (_2!1937 lt!57673)) (bvsub to!314 i!635)))))

(assert (=> b!38056 (= lt!57690 (reader!0 thiss!1379 (_2!1937 lt!57673)))))

(declare-fun b!38057 () Bool)

(declare-fun res!32348 () Bool)

(assert (=> b!38057 (=> (not res!32348) (not e!25034))))

(assert (=> b!38057 (= res!32348 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!38058 () Bool)

(declare-fun res!32355 () Bool)

(assert (=> b!38058 (=> res!32355 e!25031)))

(assert (=> b!38058 (= res!32355 (not (invariant!0 (currentBit!2605 (_2!1937 lt!57672)) (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57672))))))))

(declare-fun b!38059 () Bool)

(declare-fun e!25037 () Bool)

(assert (=> b!38059 (= e!25032 e!25037)))

(declare-fun res!32338 () Bool)

(assert (=> b!38059 (=> res!32338 e!25037)))

(declare-fun lt!57682 () Bool)

(assert (=> b!38059 (= res!32338 (not (= lt!57682 lt!57693)))))

(assert (=> b!38059 (= lt!57682 (bitAt!0 (buf!1204 (_2!1937 lt!57672)) lt!57681))))

(declare-fun b!38060 () Bool)

(declare-fun res!32336 () Bool)

(assert (=> b!38060 (=> res!32336 e!25030)))

(assert (=> b!38060 (= res!32336 (not (= (size!876 (buf!1204 thiss!1379)) (size!876 (buf!1204 (_2!1937 lt!57673))))))))

(declare-fun b!38061 () Bool)

(declare-fun e!25029 () Bool)

(assert (=> b!38061 (= e!25025 e!25029)))

(declare-fun res!32353 () Bool)

(assert (=> b!38061 (=> res!32353 e!25029)))

(declare-fun lt!57674 () Bool)

(assert (=> b!38061 (= res!32353 (not (= lt!57674 (bitAt!0 (buf!1204 (_1!1938 lt!57677)) lt!57681))))))

(assert (=> b!38061 (= lt!57674 (bitAt!0 (buf!1204 (_1!1938 lt!57690)) lt!57681))))

(declare-fun res!32342 () Bool)

(assert (=> start!7770 (=> (not res!32342) (not e!25034))))

(assert (=> start!7770 (= res!32342 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!876 srcBuffer!2))))))))

(assert (=> start!7770 e!25034))

(assert (=> start!7770 true))

(declare-fun array_inv!807 (array!1950) Bool)

(assert (=> start!7770 (array_inv!807 srcBuffer!2)))

(declare-fun e!25038 () Bool)

(declare-fun inv!12 (BitStream!1508) Bool)

(assert (=> start!7770 (and (inv!12 thiss!1379) e!25038)))

(declare-fun b!38049 () Bool)

(declare-fun e!25033 () Bool)

(declare-fun e!25028 () Bool)

(assert (=> b!38049 (= e!25033 e!25028)))

(declare-fun res!32341 () Bool)

(assert (=> b!38049 (=> res!32341 e!25028)))

(assert (=> b!38049 (= res!32341 (not (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57673))))))

(assert (=> b!38049 (isPrefixOf!0 thiss!1379 (_2!1937 lt!57673))))

(declare-fun lt!57678 () Unit!2749)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1508 BitStream!1508 BitStream!1508) Unit!2749)

(assert (=> b!38049 (= lt!57678 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1937 lt!57672) (_2!1937 lt!57673)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1508 array!1950 (_ BitVec 64) (_ BitVec 64)) tuple2!3700)

(assert (=> b!38049 (= lt!57673 (appendBitsMSBFirstLoop!0 (_2!1937 lt!57672) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!38049 e!25035))

(declare-fun res!32334 () Bool)

(assert (=> b!38049 (=> (not res!32334) (not e!25035))))

(assert (=> b!38049 (= res!32334 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57680 () Unit!2749)

(assert (=> b!38049 (= lt!57680 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1204 (_2!1937 lt!57672)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38049 (= lt!57669 (reader!0 thiss!1379 (_2!1937 lt!57672)))))

(declare-fun b!38062 () Bool)

(assert (=> b!38062 (= e!25029 e!25024)))

(declare-fun res!32346 () Bool)

(assert (=> b!38062 (=> res!32346 e!25024)))

(assert (=> b!38062 (= res!32346 (not (= lt!57685 lt!57674)))))

(assert (=> b!38062 (= lt!57685 (head!292 lt!57675))))

(declare-fun b!38063 () Bool)

(declare-fun res!32344 () Bool)

(assert (=> b!38063 (=> res!32344 e!25036)))

(declare-fun length!181 (List!455) Int)

(assert (=> b!38063 (= res!32344 (<= (length!181 lt!57675) 0))))

(declare-fun b!38064 () Bool)

(declare-fun res!32337 () Bool)

(assert (=> b!38064 (=> res!32337 e!25030)))

(assert (=> b!38064 (= res!32337 (not (invariant!0 (currentBit!2605 (_2!1937 lt!57673)) (currentByte!2610 (_2!1937 lt!57673)) (size!876 (buf!1204 (_2!1937 lt!57673))))))))

(declare-fun b!38065 () Bool)

(assert (=> b!38065 (= e!25037 e!25039)))

(declare-fun res!32350 () Bool)

(assert (=> b!38065 (=> res!32350 e!25039)))

(declare-fun lt!57688 () Bool)

(assert (=> b!38065 (= res!32350 (not (= lt!57688 lt!57693)))))

(assert (=> b!38065 (= lt!57682 lt!57688)))

(assert (=> b!38065 (= lt!57688 (bitAt!0 (buf!1204 (_2!1937 lt!57673)) lt!57681))))

(declare-fun lt!57684 () Unit!2749)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1950 array!1950 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2749)

(assert (=> b!38065 (= lt!57684 (arrayBitRangesEqImpliesEq!0 (buf!1204 (_2!1937 lt!57672)) (buf!1204 (_2!1937 lt!57673)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57681 lt!57689))))

(declare-fun b!38066 () Bool)

(assert (=> b!38066 (= e!25027 e!25033)))

(declare-fun res!32339 () Bool)

(assert (=> b!38066 (=> res!32339 e!25033)))

(assert (=> b!38066 (= res!32339 (not (isPrefixOf!0 thiss!1379 (_2!1937 lt!57672))))))

(assert (=> b!38066 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!57671)))

(assert (=> b!38066 (= lt!57671 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!57687 () Unit!2749)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1508 BitStream!1508 (_ BitVec 64) (_ BitVec 64)) Unit!2749)

(assert (=> b!38066 (= lt!57687 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1937 lt!57672) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1508 (_ BitVec 8) (_ BitVec 32)) tuple2!3700)

(assert (=> b!38066 (= lt!57672 (appendBitFromByte!0 thiss!1379 (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!38067 () Bool)

(assert (=> b!38067 (= e!25038 (array_inv!807 (buf!1204 thiss!1379)))))

(declare-fun b!38068 () Bool)

(assert (=> b!38068 (= e!25028 e!25030)))

(declare-fun res!32345 () Bool)

(assert (=> b!38068 (=> res!32345 e!25030)))

(assert (=> b!38068 (= res!32345 (not (= lt!57686 (bvsub (bvadd lt!57681 to!314) i!635))))))

(assert (=> b!38068 (= lt!57686 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673))))))

(assert (= (and start!7770 res!32342) b!38057))

(assert (= (and b!38057 res!32348) b!38047))

(assert (= (and b!38047 (not res!32351)) b!38066))

(assert (= (and b!38066 (not res!32339)) b!38049))

(assert (= (and b!38049 res!32334) b!38054))

(assert (= (and b!38049 (not res!32341)) b!38068))

(assert (= (and b!38068 (not res!32345)) b!38064))

(assert (= (and b!38064 (not res!32337)) b!38060))

(assert (= (and b!38060 (not res!32336)) b!38053))

(assert (= (and b!38053 (not res!32352)) b!38058))

(assert (= (and b!38058 (not res!32355)) b!38046))

(assert (= (and b!38046 (not res!32340)) b!38056))

(assert (= (and b!38056 (not res!32343)) b!38063))

(assert (= (and b!38063 (not res!32344)) b!38055))

(assert (= (and b!38055 (not res!32349)) b!38061))

(assert (= (and b!38061 (not res!32353)) b!38062))

(assert (= (and b!38062 (not res!32346)) b!38051))

(assert (= (and b!38051 (not res!32354)) b!38059))

(assert (= (and b!38059 (not res!32338)) b!38065))

(assert (= (and b!38065 (not res!32350)) b!38048))

(assert (= (and b!38048 (not res!32347)) b!38052))

(assert (= (and b!38052 (not res!32335)) b!38050))

(assert (= start!7770 b!38067))

(declare-fun m!57791 () Bool)

(assert (=> b!38048 m!57791))

(declare-fun m!57793 () Bool)

(assert (=> b!38046 m!57793))

(declare-fun m!57795 () Bool)

(assert (=> b!38049 m!57795))

(declare-fun m!57797 () Bool)

(assert (=> b!38049 m!57797))

(declare-fun m!57799 () Bool)

(assert (=> b!38049 m!57799))

(declare-fun m!57801 () Bool)

(assert (=> b!38049 m!57801))

(declare-fun m!57803 () Bool)

(assert (=> b!38049 m!57803))

(declare-fun m!57805 () Bool)

(assert (=> b!38049 m!57805))

(declare-fun m!57807 () Bool)

(assert (=> b!38049 m!57807))

(declare-fun m!57809 () Bool)

(assert (=> b!38067 m!57809))

(declare-fun m!57811 () Bool)

(assert (=> b!38054 m!57811))

(assert (=> b!38054 m!57811))

(declare-fun m!57813 () Bool)

(assert (=> b!38054 m!57813))

(declare-fun m!57815 () Bool)

(assert (=> b!38054 m!57815))

(assert (=> b!38054 m!57815))

(declare-fun m!57817 () Bool)

(assert (=> b!38054 m!57817))

(declare-fun m!57819 () Bool)

(assert (=> b!38061 m!57819))

(declare-fun m!57821 () Bool)

(assert (=> b!38061 m!57821))

(declare-fun m!57823 () Bool)

(assert (=> b!38059 m!57823))

(declare-fun m!57825 () Bool)

(assert (=> b!38055 m!57825))

(declare-fun m!57827 () Bool)

(assert (=> b!38055 m!57827))

(declare-fun m!57829 () Bool)

(assert (=> b!38064 m!57829))

(declare-fun m!57831 () Bool)

(assert (=> b!38051 m!57831))

(declare-fun m!57833 () Bool)

(assert (=> b!38051 m!57833))

(assert (=> b!38051 m!57833))

(declare-fun m!57835 () Bool)

(assert (=> b!38051 m!57835))

(declare-fun m!57837 () Bool)

(assert (=> b!38066 m!57837))

(declare-fun m!57839 () Bool)

(assert (=> b!38066 m!57839))

(declare-fun m!57841 () Bool)

(assert (=> b!38066 m!57841))

(assert (=> b!38066 m!57837))

(declare-fun m!57843 () Bool)

(assert (=> b!38066 m!57843))

(declare-fun m!57845 () Bool)

(assert (=> b!38066 m!57845))

(declare-fun m!57847 () Bool)

(assert (=> b!38062 m!57847))

(declare-fun m!57849 () Bool)

(assert (=> b!38050 m!57849))

(declare-fun m!57851 () Bool)

(assert (=> b!38063 m!57851))

(declare-fun m!57853 () Bool)

(assert (=> b!38058 m!57853))

(declare-fun m!57855 () Bool)

(assert (=> b!38068 m!57855))

(declare-fun m!57857 () Bool)

(assert (=> b!38057 m!57857))

(declare-fun m!57859 () Bool)

(assert (=> b!38065 m!57859))

(declare-fun m!57861 () Bool)

(assert (=> b!38065 m!57861))

(declare-fun m!57863 () Bool)

(assert (=> b!38053 m!57863))

(declare-fun m!57865 () Bool)

(assert (=> b!38056 m!57865))

(declare-fun m!57867 () Bool)

(assert (=> b!38056 m!57867))

(declare-fun m!57869 () Bool)

(assert (=> b!38056 m!57869))

(declare-fun m!57871 () Bool)

(assert (=> b!38056 m!57871))

(declare-fun m!57873 () Bool)

(assert (=> b!38056 m!57873))

(declare-fun m!57875 () Bool)

(assert (=> b!38056 m!57875))

(declare-fun m!57877 () Bool)

(assert (=> b!38056 m!57877))

(declare-fun m!57879 () Bool)

(assert (=> b!38056 m!57879))

(declare-fun m!57881 () Bool)

(assert (=> b!38047 m!57881))

(declare-fun m!57883 () Bool)

(assert (=> b!38047 m!57883))

(declare-fun m!57885 () Bool)

(assert (=> b!38047 m!57885))

(declare-fun m!57887 () Bool)

(assert (=> start!7770 m!57887))

(declare-fun m!57889 () Bool)

(assert (=> start!7770 m!57889))

(push 1)

(assert (not b!38062))

(assert (not b!38064))

(assert (not start!7770))

(assert (not b!38063))

(assert (not b!38057))

(assert (not b!38048))

(assert (not b!38066))

(assert (not b!38059))

(assert (not b!38051))

(assert (not b!38067))

(assert (not b!38050))

(assert (not b!38049))

(assert (not b!38056))

(assert (not b!38055))

(assert (not b!38061))

(assert (not b!38047))

(assert (not b!38054))

(assert (not b!38046))

(assert (not b!38068))

(assert (not b!38053))

(assert (not b!38065))

(assert (not b!38058))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!11360 () Bool)

(assert (=> d!11360 (= (bitAt!0 (buf!1204 (_2!1937 lt!57672)) lt!57681) (not (= (bvand ((_ sign_extend 24) (select (arr!1369 (buf!1204 (_2!1937 lt!57672))) ((_ extract 31 0) (bvsdiv lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3026 () Bool)

(assert (= bs!3026 d!11360))

(declare-fun m!57975 () Bool)

(assert (=> bs!3026 m!57975))

(declare-fun m!57977 () Bool)

(assert (=> bs!3026 m!57977))

(assert (=> b!38059 d!11360))

(declare-fun d!11364 () Bool)

(assert (=> d!11364 (= (array_inv!807 srcBuffer!2) (bvsge (size!876 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7770 d!11364))

(declare-fun d!11366 () Bool)

(assert (=> d!11366 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379))))))

(declare-fun bs!3027 () Bool)

(assert (= bs!3027 d!11366))

(assert (=> bs!3027 m!57849))

(assert (=> start!7770 d!11366))

(declare-fun b!38203 () Bool)

(declare-fun res!32471 () Bool)

(declare-fun e!25106 () Bool)

(assert (=> b!38203 (=> (not res!32471) (not e!25106))))

(declare-fun lt!58150 () tuple2!3700)

(assert (=> b!38203 (= res!32471 (= (size!876 (buf!1204 (_2!1937 lt!58150))) (size!876 (buf!1204 (_2!1937 lt!57672)))))))

(declare-fun b!38204 () Bool)

(declare-fun res!32472 () Bool)

(assert (=> b!38204 (=> (not res!32472) (not e!25106))))

(assert (=> b!38204 (= res!32472 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!58150)))))

(declare-fun b!38205 () Bool)

(declare-fun e!25107 () tuple2!3700)

(declare-fun Unit!2761 () Unit!2749)

(assert (=> b!38205 (= e!25107 (tuple2!3701 Unit!2761 (_2!1937 lt!57672)))))

(assert (=> b!38205 (= (size!876 (buf!1204 (_2!1937 lt!57672))) (size!876 (buf!1204 (_2!1937 lt!57672))))))

(declare-fun lt!58131 () Unit!2749)

(declare-fun Unit!2762 () Unit!2749)

(assert (=> b!38205 (= lt!58131 Unit!2762)))

(declare-fun call!478 () tuple2!3702)

(declare-fun checkByteArrayBitContent!0 (BitStream!1508 array!1950 array!1950 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3712 0))(
  ( (tuple2!3713 (_1!1943 array!1950) (_2!1943 BitStream!1508)) )
))
(declare-fun readBits!0 (BitStream!1508 (_ BitVec 64)) tuple2!3712)

(assert (=> b!38205 (checkByteArrayBitContent!0 (_2!1937 lt!57672) srcBuffer!2 (_1!1943 (readBits!0 (_1!1938 call!478) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun c!2631 () Bool)

(declare-fun bm!475 () Bool)

(declare-fun lt!58116 () tuple2!3700)

(assert (=> bm!475 (= call!478 (reader!0 (_2!1937 lt!57672) (ite c!2631 (_2!1937 lt!58116) (_2!1937 lt!57672))))))

(declare-fun d!11368 () Bool)

(assert (=> d!11368 e!25106))

(declare-fun res!32468 () Bool)

(assert (=> d!11368 (=> (not res!32468) (not e!25106))))

(declare-fun lt!58152 () (_ BitVec 64))

(assert (=> d!11368 (= res!32468 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58150))) (currentByte!2610 (_2!1937 lt!58150)) (currentBit!2605 (_2!1937 lt!58150))) (bvsub lt!58152 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!11368 (or (= (bvand lt!58152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58152 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58152 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!58144 () (_ BitVec 64))

(assert (=> d!11368 (= lt!58152 (bvadd lt!58144 to!314))))

(assert (=> d!11368 (or (not (= (bvand lt!58144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!58144 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!58144 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11368 (= lt!58144 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> d!11368 (= lt!58150 e!25107)))

(assert (=> d!11368 (= c!2631 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!58137 () Unit!2749)

(declare-fun lt!58138 () Unit!2749)

(assert (=> d!11368 (= lt!58137 lt!58138)))

(assert (=> d!11368 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57672))))

(assert (=> d!11368 (= lt!58138 (lemmaIsPrefixRefl!0 (_2!1937 lt!57672)))))

(declare-fun lt!58141 () (_ BitVec 64))

(assert (=> d!11368 (= lt!58141 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> d!11368 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11368 (= (appendBitsMSBFirstLoop!0 (_2!1937 lt!57672) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!58150)))

(declare-fun b!38206 () Bool)

(declare-fun res!32470 () Bool)

(assert (=> b!38206 (=> (not res!32470) (not e!25106))))

(assert (=> b!38206 (= res!32470 (invariant!0 (currentBit!2605 (_2!1937 lt!58150)) (currentByte!2610 (_2!1937 lt!58150)) (size!876 (buf!1204 (_2!1937 lt!58150)))))))

(declare-fun b!38207 () Bool)

(declare-fun e!25108 () Bool)

(declare-fun lt!58128 () (_ BitVec 64))

(assert (=> b!38207 (= e!25108 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!58128))))

(declare-fun b!38208 () Bool)

(declare-fun res!32467 () Bool)

(assert (=> b!38208 (=> (not res!32467) (not e!25106))))

(assert (=> b!38208 (= res!32467 (= (size!876 (buf!1204 (_2!1937 lt!57672))) (size!876 (buf!1204 (_2!1937 lt!58150)))))))

(declare-fun b!38209 () Bool)

(declare-fun lt!58124 () tuple2!3702)

(assert (=> b!38209 (= e!25106 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!58150) (_1!1938 lt!58124) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1937 lt!58150) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!38209 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38209 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!58148 () Unit!2749)

(declare-fun lt!58134 () Unit!2749)

(assert (=> b!38209 (= lt!58148 lt!58134)))

(assert (=> b!38209 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!58150)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!58128)))

(assert (=> b!38209 (= lt!58134 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!58150)) lt!58128))))

(assert (=> b!38209 e!25108))

(declare-fun res!32469 () Bool)

(assert (=> b!38209 (=> (not res!32469) (not e!25108))))

(assert (=> b!38209 (= res!32469 (and (= (size!876 (buf!1204 (_2!1937 lt!57672))) (size!876 (buf!1204 (_2!1937 lt!58150)))) (bvsge lt!58128 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38209 (= lt!58128 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!38209 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38209 (= lt!58124 (reader!0 (_2!1937 lt!57672) (_2!1937 lt!58150)))))

(declare-fun b!38210 () Bool)

(declare-fun Unit!2763 () Unit!2749)

(assert (=> b!38210 (= e!25107 (tuple2!3701 Unit!2763 (_2!1937 lt!58116)))))

(declare-fun lt!58143 () tuple2!3700)

(assert (=> b!38210 (= lt!58143 (appendBitFromByte!0 (_2!1937 lt!57672) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!58126 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58126 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58142 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58151 () Unit!2749)

(assert (=> b!38210 (= lt!58151 (validateOffsetBitsIneqLemma!0 (_2!1937 lt!57672) (_2!1937 lt!58143) lt!58126 lt!58142))))

(assert (=> b!38210 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!58143)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!58143))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!58143))) (bvsub lt!58126 lt!58142))))

(declare-fun lt!58120 () Unit!2749)

(assert (=> b!38210 (= lt!58120 lt!58151)))

(declare-fun lt!58154 () tuple2!3702)

(assert (=> b!38210 (= lt!58154 (reader!0 (_2!1937 lt!57672) (_2!1937 lt!58143)))))

(declare-fun lt!58132 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58132 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58139 () Unit!2749)

(assert (=> b!38210 (= lt!58139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!58143)) lt!58132))))

(assert (=> b!38210 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!58143)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!58132)))

(declare-fun lt!58153 () Unit!2749)

(assert (=> b!38210 (= lt!58153 lt!58139)))

(assert (=> b!38210 (= (head!292 (byteArrayBitContentToList!0 (_2!1937 lt!58143) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!292 (bitStreamReadBitsIntoList!0 (_2!1937 lt!58143) (_1!1938 lt!58154) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58145 () Unit!2749)

(declare-fun Unit!2764 () Unit!2749)

(assert (=> b!38210 (= lt!58145 Unit!2764)))

(assert (=> b!38210 (= lt!58116 (appendBitsMSBFirstLoop!0 (_2!1937 lt!58143) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!58130 () Unit!2749)

(assert (=> b!38210 (= lt!58130 (lemmaIsPrefixTransitive!0 (_2!1937 lt!57672) (_2!1937 lt!58143) (_2!1937 lt!58116)))))

(assert (=> b!38210 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!58116))))

(declare-fun lt!58122 () Unit!2749)

(assert (=> b!38210 (= lt!58122 lt!58130)))

(assert (=> b!38210 (= (size!876 (buf!1204 (_2!1937 lt!58116))) (size!876 (buf!1204 (_2!1937 lt!57672))))))

(declare-fun lt!58149 () Unit!2749)

(declare-fun Unit!2765 () Unit!2749)

(assert (=> b!38210 (= lt!58149 Unit!2765)))

(assert (=> b!38210 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58116))) (currentByte!2610 (_2!1937 lt!58116)) (currentBit!2605 (_2!1937 lt!58116))) (bvsub (bvadd (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58129 () Unit!2749)

(declare-fun Unit!2766 () Unit!2749)

(assert (=> b!38210 (= lt!58129 Unit!2766)))

(assert (=> b!38210 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58116))) (currentByte!2610 (_2!1937 lt!58116)) (currentBit!2605 (_2!1937 lt!58116))) (bvsub (bvsub (bvadd (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58143))) (currentByte!2610 (_2!1937 lt!58143)) (currentBit!2605 (_2!1937 lt!58143))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58115 () Unit!2749)

(declare-fun Unit!2767 () Unit!2749)

(assert (=> b!38210 (= lt!58115 Unit!2767)))

(declare-fun lt!58146 () tuple2!3702)

(assert (=> b!38210 (= lt!58146 call!478)))

(declare-fun lt!58127 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58127 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58119 () Unit!2749)

(assert (=> b!38210 (= lt!58119 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!58116)) lt!58127))))

(assert (=> b!38210 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!58116)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!58127)))

(declare-fun lt!58133 () Unit!2749)

(assert (=> b!38210 (= lt!58133 lt!58119)))

(declare-fun lt!58140 () tuple2!3702)

(assert (=> b!38210 (= lt!58140 (reader!0 (_2!1937 lt!58143) (_2!1937 lt!58116)))))

(declare-fun lt!58121 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58121 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!58118 () Unit!2749)

(assert (=> b!38210 (= lt!58118 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!58143) (buf!1204 (_2!1937 lt!58116)) lt!58121))))

(assert (=> b!38210 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!58116)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!58143))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!58143))) lt!58121)))

(declare-fun lt!58135 () Unit!2749)

(assert (=> b!38210 (= lt!58135 lt!58118)))

(declare-fun lt!58136 () List!455)

(assert (=> b!38210 (= lt!58136 (byteArrayBitContentToList!0 (_2!1937 lt!58116) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!58155 () List!455)

(assert (=> b!38210 (= lt!58155 (byteArrayBitContentToList!0 (_2!1937 lt!58116) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58147 () List!455)

(assert (=> b!38210 (= lt!58147 (bitStreamReadBitsIntoList!0 (_2!1937 lt!58116) (_1!1938 lt!58146) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!58113 () List!455)

(assert (=> b!38210 (= lt!58113 (bitStreamReadBitsIntoList!0 (_2!1937 lt!58116) (_1!1938 lt!58140) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!58125 () (_ BitVec 64))

(assert (=> b!38210 (= lt!58125 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!58114 () Unit!2749)

(assert (=> b!38210 (= lt!58114 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1937 lt!58116) (_2!1937 lt!58116) (_1!1938 lt!58146) (_1!1938 lt!58140) lt!58125 lt!58147))))

(assert (=> b!38210 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!58116) (_1!1938 lt!58140) (bvsub lt!58125 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!172 lt!58147))))

(declare-fun lt!58123 () Unit!2749)

(assert (=> b!38210 (= lt!58123 lt!58114)))

(declare-fun lt!58156 () Unit!2749)

(assert (=> b!38210 (= lt!58156 (arrayBitRangesEqImpliesEq!0 (buf!1204 (_2!1937 lt!58143)) (buf!1204 (_2!1937 lt!58116)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!58141 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58143))) (currentByte!2610 (_2!1937 lt!58143)) (currentBit!2605 (_2!1937 lt!58143)))))))

(assert (=> b!38210 (= (bitAt!0 (buf!1204 (_2!1937 lt!58143)) lt!58141) (bitAt!0 (buf!1204 (_2!1937 lt!58116)) lt!58141))))

(declare-fun lt!58117 () Unit!2749)

(assert (=> b!38210 (= lt!58117 lt!58156)))

(assert (= (and d!11368 c!2631) b!38210))

(assert (= (and d!11368 (not c!2631)) b!38205))

(assert (= (or b!38210 b!38205) bm!475))

(assert (= (and d!11368 res!32468) b!38206))

(assert (= (and b!38206 res!32470) b!38208))

(assert (= (and b!38208 res!32467) b!38204))

(assert (= (and b!38204 res!32472) b!38203))

(assert (= (and b!38203 res!32471) b!38209))

(assert (= (and b!38209 res!32469) b!38207))

(declare-fun m!58109 () Bool)

(assert (=> b!38205 m!58109))

(declare-fun m!58111 () Bool)

(assert (=> b!38205 m!58111))

(declare-fun m!58113 () Bool)

(assert (=> d!11368 m!58113))

(assert (=> d!11368 m!57863))

(declare-fun m!58115 () Bool)

(assert (=> d!11368 m!58115))

(declare-fun m!58117 () Bool)

(assert (=> d!11368 m!58117))

(declare-fun m!58119 () Bool)

(assert (=> b!38210 m!58119))

(declare-fun m!58121 () Bool)

(assert (=> b!38210 m!58121))

(declare-fun m!58123 () Bool)

(assert (=> b!38210 m!58123))

(declare-fun m!58125 () Bool)

(assert (=> b!38210 m!58125))

(declare-fun m!58127 () Bool)

(assert (=> b!38210 m!58127))

(declare-fun m!58129 () Bool)

(assert (=> b!38210 m!58129))

(declare-fun m!58131 () Bool)

(assert (=> b!38210 m!58131))

(declare-fun m!58133 () Bool)

(assert (=> b!38210 m!58133))

(declare-fun m!58135 () Bool)

(assert (=> b!38210 m!58135))

(declare-fun m!58137 () Bool)

(assert (=> b!38210 m!58137))

(declare-fun m!58139 () Bool)

(assert (=> b!38210 m!58139))

(declare-fun m!58141 () Bool)

(assert (=> b!38210 m!58141))

(declare-fun m!58143 () Bool)

(assert (=> b!38210 m!58143))

(declare-fun m!58145 () Bool)

(assert (=> b!38210 m!58145))

(declare-fun m!58147 () Bool)

(assert (=> b!38210 m!58147))

(assert (=> b!38210 m!58143))

(declare-fun m!58149 () Bool)

(assert (=> b!38210 m!58149))

(declare-fun m!58151 () Bool)

(assert (=> b!38210 m!58151))

(declare-fun m!58153 () Bool)

(assert (=> b!38210 m!58153))

(declare-fun m!58155 () Bool)

(assert (=> b!38210 m!58155))

(declare-fun m!58157 () Bool)

(assert (=> b!38210 m!58157))

(declare-fun m!58159 () Bool)

(assert (=> b!38210 m!58159))

(declare-fun m!58161 () Bool)

(assert (=> b!38210 m!58161))

(declare-fun m!58163 () Bool)

(assert (=> b!38210 m!58163))

(declare-fun m!58165 () Bool)

(assert (=> b!38210 m!58165))

(declare-fun m!58167 () Bool)

(assert (=> b!38210 m!58167))

(declare-fun m!58169 () Bool)

(assert (=> b!38210 m!58169))

(declare-fun m!58171 () Bool)

(assert (=> b!38210 m!58171))

(declare-fun m!58173 () Bool)

(assert (=> b!38210 m!58173))

(assert (=> b!38210 m!58123))

(assert (=> b!38210 m!58157))

(assert (=> b!38210 m!57863))

(declare-fun m!58175 () Bool)

(assert (=> b!38210 m!58175))

(declare-fun m!58177 () Bool)

(assert (=> b!38210 m!58177))

(assert (=> b!38210 m!58121))

(declare-fun m!58179 () Bool)

(assert (=> b!38210 m!58179))

(declare-fun m!58181 () Bool)

(assert (=> b!38209 m!58181))

(declare-fun m!58183 () Bool)

(assert (=> b!38209 m!58183))

(declare-fun m!58185 () Bool)

(assert (=> b!38209 m!58185))

(declare-fun m!58187 () Bool)

(assert (=> b!38209 m!58187))

(declare-fun m!58189 () Bool)

(assert (=> b!38209 m!58189))

(declare-fun m!58191 () Bool)

(assert (=> bm!475 m!58191))

(declare-fun m!58193 () Bool)

(assert (=> b!38204 m!58193))

(declare-fun m!58195 () Bool)

(assert (=> b!38206 m!58195))

(declare-fun m!58197 () Bool)

(assert (=> b!38207 m!58197))

(assert (=> b!38049 d!11368))

(declare-fun d!11400 () Bool)

(declare-fun res!32483 () Bool)

(declare-fun e!25115 () Bool)

(assert (=> d!11400 (=> (not res!32483) (not e!25115))))

(assert (=> d!11400 (= res!32483 (= (size!876 (buf!1204 thiss!1379)) (size!876 (buf!1204 (_2!1937 lt!57673)))))))

(assert (=> d!11400 (= (isPrefixOf!0 thiss!1379 (_2!1937 lt!57673)) e!25115)))

(declare-fun b!38219 () Bool)

(declare-fun res!32482 () Bool)

(assert (=> b!38219 (=> (not res!32482) (not e!25115))))

(assert (=> b!38219 (= res!32482 (bvsle (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)) (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673)))))))

(declare-fun b!38220 () Bool)

(declare-fun e!25114 () Bool)

(assert (=> b!38220 (= e!25115 e!25114)))

(declare-fun res!32481 () Bool)

(assert (=> b!38220 (=> res!32481 e!25114)))

(assert (=> b!38220 (= res!32481 (= (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38221 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1950 array!1950 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!38221 (= e!25114 (arrayBitRangesEq!0 (buf!1204 thiss!1379) (buf!1204 (_2!1937 lt!57673)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(assert (= (and d!11400 res!32483) b!38219))

(assert (= (and b!38219 res!32482) b!38220))

(assert (= (and b!38220 (not res!32481)) b!38221))

(assert (=> b!38219 m!57885))

(assert (=> b!38219 m!57855))

(assert (=> b!38221 m!57885))

(assert (=> b!38221 m!57885))

(declare-fun m!58207 () Bool)

(assert (=> b!38221 m!58207))

(assert (=> b!38049 d!11400))

(declare-fun b!38272 () Bool)

(declare-fun e!25140 () Unit!2749)

(declare-fun lt!58279 () Unit!2749)

(assert (=> b!38272 (= e!25140 lt!58279)))

(declare-fun lt!58289 () (_ BitVec 64))

(assert (=> b!38272 (= lt!58289 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58275 () (_ BitVec 64))

(assert (=> b!38272 (= lt!58275 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1950 array!1950 (_ BitVec 64) (_ BitVec 64)) Unit!2749)

(assert (=> b!38272 (= lt!58279 (arrayBitRangesEqSymmetric!0 (buf!1204 thiss!1379) (buf!1204 (_2!1937 lt!57672)) lt!58289 lt!58275))))

(assert (=> b!38272 (arrayBitRangesEq!0 (buf!1204 (_2!1937 lt!57672)) (buf!1204 thiss!1379) lt!58289 lt!58275)))

(declare-fun b!38273 () Bool)

(declare-fun res!32498 () Bool)

(declare-fun e!25139 () Bool)

(assert (=> b!38273 (=> (not res!32498) (not e!25139))))

(declare-fun lt!58286 () tuple2!3702)

(assert (=> b!38273 (= res!32498 (isPrefixOf!0 (_1!1938 lt!58286) thiss!1379))))

(declare-fun b!38274 () Bool)

(declare-fun Unit!2768 () Unit!2749)

(assert (=> b!38274 (= e!25140 Unit!2768)))

(declare-fun lt!58273 () (_ BitVec 64))

(declare-fun b!38275 () Bool)

(declare-fun lt!58287 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1508 (_ BitVec 64)) BitStream!1508)

(assert (=> b!38275 (= e!25139 (= (_1!1938 lt!58286) (withMovedBitIndex!0 (_2!1938 lt!58286) (bvsub lt!58287 lt!58273))))))

(assert (=> b!38275 (or (= (bvand lt!58287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58273 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58287 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58287 lt!58273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38275 (= lt!58273 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> b!38275 (= lt!58287 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(declare-fun d!11408 () Bool)

(assert (=> d!11408 e!25139))

(declare-fun res!32500 () Bool)

(assert (=> d!11408 (=> (not res!32500) (not e!25139))))

(assert (=> d!11408 (= res!32500 (isPrefixOf!0 (_1!1938 lt!58286) (_2!1938 lt!58286)))))

(declare-fun lt!58276 () BitStream!1508)

(assert (=> d!11408 (= lt!58286 (tuple2!3703 lt!58276 (_2!1937 lt!57672)))))

(declare-fun lt!58288 () Unit!2749)

(declare-fun lt!58278 () Unit!2749)

(assert (=> d!11408 (= lt!58288 lt!58278)))

(assert (=> d!11408 (isPrefixOf!0 lt!58276 (_2!1937 lt!57672))))

(assert (=> d!11408 (= lt!58278 (lemmaIsPrefixTransitive!0 lt!58276 (_2!1937 lt!57672) (_2!1937 lt!57672)))))

(declare-fun lt!58282 () Unit!2749)

(declare-fun lt!58272 () Unit!2749)

(assert (=> d!11408 (= lt!58282 lt!58272)))

(assert (=> d!11408 (isPrefixOf!0 lt!58276 (_2!1937 lt!57672))))

(assert (=> d!11408 (= lt!58272 (lemmaIsPrefixTransitive!0 lt!58276 thiss!1379 (_2!1937 lt!57672)))))

(declare-fun lt!58277 () Unit!2749)

(assert (=> d!11408 (= lt!58277 e!25140)))

(declare-fun c!2650 () Bool)

(assert (=> d!11408 (= c!2650 (not (= (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!58274 () Unit!2749)

(declare-fun lt!58285 () Unit!2749)

(assert (=> d!11408 (= lt!58274 lt!58285)))

(assert (=> d!11408 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57672))))

(assert (=> d!11408 (= lt!58285 (lemmaIsPrefixRefl!0 (_2!1937 lt!57672)))))

(declare-fun lt!58280 () Unit!2749)

(declare-fun lt!58283 () Unit!2749)

(assert (=> d!11408 (= lt!58280 lt!58283)))

(assert (=> d!11408 (= lt!58283 (lemmaIsPrefixRefl!0 (_2!1937 lt!57672)))))

(declare-fun lt!58290 () Unit!2749)

(declare-fun lt!58284 () Unit!2749)

(assert (=> d!11408 (= lt!58290 lt!58284)))

(assert (=> d!11408 (isPrefixOf!0 lt!58276 lt!58276)))

(assert (=> d!11408 (= lt!58284 (lemmaIsPrefixRefl!0 lt!58276))))

(declare-fun lt!58281 () Unit!2749)

(declare-fun lt!58291 () Unit!2749)

(assert (=> d!11408 (= lt!58281 lt!58291)))

(assert (=> d!11408 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11408 (= lt!58291 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11408 (= lt!58276 (BitStream!1509 (buf!1204 (_2!1937 lt!57672)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(assert (=> d!11408 (isPrefixOf!0 thiss!1379 (_2!1937 lt!57672))))

(assert (=> d!11408 (= (reader!0 thiss!1379 (_2!1937 lt!57672)) lt!58286)))

(declare-fun b!38276 () Bool)

(declare-fun res!32499 () Bool)

(assert (=> b!38276 (=> (not res!32499) (not e!25139))))

(assert (=> b!38276 (= res!32499 (isPrefixOf!0 (_2!1938 lt!58286) (_2!1937 lt!57672)))))

(assert (= (and d!11408 c!2650) b!38272))

(assert (= (and d!11408 (not c!2650)) b!38274))

(assert (= (and d!11408 res!32500) b!38273))

(assert (= (and b!38273 res!32498) b!38276))

(assert (= (and b!38276 res!32499) b!38275))

(declare-fun m!58297 () Bool)

(assert (=> b!38275 m!58297))

(assert (=> b!38275 m!57863))

(assert (=> b!38275 m!57885))

(declare-fun m!58299 () Bool)

(assert (=> b!38273 m!58299))

(declare-fun m!58301 () Bool)

(assert (=> b!38276 m!58301))

(assert (=> d!11408 m!57845))

(assert (=> d!11408 m!58115))

(assert (=> d!11408 m!57883))

(declare-fun m!58303 () Bool)

(assert (=> d!11408 m!58303))

(declare-fun m!58305 () Bool)

(assert (=> d!11408 m!58305))

(assert (=> d!11408 m!57881))

(declare-fun m!58307 () Bool)

(assert (=> d!11408 m!58307))

(declare-fun m!58309 () Bool)

(assert (=> d!11408 m!58309))

(assert (=> d!11408 m!58117))

(declare-fun m!58311 () Bool)

(assert (=> d!11408 m!58311))

(declare-fun m!58313 () Bool)

(assert (=> d!11408 m!58313))

(assert (=> b!38272 m!57885))

(declare-fun m!58315 () Bool)

(assert (=> b!38272 m!58315))

(declare-fun m!58317 () Bool)

(assert (=> b!38272 m!58317))

(assert (=> b!38049 d!11408))

(declare-fun d!11452 () Bool)

(declare-fun res!32503 () Bool)

(declare-fun e!25142 () Bool)

(assert (=> d!11452 (=> (not res!32503) (not e!25142))))

(assert (=> d!11452 (= res!32503 (= (size!876 (buf!1204 (_2!1937 lt!57672))) (size!876 (buf!1204 (_2!1937 lt!57673)))))))

(assert (=> d!11452 (= (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57673)) e!25142)))

(declare-fun b!38277 () Bool)

(declare-fun res!32502 () Bool)

(assert (=> b!38277 (=> (not res!32502) (not e!25142))))

(assert (=> b!38277 (= res!32502 (bvsle (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))) (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673)))))))

(declare-fun b!38278 () Bool)

(declare-fun e!25141 () Bool)

(assert (=> b!38278 (= e!25142 e!25141)))

(declare-fun res!32501 () Bool)

(assert (=> b!38278 (=> res!32501 e!25141)))

(assert (=> b!38278 (= res!32501 (= (size!876 (buf!1204 (_2!1937 lt!57672))) #b00000000000000000000000000000000))))

(declare-fun b!38279 () Bool)

(assert (=> b!38279 (= e!25141 (arrayBitRangesEq!0 (buf!1204 (_2!1937 lt!57672)) (buf!1204 (_2!1937 lt!57673)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672)))))))

(assert (= (and d!11452 res!32503) b!38277))

(assert (= (and b!38277 res!32502) b!38278))

(assert (= (and b!38278 (not res!32501)) b!38279))

(assert (=> b!38277 m!57863))

(assert (=> b!38277 m!57855))

(assert (=> b!38279 m!57863))

(assert (=> b!38279 m!57863))

(declare-fun m!58319 () Bool)

(assert (=> b!38279 m!58319))

(assert (=> b!38049 d!11452))

(declare-fun d!11454 () Bool)

(assert (=> d!11454 (isPrefixOf!0 thiss!1379 (_2!1937 lt!57673))))

(declare-fun lt!58294 () Unit!2749)

(declare-fun choose!30 (BitStream!1508 BitStream!1508 BitStream!1508) Unit!2749)

(assert (=> d!11454 (= lt!58294 (choose!30 thiss!1379 (_2!1937 lt!57672) (_2!1937 lt!57673)))))

(assert (=> d!11454 (isPrefixOf!0 thiss!1379 (_2!1937 lt!57672))))

(assert (=> d!11454 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1937 lt!57672) (_2!1937 lt!57673)) lt!58294)))

(declare-fun bs!3045 () Bool)

(assert (= bs!3045 d!11454))

(assert (=> bs!3045 m!57799))

(declare-fun m!58321 () Bool)

(assert (=> bs!3045 m!58321))

(assert (=> bs!3045 m!57845))

(assert (=> b!38049 d!11454))

(declare-fun d!11456 () Bool)

(assert (=> d!11456 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58297 () Unit!2749)

(declare-fun choose!9 (BitStream!1508 array!1950 (_ BitVec 64) BitStream!1508) Unit!2749)

(assert (=> d!11456 (= lt!58297 (choose!9 thiss!1379 (buf!1204 (_2!1937 lt!57672)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1509 (buf!1204 (_2!1937 lt!57672)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(assert (=> d!11456 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1204 (_2!1937 lt!57672)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58297)))

(declare-fun bs!3046 () Bool)

(assert (= bs!3046 d!11456))

(assert (=> bs!3046 m!57795))

(declare-fun m!58323 () Bool)

(assert (=> bs!3046 m!58323))

(assert (=> b!38049 d!11456))

(declare-fun d!11458 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!11458 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3047 () Bool)

(assert (= bs!3047 d!11458))

(declare-fun m!58325 () Bool)

(assert (=> bs!3047 m!58325))

(assert (=> b!38049 d!11458))

(declare-fun d!11460 () Bool)

(assert (=> d!11460 (= (invariant!0 (currentBit!2605 (_2!1937 lt!57672)) (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57672)))) (and (bvsge (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (bvslt (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000001000) (bvsge (currentByte!2610 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57672)))) (and (= (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (= (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57672))))))))))

(assert (=> b!38058 d!11460))

(declare-fun d!11462 () Bool)

(declare-fun res!32506 () Bool)

(declare-fun e!25144 () Bool)

(assert (=> d!11462 (=> (not res!32506) (not e!25144))))

(assert (=> d!11462 (= res!32506 (= (size!876 (buf!1204 thiss!1379)) (size!876 (buf!1204 thiss!1379))))))

(assert (=> d!11462 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!25144)))

(declare-fun b!38280 () Bool)

(declare-fun res!32505 () Bool)

(assert (=> b!38280 (=> (not res!32505) (not e!25144))))

(assert (=> b!38280 (= res!32505 (bvsle (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)) (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(declare-fun b!38281 () Bool)

(declare-fun e!25143 () Bool)

(assert (=> b!38281 (= e!25144 e!25143)))

(declare-fun res!32504 () Bool)

(assert (=> b!38281 (=> res!32504 e!25143)))

(assert (=> b!38281 (= res!32504 (= (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38282 () Bool)

(assert (=> b!38282 (= e!25143 (arrayBitRangesEq!0 (buf!1204 thiss!1379) (buf!1204 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(assert (= (and d!11462 res!32506) b!38280))

(assert (= (and b!38280 res!32505) b!38281))

(assert (= (and b!38281 (not res!32504)) b!38282))

(assert (=> b!38280 m!57885))

(assert (=> b!38280 m!57885))

(assert (=> b!38282 m!57885))

(assert (=> b!38282 m!57885))

(declare-fun m!58327 () Bool)

(assert (=> b!38282 m!58327))

(assert (=> b!38047 d!11462))

(declare-fun d!11464 () Bool)

(assert (=> d!11464 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!58300 () Unit!2749)

(declare-fun choose!11 (BitStream!1508) Unit!2749)

(assert (=> d!11464 (= lt!58300 (choose!11 thiss!1379))))

(assert (=> d!11464 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!58300)))

(declare-fun bs!3049 () Bool)

(assert (= bs!3049 d!11464))

(assert (=> bs!3049 m!57881))

(declare-fun m!58329 () Bool)

(assert (=> bs!3049 m!58329))

(assert (=> b!38047 d!11464))

(declare-fun d!11466 () Bool)

(declare-fun e!25147 () Bool)

(assert (=> d!11466 e!25147))

(declare-fun res!32512 () Bool)

(assert (=> d!11466 (=> (not res!32512) (not e!25147))))

(declare-fun lt!58315 () (_ BitVec 64))

(declare-fun lt!58313 () (_ BitVec 64))

(declare-fun lt!58318 () (_ BitVec 64))

(assert (=> d!11466 (= res!32512 (= lt!58318 (bvsub lt!58313 lt!58315)))))

(assert (=> d!11466 (or (= (bvand lt!58313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58315 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58313 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58313 lt!58315) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11466 (= lt!58315 (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379))))))

(declare-fun lt!58317 () (_ BitVec 64))

(declare-fun lt!58314 () (_ BitVec 64))

(assert (=> d!11466 (= lt!58313 (bvmul lt!58317 lt!58314))))

(assert (=> d!11466 (or (= lt!58317 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58314 (bvsdiv (bvmul lt!58317 lt!58314) lt!58317)))))

(assert (=> d!11466 (= lt!58314 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11466 (= lt!58317 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))))))

(assert (=> d!11466 (= lt!58318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2610 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2605 thiss!1379))))))

(assert (=> d!11466 (invariant!0 (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379)))))

(assert (=> d!11466 (= (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)) lt!58318)))

(declare-fun b!38287 () Bool)

(declare-fun res!32511 () Bool)

(assert (=> b!38287 (=> (not res!32511) (not e!25147))))

(assert (=> b!38287 (= res!32511 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58318))))

(declare-fun b!38288 () Bool)

(declare-fun lt!58316 () (_ BitVec 64))

(assert (=> b!38288 (= e!25147 (bvsle lt!58318 (bvmul lt!58316 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38288 (or (= lt!58316 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58316 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58316)))))

(assert (=> b!38288 (= lt!58316 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))))))

(assert (= (and d!11466 res!32512) b!38287))

(assert (= (and b!38287 res!32511) b!38288))

(declare-fun m!58331 () Bool)

(assert (=> d!11466 m!58331))

(assert (=> d!11466 m!57849))

(assert (=> b!38047 d!11466))

(declare-fun d!11468 () Bool)

(declare-datatypes ((tuple2!3716 0))(
  ( (tuple2!3717 (_1!1945 Bool) (_2!1945 BitStream!1508)) )
))
(declare-fun lt!58321 () tuple2!3716)

(declare-fun readBit!0 (BitStream!1508) tuple2!3716)

(assert (=> d!11468 (= lt!58321 (readBit!0 (_1!1938 lt!57690)))))

(assert (=> d!11468 (= (readBitPure!0 (_1!1938 lt!57690)) (tuple2!3705 (_2!1945 lt!58321) (_1!1945 lt!58321)))))

(declare-fun bs!3050 () Bool)

(assert (= bs!3050 d!11468))

(declare-fun m!58333 () Bool)

(assert (=> bs!3050 m!58333))

(assert (=> b!38048 d!11468))

(declare-fun d!11470 () Bool)

(assert (=> d!11470 (= (invariant!0 (currentBit!2605 (_2!1937 lt!57672)) (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57673)))) (and (bvsge (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (bvslt (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000001000) (bvsge (currentByte!2610 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57673)))) (and (= (currentBit!2605 (_2!1937 lt!57672)) #b00000000000000000000000000000000) (= (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57673))))))))))

(assert (=> b!38046 d!11470))

(declare-fun d!11472 () Bool)

(assert (=> d!11472 (= (array_inv!807 (buf!1204 thiss!1379)) (bvsge (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!38067 d!11472))

(declare-fun d!11474 () Bool)

(declare-fun e!25148 () Bool)

(assert (=> d!11474 e!25148))

(declare-fun res!32514 () Bool)

(assert (=> d!11474 (=> (not res!32514) (not e!25148))))

(declare-fun lt!58324 () (_ BitVec 64))

(declare-fun lt!58322 () (_ BitVec 64))

(declare-fun lt!58327 () (_ BitVec 64))

(assert (=> d!11474 (= res!32514 (= lt!58327 (bvsub lt!58322 lt!58324)))))

(assert (=> d!11474 (or (= (bvand lt!58322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58324 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58322 lt!58324) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11474 (= lt!58324 (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57673))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57673)))))))

(declare-fun lt!58326 () (_ BitVec 64))

(declare-fun lt!58323 () (_ BitVec 64))

(assert (=> d!11474 (= lt!58322 (bvmul lt!58326 lt!58323))))

(assert (=> d!11474 (or (= lt!58326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58323 (bvsdiv (bvmul lt!58326 lt!58323) lt!58326)))))

(assert (=> d!11474 (= lt!58323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11474 (= lt!58326 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))))))

(assert (=> d!11474 (= lt!58327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57673))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57673)))))))

(assert (=> d!11474 (invariant!0 (currentBit!2605 (_2!1937 lt!57673)) (currentByte!2610 (_2!1937 lt!57673)) (size!876 (buf!1204 (_2!1937 lt!57673))))))

(assert (=> d!11474 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673))) lt!58327)))

(declare-fun b!38289 () Bool)

(declare-fun res!32513 () Bool)

(assert (=> b!38289 (=> (not res!32513) (not e!25148))))

(assert (=> b!38289 (= res!32513 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327))))

(declare-fun b!38290 () Bool)

(declare-fun lt!58325 () (_ BitVec 64))

(assert (=> b!38290 (= e!25148 (bvsle lt!58327 (bvmul lt!58325 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38290 (or (= lt!58325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58325)))))

(assert (=> b!38290 (= lt!58325 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))))))

(assert (= (and d!11474 res!32514) b!38289))

(assert (= (and b!38289 res!32513) b!38290))

(declare-fun m!58335 () Bool)

(assert (=> d!11474 m!58335))

(assert (=> d!11474 m!57829))

(assert (=> b!38068 d!11474))

(declare-fun d!11476 () Bool)

(assert (=> d!11476 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 thiss!1379))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3051 () Bool)

(assert (= bs!3051 d!11476))

(assert (=> bs!3051 m!58331))

(assert (=> b!38057 d!11476))

(declare-fun d!11478 () Bool)

(declare-fun res!32517 () Bool)

(declare-fun e!25150 () Bool)

(assert (=> d!11478 (=> (not res!32517) (not e!25150))))

(assert (=> d!11478 (= res!32517 (= (size!876 (buf!1204 thiss!1379)) (size!876 (buf!1204 (_2!1937 lt!57672)))))))

(assert (=> d!11478 (= (isPrefixOf!0 thiss!1379 (_2!1937 lt!57672)) e!25150)))

(declare-fun b!38291 () Bool)

(declare-fun res!32516 () Bool)

(assert (=> b!38291 (=> (not res!32516) (not e!25150))))

(assert (=> b!38291 (= res!32516 (bvsle (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)) (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672)))))))

(declare-fun b!38292 () Bool)

(declare-fun e!25149 () Bool)

(assert (=> b!38292 (= e!25150 e!25149)))

(declare-fun res!32515 () Bool)

(assert (=> b!38292 (=> res!32515 e!25149)))

(assert (=> b!38292 (= res!32515 (= (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!38293 () Bool)

(assert (=> b!38293 (= e!25149 (arrayBitRangesEq!0 (buf!1204 thiss!1379) (buf!1204 (_2!1937 lt!57672)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(assert (= (and d!11478 res!32517) b!38291))

(assert (= (and b!38291 res!32516) b!38292))

(assert (= (and b!38292 (not res!32515)) b!38293))

(assert (=> b!38291 m!57885))

(assert (=> b!38291 m!57863))

(assert (=> b!38293 m!57885))

(assert (=> b!38293 m!57885))

(declare-fun m!58337 () Bool)

(assert (=> b!38293 m!58337))

(assert (=> b!38066 d!11478))

(declare-fun d!11480 () Bool)

(assert (=> d!11480 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!57671) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672)))) lt!57671))))

(declare-fun bs!3052 () Bool)

(assert (= bs!3052 d!11480))

(declare-fun m!58339 () Bool)

(assert (=> bs!3052 m!58339))

(assert (=> b!38066 d!11480))

(declare-fun d!11482 () Bool)

(declare-fun e!25153 () Bool)

(assert (=> d!11482 e!25153))

(declare-fun res!32520 () Bool)

(assert (=> d!11482 (=> (not res!32520) (not e!25153))))

(assert (=> d!11482 (= res!32520 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58330 () Unit!2749)

(declare-fun choose!27 (BitStream!1508 BitStream!1508 (_ BitVec 64) (_ BitVec 64)) Unit!2749)

(assert (=> d!11482 (= lt!58330 (choose!27 thiss!1379 (_2!1937 lt!57672) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!11482 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!11482 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1937 lt!57672) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58330)))

(declare-fun b!38296 () Bool)

(assert (=> b!38296 (= e!25153 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!11482 res!32520) b!38296))

(declare-fun m!58341 () Bool)

(assert (=> d!11482 m!58341))

(declare-fun m!58343 () Bool)

(assert (=> b!38296 m!58343))

(assert (=> b!38066 d!11482))

(declare-fun b!38364 () Bool)

(declare-fun res!32562 () Bool)

(declare-fun e!25187 () Bool)

(assert (=> b!38364 (=> (not res!32562) (not e!25187))))

(declare-fun lt!58514 () tuple2!3700)

(assert (=> b!38364 (= res!32562 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58514))) (currentByte!2610 (_2!1937 lt!58514)) (currentBit!2605 (_2!1937 lt!58514))) (bvadd (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!11484 () Bool)

(declare-fun e!25186 () Bool)

(assert (=> d!11484 e!25186))

(declare-fun res!32568 () Bool)

(assert (=> d!11484 (=> (not res!32568) (not e!25186))))

(declare-fun lt!58518 () tuple2!3700)

(assert (=> d!11484 (= res!32568 (= (size!876 (buf!1204 (_2!1937 lt!58518))) (size!876 (buf!1204 thiss!1379))))))

(declare-fun lt!58515 () (_ BitVec 8))

(declare-fun lt!58516 () array!1950)

(assert (=> d!11484 (= lt!58515 (select (arr!1369 lt!58516) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!11484 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!876 lt!58516)))))

(assert (=> d!11484 (= lt!58516 (array!1951 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!58508 () tuple2!3700)

(assert (=> d!11484 (= lt!58518 (tuple2!3701 (_1!1937 lt!58508) (_2!1937 lt!58508)))))

(assert (=> d!11484 (= lt!58508 lt!58514)))

(assert (=> d!11484 e!25187))

(declare-fun res!32566 () Bool)

(assert (=> d!11484 (=> (not res!32566) (not e!25187))))

(assert (=> d!11484 (= res!32566 (= (size!876 (buf!1204 thiss!1379)) (size!876 (buf!1204 (_2!1937 lt!58514)))))))

(declare-fun lt!58511 () Bool)

(declare-fun appendBit!0 (BitStream!1508 Bool) tuple2!3700)

(assert (=> d!11484 (= lt!58514 (appendBit!0 thiss!1379 lt!58511))))

(assert (=> d!11484 (= lt!58511 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!11484 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!11484 (= (appendBitFromByte!0 thiss!1379 (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!58518)))

(declare-fun b!38365 () Bool)

(declare-fun res!32561 () Bool)

(assert (=> b!38365 (=> (not res!32561) (not e!25187))))

(assert (=> b!38365 (= res!32561 (isPrefixOf!0 thiss!1379 (_2!1937 lt!58514)))))

(declare-fun b!38366 () Bool)

(declare-fun e!25189 () Bool)

(declare-fun lt!58517 () tuple2!3704)

(assert (=> b!38366 (= e!25189 (= (bitIndex!0 (size!876 (buf!1204 (_1!1939 lt!58517))) (currentByte!2610 (_1!1939 lt!58517)) (currentBit!2605 (_1!1939 lt!58517))) (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58514))) (currentByte!2610 (_2!1937 lt!58514)) (currentBit!2605 (_2!1937 lt!58514)))))))

(declare-fun b!38367 () Bool)

(declare-fun res!32563 () Bool)

(assert (=> b!38367 (=> (not res!32563) (not e!25186))))

(declare-fun lt!58510 () (_ BitVec 64))

(declare-fun lt!58509 () (_ BitVec 64))

(assert (=> b!38367 (= res!32563 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58518))) (currentByte!2610 (_2!1937 lt!58518)) (currentBit!2605 (_2!1937 lt!58518))) (bvadd lt!58510 lt!58509)))))

(assert (=> b!38367 (or (not (= (bvand lt!58510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58509 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!58510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!58510 lt!58509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38367 (= lt!58509 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!38367 (= lt!58510 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(declare-fun b!38368 () Bool)

(declare-fun e!25188 () Bool)

(assert (=> b!38368 (= e!25186 e!25188)))

(declare-fun res!32564 () Bool)

(assert (=> b!38368 (=> (not res!32564) (not e!25188))))

(declare-fun lt!58512 () tuple2!3704)

(assert (=> b!38368 (= res!32564 (and (= (_2!1939 lt!58512) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!58515)) #b00000000000000000000000000000000))) (= (_1!1939 lt!58512) (_2!1937 lt!58518))))))

(declare-fun lt!58513 () tuple2!3712)

(declare-fun lt!58519 () BitStream!1508)

(assert (=> b!38368 (= lt!58513 (readBits!0 lt!58519 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!38368 (= lt!58512 (readBitPure!0 lt!58519))))

(declare-fun readerFrom!0 (BitStream!1508 (_ BitVec 32) (_ BitVec 32)) BitStream!1508)

(assert (=> b!38368 (= lt!58519 (readerFrom!0 (_2!1937 lt!58518) (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379)))))

(declare-fun b!38369 () Bool)

(assert (=> b!38369 (= e!25188 (= (bitIndex!0 (size!876 (buf!1204 (_1!1939 lt!58512))) (currentByte!2610 (_1!1939 lt!58512)) (currentBit!2605 (_1!1939 lt!58512))) (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!58518))) (currentByte!2610 (_2!1937 lt!58518)) (currentBit!2605 (_2!1937 lt!58518)))))))

(declare-fun b!38370 () Bool)

(assert (=> b!38370 (= e!25187 e!25189)))

(declare-fun res!32565 () Bool)

(assert (=> b!38370 (=> (not res!32565) (not e!25189))))

(assert (=> b!38370 (= res!32565 (and (= (_2!1939 lt!58517) lt!58511) (= (_1!1939 lt!58517) (_2!1937 lt!58514))))))

(assert (=> b!38370 (= lt!58517 (readBitPure!0 (readerFrom!0 (_2!1937 lt!58514) (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379))))))

(declare-fun b!38371 () Bool)

(declare-fun res!32567 () Bool)

(assert (=> b!38371 (=> (not res!32567) (not e!25186))))

(assert (=> b!38371 (= res!32567 (isPrefixOf!0 thiss!1379 (_2!1937 lt!58518)))))

(assert (= (and d!11484 res!32566) b!38364))

(assert (= (and b!38364 res!32562) b!38365))

(assert (= (and b!38365 res!32561) b!38370))

(assert (= (and b!38370 res!32565) b!38366))

(assert (= (and d!11484 res!32568) b!38367))

(assert (= (and b!38367 res!32563) b!38371))

(assert (= (and b!38371 res!32567) b!38368))

(assert (= (and b!38368 res!32564) b!38369))

(declare-fun m!58457 () Bool)

(assert (=> d!11484 m!58457))

(declare-fun m!58459 () Bool)

(assert (=> d!11484 m!58459))

(declare-fun m!58461 () Bool)

(assert (=> d!11484 m!58461))

(declare-fun m!58463 () Bool)

(assert (=> b!38370 m!58463))

(assert (=> b!38370 m!58463))

(declare-fun m!58465 () Bool)

(assert (=> b!38370 m!58465))

(declare-fun m!58467 () Bool)

(assert (=> b!38366 m!58467))

(declare-fun m!58469 () Bool)

(assert (=> b!38366 m!58469))

(declare-fun m!58471 () Bool)

(assert (=> b!38371 m!58471))

(declare-fun m!58473 () Bool)

(assert (=> b!38369 m!58473))

(declare-fun m!58475 () Bool)

(assert (=> b!38369 m!58475))

(assert (=> b!38367 m!58475))

(assert (=> b!38367 m!57885))

(assert (=> b!38364 m!58469))

(assert (=> b!38364 m!57885))

(declare-fun m!58477 () Bool)

(assert (=> b!38368 m!58477))

(declare-fun m!58479 () Bool)

(assert (=> b!38368 m!58479))

(declare-fun m!58481 () Bool)

(assert (=> b!38368 m!58481))

(declare-fun m!58483 () Bool)

(assert (=> b!38365 m!58483))

(assert (=> b!38066 d!11484))

(declare-fun d!11518 () Bool)

(assert (=> d!11518 (= (tail!172 lt!57675) (t!1205 lt!57675))))

(assert (=> b!38055 d!11518))

(declare-fun d!11520 () Bool)

(declare-fun e!25197 () Bool)

(assert (=> d!11520 e!25197))

(declare-fun res!32580 () Bool)

(assert (=> d!11520 (=> (not res!32580) (not e!25197))))

(declare-fun lt!58543 () (_ BitVec 64))

(assert (=> d!11520 (= res!32580 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58543 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!58543) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!11520 (= lt!58543 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!58542 () Unit!2749)

(declare-fun choose!42 (BitStream!1508 BitStream!1508 BitStream!1508 BitStream!1508 (_ BitVec 64) List!455) Unit!2749)

(assert (=> d!11520 (= lt!58542 (choose!42 (_2!1937 lt!57673) (_2!1937 lt!57673) (_1!1938 lt!57690) (_1!1938 lt!57677) (bvsub to!314 i!635) lt!57675))))

(assert (=> d!11520 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11520 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1937 lt!57673) (_2!1937 lt!57673) (_1!1938 lt!57690) (_1!1938 lt!57677) (bvsub to!314 i!635) lt!57675) lt!58542)))

(declare-fun b!38383 () Bool)

(assert (=> b!38383 (= e!25197 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_1!1938 lt!57677) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!172 lt!57675)))))

(assert (= (and d!11520 res!32580) b!38383))

(declare-fun m!58491 () Bool)

(assert (=> d!11520 m!58491))

(declare-fun m!58493 () Bool)

(assert (=> b!38383 m!58493))

(assert (=> b!38383 m!57825))

(assert (=> b!38055 d!11520))

(declare-fun d!11528 () Bool)

(assert (=> d!11528 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!57671)))

(declare-fun lt!58544 () Unit!2749)

(assert (=> d!11528 (= lt!58544 (choose!9 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!57673)) lt!57671 (BitStream!1509 (buf!1204 (_2!1937 lt!57673)) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672)))))))

(assert (=> d!11528 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1937 lt!57672) (buf!1204 (_2!1937 lt!57673)) lt!57671) lt!58544)))

(declare-fun bs!3058 () Bool)

(assert (= bs!3058 d!11528))

(assert (=> bs!3058 m!57875))

(declare-fun m!58495 () Bool)

(assert (=> bs!3058 m!58495))

(assert (=> b!38056 d!11528))

(declare-fun d!11530 () Bool)

(assert (=> d!11530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3059 () Bool)

(assert (= bs!3059 d!11530))

(declare-fun m!58497 () Bool)

(assert (=> bs!3059 m!58497))

(assert (=> b!38056 d!11530))

(declare-fun b!38384 () Bool)

(declare-fun e!25199 () Unit!2749)

(declare-fun lt!58552 () Unit!2749)

(assert (=> b!38384 (= e!25199 lt!58552)))

(declare-fun lt!58562 () (_ BitVec 64))

(assert (=> b!38384 (= lt!58562 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58548 () (_ BitVec 64))

(assert (=> b!38384 (= lt!58548 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(assert (=> b!38384 (= lt!58552 (arrayBitRangesEqSymmetric!0 (buf!1204 thiss!1379) (buf!1204 (_2!1937 lt!57673)) lt!58562 lt!58548))))

(assert (=> b!38384 (arrayBitRangesEq!0 (buf!1204 (_2!1937 lt!57673)) (buf!1204 thiss!1379) lt!58562 lt!58548)))

(declare-fun b!38385 () Bool)

(declare-fun res!32581 () Bool)

(declare-fun e!25198 () Bool)

(assert (=> b!38385 (=> (not res!32581) (not e!25198))))

(declare-fun lt!58559 () tuple2!3702)

(assert (=> b!38385 (= res!32581 (isPrefixOf!0 (_1!1938 lt!58559) thiss!1379))))

(declare-fun b!38386 () Bool)

(declare-fun Unit!2777 () Unit!2749)

(assert (=> b!38386 (= e!25199 Unit!2777)))

(declare-fun lt!58546 () (_ BitVec 64))

(declare-fun lt!58560 () (_ BitVec 64))

(declare-fun b!38387 () Bool)

(assert (=> b!38387 (= e!25198 (= (_1!1938 lt!58559) (withMovedBitIndex!0 (_2!1938 lt!58559) (bvsub lt!58560 lt!58546))))))

(assert (=> b!38387 (or (= (bvand lt!58560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58560 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58560 lt!58546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38387 (= lt!58546 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673))))))

(assert (=> b!38387 (= lt!58560 (bitIndex!0 (size!876 (buf!1204 thiss!1379)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(declare-fun d!11532 () Bool)

(assert (=> d!11532 e!25198))

(declare-fun res!32583 () Bool)

(assert (=> d!11532 (=> (not res!32583) (not e!25198))))

(assert (=> d!11532 (= res!32583 (isPrefixOf!0 (_1!1938 lt!58559) (_2!1938 lt!58559)))))

(declare-fun lt!58549 () BitStream!1508)

(assert (=> d!11532 (= lt!58559 (tuple2!3703 lt!58549 (_2!1937 lt!57673)))))

(declare-fun lt!58561 () Unit!2749)

(declare-fun lt!58551 () Unit!2749)

(assert (=> d!11532 (= lt!58561 lt!58551)))

(assert (=> d!11532 (isPrefixOf!0 lt!58549 (_2!1937 lt!57673))))

(assert (=> d!11532 (= lt!58551 (lemmaIsPrefixTransitive!0 lt!58549 (_2!1937 lt!57673) (_2!1937 lt!57673)))))

(declare-fun lt!58555 () Unit!2749)

(declare-fun lt!58545 () Unit!2749)

(assert (=> d!11532 (= lt!58555 lt!58545)))

(assert (=> d!11532 (isPrefixOf!0 lt!58549 (_2!1937 lt!57673))))

(assert (=> d!11532 (= lt!58545 (lemmaIsPrefixTransitive!0 lt!58549 thiss!1379 (_2!1937 lt!57673)))))

(declare-fun lt!58550 () Unit!2749)

(assert (=> d!11532 (= lt!58550 e!25199)))

(declare-fun c!2664 () Bool)

(assert (=> d!11532 (= c!2664 (not (= (size!876 (buf!1204 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!58547 () Unit!2749)

(declare-fun lt!58558 () Unit!2749)

(assert (=> d!11532 (= lt!58547 lt!58558)))

(assert (=> d!11532 (isPrefixOf!0 (_2!1937 lt!57673) (_2!1937 lt!57673))))

(assert (=> d!11532 (= lt!58558 (lemmaIsPrefixRefl!0 (_2!1937 lt!57673)))))

(declare-fun lt!58553 () Unit!2749)

(declare-fun lt!58556 () Unit!2749)

(assert (=> d!11532 (= lt!58553 lt!58556)))

(assert (=> d!11532 (= lt!58556 (lemmaIsPrefixRefl!0 (_2!1937 lt!57673)))))

(declare-fun lt!58563 () Unit!2749)

(declare-fun lt!58557 () Unit!2749)

(assert (=> d!11532 (= lt!58563 lt!58557)))

(assert (=> d!11532 (isPrefixOf!0 lt!58549 lt!58549)))

(assert (=> d!11532 (= lt!58557 (lemmaIsPrefixRefl!0 lt!58549))))

(declare-fun lt!58554 () Unit!2749)

(declare-fun lt!58564 () Unit!2749)

(assert (=> d!11532 (= lt!58554 lt!58564)))

(assert (=> d!11532 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!11532 (= lt!58564 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!11532 (= lt!58549 (BitStream!1509 (buf!1204 (_2!1937 lt!57673)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379)))))

(assert (=> d!11532 (isPrefixOf!0 thiss!1379 (_2!1937 lt!57673))))

(assert (=> d!11532 (= (reader!0 thiss!1379 (_2!1937 lt!57673)) lt!58559)))

(declare-fun b!38388 () Bool)

(declare-fun res!32582 () Bool)

(assert (=> b!38388 (=> (not res!32582) (not e!25198))))

(assert (=> b!38388 (= res!32582 (isPrefixOf!0 (_2!1938 lt!58559) (_2!1937 lt!57673)))))

(assert (= (and d!11532 c!2664) b!38384))

(assert (= (and d!11532 (not c!2664)) b!38386))

(assert (= (and d!11532 res!32583) b!38385))

(assert (= (and b!38385 res!32581) b!38388))

(assert (= (and b!38388 res!32582) b!38387))

(declare-fun m!58499 () Bool)

(assert (=> b!38387 m!58499))

(assert (=> b!38387 m!57855))

(assert (=> b!38387 m!57885))

(declare-fun m!58501 () Bool)

(assert (=> b!38385 m!58501))

(declare-fun m!58503 () Bool)

(assert (=> b!38388 m!58503))

(assert (=> d!11532 m!57799))

(declare-fun m!58505 () Bool)

(assert (=> d!11532 m!58505))

(assert (=> d!11532 m!57883))

(declare-fun m!58507 () Bool)

(assert (=> d!11532 m!58507))

(declare-fun m!58509 () Bool)

(assert (=> d!11532 m!58509))

(assert (=> d!11532 m!57881))

(declare-fun m!58511 () Bool)

(assert (=> d!11532 m!58511))

(declare-fun m!58513 () Bool)

(assert (=> d!11532 m!58513))

(declare-fun m!58515 () Bool)

(assert (=> d!11532 m!58515))

(declare-fun m!58517 () Bool)

(assert (=> d!11532 m!58517))

(declare-fun m!58519 () Bool)

(assert (=> d!11532 m!58519))

(assert (=> b!38384 m!57885))

(declare-fun m!58521 () Bool)

(assert (=> b!38384 m!58521))

(declare-fun m!58523 () Bool)

(assert (=> b!38384 m!58523))

(assert (=> b!38056 d!11532))

(declare-fun b!38402 () Bool)

(declare-fun e!25207 () Bool)

(declare-fun lt!58576 () List!455)

(declare-fun isEmpty!110 (List!455) Bool)

(assert (=> b!38402 (= e!25207 (isEmpty!110 lt!58576))))

(declare-fun b!38403 () Bool)

(assert (=> b!38403 (= e!25207 (> (length!181 lt!58576) 0))))

(declare-fun d!11534 () Bool)

(assert (=> d!11534 e!25207))

(declare-fun c!2670 () Bool)

(assert (=> d!11534 (= c!2670 (= lt!57671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3722 0))(
  ( (tuple2!3723 (_1!1948 List!455) (_2!1948 BitStream!1508)) )
))
(declare-fun e!25208 () tuple2!3722)

(assert (=> d!11534 (= lt!58576 (_1!1948 e!25208))))

(declare-fun c!2669 () Bool)

(assert (=> d!11534 (= c!2669 (= lt!57671 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11534 (bvsge lt!57671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11534 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_1!1938 lt!57677) lt!57671) lt!58576)))

(declare-fun b!38400 () Bool)

(assert (=> b!38400 (= e!25208 (tuple2!3723 Nil!452 (_1!1938 lt!57677)))))

(declare-fun lt!58574 () (_ BitVec 64))

(declare-fun b!38401 () Bool)

(declare-fun lt!58575 () tuple2!3716)

(assert (=> b!38401 (= e!25208 (tuple2!3723 (Cons!451 (_1!1945 lt!58575) (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_2!1945 lt!58575) (bvsub lt!57671 lt!58574))) (_2!1945 lt!58575)))))

(assert (=> b!38401 (= lt!58575 (readBit!0 (_1!1938 lt!57677)))))

(assert (=> b!38401 (= lt!58574 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11534 c!2669) b!38400))

(assert (= (and d!11534 (not c!2669)) b!38401))

(assert (= (and d!11534 c!2670) b!38402))

(assert (= (and d!11534 (not c!2670)) b!38403))

(declare-fun m!58529 () Bool)

(assert (=> b!38402 m!58529))

(declare-fun m!58531 () Bool)

(assert (=> b!38403 m!58531))

(declare-fun m!58533 () Bool)

(assert (=> b!38401 m!58533))

(declare-fun m!58535 () Bool)

(assert (=> b!38401 m!58535))

(assert (=> b!38056 d!11534))

(declare-fun d!11538 () Bool)

(assert (=> d!11538 (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 thiss!1379)) ((_ sign_extend 32) (currentBit!2605 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!58577 () Unit!2749)

(assert (=> d!11538 (= lt!58577 (choose!9 thiss!1379 (buf!1204 (_2!1937 lt!57673)) (bvsub to!314 i!635) (BitStream!1509 (buf!1204 (_2!1937 lt!57673)) (currentByte!2610 thiss!1379) (currentBit!2605 thiss!1379))))))

(assert (=> d!11538 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1204 (_2!1937 lt!57673)) (bvsub to!314 i!635)) lt!58577)))

(declare-fun bs!3060 () Bool)

(assert (= bs!3060 d!11538))

(assert (=> bs!3060 m!57877))

(declare-fun m!58537 () Bool)

(assert (=> bs!3060 m!58537))

(assert (=> b!38056 d!11538))

(declare-fun d!11540 () Bool)

(assert (=> d!11540 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672))) lt!57671) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57673)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672)))) lt!57671))))

(declare-fun bs!3061 () Bool)

(assert (= bs!3061 d!11540))

(declare-fun m!58539 () Bool)

(assert (=> bs!3061 m!58539))

(assert (=> b!38056 d!11540))

(declare-fun b!38404 () Bool)

(declare-fun e!25210 () Unit!2749)

(declare-fun lt!58585 () Unit!2749)

(assert (=> b!38404 (= e!25210 lt!58585)))

(declare-fun lt!58595 () (_ BitVec 64))

(assert (=> b!38404 (= lt!58595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58581 () (_ BitVec 64))

(assert (=> b!38404 (= lt!58581 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> b!38404 (= lt!58585 (arrayBitRangesEqSymmetric!0 (buf!1204 (_2!1937 lt!57672)) (buf!1204 (_2!1937 lt!57673)) lt!58595 lt!58581))))

(assert (=> b!38404 (arrayBitRangesEq!0 (buf!1204 (_2!1937 lt!57673)) (buf!1204 (_2!1937 lt!57672)) lt!58595 lt!58581)))

(declare-fun b!38405 () Bool)

(declare-fun res!32587 () Bool)

(declare-fun e!25209 () Bool)

(assert (=> b!38405 (=> (not res!32587) (not e!25209))))

(declare-fun lt!58592 () tuple2!3702)

(assert (=> b!38405 (= res!32587 (isPrefixOf!0 (_1!1938 lt!58592) (_2!1937 lt!57672)))))

(declare-fun b!38406 () Bool)

(declare-fun Unit!2778 () Unit!2749)

(assert (=> b!38406 (= e!25210 Unit!2778)))

(declare-fun lt!58593 () (_ BitVec 64))

(declare-fun lt!58579 () (_ BitVec 64))

(declare-fun b!38407 () Bool)

(assert (=> b!38407 (= e!25209 (= (_1!1938 lt!58592) (withMovedBitIndex!0 (_2!1938 lt!58592) (bvsub lt!58593 lt!58579))))))

(assert (=> b!38407 (or (= (bvand lt!58593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58579 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58593 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58593 lt!58579) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!38407 (= lt!58579 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57673))) (currentByte!2610 (_2!1937 lt!57673)) (currentBit!2605 (_2!1937 lt!57673))))))

(assert (=> b!38407 (= lt!58593 (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(declare-fun d!11542 () Bool)

(assert (=> d!11542 e!25209))

(declare-fun res!32589 () Bool)

(assert (=> d!11542 (=> (not res!32589) (not e!25209))))

(assert (=> d!11542 (= res!32589 (isPrefixOf!0 (_1!1938 lt!58592) (_2!1938 lt!58592)))))

(declare-fun lt!58582 () BitStream!1508)

(assert (=> d!11542 (= lt!58592 (tuple2!3703 lt!58582 (_2!1937 lt!57673)))))

(declare-fun lt!58594 () Unit!2749)

(declare-fun lt!58584 () Unit!2749)

(assert (=> d!11542 (= lt!58594 lt!58584)))

(assert (=> d!11542 (isPrefixOf!0 lt!58582 (_2!1937 lt!57673))))

(assert (=> d!11542 (= lt!58584 (lemmaIsPrefixTransitive!0 lt!58582 (_2!1937 lt!57673) (_2!1937 lt!57673)))))

(declare-fun lt!58588 () Unit!2749)

(declare-fun lt!58578 () Unit!2749)

(assert (=> d!11542 (= lt!58588 lt!58578)))

(assert (=> d!11542 (isPrefixOf!0 lt!58582 (_2!1937 lt!57673))))

(assert (=> d!11542 (= lt!58578 (lemmaIsPrefixTransitive!0 lt!58582 (_2!1937 lt!57672) (_2!1937 lt!57673)))))

(declare-fun lt!58583 () Unit!2749)

(assert (=> d!11542 (= lt!58583 e!25210)))

(declare-fun c!2671 () Bool)

(assert (=> d!11542 (= c!2671 (not (= (size!876 (buf!1204 (_2!1937 lt!57672))) #b00000000000000000000000000000000)))))

(declare-fun lt!58580 () Unit!2749)

(declare-fun lt!58591 () Unit!2749)

(assert (=> d!11542 (= lt!58580 lt!58591)))

(assert (=> d!11542 (isPrefixOf!0 (_2!1937 lt!57673) (_2!1937 lt!57673))))

(assert (=> d!11542 (= lt!58591 (lemmaIsPrefixRefl!0 (_2!1937 lt!57673)))))

(declare-fun lt!58586 () Unit!2749)

(declare-fun lt!58589 () Unit!2749)

(assert (=> d!11542 (= lt!58586 lt!58589)))

(assert (=> d!11542 (= lt!58589 (lemmaIsPrefixRefl!0 (_2!1937 lt!57673)))))

(declare-fun lt!58596 () Unit!2749)

(declare-fun lt!58590 () Unit!2749)

(assert (=> d!11542 (= lt!58596 lt!58590)))

(assert (=> d!11542 (isPrefixOf!0 lt!58582 lt!58582)))

(assert (=> d!11542 (= lt!58590 (lemmaIsPrefixRefl!0 lt!58582))))

(declare-fun lt!58587 () Unit!2749)

(declare-fun lt!58597 () Unit!2749)

(assert (=> d!11542 (= lt!58587 lt!58597)))

(assert (=> d!11542 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57672))))

(assert (=> d!11542 (= lt!58597 (lemmaIsPrefixRefl!0 (_2!1937 lt!57672)))))

(assert (=> d!11542 (= lt!58582 (BitStream!1509 (buf!1204 (_2!1937 lt!57673)) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))))))

(assert (=> d!11542 (isPrefixOf!0 (_2!1937 lt!57672) (_2!1937 lt!57673))))

(assert (=> d!11542 (= (reader!0 (_2!1937 lt!57672) (_2!1937 lt!57673)) lt!58592)))

(declare-fun b!38408 () Bool)

(declare-fun res!32588 () Bool)

(assert (=> b!38408 (=> (not res!32588) (not e!25209))))

(assert (=> b!38408 (= res!32588 (isPrefixOf!0 (_2!1938 lt!58592) (_2!1937 lt!57673)))))

(assert (= (and d!11542 c!2671) b!38404))

(assert (= (and d!11542 (not c!2671)) b!38406))

(assert (= (and d!11542 res!32589) b!38405))

(assert (= (and b!38405 res!32587) b!38408))

(assert (= (and b!38408 res!32588) b!38407))

(declare-fun m!58541 () Bool)

(assert (=> b!38407 m!58541))

(assert (=> b!38407 m!57855))

(assert (=> b!38407 m!57863))

(declare-fun m!58543 () Bool)

(assert (=> b!38405 m!58543))

(declare-fun m!58545 () Bool)

(assert (=> b!38408 m!58545))

(assert (=> d!11542 m!57801))

(assert (=> d!11542 m!58505))

(assert (=> d!11542 m!58117))

(declare-fun m!58547 () Bool)

(assert (=> d!11542 m!58547))

(declare-fun m!58549 () Bool)

(assert (=> d!11542 m!58549))

(assert (=> d!11542 m!58115))

(declare-fun m!58551 () Bool)

(assert (=> d!11542 m!58551))

(declare-fun m!58553 () Bool)

(assert (=> d!11542 m!58553))

(assert (=> d!11542 m!58515))

(declare-fun m!58555 () Bool)

(assert (=> d!11542 m!58555))

(declare-fun m!58557 () Bool)

(assert (=> d!11542 m!58557))

(assert (=> b!38404 m!57863))

(declare-fun m!58559 () Bool)

(assert (=> b!38404 m!58559))

(declare-fun m!58561 () Bool)

(assert (=> b!38404 m!58561))

(assert (=> b!38056 d!11542))

(declare-fun b!38411 () Bool)

(declare-fun e!25211 () Bool)

(declare-fun lt!58600 () List!455)

(assert (=> b!38411 (= e!25211 (isEmpty!110 lt!58600))))

(declare-fun b!38412 () Bool)

(assert (=> b!38412 (= e!25211 (> (length!181 lt!58600) 0))))

(declare-fun d!11544 () Bool)

(assert (=> d!11544 e!25211))

(declare-fun c!2673 () Bool)

(assert (=> d!11544 (= c!2673 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25212 () tuple2!3722)

(assert (=> d!11544 (= lt!58600 (_1!1948 e!25212))))

(declare-fun c!2672 () Bool)

(assert (=> d!11544 (= c!2672 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11544 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11544 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_1!1938 lt!57690) (bvsub to!314 i!635)) lt!58600)))

(declare-fun b!38409 () Bool)

(assert (=> b!38409 (= e!25212 (tuple2!3723 Nil!452 (_1!1938 lt!57690)))))

(declare-fun b!38410 () Bool)

(declare-fun lt!58598 () (_ BitVec 64))

(declare-fun lt!58599 () tuple2!3716)

(assert (=> b!38410 (= e!25212 (tuple2!3723 (Cons!451 (_1!1945 lt!58599) (bitStreamReadBitsIntoList!0 (_2!1937 lt!57673) (_2!1945 lt!58599) (bvsub (bvsub to!314 i!635) lt!58598))) (_2!1945 lt!58599)))))

(assert (=> b!38410 (= lt!58599 (readBit!0 (_1!1938 lt!57690)))))

(assert (=> b!38410 (= lt!58598 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11544 c!2672) b!38409))

(assert (= (and d!11544 (not c!2672)) b!38410))

(assert (= (and d!11544 c!2673) b!38411))

(assert (= (and d!11544 (not c!2673)) b!38412))

(declare-fun m!58563 () Bool)

(assert (=> b!38411 m!58563))

(declare-fun m!58565 () Bool)

(assert (=> b!38412 m!58565))

(declare-fun m!58567 () Bool)

(assert (=> b!38410 m!58567))

(assert (=> b!38410 m!58333))

(assert (=> b!38056 d!11544))

(declare-fun d!11546 () Bool)

(assert (=> d!11546 (= (head!292 (byteArrayBitContentToList!0 (_2!1937 lt!57672) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!570 (byteArrayBitContentToList!0 (_2!1937 lt!57672) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!38054 d!11546))

(declare-fun d!11548 () Bool)

(declare-fun c!2676 () Bool)

(assert (=> d!11548 (= c!2676 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25215 () List!455)

(assert (=> d!11548 (= (byteArrayBitContentToList!0 (_2!1937 lt!57672) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!25215)))

(declare-fun b!38417 () Bool)

(assert (=> b!38417 (= e!25215 Nil!452)))

(declare-fun b!38418 () Bool)

(assert (=> b!38418 (= e!25215 (Cons!451 (not (= (bvand ((_ sign_extend 24) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1937 lt!57672) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11548 c!2676) b!38417))

(assert (= (and d!11548 (not c!2676)) b!38418))

(assert (=> b!38418 m!57837))

(assert (=> b!38418 m!58461))

(declare-fun m!58569 () Bool)

(assert (=> b!38418 m!58569))

(assert (=> b!38054 d!11548))

(declare-fun d!11550 () Bool)

(assert (=> d!11550 (= (head!292 (bitStreamReadBitsIntoList!0 (_2!1937 lt!57672) (_1!1938 lt!57669) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!570 (bitStreamReadBitsIntoList!0 (_2!1937 lt!57672) (_1!1938 lt!57669) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!38054 d!11550))

(declare-fun b!38421 () Bool)

(declare-fun e!25216 () Bool)

(declare-fun lt!58603 () List!455)

(assert (=> b!38421 (= e!25216 (isEmpty!110 lt!58603))))

(declare-fun b!38422 () Bool)

(assert (=> b!38422 (= e!25216 (> (length!181 lt!58603) 0))))

(declare-fun d!11552 () Bool)

(assert (=> d!11552 e!25216))

(declare-fun c!2678 () Bool)

(assert (=> d!11552 (= c!2678 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25217 () tuple2!3722)

(assert (=> d!11552 (= lt!58603 (_1!1948 e!25217))))

(declare-fun c!2677 () Bool)

(assert (=> d!11552 (= c!2677 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!11552 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!11552 (= (bitStreamReadBitsIntoList!0 (_2!1937 lt!57672) (_1!1938 lt!57669) #b0000000000000000000000000000000000000000000000000000000000000001) lt!58603)))

(declare-fun b!38419 () Bool)

(assert (=> b!38419 (= e!25217 (tuple2!3723 Nil!452 (_1!1938 lt!57669)))))

(declare-fun lt!58601 () (_ BitVec 64))

(declare-fun b!38420 () Bool)

(declare-fun lt!58602 () tuple2!3716)

(assert (=> b!38420 (= e!25217 (tuple2!3723 (Cons!451 (_1!1945 lt!58602) (bitStreamReadBitsIntoList!0 (_2!1937 lt!57672) (_2!1945 lt!58602) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!58601))) (_2!1945 lt!58602)))))

(assert (=> b!38420 (= lt!58602 (readBit!0 (_1!1938 lt!57669)))))

(assert (=> b!38420 (= lt!58601 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!11552 c!2677) b!38419))

(assert (= (and d!11552 (not c!2677)) b!38420))

(assert (= (and d!11552 c!2678) b!38421))

(assert (= (and d!11552 (not c!2678)) b!38422))

(declare-fun m!58571 () Bool)

(assert (=> b!38421 m!58571))

(declare-fun m!58573 () Bool)

(assert (=> b!38422 m!58573))

(declare-fun m!58575 () Bool)

(assert (=> b!38420 m!58575))

(declare-fun m!58577 () Bool)

(assert (=> b!38420 m!58577))

(assert (=> b!38054 d!11552))

(declare-fun d!11554 () Bool)

(assert (=> d!11554 (= (bitAt!0 (buf!1204 (_2!1937 lt!57673)) lt!57681) (not (= (bvand ((_ sign_extend 24) (select (arr!1369 (buf!1204 (_2!1937 lt!57673))) ((_ extract 31 0) (bvsdiv lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3062 () Bool)

(assert (= bs!3062 d!11554))

(declare-fun m!58579 () Bool)

(assert (=> bs!3062 m!58579))

(assert (=> bs!3062 m!57977))

(assert (=> b!38065 d!11554))

(declare-fun d!11556 () Bool)

(assert (=> d!11556 (= (bitAt!0 (buf!1204 (_2!1937 lt!57672)) lt!57681) (bitAt!0 (buf!1204 (_2!1937 lt!57673)) lt!57681))))

(declare-fun lt!58606 () Unit!2749)

(declare-fun choose!31 (array!1950 array!1950 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2749)

(assert (=> d!11556 (= lt!58606 (choose!31 (buf!1204 (_2!1937 lt!57672)) (buf!1204 (_2!1937 lt!57673)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57681 lt!57689))))

(assert (=> d!11556 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!57689))))

(assert (=> d!11556 (= (arrayBitRangesEqImpliesEq!0 (buf!1204 (_2!1937 lt!57672)) (buf!1204 (_2!1937 lt!57673)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!57681 lt!57689) lt!58606)))

(declare-fun bs!3063 () Bool)

(assert (= bs!3063 d!11556))

(assert (=> bs!3063 m!57823))

(assert (=> bs!3063 m!57859))

(declare-fun m!58581 () Bool)

(assert (=> bs!3063 m!58581))

(assert (=> b!38065 d!11556))

(declare-fun d!11558 () Bool)

(declare-fun size!879 (List!455) Int)

(assert (=> d!11558 (= (length!181 lt!57675) (size!879 lt!57675))))

(declare-fun bs!3064 () Bool)

(assert (= bs!3064 d!11558))

(declare-fun m!58583 () Bool)

(assert (=> bs!3064 m!58583))

(assert (=> b!38063 d!11558))

(declare-fun d!11560 () Bool)

(assert (=> d!11560 (= (invariant!0 (currentBit!2605 (_2!1937 lt!57673)) (currentByte!2610 (_2!1937 lt!57673)) (size!876 (buf!1204 (_2!1937 lt!57673)))) (and (bvsge (currentBit!2605 (_2!1937 lt!57673)) #b00000000000000000000000000000000) (bvslt (currentBit!2605 (_2!1937 lt!57673)) #b00000000000000000000000000001000) (bvsge (currentByte!2610 (_2!1937 lt!57673)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2610 (_2!1937 lt!57673)) (size!876 (buf!1204 (_2!1937 lt!57673)))) (and (= (currentBit!2605 (_2!1937 lt!57673)) #b00000000000000000000000000000000) (= (currentByte!2610 (_2!1937 lt!57673)) (size!876 (buf!1204 (_2!1937 lt!57673))))))))))

(assert (=> b!38064 d!11560))

(declare-fun d!11562 () Bool)

(declare-fun e!25218 () Bool)

(assert (=> d!11562 e!25218))

(declare-fun res!32591 () Bool)

(assert (=> d!11562 (=> (not res!32591) (not e!25218))))

(declare-fun lt!58612 () (_ BitVec 64))

(declare-fun lt!58609 () (_ BitVec 64))

(declare-fun lt!58607 () (_ BitVec 64))

(assert (=> d!11562 (= res!32591 (= lt!58612 (bvsub lt!58607 lt!58609)))))

(assert (=> d!11562 (or (= (bvand lt!58607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!58609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!58607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!58607 lt!58609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!11562 (= lt!58609 (remainingBits!0 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))) ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672)))))))

(declare-fun lt!58611 () (_ BitVec 64))

(declare-fun lt!58608 () (_ BitVec 64))

(assert (=> d!11562 (= lt!58607 (bvmul lt!58611 lt!58608))))

(assert (=> d!11562 (or (= lt!58611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!58608 (bvsdiv (bvmul lt!58611 lt!58608) lt!58611)))))

(assert (=> d!11562 (= lt!58608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!11562 (= lt!58611 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))))))

(assert (=> d!11562 (= lt!58612 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2610 (_2!1937 lt!57672))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2605 (_2!1937 lt!57672)))))))

(assert (=> d!11562 (invariant!0 (currentBit!2605 (_2!1937 lt!57672)) (currentByte!2610 (_2!1937 lt!57672)) (size!876 (buf!1204 (_2!1937 lt!57672))))))

(assert (=> d!11562 (= (bitIndex!0 (size!876 (buf!1204 (_2!1937 lt!57672))) (currentByte!2610 (_2!1937 lt!57672)) (currentBit!2605 (_2!1937 lt!57672))) lt!58612)))

(declare-fun b!38423 () Bool)

(declare-fun res!32590 () Bool)

(assert (=> b!38423 (=> (not res!32590) (not e!25218))))

(assert (=> b!38423 (= res!32590 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!58612))))

(declare-fun b!38424 () Bool)

(declare-fun lt!58610 () (_ BitVec 64))

(assert (=> b!38424 (= e!25218 (bvsle lt!58612 (bvmul lt!58610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!38424 (or (= lt!58610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!58610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!58610)))))

(assert (=> b!38424 (= lt!58610 ((_ sign_extend 32) (size!876 (buf!1204 (_2!1937 lt!57672)))))))

(assert (= (and d!11562 res!32591) b!38423))

(assert (= (and b!38423 res!32590) b!38424))

(assert (=> d!11562 m!58339))

(assert (=> d!11562 m!57853))

(assert (=> b!38053 d!11562))

(declare-fun d!11564 () Bool)

(assert (=> d!11564 (= (head!292 lt!57675) (h!570 lt!57675))))

(assert (=> b!38062 d!11564))

(declare-fun d!11566 () Bool)

(assert (=> d!11566 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3065 () Bool)

(assert (= bs!3065 d!11566))

(assert (=> bs!3065 m!57837))

(assert (=> bs!3065 m!58461))

(assert (=> b!38051 d!11566))

(declare-fun d!11568 () Bool)

(assert (=> d!11568 (= (head!292 (byteArrayBitContentToList!0 (_2!1937 lt!57673) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!570 (byteArrayBitContentToList!0 (_2!1937 lt!57673) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!38051 d!11568))

(declare-fun d!11570 () Bool)

(declare-fun c!2679 () Bool)

(assert (=> d!11570 (= c!2679 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25219 () List!455)

(assert (=> d!11570 (= (byteArrayBitContentToList!0 (_2!1937 lt!57673) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!25219)))

(declare-fun b!38425 () Bool)

(assert (=> b!38425 (= e!25219 Nil!452)))

(declare-fun b!38426 () Bool)

(assert (=> b!38426 (= e!25219 (Cons!451 (not (= (bvand ((_ sign_extend 24) (select (arr!1369 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1937 lt!57673) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!11570 c!2679) b!38425))

(assert (= (and d!11570 (not c!2679)) b!38426))

(assert (=> b!38426 m!57837))

(assert (=> b!38426 m!58461))

(declare-fun m!58585 () Bool)

(assert (=> b!38426 m!58585))

(assert (=> b!38051 d!11570))

(declare-fun d!11572 () Bool)

(assert (=> d!11572 (= (invariant!0 (currentBit!2605 thiss!1379) (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379))) (and (bvsge (currentBit!2605 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2605 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2610 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379))) (and (= (currentBit!2605 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2610 thiss!1379) (size!876 (buf!1204 thiss!1379)))))))))

(assert (=> b!38050 d!11572))

(declare-fun d!11574 () Bool)

(assert (=> d!11574 (= (bitAt!0 (buf!1204 (_1!1938 lt!57677)) lt!57681) (not (= (bvand ((_ sign_extend 24) (select (arr!1369 (buf!1204 (_1!1938 lt!57677))) ((_ extract 31 0) (bvsdiv lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3066 () Bool)

(assert (= bs!3066 d!11574))

(declare-fun m!58587 () Bool)

(assert (=> bs!3066 m!58587))

(assert (=> bs!3066 m!57977))

(assert (=> b!38061 d!11574))

(declare-fun d!11576 () Bool)

(assert (=> d!11576 (= (bitAt!0 (buf!1204 (_1!1938 lt!57690)) lt!57681) (not (= (bvand ((_ sign_extend 24) (select (arr!1369 (buf!1204 (_1!1938 lt!57690))) ((_ extract 31 0) (bvsdiv lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!57681 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3067 () Bool)

(assert (= bs!3067 d!11576))

(declare-fun m!58589 () Bool)

(assert (=> bs!3067 m!58589))

(assert (=> bs!3067 m!57977))

(assert (=> b!38061 d!11576))

(push 1)

(assert (not b!38422))

(assert (not b!38384))

(assert (not d!11454))

(assert (not bm!475))

(assert (not b!38207))

(assert (not d!11556))

(assert (not d!11482))

(assert (not b!38369))

(assert (not d!11542))

(assert (not d!11528))

(assert (not b!38404))

(assert (not b!38405))

(assert (not b!38209))

(assert (not b!38370))

(assert (not b!38276))

(assert (not d!11468))

(assert (not b!38412))

(assert (not b!38205))

(assert (not b!38388))

(assert (not b!38277))

(assert (not d!11484))

(assert (not b!38418))

(assert (not d!11408))

(assert (not b!38410))

(assert (not b!38365))

(assert (not b!38367))

(assert (not b!38383))

(assert (not b!38368))

(assert (not b!38401))

(assert (not d!11458))

(assert (not d!11530))

(assert (not b!38408))

(assert (not b!38204))

(assert (not b!38366))

(assert (not d!11540))

(assert (not b!38387))

(assert (not b!38279))

(assert (not b!38296))

(assert (not d!11476))

(assert (not b!38407))

(assert (not b!38272))

(assert (not d!11538))

(assert (not b!38219))

(assert (not d!11368))

(assert (not b!38221))

(assert (not d!11562))

(assert (not b!38411))

(assert (not b!38291))

(assert (not d!11532))

(assert (not b!38275))

(assert (not b!38293))

(assert (not d!11456))

(assert (not d!11464))

(assert (not d!11366))

(assert (not d!11474))

(assert (not b!38210))

(assert (not b!38371))

(assert (not b!38273))

(assert (not b!38420))

(assert (not d!11466))

(assert (not b!38282))

(assert (not b!38280))

(assert (not d!11520))

(assert (not b!38385))

(assert (not b!38402))

(assert (not b!38421))

(assert (not b!38403))

(assert (not d!11558))

(assert (not b!38364))

(assert (not b!38426))

(assert (not d!11480))

(assert (not b!38206))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

