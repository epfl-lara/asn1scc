; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9406 () Bool)

(assert start!9406)

(declare-fun b!46782 () Bool)

(declare-fun res!39489 () Bool)

(declare-fun e!31072 () Bool)

(assert (=> b!46782 (=> res!39489 e!31072)))

(declare-datatypes ((array!2295 0))(
  ( (array!2296 (arr!1557 (Array (_ BitVec 32) (_ BitVec 8))) (size!1037 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1806 0))(
  ( (BitStream!1807 (buf!1386 array!2295) (currentByte!2891 (_ BitVec 32)) (currentBit!2886 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3311 0))(
  ( (Unit!3312) )
))
(declare-datatypes ((tuple2!4528 0))(
  ( (tuple2!4529 (_1!2357 Unit!3311) (_2!2357 BitStream!1806)) )
))
(declare-fun lt!72322 () tuple2!4528)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46782 (= res!39489 (not (invariant!0 (currentBit!2886 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72322)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))

(declare-fun b!46783 () Bool)

(declare-fun e!31070 () Bool)

(declare-fun e!31063 () Bool)

(assert (=> b!46783 (= e!31070 e!31063)))

(declare-fun res!39493 () Bool)

(assert (=> b!46783 (=> res!39493 e!31063)))

(declare-datatypes ((tuple2!4530 0))(
  ( (tuple2!4531 (_1!2358 BitStream!1806) (_2!2358 BitStream!1806)) )
))
(declare-fun lt!72332 () tuple2!4530)

(declare-fun lt!72333 () Bool)

(declare-fun lt!72325 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2295 (_ BitVec 64)) Bool)

(assert (=> b!46783 (= res!39493 (not (= lt!72333 (bitAt!0 (buf!1386 (_1!2358 lt!72332)) lt!72325))))))

(declare-fun lt!72329 () tuple2!4530)

(assert (=> b!46783 (= lt!72333 (bitAt!0 (buf!1386 (_1!2358 lt!72329)) lt!72325))))

(declare-fun b!46784 () Bool)

(declare-fun e!31069 () Bool)

(declare-fun e!31076 () Bool)

(assert (=> b!46784 (= e!31069 e!31076)))

(declare-fun res!39488 () Bool)

(assert (=> b!46784 (=> res!39488 e!31076)))

(declare-fun thiss!1379 () BitStream!1806)

(declare-fun lt!72328 () tuple2!4528)

(declare-fun isPrefixOf!0 (BitStream!1806 BitStream!1806) Bool)

(assert (=> b!46784 (= res!39488 (not (isPrefixOf!0 thiss!1379 (_2!2357 lt!72328))))))

(declare-fun lt!72339 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46784 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!46784 (= lt!72339 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72326 () Unit!3311)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1806 BitStream!1806 (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> b!46784 (= lt!72326 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2357 lt!72328) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2295)

(declare-fun appendBitFromByte!0 (BitStream!1806 (_ BitVec 8) (_ BitVec 32)) tuple2!4528)

(assert (=> b!46784 (= lt!72328 (appendBitFromByte!0 thiss!1379 (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46785 () Bool)

(declare-fun res!39487 () Bool)

(declare-fun e!31074 () Bool)

(assert (=> b!46785 (=> (not res!39487) (not e!31074))))

(assert (=> b!46785 (= res!39487 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46786 () Bool)

(declare-fun res!39494 () Bool)

(declare-fun e!31068 () Bool)

(assert (=> b!46786 (=> res!39494 e!31068)))

(declare-datatypes ((List!544 0))(
  ( (Nil!541) (Cons!540 (h!659 Bool) (t!1294 List!544)) )
))
(declare-fun lt!72323 () List!544)

(declare-fun length!239 (List!544) Int)

(assert (=> b!46786 (= res!39494 (<= (length!239 lt!72323) 0))))

(declare-fun b!46787 () Bool)

(declare-fun res!39495 () Bool)

(declare-fun e!31064 () Bool)

(assert (=> b!46787 (=> res!39495 e!31064)))

(assert (=> b!46787 (= res!39495 (not (invariant!0 (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72328))))))))

(declare-fun e!31073 () Bool)

(declare-fun lt!72330 () (_ BitVec 64))

(declare-fun b!46788 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46788 (= e!31073 (= lt!72330 (bvsub (bvsub (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46789 () Bool)

(assert (=> b!46789 (= e!31072 e!31064)))

(declare-fun res!39481 () Bool)

(assert (=> b!46789 (=> res!39481 e!31064)))

(assert (=> b!46789 (= res!39481 (not (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))

(assert (=> b!46789 e!31073))

(declare-fun res!39492 () Bool)

(assert (=> b!46789 (=> (not res!39492) (not e!31073))))

(assert (=> b!46789 (= res!39492 (= (size!1037 (buf!1386 (_2!2357 lt!72322))) (size!1037 (buf!1386 thiss!1379))))))

(declare-fun b!46790 () Bool)

(assert (=> b!46790 (= e!31064 e!31068)))

(declare-fun res!39483 () Bool)

(assert (=> b!46790 (=> res!39483 e!31068)))

(assert (=> b!46790 (= res!39483 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!72324 () List!544)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1806 BitStream!1806 (_ BitVec 64)) List!544)

(assert (=> b!46790 (= lt!72324 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72332) lt!72339))))

(assert (=> b!46790 (= lt!72323 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72329) (bvsub to!314 i!635)))))

(assert (=> b!46790 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339)))

(declare-fun lt!72340 () Unit!3311)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1806 array!2295 (_ BitVec 64)) Unit!3311)

(assert (=> b!46790 (= lt!72340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72322)) lt!72339))))

(declare-fun reader!0 (BitStream!1806 BitStream!1806) tuple2!4530)

(assert (=> b!46790 (= lt!72332 (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72322)))))

(assert (=> b!46790 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72334 () Unit!3311)

(assert (=> b!46790 (= lt!72334 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1386 (_2!2357 lt!72322)) (bvsub to!314 i!635)))))

(assert (=> b!46790 (= lt!72329 (reader!0 thiss!1379 (_2!2357 lt!72322)))))

(declare-fun res!39480 () Bool)

(assert (=> start!9406 (=> (not res!39480) (not e!31074))))

(assert (=> start!9406 (= res!39480 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1037 srcBuffer!2))))))))

(assert (=> start!9406 e!31074))

(assert (=> start!9406 true))

(declare-fun array_inv!956 (array!2295) Bool)

(assert (=> start!9406 (array_inv!956 srcBuffer!2)))

(declare-fun e!31066 () Bool)

(declare-fun inv!12 (BitStream!1806) Bool)

(assert (=> start!9406 (and (inv!12 thiss!1379) e!31066)))

(declare-fun lt!72338 () tuple2!4530)

(declare-fun e!31065 () Bool)

(declare-fun b!46781 () Bool)

(declare-fun head!363 (List!544) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1806 array!2295 (_ BitVec 64) (_ BitVec 64)) List!544)

(assert (=> b!46781 (= e!31065 (= (head!363 (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!363 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_1!2358 lt!72338) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46791 () Bool)

(assert (=> b!46791 (= e!31074 (not e!31069))))

(declare-fun res!39484 () Bool)

(assert (=> b!46791 (=> res!39484 e!31069)))

(assert (=> b!46791 (= res!39484 (bvsge i!635 to!314))))

(assert (=> b!46791 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72327 () Unit!3311)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1806) Unit!3311)

(assert (=> b!46791 (= lt!72327 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!46791 (= lt!72325 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!46792 () Bool)

(declare-fun res!39491 () Bool)

(assert (=> b!46792 (=> res!39491 e!31064)))

(assert (=> b!46792 (= res!39491 (not (invariant!0 (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))

(declare-fun b!46793 () Bool)

(assert (=> b!46793 (= e!31063 (= (head!363 lt!72323) lt!72333))))

(declare-fun b!46794 () Bool)

(declare-fun e!31071 () Bool)

(assert (=> b!46794 (= e!31071 e!31072)))

(declare-fun res!39482 () Bool)

(assert (=> b!46794 (=> res!39482 e!31072)))

(assert (=> b!46794 (= res!39482 (not (= lt!72330 (bvsub (bvadd lt!72325 to!314) i!635))))))

(assert (=> b!46794 (= lt!72330 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322))))))

(declare-fun b!46795 () Bool)

(assert (=> b!46795 (= e!31066 (array_inv!956 (buf!1386 thiss!1379)))))

(declare-fun b!46796 () Bool)

(assert (=> b!46796 (= e!31076 e!31071)))

(declare-fun res!39479 () Bool)

(assert (=> b!46796 (=> res!39479 e!31071)))

(assert (=> b!46796 (= res!39479 (not (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72322))))))

(assert (=> b!46796 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72322))))

(declare-fun lt!72336 () Unit!3311)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1806 BitStream!1806 BitStream!1806) Unit!3311)

(assert (=> b!46796 (= lt!72336 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2357 lt!72328) (_2!2357 lt!72322)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1806 array!2295 (_ BitVec 64) (_ BitVec 64)) tuple2!4528)

(assert (=> b!46796 (= lt!72322 (appendBitsMSBFirstLoop!0 (_2!2357 lt!72328) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46796 e!31065))

(declare-fun res!39486 () Bool)

(assert (=> b!46796 (=> (not res!39486) (not e!31065))))

(assert (=> b!46796 (= res!39486 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72335 () Unit!3311)

(assert (=> b!46796 (= lt!72335 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46796 (= lt!72338 (reader!0 thiss!1379 (_2!2357 lt!72328)))))

(declare-fun b!46797 () Bool)

(assert (=> b!46797 (= e!31068 e!31070)))

(declare-fun res!39490 () Bool)

(assert (=> b!46797 (=> res!39490 e!31070)))

(declare-fun lt!72337 () List!544)

(assert (=> b!46797 (= res!39490 (not (= lt!72337 lt!72324)))))

(assert (=> b!46797 (= lt!72324 lt!72337)))

(declare-fun tail!230 (List!544) List!544)

(assert (=> b!46797 (= lt!72337 (tail!230 lt!72323))))

(declare-fun lt!72331 () Unit!3311)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1806 BitStream!1806 BitStream!1806 BitStream!1806 (_ BitVec 64) List!544) Unit!3311)

(assert (=> b!46797 (= lt!72331 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2357 lt!72322) (_2!2357 lt!72322) (_1!2358 lt!72329) (_1!2358 lt!72332) (bvsub to!314 i!635) lt!72323))))

(declare-fun b!46798 () Bool)

(declare-fun res!39485 () Bool)

(assert (=> b!46798 (=> res!39485 e!31072)))

(assert (=> b!46798 (= res!39485 (not (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))

(assert (= (and start!9406 res!39480) b!46785))

(assert (= (and b!46785 res!39487) b!46791))

(assert (= (and b!46791 (not res!39484)) b!46784))

(assert (= (and b!46784 (not res!39488)) b!46796))

(assert (= (and b!46796 res!39486) b!46781))

(assert (= (and b!46796 (not res!39479)) b!46794))

(assert (= (and b!46794 (not res!39482)) b!46782))

(assert (= (and b!46782 (not res!39489)) b!46798))

(assert (= (and b!46798 (not res!39485)) b!46789))

(assert (= (and b!46789 res!39492) b!46788))

(assert (= (and b!46789 (not res!39481)) b!46787))

(assert (= (and b!46787 (not res!39495)) b!46792))

(assert (= (and b!46792 (not res!39491)) b!46790))

(assert (= (and b!46790 (not res!39483)) b!46786))

(assert (= (and b!46786 (not res!39494)) b!46797))

(assert (= (and b!46797 (not res!39490)) b!46783))

(assert (= (and b!46783 (not res!39493)) b!46793))

(assert (= start!9406 b!46795))

(declare-fun m!71743 () Bool)

(assert (=> b!46782 m!71743))

(declare-fun m!71745 () Bool)

(assert (=> b!46791 m!71745))

(declare-fun m!71747 () Bool)

(assert (=> b!46791 m!71747))

(declare-fun m!71749 () Bool)

(assert (=> b!46791 m!71749))

(declare-fun m!71751 () Bool)

(assert (=> b!46794 m!71751))

(declare-fun m!71753 () Bool)

(assert (=> b!46785 m!71753))

(declare-fun m!71755 () Bool)

(assert (=> b!46790 m!71755))

(declare-fun m!71757 () Bool)

(assert (=> b!46790 m!71757))

(declare-fun m!71759 () Bool)

(assert (=> b!46790 m!71759))

(declare-fun m!71761 () Bool)

(assert (=> b!46790 m!71761))

(declare-fun m!71763 () Bool)

(assert (=> b!46790 m!71763))

(declare-fun m!71765 () Bool)

(assert (=> b!46790 m!71765))

(declare-fun m!71767 () Bool)

(assert (=> b!46790 m!71767))

(declare-fun m!71769 () Bool)

(assert (=> b!46790 m!71769))

(declare-fun m!71771 () Bool)

(assert (=> b!46783 m!71771))

(declare-fun m!71773 () Bool)

(assert (=> b!46783 m!71773))

(declare-fun m!71775 () Bool)

(assert (=> b!46788 m!71775))

(declare-fun m!71777 () Bool)

(assert (=> b!46786 m!71777))

(declare-fun m!71779 () Bool)

(assert (=> b!46796 m!71779))

(declare-fun m!71781 () Bool)

(assert (=> b!46796 m!71781))

(declare-fun m!71783 () Bool)

(assert (=> b!46796 m!71783))

(declare-fun m!71785 () Bool)

(assert (=> b!46796 m!71785))

(declare-fun m!71787 () Bool)

(assert (=> b!46796 m!71787))

(declare-fun m!71789 () Bool)

(assert (=> b!46796 m!71789))

(declare-fun m!71791 () Bool)

(assert (=> b!46796 m!71791))

(declare-fun m!71793 () Bool)

(assert (=> b!46795 m!71793))

(declare-fun m!71795 () Bool)

(assert (=> b!46781 m!71795))

(assert (=> b!46781 m!71795))

(declare-fun m!71797 () Bool)

(assert (=> b!46781 m!71797))

(declare-fun m!71799 () Bool)

(assert (=> b!46781 m!71799))

(assert (=> b!46781 m!71799))

(declare-fun m!71801 () Bool)

(assert (=> b!46781 m!71801))

(declare-fun m!71803 () Bool)

(assert (=> b!46792 m!71803))

(declare-fun m!71805 () Bool)

(assert (=> start!9406 m!71805))

(declare-fun m!71807 () Bool)

(assert (=> start!9406 m!71807))

(declare-fun m!71809 () Bool)

(assert (=> b!46784 m!71809))

(declare-fun m!71811 () Bool)

(assert (=> b!46784 m!71811))

(declare-fun m!71813 () Bool)

(assert (=> b!46784 m!71813))

(assert (=> b!46784 m!71809))

(declare-fun m!71815 () Bool)

(assert (=> b!46784 m!71815))

(declare-fun m!71817 () Bool)

(assert (=> b!46784 m!71817))

(declare-fun m!71819 () Bool)

(assert (=> b!46797 m!71819))

(declare-fun m!71821 () Bool)

(assert (=> b!46797 m!71821))

(declare-fun m!71823 () Bool)

(assert (=> b!46793 m!71823))

(declare-fun m!71825 () Bool)

(assert (=> b!46787 m!71825))

(check-sat (not b!46781) (not b!46791) (not b!46794) (not b!46784) (not b!46797) (not b!46787) (not b!46792) (not b!46786) (not b!46793) (not b!46795) (not b!46796) (not b!46785) (not b!46783) (not b!46790) (not b!46782) (not start!9406) (not b!46788))
(check-sat)
(get-model)

(declare-fun d!13674 () Bool)

(assert (=> d!13674 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!72400 () Unit!3311)

(declare-fun choose!9 (BitStream!1806 array!2295 (_ BitVec 64) BitStream!1806) Unit!3311)

(assert (=> d!13674 (= lt!72400 (choose!9 thiss!1379 (buf!1386 (_2!2357 lt!72322)) (bvsub to!314 i!635) (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (=> d!13674 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1386 (_2!2357 lt!72322)) (bvsub to!314 i!635)) lt!72400)))

(declare-fun bs!3598 () Bool)

(assert (= bs!3598 d!13674))

(assert (=> bs!3598 m!71759))

(declare-fun m!71911 () Bool)

(assert (=> bs!3598 m!71911))

(assert (=> b!46790 d!13674))

(declare-fun d!13676 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!13676 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72339))))

(declare-fun bs!3599 () Bool)

(assert (= bs!3599 d!13676))

(declare-fun m!71913 () Bool)

(assert (=> bs!3599 m!71913))

(assert (=> b!46790 d!13676))

(declare-fun d!13678 () Bool)

(assert (=> d!13678 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339)))

(declare-fun lt!72401 () Unit!3311)

(assert (=> d!13678 (= lt!72401 (choose!9 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72322)) lt!72339 (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!13678 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72322)) lt!72339) lt!72401)))

(declare-fun bs!3600 () Bool)

(assert (= bs!3600 d!13678))

(assert (=> bs!3600 m!71761))

(declare-fun m!71915 () Bool)

(assert (=> bs!3600 m!71915))

(assert (=> b!46790 d!13678))

(declare-fun b!46864 () Bool)

(declare-fun e!31124 () Bool)

(declare-fun lt!72409 () List!544)

(assert (=> b!46864 (= e!31124 (> (length!239 lt!72409) 0))))

(declare-fun lt!72410 () (_ BitVec 64))

(declare-datatypes ((tuple2!4536 0))(
  ( (tuple2!4537 (_1!2361 Bool) (_2!2361 BitStream!1806)) )
))
(declare-fun lt!72408 () tuple2!4536)

(declare-fun b!46862 () Bool)

(declare-datatypes ((tuple2!4538 0))(
  ( (tuple2!4539 (_1!2362 List!544) (_2!2362 BitStream!1806)) )
))
(declare-fun e!31123 () tuple2!4538)

(assert (=> b!46862 (= e!31123 (tuple2!4539 (Cons!540 (_1!2361 lt!72408) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!72408) (bvsub lt!72339 lt!72410))) (_2!2361 lt!72408)))))

(declare-fun readBit!0 (BitStream!1806) tuple2!4536)

(assert (=> b!46862 (= lt!72408 (readBit!0 (_1!2358 lt!72332)))))

(assert (=> b!46862 (= lt!72410 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46861 () Bool)

(assert (=> b!46861 (= e!31123 (tuple2!4539 Nil!541 (_1!2358 lt!72332)))))

(declare-fun b!46863 () Bool)

(declare-fun isEmpty!137 (List!544) Bool)

(assert (=> b!46863 (= e!31124 (isEmpty!137 lt!72409))))

(declare-fun d!13680 () Bool)

(assert (=> d!13680 e!31124))

(declare-fun c!3179 () Bool)

(assert (=> d!13680 (= c!3179 (= lt!72339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13680 (= lt!72409 (_1!2362 e!31123))))

(declare-fun c!3180 () Bool)

(assert (=> d!13680 (= c!3180 (= lt!72339 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13680 (bvsge lt!72339 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13680 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72332) lt!72339) lt!72409)))

(assert (= (and d!13680 c!3180) b!46861))

(assert (= (and d!13680 (not c!3180)) b!46862))

(assert (= (and d!13680 c!3179) b!46863))

(assert (= (and d!13680 (not c!3179)) b!46864))

(declare-fun m!71917 () Bool)

(assert (=> b!46864 m!71917))

(declare-fun m!71919 () Bool)

(assert (=> b!46862 m!71919))

(declare-fun m!71921 () Bool)

(assert (=> b!46862 m!71921))

(declare-fun m!71923 () Bool)

(assert (=> b!46863 m!71923))

(assert (=> b!46790 d!13680))

(declare-fun b!46875 () Bool)

(declare-fun res!39553 () Bool)

(declare-fun e!31129 () Bool)

(assert (=> b!46875 (=> (not res!39553) (not e!31129))))

(declare-fun lt!72451 () tuple2!4530)

(assert (=> b!46875 (= res!39553 (isPrefixOf!0 (_2!2358 lt!72451) (_2!2357 lt!72322)))))

(declare-fun lt!72455 () (_ BitVec 64))

(declare-fun b!46876 () Bool)

(declare-fun lt!72458 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1806 (_ BitVec 64)) BitStream!1806)

(assert (=> b!46876 (= e!31129 (= (_1!2358 lt!72451) (withMovedBitIndex!0 (_2!2358 lt!72451) (bvsub lt!72455 lt!72458))))))

(assert (=> b!46876 (or (= (bvand lt!72455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72458 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72455 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72455 lt!72458) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46876 (= lt!72458 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322))))))

(assert (=> b!46876 (= lt!72455 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun b!46877 () Bool)

(declare-fun e!31130 () Unit!3311)

(declare-fun lt!72466 () Unit!3311)

(assert (=> b!46877 (= e!31130 lt!72466)))

(declare-fun lt!72461 () (_ BitVec 64))

(assert (=> b!46877 (= lt!72461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72468 () (_ BitVec 64))

(assert (=> b!46877 (= lt!72468 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2295 array!2295 (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> b!46877 (= lt!72466 (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) lt!72461 lt!72468))))

(declare-fun arrayBitRangesEq!0 (array!2295 array!2295 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46877 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 (_2!2357 lt!72328)) lt!72461 lt!72468)))

(declare-fun b!46878 () Bool)

(declare-fun res!39555 () Bool)

(assert (=> b!46878 (=> (not res!39555) (not e!31129))))

(assert (=> b!46878 (= res!39555 (isPrefixOf!0 (_1!2358 lt!72451) (_2!2357 lt!72328)))))

(declare-fun d!13682 () Bool)

(assert (=> d!13682 e!31129))

(declare-fun res!39554 () Bool)

(assert (=> d!13682 (=> (not res!39554) (not e!31129))))

(assert (=> d!13682 (= res!39554 (isPrefixOf!0 (_1!2358 lt!72451) (_2!2358 lt!72451)))))

(declare-fun lt!72457 () BitStream!1806)

(assert (=> d!13682 (= lt!72451 (tuple2!4531 lt!72457 (_2!2357 lt!72322)))))

(declare-fun lt!72469 () Unit!3311)

(declare-fun lt!72459 () Unit!3311)

(assert (=> d!13682 (= lt!72469 lt!72459)))

(assert (=> d!13682 (isPrefixOf!0 lt!72457 (_2!2357 lt!72322))))

(assert (=> d!13682 (= lt!72459 (lemmaIsPrefixTransitive!0 lt!72457 (_2!2357 lt!72322) (_2!2357 lt!72322)))))

(declare-fun lt!72465 () Unit!3311)

(declare-fun lt!72467 () Unit!3311)

(assert (=> d!13682 (= lt!72465 lt!72467)))

(assert (=> d!13682 (isPrefixOf!0 lt!72457 (_2!2357 lt!72322))))

(assert (=> d!13682 (= lt!72467 (lemmaIsPrefixTransitive!0 lt!72457 (_2!2357 lt!72328) (_2!2357 lt!72322)))))

(declare-fun lt!72460 () Unit!3311)

(assert (=> d!13682 (= lt!72460 e!31130)))

(declare-fun c!3183 () Bool)

(assert (=> d!13682 (= c!3183 (not (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000)))))

(declare-fun lt!72456 () Unit!3311)

(declare-fun lt!72454 () Unit!3311)

(assert (=> d!13682 (= lt!72456 lt!72454)))

(assert (=> d!13682 (isPrefixOf!0 (_2!2357 lt!72322) (_2!2357 lt!72322))))

(assert (=> d!13682 (= lt!72454 (lemmaIsPrefixRefl!0 (_2!2357 lt!72322)))))

(declare-fun lt!72453 () Unit!3311)

(declare-fun lt!72452 () Unit!3311)

(assert (=> d!13682 (= lt!72453 lt!72452)))

(assert (=> d!13682 (= lt!72452 (lemmaIsPrefixRefl!0 (_2!2357 lt!72322)))))

(declare-fun lt!72470 () Unit!3311)

(declare-fun lt!72464 () Unit!3311)

(assert (=> d!13682 (= lt!72470 lt!72464)))

(assert (=> d!13682 (isPrefixOf!0 lt!72457 lt!72457)))

(assert (=> d!13682 (= lt!72464 (lemmaIsPrefixRefl!0 lt!72457))))

(declare-fun lt!72463 () Unit!3311)

(declare-fun lt!72462 () Unit!3311)

(assert (=> d!13682 (= lt!72463 lt!72462)))

(assert (=> d!13682 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!13682 (= lt!72462 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(assert (=> d!13682 (= lt!72457 (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!13682 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72322))))

(assert (=> d!13682 (= (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72322)) lt!72451)))

(declare-fun b!46879 () Bool)

(declare-fun Unit!3315 () Unit!3311)

(assert (=> b!46879 (= e!31130 Unit!3315)))

(assert (= (and d!13682 c!3183) b!46877))

(assert (= (and d!13682 (not c!3183)) b!46879))

(assert (= (and d!13682 res!39554) b!46878))

(assert (= (and b!46878 res!39555) b!46875))

(assert (= (and b!46875 res!39553) b!46876))

(declare-fun m!71925 () Bool)

(assert (=> b!46875 m!71925))

(declare-fun m!71927 () Bool)

(assert (=> b!46878 m!71927))

(declare-fun m!71929 () Bool)

(assert (=> b!46876 m!71929))

(assert (=> b!46876 m!71751))

(assert (=> b!46876 m!71775))

(declare-fun m!71931 () Bool)

(assert (=> d!13682 m!71931))

(declare-fun m!71933 () Bool)

(assert (=> d!13682 m!71933))

(declare-fun m!71935 () Bool)

(assert (=> d!13682 m!71935))

(assert (=> d!13682 m!71791))

(declare-fun m!71937 () Bool)

(assert (=> d!13682 m!71937))

(declare-fun m!71939 () Bool)

(assert (=> d!13682 m!71939))

(declare-fun m!71941 () Bool)

(assert (=> d!13682 m!71941))

(declare-fun m!71943 () Bool)

(assert (=> d!13682 m!71943))

(declare-fun m!71945 () Bool)

(assert (=> d!13682 m!71945))

(declare-fun m!71947 () Bool)

(assert (=> d!13682 m!71947))

(declare-fun m!71949 () Bool)

(assert (=> d!13682 m!71949))

(assert (=> b!46877 m!71775))

(declare-fun m!71951 () Bool)

(assert (=> b!46877 m!71951))

(declare-fun m!71953 () Bool)

(assert (=> b!46877 m!71953))

(assert (=> b!46790 d!13682))

(declare-fun b!46883 () Bool)

(declare-fun e!31132 () Bool)

(declare-fun lt!72472 () List!544)

(assert (=> b!46883 (= e!31132 (> (length!239 lt!72472) 0))))

(declare-fun b!46881 () Bool)

(declare-fun lt!72473 () (_ BitVec 64))

(declare-fun lt!72471 () tuple2!4536)

(declare-fun e!31131 () tuple2!4538)

(assert (=> b!46881 (= e!31131 (tuple2!4539 (Cons!540 (_1!2361 lt!72471) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!72471) (bvsub (bvsub to!314 i!635) lt!72473))) (_2!2361 lt!72471)))))

(assert (=> b!46881 (= lt!72471 (readBit!0 (_1!2358 lt!72329)))))

(assert (=> b!46881 (= lt!72473 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46880 () Bool)

(assert (=> b!46880 (= e!31131 (tuple2!4539 Nil!541 (_1!2358 lt!72329)))))

(declare-fun b!46882 () Bool)

(assert (=> b!46882 (= e!31132 (isEmpty!137 lt!72472))))

(declare-fun d!13684 () Bool)

(assert (=> d!13684 e!31132))

(declare-fun c!3184 () Bool)

(assert (=> d!13684 (= c!3184 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13684 (= lt!72472 (_1!2362 e!31131))))

(declare-fun c!3185 () Bool)

(assert (=> d!13684 (= c!3185 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13684 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13684 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72329) (bvsub to!314 i!635)) lt!72472)))

(assert (= (and d!13684 c!3185) b!46880))

(assert (= (and d!13684 (not c!3185)) b!46881))

(assert (= (and d!13684 c!3184) b!46882))

(assert (= (and d!13684 (not c!3184)) b!46883))

(declare-fun m!71955 () Bool)

(assert (=> b!46883 m!71955))

(declare-fun m!71957 () Bool)

(assert (=> b!46881 m!71957))

(declare-fun m!71959 () Bool)

(assert (=> b!46881 m!71959))

(declare-fun m!71961 () Bool)

(assert (=> b!46882 m!71961))

(assert (=> b!46790 d!13684))

(declare-fun d!13686 () Bool)

(assert (=> d!13686 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3601 () Bool)

(assert (= bs!3601 d!13686))

(declare-fun m!71963 () Bool)

(assert (=> bs!3601 m!71963))

(assert (=> b!46790 d!13686))

(declare-fun b!46884 () Bool)

(declare-fun res!39556 () Bool)

(declare-fun e!31133 () Bool)

(assert (=> b!46884 (=> (not res!39556) (not e!31133))))

(declare-fun lt!72474 () tuple2!4530)

(assert (=> b!46884 (= res!39556 (isPrefixOf!0 (_2!2358 lt!72474) (_2!2357 lt!72322)))))

(declare-fun lt!72481 () (_ BitVec 64))

(declare-fun b!46885 () Bool)

(declare-fun lt!72478 () (_ BitVec 64))

(assert (=> b!46885 (= e!31133 (= (_1!2358 lt!72474) (withMovedBitIndex!0 (_2!2358 lt!72474) (bvsub lt!72478 lt!72481))))))

(assert (=> b!46885 (or (= (bvand lt!72478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72478 lt!72481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46885 (= lt!72481 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322))))))

(assert (=> b!46885 (= lt!72478 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!46886 () Bool)

(declare-fun e!31134 () Unit!3311)

(declare-fun lt!72489 () Unit!3311)

(assert (=> b!46886 (= e!31134 lt!72489)))

(declare-fun lt!72484 () (_ BitVec 64))

(assert (=> b!46886 (= lt!72484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72491 () (_ BitVec 64))

(assert (=> b!46886 (= lt!72491 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(assert (=> b!46886 (= lt!72489 (arrayBitRangesEqSymmetric!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) lt!72484 lt!72491))))

(assert (=> b!46886 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 thiss!1379) lt!72484 lt!72491)))

(declare-fun b!46887 () Bool)

(declare-fun res!39558 () Bool)

(assert (=> b!46887 (=> (not res!39558) (not e!31133))))

(assert (=> b!46887 (= res!39558 (isPrefixOf!0 (_1!2358 lt!72474) thiss!1379))))

(declare-fun d!13688 () Bool)

(assert (=> d!13688 e!31133))

(declare-fun res!39557 () Bool)

(assert (=> d!13688 (=> (not res!39557) (not e!31133))))

(assert (=> d!13688 (= res!39557 (isPrefixOf!0 (_1!2358 lt!72474) (_2!2358 lt!72474)))))

(declare-fun lt!72480 () BitStream!1806)

(assert (=> d!13688 (= lt!72474 (tuple2!4531 lt!72480 (_2!2357 lt!72322)))))

(declare-fun lt!72492 () Unit!3311)

(declare-fun lt!72482 () Unit!3311)

(assert (=> d!13688 (= lt!72492 lt!72482)))

(assert (=> d!13688 (isPrefixOf!0 lt!72480 (_2!2357 lt!72322))))

(assert (=> d!13688 (= lt!72482 (lemmaIsPrefixTransitive!0 lt!72480 (_2!2357 lt!72322) (_2!2357 lt!72322)))))

(declare-fun lt!72488 () Unit!3311)

(declare-fun lt!72490 () Unit!3311)

(assert (=> d!13688 (= lt!72488 lt!72490)))

(assert (=> d!13688 (isPrefixOf!0 lt!72480 (_2!2357 lt!72322))))

(assert (=> d!13688 (= lt!72490 (lemmaIsPrefixTransitive!0 lt!72480 thiss!1379 (_2!2357 lt!72322)))))

(declare-fun lt!72483 () Unit!3311)

(assert (=> d!13688 (= lt!72483 e!31134)))

(declare-fun c!3186 () Bool)

(assert (=> d!13688 (= c!3186 (not (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!72479 () Unit!3311)

(declare-fun lt!72477 () Unit!3311)

(assert (=> d!13688 (= lt!72479 lt!72477)))

(assert (=> d!13688 (isPrefixOf!0 (_2!2357 lt!72322) (_2!2357 lt!72322))))

(assert (=> d!13688 (= lt!72477 (lemmaIsPrefixRefl!0 (_2!2357 lt!72322)))))

(declare-fun lt!72476 () Unit!3311)

(declare-fun lt!72475 () Unit!3311)

(assert (=> d!13688 (= lt!72476 lt!72475)))

(assert (=> d!13688 (= lt!72475 (lemmaIsPrefixRefl!0 (_2!2357 lt!72322)))))

(declare-fun lt!72493 () Unit!3311)

(declare-fun lt!72487 () Unit!3311)

(assert (=> d!13688 (= lt!72493 lt!72487)))

(assert (=> d!13688 (isPrefixOf!0 lt!72480 lt!72480)))

(assert (=> d!13688 (= lt!72487 (lemmaIsPrefixRefl!0 lt!72480))))

(declare-fun lt!72486 () Unit!3311)

(declare-fun lt!72485 () Unit!3311)

(assert (=> d!13688 (= lt!72486 lt!72485)))

(assert (=> d!13688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13688 (= lt!72485 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13688 (= lt!72480 (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(assert (=> d!13688 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72322))))

(assert (=> d!13688 (= (reader!0 thiss!1379 (_2!2357 lt!72322)) lt!72474)))

(declare-fun b!46888 () Bool)

(declare-fun Unit!3316 () Unit!3311)

(assert (=> b!46888 (= e!31134 Unit!3316)))

(assert (= (and d!13688 c!3186) b!46886))

(assert (= (and d!13688 (not c!3186)) b!46888))

(assert (= (and d!13688 res!39557) b!46887))

(assert (= (and b!46887 res!39558) b!46884))

(assert (= (and b!46884 res!39556) b!46885))

(declare-fun m!71965 () Bool)

(assert (=> b!46884 m!71965))

(declare-fun m!71967 () Bool)

(assert (=> b!46887 m!71967))

(declare-fun m!71969 () Bool)

(assert (=> b!46885 m!71969))

(assert (=> b!46885 m!71751))

(assert (=> b!46885 m!71749))

(declare-fun m!71971 () Bool)

(assert (=> d!13688 m!71971))

(declare-fun m!71973 () Bool)

(assert (=> d!13688 m!71973))

(declare-fun m!71975 () Bool)

(assert (=> d!13688 m!71975))

(assert (=> d!13688 m!71781))

(declare-fun m!71977 () Bool)

(assert (=> d!13688 m!71977))

(assert (=> d!13688 m!71745))

(assert (=> d!13688 m!71941))

(declare-fun m!71979 () Bool)

(assert (=> d!13688 m!71979))

(declare-fun m!71981 () Bool)

(assert (=> d!13688 m!71981))

(assert (=> d!13688 m!71747))

(assert (=> d!13688 m!71949))

(assert (=> b!46886 m!71749))

(declare-fun m!71983 () Bool)

(assert (=> b!46886 m!71983))

(declare-fun m!71985 () Bool)

(assert (=> b!46886 m!71985))

(assert (=> b!46790 d!13688))

(declare-fun d!13690 () Bool)

(assert (=> d!13690 (= (invariant!0 (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72328)))) (and (bvsge (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (bvslt (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000001000) (bvsge (currentByte!2891 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72328)))) (and (= (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (= (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72328))))))))))

(assert (=> b!46787 d!13690))

(declare-fun d!13692 () Bool)

(declare-fun e!31137 () Bool)

(assert (=> d!13692 e!31137))

(declare-fun res!39563 () Bool)

(assert (=> d!13692 (=> (not res!39563) (not e!31137))))

(declare-fun lt!72509 () (_ BitVec 64))

(declare-fun lt!72508 () (_ BitVec 64))

(declare-fun lt!72506 () (_ BitVec 64))

(assert (=> d!13692 (= res!39563 (= lt!72506 (bvsub lt!72508 lt!72509)))))

(assert (=> d!13692 (or (= (bvand lt!72508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72509 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72508 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72508 lt!72509) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13692 (= lt!72509 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun lt!72511 () (_ BitVec 64))

(declare-fun lt!72510 () (_ BitVec 64))

(assert (=> d!13692 (= lt!72508 (bvmul lt!72511 lt!72510))))

(assert (=> d!13692 (or (= lt!72511 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72510 (bvsdiv (bvmul lt!72511 lt!72510) lt!72511)))))

(assert (=> d!13692 (= lt!72510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13692 (= lt!72511 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!13692 (= lt!72506 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!13692 (invariant!0 (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72328))))))

(assert (=> d!13692 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) lt!72506)))

(declare-fun b!46893 () Bool)

(declare-fun res!39564 () Bool)

(assert (=> b!46893 (=> (not res!39564) (not e!31137))))

(assert (=> b!46893 (= res!39564 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72506))))

(declare-fun b!46894 () Bool)

(declare-fun lt!72507 () (_ BitVec 64))

(assert (=> b!46894 (= e!31137 (bvsle lt!72506 (bvmul lt!72507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46894 (or (= lt!72507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72507)))))

(assert (=> b!46894 (= lt!72507 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (= (and d!13692 res!39563) b!46893))

(assert (= (and b!46893 res!39564) b!46894))

(declare-fun m!71987 () Bool)

(assert (=> d!13692 m!71987))

(assert (=> d!13692 m!71825))

(assert (=> b!46788 d!13692))

(declare-fun d!13694 () Bool)

(declare-fun size!1039 (List!544) Int)

(assert (=> d!13694 (= (length!239 lt!72323) (size!1039 lt!72323))))

(declare-fun bs!3602 () Bool)

(assert (= bs!3602 d!13694))

(declare-fun m!71989 () Bool)

(assert (=> bs!3602 m!71989))

(assert (=> b!46786 d!13694))

(declare-fun d!13696 () Bool)

(assert (=> d!13696 (= (array_inv!956 srcBuffer!2) (bvsge (size!1037 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!9406 d!13696))

(declare-fun d!13698 () Bool)

(assert (=> d!13698 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379) (size!1037 (buf!1386 thiss!1379))))))

(declare-fun bs!3603 () Bool)

(assert (= bs!3603 d!13698))

(declare-fun m!71991 () Bool)

(assert (=> bs!3603 m!71991))

(assert (=> start!9406 d!13698))

(declare-fun d!13700 () Bool)

(assert (=> d!13700 (= (tail!230 lt!72323) (t!1294 lt!72323))))

(assert (=> b!46797 d!13700))

(declare-fun d!13702 () Bool)

(declare-fun e!31140 () Bool)

(assert (=> d!13702 e!31140))

(declare-fun res!39567 () Bool)

(assert (=> d!13702 (=> (not res!39567) (not e!31140))))

(declare-fun lt!72517 () (_ BitVec 64))

(assert (=> d!13702 (= res!39567 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72517 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!72517) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13702 (= lt!72517 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72516 () Unit!3311)

(declare-fun choose!42 (BitStream!1806 BitStream!1806 BitStream!1806 BitStream!1806 (_ BitVec 64) List!544) Unit!3311)

(assert (=> d!13702 (= lt!72516 (choose!42 (_2!2357 lt!72322) (_2!2357 lt!72322) (_1!2358 lt!72329) (_1!2358 lt!72332) (bvsub to!314 i!635) lt!72323))))

(assert (=> d!13702 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13702 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2357 lt!72322) (_2!2357 lt!72322) (_1!2358 lt!72329) (_1!2358 lt!72332) (bvsub to!314 i!635) lt!72323) lt!72516)))

(declare-fun b!46897 () Bool)

(assert (=> b!46897 (= e!31140 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72332) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!230 lt!72323)))))

(assert (= (and d!13702 res!39567) b!46897))

(declare-fun m!71993 () Bool)

(assert (=> d!13702 m!71993))

(declare-fun m!71995 () Bool)

(assert (=> b!46897 m!71995))

(assert (=> b!46897 m!71819))

(assert (=> b!46797 d!13702))

(declare-fun d!13704 () Bool)

(assert (=> d!13704 (= (array_inv!956 (buf!1386 thiss!1379)) (bvsge (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!46795 d!13704))

(declare-fun d!13706 () Bool)

(assert (=> d!13706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!3604 () Bool)

(assert (= bs!3604 d!13706))

(declare-fun m!71997 () Bool)

(assert (=> bs!3604 m!71997))

(assert (=> b!46796 d!13706))

(declare-fun d!13708 () Bool)

(declare-fun res!39574 () Bool)

(declare-fun e!31146 () Bool)

(assert (=> d!13708 (=> (not res!39574) (not e!31146))))

(assert (=> d!13708 (= res!39574 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!13708 (= (isPrefixOf!0 thiss!1379 (_2!2357 lt!72322)) e!31146)))

(declare-fun b!46904 () Bool)

(declare-fun res!39576 () Bool)

(assert (=> b!46904 (=> (not res!39576) (not e!31146))))

(assert (=> b!46904 (= res!39576 (bvsle (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!46905 () Bool)

(declare-fun e!31145 () Bool)

(assert (=> b!46905 (= e!31146 e!31145)))

(declare-fun res!39575 () Bool)

(assert (=> b!46905 (=> res!39575 e!31145)))

(assert (=> b!46905 (= res!39575 (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46906 () Bool)

(assert (=> b!46906 (= e!31145 (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (= (and d!13708 res!39574) b!46904))

(assert (= (and b!46904 res!39576) b!46905))

(assert (= (and b!46905 (not res!39575)) b!46906))

(assert (=> b!46904 m!71749))

(assert (=> b!46904 m!71751))

(assert (=> b!46906 m!71749))

(assert (=> b!46906 m!71749))

(declare-fun m!71999 () Bool)

(assert (=> b!46906 m!71999))

(assert (=> b!46796 d!13708))

(declare-fun d!13710 () Bool)

(assert (=> d!13710 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72518 () Unit!3311)

(assert (=> d!13710 (= lt!72518 (choose!9 thiss!1379 (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1807 (buf!1386 (_2!2357 lt!72328)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (=> d!13710 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72518)))

(declare-fun bs!3605 () Bool)

(assert (= bs!3605 d!13710))

(assert (=> bs!3605 m!71787))

(declare-fun m!72001 () Bool)

(assert (=> bs!3605 m!72001))

(assert (=> b!46796 d!13710))

(declare-fun b!46923 () Bool)

(declare-fun e!31153 () Bool)

(declare-fun lt!72616 () (_ BitVec 64))

(assert (=> b!46923 (= e!31153 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72616))))

(declare-fun e!31155 () Bool)

(declare-fun lt!72625 () tuple2!4528)

(declare-fun b!46924 () Bool)

(declare-fun lt!72622 () tuple2!4530)

(assert (=> b!46924 (= e!31155 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72625) (_1!2358 lt!72622) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2357 lt!72625) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!46924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72641 () Unit!3311)

(declare-fun lt!72623 () Unit!3311)

(assert (=> b!46924 (= lt!72641 lt!72623)))

(assert (=> b!46924 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72616)))

(assert (=> b!46924 (= lt!72623 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72625)) lt!72616))))

(assert (=> b!46924 e!31153))

(declare-fun res!39591 () Bool)

(assert (=> b!46924 (=> (not res!39591) (not e!31153))))

(assert (=> b!46924 (= res!39591 (and (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72625)))) (bvsge lt!72616 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46924 (= lt!72616 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!46924 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46924 (= lt!72622 (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72625)))))

(declare-fun b!46925 () Bool)

(declare-fun res!39590 () Bool)

(assert (=> b!46925 (=> (not res!39590) (not e!31155))))

(assert (=> b!46925 (= res!39590 (invariant!0 (currentBit!2886 (_2!2357 lt!72625)) (currentByte!2891 (_2!2357 lt!72625)) (size!1037 (buf!1386 (_2!2357 lt!72625)))))))

(declare-fun b!46926 () Bool)

(declare-fun res!39594 () Bool)

(assert (=> b!46926 (=> (not res!39594) (not e!31155))))

(assert (=> b!46926 (= res!39594 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72625)))))))

(declare-fun b!46927 () Bool)

(declare-fun e!31154 () tuple2!4528)

(declare-fun Unit!3317 () Unit!3311)

(assert (=> b!46927 (= e!31154 (tuple2!4529 Unit!3317 (_2!2357 lt!72328)))))

(assert (=> b!46927 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72328))))))

(declare-fun lt!72643 () Unit!3311)

(declare-fun Unit!3318 () Unit!3311)

(assert (=> b!46927 (= lt!72643 Unit!3318)))

(declare-fun call!565 () tuple2!4530)

(declare-fun checkByteArrayBitContent!0 (BitStream!1806 array!2295 array!2295 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!4540 0))(
  ( (tuple2!4541 (_1!2363 array!2295) (_2!2363 BitStream!1806)) )
))
(declare-fun readBits!0 (BitStream!1806 (_ BitVec 64)) tuple2!4540)

(assert (=> b!46927 (checkByteArrayBitContent!0 (_2!2357 lt!72328) srcBuffer!2 (_1!2363 (readBits!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!46928 () Bool)

(declare-fun res!39593 () Bool)

(assert (=> b!46928 (=> (not res!39593) (not e!31155))))

(assert (=> b!46928 (= res!39593 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72625)))))

(declare-fun d!13712 () Bool)

(assert (=> d!13712 e!31155))

(declare-fun res!39589 () Bool)

(assert (=> d!13712 (=> (not res!39589) (not e!31155))))

(declare-fun lt!72621 () (_ BitVec 64))

(assert (=> d!13712 (= res!39589 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72625))) (currentByte!2891 (_2!2357 lt!72625)) (currentBit!2886 (_2!2357 lt!72625))) (bvsub lt!72621 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!13712 (or (= (bvand lt!72621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72621 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!72624 () (_ BitVec 64))

(assert (=> d!13712 (= lt!72621 (bvadd lt!72624 to!314))))

(assert (=> d!13712 (or (not (= (bvand lt!72624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!72624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!72624 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13712 (= lt!72624 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!13712 (= lt!72625 e!31154)))

(declare-fun c!3189 () Bool)

(assert (=> d!13712 (= c!3189 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!72618 () Unit!3311)

(declare-fun lt!72638 () Unit!3311)

(assert (=> d!13712 (= lt!72618 lt!72638)))

(assert (=> d!13712 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!13712 (= lt!72638 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(declare-fun lt!72650 () (_ BitVec 64))

(assert (=> d!13712 (= lt!72650 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!13712 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13712 (= (appendBitsMSBFirstLoop!0 (_2!2357 lt!72328) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!72625)))

(declare-fun bm!562 () Bool)

(declare-fun lt!72630 () tuple2!4528)

(assert (=> bm!562 (= call!565 (reader!0 (_2!2357 lt!72328) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun b!46929 () Bool)

(declare-fun res!39592 () Bool)

(assert (=> b!46929 (=> (not res!39592) (not e!31155))))

(assert (=> b!46929 (= res!39592 (= (size!1037 (buf!1386 (_2!2357 lt!72625))) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(declare-fun b!46930 () Bool)

(declare-fun Unit!3319 () Unit!3311)

(assert (=> b!46930 (= e!31154 (tuple2!4529 Unit!3319 (_2!2357 lt!72630)))))

(declare-fun lt!72615 () tuple2!4528)

(assert (=> b!46930 (= lt!72615 (appendBitFromByte!0 (_2!2357 lt!72328) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!72607 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72607 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72633 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72633 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72639 () Unit!3311)

(assert (=> b!46930 (= lt!72639 (validateOffsetBitsIneqLemma!0 (_2!2357 lt!72328) (_2!2357 lt!72615) lt!72607 lt!72633))))

(assert (=> b!46930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) (bvsub lt!72607 lt!72633))))

(declare-fun lt!72648 () Unit!3311)

(assert (=> b!46930 (= lt!72648 lt!72639)))

(declare-fun lt!72609 () tuple2!4530)

(assert (=> b!46930 (= lt!72609 (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72615)))))

(declare-fun lt!72617 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72617 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!72619 () Unit!3311)

(assert (=> b!46930 (= lt!72619 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72615)) lt!72617))))

(assert (=> b!46930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72617)))

(declare-fun lt!72637 () Unit!3311)

(assert (=> b!46930 (= lt!72637 lt!72619)))

(assert (=> b!46930 (= (head!363 (byteArrayBitContentToList!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!363 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72615) (_1!2358 lt!72609) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72636 () Unit!3311)

(declare-fun Unit!3320 () Unit!3311)

(assert (=> b!46930 (= lt!72636 Unit!3320)))

(assert (=> b!46930 (= lt!72630 (appendBitsMSBFirstLoop!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!72611 () Unit!3311)

(assert (=> b!46930 (= lt!72611 (lemmaIsPrefixTransitive!0 (_2!2357 lt!72328) (_2!2357 lt!72615) (_2!2357 lt!72630)))))

(assert (=> b!46930 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72630))))

(declare-fun lt!72628 () Unit!3311)

(assert (=> b!46930 (= lt!72628 lt!72611)))

(assert (=> b!46930 (= (size!1037 (buf!1386 (_2!2357 lt!72630))) (size!1037 (buf!1386 (_2!2357 lt!72328))))))

(declare-fun lt!72614 () Unit!3311)

(declare-fun Unit!3321 () Unit!3311)

(assert (=> b!46930 (= lt!72614 Unit!3321)))

(assert (=> b!46930 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72630))) (currentByte!2891 (_2!2357 lt!72630)) (currentBit!2886 (_2!2357 lt!72630))) (bvsub (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72647 () Unit!3311)

(declare-fun Unit!3322 () Unit!3311)

(assert (=> b!46930 (= lt!72647 Unit!3322)))

(assert (=> b!46930 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72630))) (currentByte!2891 (_2!2357 lt!72630)) (currentBit!2886 (_2!2357 lt!72630))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72626 () Unit!3311)

(declare-fun Unit!3323 () Unit!3311)

(assert (=> b!46930 (= lt!72626 Unit!3323)))

(declare-fun lt!72620 () tuple2!4530)

(assert (=> b!46930 (= lt!72620 call!565)))

(declare-fun lt!72610 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72610 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72629 () Unit!3311)

(assert (=> b!46930 (= lt!72629 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72630)) lt!72610))))

(assert (=> b!46930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72610)))

(declare-fun lt!72649 () Unit!3311)

(assert (=> b!46930 (= lt!72649 lt!72629)))

(declare-fun lt!72631 () tuple2!4530)

(assert (=> b!46930 (= lt!72631 (reader!0 (_2!2357 lt!72615) (_2!2357 lt!72630)))))

(declare-fun lt!72612 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72612 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!72646 () Unit!3311)

(assert (=> b!46930 (= lt!72646 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!72630)) lt!72612))))

(assert (=> b!46930 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!72612)))

(declare-fun lt!72642 () Unit!3311)

(assert (=> b!46930 (= lt!72642 lt!72646)))

(declare-fun lt!72640 () List!544)

(assert (=> b!46930 (= lt!72640 (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72645 () List!544)

(assert (=> b!46930 (= lt!72645 (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72613 () List!544)

(assert (=> b!46930 (= lt!72613 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72620) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!72644 () List!544)

(assert (=> b!46930 (= lt!72644 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72631) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!72635 () (_ BitVec 64))

(assert (=> b!46930 (= lt!72635 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!72627 () Unit!3311)

(assert (=> b!46930 (= lt!72627 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2357 lt!72630) (_2!2357 lt!72630) (_1!2358 lt!72620) (_1!2358 lt!72631) lt!72635 lt!72613))))

(assert (=> b!46930 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72631) (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!230 lt!72613))))

(declare-fun lt!72634 () Unit!3311)

(assert (=> b!46930 (= lt!72634 lt!72627)))

(declare-fun lt!72608 () Unit!3311)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2295 array!2295 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> b!46930 (= lt!72608 (arrayBitRangesEqImpliesEq!0 (buf!1386 (_2!2357 lt!72615)) (buf!1386 (_2!2357 lt!72630)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72650 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615)))))))

(assert (=> b!46930 (= (bitAt!0 (buf!1386 (_2!2357 lt!72615)) lt!72650) (bitAt!0 (buf!1386 (_2!2357 lt!72630)) lt!72650))))

(declare-fun lt!72632 () Unit!3311)

(assert (=> b!46930 (= lt!72632 lt!72608)))

(assert (= (and d!13712 c!3189) b!46930))

(assert (= (and d!13712 (not c!3189)) b!46927))

(assert (= (or b!46930 b!46927) bm!562))

(assert (= (and d!13712 res!39589) b!46925))

(assert (= (and b!46925 res!39590) b!46926))

(assert (= (and b!46926 res!39594) b!46928))

(assert (= (and b!46928 res!39593) b!46929))

(assert (= (and b!46929 res!39592) b!46924))

(assert (= (and b!46924 res!39591) b!46923))

(declare-fun m!72003 () Bool)

(assert (=> b!46930 m!72003))

(declare-fun m!72005 () Bool)

(assert (=> b!46930 m!72005))

(declare-fun m!72007 () Bool)

(assert (=> b!46930 m!72007))

(declare-fun m!72009 () Bool)

(assert (=> b!46930 m!72009))

(assert (=> b!46930 m!71775))

(declare-fun m!72011 () Bool)

(assert (=> b!46930 m!72011))

(declare-fun m!72013 () Bool)

(assert (=> b!46930 m!72013))

(declare-fun m!72015 () Bool)

(assert (=> b!46930 m!72015))

(declare-fun m!72017 () Bool)

(assert (=> b!46930 m!72017))

(declare-fun m!72019 () Bool)

(assert (=> b!46930 m!72019))

(declare-fun m!72021 () Bool)

(assert (=> b!46930 m!72021))

(declare-fun m!72023 () Bool)

(assert (=> b!46930 m!72023))

(declare-fun m!72025 () Bool)

(assert (=> b!46930 m!72025))

(declare-fun m!72027 () Bool)

(assert (=> b!46930 m!72027))

(declare-fun m!72029 () Bool)

(assert (=> b!46930 m!72029))

(declare-fun m!72031 () Bool)

(assert (=> b!46930 m!72031))

(declare-fun m!72033 () Bool)

(assert (=> b!46930 m!72033))

(declare-fun m!72035 () Bool)

(assert (=> b!46930 m!72035))

(declare-fun m!72037 () Bool)

(assert (=> b!46930 m!72037))

(declare-fun m!72039 () Bool)

(assert (=> b!46930 m!72039))

(declare-fun m!72041 () Bool)

(assert (=> b!46930 m!72041))

(declare-fun m!72043 () Bool)

(assert (=> b!46930 m!72043))

(declare-fun m!72045 () Bool)

(assert (=> b!46930 m!72045))

(assert (=> b!46930 m!72011))

(declare-fun m!72047 () Bool)

(assert (=> b!46930 m!72047))

(declare-fun m!72049 () Bool)

(assert (=> b!46930 m!72049))

(declare-fun m!72051 () Bool)

(assert (=> b!46930 m!72051))

(declare-fun m!72053 () Bool)

(assert (=> b!46930 m!72053))

(declare-fun m!72055 () Bool)

(assert (=> b!46930 m!72055))

(assert (=> b!46930 m!72023))

(declare-fun m!72057 () Bool)

(assert (=> b!46930 m!72057))

(declare-fun m!72059 () Bool)

(assert (=> b!46930 m!72059))

(declare-fun m!72061 () Bool)

(assert (=> b!46930 m!72061))

(assert (=> b!46930 m!72003))

(declare-fun m!72063 () Bool)

(assert (=> b!46930 m!72063))

(assert (=> b!46930 m!72029))

(declare-fun m!72065 () Bool)

(assert (=> b!46927 m!72065))

(declare-fun m!72067 () Bool)

(assert (=> b!46927 m!72067))

(declare-fun m!72069 () Bool)

(assert (=> bm!562 m!72069))

(declare-fun m!72071 () Bool)

(assert (=> b!46924 m!72071))

(declare-fun m!72073 () Bool)

(assert (=> b!46924 m!72073))

(declare-fun m!72075 () Bool)

(assert (=> b!46924 m!72075))

(declare-fun m!72077 () Bool)

(assert (=> b!46924 m!72077))

(declare-fun m!72079 () Bool)

(assert (=> b!46924 m!72079))

(declare-fun m!72081 () Bool)

(assert (=> b!46928 m!72081))

(declare-fun m!72083 () Bool)

(assert (=> d!13712 m!72083))

(assert (=> d!13712 m!71775))

(assert (=> d!13712 m!71939))

(assert (=> d!13712 m!71947))

(declare-fun m!72085 () Bool)

(assert (=> b!46925 m!72085))

(declare-fun m!72087 () Bool)

(assert (=> b!46923 m!72087))

(assert (=> b!46796 d!13712))

(declare-fun d!13714 () Bool)

(declare-fun res!39595 () Bool)

(declare-fun e!31157 () Bool)

(assert (=> d!13714 (=> (not res!39595) (not e!31157))))

(assert (=> d!13714 (= res!39595 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!13714 (= (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72322)) e!31157)))

(declare-fun b!46931 () Bool)

(declare-fun res!39597 () Bool)

(assert (=> b!46931 (=> (not res!39597) (not e!31157))))

(assert (=> b!46931 (= res!39597 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!46932 () Bool)

(declare-fun e!31156 () Bool)

(assert (=> b!46932 (= e!31157 e!31156)))

(declare-fun res!39596 () Bool)

(assert (=> b!46932 (=> res!39596 e!31156)))

(assert (=> b!46932 (= res!39596 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000))))

(declare-fun b!46933 () Bool)

(assert (=> b!46933 (= e!31156 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (= (and d!13714 res!39595) b!46931))

(assert (= (and b!46931 res!39597) b!46932))

(assert (= (and b!46932 (not res!39596)) b!46933))

(assert (=> b!46931 m!71775))

(assert (=> b!46931 m!71751))

(assert (=> b!46933 m!71775))

(assert (=> b!46933 m!71775))

(declare-fun m!72089 () Bool)

(assert (=> b!46933 m!72089))

(assert (=> b!46796 d!13714))

(declare-fun d!13716 () Bool)

(assert (=> d!13716 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72322))))

(declare-fun lt!72653 () Unit!3311)

(declare-fun choose!30 (BitStream!1806 BitStream!1806 BitStream!1806) Unit!3311)

(assert (=> d!13716 (= lt!72653 (choose!30 thiss!1379 (_2!2357 lt!72328) (_2!2357 lt!72322)))))

(assert (=> d!13716 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72328))))

(assert (=> d!13716 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2357 lt!72328) (_2!2357 lt!72322)) lt!72653)))

(declare-fun bs!3606 () Bool)

(assert (= bs!3606 d!13716))

(assert (=> bs!3606 m!71781))

(declare-fun m!72091 () Bool)

(assert (=> bs!3606 m!72091))

(assert (=> bs!3606 m!71813))

(assert (=> b!46796 d!13716))

(declare-fun b!46934 () Bool)

(declare-fun res!39598 () Bool)

(declare-fun e!31158 () Bool)

(assert (=> b!46934 (=> (not res!39598) (not e!31158))))

(declare-fun lt!72654 () tuple2!4530)

(assert (=> b!46934 (= res!39598 (isPrefixOf!0 (_2!2358 lt!72654) (_2!2357 lt!72328)))))

(declare-fun lt!72661 () (_ BitVec 64))

(declare-fun lt!72658 () (_ BitVec 64))

(declare-fun b!46935 () Bool)

(assert (=> b!46935 (= e!31158 (= (_1!2358 lt!72654) (withMovedBitIndex!0 (_2!2358 lt!72654) (bvsub lt!72658 lt!72661))))))

(assert (=> b!46935 (or (= (bvand lt!72658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72661 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72658 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72658 lt!72661) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46935 (= lt!72661 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> b!46935 (= lt!72658 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!46936 () Bool)

(declare-fun e!31159 () Unit!3311)

(declare-fun lt!72669 () Unit!3311)

(assert (=> b!46936 (= e!31159 lt!72669)))

(declare-fun lt!72664 () (_ BitVec 64))

(assert (=> b!46936 (= lt!72664 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!72671 () (_ BitVec 64))

(assert (=> b!46936 (= lt!72671 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(assert (=> b!46936 (= lt!72669 (arrayBitRangesEqSymmetric!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) lt!72664 lt!72671))))

(assert (=> b!46936 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 thiss!1379) lt!72664 lt!72671)))

(declare-fun b!46937 () Bool)

(declare-fun res!39600 () Bool)

(assert (=> b!46937 (=> (not res!39600) (not e!31158))))

(assert (=> b!46937 (= res!39600 (isPrefixOf!0 (_1!2358 lt!72654) thiss!1379))))

(declare-fun d!13718 () Bool)

(assert (=> d!13718 e!31158))

(declare-fun res!39599 () Bool)

(assert (=> d!13718 (=> (not res!39599) (not e!31158))))

(assert (=> d!13718 (= res!39599 (isPrefixOf!0 (_1!2358 lt!72654) (_2!2358 lt!72654)))))

(declare-fun lt!72660 () BitStream!1806)

(assert (=> d!13718 (= lt!72654 (tuple2!4531 lt!72660 (_2!2357 lt!72328)))))

(declare-fun lt!72672 () Unit!3311)

(declare-fun lt!72662 () Unit!3311)

(assert (=> d!13718 (= lt!72672 lt!72662)))

(assert (=> d!13718 (isPrefixOf!0 lt!72660 (_2!2357 lt!72328))))

(assert (=> d!13718 (= lt!72662 (lemmaIsPrefixTransitive!0 lt!72660 (_2!2357 lt!72328) (_2!2357 lt!72328)))))

(declare-fun lt!72668 () Unit!3311)

(declare-fun lt!72670 () Unit!3311)

(assert (=> d!13718 (= lt!72668 lt!72670)))

(assert (=> d!13718 (isPrefixOf!0 lt!72660 (_2!2357 lt!72328))))

(assert (=> d!13718 (= lt!72670 (lemmaIsPrefixTransitive!0 lt!72660 thiss!1379 (_2!2357 lt!72328)))))

(declare-fun lt!72663 () Unit!3311)

(assert (=> d!13718 (= lt!72663 e!31159)))

(declare-fun c!3190 () Bool)

(assert (=> d!13718 (= c!3190 (not (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!72659 () Unit!3311)

(declare-fun lt!72657 () Unit!3311)

(assert (=> d!13718 (= lt!72659 lt!72657)))

(assert (=> d!13718 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!13718 (= lt!72657 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(declare-fun lt!72656 () Unit!3311)

(declare-fun lt!72655 () Unit!3311)

(assert (=> d!13718 (= lt!72656 lt!72655)))

(assert (=> d!13718 (= lt!72655 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(declare-fun lt!72673 () Unit!3311)

(declare-fun lt!72667 () Unit!3311)

(assert (=> d!13718 (= lt!72673 lt!72667)))

(assert (=> d!13718 (isPrefixOf!0 lt!72660 lt!72660)))

(assert (=> d!13718 (= lt!72667 (lemmaIsPrefixRefl!0 lt!72660))))

(declare-fun lt!72666 () Unit!3311)

(declare-fun lt!72665 () Unit!3311)

(assert (=> d!13718 (= lt!72666 lt!72665)))

(assert (=> d!13718 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!13718 (= lt!72665 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!13718 (= lt!72660 (BitStream!1807 (buf!1386 (_2!2357 lt!72328)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(assert (=> d!13718 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72328))))

(assert (=> d!13718 (= (reader!0 thiss!1379 (_2!2357 lt!72328)) lt!72654)))

(declare-fun b!46938 () Bool)

(declare-fun Unit!3324 () Unit!3311)

(assert (=> b!46938 (= e!31159 Unit!3324)))

(assert (= (and d!13718 c!3190) b!46936))

(assert (= (and d!13718 (not c!3190)) b!46938))

(assert (= (and d!13718 res!39599) b!46937))

(assert (= (and b!46937 res!39600) b!46934))

(assert (= (and b!46934 res!39598) b!46935))

(declare-fun m!72093 () Bool)

(assert (=> b!46934 m!72093))

(declare-fun m!72095 () Bool)

(assert (=> b!46937 m!72095))

(declare-fun m!72097 () Bool)

(assert (=> b!46935 m!72097))

(assert (=> b!46935 m!71775))

(assert (=> b!46935 m!71749))

(declare-fun m!72099 () Bool)

(assert (=> d!13718 m!72099))

(declare-fun m!72101 () Bool)

(assert (=> d!13718 m!72101))

(declare-fun m!72103 () Bool)

(assert (=> d!13718 m!72103))

(assert (=> d!13718 m!71813))

(declare-fun m!72105 () Bool)

(assert (=> d!13718 m!72105))

(assert (=> d!13718 m!71745))

(assert (=> d!13718 m!71939))

(declare-fun m!72107 () Bool)

(assert (=> d!13718 m!72107))

(declare-fun m!72109 () Bool)

(assert (=> d!13718 m!72109))

(assert (=> d!13718 m!71747))

(assert (=> d!13718 m!71947))

(assert (=> b!46936 m!71749))

(declare-fun m!72111 () Bool)

(assert (=> b!46936 m!72111))

(declare-fun m!72113 () Bool)

(assert (=> b!46936 m!72113))

(assert (=> b!46796 d!13718))

(declare-fun d!13720 () Bool)

(assert (=> d!13720 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!3607 () Bool)

(assert (= bs!3607 d!13720))

(declare-fun m!72115 () Bool)

(assert (=> bs!3607 m!72115))

(assert (=> b!46785 d!13720))

(declare-fun d!13722 () Bool)

(declare-fun e!31160 () Bool)

(assert (=> d!13722 e!31160))

(declare-fun res!39601 () Bool)

(assert (=> d!13722 (=> (not res!39601) (not e!31160))))

(declare-fun lt!72676 () (_ BitVec 64))

(declare-fun lt!72674 () (_ BitVec 64))

(declare-fun lt!72677 () (_ BitVec 64))

(assert (=> d!13722 (= res!39601 (= lt!72674 (bvsub lt!72676 lt!72677)))))

(assert (=> d!13722 (or (= (bvand lt!72676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72677 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72676 lt!72677) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13722 (= lt!72677 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72322))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun lt!72679 () (_ BitVec 64))

(declare-fun lt!72678 () (_ BitVec 64))

(assert (=> d!13722 (= lt!72676 (bvmul lt!72679 lt!72678))))

(assert (=> d!13722 (or (= lt!72679 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72678 (bvsdiv (bvmul lt!72679 lt!72678) lt!72679)))))

(assert (=> d!13722 (= lt!72678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13722 (= lt!72679 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!13722 (= lt!72674 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72322)))))))

(assert (=> d!13722 (invariant!0 (currentBit!2886 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72322)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))

(assert (=> d!13722 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322))) lt!72674)))

(declare-fun b!46939 () Bool)

(declare-fun res!39602 () Bool)

(assert (=> b!46939 (=> (not res!39602) (not e!31160))))

(assert (=> b!46939 (= res!39602 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72674))))

(declare-fun b!46940 () Bool)

(declare-fun lt!72675 () (_ BitVec 64))

(assert (=> b!46940 (= e!31160 (bvsle lt!72674 (bvmul lt!72675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46940 (or (= lt!72675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72675)))))

(assert (=> b!46940 (= lt!72675 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (= (and d!13722 res!39601) b!46939))

(assert (= (and b!46939 res!39602) b!46940))

(declare-fun m!72117 () Bool)

(assert (=> d!13722 m!72117))

(assert (=> d!13722 m!71743))

(assert (=> b!46794 d!13722))

(declare-fun d!13724 () Bool)

(assert (=> d!13724 (= (bitAt!0 (buf!1386 (_1!2358 lt!72332)) lt!72325) (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) ((_ extract 31 0) (bvsdiv lt!72325 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72325 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3608 () Bool)

(assert (= bs!3608 d!13724))

(declare-fun m!72119 () Bool)

(assert (=> bs!3608 m!72119))

(declare-fun m!72121 () Bool)

(assert (=> bs!3608 m!72121))

(assert (=> b!46783 d!13724))

(declare-fun d!13726 () Bool)

(assert (=> d!13726 (= (bitAt!0 (buf!1386 (_1!2358 lt!72329)) lt!72325) (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) ((_ extract 31 0) (bvsdiv lt!72325 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72325 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3609 () Bool)

(assert (= bs!3609 d!13726))

(declare-fun m!72123 () Bool)

(assert (=> bs!3609 m!72123))

(assert (=> bs!3609 m!72121))

(assert (=> b!46783 d!13726))

(declare-fun d!13728 () Bool)

(declare-fun res!39603 () Bool)

(declare-fun e!31162 () Bool)

(assert (=> d!13728 (=> (not res!39603) (not e!31162))))

(assert (=> d!13728 (= res!39603 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!13728 (= (isPrefixOf!0 thiss!1379 (_2!2357 lt!72328)) e!31162)))

(declare-fun b!46941 () Bool)

(declare-fun res!39605 () Bool)

(assert (=> b!46941 (=> (not res!39605) (not e!31162))))

(assert (=> b!46941 (= res!39605 (bvsle (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!46942 () Bool)

(declare-fun e!31161 () Bool)

(assert (=> b!46942 (= e!31162 e!31161)))

(declare-fun res!39604 () Bool)

(assert (=> b!46942 (=> res!39604 e!31161)))

(assert (=> b!46942 (= res!39604 (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46943 () Bool)

(assert (=> b!46943 (= e!31161 (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (= (and d!13728 res!39603) b!46941))

(assert (= (and b!46941 res!39605) b!46942))

(assert (= (and b!46942 (not res!39604)) b!46943))

(assert (=> b!46941 m!71749))

(assert (=> b!46941 m!71775))

(assert (=> b!46943 m!71749))

(assert (=> b!46943 m!71749))

(declare-fun m!72125 () Bool)

(assert (=> b!46943 m!72125))

(assert (=> b!46784 d!13728))

(declare-fun d!13730 () Bool)

(assert (=> d!13730 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72339))))

(declare-fun bs!3610 () Bool)

(assert (= bs!3610 d!13730))

(assert (=> bs!3610 m!71987))

(assert (=> b!46784 d!13730))

(declare-fun d!13732 () Bool)

(declare-fun e!31165 () Bool)

(assert (=> d!13732 e!31165))

(declare-fun res!39608 () Bool)

(assert (=> d!13732 (=> (not res!39608) (not e!31165))))

(assert (=> d!13732 (= res!39608 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!72682 () Unit!3311)

(declare-fun choose!27 (BitStream!1806 BitStream!1806 (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> d!13732 (= lt!72682 (choose!27 thiss!1379 (_2!2357 lt!72328) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!13732 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!13732 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2357 lt!72328) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72682)))

(declare-fun b!46946 () Bool)

(assert (=> b!46946 (= e!31165 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!13732 res!39608) b!46946))

(declare-fun m!72127 () Bool)

(assert (=> d!13732 m!72127))

(declare-fun m!72129 () Bool)

(assert (=> b!46946 m!72129))

(assert (=> b!46784 d!13732))

(declare-fun b!46964 () Bool)

(declare-fun res!39625 () Bool)

(declare-fun e!31176 () Bool)

(assert (=> b!46964 (=> (not res!39625) (not e!31176))))

(declare-fun lt!72712 () tuple2!4528)

(assert (=> b!46964 (= res!39625 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72712)))))

(declare-fun b!46965 () Bool)

(declare-fun res!39632 () Bool)

(declare-fun e!31175 () Bool)

(assert (=> b!46965 (=> (not res!39632) (not e!31175))))

(declare-fun lt!72711 () tuple2!4528)

(assert (=> b!46965 (= res!39632 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72711)))))

(declare-fun b!46966 () Bool)

(declare-fun res!39627 () Bool)

(assert (=> b!46966 (=> (not res!39627) (not e!31175))))

(assert (=> b!46966 (= res!39627 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72711))) (currentByte!2891 (_2!2357 lt!72711)) (currentBit!2886 (_2!2357 lt!72711))) (bvadd (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!13734 () Bool)

(assert (=> d!13734 e!31176))

(declare-fun res!39630 () Bool)

(assert (=> d!13734 (=> (not res!39630) (not e!31176))))

(assert (=> d!13734 (= res!39630 (= (size!1037 (buf!1386 (_2!2357 lt!72712))) (size!1037 (buf!1386 thiss!1379))))))

(declare-fun lt!72714 () (_ BitVec 8))

(declare-fun lt!72718 () array!2295)

(assert (=> d!13734 (= lt!72714 (select (arr!1557 lt!72718) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!13734 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1037 lt!72718)))))

(assert (=> d!13734 (= lt!72718 (array!2296 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!72715 () tuple2!4528)

(assert (=> d!13734 (= lt!72712 (tuple2!4529 (_1!2357 lt!72715) (_2!2357 lt!72715)))))

(assert (=> d!13734 (= lt!72715 lt!72711)))

(assert (=> d!13734 e!31175))

(declare-fun res!39629 () Bool)

(assert (=> d!13734 (=> (not res!39629) (not e!31175))))

(assert (=> d!13734 (= res!39629 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(declare-fun lt!72713 () Bool)

(declare-fun appendBit!0 (BitStream!1806 Bool) tuple2!4528)

(assert (=> d!13734 (= lt!72711 (appendBit!0 thiss!1379 lt!72713))))

(assert (=> d!13734 (= lt!72713 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!13734 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!13734 (= (appendBitFromByte!0 thiss!1379 (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!72712)))

(declare-fun b!46967 () Bool)

(declare-fun res!39626 () Bool)

(assert (=> b!46967 (=> (not res!39626) (not e!31176))))

(declare-fun lt!72716 () (_ BitVec 64))

(declare-fun lt!72709 () (_ BitVec 64))

(assert (=> b!46967 (= res!39626 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72712))) (currentByte!2891 (_2!2357 lt!72712)) (currentBit!2886 (_2!2357 lt!72712))) (bvadd lt!72709 lt!72716)))))

(assert (=> b!46967 (or (not (= (bvand lt!72709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72716 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!72709 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!72709 lt!72716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!46967 (= lt!72716 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!46967 (= lt!72709 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!46968 () Bool)

(declare-fun e!31174 () Bool)

(declare-datatypes ((tuple2!4542 0))(
  ( (tuple2!4543 (_1!2364 BitStream!1806) (_2!2364 Bool)) )
))
(declare-fun lt!72708 () tuple2!4542)

(assert (=> b!46968 (= e!31174 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!72708))) (currentByte!2891 (_1!2364 lt!72708)) (currentBit!2886 (_1!2364 lt!72708))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72711))) (currentByte!2891 (_2!2357 lt!72711)) (currentBit!2886 (_2!2357 lt!72711)))))))

(declare-fun b!46969 () Bool)

(declare-fun e!31177 () Bool)

(assert (=> b!46969 (= e!31176 e!31177)))

(declare-fun res!39631 () Bool)

(assert (=> b!46969 (=> (not res!39631) (not e!31177))))

(declare-fun lt!72710 () tuple2!4542)

(assert (=> b!46969 (= res!39631 (and (= (_2!2364 lt!72710) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!72714)) #b00000000000000000000000000000000))) (= (_1!2364 lt!72710) (_2!2357 lt!72712))))))

(declare-fun lt!72717 () tuple2!4540)

(declare-fun lt!72707 () BitStream!1806)

(assert (=> b!46969 (= lt!72717 (readBits!0 lt!72707 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1806) tuple2!4542)

(assert (=> b!46969 (= lt!72710 (readBitPure!0 lt!72707))))

(declare-fun readerFrom!0 (BitStream!1806 (_ BitVec 32) (_ BitVec 32)) BitStream!1806)

(assert (=> b!46969 (= lt!72707 (readerFrom!0 (_2!2357 lt!72712) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379)))))

(declare-fun b!46970 () Bool)

(assert (=> b!46970 (= e!31177 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!72710))) (currentByte!2891 (_1!2364 lt!72710)) (currentBit!2886 (_1!2364 lt!72710))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72712))) (currentByte!2891 (_2!2357 lt!72712)) (currentBit!2886 (_2!2357 lt!72712)))))))

(declare-fun b!46971 () Bool)

(assert (=> b!46971 (= e!31175 e!31174)))

(declare-fun res!39628 () Bool)

(assert (=> b!46971 (=> (not res!39628) (not e!31174))))

(assert (=> b!46971 (= res!39628 (and (= (_2!2364 lt!72708) lt!72713) (= (_1!2364 lt!72708) (_2!2357 lt!72711))))))

(assert (=> b!46971 (= lt!72708 (readBitPure!0 (readerFrom!0 (_2!2357 lt!72711) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379))))))

(assert (= (and d!13734 res!39629) b!46966))

(assert (= (and b!46966 res!39627) b!46965))

(assert (= (and b!46965 res!39632) b!46971))

(assert (= (and b!46971 res!39628) b!46968))

(assert (= (and d!13734 res!39630) b!46967))

(assert (= (and b!46967 res!39626) b!46964))

(assert (= (and b!46964 res!39625) b!46969))

(assert (= (and b!46969 res!39631) b!46970))

(declare-fun m!72133 () Bool)

(assert (=> b!46969 m!72133))

(declare-fun m!72135 () Bool)

(assert (=> b!46969 m!72135))

(declare-fun m!72137 () Bool)

(assert (=> b!46969 m!72137))

(declare-fun m!72139 () Bool)

(assert (=> b!46964 m!72139))

(declare-fun m!72141 () Bool)

(assert (=> b!46966 m!72141))

(assert (=> b!46966 m!71749))

(declare-fun m!72143 () Bool)

(assert (=> b!46965 m!72143))

(declare-fun m!72145 () Bool)

(assert (=> b!46970 m!72145))

(declare-fun m!72147 () Bool)

(assert (=> b!46970 m!72147))

(declare-fun m!72149 () Bool)

(assert (=> d!13734 m!72149))

(declare-fun m!72151 () Bool)

(assert (=> d!13734 m!72151))

(declare-fun m!72153 () Bool)

(assert (=> d!13734 m!72153))

(declare-fun m!72155 () Bool)

(assert (=> b!46968 m!72155))

(assert (=> b!46968 m!72141))

(assert (=> b!46967 m!72147))

(assert (=> b!46967 m!71749))

(declare-fun m!72157 () Bool)

(assert (=> b!46971 m!72157))

(assert (=> b!46971 m!72157))

(declare-fun m!72159 () Bool)

(assert (=> b!46971 m!72159))

(assert (=> b!46784 d!13734))

(declare-fun d!13740 () Bool)

(assert (=> d!13740 (= (invariant!0 (currentBit!2886 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72322)) (size!1037 (buf!1386 (_2!2357 lt!72322)))) (and (bvsge (currentBit!2886 (_2!2357 lt!72322)) #b00000000000000000000000000000000) (bvslt (currentBit!2886 (_2!2357 lt!72322)) #b00000000000000000000000000001000) (bvsge (currentByte!2891 (_2!2357 lt!72322)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2891 (_2!2357 lt!72322)) (size!1037 (buf!1386 (_2!2357 lt!72322)))) (and (= (currentBit!2886 (_2!2357 lt!72322)) #b00000000000000000000000000000000) (= (currentByte!2891 (_2!2357 lt!72322)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))))

(assert (=> b!46782 d!13740))

(declare-fun d!13742 () Bool)

(assert (=> d!13742 (= (head!363 lt!72323) (h!659 lt!72323))))

(assert (=> b!46793 d!13742))

(declare-fun d!13744 () Bool)

(declare-fun res!39633 () Bool)

(declare-fun e!31179 () Bool)

(assert (=> d!13744 (=> (not res!39633) (not e!31179))))

(assert (=> d!13744 (= res!39633 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 thiss!1379))))))

(assert (=> d!13744 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!31179)))

(declare-fun b!46972 () Bool)

(declare-fun res!39635 () Bool)

(assert (=> b!46972 (=> (not res!39635) (not e!31179))))

(assert (=> b!46972 (= res!39635 (bvsle (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!46973 () Bool)

(declare-fun e!31178 () Bool)

(assert (=> b!46973 (= e!31179 e!31178)))

(declare-fun res!39634 () Bool)

(assert (=> b!46973 (=> res!39634 e!31178)))

(assert (=> b!46973 (= res!39634 (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!46974 () Bool)

(assert (=> b!46974 (= e!31178 (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (= (and d!13744 res!39633) b!46972))

(assert (= (and b!46972 res!39635) b!46973))

(assert (= (and b!46973 (not res!39634)) b!46974))

(assert (=> b!46972 m!71749))

(assert (=> b!46972 m!71749))

(assert (=> b!46974 m!71749))

(assert (=> b!46974 m!71749))

(declare-fun m!72161 () Bool)

(assert (=> b!46974 m!72161))

(assert (=> b!46791 d!13744))

(declare-fun d!13746 () Bool)

(assert (=> d!13746 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!72721 () Unit!3311)

(declare-fun choose!11 (BitStream!1806) Unit!3311)

(assert (=> d!13746 (= lt!72721 (choose!11 thiss!1379))))

(assert (=> d!13746 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!72721)))

(declare-fun bs!3613 () Bool)

(assert (= bs!3613 d!13746))

(assert (=> bs!3613 m!71745))

(declare-fun m!72163 () Bool)

(assert (=> bs!3613 m!72163))

(assert (=> b!46791 d!13746))

(declare-fun d!13748 () Bool)

(declare-fun e!31180 () Bool)

(assert (=> d!13748 e!31180))

(declare-fun res!39636 () Bool)

(assert (=> d!13748 (=> (not res!39636) (not e!31180))))

(declare-fun lt!72722 () (_ BitVec 64))

(declare-fun lt!72724 () (_ BitVec 64))

(declare-fun lt!72725 () (_ BitVec 64))

(assert (=> d!13748 (= res!39636 (= lt!72722 (bvsub lt!72724 lt!72725)))))

(assert (=> d!13748 (or (= (bvand lt!72724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72725 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72724 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72724 lt!72725) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13748 (= lt!72725 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))))))

(declare-fun lt!72727 () (_ BitVec 64))

(declare-fun lt!72726 () (_ BitVec 64))

(assert (=> d!13748 (= lt!72724 (bvmul lt!72727 lt!72726))))

(assert (=> d!13748 (or (= lt!72727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!72726 (bvsdiv (bvmul lt!72727 lt!72726) lt!72727)))))

(assert (=> d!13748 (= lt!72726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!13748 (= lt!72727 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))))))

(assert (=> d!13748 (= lt!72722 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 thiss!1379))))))

(assert (=> d!13748 (invariant!0 (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379) (size!1037 (buf!1386 thiss!1379)))))

(assert (=> d!13748 (= (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) lt!72722)))

(declare-fun b!46975 () Bool)

(declare-fun res!39637 () Bool)

(assert (=> b!46975 (=> (not res!39637) (not e!31180))))

(assert (=> b!46975 (= res!39637 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72722))))

(declare-fun b!46976 () Bool)

(declare-fun lt!72723 () (_ BitVec 64))

(assert (=> b!46976 (= e!31180 (bvsle lt!72722 (bvmul lt!72723 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!46976 (or (= lt!72723 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!72723 #b0000000000000000000000000000000000000000000000000000000000001000) lt!72723)))))

(assert (=> b!46976 (= lt!72723 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))))))

(assert (= (and d!13748 res!39636) b!46975))

(assert (= (and b!46975 res!39637) b!46976))

(assert (=> d!13748 m!72115))

(assert (=> d!13748 m!71991))

(assert (=> b!46791 d!13748))

(declare-fun d!13750 () Bool)

(assert (=> d!13750 (= (invariant!0 (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72322)))) (and (bvsge (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (bvslt (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000001000) (bvsge (currentByte!2891 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72322)))) (and (= (currentBit!2886 (_2!2357 lt!72328)) #b00000000000000000000000000000000) (= (currentByte!2891 (_2!2357 lt!72328)) (size!1037 (buf!1386 (_2!2357 lt!72322))))))))))

(assert (=> b!46792 d!13750))

(declare-fun d!13752 () Bool)

(assert (=> d!13752 (= (head!363 (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!659 (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46781 d!13752))

(declare-fun d!13754 () Bool)

(declare-fun c!3193 () Bool)

(assert (=> d!13754 (= c!3193 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31183 () List!544)

(assert (=> d!13754 (= (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!31183)))

(declare-fun b!46981 () Bool)

(assert (=> b!46981 (= e!31183 Nil!541)))

(declare-fun b!46982 () Bool)

(assert (=> b!46982 (= e!31183 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!13754 c!3193) b!46981))

(assert (= (and d!13754 (not c!3193)) b!46982))

(assert (=> b!46982 m!71809))

(assert (=> b!46982 m!72153))

(declare-fun m!72165 () Bool)

(assert (=> b!46982 m!72165))

(assert (=> b!46781 d!13754))

(declare-fun d!13756 () Bool)

(assert (=> d!13756 (= (head!363 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_1!2358 lt!72338) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!659 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_1!2358 lt!72338) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46781 d!13756))

(declare-fun b!46986 () Bool)

(declare-fun e!31185 () Bool)

(declare-fun lt!72729 () List!544)

(assert (=> b!46986 (= e!31185 (> (length!239 lt!72729) 0))))

(declare-fun e!31184 () tuple2!4538)

(declare-fun b!46984 () Bool)

(declare-fun lt!72728 () tuple2!4536)

(declare-fun lt!72730 () (_ BitVec 64))

(assert (=> b!46984 (= e!31184 (tuple2!4539 (Cons!540 (_1!2361 lt!72728) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_2!2361 lt!72728) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730))) (_2!2361 lt!72728)))))

(assert (=> b!46984 (= lt!72728 (readBit!0 (_1!2358 lt!72338)))))

(assert (=> b!46984 (= lt!72730 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!46983 () Bool)

(assert (=> b!46983 (= e!31184 (tuple2!4539 Nil!541 (_1!2358 lt!72338)))))

(declare-fun b!46985 () Bool)

(assert (=> b!46985 (= e!31185 (isEmpty!137 lt!72729))))

(declare-fun d!13758 () Bool)

(assert (=> d!13758 e!31185))

(declare-fun c!3194 () Bool)

(assert (=> d!13758 (= c!3194 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13758 (= lt!72729 (_1!2362 e!31184))))

(declare-fun c!3195 () Bool)

(assert (=> d!13758 (= c!3195 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13758 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!13758 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_1!2358 lt!72338) #b0000000000000000000000000000000000000000000000000000000000000001) lt!72729)))

(assert (= (and d!13758 c!3195) b!46983))

(assert (= (and d!13758 (not c!3195)) b!46984))

(assert (= (and d!13758 c!3194) b!46985))

(assert (= (and d!13758 (not c!3194)) b!46986))

(declare-fun m!72167 () Bool)

(assert (=> b!46986 m!72167))

(declare-fun m!72169 () Bool)

(assert (=> b!46984 m!72169))

(declare-fun m!72171 () Bool)

(assert (=> b!46984 m!72171))

(declare-fun m!72173 () Bool)

(assert (=> b!46985 m!72173))

(assert (=> b!46781 d!13758))

(check-sat (not b!46968) (not d!13722) (not bm!562) (not b!46875) (not b!46924) (not b!46933) (not b!46863) (not b!46864) (not b!46925) (not d!13716) (not d!13732) (not b!46943) (not b!46886) (not d!13686) (not b!46887) (not b!46974) (not b!46969) (not d!13702) (not d!13720) (not b!46923) (not b!46937) (not b!46877) (not d!13698) (not d!13682) (not b!46971) (not b!46966) (not d!13748) (not b!46970) (not b!46936) (not d!13676) (not b!46965) (not d!13712) (not d!13718) (not b!46967) (not d!13678) (not b!46928) (not b!46964) (not d!13730) (not d!13746) (not b!46904) (not d!13734) (not b!46935) (not d!13706) (not b!46862) (not b!46882) (not b!46986) (not b!46897) (not b!46883) (not b!46927) (not d!13694) (not b!46934) (not b!46946) (not b!46930) (not b!46876) (not b!46941) (not b!46985) (not d!13710) (not b!46885) (not b!46878) (not d!13692) (not d!13674) (not b!46984) (not b!46972) (not b!46931) (not b!46881) (not b!46884) (not b!46982) (not b!46906) (not d!13688))
(check-sat)
(get-model)

(declare-fun d!14420 () Bool)

(declare-fun res!40226 () Bool)

(declare-fun e!31681 () Bool)

(assert (=> d!14420 (=> (not res!40226) (not e!31681))))

(assert (=> d!14420 (= res!40226 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72712)))))))

(assert (=> d!14420 (= (isPrefixOf!0 thiss!1379 (_2!2357 lt!72712)) e!31681)))

(declare-fun b!47821 () Bool)

(declare-fun res!40228 () Bool)

(assert (=> b!47821 (=> (not res!40228) (not e!31681))))

(assert (=> b!47821 (= res!40228 (bvsle (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72712))) (currentByte!2891 (_2!2357 lt!72712)) (currentBit!2886 (_2!2357 lt!72712)))))))

(declare-fun b!47822 () Bool)

(declare-fun e!31680 () Bool)

(assert (=> b!47822 (= e!31681 e!31680)))

(declare-fun res!40227 () Bool)

(assert (=> b!47822 (=> res!40227 e!31680)))

(assert (=> b!47822 (= res!40227 (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47823 () Bool)

(assert (=> b!47823 (= e!31680 (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72712)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (= (and d!14420 res!40226) b!47821))

(assert (= (and b!47821 res!40228) b!47822))

(assert (= (and b!47822 (not res!40227)) b!47823))

(assert (=> b!47821 m!71749))

(assert (=> b!47821 m!72147))

(assert (=> b!47823 m!71749))

(assert (=> b!47823 m!71749))

(declare-fun m!74053 () Bool)

(assert (=> b!47823 m!74053))

(assert (=> b!46964 d!14420))

(declare-fun d!14422 () Bool)

(declare-fun res!40229 () Bool)

(declare-fun e!31683 () Bool)

(assert (=> d!14422 (=> (not res!40229) (not e!31683))))

(assert (=> d!14422 (= res!40229 (= (size!1037 (buf!1386 (_1!2358 lt!72474))) (size!1037 (buf!1386 thiss!1379))))))

(assert (=> d!14422 (= (isPrefixOf!0 (_1!2358 lt!72474) thiss!1379) e!31683)))

(declare-fun b!47824 () Bool)

(declare-fun res!40231 () Bool)

(assert (=> b!47824 (=> (not res!40231) (not e!31683))))

(assert (=> b!47824 (= res!40231 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72474))) (currentByte!2891 (_1!2358 lt!72474)) (currentBit!2886 (_1!2358 lt!72474))) (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!47825 () Bool)

(declare-fun e!31682 () Bool)

(assert (=> b!47825 (= e!31683 e!31682)))

(declare-fun res!40230 () Bool)

(assert (=> b!47825 (=> res!40230 e!31682)))

(assert (=> b!47825 (= res!40230 (= (size!1037 (buf!1386 (_1!2358 lt!72474))) #b00000000000000000000000000000000))))

(declare-fun b!47826 () Bool)

(assert (=> b!47826 (= e!31682 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72474)) (buf!1386 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72474))) (currentByte!2891 (_1!2358 lt!72474)) (currentBit!2886 (_1!2358 lt!72474)))))))

(assert (= (and d!14422 res!40229) b!47824))

(assert (= (and b!47824 res!40231) b!47825))

(assert (= (and b!47825 (not res!40230)) b!47826))

(declare-fun m!74055 () Bool)

(assert (=> b!47824 m!74055))

(assert (=> b!47824 m!71749))

(assert (=> b!47826 m!74055))

(assert (=> b!47826 m!74055))

(declare-fun m!74057 () Bool)

(assert (=> b!47826 m!74057))

(assert (=> b!46887 d!14422))

(declare-fun d!14424 () Bool)

(declare-fun e!31686 () Bool)

(assert (=> d!14424 e!31686))

(declare-fun res!40234 () Bool)

(assert (=> d!14424 (=> (not res!40234) (not e!31686))))

(declare-fun lt!74119 () BitStream!1806)

(declare-fun lt!74120 () (_ BitVec 64))

(assert (=> d!14424 (= res!40234 (= (bvadd lt!74120 (bvsub lt!72478 lt!72481)) (bitIndex!0 (size!1037 (buf!1386 lt!74119)) (currentByte!2891 lt!74119) (currentBit!2886 lt!74119))))))

(assert (=> d!14424 (or (not (= (bvand lt!74120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72478 lt!72481) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74120 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74120 (bvsub lt!72478 lt!72481)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14424 (= lt!74120 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72474))) (currentByte!2891 (_2!2358 lt!72474)) (currentBit!2886 (_2!2358 lt!72474))))))

(declare-fun moveBitIndex!0 (BitStream!1806 (_ BitVec 64)) tuple2!4528)

(assert (=> d!14424 (= lt!74119 (_2!2357 (moveBitIndex!0 (_2!2358 lt!72474) (bvsub lt!72478 lt!72481))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!1806 (_ BitVec 64)) Bool)

(assert (=> d!14424 (moveBitIndexPrecond!0 (_2!2358 lt!72474) (bvsub lt!72478 lt!72481))))

(assert (=> d!14424 (= (withMovedBitIndex!0 (_2!2358 lt!72474) (bvsub lt!72478 lt!72481)) lt!74119)))

(declare-fun b!47829 () Bool)

(assert (=> b!47829 (= e!31686 (= (size!1037 (buf!1386 (_2!2358 lt!72474))) (size!1037 (buf!1386 lt!74119))))))

(assert (= (and d!14424 res!40234) b!47829))

(declare-fun m!74059 () Bool)

(assert (=> d!14424 m!74059))

(declare-fun m!74061 () Bool)

(assert (=> d!14424 m!74061))

(declare-fun m!74063 () Bool)

(assert (=> d!14424 m!74063))

(declare-fun m!74065 () Bool)

(assert (=> d!14424 m!74065))

(assert (=> b!46885 d!14424))

(assert (=> b!46885 d!13722))

(assert (=> b!46885 d!13748))

(declare-fun b!47839 () Bool)

(declare-fun res!40244 () Bool)

(declare-fun e!31691 () Bool)

(assert (=> b!47839 (=> (not res!40244) (not e!31691))))

(declare-fun lt!74131 () tuple2!4528)

(declare-fun lt!74130 () (_ BitVec 64))

(declare-fun lt!74129 () (_ BitVec 64))

(assert (=> b!47839 (= res!40244 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74131))) (currentByte!2891 (_2!2357 lt!74131)) (currentBit!2886 (_2!2357 lt!74131))) (bvadd lt!74130 lt!74129)))))

(assert (=> b!47839 (or (not (= (bvand lt!74130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74129 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74130 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74130 lt!74129) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47839 (= lt!74129 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47839 (= lt!74130 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!47840 () Bool)

(declare-fun res!40245 () Bool)

(assert (=> b!47840 (=> (not res!40245) (not e!31691))))

(assert (=> b!47840 (= res!40245 (isPrefixOf!0 thiss!1379 (_2!2357 lt!74131)))))

(declare-fun d!14426 () Bool)

(assert (=> d!14426 e!31691))

(declare-fun res!40243 () Bool)

(assert (=> d!14426 (=> (not res!40243) (not e!31691))))

(assert (=> d!14426 (= res!40243 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!74131)))))))

(declare-fun choose!16 (BitStream!1806 Bool) tuple2!4528)

(assert (=> d!14426 (= lt!74131 (choose!16 thiss!1379 lt!72713))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!14426 (validate_offset_bit!0 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)))))

(assert (=> d!14426 (= (appendBit!0 thiss!1379 lt!72713) lt!74131)))

(declare-fun b!47841 () Bool)

(declare-fun e!31692 () Bool)

(assert (=> b!47841 (= e!31691 e!31692)))

(declare-fun res!40246 () Bool)

(assert (=> b!47841 (=> (not res!40246) (not e!31692))))

(declare-fun lt!74132 () tuple2!4542)

(assert (=> b!47841 (= res!40246 (and (= (_2!2364 lt!74132) lt!72713) (= (_1!2364 lt!74132) (_2!2357 lt!74131))))))

(assert (=> b!47841 (= lt!74132 (readBitPure!0 (readerFrom!0 (_2!2357 lt!74131) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379))))))

(declare-fun b!47842 () Bool)

(assert (=> b!47842 (= e!31692 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!74132))) (currentByte!2891 (_1!2364 lt!74132)) (currentBit!2886 (_1!2364 lt!74132))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74131))) (currentByte!2891 (_2!2357 lt!74131)) (currentBit!2886 (_2!2357 lt!74131)))))))

(assert (= (and d!14426 res!40243) b!47839))

(assert (= (and b!47839 res!40244) b!47840))

(assert (= (and b!47840 res!40245) b!47841))

(assert (= (and b!47841 res!40246) b!47842))

(declare-fun m!74067 () Bool)

(assert (=> b!47839 m!74067))

(assert (=> b!47839 m!71749))

(declare-fun m!74069 () Bool)

(assert (=> b!47840 m!74069))

(declare-fun m!74071 () Bool)

(assert (=> b!47841 m!74071))

(assert (=> b!47841 m!74071))

(declare-fun m!74073 () Bool)

(assert (=> b!47841 m!74073))

(declare-fun m!74075 () Bool)

(assert (=> b!47842 m!74075))

(assert (=> b!47842 m!74067))

(declare-fun m!74077 () Bool)

(assert (=> d!14426 m!74077))

(declare-fun m!74079 () Bool)

(assert (=> d!14426 m!74079))

(assert (=> d!13734 d!14426))

(declare-fun d!14428 () Bool)

(declare-fun c!3318 () Bool)

(assert (=> d!14428 (= c!3318 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31693 () List!544)

(assert (=> d!14428 (= (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001)) e!31693)))

(declare-fun b!47843 () Bool)

(assert (=> b!47843 (= e!31693 Nil!541)))

(declare-fun b!47844 () Bool)

(assert (=> b!47844 (= e!31693 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72328) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14428 c!3318) b!47843))

(assert (= (and d!14428 (not c!3318)) b!47844))

(declare-fun m!74081 () Bool)

(assert (=> b!47844 m!74081))

(declare-fun m!74083 () Bool)

(assert (=> b!47844 m!74083))

(declare-fun m!74085 () Bool)

(assert (=> b!47844 m!74085))

(assert (=> b!46982 d!14428))

(declare-fun d!14430 () Bool)

(get-info :version)

(assert (=> d!14430 (= (isEmpty!137 lt!72472) ((_ is Nil!541) lt!72472))))

(assert (=> b!46882 d!14430))

(declare-fun d!14432 () Bool)

(assert (=> d!14432 (= (length!239 lt!72409) (size!1039 lt!72409))))

(declare-fun bs!3727 () Bool)

(assert (= bs!3727 d!14432))

(declare-fun m!74087 () Bool)

(assert (=> bs!3727 m!74087))

(assert (=> b!46864 d!14432))

(assert (=> b!46877 d!13692))

(declare-fun d!14434 () Bool)

(assert (=> d!14434 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 (_2!2357 lt!72328)) lt!72461 lt!72468)))

(declare-fun lt!74135 () Unit!3311)

(declare-fun choose!8 (array!2295 array!2295 (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> d!14434 (= lt!74135 (choose!8 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) lt!72461 lt!72468))))

(assert (=> d!14434 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72461) (bvsle lt!72461 lt!72468))))

(assert (=> d!14434 (= (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) lt!72461 lt!72468) lt!74135)))

(declare-fun bs!3728 () Bool)

(assert (= bs!3728 d!14434))

(assert (=> bs!3728 m!71953))

(declare-fun m!74089 () Bool)

(assert (=> bs!3728 m!74089))

(assert (=> b!46877 d!14434))

(declare-fun b!47859 () Bool)

(declare-datatypes ((tuple4!18 0))(
  ( (tuple4!19 (_1!2377 (_ BitVec 32)) (_2!2377 (_ BitVec 32)) (_3!97 (_ BitVec 32)) (_4!9 (_ BitVec 32))) )
))
(declare-fun lt!74143 () tuple4!18)

(declare-fun e!31709 () Bool)

(declare-fun arrayRangesEq!10 (array!2295 array!2295 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!47859 (= e!31709 (arrayRangesEq!10 (buf!1386 (_2!2357 lt!72322)) (buf!1386 (_2!2357 lt!72328)) (_1!2377 lt!74143) (_2!2377 lt!74143)))))

(declare-fun b!47860 () Bool)

(declare-fun e!31708 () Bool)

(declare-fun call!594 () Bool)

(assert (=> b!47860 (= e!31708 call!594)))

(declare-fun b!47861 () Bool)

(declare-fun e!31706 () Bool)

(declare-fun e!31707 () Bool)

(assert (=> b!47861 (= e!31706 e!31707)))

(declare-fun res!40260 () Bool)

(assert (=> b!47861 (=> (not res!40260) (not e!31707))))

(assert (=> b!47861 (= res!40260 e!31709)))

(declare-fun res!40259 () Bool)

(assert (=> b!47861 (=> res!40259 e!31709)))

(assert (=> b!47861 (= res!40259 (bvsge (_1!2377 lt!74143) (_2!2377 lt!74143)))))

(declare-fun lt!74144 () (_ BitVec 32))

(assert (=> b!47861 (= lt!74144 ((_ extract 31 0) (bvsrem lt!72468 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74142 () (_ BitVec 32))

(assert (=> b!47861 (= lt!74142 ((_ extract 31 0) (bvsrem lt!72461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!18)

(assert (=> b!47861 (= lt!74143 (arrayBitIndices!0 lt!72461 lt!72468))))

(declare-fun b!47862 () Bool)

(assert (=> b!47862 (= e!31707 e!31708)))

(declare-fun c!3321 () Bool)

(assert (=> b!47862 (= c!3321 (= (_3!97 lt!74143) (_4!9 lt!74143)))))

(declare-fun bm!591 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!591 (= call!594 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_3!97 lt!74143)) (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_3!97 lt!74143)) lt!74142 (ite c!3321 lt!74144 #b00000000000000000000000000001000)))))

(declare-fun b!47863 () Bool)

(declare-fun res!40261 () Bool)

(assert (=> b!47863 (= res!40261 (= lt!74144 #b00000000000000000000000000000000))))

(declare-fun e!31710 () Bool)

(assert (=> b!47863 (=> res!40261 e!31710)))

(declare-fun e!31711 () Bool)

(assert (=> b!47863 (= e!31711 e!31710)))

(declare-fun b!47864 () Bool)

(assert (=> b!47864 (= e!31708 e!31711)))

(declare-fun res!40258 () Bool)

(assert (=> b!47864 (= res!40258 call!594)))

(assert (=> b!47864 (=> (not res!40258) (not e!31711))))

(declare-fun b!47865 () Bool)

(assert (=> b!47865 (= e!31710 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_4!9 lt!74143)) (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_4!9 lt!74143)) #b00000000000000000000000000000000 lt!74144))))

(declare-fun d!14436 () Bool)

(declare-fun res!40257 () Bool)

(assert (=> d!14436 (=> res!40257 e!31706)))

(assert (=> d!14436 (= res!40257 (bvsge lt!72461 lt!72468))))

(assert (=> d!14436 (= (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 (_2!2357 lt!72328)) lt!72461 lt!72468) e!31706)))

(assert (= (and d!14436 (not res!40257)) b!47861))

(assert (= (and b!47861 (not res!40259)) b!47859))

(assert (= (and b!47861 res!40260) b!47862))

(assert (= (and b!47862 c!3321) b!47860))

(assert (= (and b!47862 (not c!3321)) b!47864))

(assert (= (and b!47864 res!40258) b!47863))

(assert (= (and b!47863 (not res!40261)) b!47865))

(assert (= (or b!47860 b!47864) bm!591))

(declare-fun m!74091 () Bool)

(assert (=> b!47859 m!74091))

(declare-fun m!74093 () Bool)

(assert (=> b!47861 m!74093))

(declare-fun m!74095 () Bool)

(assert (=> bm!591 m!74095))

(declare-fun m!74097 () Bool)

(assert (=> bm!591 m!74097))

(assert (=> bm!591 m!74095))

(assert (=> bm!591 m!74097))

(declare-fun m!74099 () Bool)

(assert (=> bm!591 m!74099))

(declare-fun m!74101 () Bool)

(assert (=> b!47865 m!74101))

(declare-fun m!74103 () Bool)

(assert (=> b!47865 m!74103))

(assert (=> b!47865 m!74101))

(assert (=> b!47865 m!74103))

(declare-fun m!74105 () Bool)

(assert (=> b!47865 m!74105))

(assert (=> b!46877 d!14436))

(assert (=> d!13678 d!13676))

(declare-fun d!14438 () Bool)

(assert (=> d!14438 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72339)))

(assert (=> d!14438 true))

(declare-fun _$6!190 () Unit!3311)

(assert (=> d!14438 (= (choose!9 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72322)) lt!72339 (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))) _$6!190)))

(declare-fun bs!3729 () Bool)

(assert (= bs!3729 d!14438))

(assert (=> bs!3729 m!71761))

(assert (=> d!13678 d!14438))

(declare-fun b!47869 () Bool)

(declare-fun e!31713 () Bool)

(declare-fun lt!74146 () List!544)

(assert (=> b!47869 (= e!31713 (> (length!239 lt!74146) 0))))

(declare-fun e!31712 () tuple2!4538)

(declare-fun b!47867 () Bool)

(declare-fun lt!74147 () (_ BitVec 64))

(declare-fun lt!74145 () tuple2!4536)

(assert (=> b!47867 (= e!31712 (tuple2!4539 (Cons!540 (_1!2361 lt!74145) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!74145) (bvsub (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74147))) (_2!2361 lt!74145)))))

(assert (=> b!47867 (= lt!74145 (readBit!0 (_1!2358 lt!72332)))))

(assert (=> b!47867 (= lt!74147 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!47866 () Bool)

(assert (=> b!47866 (= e!31712 (tuple2!4539 Nil!541 (_1!2358 lt!72332)))))

(declare-fun b!47868 () Bool)

(assert (=> b!47868 (= e!31713 (isEmpty!137 lt!74146))))

(declare-fun d!14440 () Bool)

(assert (=> d!14440 e!31713))

(declare-fun c!3322 () Bool)

(assert (=> d!14440 (= c!3322 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14440 (= lt!74146 (_1!2362 e!31712))))

(declare-fun c!3323 () Bool)

(assert (=> d!14440 (= c!3323 (= (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14440 (bvsge (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14440 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72332) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!74146)))

(assert (= (and d!14440 c!3323) b!47866))

(assert (= (and d!14440 (not c!3323)) b!47867))

(assert (= (and d!14440 c!3322) b!47868))

(assert (= (and d!14440 (not c!3322)) b!47869))

(declare-fun m!74107 () Bool)

(assert (=> b!47869 m!74107))

(declare-fun m!74109 () Bool)

(assert (=> b!47867 m!74109))

(assert (=> b!47867 m!71921))

(declare-fun m!74111 () Bool)

(assert (=> b!47868 m!74111))

(assert (=> b!46897 d!14440))

(assert (=> b!46897 d!13700))

(declare-fun b!47873 () Bool)

(declare-fun e!31715 () Bool)

(declare-fun lt!74149 () List!544)

(assert (=> b!47873 (= e!31715 (> (length!239 lt!74149) 0))))

(declare-fun lt!74148 () tuple2!4536)

(declare-fun b!47871 () Bool)

(declare-fun lt!74150 () (_ BitVec 64))

(declare-fun e!31714 () tuple2!4538)

(assert (=> b!47871 (= e!31714 (tuple2!4539 (Cons!540 (_1!2361 lt!74148) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!74148) (bvsub (bvsub lt!72339 lt!72410) lt!74150))) (_2!2361 lt!74148)))))

(assert (=> b!47871 (= lt!74148 (readBit!0 (_2!2361 lt!72408)))))

(assert (=> b!47871 (= lt!74150 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!47870 () Bool)

(assert (=> b!47870 (= e!31714 (tuple2!4539 Nil!541 (_2!2361 lt!72408)))))

(declare-fun b!47872 () Bool)

(assert (=> b!47872 (= e!31715 (isEmpty!137 lt!74149))))

(declare-fun d!14442 () Bool)

(assert (=> d!14442 e!31715))

(declare-fun c!3324 () Bool)

(assert (=> d!14442 (= c!3324 (= (bvsub lt!72339 lt!72410) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14442 (= lt!74149 (_1!2362 e!31714))))

(declare-fun c!3325 () Bool)

(assert (=> d!14442 (= c!3325 (= (bvsub lt!72339 lt!72410) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14442 (bvsge (bvsub lt!72339 lt!72410) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14442 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!72408) (bvsub lt!72339 lt!72410)) lt!74149)))

(assert (= (and d!14442 c!3325) b!47870))

(assert (= (and d!14442 (not c!3325)) b!47871))

(assert (= (and d!14442 c!3324) b!47872))

(assert (= (and d!14442 (not c!3324)) b!47873))

(declare-fun m!74113 () Bool)

(assert (=> b!47873 m!74113))

(declare-fun m!74115 () Bool)

(assert (=> b!47871 m!74115))

(declare-fun m!74117 () Bool)

(assert (=> b!47871 m!74117))

(declare-fun m!74119 () Bool)

(assert (=> b!47872 m!74119))

(assert (=> b!46862 d!14442))

(declare-fun d!14444 () Bool)

(declare-fun e!31722 () Bool)

(assert (=> d!14444 e!31722))

(declare-fun res!40264 () Bool)

(assert (=> d!14444 (=> (not res!40264) (not e!31722))))

(declare-fun increaseBitIndex!0 (BitStream!1806) tuple2!4528)

(assert (=> d!14444 (= res!40264 (= (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72332)))) (buf!1386 (_1!2358 lt!72332))))))

(declare-fun lt!74169 () Bool)

(assert (=> d!14444 (= lt!74169 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72332))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74165 () tuple2!4536)

(assert (=> d!14444 (= lt!74165 (tuple2!4537 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72332))))) #b00000000000000000000000000000000)) (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72332)))))))

(assert (=> d!14444 (validate_offset_bit!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2358 lt!72332)))) ((_ sign_extend 32) (currentByte!2891 (_1!2358 lt!72332))) ((_ sign_extend 32) (currentBit!2886 (_1!2358 lt!72332))))))

(assert (=> d!14444 (= (readBit!0 (_1!2358 lt!72332)) lt!74165)))

(declare-fun lt!74168 () (_ BitVec 64))

(declare-fun b!47876 () Bool)

(declare-fun lt!74170 () (_ BitVec 64))

(assert (=> b!47876 (= e!31722 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72332))))) (currentByte!2891 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72332)))) (currentBit!2886 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72332))))) (bvadd lt!74168 lt!74170)))))

(assert (=> b!47876 (or (not (= (bvand lt!74168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74170 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74168 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74168 lt!74170) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47876 (= lt!74170 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47876 (= lt!74168 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)) (currentBit!2886 (_1!2358 lt!72332))))))

(declare-fun lt!74166 () Bool)

(assert (=> b!47876 (= lt!74166 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72332))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74171 () Bool)

(assert (=> b!47876 (= lt!74171 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72332))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74167 () Bool)

(assert (=> b!47876 (= lt!74167 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72332))) (currentByte!2891 (_1!2358 lt!72332)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72332))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14444 res!40264) b!47876))

(declare-fun m!74121 () Bool)

(assert (=> d!14444 m!74121))

(declare-fun m!74123 () Bool)

(assert (=> d!14444 m!74123))

(declare-fun m!74125 () Bool)

(assert (=> d!14444 m!74125))

(declare-fun m!74127 () Bool)

(assert (=> d!14444 m!74127))

(assert (=> b!47876 m!74125))

(declare-fun m!74129 () Bool)

(assert (=> b!47876 m!74129))

(declare-fun m!74131 () Bool)

(assert (=> b!47876 m!74131))

(assert (=> b!47876 m!74123))

(assert (=> b!47876 m!74121))

(assert (=> b!46862 d!14444))

(declare-fun d!14446 () Bool)

(assert (=> d!14446 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))))))))

(assert (=> d!13730 d!14446))

(declare-fun d!14448 () Bool)

(declare-fun res!40265 () Bool)

(declare-fun e!31724 () Bool)

(assert (=> d!14448 (=> (not res!40265) (not e!31724))))

(assert (=> d!14448 (= res!40265 (= (size!1037 (buf!1386 (_2!2358 lt!72451))) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!14448 (= (isPrefixOf!0 (_2!2358 lt!72451) (_2!2357 lt!72322)) e!31724)))

(declare-fun b!47877 () Bool)

(declare-fun res!40267 () Bool)

(assert (=> b!47877 (=> (not res!40267) (not e!31724))))

(assert (=> b!47877 (= res!40267 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72451))) (currentByte!2891 (_2!2358 lt!72451)) (currentBit!2886 (_2!2358 lt!72451))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!47878 () Bool)

(declare-fun e!31723 () Bool)

(assert (=> b!47878 (= e!31724 e!31723)))

(declare-fun res!40266 () Bool)

(assert (=> b!47878 (=> res!40266 e!31723)))

(assert (=> b!47878 (= res!40266 (= (size!1037 (buf!1386 (_2!2358 lt!72451))) #b00000000000000000000000000000000))))

(declare-fun b!47879 () Bool)

(assert (=> b!47879 (= e!31723 (arrayBitRangesEq!0 (buf!1386 (_2!2358 lt!72451)) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72451))) (currentByte!2891 (_2!2358 lt!72451)) (currentBit!2886 (_2!2358 lt!72451)))))))

(assert (= (and d!14448 res!40265) b!47877))

(assert (= (and b!47877 res!40267) b!47878))

(assert (= (and b!47878 (not res!40266)) b!47879))

(declare-fun m!74133 () Bool)

(assert (=> b!47877 m!74133))

(assert (=> b!47877 m!71751))

(assert (=> b!47879 m!74133))

(assert (=> b!47879 m!74133))

(declare-fun m!74135 () Bool)

(assert (=> b!47879 m!74135))

(assert (=> b!46875 d!14448))

(declare-fun d!14450 () Bool)

(assert (=> d!14450 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72322))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72322)))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72322))))))))

(assert (=> d!13722 d!14450))

(assert (=> d!13722 d!13740))

(declare-fun d!14452 () Bool)

(assert (=> d!14452 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!3730 () Bool)

(assert (= bs!3730 d!14452))

(assert (=> bs!3730 m!71987))

(assert (=> b!46946 d!14452))

(declare-fun d!14454 () Bool)

(assert (=> d!14454 (= (length!239 lt!72729) (size!1039 lt!72729))))

(declare-fun bs!3731 () Bool)

(assert (= bs!3731 d!14454))

(declare-fun m!74137 () Bool)

(assert (=> bs!3731 m!74137))

(assert (=> b!46986 d!14454))

(declare-fun b!47880 () Bool)

(declare-fun lt!74173 () tuple4!18)

(declare-fun e!31728 () Bool)

(assert (=> b!47880 (= e!31728 (arrayRangesEq!10 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) (_1!2377 lt!74173) (_2!2377 lt!74173)))))

(declare-fun b!47881 () Bool)

(declare-fun e!31727 () Bool)

(declare-fun call!595 () Bool)

(assert (=> b!47881 (= e!31727 call!595)))

(declare-fun b!47882 () Bool)

(declare-fun e!31725 () Bool)

(declare-fun e!31726 () Bool)

(assert (=> b!47882 (= e!31725 e!31726)))

(declare-fun res!40271 () Bool)

(assert (=> b!47882 (=> (not res!40271) (not e!31726))))

(assert (=> b!47882 (= res!40271 e!31728)))

(declare-fun res!40270 () Bool)

(assert (=> b!47882 (=> res!40270 e!31728)))

(assert (=> b!47882 (= res!40270 (bvsge (_1!2377 lt!74173) (_2!2377 lt!74173)))))

(declare-fun lt!74174 () (_ BitVec 32))

(assert (=> b!47882 (= lt!74174 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74172 () (_ BitVec 32))

(assert (=> b!47882 (= lt!74172 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47882 (= lt!74173 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!47883 () Bool)

(assert (=> b!47883 (= e!31726 e!31727)))

(declare-fun c!3326 () Bool)

(assert (=> b!47883 (= c!3326 (= (_3!97 lt!74173) (_4!9 lt!74173)))))

(declare-fun bm!592 () Bool)

(assert (=> bm!592 (= call!595 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74173)) (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_3!97 lt!74173)) lt!74172 (ite c!3326 lt!74174 #b00000000000000000000000000001000)))))

(declare-fun b!47884 () Bool)

(declare-fun res!40272 () Bool)

(assert (=> b!47884 (= res!40272 (= lt!74174 #b00000000000000000000000000000000))))

(declare-fun e!31729 () Bool)

(assert (=> b!47884 (=> res!40272 e!31729)))

(declare-fun e!31730 () Bool)

(assert (=> b!47884 (= e!31730 e!31729)))

(declare-fun b!47885 () Bool)

(assert (=> b!47885 (= e!31727 e!31730)))

(declare-fun res!40269 () Bool)

(assert (=> b!47885 (= res!40269 call!595)))

(assert (=> b!47885 (=> (not res!40269) (not e!31730))))

(declare-fun b!47886 () Bool)

(assert (=> b!47886 (= e!31729 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74173)) (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_4!9 lt!74173)) #b00000000000000000000000000000000 lt!74174))))

(declare-fun d!14456 () Bool)

(declare-fun res!40268 () Bool)

(assert (=> d!14456 (=> res!40268 e!31725)))

(assert (=> d!14456 (= res!40268 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (=> d!14456 (= (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))) e!31725)))

(assert (= (and d!14456 (not res!40268)) b!47882))

(assert (= (and b!47882 (not res!40270)) b!47880))

(assert (= (and b!47882 res!40271) b!47883))

(assert (= (and b!47883 c!3326) b!47881))

(assert (= (and b!47883 (not c!3326)) b!47885))

(assert (= (and b!47885 res!40269) b!47884))

(assert (= (and b!47884 (not res!40272)) b!47886))

(assert (= (or b!47881 b!47885) bm!592))

(declare-fun m!74139 () Bool)

(assert (=> b!47880 m!74139))

(assert (=> b!47882 m!71749))

(declare-fun m!74141 () Bool)

(assert (=> b!47882 m!74141))

(declare-fun m!74143 () Bool)

(assert (=> bm!592 m!74143))

(declare-fun m!74145 () Bool)

(assert (=> bm!592 m!74145))

(assert (=> bm!592 m!74143))

(assert (=> bm!592 m!74145))

(declare-fun m!74147 () Bool)

(assert (=> bm!592 m!74147))

(declare-fun m!74149 () Bool)

(assert (=> b!47886 m!74149))

(declare-fun m!74151 () Bool)

(assert (=> b!47886 m!74151))

(assert (=> b!47886 m!74149))

(assert (=> b!47886 m!74151))

(declare-fun m!74153 () Bool)

(assert (=> b!47886 m!74153))

(assert (=> b!46943 d!14456))

(assert (=> b!46943 d!13748))

(declare-fun d!14458 () Bool)

(declare-fun lt!74177 () Int)

(assert (=> d!14458 (>= lt!74177 0)))

(declare-fun e!31733 () Int)

(assert (=> d!14458 (= lt!74177 e!31733)))

(declare-fun c!3329 () Bool)

(assert (=> d!14458 (= c!3329 ((_ is Nil!541) lt!72323))))

(assert (=> d!14458 (= (size!1039 lt!72323) lt!74177)))

(declare-fun b!47891 () Bool)

(assert (=> b!47891 (= e!31733 0)))

(declare-fun b!47892 () Bool)

(assert (=> b!47892 (= e!31733 (+ 1 (size!1039 (t!1294 lt!72323))))))

(assert (= (and d!14458 c!3329) b!47891))

(assert (= (and d!14458 (not c!3329)) b!47892))

(declare-fun m!74155 () Bool)

(assert (=> b!47892 m!74155))

(assert (=> d!13694 d!14458))

(declare-fun b!47896 () Bool)

(declare-fun e!31735 () Bool)

(declare-fun lt!74179 () List!544)

(assert (=> b!47896 (= e!31735 (> (length!239 lt!74179) 0))))

(declare-fun b!47894 () Bool)

(declare-fun e!31734 () tuple2!4538)

(declare-fun lt!74178 () tuple2!4536)

(declare-fun lt!74180 () (_ BitVec 64))

(assert (=> b!47894 (= e!31734 (tuple2!4539 (Cons!540 (_1!2361 lt!74178) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_2!2361 lt!74178) (bvsub (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730) lt!74180))) (_2!2361 lt!74178)))))

(assert (=> b!47894 (= lt!74178 (readBit!0 (_2!2361 lt!72728)))))

(assert (=> b!47894 (= lt!74180 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!47893 () Bool)

(assert (=> b!47893 (= e!31734 (tuple2!4539 Nil!541 (_2!2361 lt!72728)))))

(declare-fun b!47895 () Bool)

(assert (=> b!47895 (= e!31735 (isEmpty!137 lt!74179))))

(declare-fun d!14460 () Bool)

(assert (=> d!14460 e!31735))

(declare-fun c!3330 () Bool)

(assert (=> d!14460 (= c!3330 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14460 (= lt!74179 (_1!2362 e!31734))))

(declare-fun c!3331 () Bool)

(assert (=> d!14460 (= c!3331 (= (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14460 (bvsge (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14460 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72328) (_2!2361 lt!72728) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!72730)) lt!74179)))

(assert (= (and d!14460 c!3331) b!47893))

(assert (= (and d!14460 (not c!3331)) b!47894))

(assert (= (and d!14460 c!3330) b!47895))

(assert (= (and d!14460 (not c!3330)) b!47896))

(declare-fun m!74157 () Bool)

(assert (=> b!47896 m!74157))

(declare-fun m!74159 () Bool)

(assert (=> b!47894 m!74159))

(declare-fun m!74161 () Bool)

(assert (=> b!47894 m!74161))

(declare-fun m!74163 () Bool)

(assert (=> b!47895 m!74163))

(assert (=> b!46984 d!14460))

(declare-fun d!14462 () Bool)

(declare-fun e!31736 () Bool)

(assert (=> d!14462 e!31736))

(declare-fun res!40273 () Bool)

(assert (=> d!14462 (=> (not res!40273) (not e!31736))))

(assert (=> d!14462 (= res!40273 (= (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72338)))) (buf!1386 (_1!2358 lt!72338))))))

(declare-fun lt!74185 () Bool)

(assert (=> d!14462 (= lt!74185 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72338))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74181 () tuple2!4536)

(assert (=> d!14462 (= lt!74181 (tuple2!4537 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72338))))) #b00000000000000000000000000000000)) (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72338)))))))

(assert (=> d!14462 (validate_offset_bit!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2358 lt!72338)))) ((_ sign_extend 32) (currentByte!2891 (_1!2358 lt!72338))) ((_ sign_extend 32) (currentBit!2886 (_1!2358 lt!72338))))))

(assert (=> d!14462 (= (readBit!0 (_1!2358 lt!72338)) lt!74181)))

(declare-fun lt!74184 () (_ BitVec 64))

(declare-fun lt!74186 () (_ BitVec 64))

(declare-fun b!47897 () Bool)

(assert (=> b!47897 (= e!31736 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72338))))) (currentByte!2891 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72338)))) (currentBit!2886 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72338))))) (bvadd lt!74184 lt!74186)))))

(assert (=> b!47897 (or (not (= (bvand lt!74184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74186 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74184 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74184 lt!74186) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47897 (= lt!74186 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47897 (= lt!74184 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)) (currentBit!2886 (_1!2358 lt!72338))))))

(declare-fun lt!74182 () Bool)

(assert (=> b!47897 (= lt!74182 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72338))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74187 () Bool)

(assert (=> b!47897 (= lt!74187 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72338))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74183 () Bool)

(assert (=> b!47897 (= lt!74183 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72338))) (currentByte!2891 (_1!2358 lt!72338)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72338))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14462 res!40273) b!47897))

(declare-fun m!74165 () Bool)

(assert (=> d!14462 m!74165))

(declare-fun m!74167 () Bool)

(assert (=> d!14462 m!74167))

(declare-fun m!74169 () Bool)

(assert (=> d!14462 m!74169))

(declare-fun m!74171 () Bool)

(assert (=> d!14462 m!74171))

(assert (=> b!47897 m!74169))

(declare-fun m!74173 () Bool)

(assert (=> b!47897 m!74173))

(declare-fun m!74175 () Bool)

(assert (=> b!47897 m!74175))

(assert (=> b!47897 m!74167))

(assert (=> b!47897 m!74165))

(assert (=> b!46984 d!14462))

(assert (=> d!13692 d!14446))

(assert (=> d!13692 d!13690))

(declare-fun d!14464 () Bool)

(declare-fun res!40274 () Bool)

(declare-fun e!31738 () Bool)

(assert (=> d!14464 (=> (not res!40274) (not e!31738))))

(assert (=> d!14464 (= res!40274 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72625)))))))

(assert (=> d!14464 (= (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72625)) e!31738)))

(declare-fun b!47898 () Bool)

(declare-fun res!40276 () Bool)

(assert (=> b!47898 (=> (not res!40276) (not e!31738))))

(assert (=> b!47898 (= res!40276 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72625))) (currentByte!2891 (_2!2357 lt!72625)) (currentBit!2886 (_2!2357 lt!72625)))))))

(declare-fun b!47899 () Bool)

(declare-fun e!31737 () Bool)

(assert (=> b!47899 (= e!31738 e!31737)))

(declare-fun res!40275 () Bool)

(assert (=> b!47899 (=> res!40275 e!31737)))

(assert (=> b!47899 (= res!40275 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000))))

(declare-fun b!47900 () Bool)

(assert (=> b!47900 (= e!31737 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72625)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (= (and d!14464 res!40274) b!47898))

(assert (= (and b!47898 res!40276) b!47899))

(assert (= (and b!47899 (not res!40275)) b!47900))

(assert (=> b!47898 m!71775))

(assert (=> b!47898 m!72083))

(assert (=> b!47900 m!71775))

(assert (=> b!47900 m!71775))

(declare-fun m!74177 () Bool)

(assert (=> b!47900 m!74177))

(assert (=> b!46928 d!14464))

(declare-fun d!14466 () Bool)

(declare-fun lt!74190 () tuple2!4536)

(assert (=> d!14466 (= lt!74190 (readBit!0 (readerFrom!0 (_2!2357 lt!72711) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379))))))

(assert (=> d!14466 (= (readBitPure!0 (readerFrom!0 (_2!2357 lt!72711) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379))) (tuple2!4543 (_2!2361 lt!74190) (_1!2361 lt!74190)))))

(declare-fun bs!3732 () Bool)

(assert (= bs!3732 d!14466))

(assert (=> bs!3732 m!72157))

(declare-fun m!74179 () Bool)

(assert (=> bs!3732 m!74179))

(assert (=> b!46971 d!14466))

(declare-fun d!14468 () Bool)

(declare-fun e!31741 () Bool)

(assert (=> d!14468 e!31741))

(declare-fun res!40280 () Bool)

(assert (=> d!14468 (=> (not res!40280) (not e!31741))))

(assert (=> d!14468 (= res!40280 (invariant!0 (currentBit!2886 (_2!2357 lt!72711)) (currentByte!2891 (_2!2357 lt!72711)) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(assert (=> d!14468 (= (readerFrom!0 (_2!2357 lt!72711) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379)) (BitStream!1807 (buf!1386 (_2!2357 lt!72711)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!47903 () Bool)

(assert (=> b!47903 (= e!31741 (invariant!0 (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(assert (= (and d!14468 res!40280) b!47903))

(declare-fun m!74181 () Bool)

(assert (=> d!14468 m!74181))

(declare-fun m!74183 () Bool)

(assert (=> b!47903 m!74183))

(assert (=> b!46971 d!14468))

(declare-fun d!14470 () Bool)

(assert (=> d!14470 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 thiss!1379)))))))

(assert (=> d!13686 d!14470))

(assert (=> b!46941 d!13748))

(assert (=> b!46941 d!13692))

(declare-fun d!14472 () Bool)

(declare-fun e!31744 () Bool)

(assert (=> d!14472 e!31744))

(declare-fun res!40295 () Bool)

(assert (=> d!14472 (=> (not res!40295) (not e!31744))))

(declare-fun lt!74217 () tuple2!4540)

(assert (=> d!14472 (= res!40295 (= (buf!1386 (_2!2363 lt!74217)) (buf!1386 lt!72707)))))

(declare-datatypes ((tuple3!176 0))(
  ( (tuple3!177 (_1!2378 Unit!3311) (_2!2378 BitStream!1806) (_3!98 array!2295)) )
))
(declare-fun lt!74209 () tuple3!176)

(assert (=> d!14472 (= lt!74217 (tuple2!4541 (_3!98 lt!74209) (_2!2378 lt!74209)))))

(declare-fun readBitsLoop!0 (BitStream!1806 (_ BitVec 64) array!2295 (_ BitVec 64) (_ BitVec 64)) tuple3!176)

(assert (=> d!14472 (= lt!74209 (readBitsLoop!0 lt!72707 #b0000000000000000000000000000000000000000000000000000000000000001 (array!2296 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!14472 (= (readBits!0 lt!72707 #b0000000000000000000000000000000000000000000000000000000000000001) lt!74217)))

(declare-fun b!47914 () Bool)

(declare-fun res!40293 () Bool)

(assert (=> b!47914 (=> (not res!40293) (not e!31744))))

(declare-fun lt!74216 () (_ BitVec 64))

(assert (=> b!47914 (= res!40293 (= (size!1037 (_1!2363 lt!74217)) ((_ extract 31 0) lt!74216)))))

(assert (=> b!47914 (and (bvslt lt!74216 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!74216 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!74215 () (_ BitVec 64))

(declare-fun lt!74214 () (_ BitVec 64))

(assert (=> b!47914 (= lt!74216 (bvsdiv lt!74215 lt!74214))))

(assert (=> b!47914 (and (not (= lt!74214 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!74215 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!74214 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!47914 (= lt!74214 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!74212 () (_ BitVec 64))

(declare-fun lt!74210 () (_ BitVec 64))

(assert (=> b!47914 (= lt!74215 (bvsub lt!74212 lt!74210))))

(assert (=> b!47914 (or (= (bvand lt!74212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74210 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74212 lt!74210) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47914 (= lt!74210 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74211 () (_ BitVec 64))

(assert (=> b!47914 (= lt!74212 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!74211))))

(assert (=> b!47914 (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74211 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!74211) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47914 (= lt!74211 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!47915 () Bool)

(assert (=> b!47915 (= e!31744 (= (byteArrayBitContentToList!0 (_2!2363 lt!74217) (_1!2363 lt!74217) #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bitStreamReadBitsIntoList!0 (_2!2363 lt!74217) lt!72707 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!47916 () Bool)

(declare-fun res!40291 () Bool)

(assert (=> b!47916 (=> (not res!40291) (not e!31744))))

(assert (=> b!47916 (= res!40291 (invariant!0 (currentBit!2886 (_2!2363 lt!74217)) (currentByte!2891 (_2!2363 lt!74217)) (size!1037 (buf!1386 (_2!2363 lt!74217)))))))

(declare-fun b!47917 () Bool)

(declare-fun res!40294 () Bool)

(assert (=> b!47917 (=> (not res!40294) (not e!31744))))

(assert (=> b!47917 (= res!40294 (bvsle (currentByte!2891 lt!72707) (currentByte!2891 (_2!2363 lt!74217))))))

(declare-fun b!47918 () Bool)

(declare-fun res!40292 () Bool)

(assert (=> b!47918 (=> (not res!40292) (not e!31744))))

(declare-fun lt!74213 () (_ BitVec 64))

(assert (=> b!47918 (= res!40292 (= (bvadd lt!74213 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!1037 (buf!1386 (_2!2363 lt!74217))) (currentByte!2891 (_2!2363 lt!74217)) (currentBit!2886 (_2!2363 lt!74217)))))))

(assert (=> b!47918 (or (not (= (bvand lt!74213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74213 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74213 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47918 (= lt!74213 (bitIndex!0 (size!1037 (buf!1386 lt!72707)) (currentByte!2891 lt!72707) (currentBit!2886 lt!72707)))))

(assert (= (and d!14472 res!40295) b!47918))

(assert (= (and b!47918 res!40292) b!47916))

(assert (= (and b!47916 res!40291) b!47914))

(assert (= (and b!47914 res!40293) b!47917))

(assert (= (and b!47917 res!40294) b!47915))

(declare-fun m!74185 () Bool)

(assert (=> d!14472 m!74185))

(declare-fun m!74187 () Bool)

(assert (=> b!47915 m!74187))

(declare-fun m!74189 () Bool)

(assert (=> b!47915 m!74189))

(declare-fun m!74191 () Bool)

(assert (=> b!47916 m!74191))

(declare-fun m!74193 () Bool)

(assert (=> b!47918 m!74193))

(declare-fun m!74195 () Bool)

(assert (=> b!47918 m!74195))

(assert (=> b!46969 d!14472))

(declare-fun d!14474 () Bool)

(declare-fun lt!74218 () tuple2!4536)

(assert (=> d!14474 (= lt!74218 (readBit!0 lt!72707))))

(assert (=> d!14474 (= (readBitPure!0 lt!72707) (tuple2!4543 (_2!2361 lt!74218) (_1!2361 lt!74218)))))

(declare-fun bs!3733 () Bool)

(assert (= bs!3733 d!14474))

(declare-fun m!74197 () Bool)

(assert (=> bs!3733 m!74197))

(assert (=> b!46969 d!14474))

(declare-fun d!14476 () Bool)

(declare-fun e!31745 () Bool)

(assert (=> d!14476 e!31745))

(declare-fun res!40296 () Bool)

(assert (=> d!14476 (=> (not res!40296) (not e!31745))))

(assert (=> d!14476 (= res!40296 (invariant!0 (currentBit!2886 (_2!2357 lt!72712)) (currentByte!2891 (_2!2357 lt!72712)) (size!1037 (buf!1386 (_2!2357 lt!72712)))))))

(assert (=> d!14476 (= (readerFrom!0 (_2!2357 lt!72712) (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379)) (BitStream!1807 (buf!1386 (_2!2357 lt!72712)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)))))

(declare-fun b!47919 () Bool)

(assert (=> b!47919 (= e!31745 (invariant!0 (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379) (size!1037 (buf!1386 (_2!2357 lt!72712)))))))

(assert (= (and d!14476 res!40296) b!47919))

(declare-fun m!74199 () Bool)

(assert (=> d!14476 m!74199))

(declare-fun m!74201 () Bool)

(assert (=> b!47919 m!74201))

(assert (=> b!46969 d!14476))

(declare-fun d!14478 () Bool)

(assert (=> d!14478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72616)))

(declare-fun lt!74219 () Unit!3311)

(assert (=> d!14478 (= lt!74219 (choose!9 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72625)) lt!72616 (BitStream!1807 (buf!1386 (_2!2357 lt!72625)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!14478 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72625)) lt!72616) lt!74219)))

(declare-fun bs!3734 () Bool)

(assert (= bs!3734 d!14478))

(assert (=> bs!3734 m!72079))

(declare-fun m!74203 () Bool)

(assert (=> bs!3734 m!74203))

(assert (=> b!46924 d!14478))

(declare-fun b!47923 () Bool)

(declare-fun e!31747 () Bool)

(declare-fun lt!74221 () List!544)

(assert (=> b!47923 (= e!31747 (> (length!239 lt!74221) 0))))

(declare-fun lt!74222 () (_ BitVec 64))

(declare-fun lt!74220 () tuple2!4536)

(declare-fun b!47921 () Bool)

(declare-fun e!31746 () tuple2!4538)

(assert (=> b!47921 (= e!31746 (tuple2!4539 (Cons!540 (_1!2361 lt!74220) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72625) (_2!2361 lt!74220) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74222))) (_2!2361 lt!74220)))))

(assert (=> b!47921 (= lt!74220 (readBit!0 (_1!2358 lt!72622)))))

(assert (=> b!47921 (= lt!74222 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!47920 () Bool)

(assert (=> b!47920 (= e!31746 (tuple2!4539 Nil!541 (_1!2358 lt!72622)))))

(declare-fun b!47922 () Bool)

(assert (=> b!47922 (= e!31747 (isEmpty!137 lt!74221))))

(declare-fun d!14480 () Bool)

(assert (=> d!14480 e!31747))

(declare-fun c!3332 () Bool)

(assert (=> d!14480 (= c!3332 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14480 (= lt!74221 (_1!2362 e!31746))))

(declare-fun c!3333 () Bool)

(assert (=> d!14480 (= c!3333 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14480 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14480 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72625) (_1!2358 lt!72622) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!74221)))

(assert (= (and d!14480 c!3333) b!47920))

(assert (= (and d!14480 (not c!3333)) b!47921))

(assert (= (and d!14480 c!3332) b!47922))

(assert (= (and d!14480 (not c!3332)) b!47923))

(declare-fun m!74205 () Bool)

(assert (=> b!47923 m!74205))

(declare-fun m!74207 () Bool)

(assert (=> b!47921 m!74207))

(declare-fun m!74209 () Bool)

(assert (=> b!47921 m!74209))

(declare-fun m!74211 () Bool)

(assert (=> b!47922 m!74211))

(assert (=> b!46924 d!14480))

(declare-fun d!14482 () Bool)

(declare-fun c!3334 () Bool)

(assert (=> d!14482 (= c!3334 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31748 () List!544)

(assert (=> d!14482 (= (byteArrayBitContentToList!0 (_2!2357 lt!72625) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31748)))

(declare-fun b!47924 () Bool)

(assert (=> b!47924 (= e!31748 Nil!541)))

(declare-fun b!47925 () Bool)

(assert (=> b!47925 (= e!31748 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72625) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14482 c!3334) b!47924))

(assert (= (and d!14482 (not c!3334)) b!47925))

(assert (=> b!47925 m!72023))

(declare-fun m!74213 () Bool)

(assert (=> b!47925 m!74213))

(declare-fun m!74215 () Bool)

(assert (=> b!47925 m!74215))

(assert (=> b!46924 d!14482))

(declare-fun b!47926 () Bool)

(declare-fun res!40297 () Bool)

(declare-fun e!31749 () Bool)

(assert (=> b!47926 (=> (not res!40297) (not e!31749))))

(declare-fun lt!74223 () tuple2!4530)

(assert (=> b!47926 (= res!40297 (isPrefixOf!0 (_2!2358 lt!74223) (_2!2357 lt!72625)))))

(declare-fun b!47927 () Bool)

(declare-fun lt!74227 () (_ BitVec 64))

(declare-fun lt!74230 () (_ BitVec 64))

(assert (=> b!47927 (= e!31749 (= (_1!2358 lt!74223) (withMovedBitIndex!0 (_2!2358 lt!74223) (bvsub lt!74227 lt!74230))))))

(assert (=> b!47927 (or (= (bvand lt!74227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74227 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74227 lt!74230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47927 (= lt!74230 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72625))) (currentByte!2891 (_2!2357 lt!72625)) (currentBit!2886 (_2!2357 lt!72625))))))

(assert (=> b!47927 (= lt!74227 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun b!47928 () Bool)

(declare-fun e!31750 () Unit!3311)

(declare-fun lt!74238 () Unit!3311)

(assert (=> b!47928 (= e!31750 lt!74238)))

(declare-fun lt!74233 () (_ BitVec 64))

(assert (=> b!47928 (= lt!74233 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74240 () (_ BitVec 64))

(assert (=> b!47928 (= lt!74240 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> b!47928 (= lt!74238 (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72625)) lt!74233 lt!74240))))

(assert (=> b!47928 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72625)) (buf!1386 (_2!2357 lt!72328)) lt!74233 lt!74240)))

(declare-fun b!47929 () Bool)

(declare-fun res!40299 () Bool)

(assert (=> b!47929 (=> (not res!40299) (not e!31749))))

(assert (=> b!47929 (= res!40299 (isPrefixOf!0 (_1!2358 lt!74223) (_2!2357 lt!72328)))))

(declare-fun d!14484 () Bool)

(assert (=> d!14484 e!31749))

(declare-fun res!40298 () Bool)

(assert (=> d!14484 (=> (not res!40298) (not e!31749))))

(assert (=> d!14484 (= res!40298 (isPrefixOf!0 (_1!2358 lt!74223) (_2!2358 lt!74223)))))

(declare-fun lt!74229 () BitStream!1806)

(assert (=> d!14484 (= lt!74223 (tuple2!4531 lt!74229 (_2!2357 lt!72625)))))

(declare-fun lt!74241 () Unit!3311)

(declare-fun lt!74231 () Unit!3311)

(assert (=> d!14484 (= lt!74241 lt!74231)))

(assert (=> d!14484 (isPrefixOf!0 lt!74229 (_2!2357 lt!72625))))

(assert (=> d!14484 (= lt!74231 (lemmaIsPrefixTransitive!0 lt!74229 (_2!2357 lt!72625) (_2!2357 lt!72625)))))

(declare-fun lt!74237 () Unit!3311)

(declare-fun lt!74239 () Unit!3311)

(assert (=> d!14484 (= lt!74237 lt!74239)))

(assert (=> d!14484 (isPrefixOf!0 lt!74229 (_2!2357 lt!72625))))

(assert (=> d!14484 (= lt!74239 (lemmaIsPrefixTransitive!0 lt!74229 (_2!2357 lt!72328) (_2!2357 lt!72625)))))

(declare-fun lt!74232 () Unit!3311)

(assert (=> d!14484 (= lt!74232 e!31750)))

(declare-fun c!3335 () Bool)

(assert (=> d!14484 (= c!3335 (not (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000)))))

(declare-fun lt!74228 () Unit!3311)

(declare-fun lt!74226 () Unit!3311)

(assert (=> d!14484 (= lt!74228 lt!74226)))

(assert (=> d!14484 (isPrefixOf!0 (_2!2357 lt!72625) (_2!2357 lt!72625))))

(assert (=> d!14484 (= lt!74226 (lemmaIsPrefixRefl!0 (_2!2357 lt!72625)))))

(declare-fun lt!74225 () Unit!3311)

(declare-fun lt!74224 () Unit!3311)

(assert (=> d!14484 (= lt!74225 lt!74224)))

(assert (=> d!14484 (= lt!74224 (lemmaIsPrefixRefl!0 (_2!2357 lt!72625)))))

(declare-fun lt!74242 () Unit!3311)

(declare-fun lt!74236 () Unit!3311)

(assert (=> d!14484 (= lt!74242 lt!74236)))

(assert (=> d!14484 (isPrefixOf!0 lt!74229 lt!74229)))

(assert (=> d!14484 (= lt!74236 (lemmaIsPrefixRefl!0 lt!74229))))

(declare-fun lt!74235 () Unit!3311)

(declare-fun lt!74234 () Unit!3311)

(assert (=> d!14484 (= lt!74235 lt!74234)))

(assert (=> d!14484 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!14484 (= lt!74234 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(assert (=> d!14484 (= lt!74229 (BitStream!1807 (buf!1386 (_2!2357 lt!72625)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!14484 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72625))))

(assert (=> d!14484 (= (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72625)) lt!74223)))

(declare-fun b!47930 () Bool)

(declare-fun Unit!3367 () Unit!3311)

(assert (=> b!47930 (= e!31750 Unit!3367)))

(assert (= (and d!14484 c!3335) b!47928))

(assert (= (and d!14484 (not c!3335)) b!47930))

(assert (= (and d!14484 res!40298) b!47929))

(assert (= (and b!47929 res!40299) b!47926))

(assert (= (and b!47926 res!40297) b!47927))

(declare-fun m!74217 () Bool)

(assert (=> b!47926 m!74217))

(declare-fun m!74219 () Bool)

(assert (=> b!47929 m!74219))

(declare-fun m!74221 () Bool)

(assert (=> b!47927 m!74221))

(assert (=> b!47927 m!72083))

(assert (=> b!47927 m!71775))

(declare-fun m!74223 () Bool)

(assert (=> d!14484 m!74223))

(declare-fun m!74225 () Bool)

(assert (=> d!14484 m!74225))

(declare-fun m!74227 () Bool)

(assert (=> d!14484 m!74227))

(assert (=> d!14484 m!72081))

(declare-fun m!74229 () Bool)

(assert (=> d!14484 m!74229))

(assert (=> d!14484 m!71939))

(declare-fun m!74231 () Bool)

(assert (=> d!14484 m!74231))

(declare-fun m!74233 () Bool)

(assert (=> d!14484 m!74233))

(declare-fun m!74235 () Bool)

(assert (=> d!14484 m!74235))

(assert (=> d!14484 m!71947))

(declare-fun m!74237 () Bool)

(assert (=> d!14484 m!74237))

(assert (=> b!47928 m!71775))

(declare-fun m!74239 () Bool)

(assert (=> b!47928 m!74239))

(declare-fun m!74241 () Bool)

(assert (=> b!47928 m!74241))

(assert (=> b!46924 d!14484))

(declare-fun d!14486 () Bool)

(assert (=> d!14486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72616) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72616))))

(declare-fun bs!3735 () Bool)

(assert (= bs!3735 d!14486))

(declare-fun m!74243 () Bool)

(assert (=> bs!3735 m!74243))

(assert (=> b!46924 d!14486))

(declare-fun d!14488 () Bool)

(declare-fun e!31751 () Bool)

(assert (=> d!14488 e!31751))

(declare-fun res!40300 () Bool)

(assert (=> d!14488 (=> (not res!40300) (not e!31751))))

(declare-fun lt!74245 () (_ BitVec 64))

(declare-fun lt!74243 () (_ BitVec 64))

(declare-fun lt!74246 () (_ BitVec 64))

(assert (=> d!14488 (= res!40300 (= lt!74243 (bvsub lt!74245 lt!74246)))))

(assert (=> d!14488 (or (= (bvand lt!74245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74246 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74245 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74245 lt!74246) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14488 (= lt!74246 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72712)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72712))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72712)))))))

(declare-fun lt!74248 () (_ BitVec 64))

(declare-fun lt!74247 () (_ BitVec 64))

(assert (=> d!14488 (= lt!74245 (bvmul lt!74248 lt!74247))))

(assert (=> d!14488 (or (= lt!74248 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74247 (bvsdiv (bvmul lt!74248 lt!74247) lt!74248)))))

(assert (=> d!14488 (= lt!74247 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14488 (= lt!74248 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72712)))))))

(assert (=> d!14488 (= lt!74243 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72712))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72712)))))))

(assert (=> d!14488 (invariant!0 (currentBit!2886 (_2!2357 lt!72712)) (currentByte!2891 (_2!2357 lt!72712)) (size!1037 (buf!1386 (_2!2357 lt!72712))))))

(assert (=> d!14488 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72712))) (currentByte!2891 (_2!2357 lt!72712)) (currentBit!2886 (_2!2357 lt!72712))) lt!74243)))

(declare-fun b!47931 () Bool)

(declare-fun res!40301 () Bool)

(assert (=> b!47931 (=> (not res!40301) (not e!31751))))

(assert (=> b!47931 (= res!40301 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74243))))

(declare-fun b!47932 () Bool)

(declare-fun lt!74244 () (_ BitVec 64))

(assert (=> b!47932 (= e!31751 (bvsle lt!74243 (bvmul lt!74244 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47932 (or (= lt!74244 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74244 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74244)))))

(assert (=> b!47932 (= lt!74244 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72712)))))))

(assert (= (and d!14488 res!40300) b!47931))

(assert (= (and b!47931 res!40301) b!47932))

(declare-fun m!74245 () Bool)

(assert (=> d!14488 m!74245))

(assert (=> d!14488 m!74199))

(assert (=> b!46967 d!14488))

(assert (=> b!46967 d!13748))

(assert (=> d!13716 d!13708))

(declare-fun d!14490 () Bool)

(assert (=> d!14490 (isPrefixOf!0 thiss!1379 (_2!2357 lt!72322))))

(assert (=> d!14490 true))

(declare-fun _$15!153 () Unit!3311)

(assert (=> d!14490 (= (choose!30 thiss!1379 (_2!2357 lt!72328) (_2!2357 lt!72322)) _$15!153)))

(declare-fun bs!3736 () Bool)

(assert (= bs!3736 d!14490))

(assert (=> bs!3736 m!71781))

(assert (=> d!13716 d!14490))

(assert (=> d!13716 d!13728))

(declare-fun d!14492 () Bool)

(declare-fun e!31752 () Bool)

(assert (=> d!14492 e!31752))

(declare-fun res!40302 () Bool)

(assert (=> d!14492 (=> (not res!40302) (not e!31752))))

(declare-fun lt!74251 () (_ BitVec 64))

(declare-fun lt!74249 () (_ BitVec 64))

(declare-fun lt!74252 () (_ BitVec 64))

(assert (=> d!14492 (= res!40302 (= lt!74249 (bvsub lt!74251 lt!74252)))))

(assert (=> d!14492 (or (= (bvand lt!74251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74251 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74251 lt!74252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14492 (= lt!74252 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72625))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72625)))))))

(declare-fun lt!74254 () (_ BitVec 64))

(declare-fun lt!74253 () (_ BitVec 64))

(assert (=> d!14492 (= lt!74251 (bvmul lt!74254 lt!74253))))

(assert (=> d!14492 (or (= lt!74254 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74253 (bvsdiv (bvmul lt!74254 lt!74253) lt!74254)))))

(assert (=> d!14492 (= lt!74253 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14492 (= lt!74254 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))))))

(assert (=> d!14492 (= lt!74249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72625))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72625)))))))

(assert (=> d!14492 (invariant!0 (currentBit!2886 (_2!2357 lt!72625)) (currentByte!2891 (_2!2357 lt!72625)) (size!1037 (buf!1386 (_2!2357 lt!72625))))))

(assert (=> d!14492 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72625))) (currentByte!2891 (_2!2357 lt!72625)) (currentBit!2886 (_2!2357 lt!72625))) lt!74249)))

(declare-fun b!47933 () Bool)

(declare-fun res!40303 () Bool)

(assert (=> b!47933 (=> (not res!40303) (not e!31752))))

(assert (=> b!47933 (= res!40303 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74249))))

(declare-fun b!47934 () Bool)

(declare-fun lt!74250 () (_ BitVec 64))

(assert (=> b!47934 (= e!31752 (bvsle lt!74249 (bvmul lt!74250 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47934 (or (= lt!74250 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74250 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74250)))))

(assert (=> b!47934 (= lt!74250 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72625)))))))

(assert (= (and d!14492 res!40302) b!47933))

(assert (= (and b!47933 res!40303) b!47934))

(declare-fun m!74247 () Bool)

(assert (=> d!14492 m!74247))

(assert (=> d!14492 m!72085))

(assert (=> d!13712 d!14492))

(assert (=> d!13712 d!13692))

(declare-fun d!14494 () Bool)

(declare-fun res!40304 () Bool)

(declare-fun e!31754 () Bool)

(assert (=> d!14494 (=> (not res!40304) (not e!31754))))

(assert (=> d!14494 (= res!40304 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!14494 (= (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328)) e!31754)))

(declare-fun b!47935 () Bool)

(declare-fun res!40306 () Bool)

(assert (=> b!47935 (=> (not res!40306) (not e!31754))))

(assert (=> b!47935 (= res!40306 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!47936 () Bool)

(declare-fun e!31753 () Bool)

(assert (=> b!47936 (= e!31754 e!31753)))

(declare-fun res!40305 () Bool)

(assert (=> b!47936 (=> res!40305 e!31753)))

(assert (=> b!47936 (= res!40305 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000))))

(declare-fun b!47937 () Bool)

(assert (=> b!47937 (= e!31753 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (= (and d!14494 res!40304) b!47935))

(assert (= (and b!47935 res!40306) b!47936))

(assert (= (and b!47936 (not res!40305)) b!47937))

(assert (=> b!47935 m!71775))

(assert (=> b!47935 m!71775))

(assert (=> b!47937 m!71775))

(assert (=> b!47937 m!71775))

(declare-fun m!74249 () Bool)

(assert (=> b!47937 m!74249))

(assert (=> d!13712 d!14494))

(declare-fun d!14496 () Bool)

(assert (=> d!14496 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(declare-fun lt!74255 () Unit!3311)

(assert (=> d!14496 (= lt!74255 (choose!11 (_2!2357 lt!72328)))))

(assert (=> d!14496 (= (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)) lt!74255)))

(declare-fun bs!3737 () Bool)

(assert (= bs!3737 d!14496))

(assert (=> bs!3737 m!71939))

(declare-fun m!74251 () Bool)

(assert (=> bs!3737 m!74251))

(assert (=> d!13712 d!14496))

(assert (=> b!46936 d!13748))

(declare-fun d!14498 () Bool)

(assert (=> d!14498 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 thiss!1379) lt!72664 lt!72671)))

(declare-fun lt!74256 () Unit!3311)

(assert (=> d!14498 (= lt!74256 (choose!8 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) lt!72664 lt!72671))))

(assert (=> d!14498 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72664) (bvsle lt!72664 lt!72671))))

(assert (=> d!14498 (= (arrayBitRangesEqSymmetric!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72328)) lt!72664 lt!72671) lt!74256)))

(declare-fun bs!3738 () Bool)

(assert (= bs!3738 d!14498))

(assert (=> bs!3738 m!72113))

(declare-fun m!74253 () Bool)

(assert (=> bs!3738 m!74253))

(assert (=> b!46936 d!14498))

(declare-fun lt!74258 () tuple4!18)

(declare-fun e!31758 () Bool)

(declare-fun b!47938 () Bool)

(assert (=> b!47938 (= e!31758 (arrayRangesEq!10 (buf!1386 (_2!2357 lt!72328)) (buf!1386 thiss!1379) (_1!2377 lt!74258) (_2!2377 lt!74258)))))

(declare-fun b!47939 () Bool)

(declare-fun e!31757 () Bool)

(declare-fun call!596 () Bool)

(assert (=> b!47939 (= e!31757 call!596)))

(declare-fun b!47940 () Bool)

(declare-fun e!31755 () Bool)

(declare-fun e!31756 () Bool)

(assert (=> b!47940 (= e!31755 e!31756)))

(declare-fun res!40310 () Bool)

(assert (=> b!47940 (=> (not res!40310) (not e!31756))))

(assert (=> b!47940 (= res!40310 e!31758)))

(declare-fun res!40309 () Bool)

(assert (=> b!47940 (=> res!40309 e!31758)))

(assert (=> b!47940 (= res!40309 (bvsge (_1!2377 lt!74258) (_2!2377 lt!74258)))))

(declare-fun lt!74259 () (_ BitVec 32))

(assert (=> b!47940 (= lt!74259 ((_ extract 31 0) (bvsrem lt!72671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74257 () (_ BitVec 32))

(assert (=> b!47940 (= lt!74257 ((_ extract 31 0) (bvsrem lt!72664 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47940 (= lt!74258 (arrayBitIndices!0 lt!72664 lt!72671))))

(declare-fun b!47941 () Bool)

(assert (=> b!47941 (= e!31756 e!31757)))

(declare-fun c!3336 () Bool)

(assert (=> b!47941 (= c!3336 (= (_3!97 lt!74258) (_4!9 lt!74258)))))

(declare-fun bm!593 () Bool)

(assert (=> bm!593 (= call!596 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_3!97 lt!74258)) (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74258)) lt!74257 (ite c!3336 lt!74259 #b00000000000000000000000000001000)))))

(declare-fun b!47942 () Bool)

(declare-fun res!40311 () Bool)

(assert (=> b!47942 (= res!40311 (= lt!74259 #b00000000000000000000000000000000))))

(declare-fun e!31759 () Bool)

(assert (=> b!47942 (=> res!40311 e!31759)))

(declare-fun e!31760 () Bool)

(assert (=> b!47942 (= e!31760 e!31759)))

(declare-fun b!47943 () Bool)

(assert (=> b!47943 (= e!31757 e!31760)))

(declare-fun res!40308 () Bool)

(assert (=> b!47943 (= res!40308 call!596)))

(assert (=> b!47943 (=> (not res!40308) (not e!31760))))

(declare-fun b!47944 () Bool)

(assert (=> b!47944 (= e!31759 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_4!9 lt!74258)) (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74258)) #b00000000000000000000000000000000 lt!74259))))

(declare-fun d!14500 () Bool)

(declare-fun res!40307 () Bool)

(assert (=> d!14500 (=> res!40307 e!31755)))

(assert (=> d!14500 (= res!40307 (bvsge lt!72664 lt!72671))))

(assert (=> d!14500 (= (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 thiss!1379) lt!72664 lt!72671) e!31755)))

(assert (= (and d!14500 (not res!40307)) b!47940))

(assert (= (and b!47940 (not res!40309)) b!47938))

(assert (= (and b!47940 res!40310) b!47941))

(assert (= (and b!47941 c!3336) b!47939))

(assert (= (and b!47941 (not c!3336)) b!47943))

(assert (= (and b!47943 res!40308) b!47942))

(assert (= (and b!47942 (not res!40311)) b!47944))

(assert (= (or b!47939 b!47943) bm!593))

(declare-fun m!74255 () Bool)

(assert (=> b!47938 m!74255))

(declare-fun m!74257 () Bool)

(assert (=> b!47940 m!74257))

(declare-fun m!74259 () Bool)

(assert (=> bm!593 m!74259))

(declare-fun m!74261 () Bool)

(assert (=> bm!593 m!74261))

(assert (=> bm!593 m!74259))

(assert (=> bm!593 m!74261))

(declare-fun m!74263 () Bool)

(assert (=> bm!593 m!74263))

(declare-fun m!74265 () Bool)

(assert (=> b!47944 m!74265))

(declare-fun m!74267 () Bool)

(assert (=> b!47944 m!74267))

(assert (=> b!47944 m!74265))

(assert (=> b!47944 m!74267))

(declare-fun m!74269 () Bool)

(assert (=> b!47944 m!74269))

(assert (=> b!46936 d!14500))

(declare-fun d!14502 () Bool)

(declare-fun res!40312 () Bool)

(declare-fun e!31762 () Bool)

(assert (=> d!14502 (=> (not res!40312) (not e!31762))))

(assert (=> d!14502 (= res!40312 (= (size!1037 (buf!1386 (_2!2358 lt!72654))) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!14502 (= (isPrefixOf!0 (_2!2358 lt!72654) (_2!2357 lt!72328)) e!31762)))

(declare-fun b!47945 () Bool)

(declare-fun res!40314 () Bool)

(assert (=> b!47945 (=> (not res!40314) (not e!31762))))

(assert (=> b!47945 (= res!40314 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72654))) (currentByte!2891 (_2!2358 lt!72654)) (currentBit!2886 (_2!2358 lt!72654))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!47946 () Bool)

(declare-fun e!31761 () Bool)

(assert (=> b!47946 (= e!31762 e!31761)))

(declare-fun res!40313 () Bool)

(assert (=> b!47946 (=> res!40313 e!31761)))

(assert (=> b!47946 (= res!40313 (= (size!1037 (buf!1386 (_2!2358 lt!72654))) #b00000000000000000000000000000000))))

(declare-fun b!47947 () Bool)

(assert (=> b!47947 (= e!31761 (arrayBitRangesEq!0 (buf!1386 (_2!2358 lt!72654)) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72654))) (currentByte!2891 (_2!2358 lt!72654)) (currentBit!2886 (_2!2358 lt!72654)))))))

(assert (= (and d!14502 res!40312) b!47945))

(assert (= (and b!47945 res!40314) b!47946))

(assert (= (and b!47946 (not res!40313)) b!47947))

(declare-fun m!74271 () Bool)

(assert (=> b!47945 m!74271))

(assert (=> b!47945 m!71775))

(assert (=> b!47947 m!74271))

(assert (=> b!47947 m!74271))

(declare-fun m!74273 () Bool)

(assert (=> b!47947 m!74273))

(assert (=> b!46934 d!14502))

(declare-fun d!14504 () Bool)

(declare-fun res!40315 () Bool)

(declare-fun e!31764 () Bool)

(assert (=> d!14504 (=> (not res!40315) (not e!31764))))

(assert (=> d!14504 (= res!40315 (= (size!1037 (buf!1386 thiss!1379)) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(assert (=> d!14504 (= (isPrefixOf!0 thiss!1379 (_2!2357 lt!72711)) e!31764)))

(declare-fun b!47948 () Bool)

(declare-fun res!40317 () Bool)

(assert (=> b!47948 (=> (not res!40317) (not e!31764))))

(assert (=> b!47948 (= res!40317 (bvsle (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72711))) (currentByte!2891 (_2!2357 lt!72711)) (currentBit!2886 (_2!2357 lt!72711)))))))

(declare-fun b!47949 () Bool)

(declare-fun e!31763 () Bool)

(assert (=> b!47949 (= e!31764 e!31763)))

(declare-fun res!40316 () Bool)

(assert (=> b!47949 (=> res!40316 e!31763)))

(assert (=> b!47949 (= res!40316 (= (size!1037 (buf!1386 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!47950 () Bool)

(assert (=> b!47950 (= e!31763 (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72711)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (= (and d!14504 res!40315) b!47948))

(assert (= (and b!47948 res!40317) b!47949))

(assert (= (and b!47949 (not res!40316)) b!47950))

(assert (=> b!47948 m!71749))

(assert (=> b!47948 m!72141))

(assert (=> b!47950 m!71749))

(assert (=> b!47950 m!71749))

(declare-fun m!74275 () Bool)

(assert (=> b!47950 m!74275))

(assert (=> b!46965 d!14504))

(declare-fun d!14506 () Bool)

(assert (=> d!14506 (= (invariant!0 (currentBit!2886 thiss!1379) (currentByte!2891 thiss!1379) (size!1037 (buf!1386 thiss!1379))) (and (bvsge (currentBit!2886 thiss!1379) #b00000000000000000000000000000000) (bvslt (currentBit!2886 thiss!1379) #b00000000000000000000000000001000) (bvsge (currentByte!2891 thiss!1379) #b00000000000000000000000000000000) (or (bvslt (currentByte!2891 thiss!1379) (size!1037 (buf!1386 thiss!1379))) (and (= (currentBit!2886 thiss!1379) #b00000000000000000000000000000000) (= (currentByte!2891 thiss!1379) (size!1037 (buf!1386 thiss!1379)))))))))

(assert (=> d!13698 d!14506))

(declare-fun e!31768 () Bool)

(declare-fun lt!74261 () tuple4!18)

(declare-fun b!47951 () Bool)

(assert (=> b!47951 (= e!31768 (arrayRangesEq!10 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) (_1!2377 lt!74261) (_2!2377 lt!74261)))))

(declare-fun b!47952 () Bool)

(declare-fun e!31767 () Bool)

(declare-fun call!597 () Bool)

(assert (=> b!47952 (= e!31767 call!597)))

(declare-fun b!47953 () Bool)

(declare-fun e!31765 () Bool)

(declare-fun e!31766 () Bool)

(assert (=> b!47953 (= e!31765 e!31766)))

(declare-fun res!40321 () Bool)

(assert (=> b!47953 (=> (not res!40321) (not e!31766))))

(assert (=> b!47953 (= res!40321 e!31768)))

(declare-fun res!40320 () Bool)

(assert (=> b!47953 (=> res!40320 e!31768)))

(assert (=> b!47953 (= res!40320 (bvsge (_1!2377 lt!74261) (_2!2377 lt!74261)))))

(declare-fun lt!74262 () (_ BitVec 32))

(assert (=> b!47953 (= lt!74262 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74260 () (_ BitVec 32))

(assert (=> b!47953 (= lt!74260 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47953 (= lt!74261 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!47954 () Bool)

(assert (=> b!47954 (= e!31766 e!31767)))

(declare-fun c!3337 () Bool)

(assert (=> b!47954 (= c!3337 (= (_3!97 lt!74261) (_4!9 lt!74261)))))

(declare-fun bm!594 () Bool)

(assert (=> bm!594 (= call!597 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_3!97 lt!74261)) (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_3!97 lt!74261)) lt!74260 (ite c!3337 lt!74262 #b00000000000000000000000000001000)))))

(declare-fun b!47955 () Bool)

(declare-fun res!40322 () Bool)

(assert (=> b!47955 (= res!40322 (= lt!74262 #b00000000000000000000000000000000))))

(declare-fun e!31769 () Bool)

(assert (=> b!47955 (=> res!40322 e!31769)))

(declare-fun e!31770 () Bool)

(assert (=> b!47955 (= e!31770 e!31769)))

(declare-fun b!47956 () Bool)

(assert (=> b!47956 (= e!31767 e!31770)))

(declare-fun res!40319 () Bool)

(assert (=> b!47956 (= res!40319 call!597)))

(assert (=> b!47956 (=> (not res!40319) (not e!31770))))

(declare-fun b!47957 () Bool)

(assert (=> b!47957 (= e!31769 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72328))) (_4!9 lt!74261)) (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_4!9 lt!74261)) #b00000000000000000000000000000000 lt!74262))))

(declare-fun d!14508 () Bool)

(declare-fun res!40318 () Bool)

(assert (=> d!14508 (=> res!40318 e!31765)))

(assert (=> d!14508 (= res!40318 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!14508 (= (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))) e!31765)))

(assert (= (and d!14508 (not res!40318)) b!47953))

(assert (= (and b!47953 (not res!40320)) b!47951))

(assert (= (and b!47953 res!40321) b!47954))

(assert (= (and b!47954 c!3337) b!47952))

(assert (= (and b!47954 (not c!3337)) b!47956))

(assert (= (and b!47956 res!40319) b!47955))

(assert (= (and b!47955 (not res!40322)) b!47957))

(assert (= (or b!47952 b!47956) bm!594))

(declare-fun m!74277 () Bool)

(assert (=> b!47951 m!74277))

(assert (=> b!47953 m!71775))

(declare-fun m!74279 () Bool)

(assert (=> b!47953 m!74279))

(declare-fun m!74281 () Bool)

(assert (=> bm!594 m!74281))

(declare-fun m!74283 () Bool)

(assert (=> bm!594 m!74283))

(assert (=> bm!594 m!74281))

(assert (=> bm!594 m!74283))

(declare-fun m!74285 () Bool)

(assert (=> bm!594 m!74285))

(declare-fun m!74287 () Bool)

(assert (=> b!47957 m!74287))

(declare-fun m!74289 () Bool)

(assert (=> b!47957 m!74289))

(assert (=> b!47957 m!74287))

(assert (=> b!47957 m!74289))

(declare-fun m!74291 () Bool)

(assert (=> b!47957 m!74291))

(assert (=> b!46933 d!14508))

(assert (=> b!46933 d!13692))

(assert (=> d!13710 d!13706))

(declare-fun d!14510 () Bool)

(assert (=> d!14510 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!14510 true))

(declare-fun _$6!191 () Unit!3311)

(assert (=> d!14510 (= (choose!9 thiss!1379 (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1807 (buf!1386 (_2!2357 lt!72328)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))) _$6!191)))

(declare-fun bs!3739 () Bool)

(assert (= bs!3739 d!14510))

(assert (=> bs!3739 m!71787))

(assert (=> d!13710 d!14510))

(assert (=> b!46886 d!13748))

(declare-fun d!14512 () Bool)

(assert (=> d!14512 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 thiss!1379) lt!72484 lt!72491)))

(declare-fun lt!74263 () Unit!3311)

(assert (=> d!14512 (= lt!74263 (choose!8 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) lt!72484 lt!72491))))

(assert (=> d!14512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72484) (bvsle lt!72484 lt!72491))))

(assert (=> d!14512 (= (arrayBitRangesEqSymmetric!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) lt!72484 lt!72491) lt!74263)))

(declare-fun bs!3740 () Bool)

(assert (= bs!3740 d!14512))

(assert (=> bs!3740 m!71985))

(declare-fun m!74293 () Bool)

(assert (=> bs!3740 m!74293))

(assert (=> b!46886 d!14512))

(declare-fun e!31774 () Bool)

(declare-fun lt!74265 () tuple4!18)

(declare-fun b!47958 () Bool)

(assert (=> b!47958 (= e!31774 (arrayRangesEq!10 (buf!1386 (_2!2357 lt!72322)) (buf!1386 thiss!1379) (_1!2377 lt!74265) (_2!2377 lt!74265)))))

(declare-fun b!47959 () Bool)

(declare-fun e!31773 () Bool)

(declare-fun call!598 () Bool)

(assert (=> b!47959 (= e!31773 call!598)))

(declare-fun b!47960 () Bool)

(declare-fun e!31771 () Bool)

(declare-fun e!31772 () Bool)

(assert (=> b!47960 (= e!31771 e!31772)))

(declare-fun res!40326 () Bool)

(assert (=> b!47960 (=> (not res!40326) (not e!31772))))

(assert (=> b!47960 (= res!40326 e!31774)))

(declare-fun res!40325 () Bool)

(assert (=> b!47960 (=> res!40325 e!31774)))

(assert (=> b!47960 (= res!40325 (bvsge (_1!2377 lt!74265) (_2!2377 lt!74265)))))

(declare-fun lt!74266 () (_ BitVec 32))

(assert (=> b!47960 (= lt!74266 ((_ extract 31 0) (bvsrem lt!72491 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74264 () (_ BitVec 32))

(assert (=> b!47960 (= lt!74264 ((_ extract 31 0) (bvsrem lt!72484 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47960 (= lt!74265 (arrayBitIndices!0 lt!72484 lt!72491))))

(declare-fun b!47961 () Bool)

(assert (=> b!47961 (= e!31772 e!31773)))

(declare-fun c!3338 () Bool)

(assert (=> b!47961 (= c!3338 (= (_3!97 lt!74265) (_4!9 lt!74265)))))

(declare-fun bm!595 () Bool)

(assert (=> bm!595 (= call!598 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_3!97 lt!74265)) (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74265)) lt!74264 (ite c!3338 lt!74266 #b00000000000000000000000000001000)))))

(declare-fun b!47962 () Bool)

(declare-fun res!40327 () Bool)

(assert (=> b!47962 (= res!40327 (= lt!74266 #b00000000000000000000000000000000))))

(declare-fun e!31775 () Bool)

(assert (=> b!47962 (=> res!40327 e!31775)))

(declare-fun e!31776 () Bool)

(assert (=> b!47962 (= e!31776 e!31775)))

(declare-fun b!47963 () Bool)

(assert (=> b!47963 (= e!31773 e!31776)))

(declare-fun res!40324 () Bool)

(assert (=> b!47963 (= res!40324 call!598)))

(assert (=> b!47963 (=> (not res!40324) (not e!31776))))

(declare-fun b!47964 () Bool)

(assert (=> b!47964 (= e!31775 (byteRangesEq!0 (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_4!9 lt!74265)) (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74265)) #b00000000000000000000000000000000 lt!74266))))

(declare-fun d!14514 () Bool)

(declare-fun res!40323 () Bool)

(assert (=> d!14514 (=> res!40323 e!31771)))

(assert (=> d!14514 (= res!40323 (bvsge lt!72484 lt!72491))))

(assert (=> d!14514 (= (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 thiss!1379) lt!72484 lt!72491) e!31771)))

(assert (= (and d!14514 (not res!40323)) b!47960))

(assert (= (and b!47960 (not res!40325)) b!47958))

(assert (= (and b!47960 res!40326) b!47961))

(assert (= (and b!47961 c!3338) b!47959))

(assert (= (and b!47961 (not c!3338)) b!47963))

(assert (= (and b!47963 res!40324) b!47962))

(assert (= (and b!47962 (not res!40327)) b!47964))

(assert (= (or b!47959 b!47963) bm!595))

(declare-fun m!74295 () Bool)

(assert (=> b!47958 m!74295))

(declare-fun m!74297 () Bool)

(assert (=> b!47960 m!74297))

(declare-fun m!74299 () Bool)

(assert (=> bm!595 m!74299))

(declare-fun m!74301 () Bool)

(assert (=> bm!595 m!74301))

(assert (=> bm!595 m!74299))

(assert (=> bm!595 m!74301))

(declare-fun m!74303 () Bool)

(assert (=> bm!595 m!74303))

(declare-fun m!74305 () Bool)

(assert (=> b!47964 m!74305))

(declare-fun m!74307 () Bool)

(assert (=> b!47964 m!74307))

(assert (=> b!47964 m!74305))

(assert (=> b!47964 m!74307))

(declare-fun m!74309 () Bool)

(assert (=> b!47964 m!74309))

(assert (=> b!46886 d!14514))

(declare-fun d!14516 () Bool)

(declare-fun res!40328 () Bool)

(declare-fun e!31778 () Bool)

(assert (=> d!14516 (=> (not res!40328) (not e!31778))))

(assert (=> d!14516 (= res!40328 (= (size!1037 (buf!1386 (_2!2358 lt!72474))) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!14516 (= (isPrefixOf!0 (_2!2358 lt!72474) (_2!2357 lt!72322)) e!31778)))

(declare-fun b!47965 () Bool)

(declare-fun res!40330 () Bool)

(assert (=> b!47965 (=> (not res!40330) (not e!31778))))

(assert (=> b!47965 (= res!40330 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72474))) (currentByte!2891 (_2!2358 lt!72474)) (currentBit!2886 (_2!2358 lt!72474))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!47966 () Bool)

(declare-fun e!31777 () Bool)

(assert (=> b!47966 (= e!31778 e!31777)))

(declare-fun res!40329 () Bool)

(assert (=> b!47966 (=> res!40329 e!31777)))

(assert (=> b!47966 (= res!40329 (= (size!1037 (buf!1386 (_2!2358 lt!72474))) #b00000000000000000000000000000000))))

(declare-fun b!47967 () Bool)

(assert (=> b!47967 (= e!31777 (arrayBitRangesEq!0 (buf!1386 (_2!2358 lt!72474)) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72474))) (currentByte!2891 (_2!2358 lt!72474)) (currentBit!2886 (_2!2358 lt!72474)))))))

(assert (= (and d!14516 res!40328) b!47965))

(assert (= (and b!47965 res!40330) b!47966))

(assert (= (and b!47966 (not res!40329)) b!47967))

(assert (=> b!47965 m!74061))

(assert (=> b!47965 m!71751))

(assert (=> b!47967 m!74061))

(assert (=> b!47967 m!74061))

(declare-fun m!74311 () Bool)

(assert (=> b!47967 m!74311))

(assert (=> b!46884 d!14516))

(assert (=> b!46931 d!13692))

(assert (=> b!46931 d!13722))

(declare-fun d!14518 () Bool)

(assert (=> d!14518 (= (length!239 lt!72472) (size!1039 lt!72472))))

(declare-fun bs!3741 () Bool)

(assert (= bs!3741 d!14518))

(declare-fun m!74313 () Bool)

(assert (=> bs!3741 m!74313))

(assert (=> b!46883 d!14518))

(assert (=> d!13718 d!14494))

(assert (=> d!13718 d!13744))

(declare-fun d!14520 () Bool)

(assert (=> d!14520 (isPrefixOf!0 lt!72660 (_2!2357 lt!72328))))

(declare-fun lt!74267 () Unit!3311)

(assert (=> d!14520 (= lt!74267 (choose!30 lt!72660 (_2!2357 lt!72328) (_2!2357 lt!72328)))))

(assert (=> d!14520 (isPrefixOf!0 lt!72660 (_2!2357 lt!72328))))

(assert (=> d!14520 (= (lemmaIsPrefixTransitive!0 lt!72660 (_2!2357 lt!72328) (_2!2357 lt!72328)) lt!74267)))

(declare-fun bs!3742 () Bool)

(assert (= bs!3742 d!14520))

(assert (=> bs!3742 m!72109))

(declare-fun m!74315 () Bool)

(assert (=> bs!3742 m!74315))

(assert (=> bs!3742 m!72109))

(assert (=> d!13718 d!14520))

(declare-fun d!14522 () Bool)

(assert (=> d!14522 (isPrefixOf!0 lt!72660 lt!72660)))

(declare-fun lt!74268 () Unit!3311)

(assert (=> d!14522 (= lt!74268 (choose!11 lt!72660))))

(assert (=> d!14522 (= (lemmaIsPrefixRefl!0 lt!72660) lt!74268)))

(declare-fun bs!3743 () Bool)

(assert (= bs!3743 d!14522))

(assert (=> bs!3743 m!72103))

(declare-fun m!74317 () Bool)

(assert (=> bs!3743 m!74317))

(assert (=> d!13718 d!14522))

(assert (=> d!13718 d!14496))

(assert (=> d!13718 d!13728))

(declare-fun d!14524 () Bool)

(declare-fun res!40331 () Bool)

(declare-fun e!31780 () Bool)

(assert (=> d!14524 (=> (not res!40331) (not e!31780))))

(assert (=> d!14524 (= res!40331 (= (size!1037 (buf!1386 lt!72660)) (size!1037 (buf!1386 lt!72660))))))

(assert (=> d!14524 (= (isPrefixOf!0 lt!72660 lt!72660) e!31780)))

(declare-fun b!47968 () Bool)

(declare-fun res!40333 () Bool)

(assert (=> b!47968 (=> (not res!40333) (not e!31780))))

(assert (=> b!47968 (= res!40333 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72660)) (currentByte!2891 lt!72660) (currentBit!2886 lt!72660)) (bitIndex!0 (size!1037 (buf!1386 lt!72660)) (currentByte!2891 lt!72660) (currentBit!2886 lt!72660))))))

(declare-fun b!47969 () Bool)

(declare-fun e!31779 () Bool)

(assert (=> b!47969 (= e!31780 e!31779)))

(declare-fun res!40332 () Bool)

(assert (=> b!47969 (=> res!40332 e!31779)))

(assert (=> b!47969 (= res!40332 (= (size!1037 (buf!1386 lt!72660)) #b00000000000000000000000000000000))))

(declare-fun b!47970 () Bool)

(assert (=> b!47970 (= e!31779 (arrayBitRangesEq!0 (buf!1386 lt!72660) (buf!1386 lt!72660) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72660)) (currentByte!2891 lt!72660) (currentBit!2886 lt!72660))))))

(assert (= (and d!14524 res!40331) b!47968))

(assert (= (and b!47968 res!40333) b!47969))

(assert (= (and b!47969 (not res!40332)) b!47970))

(declare-fun m!74319 () Bool)

(assert (=> b!47968 m!74319))

(assert (=> b!47968 m!74319))

(assert (=> b!47970 m!74319))

(assert (=> b!47970 m!74319))

(declare-fun m!74321 () Bool)

(assert (=> b!47970 m!74321))

(assert (=> d!13718 d!14524))

(declare-fun d!14526 () Bool)

(declare-fun res!40334 () Bool)

(declare-fun e!31782 () Bool)

(assert (=> d!14526 (=> (not res!40334) (not e!31782))))

(assert (=> d!14526 (= res!40334 (= (size!1037 (buf!1386 (_1!2358 lt!72654))) (size!1037 (buf!1386 (_2!2358 lt!72654)))))))

(assert (=> d!14526 (= (isPrefixOf!0 (_1!2358 lt!72654) (_2!2358 lt!72654)) e!31782)))

(declare-fun b!47971 () Bool)

(declare-fun res!40336 () Bool)

(assert (=> b!47971 (=> (not res!40336) (not e!31782))))

(assert (=> b!47971 (= res!40336 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72654))) (currentByte!2891 (_1!2358 lt!72654)) (currentBit!2886 (_1!2358 lt!72654))) (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72654))) (currentByte!2891 (_2!2358 lt!72654)) (currentBit!2886 (_2!2358 lt!72654)))))))

(declare-fun b!47972 () Bool)

(declare-fun e!31781 () Bool)

(assert (=> b!47972 (= e!31782 e!31781)))

(declare-fun res!40335 () Bool)

(assert (=> b!47972 (=> res!40335 e!31781)))

(assert (=> b!47972 (= res!40335 (= (size!1037 (buf!1386 (_1!2358 lt!72654))) #b00000000000000000000000000000000))))

(declare-fun b!47973 () Bool)

(assert (=> b!47973 (= e!31781 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72654)) (buf!1386 (_2!2358 lt!72654)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72654))) (currentByte!2891 (_1!2358 lt!72654)) (currentBit!2886 (_1!2358 lt!72654)))))))

(assert (= (and d!14526 res!40334) b!47971))

(assert (= (and b!47971 res!40336) b!47972))

(assert (= (and b!47972 (not res!40335)) b!47973))

(declare-fun m!74323 () Bool)

(assert (=> b!47971 m!74323))

(assert (=> b!47971 m!74271))

(assert (=> b!47973 m!74323))

(assert (=> b!47973 m!74323))

(declare-fun m!74325 () Bool)

(assert (=> b!47973 m!74325))

(assert (=> d!13718 d!14526))

(declare-fun d!14528 () Bool)

(declare-fun res!40337 () Bool)

(declare-fun e!31784 () Bool)

(assert (=> d!14528 (=> (not res!40337) (not e!31784))))

(assert (=> d!14528 (= res!40337 (= (size!1037 (buf!1386 lt!72660)) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!14528 (= (isPrefixOf!0 lt!72660 (_2!2357 lt!72328)) e!31784)))

(declare-fun b!47974 () Bool)

(declare-fun res!40339 () Bool)

(assert (=> b!47974 (=> (not res!40339) (not e!31784))))

(assert (=> b!47974 (= res!40339 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72660)) (currentByte!2891 lt!72660) (currentBit!2886 lt!72660)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!47975 () Bool)

(declare-fun e!31783 () Bool)

(assert (=> b!47975 (= e!31784 e!31783)))

(declare-fun res!40338 () Bool)

(assert (=> b!47975 (=> res!40338 e!31783)))

(assert (=> b!47975 (= res!40338 (= (size!1037 (buf!1386 lt!72660)) #b00000000000000000000000000000000))))

(declare-fun b!47976 () Bool)

(assert (=> b!47976 (= e!31783 (arrayBitRangesEq!0 (buf!1386 lt!72660) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72660)) (currentByte!2891 lt!72660) (currentBit!2886 lt!72660))))))

(assert (= (and d!14528 res!40337) b!47974))

(assert (= (and b!47974 res!40339) b!47975))

(assert (= (and b!47975 (not res!40338)) b!47976))

(assert (=> b!47974 m!74319))

(assert (=> b!47974 m!71775))

(assert (=> b!47976 m!74319))

(assert (=> b!47976 m!74319))

(declare-fun m!74327 () Bool)

(assert (=> b!47976 m!74327))

(assert (=> d!13718 d!14528))

(assert (=> d!13718 d!13746))

(declare-fun d!14530 () Bool)

(assert (=> d!14530 (isPrefixOf!0 lt!72660 (_2!2357 lt!72328))))

(declare-fun lt!74269 () Unit!3311)

(assert (=> d!14530 (= lt!74269 (choose!30 lt!72660 thiss!1379 (_2!2357 lt!72328)))))

(assert (=> d!14530 (isPrefixOf!0 lt!72660 thiss!1379)))

(assert (=> d!14530 (= (lemmaIsPrefixTransitive!0 lt!72660 thiss!1379 (_2!2357 lt!72328)) lt!74269)))

(declare-fun bs!3744 () Bool)

(assert (= bs!3744 d!14530))

(assert (=> bs!3744 m!72109))

(declare-fun m!74329 () Bool)

(assert (=> bs!3744 m!74329))

(declare-fun m!74331 () Bool)

(assert (=> bs!3744 m!74331))

(assert (=> d!13718 d!14530))

(declare-fun d!14532 () Bool)

(assert (=> d!14532 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!14532 true))

(declare-fun _$1!297 () Unit!3311)

(assert (=> d!14532 (= (choose!27 thiss!1379 (_2!2357 lt!72328) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) _$1!297)))

(declare-fun bs!3745 () Bool)

(assert (= bs!3745 d!14532))

(assert (=> bs!3745 m!72129))

(assert (=> d!13732 d!14532))

(declare-fun b!47980 () Bool)

(declare-fun e!31786 () Bool)

(declare-fun lt!74271 () List!544)

(assert (=> b!47980 (= e!31786 (> (length!239 lt!74271) 0))))

(declare-fun lt!74270 () tuple2!4536)

(declare-fun lt!74272 () (_ BitVec 64))

(declare-fun b!47978 () Bool)

(declare-fun e!31785 () tuple2!4538)

(assert (=> b!47978 (= e!31785 (tuple2!4539 (Cons!540 (_1!2361 lt!74270) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!74270) (bvsub (bvsub (bvsub to!314 i!635) lt!72473) lt!74272))) (_2!2361 lt!74270)))))

(assert (=> b!47978 (= lt!74270 (readBit!0 (_2!2361 lt!72471)))))

(assert (=> b!47978 (= lt!74272 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!47977 () Bool)

(assert (=> b!47977 (= e!31785 (tuple2!4539 Nil!541 (_2!2361 lt!72471)))))

(declare-fun b!47979 () Bool)

(assert (=> b!47979 (= e!31786 (isEmpty!137 lt!74271))))

(declare-fun d!14534 () Bool)

(assert (=> d!14534 e!31786))

(declare-fun c!3339 () Bool)

(assert (=> d!14534 (= c!3339 (= (bvsub (bvsub to!314 i!635) lt!72473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14534 (= lt!74271 (_1!2362 e!31785))))

(declare-fun c!3340 () Bool)

(assert (=> d!14534 (= c!3340 (= (bvsub (bvsub to!314 i!635) lt!72473) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14534 (bvsge (bvsub (bvsub to!314 i!635) lt!72473) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14534 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_2!2361 lt!72471) (bvsub (bvsub to!314 i!635) lt!72473)) lt!74271)))

(assert (= (and d!14534 c!3340) b!47977))

(assert (= (and d!14534 (not c!3340)) b!47978))

(assert (= (and d!14534 c!3339) b!47979))

(assert (= (and d!14534 (not c!3339)) b!47980))

(declare-fun m!74333 () Bool)

(assert (=> b!47980 m!74333))

(declare-fun m!74335 () Bool)

(assert (=> b!47978 m!74335))

(declare-fun m!74337 () Bool)

(assert (=> b!47978 m!74337))

(declare-fun m!74339 () Bool)

(assert (=> b!47979 m!74339))

(assert (=> b!46881 d!14534))

(declare-fun d!14536 () Bool)

(declare-fun e!31787 () Bool)

(assert (=> d!14536 e!31787))

(declare-fun res!40340 () Bool)

(assert (=> d!14536 (=> (not res!40340) (not e!31787))))

(assert (=> d!14536 (= res!40340 (= (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72329)))) (buf!1386 (_1!2358 lt!72329))))))

(declare-fun lt!74277 () Bool)

(assert (=> d!14536 (= lt!74277 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72329))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74273 () tuple2!4536)

(assert (=> d!14536 (= lt!74273 (tuple2!4537 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72329))))) #b00000000000000000000000000000000)) (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72329)))))))

(assert (=> d!14536 (validate_offset_bit!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2358 lt!72329)))) ((_ sign_extend 32) (currentByte!2891 (_1!2358 lt!72329))) ((_ sign_extend 32) (currentBit!2886 (_1!2358 lt!72329))))))

(assert (=> d!14536 (= (readBit!0 (_1!2358 lt!72329)) lt!74273)))

(declare-fun lt!74278 () (_ BitVec 64))

(declare-fun b!47981 () Bool)

(declare-fun lt!74276 () (_ BitVec 64))

(assert (=> b!47981 (= e!31787 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72329))))) (currentByte!2891 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72329)))) (currentBit!2886 (_2!2357 (increaseBitIndex!0 (_1!2358 lt!72329))))) (bvadd lt!74276 lt!74278)))))

(assert (=> b!47981 (or (not (= (bvand lt!74276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74278 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74276 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74276 lt!74278) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!47981 (= lt!74278 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!47981 (= lt!74276 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)) (currentBit!2886 (_1!2358 lt!72329))))))

(declare-fun lt!74274 () Bool)

(assert (=> b!47981 (= lt!74274 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72329))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74279 () Bool)

(assert (=> b!47981 (= lt!74279 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72329))))) #b00000000000000000000000000000000)))))

(declare-fun lt!74275 () Bool)

(assert (=> b!47981 (= lt!74275 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_1!2358 lt!72329))) (currentByte!2891 (_1!2358 lt!72329)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!2886 (_1!2358 lt!72329))))) #b00000000000000000000000000000000)))))

(assert (= (and d!14536 res!40340) b!47981))

(declare-fun m!74341 () Bool)

(assert (=> d!14536 m!74341))

(declare-fun m!74343 () Bool)

(assert (=> d!14536 m!74343))

(declare-fun m!74345 () Bool)

(assert (=> d!14536 m!74345))

(declare-fun m!74347 () Bool)

(assert (=> d!14536 m!74347))

(assert (=> b!47981 m!74345))

(declare-fun m!74349 () Bool)

(assert (=> b!47981 m!74349))

(declare-fun m!74351 () Bool)

(assert (=> b!47981 m!74351))

(assert (=> b!47981 m!74343))

(assert (=> b!47981 m!74341))

(assert (=> b!46881 d!14536))

(declare-fun d!14538 () Bool)

(assert (=> d!14538 (= (isEmpty!137 lt!72409) ((_ is Nil!541) lt!72409))))

(assert (=> b!46863 d!14538))

(declare-fun d!14540 () Bool)

(declare-fun res!40341 () Bool)

(declare-fun e!31789 () Bool)

(assert (=> d!14540 (=> (not res!40341) (not e!31789))))

(assert (=> d!14540 (= res!40341 (= (size!1037 (buf!1386 (_1!2358 lt!72451))) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(assert (=> d!14540 (= (isPrefixOf!0 (_1!2358 lt!72451) (_2!2357 lt!72328)) e!31789)))

(declare-fun b!47982 () Bool)

(declare-fun res!40343 () Bool)

(assert (=> b!47982 (=> (not res!40343) (not e!31789))))

(assert (=> b!47982 (= res!40343 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72451))) (currentByte!2891 (_1!2358 lt!72451)) (currentBit!2886 (_1!2358 lt!72451))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(declare-fun b!47983 () Bool)

(declare-fun e!31788 () Bool)

(assert (=> b!47983 (= e!31789 e!31788)))

(declare-fun res!40342 () Bool)

(assert (=> b!47983 (=> res!40342 e!31788)))

(assert (=> b!47983 (= res!40342 (= (size!1037 (buf!1386 (_1!2358 lt!72451))) #b00000000000000000000000000000000))))

(declare-fun b!47984 () Bool)

(assert (=> b!47984 (= e!31788 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72451)) (buf!1386 (_2!2357 lt!72328)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72451))) (currentByte!2891 (_1!2358 lt!72451)) (currentBit!2886 (_1!2358 lt!72451)))))))

(assert (= (and d!14540 res!40341) b!47982))

(assert (= (and b!47982 res!40343) b!47983))

(assert (= (and b!47983 (not res!40342)) b!47984))

(declare-fun m!74353 () Bool)

(assert (=> b!47982 m!74353))

(assert (=> b!47982 m!71775))

(assert (=> b!47984 m!74353))

(assert (=> b!47984 m!74353))

(declare-fun m!74355 () Bool)

(assert (=> b!47984 m!74355))

(assert (=> b!46878 d!14540))

(declare-fun lt!74281 () tuple4!18)

(declare-fun b!47985 () Bool)

(declare-fun e!31793 () Bool)

(assert (=> b!47985 (= e!31793 (arrayRangesEq!10 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) (_1!2377 lt!74281) (_2!2377 lt!74281)))))

(declare-fun b!47986 () Bool)

(declare-fun e!31792 () Bool)

(declare-fun call!599 () Bool)

(assert (=> b!47986 (= e!31792 call!599)))

(declare-fun b!47987 () Bool)

(declare-fun e!31790 () Bool)

(declare-fun e!31791 () Bool)

(assert (=> b!47987 (= e!31790 e!31791)))

(declare-fun res!40347 () Bool)

(assert (=> b!47987 (=> (not res!40347) (not e!31791))))

(assert (=> b!47987 (= res!40347 e!31793)))

(declare-fun res!40346 () Bool)

(assert (=> b!47987 (=> res!40346 e!31793)))

(assert (=> b!47987 (= res!40346 (bvsge (_1!2377 lt!74281) (_2!2377 lt!74281)))))

(declare-fun lt!74282 () (_ BitVec 32))

(assert (=> b!47987 (= lt!74282 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74280 () (_ BitVec 32))

(assert (=> b!47987 (= lt!74280 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!47987 (= lt!74281 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!47988 () Bool)

(assert (=> b!47988 (= e!31791 e!31792)))

(declare-fun c!3341 () Bool)

(assert (=> b!47988 (= c!3341 (= (_3!97 lt!74281) (_4!9 lt!74281)))))

(declare-fun bm!596 () Bool)

(assert (=> bm!596 (= call!599 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74281)) (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_3!97 lt!74281)) lt!74280 (ite c!3341 lt!74282 #b00000000000000000000000000001000)))))

(declare-fun b!47989 () Bool)

(declare-fun res!40348 () Bool)

(assert (=> b!47989 (= res!40348 (= lt!74282 #b00000000000000000000000000000000))))

(declare-fun e!31794 () Bool)

(assert (=> b!47989 (=> res!40348 e!31794)))

(declare-fun e!31795 () Bool)

(assert (=> b!47989 (= e!31795 e!31794)))

(declare-fun b!47990 () Bool)

(assert (=> b!47990 (= e!31792 e!31795)))

(declare-fun res!40345 () Bool)

(assert (=> b!47990 (= res!40345 call!599)))

(assert (=> b!47990 (=> (not res!40345) (not e!31795))))

(declare-fun b!47991 () Bool)

(assert (=> b!47991 (= e!31794 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74281)) (select (arr!1557 (buf!1386 (_2!2357 lt!72322))) (_4!9 lt!74281)) #b00000000000000000000000000000000 lt!74282))))

(declare-fun d!14542 () Bool)

(declare-fun res!40344 () Bool)

(assert (=> d!14542 (=> res!40344 e!31790)))

(assert (=> d!14542 (= res!40344 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (=> d!14542 (= (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))) e!31790)))

(assert (= (and d!14542 (not res!40344)) b!47987))

(assert (= (and b!47987 (not res!40346)) b!47985))

(assert (= (and b!47987 res!40347) b!47988))

(assert (= (and b!47988 c!3341) b!47986))

(assert (= (and b!47988 (not c!3341)) b!47990))

(assert (= (and b!47990 res!40345) b!47989))

(assert (= (and b!47989 (not res!40348)) b!47991))

(assert (= (or b!47986 b!47990) bm!596))

(declare-fun m!74357 () Bool)

(assert (=> b!47985 m!74357))

(assert (=> b!47987 m!71749))

(assert (=> b!47987 m!74141))

(declare-fun m!74359 () Bool)

(assert (=> bm!596 m!74359))

(declare-fun m!74361 () Bool)

(assert (=> bm!596 m!74361))

(assert (=> bm!596 m!74359))

(assert (=> bm!596 m!74361))

(declare-fun m!74363 () Bool)

(assert (=> bm!596 m!74363))

(declare-fun m!74365 () Bool)

(assert (=> b!47991 m!74365))

(declare-fun m!74367 () Bool)

(assert (=> b!47991 m!74367))

(assert (=> b!47991 m!74365))

(assert (=> b!47991 m!74367))

(declare-fun m!74369 () Bool)

(assert (=> b!47991 m!74369))

(assert (=> b!46906 d!14542))

(assert (=> b!46906 d!13748))

(declare-fun d!14544 () Bool)

(declare-fun e!31796 () Bool)

(assert (=> d!14544 e!31796))

(declare-fun res!40349 () Bool)

(assert (=> d!14544 (=> (not res!40349) (not e!31796))))

(declare-fun lt!74283 () BitStream!1806)

(declare-fun lt!74284 () (_ BitVec 64))

(assert (=> d!14544 (= res!40349 (= (bvadd lt!74284 (bvsub lt!72455 lt!72458)) (bitIndex!0 (size!1037 (buf!1386 lt!74283)) (currentByte!2891 lt!74283) (currentBit!2886 lt!74283))))))

(assert (=> d!14544 (or (not (= (bvand lt!74284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72455 lt!72458) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74284 (bvsub lt!72455 lt!72458)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14544 (= lt!74284 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72451))) (currentByte!2891 (_2!2358 lt!72451)) (currentBit!2886 (_2!2358 lt!72451))))))

(assert (=> d!14544 (= lt!74283 (_2!2357 (moveBitIndex!0 (_2!2358 lt!72451) (bvsub lt!72455 lt!72458))))))

(assert (=> d!14544 (moveBitIndexPrecond!0 (_2!2358 lt!72451) (bvsub lt!72455 lt!72458))))

(assert (=> d!14544 (= (withMovedBitIndex!0 (_2!2358 lt!72451) (bvsub lt!72455 lt!72458)) lt!74283)))

(declare-fun b!47992 () Bool)

(assert (=> b!47992 (= e!31796 (= (size!1037 (buf!1386 (_2!2358 lt!72451))) (size!1037 (buf!1386 lt!74283))))))

(assert (= (and d!14544 res!40349) b!47992))

(declare-fun m!74371 () Bool)

(assert (=> d!14544 m!74371))

(assert (=> d!14544 m!74133))

(declare-fun m!74373 () Bool)

(assert (=> d!14544 m!74373))

(declare-fun m!74375 () Bool)

(assert (=> d!14544 m!74375))

(assert (=> b!46876 d!14544))

(assert (=> b!46876 d!13722))

(assert (=> b!46876 d!13692))

(assert (=> d!13746 d!13744))

(declare-fun d!14546 () Bool)

(assert (=> d!14546 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!14546 true))

(declare-fun _$14!235 () Unit!3311)

(assert (=> d!14546 (= (choose!11 thiss!1379) _$14!235)))

(declare-fun bs!3747 () Bool)

(assert (= bs!3747 d!14546))

(assert (=> bs!3747 m!71745))

(assert (=> d!13746 d!14546))

(assert (=> d!13674 d!13686))

(declare-fun d!14548 () Bool)

(assert (=> d!14548 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379)) (bvsub to!314 i!635))))

(assert (=> d!14548 true))

(declare-fun _$6!192 () Unit!3311)

(assert (=> d!14548 (= (choose!9 thiss!1379 (buf!1386 (_2!2357 lt!72322)) (bvsub to!314 i!635) (BitStream!1807 (buf!1386 (_2!2357 lt!72322)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))) _$6!192)))

(declare-fun bs!3748 () Bool)

(assert (= bs!3748 d!14548))

(assert (=> bs!3748 m!71759))

(assert (=> d!13674 d!14548))

(declare-fun d!14550 () Bool)

(assert (=> d!14550 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72322) (_1!2358 lt!72332) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!230 lt!72323))))

(assert (=> d!14550 true))

(declare-fun _$34!38 () Unit!3311)

(assert (=> d!14550 (= (choose!42 (_2!2357 lt!72322) (_2!2357 lt!72322) (_1!2358 lt!72329) (_1!2358 lt!72332) (bvsub to!314 i!635) lt!72323) _$34!38)))

(declare-fun bs!3749 () Bool)

(assert (= bs!3749 d!14550))

(assert (=> bs!3749 m!71995))

(assert (=> bs!3749 m!71819))

(assert (=> d!13702 d!14550))

(declare-fun d!14552 () Bool)

(assert (=> d!14552 (= (isEmpty!137 lt!72729) ((_ is Nil!541) lt!72729))))

(assert (=> b!46985 d!14552))

(assert (=> d!13688 d!13744))

(assert (=> d!13688 d!13708))

(declare-fun d!14554 () Bool)

(assert (=> d!14554 (isPrefixOf!0 lt!72480 (_2!2357 lt!72322))))

(declare-fun lt!74285 () Unit!3311)

(assert (=> d!14554 (= lt!74285 (choose!30 lt!72480 (_2!2357 lt!72322) (_2!2357 lt!72322)))))

(assert (=> d!14554 (isPrefixOf!0 lt!72480 (_2!2357 lt!72322))))

(assert (=> d!14554 (= (lemmaIsPrefixTransitive!0 lt!72480 (_2!2357 lt!72322) (_2!2357 lt!72322)) lt!74285)))

(declare-fun bs!3750 () Bool)

(assert (= bs!3750 d!14554))

(assert (=> bs!3750 m!71981))

(declare-fun m!74377 () Bool)

(assert (=> bs!3750 m!74377))

(assert (=> bs!3750 m!71981))

(assert (=> d!13688 d!14554))

(declare-fun d!14556 () Bool)

(declare-fun res!40350 () Bool)

(declare-fun e!31798 () Bool)

(assert (=> d!14556 (=> (not res!40350) (not e!31798))))

(assert (=> d!14556 (= res!40350 (= (size!1037 (buf!1386 (_2!2357 lt!72322))) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!14556 (= (isPrefixOf!0 (_2!2357 lt!72322) (_2!2357 lt!72322)) e!31798)))

(declare-fun b!47993 () Bool)

(declare-fun res!40352 () Bool)

(assert (=> b!47993 (=> (not res!40352) (not e!31798))))

(assert (=> b!47993 (= res!40352 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!47994 () Bool)

(declare-fun e!31797 () Bool)

(assert (=> b!47994 (= e!31798 e!31797)))

(declare-fun res!40351 () Bool)

(assert (=> b!47994 (=> res!40351 e!31797)))

(assert (=> b!47994 (= res!40351 (= (size!1037 (buf!1386 (_2!2357 lt!72322))) #b00000000000000000000000000000000))))

(declare-fun b!47995 () Bool)

(assert (=> b!47995 (= e!31797 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72322)) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(assert (= (and d!14556 res!40350) b!47993))

(assert (= (and b!47993 res!40352) b!47994))

(assert (= (and b!47994 (not res!40351)) b!47995))

(assert (=> b!47993 m!71751))

(assert (=> b!47993 m!71751))

(assert (=> b!47995 m!71751))

(assert (=> b!47995 m!71751))

(declare-fun m!74379 () Bool)

(assert (=> b!47995 m!74379))

(assert (=> d!13688 d!14556))

(declare-fun d!14558 () Bool)

(declare-fun res!40353 () Bool)

(declare-fun e!31800 () Bool)

(assert (=> d!14558 (=> (not res!40353) (not e!31800))))

(assert (=> d!14558 (= res!40353 (= (size!1037 (buf!1386 lt!72480)) (size!1037 (buf!1386 lt!72480))))))

(assert (=> d!14558 (= (isPrefixOf!0 lt!72480 lt!72480) e!31800)))

(declare-fun b!47996 () Bool)

(declare-fun res!40355 () Bool)

(assert (=> b!47996 (=> (not res!40355) (not e!31800))))

(assert (=> b!47996 (= res!40355 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72480)) (currentByte!2891 lt!72480) (currentBit!2886 lt!72480)) (bitIndex!0 (size!1037 (buf!1386 lt!72480)) (currentByte!2891 lt!72480) (currentBit!2886 lt!72480))))))

(declare-fun b!47997 () Bool)

(declare-fun e!31799 () Bool)

(assert (=> b!47997 (= e!31800 e!31799)))

(declare-fun res!40354 () Bool)

(assert (=> b!47997 (=> res!40354 e!31799)))

(assert (=> b!47997 (= res!40354 (= (size!1037 (buf!1386 lt!72480)) #b00000000000000000000000000000000))))

(declare-fun b!47998 () Bool)

(assert (=> b!47998 (= e!31799 (arrayBitRangesEq!0 (buf!1386 lt!72480) (buf!1386 lt!72480) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72480)) (currentByte!2891 lt!72480) (currentBit!2886 lt!72480))))))

(assert (= (and d!14558 res!40353) b!47996))

(assert (= (and b!47996 res!40355) b!47997))

(assert (= (and b!47997 (not res!40354)) b!47998))

(declare-fun m!74381 () Bool)

(assert (=> b!47996 m!74381))

(assert (=> b!47996 m!74381))

(assert (=> b!47998 m!74381))

(assert (=> b!47998 m!74381))

(declare-fun m!74383 () Bool)

(assert (=> b!47998 m!74383))

(assert (=> d!13688 d!14558))

(declare-fun d!14560 () Bool)

(assert (=> d!14560 (isPrefixOf!0 lt!72480 (_2!2357 lt!72322))))

(declare-fun lt!74286 () Unit!3311)

(assert (=> d!14560 (= lt!74286 (choose!30 lt!72480 thiss!1379 (_2!2357 lt!72322)))))

(assert (=> d!14560 (isPrefixOf!0 lt!72480 thiss!1379)))

(assert (=> d!14560 (= (lemmaIsPrefixTransitive!0 lt!72480 thiss!1379 (_2!2357 lt!72322)) lt!74286)))

(declare-fun bs!3751 () Bool)

(assert (= bs!3751 d!14560))

(assert (=> bs!3751 m!71981))

(declare-fun m!74385 () Bool)

(assert (=> bs!3751 m!74385))

(declare-fun m!74387 () Bool)

(assert (=> bs!3751 m!74387))

(assert (=> d!13688 d!14560))

(declare-fun d!14562 () Bool)

(assert (=> d!14562 (isPrefixOf!0 (_2!2357 lt!72322) (_2!2357 lt!72322))))

(declare-fun lt!74287 () Unit!3311)

(assert (=> d!14562 (= lt!74287 (choose!11 (_2!2357 lt!72322)))))

(assert (=> d!14562 (= (lemmaIsPrefixRefl!0 (_2!2357 lt!72322)) lt!74287)))

(declare-fun bs!3752 () Bool)

(assert (= bs!3752 d!14562))

(assert (=> bs!3752 m!71941))

(declare-fun m!74389 () Bool)

(assert (=> bs!3752 m!74389))

(assert (=> d!13688 d!14562))

(declare-fun d!14564 () Bool)

(declare-fun res!40356 () Bool)

(declare-fun e!31802 () Bool)

(assert (=> d!14564 (=> (not res!40356) (not e!31802))))

(assert (=> d!14564 (= res!40356 (= (size!1037 (buf!1386 lt!72480)) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!14564 (= (isPrefixOf!0 lt!72480 (_2!2357 lt!72322)) e!31802)))

(declare-fun b!47999 () Bool)

(declare-fun res!40358 () Bool)

(assert (=> b!47999 (=> (not res!40358) (not e!31802))))

(assert (=> b!47999 (= res!40358 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72480)) (currentByte!2891 lt!72480) (currentBit!2886 lt!72480)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!48000 () Bool)

(declare-fun e!31801 () Bool)

(assert (=> b!48000 (= e!31802 e!31801)))

(declare-fun res!40357 () Bool)

(assert (=> b!48000 (=> res!40357 e!31801)))

(assert (=> b!48000 (= res!40357 (= (size!1037 (buf!1386 lt!72480)) #b00000000000000000000000000000000))))

(declare-fun b!48001 () Bool)

(assert (=> b!48001 (= e!31801 (arrayBitRangesEq!0 (buf!1386 lt!72480) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72480)) (currentByte!2891 lt!72480) (currentBit!2886 lt!72480))))))

(assert (= (and d!14564 res!40356) b!47999))

(assert (= (and b!47999 res!40358) b!48000))

(assert (= (and b!48000 (not res!40357)) b!48001))

(assert (=> b!47999 m!74381))

(assert (=> b!47999 m!71751))

(assert (=> b!48001 m!74381))

(assert (=> b!48001 m!74381))

(declare-fun m!74391 () Bool)

(assert (=> b!48001 m!74391))

(assert (=> d!13688 d!14564))

(declare-fun d!14566 () Bool)

(declare-fun res!40359 () Bool)

(declare-fun e!31804 () Bool)

(assert (=> d!14566 (=> (not res!40359) (not e!31804))))

(assert (=> d!14566 (= res!40359 (= (size!1037 (buf!1386 (_1!2358 lt!72474))) (size!1037 (buf!1386 (_2!2358 lt!72474)))))))

(assert (=> d!14566 (= (isPrefixOf!0 (_1!2358 lt!72474) (_2!2358 lt!72474)) e!31804)))

(declare-fun b!48002 () Bool)

(declare-fun res!40361 () Bool)

(assert (=> b!48002 (=> (not res!40361) (not e!31804))))

(assert (=> b!48002 (= res!40361 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72474))) (currentByte!2891 (_1!2358 lt!72474)) (currentBit!2886 (_1!2358 lt!72474))) (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72474))) (currentByte!2891 (_2!2358 lt!72474)) (currentBit!2886 (_2!2358 lt!72474)))))))

(declare-fun b!48003 () Bool)

(declare-fun e!31803 () Bool)

(assert (=> b!48003 (= e!31804 e!31803)))

(declare-fun res!40360 () Bool)

(assert (=> b!48003 (=> res!40360 e!31803)))

(assert (=> b!48003 (= res!40360 (= (size!1037 (buf!1386 (_1!2358 lt!72474))) #b00000000000000000000000000000000))))

(declare-fun b!48004 () Bool)

(assert (=> b!48004 (= e!31803 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72474)) (buf!1386 (_2!2358 lt!72474)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72474))) (currentByte!2891 (_1!2358 lt!72474)) (currentBit!2886 (_1!2358 lt!72474)))))))

(assert (= (and d!14566 res!40359) b!48002))

(assert (= (and b!48002 res!40361) b!48003))

(assert (= (and b!48003 (not res!40360)) b!48004))

(assert (=> b!48002 m!74055))

(assert (=> b!48002 m!74061))

(assert (=> b!48004 m!74055))

(assert (=> b!48004 m!74055))

(declare-fun m!74393 () Bool)

(assert (=> b!48004 m!74393))

(assert (=> d!13688 d!14566))

(assert (=> d!13688 d!13746))

(declare-fun d!14568 () Bool)

(assert (=> d!14568 (isPrefixOf!0 lt!72480 lt!72480)))

(declare-fun lt!74288 () Unit!3311)

(assert (=> d!14568 (= lt!74288 (choose!11 lt!72480))))

(assert (=> d!14568 (= (lemmaIsPrefixRefl!0 lt!72480) lt!74288)))

(declare-fun bs!3753 () Bool)

(assert (= bs!3753 d!14568))

(assert (=> bs!3753 m!71975))

(declare-fun m!74395 () Bool)

(assert (=> bs!3753 m!74395))

(assert (=> d!13688 d!14568))

(assert (=> b!46904 d!13748))

(assert (=> b!46904 d!13722))

(declare-fun b!48005 () Bool)

(declare-fun e!31808 () Bool)

(declare-fun lt!74290 () tuple4!18)

(assert (=> b!48005 (= e!31808 (arrayRangesEq!10 (buf!1386 thiss!1379) (buf!1386 thiss!1379) (_1!2377 lt!74290) (_2!2377 lt!74290)))))

(declare-fun b!48006 () Bool)

(declare-fun e!31807 () Bool)

(declare-fun call!600 () Bool)

(assert (=> b!48006 (= e!31807 call!600)))

(declare-fun b!48007 () Bool)

(declare-fun e!31805 () Bool)

(declare-fun e!31806 () Bool)

(assert (=> b!48007 (= e!31805 e!31806)))

(declare-fun res!40365 () Bool)

(assert (=> b!48007 (=> (not res!40365) (not e!31806))))

(assert (=> b!48007 (= res!40365 e!31808)))

(declare-fun res!40364 () Bool)

(assert (=> b!48007 (=> res!40364 e!31808)))

(assert (=> b!48007 (= res!40364 (bvsge (_1!2377 lt!74290) (_2!2377 lt!74290)))))

(declare-fun lt!74291 () (_ BitVec 32))

(assert (=> b!48007 (= lt!74291 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!74289 () (_ BitVec 32))

(assert (=> b!48007 (= lt!74289 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48007 (= lt!74290 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!48008 () Bool)

(assert (=> b!48008 (= e!31806 e!31807)))

(declare-fun c!3342 () Bool)

(assert (=> b!48008 (= c!3342 (= (_3!97 lt!74290) (_4!9 lt!74290)))))

(declare-fun bm!597 () Bool)

(assert (=> bm!597 (= call!600 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74290)) (select (arr!1557 (buf!1386 thiss!1379)) (_3!97 lt!74290)) lt!74289 (ite c!3342 lt!74291 #b00000000000000000000000000001000)))))

(declare-fun b!48009 () Bool)

(declare-fun res!40366 () Bool)

(assert (=> b!48009 (= res!40366 (= lt!74291 #b00000000000000000000000000000000))))

(declare-fun e!31809 () Bool)

(assert (=> b!48009 (=> res!40366 e!31809)))

(declare-fun e!31810 () Bool)

(assert (=> b!48009 (= e!31810 e!31809)))

(declare-fun b!48010 () Bool)

(assert (=> b!48010 (= e!31807 e!31810)))

(declare-fun res!40363 () Bool)

(assert (=> b!48010 (= res!40363 call!600)))

(assert (=> b!48010 (=> (not res!40363) (not e!31810))))

(declare-fun b!48011 () Bool)

(assert (=> b!48011 (= e!31809 (byteRangesEq!0 (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74290)) (select (arr!1557 (buf!1386 thiss!1379)) (_4!9 lt!74290)) #b00000000000000000000000000000000 lt!74291))))

(declare-fun d!14570 () Bool)

(declare-fun res!40362 () Bool)

(assert (=> d!14570 (=> res!40362 e!31805)))

(assert (=> d!14570 (= res!40362 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(assert (=> d!14570 (= (arrayBitRangesEq!0 (buf!1386 thiss!1379) (buf!1386 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))) e!31805)))

(assert (= (and d!14570 (not res!40362)) b!48007))

(assert (= (and b!48007 (not res!40364)) b!48005))

(assert (= (and b!48007 res!40365) b!48008))

(assert (= (and b!48008 c!3342) b!48006))

(assert (= (and b!48008 (not c!3342)) b!48010))

(assert (= (and b!48010 res!40363) b!48009))

(assert (= (and b!48009 (not res!40366)) b!48011))

(assert (= (or b!48006 b!48010) bm!597))

(declare-fun m!74397 () Bool)

(assert (=> b!48005 m!74397))

(assert (=> b!48007 m!71749))

(assert (=> b!48007 m!74141))

(declare-fun m!74399 () Bool)

(assert (=> bm!597 m!74399))

(assert (=> bm!597 m!74399))

(assert (=> bm!597 m!74399))

(assert (=> bm!597 m!74399))

(declare-fun m!74401 () Bool)

(assert (=> bm!597 m!74401))

(declare-fun m!74403 () Bool)

(assert (=> b!48011 m!74403))

(assert (=> b!48011 m!74403))

(assert (=> b!48011 m!74403))

(assert (=> b!48011 m!74403))

(declare-fun m!74405 () Bool)

(assert (=> b!48011 m!74405))

(assert (=> b!46974 d!14570))

(assert (=> b!46974 d!13748))

(declare-fun d!14572 () Bool)

(assert (=> d!14572 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72630))))

(declare-fun lt!74292 () Unit!3311)

(assert (=> d!14572 (= lt!74292 (choose!30 (_2!2357 lt!72328) (_2!2357 lt!72615) (_2!2357 lt!72630)))))

(assert (=> d!14572 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72615))))

(assert (=> d!14572 (= (lemmaIsPrefixTransitive!0 (_2!2357 lt!72328) (_2!2357 lt!72615) (_2!2357 lt!72630)) lt!74292)))

(declare-fun bs!3754 () Bool)

(assert (= bs!3754 d!14572))

(assert (=> bs!3754 m!72043))

(declare-fun m!74407 () Bool)

(assert (=> bs!3754 m!74407))

(declare-fun m!74409 () Bool)

(assert (=> bs!3754 m!74409))

(assert (=> b!46930 d!14572))

(declare-fun d!14574 () Bool)

(assert (=> d!14574 (= (bitAt!0 (buf!1386 (_2!2357 lt!72615)) lt!72650) (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_2!2357 lt!72615))) ((_ extract 31 0) (bvsdiv lt!72650 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72650 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3755 () Bool)

(assert (= bs!3755 d!14574))

(declare-fun m!74411 () Bool)

(assert (=> bs!3755 m!74411))

(declare-fun m!74413 () Bool)

(assert (=> bs!3755 m!74413))

(assert (=> b!46930 d!14574))

(declare-fun d!14576 () Bool)

(assert (=> d!14576 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!72612) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615)))) lt!72612))))

(declare-fun bs!3756 () Bool)

(assert (= bs!3756 d!14576))

(declare-fun m!74415 () Bool)

(assert (=> bs!3756 m!74415))

(assert (=> b!46930 d!14576))

(declare-fun d!14578 () Bool)

(assert (=> d!14578 (= (tail!230 lt!72613) (t!1294 lt!72613))))

(assert (=> b!46930 d!14578))

(declare-fun d!14580 () Bool)

(declare-fun res!40367 () Bool)

(declare-fun e!31812 () Bool)

(assert (=> d!14580 (=> (not res!40367) (not e!31812))))

(assert (=> d!14580 (= res!40367 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!72630)))))))

(assert (=> d!14580 (= (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72630)) e!31812)))

(declare-fun b!48012 () Bool)

(declare-fun res!40369 () Bool)

(assert (=> b!48012 (=> (not res!40369) (not e!31812))))

(assert (=> b!48012 (= res!40369 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72630))) (currentByte!2891 (_2!2357 lt!72630)) (currentBit!2886 (_2!2357 lt!72630)))))))

(declare-fun b!48013 () Bool)

(declare-fun e!31811 () Bool)

(assert (=> b!48013 (= e!31812 e!31811)))

(declare-fun res!40368 () Bool)

(assert (=> b!48013 (=> res!40368 e!31811)))

(assert (=> b!48013 (= res!40368 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000))))

(declare-fun b!48014 () Bool)

(assert (=> b!48014 (= e!31811 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72630)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (= (and d!14580 res!40367) b!48012))

(assert (= (and b!48012 res!40369) b!48013))

(assert (= (and b!48013 (not res!40368)) b!48014))

(assert (=> b!48012 m!71775))

(assert (=> b!48012 m!72009))

(assert (=> b!48014 m!71775))

(assert (=> b!48014 m!71775))

(declare-fun m!74417 () Bool)

(assert (=> b!48014 m!74417))

(assert (=> b!46930 d!14580))

(declare-fun d!14582 () Bool)

(assert (=> d!14582 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!72612)))

(declare-fun lt!74293 () Unit!3311)

(assert (=> d!14582 (= lt!74293 (choose!9 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!72630)) lt!72612 (BitStream!1807 (buf!1386 (_2!2357 lt!72630)) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615)))))))

(assert (=> d!14582 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!72630)) lt!72612) lt!74293)))

(declare-fun bs!3757 () Bool)

(assert (= bs!3757 d!14582))

(assert (=> bs!3757 m!72039))

(declare-fun m!74419 () Bool)

(assert (=> bs!3757 m!74419))

(assert (=> b!46930 d!14582))

(declare-fun d!14584 () Bool)

(declare-fun e!31813 () Bool)

(assert (=> d!14584 e!31813))

(declare-fun res!40370 () Bool)

(assert (=> d!14584 (=> (not res!40370) (not e!31813))))

(assert (=> d!14584 (= res!40370 (or (= (bvand lt!72607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!72633 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72607 lt!72633) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!74294 () Unit!3311)

(assert (=> d!14584 (= lt!74294 (choose!27 (_2!2357 lt!72328) (_2!2357 lt!72615) lt!72607 lt!72633))))

(assert (=> d!14584 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!72633) (bvsle lt!72633 lt!72607))))

(assert (=> d!14584 (= (validateOffsetBitsIneqLemma!0 (_2!2357 lt!72328) (_2!2357 lt!72615) lt!72607 lt!72633) lt!74294)))

(declare-fun b!48015 () Bool)

(assert (=> b!48015 (= e!31813 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) (bvsub lt!72607 lt!72633)))))

(assert (= (and d!14584 res!40370) b!48015))

(declare-fun m!74421 () Bool)

(assert (=> d!14584 m!74421))

(assert (=> b!48015 m!72055))

(assert (=> b!46930 d!14584))

(declare-fun d!14586 () Bool)

(declare-fun e!31814 () Bool)

(assert (=> d!14586 e!31814))

(declare-fun res!40371 () Bool)

(assert (=> d!14586 (=> (not res!40371) (not e!31814))))

(declare-fun lt!74295 () (_ BitVec 64))

(declare-fun lt!74298 () (_ BitVec 64))

(declare-fun lt!74297 () (_ BitVec 64))

(assert (=> d!14586 (= res!40371 (= lt!74295 (bvsub lt!74297 lt!74298)))))

(assert (=> d!14586 (or (= (bvand lt!74297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74298 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74297 lt!74298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14586 (= lt!74298 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72630))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72630)))))))

(declare-fun lt!74300 () (_ BitVec 64))

(declare-fun lt!74299 () (_ BitVec 64))

(assert (=> d!14586 (= lt!74297 (bvmul lt!74300 lt!74299))))

(assert (=> d!14586 (or (= lt!74300 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74299 (bvsdiv (bvmul lt!74300 lt!74299) lt!74300)))))

(assert (=> d!14586 (= lt!74299 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14586 (= lt!74300 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))))))

(assert (=> d!14586 (= lt!74295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72630))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72630)))))))

(assert (=> d!14586 (invariant!0 (currentBit!2886 (_2!2357 lt!72630)) (currentByte!2891 (_2!2357 lt!72630)) (size!1037 (buf!1386 (_2!2357 lt!72630))))))

(assert (=> d!14586 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72630))) (currentByte!2891 (_2!2357 lt!72630)) (currentBit!2886 (_2!2357 lt!72630))) lt!74295)))

(declare-fun b!48016 () Bool)

(declare-fun res!40372 () Bool)

(assert (=> b!48016 (=> (not res!40372) (not e!31814))))

(assert (=> b!48016 (= res!40372 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74295))))

(declare-fun b!48017 () Bool)

(declare-fun lt!74296 () (_ BitVec 64))

(assert (=> b!48017 (= e!31814 (bvsle lt!74295 (bvmul lt!74296 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48017 (or (= lt!74296 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74296 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74296)))))

(assert (=> b!48017 (= lt!74296 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))))))

(assert (= (and d!14586 res!40371) b!48016))

(assert (= (and b!48016 res!40372) b!48017))

(declare-fun m!74423 () Bool)

(assert (=> d!14586 m!74423))

(declare-fun m!74425 () Bool)

(assert (=> d!14586 m!74425))

(assert (=> b!46930 d!14586))

(assert (=> b!46930 d!13692))

(declare-fun d!14588 () Bool)

(assert (=> d!14588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72617)))

(declare-fun lt!74301 () Unit!3311)

(assert (=> d!14588 (= lt!74301 (choose!9 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72615)) lt!72617 (BitStream!1807 (buf!1386 (_2!2357 lt!72615)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!14588 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72615)) lt!72617) lt!74301)))

(declare-fun bs!3758 () Bool)

(assert (= bs!3758 d!14588))

(assert (=> bs!3758 m!72035))

(declare-fun m!74427 () Bool)

(assert (=> bs!3758 m!74427))

(assert (=> b!46930 d!14588))

(declare-fun d!14590 () Bool)

(declare-fun e!31815 () Bool)

(assert (=> d!14590 e!31815))

(declare-fun res!40373 () Bool)

(assert (=> d!14590 (=> (not res!40373) (not e!31815))))

(declare-fun lt!74303 () (_ BitVec 64))

(assert (=> d!14590 (= res!40373 (or (= (bvand lt!72635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74303 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!72635 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72635 lt!74303) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!14590 (= lt!74303 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74302 () Unit!3311)

(assert (=> d!14590 (= lt!74302 (choose!42 (_2!2357 lt!72630) (_2!2357 lt!72630) (_1!2358 lt!72620) (_1!2358 lt!72631) lt!72635 lt!72613))))

(assert (=> d!14590 (bvsgt lt!72635 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14590 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2357 lt!72630) (_2!2357 lt!72630) (_1!2358 lt!72620) (_1!2358 lt!72631) lt!72635 lt!72613) lt!74302)))

(declare-fun b!48018 () Bool)

(assert (=> b!48018 (= e!31815 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72631) (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!230 lt!72613)))))

(assert (= (and d!14590 res!40373) b!48018))

(declare-fun m!74429 () Bool)

(assert (=> d!14590 m!74429))

(assert (=> b!48018 m!72005))

(assert (=> b!48018 m!72061))

(assert (=> b!46930 d!14590))

(declare-fun d!14592 () Bool)

(declare-fun c!3343 () Bool)

(assert (=> d!14592 (= c!3343 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31816 () List!544)

(assert (=> d!14592 (= (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31816)))

(declare-fun b!48019 () Bool)

(assert (=> b!48019 (= e!31816 Nil!541)))

(declare-fun b!48020 () Bool)

(assert (=> b!48020 (= e!31816 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14592 c!3343) b!48019))

(assert (= (and d!14592 (not c!3343)) b!48020))

(assert (=> b!48020 m!72023))

(assert (=> b!48020 m!74213))

(assert (=> b!48020 m!72019))

(assert (=> b!46930 d!14592))

(declare-fun b!48024 () Bool)

(declare-fun e!31818 () Bool)

(declare-fun lt!74305 () List!544)

(assert (=> b!48024 (= e!31818 (> (length!239 lt!74305) 0))))

(declare-fun lt!74306 () (_ BitVec 64))

(declare-fun e!31817 () tuple2!4538)

(declare-fun lt!74304 () tuple2!4536)

(declare-fun b!48022 () Bool)

(assert (=> b!48022 (= e!31817 (tuple2!4539 (Cons!540 (_1!2361 lt!74304) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_2!2361 lt!74304) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74306))) (_2!2361 lt!74304)))))

(assert (=> b!48022 (= lt!74304 (readBit!0 (_1!2358 lt!72620)))))

(assert (=> b!48022 (= lt!74306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48021 () Bool)

(assert (=> b!48021 (= e!31817 (tuple2!4539 Nil!541 (_1!2358 lt!72620)))))

(declare-fun b!48023 () Bool)

(assert (=> b!48023 (= e!31818 (isEmpty!137 lt!74305))))

(declare-fun d!14594 () Bool)

(assert (=> d!14594 e!31818))

(declare-fun c!3344 () Bool)

(assert (=> d!14594 (= c!3344 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14594 (= lt!74305 (_1!2362 e!31817))))

(declare-fun c!3345 () Bool)

(assert (=> d!14594 (= c!3345 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14594 (bvsge (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14594 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72620) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!74305)))

(assert (= (and d!14594 c!3345) b!48021))

(assert (= (and d!14594 (not c!3345)) b!48022))

(assert (= (and d!14594 c!3344) b!48023))

(assert (= (and d!14594 (not c!3344)) b!48024))

(declare-fun m!74431 () Bool)

(assert (=> b!48024 m!74431))

(declare-fun m!74433 () Bool)

(assert (=> b!48022 m!74433))

(declare-fun m!74435 () Bool)

(assert (=> b!48022 m!74435))

(declare-fun m!74437 () Bool)

(assert (=> b!48023 m!74437))

(assert (=> b!46930 d!14594))

(declare-fun d!14596 () Bool)

(assert (=> d!14596 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72617) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72617))))

(declare-fun bs!3759 () Bool)

(assert (= bs!3759 d!14596))

(declare-fun m!74439 () Bool)

(assert (=> bs!3759 m!74439))

(assert (=> b!46930 d!14596))

(declare-fun d!14598 () Bool)

(assert (=> d!14598 (= (head!363 (byteArrayBitContentToList!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!659 (byteArrayBitContentToList!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46930 d!14598))

(declare-fun d!14600 () Bool)

(assert (=> d!14600 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) (bvsub lt!72607 lt!72633)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615)))) (bvsub lt!72607 lt!72633)))))

(declare-fun bs!3760 () Bool)

(assert (= bs!3760 d!14600))

(declare-fun m!74441 () Bool)

(assert (=> bs!3760 m!74441))

(assert (=> b!46930 d!14600))

(declare-fun d!14602 () Bool)

(assert (=> d!14602 (= (head!363 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72615) (_1!2358 lt!72609) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!659 (bitStreamReadBitsIntoList!0 (_2!2357 lt!72615) (_1!2358 lt!72609) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!46930 d!14602))

(declare-fun b!48025 () Bool)

(declare-fun res!40374 () Bool)

(declare-fun e!31819 () Bool)

(assert (=> b!48025 (=> (not res!40374) (not e!31819))))

(declare-fun lt!74307 () tuple2!4530)

(assert (=> b!48025 (= res!40374 (isPrefixOf!0 (_2!2358 lt!74307) (_2!2357 lt!72615)))))

(declare-fun b!48026 () Bool)

(declare-fun lt!74314 () (_ BitVec 64))

(declare-fun lt!74311 () (_ BitVec 64))

(assert (=> b!48026 (= e!31819 (= (_1!2358 lt!74307) (withMovedBitIndex!0 (_2!2358 lt!74307) (bvsub lt!74311 lt!74314))))))

(assert (=> b!48026 (or (= (bvand lt!74311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74314 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74311 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74311 lt!74314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48026 (= lt!74314 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(assert (=> b!48026 (= lt!74311 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun b!48027 () Bool)

(declare-fun e!31820 () Unit!3311)

(declare-fun lt!74322 () Unit!3311)

(assert (=> b!48027 (= e!31820 lt!74322)))

(declare-fun lt!74317 () (_ BitVec 64))

(assert (=> b!48027 (= lt!74317 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74324 () (_ BitVec 64))

(assert (=> b!48027 (= lt!74324 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> b!48027 (= lt!74322 (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (_2!2357 lt!72615)) lt!74317 lt!74324))))

(assert (=> b!48027 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72615)) (buf!1386 (_2!2357 lt!72328)) lt!74317 lt!74324)))

(declare-fun b!48028 () Bool)

(declare-fun res!40376 () Bool)

(assert (=> b!48028 (=> (not res!40376) (not e!31819))))

(assert (=> b!48028 (= res!40376 (isPrefixOf!0 (_1!2358 lt!74307) (_2!2357 lt!72328)))))

(declare-fun d!14604 () Bool)

(assert (=> d!14604 e!31819))

(declare-fun res!40375 () Bool)

(assert (=> d!14604 (=> (not res!40375) (not e!31819))))

(assert (=> d!14604 (= res!40375 (isPrefixOf!0 (_1!2358 lt!74307) (_2!2358 lt!74307)))))

(declare-fun lt!74313 () BitStream!1806)

(assert (=> d!14604 (= lt!74307 (tuple2!4531 lt!74313 (_2!2357 lt!72615)))))

(declare-fun lt!74325 () Unit!3311)

(declare-fun lt!74315 () Unit!3311)

(assert (=> d!14604 (= lt!74325 lt!74315)))

(assert (=> d!14604 (isPrefixOf!0 lt!74313 (_2!2357 lt!72615))))

(assert (=> d!14604 (= lt!74315 (lemmaIsPrefixTransitive!0 lt!74313 (_2!2357 lt!72615) (_2!2357 lt!72615)))))

(declare-fun lt!74321 () Unit!3311)

(declare-fun lt!74323 () Unit!3311)

(assert (=> d!14604 (= lt!74321 lt!74323)))

(assert (=> d!14604 (isPrefixOf!0 lt!74313 (_2!2357 lt!72615))))

(assert (=> d!14604 (= lt!74323 (lemmaIsPrefixTransitive!0 lt!74313 (_2!2357 lt!72328) (_2!2357 lt!72615)))))

(declare-fun lt!74316 () Unit!3311)

(assert (=> d!14604 (= lt!74316 e!31820)))

(declare-fun c!3346 () Bool)

(assert (=> d!14604 (= c!3346 (not (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000)))))

(declare-fun lt!74312 () Unit!3311)

(declare-fun lt!74310 () Unit!3311)

(assert (=> d!14604 (= lt!74312 lt!74310)))

(assert (=> d!14604 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!72615))))

(assert (=> d!14604 (= lt!74310 (lemmaIsPrefixRefl!0 (_2!2357 lt!72615)))))

(declare-fun lt!74309 () Unit!3311)

(declare-fun lt!74308 () Unit!3311)

(assert (=> d!14604 (= lt!74309 lt!74308)))

(assert (=> d!14604 (= lt!74308 (lemmaIsPrefixRefl!0 (_2!2357 lt!72615)))))

(declare-fun lt!74326 () Unit!3311)

(declare-fun lt!74320 () Unit!3311)

(assert (=> d!14604 (= lt!74326 lt!74320)))

(assert (=> d!14604 (isPrefixOf!0 lt!74313 lt!74313)))

(assert (=> d!14604 (= lt!74320 (lemmaIsPrefixRefl!0 lt!74313))))

(declare-fun lt!74319 () Unit!3311)

(declare-fun lt!74318 () Unit!3311)

(assert (=> d!14604 (= lt!74319 lt!74318)))

(assert (=> d!14604 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!14604 (= lt!74318 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(assert (=> d!14604 (= lt!74313 (BitStream!1807 (buf!1386 (_2!2357 lt!72615)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!14604 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72615))))

(assert (=> d!14604 (= (reader!0 (_2!2357 lt!72328) (_2!2357 lt!72615)) lt!74307)))

(declare-fun b!48029 () Bool)

(declare-fun Unit!3368 () Unit!3311)

(assert (=> b!48029 (= e!31820 Unit!3368)))

(assert (= (and d!14604 c!3346) b!48027))

(assert (= (and d!14604 (not c!3346)) b!48029))

(assert (= (and d!14604 res!40375) b!48028))

(assert (= (and b!48028 res!40376) b!48025))

(assert (= (and b!48025 res!40374) b!48026))

(declare-fun m!74443 () Bool)

(assert (=> b!48025 m!74443))

(declare-fun m!74445 () Bool)

(assert (=> b!48028 m!74445))

(declare-fun m!74447 () Bool)

(assert (=> b!48026 m!74447))

(assert (=> b!48026 m!72029))

(assert (=> b!48026 m!71775))

(declare-fun m!74449 () Bool)

(assert (=> d!14604 m!74449))

(declare-fun m!74451 () Bool)

(assert (=> d!14604 m!74451))

(declare-fun m!74453 () Bool)

(assert (=> d!14604 m!74453))

(assert (=> d!14604 m!74409))

(declare-fun m!74455 () Bool)

(assert (=> d!14604 m!74455))

(assert (=> d!14604 m!71939))

(declare-fun m!74457 () Bool)

(assert (=> d!14604 m!74457))

(declare-fun m!74459 () Bool)

(assert (=> d!14604 m!74459))

(declare-fun m!74461 () Bool)

(assert (=> d!14604 m!74461))

(assert (=> d!14604 m!71947))

(declare-fun m!74463 () Bool)

(assert (=> d!14604 m!74463))

(assert (=> b!48027 m!71775))

(declare-fun m!74465 () Bool)

(assert (=> b!48027 m!74465))

(declare-fun m!74467 () Bool)

(assert (=> b!48027 m!74467))

(assert (=> b!46930 d!14604))

(declare-fun b!48030 () Bool)

(declare-fun res!40377 () Bool)

(declare-fun e!31823 () Bool)

(assert (=> b!48030 (=> (not res!40377) (not e!31823))))

(declare-fun lt!74332 () tuple2!4528)

(assert (=> b!48030 (= res!40377 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!74332)))))

(declare-fun b!48031 () Bool)

(declare-fun res!40384 () Bool)

(declare-fun e!31822 () Bool)

(assert (=> b!48031 (=> (not res!40384) (not e!31822))))

(declare-fun lt!74331 () tuple2!4528)

(assert (=> b!48031 (= res!40384 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!74331)))))

(declare-fun b!48032 () Bool)

(declare-fun res!40379 () Bool)

(assert (=> b!48032 (=> (not res!40379) (not e!31822))))

(assert (=> b!48032 (= res!40379 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74331))) (currentByte!2891 (_2!2357 lt!74331)) (currentBit!2886 (_2!2357 lt!74331))) (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!14606 () Bool)

(assert (=> d!14606 e!31823))

(declare-fun res!40382 () Bool)

(assert (=> d!14606 (=> (not res!40382) (not e!31823))))

(assert (=> d!14606 (= res!40382 (= (size!1037 (buf!1386 (_2!2357 lt!74332))) (size!1037 (buf!1386 (_2!2357 lt!72328)))))))

(declare-fun lt!74334 () (_ BitVec 8))

(declare-fun lt!74338 () array!2295)

(assert (=> d!14606 (= lt!74334 (select (arr!1557 lt!74338) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!14606 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1037 lt!74338)))))

(assert (=> d!14606 (= lt!74338 (array!2296 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!74335 () tuple2!4528)

(assert (=> d!14606 (= lt!74332 (tuple2!4529 (_1!2357 lt!74335) (_2!2357 lt!74335)))))

(assert (=> d!14606 (= lt!74335 lt!74331)))

(assert (=> d!14606 e!31822))

(declare-fun res!40381 () Bool)

(assert (=> d!14606 (=> (not res!40381) (not e!31822))))

(assert (=> d!14606 (= res!40381 (= (size!1037 (buf!1386 (_2!2357 lt!72328))) (size!1037 (buf!1386 (_2!2357 lt!74331)))))))

(declare-fun lt!74333 () Bool)

(assert (=> d!14606 (= lt!74331 (appendBit!0 (_2!2357 lt!72328) lt!74333))))

(assert (=> d!14606 (= lt!74333 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!14606 (and (bvsge ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!14606 (= (appendBitFromByte!0 (_2!2357 lt!72328) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) lt!74332)))

(declare-fun b!48033 () Bool)

(declare-fun res!40378 () Bool)

(assert (=> b!48033 (=> (not res!40378) (not e!31823))))

(declare-fun lt!74329 () (_ BitVec 64))

(declare-fun lt!74336 () (_ BitVec 64))

(assert (=> b!48033 (= res!40378 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74332))) (currentByte!2891 (_2!2357 lt!74332)) (currentBit!2886 (_2!2357 lt!74332))) (bvadd lt!74329 lt!74336)))))

(assert (=> b!48033 (or (not (= (bvand lt!74329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74336 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74329 lt!74336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48033 (= lt!74336 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!48033 (= lt!74329 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun b!48034 () Bool)

(declare-fun e!31821 () Bool)

(declare-fun lt!74328 () tuple2!4542)

(assert (=> b!48034 (= e!31821 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!74328))) (currentByte!2891 (_1!2364 lt!74328)) (currentBit!2886 (_1!2364 lt!74328))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74331))) (currentByte!2891 (_2!2357 lt!74331)) (currentBit!2886 (_2!2357 lt!74331)))))))

(declare-fun b!48035 () Bool)

(declare-fun e!31824 () Bool)

(assert (=> b!48035 (= e!31823 e!31824)))

(declare-fun res!40383 () Bool)

(assert (=> b!48035 (=> (not res!40383) (not e!31824))))

(declare-fun lt!74330 () tuple2!4542)

(assert (=> b!48035 (= res!40383 (and (= (_2!2364 lt!74330) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!74334)) #b00000000000000000000000000000000))) (= (_1!2364 lt!74330) (_2!2357 lt!74332))))))

(declare-fun lt!74337 () tuple2!4540)

(declare-fun lt!74327 () BitStream!1806)

(assert (=> b!48035 (= lt!74337 (readBits!0 lt!74327 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!48035 (= lt!74330 (readBitPure!0 lt!74327))))

(assert (=> b!48035 (= lt!74327 (readerFrom!0 (_2!2357 lt!74332) (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328))))))

(declare-fun b!48036 () Bool)

(assert (=> b!48036 (= e!31824 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!74330))) (currentByte!2891 (_1!2364 lt!74330)) (currentBit!2886 (_1!2364 lt!74330))) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74332))) (currentByte!2891 (_2!2357 lt!74332)) (currentBit!2886 (_2!2357 lt!74332)))))))

(declare-fun b!48037 () Bool)

(assert (=> b!48037 (= e!31822 e!31821)))

(declare-fun res!40380 () Bool)

(assert (=> b!48037 (=> (not res!40380) (not e!31821))))

(assert (=> b!48037 (= res!40380 (and (= (_2!2364 lt!74328) lt!74333) (= (_1!2364 lt!74328) (_2!2357 lt!74331))))))

(assert (=> b!48037 (= lt!74328 (readBitPure!0 (readerFrom!0 (_2!2357 lt!74331) (currentBit!2886 (_2!2357 lt!72328)) (currentByte!2891 (_2!2357 lt!72328)))))))

(assert (= (and d!14606 res!40381) b!48032))

(assert (= (and b!48032 res!40379) b!48031))

(assert (= (and b!48031 res!40384) b!48037))

(assert (= (and b!48037 res!40380) b!48034))

(assert (= (and d!14606 res!40382) b!48033))

(assert (= (and b!48033 res!40378) b!48030))

(assert (= (and b!48030 res!40377) b!48035))

(assert (= (and b!48035 res!40383) b!48036))

(declare-fun m!74469 () Bool)

(assert (=> b!48035 m!74469))

(declare-fun m!74471 () Bool)

(assert (=> b!48035 m!74471))

(declare-fun m!74473 () Bool)

(assert (=> b!48035 m!74473))

(declare-fun m!74475 () Bool)

(assert (=> b!48030 m!74475))

(declare-fun m!74477 () Bool)

(assert (=> b!48032 m!74477))

(assert (=> b!48032 m!71775))

(declare-fun m!74479 () Bool)

(assert (=> b!48031 m!74479))

(declare-fun m!74481 () Bool)

(assert (=> b!48036 m!74481))

(declare-fun m!74483 () Bool)

(assert (=> b!48036 m!74483))

(declare-fun m!74485 () Bool)

(assert (=> d!14606 m!74485))

(declare-fun m!74487 () Bool)

(assert (=> d!14606 m!74487))

(assert (=> d!14606 m!74213))

(declare-fun m!74489 () Bool)

(assert (=> b!48034 m!74489))

(assert (=> b!48034 m!74477))

(assert (=> b!48033 m!74483))

(assert (=> b!48033 m!71775))

(declare-fun m!74491 () Bool)

(assert (=> b!48037 m!74491))

(assert (=> b!48037 m!74491))

(declare-fun m!74493 () Bool)

(assert (=> b!48037 m!74493))

(assert (=> b!46930 d!14606))

(declare-fun b!48041 () Bool)

(declare-fun e!31826 () Bool)

(declare-fun lt!74340 () List!544)

(assert (=> b!48041 (= e!31826 (> (length!239 lt!74340) 0))))

(declare-fun b!48039 () Bool)

(declare-fun lt!74341 () (_ BitVec 64))

(declare-fun lt!74339 () tuple2!4536)

(declare-fun e!31825 () tuple2!4538)

(assert (=> b!48039 (= e!31825 (tuple2!4539 (Cons!540 (_1!2361 lt!74339) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_2!2361 lt!74339) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74341))) (_2!2361 lt!74339)))))

(assert (=> b!48039 (= lt!74339 (readBit!0 (_1!2358 lt!72631)))))

(assert (=> b!48039 (= lt!74341 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48038 () Bool)

(assert (=> b!48038 (= e!31825 (tuple2!4539 Nil!541 (_1!2358 lt!72631)))))

(declare-fun b!48040 () Bool)

(assert (=> b!48040 (= e!31826 (isEmpty!137 lt!74340))))

(declare-fun d!14608 () Bool)

(assert (=> d!14608 e!31826))

(declare-fun c!3347 () Bool)

(assert (=> d!14608 (= c!3347 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14608 (= lt!74340 (_1!2362 e!31825))))

(declare-fun c!3348 () Bool)

(assert (=> d!14608 (= c!3348 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14608 (bvsge (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14608 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72631) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) lt!74340)))

(assert (= (and d!14608 c!3348) b!48038))

(assert (= (and d!14608 (not c!3348)) b!48039))

(assert (= (and d!14608 c!3347) b!48040))

(assert (= (and d!14608 (not c!3347)) b!48041))

(declare-fun m!74495 () Bool)

(assert (=> b!48041 m!74495))

(declare-fun m!74497 () Bool)

(assert (=> b!48039 m!74497))

(declare-fun m!74499 () Bool)

(assert (=> b!48039 m!74499))

(declare-fun m!74501 () Bool)

(assert (=> b!48040 m!74501))

(assert (=> b!46930 d!14608))

(declare-fun d!14610 () Bool)

(declare-fun c!3349 () Bool)

(assert (=> d!14610 (= c!3349 (= (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31827 () List!544)

(assert (=> d!14610 (= (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)) e!31827)))

(declare-fun b!48042 () Bool)

(assert (=> b!48042 (= e!31827 Nil!541)))

(declare-fun b!48043 () Bool)

(assert (=> b!48043 (= e!31827 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72630) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14610 c!3349) b!48042))

(assert (= (and d!14610 (not c!3349)) b!48043))

(declare-fun m!74503 () Bool)

(assert (=> b!48043 m!74503))

(declare-fun m!74505 () Bool)

(assert (=> b!48043 m!74505))

(declare-fun m!74507 () Bool)

(assert (=> b!48043 m!74507))

(assert (=> b!46930 d!14610))

(declare-fun d!14612 () Bool)

(assert (=> d!14612 (= (bitAt!0 (buf!1386 (_2!2357 lt!72615)) lt!72650) (bitAt!0 (buf!1386 (_2!2357 lt!72630)) lt!72650))))

(declare-fun lt!74344 () Unit!3311)

(declare-fun choose!31 (array!2295 array!2295 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3311)

(assert (=> d!14612 (= lt!74344 (choose!31 (buf!1386 (_2!2357 lt!72615)) (buf!1386 (_2!2357 lt!72630)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72650 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615)))))))

(assert (=> d!14612 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615)))))))

(assert (=> d!14612 (= (arrayBitRangesEqImpliesEq!0 (buf!1386 (_2!2357 lt!72615)) (buf!1386 (_2!2357 lt!72630)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!72650 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615)))) lt!74344)))

(declare-fun bs!3761 () Bool)

(assert (= bs!3761 d!14612))

(assert (=> bs!3761 m!72047))

(assert (=> bs!3761 m!72021))

(assert (=> bs!3761 m!72029))

(declare-fun m!74509 () Bool)

(assert (=> bs!3761 m!74509))

(assert (=> b!46930 d!14612))

(declare-fun d!14614 () Bool)

(assert (=> d!14614 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72610) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72610))))

(declare-fun bs!3762 () Bool)

(assert (= bs!3762 d!14614))

(declare-fun m!74511 () Bool)

(assert (=> bs!3762 m!74511))

(assert (=> b!46930 d!14614))

(declare-fun d!14616 () Bool)

(assert (=> d!14616 (= (bitAt!0 (buf!1386 (_2!2357 lt!72630)) lt!72650) (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (buf!1386 (_2!2357 lt!72630))) ((_ extract 31 0) (bvsdiv lt!72650 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!72650 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!3763 () Bool)

(assert (= bs!3763 d!14616))

(declare-fun m!74513 () Bool)

(assert (=> bs!3763 m!74513))

(assert (=> bs!3763 m!74413))

(assert (=> b!46930 d!14616))

(declare-fun b!48044 () Bool)

(declare-fun res!40385 () Bool)

(declare-fun e!31828 () Bool)

(assert (=> b!48044 (=> (not res!40385) (not e!31828))))

(declare-fun lt!74345 () tuple2!4530)

(assert (=> b!48044 (= res!40385 (isPrefixOf!0 (_2!2358 lt!74345) (_2!2357 lt!72630)))))

(declare-fun lt!74349 () (_ BitVec 64))

(declare-fun lt!74352 () (_ BitVec 64))

(declare-fun b!48045 () Bool)

(assert (=> b!48045 (= e!31828 (= (_1!2358 lt!74345) (withMovedBitIndex!0 (_2!2358 lt!74345) (bvsub lt!74349 lt!74352))))))

(assert (=> b!48045 (or (= (bvand lt!74349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74352 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74349 lt!74352) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48045 (= lt!74352 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72630))) (currentByte!2891 (_2!2357 lt!72630)) (currentBit!2886 (_2!2357 lt!72630))))))

(assert (=> b!48045 (= lt!74349 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(declare-fun b!48046 () Bool)

(declare-fun e!31829 () Unit!3311)

(declare-fun lt!74360 () Unit!3311)

(assert (=> b!48046 (= e!31829 lt!74360)))

(declare-fun lt!74355 () (_ BitVec 64))

(assert (=> b!48046 (= lt!74355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74362 () (_ BitVec 64))

(assert (=> b!48046 (= lt!74362 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(assert (=> b!48046 (= lt!74360 (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72615)) (buf!1386 (_2!2357 lt!72630)) lt!74355 lt!74362))))

(assert (=> b!48046 (arrayBitRangesEq!0 (buf!1386 (_2!2357 lt!72630)) (buf!1386 (_2!2357 lt!72615)) lt!74355 lt!74362)))

(declare-fun b!48047 () Bool)

(declare-fun res!40387 () Bool)

(assert (=> b!48047 (=> (not res!40387) (not e!31828))))

(assert (=> b!48047 (= res!40387 (isPrefixOf!0 (_1!2358 lt!74345) (_2!2357 lt!72615)))))

(declare-fun d!14618 () Bool)

(assert (=> d!14618 e!31828))

(declare-fun res!40386 () Bool)

(assert (=> d!14618 (=> (not res!40386) (not e!31828))))

(assert (=> d!14618 (= res!40386 (isPrefixOf!0 (_1!2358 lt!74345) (_2!2358 lt!74345)))))

(declare-fun lt!74351 () BitStream!1806)

(assert (=> d!14618 (= lt!74345 (tuple2!4531 lt!74351 (_2!2357 lt!72630)))))

(declare-fun lt!74363 () Unit!3311)

(declare-fun lt!74353 () Unit!3311)

(assert (=> d!14618 (= lt!74363 lt!74353)))

(assert (=> d!14618 (isPrefixOf!0 lt!74351 (_2!2357 lt!72630))))

(assert (=> d!14618 (= lt!74353 (lemmaIsPrefixTransitive!0 lt!74351 (_2!2357 lt!72630) (_2!2357 lt!72630)))))

(declare-fun lt!74359 () Unit!3311)

(declare-fun lt!74361 () Unit!3311)

(assert (=> d!14618 (= lt!74359 lt!74361)))

(assert (=> d!14618 (isPrefixOf!0 lt!74351 (_2!2357 lt!72630))))

(assert (=> d!14618 (= lt!74361 (lemmaIsPrefixTransitive!0 lt!74351 (_2!2357 lt!72615) (_2!2357 lt!72630)))))

(declare-fun lt!74354 () Unit!3311)

(assert (=> d!14618 (= lt!74354 e!31829)))

(declare-fun c!3350 () Bool)

(assert (=> d!14618 (= c!3350 (not (= (size!1037 (buf!1386 (_2!2357 lt!72615))) #b00000000000000000000000000000000)))))

(declare-fun lt!74350 () Unit!3311)

(declare-fun lt!74348 () Unit!3311)

(assert (=> d!14618 (= lt!74350 lt!74348)))

(assert (=> d!14618 (isPrefixOf!0 (_2!2357 lt!72630) (_2!2357 lt!72630))))

(assert (=> d!14618 (= lt!74348 (lemmaIsPrefixRefl!0 (_2!2357 lt!72630)))))

(declare-fun lt!74347 () Unit!3311)

(declare-fun lt!74346 () Unit!3311)

(assert (=> d!14618 (= lt!74347 lt!74346)))

(assert (=> d!14618 (= lt!74346 (lemmaIsPrefixRefl!0 (_2!2357 lt!72630)))))

(declare-fun lt!74364 () Unit!3311)

(declare-fun lt!74358 () Unit!3311)

(assert (=> d!14618 (= lt!74364 lt!74358)))

(assert (=> d!14618 (isPrefixOf!0 lt!74351 lt!74351)))

(assert (=> d!14618 (= lt!74358 (lemmaIsPrefixRefl!0 lt!74351))))

(declare-fun lt!74357 () Unit!3311)

(declare-fun lt!74356 () Unit!3311)

(assert (=> d!14618 (= lt!74357 lt!74356)))

(assert (=> d!14618 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!72615))))

(assert (=> d!14618 (= lt!74356 (lemmaIsPrefixRefl!0 (_2!2357 lt!72615)))))

(assert (=> d!14618 (= lt!74351 (BitStream!1807 (buf!1386 (_2!2357 lt!72630)) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(assert (=> d!14618 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!72630))))

(assert (=> d!14618 (= (reader!0 (_2!2357 lt!72615) (_2!2357 lt!72630)) lt!74345)))

(declare-fun b!48048 () Bool)

(declare-fun Unit!3369 () Unit!3311)

(assert (=> b!48048 (= e!31829 Unit!3369)))

(assert (= (and d!14618 c!3350) b!48046))

(assert (= (and d!14618 (not c!3350)) b!48048))

(assert (= (and d!14618 res!40386) b!48047))

(assert (= (and b!48047 res!40387) b!48044))

(assert (= (and b!48044 res!40385) b!48045))

(declare-fun m!74515 () Bool)

(assert (=> b!48044 m!74515))

(declare-fun m!74517 () Bool)

(assert (=> b!48047 m!74517))

(declare-fun m!74519 () Bool)

(assert (=> b!48045 m!74519))

(assert (=> b!48045 m!72009))

(assert (=> b!48045 m!72029))

(declare-fun m!74521 () Bool)

(assert (=> d!14618 m!74521))

(declare-fun m!74523 () Bool)

(assert (=> d!14618 m!74523))

(declare-fun m!74525 () Bool)

(assert (=> d!14618 m!74525))

(declare-fun m!74527 () Bool)

(assert (=> d!14618 m!74527))

(declare-fun m!74529 () Bool)

(assert (=> d!14618 m!74529))

(assert (=> d!14618 m!74457))

(declare-fun m!74531 () Bool)

(assert (=> d!14618 m!74531))

(declare-fun m!74533 () Bool)

(assert (=> d!14618 m!74533))

(declare-fun m!74535 () Bool)

(assert (=> d!14618 m!74535))

(assert (=> d!14618 m!74463))

(declare-fun m!74537 () Bool)

(assert (=> d!14618 m!74537))

(assert (=> b!48046 m!72029))

(declare-fun m!74539 () Bool)

(assert (=> b!48046 m!74539))

(declare-fun m!74541 () Bool)

(assert (=> b!48046 m!74541))

(assert (=> b!46930 d!14618))

(declare-fun b!48052 () Bool)

(declare-fun e!31831 () Bool)

(declare-fun lt!74366 () List!544)

(assert (=> b!48052 (= e!31831 (> (length!239 lt!74366) 0))))

(declare-fun e!31830 () tuple2!4538)

(declare-fun b!48050 () Bool)

(declare-fun lt!74365 () tuple2!4536)

(declare-fun lt!74367 () (_ BitVec 64))

(assert (=> b!48050 (= e!31830 (tuple2!4539 (Cons!540 (_1!2361 lt!74365) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72615) (_2!2361 lt!74365) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!74367))) (_2!2361 lt!74365)))))

(assert (=> b!48050 (= lt!74365 (readBit!0 (_1!2358 lt!72609)))))

(assert (=> b!48050 (= lt!74367 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48049 () Bool)

(assert (=> b!48049 (= e!31830 (tuple2!4539 Nil!541 (_1!2358 lt!72609)))))

(declare-fun b!48051 () Bool)

(assert (=> b!48051 (= e!31831 (isEmpty!137 lt!74366))))

(declare-fun d!14620 () Bool)

(assert (=> d!14620 e!31831))

(declare-fun c!3351 () Bool)

(assert (=> d!14620 (= c!3351 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14620 (= lt!74366 (_1!2362 e!31830))))

(declare-fun c!3352 () Bool)

(assert (=> d!14620 (= c!3352 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14620 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14620 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72615) (_1!2358 lt!72609) #b0000000000000000000000000000000000000000000000000000000000000001) lt!74366)))

(assert (= (and d!14620 c!3352) b!48049))

(assert (= (and d!14620 (not c!3352)) b!48050))

(assert (= (and d!14620 c!3351) b!48051))

(assert (= (and d!14620 (not c!3351)) b!48052))

(declare-fun m!74543 () Bool)

(assert (=> b!48052 m!74543))

(declare-fun m!74545 () Bool)

(assert (=> b!48050 m!74545))

(declare-fun m!74547 () Bool)

(assert (=> b!48050 m!74547))

(declare-fun m!74549 () Bool)

(assert (=> b!48051 m!74549))

(assert (=> b!46930 d!14620))

(declare-fun b!48053 () Bool)

(declare-fun e!31832 () Bool)

(declare-fun lt!74377 () (_ BitVec 64))

(assert (=> b!48053 (= e!31832 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!74377))))

(declare-fun e!31834 () Bool)

(declare-fun lt!74386 () tuple2!4528)

(declare-fun b!48054 () Bool)

(declare-fun lt!74383 () tuple2!4530)

(assert (=> b!48054 (= e!31834 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!74386) (_1!2358 lt!74383) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))) (byteArrayBitContentToList!0 (_2!2357 lt!74386) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))))

(assert (=> b!48054 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48054 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!74402 () Unit!3311)

(declare-fun lt!74384 () Unit!3311)

(assert (=> b!48054 (= lt!74402 lt!74384)))

(assert (=> b!48054 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!74386)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!74377)))

(assert (=> b!48054 (= lt!74384 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!74386)) lt!74377))))

(assert (=> b!48054 e!31832))

(declare-fun res!40390 () Bool)

(assert (=> b!48054 (=> (not res!40390) (not e!31832))))

(assert (=> b!48054 (= res!40390 (and (= (size!1037 (buf!1386 (_2!2357 lt!72615))) (size!1037 (buf!1386 (_2!2357 lt!74386)))) (bvsge lt!74377 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48054 (= lt!74377 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!48054 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48054 (= lt!74383 (reader!0 (_2!2357 lt!72615) (_2!2357 lt!74386)))))

(declare-fun b!48055 () Bool)

(declare-fun res!40389 () Bool)

(assert (=> b!48055 (=> (not res!40389) (not e!31834))))

(assert (=> b!48055 (= res!40389 (invariant!0 (currentBit!2886 (_2!2357 lt!74386)) (currentByte!2891 (_2!2357 lt!74386)) (size!1037 (buf!1386 (_2!2357 lt!74386)))))))

(declare-fun b!48056 () Bool)

(declare-fun res!40393 () Bool)

(assert (=> b!48056 (=> (not res!40393) (not e!31834))))

(assert (=> b!48056 (= res!40393 (= (size!1037 (buf!1386 (_2!2357 lt!72615))) (size!1037 (buf!1386 (_2!2357 lt!74386)))))))

(declare-fun b!48057 () Bool)

(declare-fun e!31833 () tuple2!4528)

(declare-fun Unit!3370 () Unit!3311)

(assert (=> b!48057 (= e!31833 (tuple2!4529 Unit!3370 (_2!2357 lt!72615)))))

(assert (=> b!48057 (= (size!1037 (buf!1386 (_2!2357 lt!72615))) (size!1037 (buf!1386 (_2!2357 lt!72615))))))

(declare-fun lt!74404 () Unit!3311)

(declare-fun Unit!3371 () Unit!3311)

(assert (=> b!48057 (= lt!74404 Unit!3371)))

(declare-fun call!601 () tuple2!4530)

(assert (=> b!48057 (checkByteArrayBitContent!0 (_2!2357 lt!72615) srcBuffer!2 (_1!2363 (readBits!0 (_1!2358 call!601) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!48058 () Bool)

(declare-fun res!40392 () Bool)

(assert (=> b!48058 (=> (not res!40392) (not e!31834))))

(assert (=> b!48058 (= res!40392 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!74386)))))

(declare-fun d!14622 () Bool)

(assert (=> d!14622 e!31834))

(declare-fun res!40388 () Bool)

(assert (=> d!14622 (=> (not res!40388) (not e!31834))))

(declare-fun lt!74382 () (_ BitVec 64))

(assert (=> d!14622 (= res!40388 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74386))) (currentByte!2891 (_2!2357 lt!74386)) (currentBit!2886 (_2!2357 lt!74386))) (bvsub lt!74382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> d!14622 (or (= (bvand lt!74382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74382 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74382 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!74385 () (_ BitVec 64))

(assert (=> d!14622 (= lt!74382 (bvadd lt!74385 to!314))))

(assert (=> d!14622 (or (not (= (bvand lt!74385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74385 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14622 (= lt!74385 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(assert (=> d!14622 (= lt!74386 e!31833)))

(declare-fun c!3353 () Bool)

(assert (=> d!14622 (= c!3353 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!74379 () Unit!3311)

(declare-fun lt!74399 () Unit!3311)

(assert (=> d!14622 (= lt!74379 lt!74399)))

(assert (=> d!14622 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!72615))))

(assert (=> d!14622 (= lt!74399 (lemmaIsPrefixRefl!0 (_2!2357 lt!72615)))))

(declare-fun lt!74411 () (_ BitVec 64))

(assert (=> d!14622 (= lt!74411 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))))))

(assert (=> d!14622 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14622 (= (appendBitsMSBFirstLoop!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314) lt!74386)))

(declare-fun lt!74391 () tuple2!4528)

(declare-fun bm!598 () Bool)

(assert (=> bm!598 (= call!601 (reader!0 (_2!2357 lt!72615) (ite c!3353 (_2!2357 lt!74391) (_2!2357 lt!72615))))))

(declare-fun b!48059 () Bool)

(declare-fun res!40391 () Bool)

(assert (=> b!48059 (=> (not res!40391) (not e!31834))))

(assert (=> b!48059 (= res!40391 (= (size!1037 (buf!1386 (_2!2357 lt!74386))) (size!1037 (buf!1386 (_2!2357 lt!72615)))))))

(declare-fun b!48060 () Bool)

(declare-fun Unit!3372 () Unit!3311)

(assert (=> b!48060 (= e!31833 (tuple2!4529 Unit!3372 (_2!2357 lt!74391)))))

(declare-fun lt!74376 () tuple2!4528)

(assert (=> b!48060 (= lt!74376 (appendBitFromByte!0 (_2!2357 lt!72615) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!74368 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74368 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74394 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74394 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74400 () Unit!3311)

(assert (=> b!48060 (= lt!74400 (validateOffsetBitsIneqLemma!0 (_2!2357 lt!72615) (_2!2357 lt!74376) lt!74368 lt!74394))))

(assert (=> b!48060 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!74376)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!74376))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!74376))) (bvsub lt!74368 lt!74394))))

(declare-fun lt!74409 () Unit!3311)

(assert (=> b!48060 (= lt!74409 lt!74400)))

(declare-fun lt!74370 () tuple2!4530)

(assert (=> b!48060 (= lt!74370 (reader!0 (_2!2357 lt!72615) (_2!2357 lt!74376)))))

(declare-fun lt!74378 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74378 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74380 () Unit!3311)

(assert (=> b!48060 (= lt!74380 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!74376)) lt!74378))))

(assert (=> b!48060 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!74376)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!74378)))

(declare-fun lt!74398 () Unit!3311)

(assert (=> b!48060 (= lt!74398 lt!74380)))

(assert (=> b!48060 (= (head!363 (byteArrayBitContentToList!0 (_2!2357 lt!74376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!363 (bitStreamReadBitsIntoList!0 (_2!2357 lt!74376) (_1!2358 lt!74370) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74397 () Unit!3311)

(declare-fun Unit!3373 () Unit!3311)

(assert (=> b!48060 (= lt!74397 Unit!3373)))

(assert (=> b!48060 (= lt!74391 (appendBitsMSBFirstLoop!0 (_2!2357 lt!74376) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!74372 () Unit!3311)

(assert (=> b!48060 (= lt!74372 (lemmaIsPrefixTransitive!0 (_2!2357 lt!72615) (_2!2357 lt!74376) (_2!2357 lt!74391)))))

(assert (=> b!48060 (isPrefixOf!0 (_2!2357 lt!72615) (_2!2357 lt!74391))))

(declare-fun lt!74389 () Unit!3311)

(assert (=> b!48060 (= lt!74389 lt!74372)))

(assert (=> b!48060 (= (size!1037 (buf!1386 (_2!2357 lt!74391))) (size!1037 (buf!1386 (_2!2357 lt!72615))))))

(declare-fun lt!74375 () Unit!3311)

(declare-fun Unit!3374 () Unit!3311)

(assert (=> b!48060 (= lt!74375 Unit!3374)))

(assert (=> b!48060 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74391))) (currentByte!2891 (_2!2357 lt!74391)) (currentBit!2886 (_2!2357 lt!74391))) (bvsub (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74408 () Unit!3311)

(declare-fun Unit!3375 () Unit!3311)

(assert (=> b!48060 (= lt!74408 Unit!3375)))

(assert (=> b!48060 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74391))) (currentByte!2891 (_2!2357 lt!74391)) (currentBit!2886 (_2!2357 lt!74391))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74376))) (currentByte!2891 (_2!2357 lt!74376)) (currentBit!2886 (_2!2357 lt!74376))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74387 () Unit!3311)

(declare-fun Unit!3376 () Unit!3311)

(assert (=> b!48060 (= lt!74387 Unit!3376)))

(declare-fun lt!74381 () tuple2!4530)

(assert (=> b!48060 (= lt!74381 call!601)))

(declare-fun lt!74371 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74371 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74390 () Unit!3311)

(assert (=> b!48060 (= lt!74390 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72615) (buf!1386 (_2!2357 lt!74391)) lt!74371))))

(assert (=> b!48060 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!74391)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615))) lt!74371)))

(declare-fun lt!74410 () Unit!3311)

(assert (=> b!48060 (= lt!74410 lt!74390)))

(declare-fun lt!74392 () tuple2!4530)

(assert (=> b!48060 (= lt!74392 (reader!0 (_2!2357 lt!74376) (_2!2357 lt!74391)))))

(declare-fun lt!74373 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74373 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!74407 () Unit!3311)

(assert (=> b!48060 (= lt!74407 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!74376) (buf!1386 (_2!2357 lt!74391)) lt!74373))))

(assert (=> b!48060 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!74391)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!74376))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!74376))) lt!74373)))

(declare-fun lt!74403 () Unit!3311)

(assert (=> b!48060 (= lt!74403 lt!74407)))

(declare-fun lt!74401 () List!544)

(assert (=> b!48060 (= lt!74401 (byteArrayBitContentToList!0 (_2!2357 lt!74391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!74406 () List!544)

(assert (=> b!48060 (= lt!74406 (byteArrayBitContentToList!0 (_2!2357 lt!74391) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74374 () List!544)

(assert (=> b!48060 (= lt!74374 (bitStreamReadBitsIntoList!0 (_2!2357 lt!74391) (_1!2358 lt!74381) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!74405 () List!544)

(assert (=> b!48060 (= lt!74405 (bitStreamReadBitsIntoList!0 (_2!2357 lt!74391) (_1!2358 lt!74392) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74396 () (_ BitVec 64))

(assert (=> b!48060 (= lt!74396 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!74388 () Unit!3311)

(assert (=> b!48060 (= lt!74388 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2357 lt!74391) (_2!2357 lt!74391) (_1!2358 lt!74381) (_1!2358 lt!74392) lt!74396 lt!74374))))

(assert (=> b!48060 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!74391) (_1!2358 lt!74392) (bvsub lt!74396 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!230 lt!74374))))

(declare-fun lt!74395 () Unit!3311)

(assert (=> b!48060 (= lt!74395 lt!74388)))

(declare-fun lt!74369 () Unit!3311)

(assert (=> b!48060 (= lt!74369 (arrayBitRangesEqImpliesEq!0 (buf!1386 (_2!2357 lt!74376)) (buf!1386 (_2!2357 lt!74391)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!74411 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!74376))) (currentByte!2891 (_2!2357 lt!74376)) (currentBit!2886 (_2!2357 lt!74376)))))))

(assert (=> b!48060 (= (bitAt!0 (buf!1386 (_2!2357 lt!74376)) lt!74411) (bitAt!0 (buf!1386 (_2!2357 lt!74391)) lt!74411))))

(declare-fun lt!74393 () Unit!3311)

(assert (=> b!48060 (= lt!74393 lt!74369)))

(assert (= (and d!14622 c!3353) b!48060))

(assert (= (and d!14622 (not c!3353)) b!48057))

(assert (= (or b!48060 b!48057) bm!598))

(assert (= (and d!14622 res!40388) b!48055))

(assert (= (and b!48055 res!40389) b!48056))

(assert (= (and b!48056 res!40393) b!48058))

(assert (= (and b!48058 res!40392) b!48059))

(assert (= (and b!48059 res!40391) b!48054))

(assert (= (and b!48054 res!40390) b!48053))

(declare-fun m!74551 () Bool)

(assert (=> b!48060 m!74551))

(declare-fun m!74553 () Bool)

(assert (=> b!48060 m!74553))

(declare-fun m!74555 () Bool)

(assert (=> b!48060 m!74555))

(declare-fun m!74557 () Bool)

(assert (=> b!48060 m!74557))

(assert (=> b!48060 m!72029))

(declare-fun m!74559 () Bool)

(assert (=> b!48060 m!74559))

(declare-fun m!74561 () Bool)

(assert (=> b!48060 m!74561))

(declare-fun m!74563 () Bool)

(assert (=> b!48060 m!74563))

(declare-fun m!74565 () Bool)

(assert (=> b!48060 m!74565))

(declare-fun m!74567 () Bool)

(assert (=> b!48060 m!74567))

(declare-fun m!74569 () Bool)

(assert (=> b!48060 m!74569))

(assert (=> b!48060 m!74503))

(declare-fun m!74571 () Bool)

(assert (=> b!48060 m!74571))

(declare-fun m!74573 () Bool)

(assert (=> b!48060 m!74573))

(declare-fun m!74575 () Bool)

(assert (=> b!48060 m!74575))

(declare-fun m!74577 () Bool)

(assert (=> b!48060 m!74577))

(declare-fun m!74579 () Bool)

(assert (=> b!48060 m!74579))

(declare-fun m!74581 () Bool)

(assert (=> b!48060 m!74581))

(declare-fun m!74583 () Bool)

(assert (=> b!48060 m!74583))

(declare-fun m!74585 () Bool)

(assert (=> b!48060 m!74585))

(declare-fun m!74587 () Bool)

(assert (=> b!48060 m!74587))

(declare-fun m!74589 () Bool)

(assert (=> b!48060 m!74589))

(declare-fun m!74591 () Bool)

(assert (=> b!48060 m!74591))

(assert (=> b!48060 m!74559))

(declare-fun m!74593 () Bool)

(assert (=> b!48060 m!74593))

(declare-fun m!74595 () Bool)

(assert (=> b!48060 m!74595))

(declare-fun m!74597 () Bool)

(assert (=> b!48060 m!74597))

(declare-fun m!74599 () Bool)

(assert (=> b!48060 m!74599))

(declare-fun m!74601 () Bool)

(assert (=> b!48060 m!74601))

(assert (=> b!48060 m!74503))

(declare-fun m!74603 () Bool)

(assert (=> b!48060 m!74603))

(declare-fun m!74605 () Bool)

(assert (=> b!48060 m!74605))

(declare-fun m!74607 () Bool)

(assert (=> b!48060 m!74607))

(assert (=> b!48060 m!74551))

(declare-fun m!74609 () Bool)

(assert (=> b!48060 m!74609))

(assert (=> b!48060 m!74575))

(declare-fun m!74611 () Bool)

(assert (=> b!48057 m!74611))

(declare-fun m!74613 () Bool)

(assert (=> b!48057 m!74613))

(declare-fun m!74615 () Bool)

(assert (=> bm!598 m!74615))

(declare-fun m!74617 () Bool)

(assert (=> b!48054 m!74617))

(declare-fun m!74619 () Bool)

(assert (=> b!48054 m!74619))

(declare-fun m!74621 () Bool)

(assert (=> b!48054 m!74621))

(declare-fun m!74623 () Bool)

(assert (=> b!48054 m!74623))

(declare-fun m!74625 () Bool)

(assert (=> b!48054 m!74625))

(declare-fun m!74627 () Bool)

(assert (=> b!48058 m!74627))

(declare-fun m!74629 () Bool)

(assert (=> d!14622 m!74629))

(assert (=> d!14622 m!72029))

(assert (=> d!14622 m!74457))

(assert (=> d!14622 m!74463))

(declare-fun m!74631 () Bool)

(assert (=> b!48055 m!74631))

(declare-fun m!74633 () Bool)

(assert (=> b!48053 m!74633))

(assert (=> b!46930 d!14622))

(declare-fun b!48064 () Bool)

(declare-fun e!31836 () Bool)

(declare-fun lt!74413 () List!544)

(assert (=> b!48064 (= e!31836 (> (length!239 lt!74413) 0))))

(declare-fun lt!74412 () tuple2!4536)

(declare-fun lt!74414 () (_ BitVec 64))

(declare-fun b!48062 () Bool)

(declare-fun e!31835 () tuple2!4538)

(assert (=> b!48062 (= e!31835 (tuple2!4539 (Cons!540 (_1!2361 lt!74412) (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_2!2361 lt!74412) (bvsub (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001) lt!74414))) (_2!2361 lt!74412)))))

(assert (=> b!48062 (= lt!74412 (readBit!0 (_1!2358 lt!72631)))))

(assert (=> b!48062 (= lt!74414 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!48061 () Bool)

(assert (=> b!48061 (= e!31835 (tuple2!4539 Nil!541 (_1!2358 lt!72631)))))

(declare-fun b!48063 () Bool)

(assert (=> b!48063 (= e!31836 (isEmpty!137 lt!74413))))

(declare-fun d!14624 () Bool)

(assert (=> d!14624 e!31836))

(declare-fun c!3354 () Bool)

(assert (=> d!14624 (= c!3354 (= (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14624 (= lt!74413 (_1!2362 e!31835))))

(declare-fun c!3355 () Bool)

(assert (=> d!14624 (= c!3355 (= (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14624 (bvsge (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!14624 (= (bitStreamReadBitsIntoList!0 (_2!2357 lt!72630) (_1!2358 lt!72631) (bvsub lt!72635 #b0000000000000000000000000000000000000000000000000000000000000001)) lt!74413)))

(assert (= (and d!14624 c!3355) b!48061))

(assert (= (and d!14624 (not c!3355)) b!48062))

(assert (= (and d!14624 c!3354) b!48063))

(assert (= (and d!14624 (not c!3354)) b!48064))

(declare-fun m!74635 () Bool)

(assert (=> b!48064 m!74635))

(declare-fun m!74637 () Bool)

(assert (=> b!48062 m!74637))

(assert (=> b!48062 m!74499))

(declare-fun m!74639 () Bool)

(assert (=> b!48063 m!74639))

(assert (=> b!46930 d!14624))

(declare-fun d!14626 () Bool)

(declare-fun c!3356 () Bool)

(assert (=> d!14626 (= c!3356 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!31837 () List!544)

(assert (=> d!14626 (= (byteArrayBitContentToList!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) e!31837)))

(declare-fun b!48065 () Bool)

(assert (=> b!48065 (= e!31837 Nil!541)))

(declare-fun b!48066 () Bool)

(assert (=> b!48066 (= e!31837 (Cons!540 (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2357 lt!72615) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!14626 c!3356) b!48065))

(assert (= (and d!14626 (not c!3356)) b!48066))

(assert (=> b!48066 m!72023))

(assert (=> b!48066 m!74213))

(declare-fun m!74641 () Bool)

(assert (=> b!48066 m!74641))

(assert (=> b!46930 d!14626))

(declare-fun d!14628 () Bool)

(assert (=> d!14628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72630)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72610)))

(declare-fun lt!74415 () Unit!3311)

(assert (=> d!14628 (= lt!74415 (choose!9 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72630)) lt!72610 (BitStream!1807 (buf!1386 (_2!2357 lt!72630)) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328)))))))

(assert (=> d!14628 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2357 lt!72328) (buf!1386 (_2!2357 lt!72630)) lt!72610) lt!74415)))

(declare-fun bs!3764 () Bool)

(assert (= bs!3764 d!14628))

(assert (=> bs!3764 m!72051))

(declare-fun m!74643 () Bool)

(assert (=> bs!3764 m!74643))

(assert (=> b!46930 d!14628))

(declare-fun d!14630 () Bool)

(declare-fun e!31838 () Bool)

(assert (=> d!14630 e!31838))

(declare-fun res!40394 () Bool)

(assert (=> d!14630 (=> (not res!40394) (not e!31838))))

(declare-fun lt!74418 () (_ BitVec 64))

(declare-fun lt!74419 () (_ BitVec 64))

(declare-fun lt!74416 () (_ BitVec 64))

(assert (=> d!14630 (= res!40394 (= lt!74416 (bvsub lt!74418 lt!74419)))))

(assert (=> d!14630 (or (= (bvand lt!74418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74419 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74418 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74418 lt!74419) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14630 (= lt!74419 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615)))))))

(declare-fun lt!74421 () (_ BitVec 64))

(declare-fun lt!74420 () (_ BitVec 64))

(assert (=> d!14630 (= lt!74418 (bvmul lt!74421 lt!74420))))

(assert (=> d!14630 (or (= lt!74421 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74420 (bvsdiv (bvmul lt!74421 lt!74420) lt!74421)))))

(assert (=> d!14630 (= lt!74420 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14630 (= lt!74421 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))))))

(assert (=> d!14630 (= lt!74416 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72615))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72615)))))))

(assert (=> d!14630 (invariant!0 (currentBit!2886 (_2!2357 lt!72615)) (currentByte!2891 (_2!2357 lt!72615)) (size!1037 (buf!1386 (_2!2357 lt!72615))))))

(assert (=> d!14630 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72615))) (currentByte!2891 (_2!2357 lt!72615)) (currentBit!2886 (_2!2357 lt!72615))) lt!74416)))

(declare-fun b!48067 () Bool)

(declare-fun res!40395 () Bool)

(assert (=> b!48067 (=> (not res!40395) (not e!31838))))

(assert (=> b!48067 (= res!40395 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74416))))

(declare-fun b!48068 () Bool)

(declare-fun lt!74417 () (_ BitVec 64))

(assert (=> b!48068 (= e!31838 (bvsle lt!74416 (bvmul lt!74417 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48068 (or (= lt!74417 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74417 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74417)))))

(assert (=> b!48068 (= lt!74417 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72615)))))))

(assert (= (and d!14630 res!40394) b!48067))

(assert (= (and b!48067 res!40395) b!48068))

(assert (=> d!14630 m!74441))

(declare-fun m!74645 () Bool)

(assert (=> d!14630 m!74645))

(assert (=> b!46930 d!14630))

(declare-fun d!14632 () Bool)

(assert (=> d!14632 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 thiss!1379)))))))

(assert (=> d!13720 d!14632))

(assert (=> b!46972 d!13748))

(declare-fun b!48069 () Bool)

(declare-fun res!40396 () Bool)

(declare-fun e!31839 () Bool)

(assert (=> b!48069 (=> (not res!40396) (not e!31839))))

(declare-fun lt!74422 () tuple2!4530)

(assert (=> b!48069 (= res!40396 (isPrefixOf!0 (_2!2358 lt!74422) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun b!48070 () Bool)

(declare-fun lt!74429 () (_ BitVec 64))

(declare-fun lt!74426 () (_ BitVec 64))

(assert (=> b!48070 (= e!31839 (= (_1!2358 lt!74422) (withMovedBitIndex!0 (_2!2358 lt!74422) (bvsub lt!74426 lt!74429))))))

(assert (=> b!48070 (or (= (bvand lt!74426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74426 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74426 lt!74429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48070 (= lt!74429 (bitIndex!0 (size!1037 (buf!1386 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))) (currentByte!2891 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))) (currentBit!2886 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))))))

(assert (=> b!48070 (= lt!74426 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(declare-fun b!48071 () Bool)

(declare-fun e!31840 () Unit!3311)

(declare-fun lt!74437 () Unit!3311)

(assert (=> b!48071 (= e!31840 lt!74437)))

(declare-fun lt!74432 () (_ BitVec 64))

(assert (=> b!48071 (= lt!74432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!74439 () (_ BitVec 64))

(assert (=> b!48071 (= lt!74439 (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> b!48071 (= lt!74437 (arrayBitRangesEqSymmetric!0 (buf!1386 (_2!2357 lt!72328)) (buf!1386 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))) lt!74432 lt!74439))))

(assert (=> b!48071 (arrayBitRangesEq!0 (buf!1386 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))) (buf!1386 (_2!2357 lt!72328)) lt!74432 lt!74439)))

(declare-fun b!48072 () Bool)

(declare-fun res!40398 () Bool)

(assert (=> b!48072 (=> (not res!40398) (not e!31839))))

(assert (=> b!48072 (= res!40398 (isPrefixOf!0 (_1!2358 lt!74422) (_2!2357 lt!72328)))))

(declare-fun d!14634 () Bool)

(assert (=> d!14634 e!31839))

(declare-fun res!40397 () Bool)

(assert (=> d!14634 (=> (not res!40397) (not e!31839))))

(assert (=> d!14634 (= res!40397 (isPrefixOf!0 (_1!2358 lt!74422) (_2!2358 lt!74422)))))

(declare-fun lt!74428 () BitStream!1806)

(assert (=> d!14634 (= lt!74422 (tuple2!4531 lt!74428 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun lt!74440 () Unit!3311)

(declare-fun lt!74430 () Unit!3311)

(assert (=> d!14634 (= lt!74440 lt!74430)))

(assert (=> d!14634 (isPrefixOf!0 lt!74428 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))))

(assert (=> d!14634 (= lt!74430 (lemmaIsPrefixTransitive!0 lt!74428 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun lt!74436 () Unit!3311)

(declare-fun lt!74438 () Unit!3311)

(assert (=> d!14634 (= lt!74436 lt!74438)))

(assert (=> d!14634 (isPrefixOf!0 lt!74428 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))))

(assert (=> d!14634 (= lt!74438 (lemmaIsPrefixTransitive!0 lt!74428 (_2!2357 lt!72328) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun lt!74431 () Unit!3311)

(assert (=> d!14634 (= lt!74431 e!31840)))

(declare-fun c!3357 () Bool)

(assert (=> d!14634 (= c!3357 (not (= (size!1037 (buf!1386 (_2!2357 lt!72328))) #b00000000000000000000000000000000)))))

(declare-fun lt!74427 () Unit!3311)

(declare-fun lt!74425 () Unit!3311)

(assert (=> d!14634 (= lt!74427 lt!74425)))

(assert (=> d!14634 (isPrefixOf!0 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))))

(assert (=> d!14634 (= lt!74425 (lemmaIsPrefixRefl!0 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun lt!74424 () Unit!3311)

(declare-fun lt!74423 () Unit!3311)

(assert (=> d!14634 (= lt!74424 lt!74423)))

(assert (=> d!14634 (= lt!74423 (lemmaIsPrefixRefl!0 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))))))

(declare-fun lt!74441 () Unit!3311)

(declare-fun lt!74435 () Unit!3311)

(assert (=> d!14634 (= lt!74441 lt!74435)))

(assert (=> d!14634 (isPrefixOf!0 lt!74428 lt!74428)))

(assert (=> d!14634 (= lt!74435 (lemmaIsPrefixRefl!0 lt!74428))))

(declare-fun lt!74434 () Unit!3311)

(declare-fun lt!74433 () Unit!3311)

(assert (=> d!14634 (= lt!74434 lt!74433)))

(assert (=> d!14634 (isPrefixOf!0 (_2!2357 lt!72328) (_2!2357 lt!72328))))

(assert (=> d!14634 (= lt!74433 (lemmaIsPrefixRefl!0 (_2!2357 lt!72328)))))

(assert (=> d!14634 (= lt!74428 (BitStream!1807 (buf!1386 (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))) (currentByte!2891 (_2!2357 lt!72328)) (currentBit!2886 (_2!2357 lt!72328))))))

(assert (=> d!14634 (isPrefixOf!0 (_2!2357 lt!72328) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328)))))

(assert (=> d!14634 (= (reader!0 (_2!2357 lt!72328) (ite c!3189 (_2!2357 lt!72630) (_2!2357 lt!72328))) lt!74422)))

(declare-fun b!48073 () Bool)

(declare-fun Unit!3377 () Unit!3311)

(assert (=> b!48073 (= e!31840 Unit!3377)))

(assert (= (and d!14634 c!3357) b!48071))

(assert (= (and d!14634 (not c!3357)) b!48073))

(assert (= (and d!14634 res!40397) b!48072))

(assert (= (and b!48072 res!40398) b!48069))

(assert (= (and b!48069 res!40396) b!48070))

(declare-fun m!74647 () Bool)

(assert (=> b!48069 m!74647))

(declare-fun m!74649 () Bool)

(assert (=> b!48072 m!74649))

(declare-fun m!74651 () Bool)

(assert (=> b!48070 m!74651))

(declare-fun m!74653 () Bool)

(assert (=> b!48070 m!74653))

(assert (=> b!48070 m!71775))

(declare-fun m!74655 () Bool)

(assert (=> d!14634 m!74655))

(declare-fun m!74657 () Bool)

(assert (=> d!14634 m!74657))

(declare-fun m!74659 () Bool)

(assert (=> d!14634 m!74659))

(declare-fun m!74661 () Bool)

(assert (=> d!14634 m!74661))

(declare-fun m!74663 () Bool)

(assert (=> d!14634 m!74663))

(assert (=> d!14634 m!71939))

(declare-fun m!74665 () Bool)

(assert (=> d!14634 m!74665))

(declare-fun m!74667 () Bool)

(assert (=> d!14634 m!74667))

(declare-fun m!74669 () Bool)

(assert (=> d!14634 m!74669))

(assert (=> d!14634 m!71947))

(declare-fun m!74671 () Bool)

(assert (=> d!14634 m!74671))

(assert (=> b!48071 m!71775))

(declare-fun m!74673 () Bool)

(assert (=> b!48071 m!74673))

(declare-fun m!74675 () Bool)

(assert (=> b!48071 m!74675))

(assert (=> bm!562 d!14634))

(declare-fun d!14636 () Bool)

(assert (=> d!14636 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72322)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))))))))

(assert (=> d!13676 d!14636))

(declare-fun d!14638 () Bool)

(declare-fun res!40403 () Bool)

(declare-fun e!31845 () Bool)

(assert (=> d!14638 (=> res!40403 e!31845)))

(assert (=> d!14638 (= res!40403 (= (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!14638 (= (checkByteArrayBitContent!0 (_2!2357 lt!72328) srcBuffer!2 (_1!2363 (readBits!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) e!31845)))

(declare-fun b!48078 () Bool)

(declare-fun e!31846 () Bool)

(assert (=> b!48078 (= e!31845 e!31846)))

(declare-fun res!40404 () Bool)

(assert (=> b!48078 (=> (not res!40404) (not e!31846))))

(assert (=> b!48078 (= res!40404 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!1557 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!1557 (_1!2363 (readBits!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!48079 () Bool)

(assert (=> b!48079 (= e!31846 (checkByteArrayBitContent!0 (_2!2357 lt!72328) srcBuffer!2 (_1!2363 (readBits!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!14638 (not res!40403)) b!48078))

(assert (= (and b!48078 res!40404) b!48079))

(assert (=> b!48078 m!72023))

(assert (=> b!48078 m!74213))

(declare-fun m!74677 () Bool)

(assert (=> b!48078 m!74677))

(declare-fun m!74679 () Bool)

(assert (=> b!48078 m!74679))

(declare-fun m!74681 () Bool)

(assert (=> b!48079 m!74681))

(assert (=> b!46927 d!14638))

(declare-fun d!14640 () Bool)

(declare-fun e!31847 () Bool)

(assert (=> d!14640 e!31847))

(declare-fun res!40409 () Bool)

(assert (=> d!14640 (=> (not res!40409) (not e!31847))))

(declare-fun lt!74450 () tuple2!4540)

(assert (=> d!14640 (= res!40409 (= (buf!1386 (_2!2363 lt!74450)) (buf!1386 (_1!2358 call!565))))))

(declare-fun lt!74442 () tuple3!176)

(assert (=> d!14640 (= lt!74450 (tuple2!4541 (_3!98 lt!74442) (_2!2378 lt!74442)))))

(assert (=> d!14640 (= lt!74442 (readBitsLoop!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) (array!2296 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!14640 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bvsle (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!14640 (= (readBits!0 (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) lt!74450)))

(declare-fun b!48080 () Bool)

(declare-fun res!40407 () Bool)

(assert (=> b!48080 (=> (not res!40407) (not e!31847))))

(declare-fun lt!74449 () (_ BitVec 64))

(assert (=> b!48080 (= res!40407 (= (size!1037 (_1!2363 lt!74450)) ((_ extract 31 0) lt!74449)))))

(assert (=> b!48080 (and (bvslt lt!74449 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!74449 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!74448 () (_ BitVec 64))

(declare-fun lt!74447 () (_ BitVec 64))

(assert (=> b!48080 (= lt!74449 (bvsdiv lt!74448 lt!74447))))

(assert (=> b!48080 (and (not (= lt!74447 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!74448 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!74447 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!48080 (= lt!74447 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!74445 () (_ BitVec 64))

(declare-fun lt!74443 () (_ BitVec 64))

(assert (=> b!48080 (= lt!74448 (bvsub lt!74445 lt!74443))))

(assert (=> b!48080 (or (= (bvand lt!74445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74443 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74445 lt!74443) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48080 (= lt!74443 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!74444 () (_ BitVec 64))

(assert (=> b!48080 (= lt!74445 (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74444))))

(assert (=> b!48080 (or (not (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74444 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) lt!74444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48080 (= lt!74444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!48081 () Bool)

(assert (=> b!48081 (= e!31847 (= (byteArrayBitContentToList!0 (_2!2363 lt!74450) (_1!2363 lt!74450) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitStreamReadBitsIntoList!0 (_2!2363 lt!74450) (_1!2358 call!565) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(declare-fun b!48082 () Bool)

(declare-fun res!40405 () Bool)

(assert (=> b!48082 (=> (not res!40405) (not e!31847))))

(assert (=> b!48082 (= res!40405 (invariant!0 (currentBit!2886 (_2!2363 lt!74450)) (currentByte!2891 (_2!2363 lt!74450)) (size!1037 (buf!1386 (_2!2363 lt!74450)))))))

(declare-fun b!48083 () Bool)

(declare-fun res!40408 () Bool)

(assert (=> b!48083 (=> (not res!40408) (not e!31847))))

(assert (=> b!48083 (= res!40408 (bvsle (currentByte!2891 (_1!2358 call!565)) (currentByte!2891 (_2!2363 lt!74450))))))

(declare-fun b!48084 () Bool)

(declare-fun res!40406 () Bool)

(assert (=> b!48084 (=> (not res!40406) (not e!31847))))

(declare-fun lt!74446 () (_ BitVec 64))

(assert (=> b!48084 (= res!40406 (= (bvadd lt!74446 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (bitIndex!0 (size!1037 (buf!1386 (_2!2363 lt!74450))) (currentByte!2891 (_2!2363 lt!74450)) (currentBit!2886 (_2!2363 lt!74450)))))))

(assert (=> b!48084 (or (not (= (bvand lt!74446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74446 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74446 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!48084 (= lt!74446 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 call!565))) (currentByte!2891 (_1!2358 call!565)) (currentBit!2886 (_1!2358 call!565))))))

(assert (= (and d!14640 res!40409) b!48084))

(assert (= (and b!48084 res!40406) b!48082))

(assert (= (and b!48082 res!40405) b!48080))

(assert (= (and b!48080 res!40407) b!48083))

(assert (= (and b!48083 res!40408) b!48081))

(declare-fun m!74683 () Bool)

(assert (=> d!14640 m!74683))

(declare-fun m!74685 () Bool)

(assert (=> b!48081 m!74685))

(declare-fun m!74687 () Bool)

(assert (=> b!48081 m!74687))

(declare-fun m!74689 () Bool)

(assert (=> b!48082 m!74689))

(declare-fun m!74691 () Bool)

(assert (=> b!48084 m!74691))

(declare-fun m!74693 () Bool)

(assert (=> b!48084 m!74693))

(assert (=> b!46927 d!14640))

(declare-fun d!14642 () Bool)

(declare-fun e!31848 () Bool)

(assert (=> d!14642 e!31848))

(declare-fun res!40410 () Bool)

(assert (=> d!14642 (=> (not res!40410) (not e!31848))))

(declare-fun lt!74451 () (_ BitVec 64))

(declare-fun lt!74453 () (_ BitVec 64))

(declare-fun lt!74454 () (_ BitVec 64))

(assert (=> d!14642 (= res!40410 (= lt!74451 (bvsub lt!74453 lt!74454)))))

(assert (=> d!14642 (or (= (bvand lt!74453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74454 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74453 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74453 lt!74454) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14642 (= lt!74454 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72710)))) ((_ sign_extend 32) (currentByte!2891 (_1!2364 lt!72710))) ((_ sign_extend 32) (currentBit!2886 (_1!2364 lt!72710)))))))

(declare-fun lt!74456 () (_ BitVec 64))

(declare-fun lt!74455 () (_ BitVec 64))

(assert (=> d!14642 (= lt!74453 (bvmul lt!74456 lt!74455))))

(assert (=> d!14642 (or (= lt!74456 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74455 (bvsdiv (bvmul lt!74456 lt!74455) lt!74456)))))

(assert (=> d!14642 (= lt!74455 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14642 (= lt!74456 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72710)))))))

(assert (=> d!14642 (= lt!74451 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_1!2364 lt!72710))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_1!2364 lt!72710)))))))

(assert (=> d!14642 (invariant!0 (currentBit!2886 (_1!2364 lt!72710)) (currentByte!2891 (_1!2364 lt!72710)) (size!1037 (buf!1386 (_1!2364 lt!72710))))))

(assert (=> d!14642 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!72710))) (currentByte!2891 (_1!2364 lt!72710)) (currentBit!2886 (_1!2364 lt!72710))) lt!74451)))

(declare-fun b!48085 () Bool)

(declare-fun res!40411 () Bool)

(assert (=> b!48085 (=> (not res!40411) (not e!31848))))

(assert (=> b!48085 (= res!40411 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74451))))

(declare-fun b!48086 () Bool)

(declare-fun lt!74452 () (_ BitVec 64))

(assert (=> b!48086 (= e!31848 (bvsle lt!74451 (bvmul lt!74452 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48086 (or (= lt!74452 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74452 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74452)))))

(assert (=> b!48086 (= lt!74452 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72710)))))))

(assert (= (and d!14642 res!40410) b!48085))

(assert (= (and b!48085 res!40411) b!48086))

(declare-fun m!74695 () Bool)

(assert (=> d!14642 m!74695))

(declare-fun m!74697 () Bool)

(assert (=> d!14642 m!74697))

(assert (=> b!46970 d!14642))

(assert (=> b!46970 d!14488))

(assert (=> d!13682 d!14494))

(declare-fun d!14644 () Bool)

(assert (=> d!14644 (isPrefixOf!0 lt!72457 (_2!2357 lt!72322))))

(declare-fun lt!74457 () Unit!3311)

(assert (=> d!14644 (= lt!74457 (choose!30 lt!72457 (_2!2357 lt!72322) (_2!2357 lt!72322)))))

(assert (=> d!14644 (isPrefixOf!0 lt!72457 (_2!2357 lt!72322))))

(assert (=> d!14644 (= (lemmaIsPrefixTransitive!0 lt!72457 (_2!2357 lt!72322) (_2!2357 lt!72322)) lt!74457)))

(declare-fun bs!3765 () Bool)

(assert (= bs!3765 d!14644))

(assert (=> bs!3765 m!71945))

(declare-fun m!74699 () Bool)

(assert (=> bs!3765 m!74699))

(assert (=> bs!3765 m!71945))

(assert (=> d!13682 d!14644))

(declare-fun d!14646 () Bool)

(assert (=> d!14646 (isPrefixOf!0 lt!72457 lt!72457)))

(declare-fun lt!74458 () Unit!3311)

(assert (=> d!14646 (= lt!74458 (choose!11 lt!72457))))

(assert (=> d!14646 (= (lemmaIsPrefixRefl!0 lt!72457) lt!74458)))

(declare-fun bs!3766 () Bool)

(assert (= bs!3766 d!14646))

(assert (=> bs!3766 m!71935))

(declare-fun m!74701 () Bool)

(assert (=> bs!3766 m!74701))

(assert (=> d!13682 d!14646))

(declare-fun d!14648 () Bool)

(assert (=> d!14648 (isPrefixOf!0 lt!72457 (_2!2357 lt!72322))))

(declare-fun lt!74459 () Unit!3311)

(assert (=> d!14648 (= lt!74459 (choose!30 lt!72457 (_2!2357 lt!72328) (_2!2357 lt!72322)))))

(assert (=> d!14648 (isPrefixOf!0 lt!72457 (_2!2357 lt!72328))))

(assert (=> d!14648 (= (lemmaIsPrefixTransitive!0 lt!72457 (_2!2357 lt!72328) (_2!2357 lt!72322)) lt!74459)))

(declare-fun bs!3767 () Bool)

(assert (= bs!3767 d!14648))

(assert (=> bs!3767 m!71945))

(declare-fun m!74703 () Bool)

(assert (=> bs!3767 m!74703))

(declare-fun m!74705 () Bool)

(assert (=> bs!3767 m!74705))

(assert (=> d!13682 d!14648))

(declare-fun d!14650 () Bool)

(declare-fun res!40412 () Bool)

(declare-fun e!31850 () Bool)

(assert (=> d!14650 (=> (not res!40412) (not e!31850))))

(assert (=> d!14650 (= res!40412 (= (size!1037 (buf!1386 lt!72457)) (size!1037 (buf!1386 lt!72457))))))

(assert (=> d!14650 (= (isPrefixOf!0 lt!72457 lt!72457) e!31850)))

(declare-fun b!48087 () Bool)

(declare-fun res!40414 () Bool)

(assert (=> b!48087 (=> (not res!40414) (not e!31850))))

(assert (=> b!48087 (= res!40414 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72457)) (currentByte!2891 lt!72457) (currentBit!2886 lt!72457)) (bitIndex!0 (size!1037 (buf!1386 lt!72457)) (currentByte!2891 lt!72457) (currentBit!2886 lt!72457))))))

(declare-fun b!48088 () Bool)

(declare-fun e!31849 () Bool)

(assert (=> b!48088 (= e!31850 e!31849)))

(declare-fun res!40413 () Bool)

(assert (=> b!48088 (=> res!40413 e!31849)))

(assert (=> b!48088 (= res!40413 (= (size!1037 (buf!1386 lt!72457)) #b00000000000000000000000000000000))))

(declare-fun b!48089 () Bool)

(assert (=> b!48089 (= e!31849 (arrayBitRangesEq!0 (buf!1386 lt!72457) (buf!1386 lt!72457) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72457)) (currentByte!2891 lt!72457) (currentBit!2886 lt!72457))))))

(assert (= (and d!14650 res!40412) b!48087))

(assert (= (and b!48087 res!40414) b!48088))

(assert (= (and b!48088 (not res!40413)) b!48089))

(declare-fun m!74707 () Bool)

(assert (=> b!48087 m!74707))

(assert (=> b!48087 m!74707))

(assert (=> b!48089 m!74707))

(assert (=> b!48089 m!74707))

(declare-fun m!74709 () Bool)

(assert (=> b!48089 m!74709))

(assert (=> d!13682 d!14650))

(assert (=> d!13682 d!14556))

(declare-fun d!14652 () Bool)

(declare-fun res!40415 () Bool)

(declare-fun e!31852 () Bool)

(assert (=> d!14652 (=> (not res!40415) (not e!31852))))

(assert (=> d!14652 (= res!40415 (= (size!1037 (buf!1386 (_1!2358 lt!72451))) (size!1037 (buf!1386 (_2!2358 lt!72451)))))))

(assert (=> d!14652 (= (isPrefixOf!0 (_1!2358 lt!72451) (_2!2358 lt!72451)) e!31852)))

(declare-fun b!48090 () Bool)

(declare-fun res!40417 () Bool)

(assert (=> b!48090 (=> (not res!40417) (not e!31852))))

(assert (=> b!48090 (= res!40417 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72451))) (currentByte!2891 (_1!2358 lt!72451)) (currentBit!2886 (_1!2358 lt!72451))) (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72451))) (currentByte!2891 (_2!2358 lt!72451)) (currentBit!2886 (_2!2358 lt!72451)))))))

(declare-fun b!48091 () Bool)

(declare-fun e!31851 () Bool)

(assert (=> b!48091 (= e!31852 e!31851)))

(declare-fun res!40416 () Bool)

(assert (=> b!48091 (=> res!40416 e!31851)))

(assert (=> b!48091 (= res!40416 (= (size!1037 (buf!1386 (_1!2358 lt!72451))) #b00000000000000000000000000000000))))

(declare-fun b!48092 () Bool)

(assert (=> b!48092 (= e!31851 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72451)) (buf!1386 (_2!2358 lt!72451)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72451))) (currentByte!2891 (_1!2358 lt!72451)) (currentBit!2886 (_1!2358 lt!72451)))))))

(assert (= (and d!14652 res!40415) b!48090))

(assert (= (and b!48090 res!40417) b!48091))

(assert (= (and b!48091 (not res!40416)) b!48092))

(assert (=> b!48090 m!74353))

(assert (=> b!48090 m!74133))

(assert (=> b!48092 m!74353))

(assert (=> b!48092 m!74353))

(declare-fun m!74711 () Bool)

(assert (=> b!48092 m!74711))

(assert (=> d!13682 d!14652))

(assert (=> d!13682 d!13714))

(assert (=> d!13682 d!14562))

(declare-fun d!14654 () Bool)

(declare-fun res!40418 () Bool)

(declare-fun e!31854 () Bool)

(assert (=> d!14654 (=> (not res!40418) (not e!31854))))

(assert (=> d!14654 (= res!40418 (= (size!1037 (buf!1386 lt!72457)) (size!1037 (buf!1386 (_2!2357 lt!72322)))))))

(assert (=> d!14654 (= (isPrefixOf!0 lt!72457 (_2!2357 lt!72322)) e!31854)))

(declare-fun b!48093 () Bool)

(declare-fun res!40420 () Bool)

(assert (=> b!48093 (=> (not res!40420) (not e!31854))))

(assert (=> b!48093 (= res!40420 (bvsle (bitIndex!0 (size!1037 (buf!1386 lt!72457)) (currentByte!2891 lt!72457) (currentBit!2886 lt!72457)) (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72322))) (currentByte!2891 (_2!2357 lt!72322)) (currentBit!2886 (_2!2357 lt!72322)))))))

(declare-fun b!48094 () Bool)

(declare-fun e!31853 () Bool)

(assert (=> b!48094 (= e!31854 e!31853)))

(declare-fun res!40419 () Bool)

(assert (=> b!48094 (=> res!40419 e!31853)))

(assert (=> b!48094 (= res!40419 (= (size!1037 (buf!1386 lt!72457)) #b00000000000000000000000000000000))))

(declare-fun b!48095 () Bool)

(assert (=> b!48095 (= e!31853 (arrayBitRangesEq!0 (buf!1386 lt!72457) (buf!1386 (_2!2357 lt!72322)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 lt!72457)) (currentByte!2891 lt!72457) (currentBit!2886 lt!72457))))))

(assert (= (and d!14654 res!40418) b!48093))

(assert (= (and b!48093 res!40420) b!48094))

(assert (= (and b!48094 (not res!40419)) b!48095))

(assert (=> b!48093 m!74707))

(assert (=> b!48093 m!71751))

(assert (=> b!48095 m!74707))

(assert (=> b!48095 m!74707))

(declare-fun m!74713 () Bool)

(assert (=> b!48095 m!74713))

(assert (=> d!13682 d!14654))

(assert (=> d!13682 d!14496))

(declare-fun d!14656 () Bool)

(declare-fun e!31855 () Bool)

(assert (=> d!14656 e!31855))

(declare-fun res!40421 () Bool)

(assert (=> d!14656 (=> (not res!40421) (not e!31855))))

(declare-fun lt!74460 () (_ BitVec 64))

(declare-fun lt!74463 () (_ BitVec 64))

(declare-fun lt!74462 () (_ BitVec 64))

(assert (=> d!14656 (= res!40421 (= lt!74460 (bvsub lt!74462 lt!74463)))))

(assert (=> d!14656 (or (= (bvand lt!74462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74463 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74462 lt!74463) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14656 (= lt!74463 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72708)))) ((_ sign_extend 32) (currentByte!2891 (_1!2364 lt!72708))) ((_ sign_extend 32) (currentBit!2886 (_1!2364 lt!72708)))))))

(declare-fun lt!74465 () (_ BitVec 64))

(declare-fun lt!74464 () (_ BitVec 64))

(assert (=> d!14656 (= lt!74462 (bvmul lt!74465 lt!74464))))

(assert (=> d!14656 (or (= lt!74465 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74464 (bvsdiv (bvmul lt!74465 lt!74464) lt!74465)))))

(assert (=> d!14656 (= lt!74464 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14656 (= lt!74465 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72708)))))))

(assert (=> d!14656 (= lt!74460 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_1!2364 lt!72708))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_1!2364 lt!72708)))))))

(assert (=> d!14656 (invariant!0 (currentBit!2886 (_1!2364 lt!72708)) (currentByte!2891 (_1!2364 lt!72708)) (size!1037 (buf!1386 (_1!2364 lt!72708))))))

(assert (=> d!14656 (= (bitIndex!0 (size!1037 (buf!1386 (_1!2364 lt!72708))) (currentByte!2891 (_1!2364 lt!72708)) (currentBit!2886 (_1!2364 lt!72708))) lt!74460)))

(declare-fun b!48096 () Bool)

(declare-fun res!40422 () Bool)

(assert (=> b!48096 (=> (not res!40422) (not e!31855))))

(assert (=> b!48096 (= res!40422 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74460))))

(declare-fun b!48097 () Bool)

(declare-fun lt!74461 () (_ BitVec 64))

(assert (=> b!48097 (= e!31855 (bvsle lt!74460 (bvmul lt!74461 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48097 (or (= lt!74461 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74461 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74461)))))

(assert (=> b!48097 (= lt!74461 ((_ sign_extend 32) (size!1037 (buf!1386 (_1!2364 lt!72708)))))))

(assert (= (and d!14656 res!40421) b!48096))

(assert (= (and b!48096 res!40422) b!48097))

(declare-fun m!74715 () Bool)

(assert (=> d!14656 m!74715))

(declare-fun m!74717 () Bool)

(assert (=> d!14656 m!74717))

(assert (=> b!46968 d!14656))

(declare-fun d!14658 () Bool)

(declare-fun e!31856 () Bool)

(assert (=> d!14658 e!31856))

(declare-fun res!40423 () Bool)

(assert (=> d!14658 (=> (not res!40423) (not e!31856))))

(declare-fun lt!74466 () (_ BitVec 64))

(declare-fun lt!74469 () (_ BitVec 64))

(declare-fun lt!74468 () (_ BitVec 64))

(assert (=> d!14658 (= res!40423 (= lt!74466 (bvsub lt!74468 lt!74469)))))

(assert (=> d!14658 (or (= (bvand lt!74468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!74469 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!74468 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!74468 lt!74469) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14658 (= lt!74469 (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72711)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72711))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72711)))))))

(declare-fun lt!74471 () (_ BitVec 64))

(declare-fun lt!74470 () (_ BitVec 64))

(assert (=> d!14658 (= lt!74468 (bvmul lt!74471 lt!74470))))

(assert (=> d!14658 (or (= lt!74471 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!74470 (bvsdiv (bvmul lt!74471 lt!74470) lt!74471)))))

(assert (=> d!14658 (= lt!74470 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!14658 (= lt!74471 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(assert (=> d!14658 (= lt!74466 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72711))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72711)))))))

(assert (=> d!14658 (invariant!0 (currentBit!2886 (_2!2357 lt!72711)) (currentByte!2891 (_2!2357 lt!72711)) (size!1037 (buf!1386 (_2!2357 lt!72711))))))

(assert (=> d!14658 (= (bitIndex!0 (size!1037 (buf!1386 (_2!2357 lt!72711))) (currentByte!2891 (_2!2357 lt!72711)) (currentBit!2886 (_2!2357 lt!72711))) lt!74466)))

(declare-fun b!48098 () Bool)

(declare-fun res!40424 () Bool)

(assert (=> b!48098 (=> (not res!40424) (not e!31856))))

(assert (=> b!48098 (= res!40424 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!74466))))

(declare-fun b!48099 () Bool)

(declare-fun lt!74467 () (_ BitVec 64))

(assert (=> b!48099 (= e!31856 (bvsle lt!74466 (bvmul lt!74467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!48099 (or (= lt!74467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!74467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!74467)))))

(assert (=> b!48099 (= lt!74467 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72711)))))))

(assert (= (and d!14658 res!40423) b!48098))

(assert (= (and b!48098 res!40424) b!48099))

(declare-fun m!74719 () Bool)

(assert (=> d!14658 m!74719))

(assert (=> d!14658 m!74181))

(assert (=> b!46968 d!14658))

(assert (=> d!13748 d!14632))

(assert (=> d!13748 d!14506))

(declare-fun d!14660 () Bool)

(declare-fun res!40425 () Bool)

(declare-fun e!31858 () Bool)

(assert (=> d!14660 (=> (not res!40425) (not e!31858))))

(assert (=> d!14660 (= res!40425 (= (size!1037 (buf!1386 (_1!2358 lt!72654))) (size!1037 (buf!1386 thiss!1379))))))

(assert (=> d!14660 (= (isPrefixOf!0 (_1!2358 lt!72654) thiss!1379) e!31858)))

(declare-fun b!48100 () Bool)

(declare-fun res!40427 () Bool)

(assert (=> b!48100 (=> (not res!40427) (not e!31858))))

(assert (=> b!48100 (= res!40427 (bvsle (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72654))) (currentByte!2891 (_1!2358 lt!72654)) (currentBit!2886 (_1!2358 lt!72654))) (bitIndex!0 (size!1037 (buf!1386 thiss!1379)) (currentByte!2891 thiss!1379) (currentBit!2886 thiss!1379))))))

(declare-fun b!48101 () Bool)

(declare-fun e!31857 () Bool)

(assert (=> b!48101 (= e!31858 e!31857)))

(declare-fun res!40426 () Bool)

(assert (=> b!48101 (=> res!40426 e!31857)))

(assert (=> b!48101 (= res!40426 (= (size!1037 (buf!1386 (_1!2358 lt!72654))) #b00000000000000000000000000000000))))

(declare-fun b!48102 () Bool)

(assert (=> b!48102 (= e!31857 (arrayBitRangesEq!0 (buf!1386 (_1!2358 lt!72654)) (buf!1386 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1037 (buf!1386 (_1!2358 lt!72654))) (currentByte!2891 (_1!2358 lt!72654)) (currentBit!2886 (_1!2358 lt!72654)))))))

(assert (= (and d!14660 res!40425) b!48100))

(assert (= (and b!48100 res!40427) b!48101))

(assert (= (and b!48101 (not res!40426)) b!48102))

(assert (=> b!48100 m!74323))

(assert (=> b!48100 m!71749))

(assert (=> b!48102 m!74323))

(assert (=> b!48102 m!74323))

(declare-fun m!74721 () Bool)

(assert (=> b!48102 m!74721))

(assert (=> b!46937 d!14660))

(declare-fun d!14662 () Bool)

(assert (=> d!14662 (= (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 thiss!1379)) ((_ sign_extend 32) (currentBit!2886 thiss!1379))) (bvsub (bvmul ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!2891 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2886 thiss!1379)))))))

(assert (=> d!13706 d!14662))

(declare-fun d!14664 () Bool)

(assert (=> d!14664 (= (invariant!0 (currentBit!2886 (_2!2357 lt!72625)) (currentByte!2891 (_2!2357 lt!72625)) (size!1037 (buf!1386 (_2!2357 lt!72625)))) (and (bvsge (currentBit!2886 (_2!2357 lt!72625)) #b00000000000000000000000000000000) (bvslt (currentBit!2886 (_2!2357 lt!72625)) #b00000000000000000000000000001000) (bvsge (currentByte!2891 (_2!2357 lt!72625)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2891 (_2!2357 lt!72625)) (size!1037 (buf!1386 (_2!2357 lt!72625)))) (and (= (currentBit!2886 (_2!2357 lt!72625)) #b00000000000000000000000000000000) (= (currentByte!2891 (_2!2357 lt!72625)) (size!1037 (buf!1386 (_2!2357 lt!72625))))))))))

(assert (=> b!46925 d!14664))

(declare-fun d!14666 () Bool)

(declare-fun e!31859 () Bool)

(assert (=> d!14666 e!31859))

(declare-fun res!40428 () Bool)

(assert (=> d!14666 (=> (not res!40428) (not e!31859))))

(declare-fun lt!74473 () (_ BitVec 64))

(declare-fun lt!74472 () BitStream!1806)

(assert (=> d!14666 (= res!40428 (= (bvadd lt!74473 (bvsub lt!72658 lt!72661)) (bitIndex!0 (size!1037 (buf!1386 lt!74472)) (currentByte!2891 lt!74472) (currentBit!2886 lt!74472))))))

(assert (=> d!14666 (or (not (= (bvand lt!74473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!72658 lt!72661) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!74473 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!74473 (bvsub lt!72658 lt!72661)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!14666 (= lt!74473 (bitIndex!0 (size!1037 (buf!1386 (_2!2358 lt!72654))) (currentByte!2891 (_2!2358 lt!72654)) (currentBit!2886 (_2!2358 lt!72654))))))

(assert (=> d!14666 (= lt!74472 (_2!2357 (moveBitIndex!0 (_2!2358 lt!72654) (bvsub lt!72658 lt!72661))))))

(assert (=> d!14666 (moveBitIndexPrecond!0 (_2!2358 lt!72654) (bvsub lt!72658 lt!72661))))

(assert (=> d!14666 (= (withMovedBitIndex!0 (_2!2358 lt!72654) (bvsub lt!72658 lt!72661)) lt!74472)))

(declare-fun b!48103 () Bool)

(assert (=> b!48103 (= e!31859 (= (size!1037 (buf!1386 (_2!2358 lt!72654))) (size!1037 (buf!1386 lt!74472))))))

(assert (= (and d!14666 res!40428) b!48103))

(declare-fun m!74723 () Bool)

(assert (=> d!14666 m!74723))

(assert (=> d!14666 m!74271))

(declare-fun m!74725 () Bool)

(assert (=> d!14666 m!74725))

(declare-fun m!74727 () Bool)

(assert (=> d!14666 m!74727))

(assert (=> b!46935 d!14666))

(assert (=> b!46935 d!13692))

(assert (=> b!46935 d!13748))

(declare-fun d!14668 () Bool)

(assert (=> d!14668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328))) lt!72616) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1037 (buf!1386 (_2!2357 lt!72328)))) ((_ sign_extend 32) (currentByte!2891 (_2!2357 lt!72328))) ((_ sign_extend 32) (currentBit!2886 (_2!2357 lt!72328)))) lt!72616))))

(declare-fun bs!3768 () Bool)

(assert (= bs!3768 d!14668))

(assert (=> bs!3768 m!71987))

(assert (=> b!46923 d!14668))

(assert (=> b!46966 d!14658))

(assert (=> b!46966 d!13748))

(check-sat (not b!48060) (not b!47973) (not b!48062) (not b!48031) (not b!48053) (not b!48084) (not b!47823) (not b!47995) (not b!47923) (not b!48082) (not b!47974) (not b!47915) (not b!47919) (not bm!592) (not d!14658) (not d!14582) (not b!48025) (not d!14434) (not bm!594) (not b!47950) (not b!47993) (not b!48050) (not b!47895) (not d!14484) (not b!47916) (not d!14496) (not b!48079) (not d!14424) (not b!48035) (not b!48066) (not d!14478) (not b!47981) (not d!14622) (not b!48032) (not b!48018) (not d!14606) (not b!47999) (not d!14488) (not b!47877) (not b!48041) (not b!47991) (not b!47960) (not d!14586) (not b!48089) (not b!47964) (not b!47968) (not d!14530) (not b!48095) (not b!47958) (not b!47980) (not b!48024) (not d!14576) (not d!14548) (not d!14628) (not b!48036) (not b!48015) (not bm!598) (not d!14572) (not b!47929) (not b!47925) (not b!48052) (not b!47976) (not d!14544) (not bm!597) (not b!47865) (not d!14600) (not d!14518) (not b!48072) (not d!14520) (not b!48102) (not b!48011) (not d!14562) (not d!14588) (not b!48007) (not d!14536) (not b!48005) (not b!48047) (not b!48054) (not d!14550) (not b!47894) (not b!47892) (not d!14522) (not b!47985) (not b!47926) (not b!47840) (not b!48069) (not b!47970) (not b!48022) (not b!47839) (not d!14584) (not b!48026) (not b!48039) (not d!14642) (not d!14454) (not b!47998) (not b!47938) (not b!47978) (not b!47859) (not b!48044) (not b!47944) (not b!48087) (not b!47965) (not b!48040) (not b!48058) (not b!48093) (not b!47873) (not b!48070) (not b!48014) (not d!14596) (not b!47937) (not d!14486) (not b!47872) (not d!14640) (not b!48051) (not d!14432) (not b!48030) (not b!47826) (not d!14634) (not d!14452) (not b!47898) (not d!14666) (not d!14560) (not b!48004) (not b!47996) (not bm!591) (not d!14426) (not bm!596) (not b!47953) (not d!14490) (not b!47876) (not b!47945) (not b!48033) (not b!47861) (not b!47903) (not b!48092) (not d!14648) (not d!14532) (not d!14468) (not b!47921) (not d!14656) (not b!48100) (not b!47935) (not d!14472) (not b!47821) (not b!47867) (not b!47879) (not bm!595) (not b!47900) (not b!47971) (not d!14476) (not b!48037) (not b!48027) (not b!47841) (not b!48034) (not b!48071) (not d!14438) (not b!47927) (not b!47918) (not b!47947) (not b!47951) (not b!47824) (not b!47922) (not b!48012) (not d!14474) (not b!47886) (not d!14492) (not b!48090) (not d!14646) (not b!47957) (not d!14612) (not d!14668) (not b!48045) (not b!48057) (not d!14510) (not d!14604) (not d!14630) (not b!47842) (not d!14444) (not b!47868) (not d!14546) (not b!48055) (not b!48020) (not b!48063) (not b!47871) (not b!47897) (not b!48081) (not d!14512) (not b!47844) (not d!14618) (not b!47869) (not b!47948) (not d!14462) (not d!14568) (not b!47967) (not b!48028) (not d!14554) (not b!48043) (not d!14466) (not d!14590) (not b!47940) (not b!47880) (not b!48002) (not bm!593) (not b!48064) (not b!47882) (not b!47987) (not b!48001) (not b!47896) (not d!14498) (not b!47979) (not d!14644) (not b!47928) (not b!47984) (not b!47982) (not d!14614) (not b!48023) (not b!48046))
(check-sat)
