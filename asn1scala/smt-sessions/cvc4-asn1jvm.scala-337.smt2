; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7926 () Bool)

(assert start!7926)

(declare-fun b!39212 () Bool)

(declare-fun res!33339 () Bool)

(declare-fun e!25814 () Bool)

(assert (=> b!39212 (=> res!33339 e!25814)))

(declare-datatypes ((array!1977 0))(
  ( (array!1978 (arr!1387 (Array (_ BitVec 32) (_ BitVec 8))) (size!891 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1532 0))(
  ( (BitStream!1533 (buf!1219 array!1977) (currentByte!2631 (_ BitVec 32)) (currentBit!2626 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2803 0))(
  ( (Unit!2804) )
))
(declare-datatypes ((tuple2!3790 0))(
  ( (tuple2!3791 (_1!1982 Unit!2803) (_2!1982 BitStream!1532)) )
))
(declare-fun lt!59598 () tuple2!3790)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!39212 (= res!33339 (not (invariant!0 (currentBit!2626 (_2!1982 lt!59598)) (currentByte!2631 (_2!1982 lt!59598)) (size!891 (buf!1219 (_2!1982 lt!59598))))))))

(declare-fun res!33333 () Bool)

(declare-fun e!25808 () Bool)

(assert (=> start!7926 (=> (not res!33333) (not e!25808))))

(declare-fun srcBuffer!2 () array!1977)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!7926 (= res!33333 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!891 srcBuffer!2))))))))

(assert (=> start!7926 e!25808))

(assert (=> start!7926 true))

(declare-fun array_inv!819 (array!1977) Bool)

(assert (=> start!7926 (array_inv!819 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1532)

(declare-fun e!25807 () Bool)

(declare-fun inv!12 (BitStream!1532) Bool)

(assert (=> start!7926 (and (inv!12 thiss!1379) e!25807)))

(declare-fun b!39213 () Bool)

(declare-fun res!33338 () Bool)

(declare-fun e!25811 () Bool)

(assert (=> b!39213 (=> res!33338 e!25811)))

(declare-datatypes ((List!467 0))(
  ( (Nil!464) (Cons!463 (h!582 Bool) (t!1217 List!467)) )
))
(declare-fun lt!59608 () List!467)

(declare-fun length!193 (List!467) Int)

(assert (=> b!39213 (= res!33338 (<= (length!193 lt!59608) 0))))

(declare-fun b!39214 () Bool)

(declare-fun res!33346 () Bool)

(declare-fun e!25819 () Bool)

(assert (=> b!39214 (=> res!33346 e!25819)))

(declare-fun lt!59611 () tuple2!3790)

(assert (=> b!39214 (= res!33346 (not (invariant!0 (currentBit!2626 (_2!1982 lt!59611)) (currentByte!2631 (_2!1982 lt!59611)) (size!891 (buf!1219 (_2!1982 lt!59598))))))))

(declare-fun b!39215 () Bool)

(declare-fun e!25812 () Bool)

(assert (=> b!39215 (= e!25811 e!25812)))

(declare-fun res!33331 () Bool)

(assert (=> b!39215 (=> res!33331 e!25812)))

(declare-fun lt!59591 () List!467)

(declare-fun lt!59600 () List!467)

(assert (=> b!39215 (= res!33331 (not (= lt!59591 lt!59600)))))

(assert (=> b!39215 (= lt!59600 lt!59591)))

(declare-fun tail!184 (List!467) List!467)

(assert (=> b!39215 (= lt!59591 (tail!184 lt!59608))))

(declare-datatypes ((tuple2!3792 0))(
  ( (tuple2!3793 (_1!1983 BitStream!1532) (_2!1983 BitStream!1532)) )
))
(declare-fun lt!59597 () tuple2!3792)

(declare-fun lt!59594 () Unit!2803)

(declare-fun lt!59609 () tuple2!3792)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1532 BitStream!1532 BitStream!1532 BitStream!1532 (_ BitVec 64) List!467) Unit!2803)

(assert (=> b!39215 (= lt!59594 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1982 lt!59598) (_2!1982 lt!59598) (_1!1983 lt!59597) (_1!1983 lt!59609) (bvsub to!314 i!635) lt!59608))))

(declare-fun b!39216 () Bool)

(declare-fun e!25818 () Bool)

(declare-fun e!25804 () Bool)

(assert (=> b!39216 (= e!25818 e!25804)))

(declare-fun res!33335 () Bool)

(assert (=> b!39216 (=> res!33335 e!25804)))

(declare-fun lt!59604 () Bool)

(declare-fun lt!59607 () Bool)

(assert (=> b!39216 (= res!33335 (not (= lt!59604 lt!59607)))))

(declare-fun lt!59593 () (_ BitVec 64))

(declare-fun bitAt!0 (array!1977 (_ BitVec 64)) Bool)

(assert (=> b!39216 (= lt!59604 (bitAt!0 (buf!1219 (_2!1982 lt!59611)) lt!59593))))

(declare-fun b!39217 () Bool)

(declare-fun e!25813 () Bool)

(declare-fun e!25805 () Bool)

(assert (=> b!39217 (= e!25813 e!25805)))

(declare-fun res!33330 () Bool)

(assert (=> b!39217 (=> res!33330 e!25805)))

(declare-fun isPrefixOf!0 (BitStream!1532 BitStream!1532) Bool)

(assert (=> b!39217 (= res!33330 (not (isPrefixOf!0 (_2!1982 lt!59611) (_2!1982 lt!59598))))))

(assert (=> b!39217 (isPrefixOf!0 thiss!1379 (_2!1982 lt!59598))))

(declare-fun lt!59589 () Unit!2803)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1532 BitStream!1532 BitStream!1532) Unit!2803)

(assert (=> b!39217 (= lt!59589 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1982 lt!59611) (_2!1982 lt!59598)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1532 array!1977 (_ BitVec 64) (_ BitVec 64)) tuple2!3790)

(assert (=> b!39217 (= lt!59598 (appendBitsMSBFirstLoop!0 (_2!1982 lt!59611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!25817 () Bool)

(assert (=> b!39217 e!25817))

(declare-fun res!33345 () Bool)

(assert (=> b!39217 (=> (not res!33345) (not e!25817))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!39217 (= res!33345 (validate_offset_bits!1 ((_ sign_extend 32) (size!891 (buf!1219 (_2!1982 lt!59611)))) ((_ sign_extend 32) (currentByte!2631 thiss!1379)) ((_ sign_extend 32) (currentBit!2626 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59595 () Unit!2803)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1532 array!1977 (_ BitVec 64)) Unit!2803)

(assert (=> b!39217 (= lt!59595 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1219 (_2!1982 lt!59611)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59606 () tuple2!3792)

(declare-fun reader!0 (BitStream!1532 BitStream!1532) tuple2!3792)

(assert (=> b!39217 (= lt!59606 (reader!0 thiss!1379 (_2!1982 lt!59611)))))

(declare-fun b!39218 () Bool)

(declare-fun e!25815 () Bool)

(assert (=> b!39218 (= e!25812 e!25815)))

(declare-fun res!33332 () Bool)

(assert (=> b!39218 (=> res!33332 e!25815)))

(declare-fun lt!59587 () Bool)

(assert (=> b!39218 (= res!33332 (not (= lt!59587 (bitAt!0 (buf!1219 (_1!1983 lt!59609)) lt!59593))))))

(assert (=> b!39218 (= lt!59587 (bitAt!0 (buf!1219 (_1!1983 lt!59597)) lt!59593))))

(declare-fun b!39219 () Bool)

(declare-fun res!33341 () Bool)

(assert (=> b!39219 (=> res!33341 e!25819)))

(assert (=> b!39219 (= res!33341 (not (invariant!0 (currentBit!2626 (_2!1982 lt!59611)) (currentByte!2631 (_2!1982 lt!59611)) (size!891 (buf!1219 (_2!1982 lt!59611))))))))

(declare-fun b!39220 () Bool)

(assert (=> b!39220 (= e!25815 e!25818)))

(declare-fun res!33347 () Bool)

(assert (=> b!39220 (=> res!33347 e!25818)))

(declare-fun head!304 (List!467) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1532 array!1977 (_ BitVec 64) (_ BitVec 64)) List!467)

(assert (=> b!39220 (= res!33347 (not (= (head!304 (byteArrayBitContentToList!0 (_2!1982 lt!59598) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!59607)))))

(assert (=> b!39220 (= lt!59607 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!39221 () Bool)

(declare-fun e!25810 () Bool)

(assert (=> b!39221 (= e!25810 e!25813)))

(declare-fun res!33336 () Bool)

(assert (=> b!39221 (=> res!33336 e!25813)))

(assert (=> b!39221 (= res!33336 (not (isPrefixOf!0 thiss!1379 (_2!1982 lt!59611))))))

(declare-fun lt!59596 () (_ BitVec 64))

(assert (=> b!39221 (validate_offset_bits!1 ((_ sign_extend 32) (size!891 (buf!1219 (_2!1982 lt!59611)))) ((_ sign_extend 32) (currentByte!2631 (_2!1982 lt!59611))) ((_ sign_extend 32) (currentBit!2626 (_2!1982 lt!59611))) lt!59596)))

(assert (=> b!39221 (= lt!59596 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!59603 () Unit!2803)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1532 BitStream!1532 (_ BitVec 64) (_ BitVec 64)) Unit!2803)

(assert (=> b!39221 (= lt!59603 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1982 lt!59611) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1532 (_ BitVec 8) (_ BitVec 32)) tuple2!3790)

(assert (=> b!39221 (= lt!59611 (appendBitFromByte!0 thiss!1379 (select (arr!1387 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!39222 () Bool)

(declare-fun e!25809 () Bool)

(assert (=> b!39222 (= e!25804 e!25809)))

(declare-fun res!33337 () Bool)

(assert (=> b!39222 (=> res!33337 e!25809)))

(declare-fun lt!59602 () Bool)

(assert (=> b!39222 (= res!33337 (not (= lt!59602 lt!59607)))))

(assert (=> b!39222 (= lt!59604 lt!59602)))

(assert (=> b!39222 (= lt!59602 (bitAt!0 (buf!1219 (_2!1982 lt!59598)) lt!59593))))

(declare-fun lt!59599 () Unit!2803)

(declare-fun lt!59610 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1977 array!1977 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2803)

(assert (=> b!39222 (= lt!59599 (arrayBitRangesEqImpliesEq!0 (buf!1219 (_2!1982 lt!59611)) (buf!1219 (_2!1982 lt!59598)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!59593 lt!59610))))

(declare-fun b!39223 () Bool)

(assert (=> b!39223 (= e!25809 true)))

(declare-datatypes ((tuple2!3794 0))(
  ( (tuple2!3795 (_1!1984 BitStream!1532) (_2!1984 Bool)) )
))
(declare-fun lt!59590 () tuple2!3794)

(declare-fun readBitPure!0 (BitStream!1532) tuple2!3794)

(assert (=> b!39223 (= lt!59590 (readBitPure!0 (_1!1983 lt!59597)))))

(declare-fun b!39224 () Bool)

(assert (=> b!39224 (= e!25805 e!25814)))

(declare-fun res!33348 () Bool)

(assert (=> b!39224 (=> res!33348 e!25814)))

(declare-fun lt!59601 () (_ BitVec 64))

(assert (=> b!39224 (= res!33348 (not (= lt!59601 (bvsub (bvadd lt!59593 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!39224 (= lt!59601 (bitIndex!0 (size!891 (buf!1219 (_2!1982 lt!59598))) (currentByte!2631 (_2!1982 lt!59598)) (currentBit!2626 (_2!1982 lt!59598))))))

(declare-fun b!39225 () Bool)

(assert (=> b!39225 (= e!25814 e!25819)))

(declare-fun res!33344 () Bool)

(assert (=> b!39225 (=> res!33344 e!25819)))

(assert (=> b!39225 (= res!33344 (not (= (size!891 (buf!1219 (_2!1982 lt!59611))) (size!891 (buf!1219 (_2!1982 lt!59598))))))))

(assert (=> b!39225 (= lt!59601 (bvsub (bvsub (bvadd lt!59610 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!39225 (= lt!59610 (bitIndex!0 (size!891 (buf!1219 (_2!1982 lt!59611))) (currentByte!2631 (_2!1982 lt!59611)) (currentBit!2626 (_2!1982 lt!59611))))))

(assert (=> b!39225 (= (size!891 (buf!1219 (_2!1982 lt!59598))) (size!891 (buf!1219 thiss!1379)))))

(declare-fun b!39226 () Bool)

(assert (=> b!39226 (= e!25807 (array_inv!819 (buf!1219 thiss!1379)))))

(declare-fun b!39227 () Bool)

(assert (=> b!39227 (= e!25808 (not e!25810))))

(declare-fun res!33343 () Bool)

(assert (=> b!39227 (=> res!33343 e!25810)))

(assert (=> b!39227 (= res!33343 (bvsge i!635 to!314))))

(assert (=> b!39227 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!59592 () Unit!2803)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1532) Unit!2803)

(assert (=> b!39227 (= lt!59592 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!39227 (= lt!59593 (bitIndex!0 (size!891 (buf!1219 thiss!1379)) (currentByte!2631 thiss!1379) (currentBit!2626 thiss!1379)))))

(declare-fun b!39228 () Bool)

(declare-fun res!33342 () Bool)

(assert (=> b!39228 (=> res!33342 e!25815)))

(assert (=> b!39228 (= res!33342 (not (= (head!304 lt!59608) lt!59587)))))

(declare-fun b!39229 () Bool)

(declare-fun res!33329 () Bool)

(assert (=> b!39229 (=> res!33329 e!25814)))

(assert (=> b!39229 (= res!33329 (not (= (size!891 (buf!1219 thiss!1379)) (size!891 (buf!1219 (_2!1982 lt!59598))))))))

(declare-fun b!39230 () Bool)

(assert (=> b!39230 (= e!25819 e!25811)))

(declare-fun res!33340 () Bool)

(assert (=> b!39230 (=> res!33340 e!25811)))

(assert (=> b!39230 (= res!33340 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1532 BitStream!1532 (_ BitVec 64)) List!467)

(assert (=> b!39230 (= lt!59600 (bitStreamReadBitsIntoList!0 (_2!1982 lt!59598) (_1!1983 lt!59609) lt!59596))))

(assert (=> b!39230 (= lt!59608 (bitStreamReadBitsIntoList!0 (_2!1982 lt!59598) (_1!1983 lt!59597) (bvsub to!314 i!635)))))

(assert (=> b!39230 (validate_offset_bits!1 ((_ sign_extend 32) (size!891 (buf!1219 (_2!1982 lt!59598)))) ((_ sign_extend 32) (currentByte!2631 (_2!1982 lt!59611))) ((_ sign_extend 32) (currentBit!2626 (_2!1982 lt!59611))) lt!59596)))

(declare-fun lt!59588 () Unit!2803)

(assert (=> b!39230 (= lt!59588 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1982 lt!59611) (buf!1219 (_2!1982 lt!59598)) lt!59596))))

(assert (=> b!39230 (= lt!59609 (reader!0 (_2!1982 lt!59611) (_2!1982 lt!59598)))))

(assert (=> b!39230 (validate_offset_bits!1 ((_ sign_extend 32) (size!891 (buf!1219 (_2!1982 lt!59598)))) ((_ sign_extend 32) (currentByte!2631 thiss!1379)) ((_ sign_extend 32) (currentBit!2626 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!59605 () Unit!2803)

(assert (=> b!39230 (= lt!59605 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1219 (_2!1982 lt!59598)) (bvsub to!314 i!635)))))

(assert (=> b!39230 (= lt!59597 (reader!0 thiss!1379 (_2!1982 lt!59598)))))

(declare-fun b!39231 () Bool)

(assert (=> b!39231 (= e!25817 (= (head!304 (byteArrayBitContentToList!0 (_2!1982 lt!59611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!304 (bitStreamReadBitsIntoList!0 (_2!1982 lt!59611) (_1!1983 lt!59606) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!39232 () Bool)

(declare-fun res!33334 () Bool)

(assert (=> b!39232 (=> (not res!33334) (not e!25808))))

(assert (=> b!39232 (= res!33334 (validate_offset_bits!1 ((_ sign_extend 32) (size!891 (buf!1219 thiss!1379))) ((_ sign_extend 32) (currentByte!2631 thiss!1379)) ((_ sign_extend 32) (currentBit!2626 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!7926 res!33333) b!39232))

(assert (= (and b!39232 res!33334) b!39227))

(assert (= (and b!39227 (not res!33343)) b!39221))

(assert (= (and b!39221 (not res!33336)) b!39217))

(assert (= (and b!39217 res!33345) b!39231))

(assert (= (and b!39217 (not res!33330)) b!39224))

(assert (= (and b!39224 (not res!33348)) b!39212))

(assert (= (and b!39212 (not res!33339)) b!39229))

(assert (= (and b!39229 (not res!33329)) b!39225))

(assert (= (and b!39225 (not res!33344)) b!39219))

(assert (= (and b!39219 (not res!33341)) b!39214))

(assert (= (and b!39214 (not res!33346)) b!39230))

(assert (= (and b!39230 (not res!33340)) b!39213))

(assert (= (and b!39213 (not res!33338)) b!39215))

(assert (= (and b!39215 (not res!33331)) b!39218))

(assert (= (and b!39218 (not res!33332)) b!39228))

(assert (= (and b!39228 (not res!33342)) b!39220))

(assert (= (and b!39220 (not res!33347)) b!39216))

(assert (= (and b!39216 (not res!33335)) b!39222))

(assert (= (and b!39222 (not res!33337)) b!39223))

(assert (= start!7926 b!39226))

(declare-fun m!59773 () Bool)

(assert (=> b!39212 m!59773))

(declare-fun m!59775 () Bool)

(assert (=> b!39225 m!59775))

(declare-fun m!59777 () Bool)

(assert (=> b!39216 m!59777))

(declare-fun m!59779 () Bool)

(assert (=> b!39213 m!59779))

(declare-fun m!59781 () Bool)

(assert (=> b!39230 m!59781))

(declare-fun m!59783 () Bool)

(assert (=> b!39230 m!59783))

(declare-fun m!59785 () Bool)

(assert (=> b!39230 m!59785))

(declare-fun m!59787 () Bool)

(assert (=> b!39230 m!59787))

(declare-fun m!59789 () Bool)

(assert (=> b!39230 m!59789))

(declare-fun m!59791 () Bool)

(assert (=> b!39230 m!59791))

(declare-fun m!59793 () Bool)

(assert (=> b!39230 m!59793))

(declare-fun m!59795 () Bool)

(assert (=> b!39230 m!59795))

(declare-fun m!59797 () Bool)

(assert (=> b!39221 m!59797))

(assert (=> b!39221 m!59797))

(declare-fun m!59799 () Bool)

(assert (=> b!39221 m!59799))

(declare-fun m!59801 () Bool)

(assert (=> b!39221 m!59801))

(declare-fun m!59803 () Bool)

(assert (=> b!39221 m!59803))

(declare-fun m!59805 () Bool)

(assert (=> b!39221 m!59805))

(declare-fun m!59807 () Bool)

(assert (=> b!39231 m!59807))

(assert (=> b!39231 m!59807))

(declare-fun m!59809 () Bool)

(assert (=> b!39231 m!59809))

(declare-fun m!59811 () Bool)

(assert (=> b!39231 m!59811))

(assert (=> b!39231 m!59811))

(declare-fun m!59813 () Bool)

(assert (=> b!39231 m!59813))

(declare-fun m!59815 () Bool)

(assert (=> b!39215 m!59815))

(declare-fun m!59817 () Bool)

(assert (=> b!39215 m!59817))

(declare-fun m!59819 () Bool)

(assert (=> b!39219 m!59819))

(declare-fun m!59821 () Bool)

(assert (=> b!39223 m!59821))

(declare-fun m!59823 () Bool)

(assert (=> b!39226 m!59823))

(declare-fun m!59825 () Bool)

(assert (=> b!39227 m!59825))

(declare-fun m!59827 () Bool)

(assert (=> b!39227 m!59827))

(declare-fun m!59829 () Bool)

(assert (=> b!39227 m!59829))

(declare-fun m!59831 () Bool)

(assert (=> b!39222 m!59831))

(declare-fun m!59833 () Bool)

(assert (=> b!39222 m!59833))

(declare-fun m!59835 () Bool)

(assert (=> b!39218 m!59835))

(declare-fun m!59837 () Bool)

(assert (=> b!39218 m!59837))

(declare-fun m!59839 () Bool)

(assert (=> start!7926 m!59839))

(declare-fun m!59841 () Bool)

(assert (=> start!7926 m!59841))

(declare-fun m!59843 () Bool)

(assert (=> b!39232 m!59843))

(declare-fun m!59845 () Bool)

(assert (=> b!39220 m!59845))

(assert (=> b!39220 m!59845))

(declare-fun m!59847 () Bool)

(assert (=> b!39220 m!59847))

(declare-fun m!59849 () Bool)

(assert (=> b!39220 m!59849))

(declare-fun m!59851 () Bool)

(assert (=> b!39224 m!59851))

(declare-fun m!59853 () Bool)

(assert (=> b!39228 m!59853))

(declare-fun m!59855 () Bool)

(assert (=> b!39217 m!59855))

(declare-fun m!59857 () Bool)

(assert (=> b!39217 m!59857))

(declare-fun m!59859 () Bool)

(assert (=> b!39217 m!59859))

(declare-fun m!59861 () Bool)

(assert (=> b!39217 m!59861))

(declare-fun m!59863 () Bool)

(assert (=> b!39217 m!59863))

(declare-fun m!59865 () Bool)

(assert (=> b!39217 m!59865))

(declare-fun m!59867 () Bool)

(assert (=> b!39217 m!59867))

(declare-fun m!59869 () Bool)

(assert (=> b!39214 m!59869))

(push 1)

(assert (not start!7926))

(assert (not b!39226))

(assert (not b!39216))

(assert (not b!39220))

(assert (not b!39224))

(assert (not b!39217))

(assert (not b!39225))

(assert (not b!39227))

(assert (not b!39223))

(assert (not b!39221))

(assert (not b!39213))

(assert (not b!39219))

(assert (not b!39231))

(assert (not b!39230))

(assert (not b!39222))

(assert (not b!39218))

(assert (not b!39214))

(assert (not b!39228))

(assert (not b!39212))

(assert (not b!39215))

(assert (not b!39232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

