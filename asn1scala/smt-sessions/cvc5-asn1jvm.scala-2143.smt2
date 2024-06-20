; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54624 () Bool)

(assert start!54624)

(declare-fun b!255312 () Bool)

(declare-fun res!213986 () Bool)

(declare-fun e!176874 () Bool)

(assert (=> b!255312 (=> (not res!213986) (not e!176874))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13771 0))(
  ( (array!13772 (arr!7027 (Array (_ BitVec 32) (_ BitVec 8))) (size!6040 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11002 0))(
  ( (BitStream!11003 (buf!6557 array!13771) (currentByte!12036 (_ BitVec 32)) (currentBit!12031 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!11002)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255312 (= res!213986 (validate_offset_bits!1 ((_ sign_extend 32) (size!6040 (buf!6557 thiss!1005))) ((_ sign_extend 32) (currentByte!12036 thiss!1005)) ((_ sign_extend 32) (currentBit!12031 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255313 () Bool)

(declare-fun e!176881 () Bool)

(declare-fun array_inv!5781 (array!13771) Bool)

(assert (=> b!255313 (= e!176881 (array_inv!5781 (buf!6557 thiss!1005)))))

(declare-fun b!255314 () Bool)

(declare-fun e!176872 () Bool)

(assert (=> b!255314 (= e!176872 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!255315 () Bool)

(declare-fun res!213980 () Bool)

(declare-fun e!176877 () Bool)

(assert (=> b!255315 (=> (not res!213980) (not e!176877))))

(declare-datatypes ((Unit!18288 0))(
  ( (Unit!18289) )
))
(declare-datatypes ((tuple2!21828 0))(
  ( (tuple2!21829 (_1!11848 Unit!18288) (_2!11848 BitStream!11002)) )
))
(declare-fun lt!396585 () tuple2!21828)

(declare-fun isPrefixOf!0 (BitStream!11002 BitStream!11002) Bool)

(assert (=> b!255315 (= res!213980 (isPrefixOf!0 thiss!1005 (_2!11848 lt!396585)))))

(declare-fun b!255316 () Bool)

(declare-fun e!176879 () Bool)

(assert (=> b!255316 (= e!176879 e!176872)))

(declare-fun res!213990 () Bool)

(assert (=> b!255316 (=> res!213990 e!176872)))

(declare-fun lt!396581 () tuple2!21828)

(assert (=> b!255316 (= res!213990 (not (= (size!6040 (buf!6557 thiss!1005)) (size!6040 (buf!6557 (_2!11848 lt!396581))))))))

(declare-datatypes ((tuple2!21830 0))(
  ( (tuple2!21831 (_1!11849 BitStream!11002) (_2!11849 Bool)) )
))
(declare-fun lt!396590 () tuple2!21830)

(declare-fun lt!396580 () tuple2!21830)

(declare-datatypes ((tuple2!21832 0))(
  ( (tuple2!21833 (_1!11850 BitStream!11002) (_2!11850 BitStream!11002)) )
))
(declare-fun lt!396592 () tuple2!21832)

(assert (=> b!255316 (and (= (_2!11849 lt!396590) (_2!11849 lt!396580)) (= (_1!11849 lt!396590) (_2!11850 lt!396592)))))

(declare-fun b!255317 () Bool)

(declare-fun res!213985 () Bool)

(assert (=> b!255317 (=> (not res!213985) (not e!176874))))

(assert (=> b!255317 (= res!213985 (bvslt from!289 nBits!297))))

(declare-fun b!255318 () Bool)

(declare-fun res!213977 () Bool)

(assert (=> b!255318 (=> res!213977 e!176872)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255318 (= res!213977 (not (= (bitIndex!0 (size!6040 (buf!6557 (_2!11848 lt!396581))) (currentByte!12036 (_2!11848 lt!396581)) (currentBit!12031 (_2!11848 lt!396581))) (bvadd (bitIndex!0 (size!6040 (buf!6557 thiss!1005)) (currentByte!12036 thiss!1005) (currentBit!12031 thiss!1005)) (bvsub nBits!297 from!289)))))))

(declare-fun b!255319 () Bool)

(declare-fun e!176871 () Bool)

(declare-fun lt!396584 () tuple2!21830)

(declare-fun lt!396587 () tuple2!21830)

(assert (=> b!255319 (= e!176871 (= (_2!11849 lt!396584) (_2!11849 lt!396587)))))

(declare-fun b!255321 () Bool)

(declare-fun e!176882 () Bool)

(assert (=> b!255321 (= e!176882 e!176877)))

(declare-fun res!213982 () Bool)

(assert (=> b!255321 (=> (not res!213982) (not e!176877))))

(declare-fun lt!396591 () (_ BitVec 64))

(declare-fun lt!396594 () (_ BitVec 64))

(assert (=> b!255321 (= res!213982 (= lt!396591 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!396594)))))

(assert (=> b!255321 (= lt!396591 (bitIndex!0 (size!6040 (buf!6557 (_2!11848 lt!396585))) (currentByte!12036 (_2!11848 lt!396585)) (currentBit!12031 (_2!11848 lt!396585))))))

(assert (=> b!255321 (= lt!396594 (bitIndex!0 (size!6040 (buf!6557 thiss!1005)) (currentByte!12036 thiss!1005) (currentBit!12031 thiss!1005)))))

(declare-fun b!255322 () Bool)

(declare-fun res!213992 () Bool)

(assert (=> b!255322 (=> res!213992 e!176879)))

(declare-fun lt!396579 () tuple2!21832)

(declare-fun withMovedBitIndex!0 (BitStream!11002 (_ BitVec 64)) BitStream!11002)

(assert (=> b!255322 (= res!213992 (not (= (_1!11850 lt!396579) (withMovedBitIndex!0 (_1!11850 lt!396592) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!255323 () Bool)

(assert (=> b!255323 (= e!176874 (not e!176879))))

(declare-fun res!213983 () Bool)

(assert (=> b!255323 (=> res!213983 e!176879)))

(assert (=> b!255323 (= res!213983 (not (= (_1!11849 lt!396580) (_2!11850 lt!396579))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!11002 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21830)

(assert (=> b!255323 (= lt!396580 (checkBitsLoopPure!0 (_1!11850 lt!396579) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!396589 () (_ BitVec 64))

(assert (=> b!255323 (validate_offset_bits!1 ((_ sign_extend 32) (size!6040 (buf!6557 (_2!11848 lt!396581)))) ((_ sign_extend 32) (currentByte!12036 (_2!11848 lt!396585))) ((_ sign_extend 32) (currentBit!12031 (_2!11848 lt!396585))) lt!396589)))

(declare-fun lt!396596 () Unit!18288)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11002 array!13771 (_ BitVec 64)) Unit!18288)

(assert (=> b!255323 (= lt!396596 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11848 lt!396585) (buf!6557 (_2!11848 lt!396581)) lt!396589))))

(assert (=> b!255323 (= lt!396590 (checkBitsLoopPure!0 (_1!11850 lt!396592) nBits!297 bit!26 from!289))))

(assert (=> b!255323 (validate_offset_bits!1 ((_ sign_extend 32) (size!6040 (buf!6557 (_2!11848 lt!396581)))) ((_ sign_extend 32) (currentByte!12036 thiss!1005)) ((_ sign_extend 32) (currentBit!12031 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!396586 () Unit!18288)

(assert (=> b!255323 (= lt!396586 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6557 (_2!11848 lt!396581)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!11002) tuple2!21830)

(assert (=> b!255323 (= (_2!11849 (readBitPure!0 (_1!11850 lt!396592))) bit!26)))

(declare-fun reader!0 (BitStream!11002 BitStream!11002) tuple2!21832)

(assert (=> b!255323 (= lt!396579 (reader!0 (_2!11848 lt!396585) (_2!11848 lt!396581)))))

(assert (=> b!255323 (= lt!396592 (reader!0 thiss!1005 (_2!11848 lt!396581)))))

(assert (=> b!255323 e!176871))

(declare-fun res!213978 () Bool)

(assert (=> b!255323 (=> (not res!213978) (not e!176871))))

(assert (=> b!255323 (= res!213978 (= (bitIndex!0 (size!6040 (buf!6557 (_1!11849 lt!396584))) (currentByte!12036 (_1!11849 lt!396584)) (currentBit!12031 (_1!11849 lt!396584))) (bitIndex!0 (size!6040 (buf!6557 (_1!11849 lt!396587))) (currentByte!12036 (_1!11849 lt!396587)) (currentBit!12031 (_1!11849 lt!396587)))))))

(declare-fun lt!396576 () Unit!18288)

(declare-fun lt!396582 () BitStream!11002)

(declare-fun readBitPrefixLemma!0 (BitStream!11002 BitStream!11002) Unit!18288)

(assert (=> b!255323 (= lt!396576 (readBitPrefixLemma!0 lt!396582 (_2!11848 lt!396581)))))

(assert (=> b!255323 (= lt!396587 (readBitPure!0 (BitStream!11003 (buf!6557 (_2!11848 lt!396581)) (currentByte!12036 thiss!1005) (currentBit!12031 thiss!1005))))))

(assert (=> b!255323 (= lt!396584 (readBitPure!0 lt!396582))))

(assert (=> b!255323 (= lt!396582 (BitStream!11003 (buf!6557 (_2!11848 lt!396585)) (currentByte!12036 thiss!1005) (currentBit!12031 thiss!1005)))))

(declare-fun e!176873 () Bool)

(assert (=> b!255323 e!176873))

(declare-fun res!213987 () Bool)

(assert (=> b!255323 (=> (not res!213987) (not e!176873))))

(assert (=> b!255323 (= res!213987 (isPrefixOf!0 thiss!1005 (_2!11848 lt!396581)))))

(declare-fun lt!396588 () Unit!18288)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11002 BitStream!11002 BitStream!11002) Unit!18288)

(assert (=> b!255323 (= lt!396588 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11848 lt!396585) (_2!11848 lt!396581)))))

(declare-fun e!176880 () Bool)

(assert (=> b!255323 e!176880))

(declare-fun res!213988 () Bool)

(assert (=> b!255323 (=> (not res!213988) (not e!176880))))

(assert (=> b!255323 (= res!213988 (= (size!6040 (buf!6557 (_2!11848 lt!396585))) (size!6040 (buf!6557 (_2!11848 lt!396581)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11002 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21828)

(assert (=> b!255323 (= lt!396581 (appendNBitsLoop!0 (_2!11848 lt!396585) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255323 (validate_offset_bits!1 ((_ sign_extend 32) (size!6040 (buf!6557 (_2!11848 lt!396585)))) ((_ sign_extend 32) (currentByte!12036 (_2!11848 lt!396585))) ((_ sign_extend 32) (currentBit!12031 (_2!11848 lt!396585))) lt!396589)))

(assert (=> b!255323 (= lt!396589 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!396597 () Unit!18288)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11002 BitStream!11002 (_ BitVec 64) (_ BitVec 64)) Unit!18288)

(assert (=> b!255323 (= lt!396597 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11848 lt!396585) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255323 e!176882))

(declare-fun res!213979 () Bool)

(assert (=> b!255323 (=> (not res!213979) (not e!176882))))

(assert (=> b!255323 (= res!213979 (= (size!6040 (buf!6557 thiss!1005)) (size!6040 (buf!6557 (_2!11848 lt!396585)))))))

(declare-fun appendBit!0 (BitStream!11002 Bool) tuple2!21828)

(assert (=> b!255323 (= lt!396585 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255324 () Bool)

(declare-fun res!213993 () Bool)

(assert (=> b!255324 (=> (not res!213993) (not e!176873))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255324 (= res!213993 (invariant!0 (currentBit!12031 thiss!1005) (currentByte!12036 thiss!1005) (size!6040 (buf!6557 (_2!11848 lt!396585)))))))

(declare-fun b!255325 () Bool)

(declare-fun res!213989 () Bool)

(declare-fun e!176876 () Bool)

(assert (=> b!255325 (=> (not res!213989) (not e!176876))))

(assert (=> b!255325 (= res!213989 (isPrefixOf!0 (_2!11848 lt!396585) (_2!11848 lt!396581)))))

(declare-fun b!255326 () Bool)

(declare-fun e!176878 () Bool)

(assert (=> b!255326 (= e!176877 e!176878)))

(declare-fun res!213981 () Bool)

(assert (=> b!255326 (=> (not res!213981) (not e!176878))))

(declare-fun lt!396593 () tuple2!21830)

(assert (=> b!255326 (= res!213981 (and (= (_2!11849 lt!396593) bit!26) (= (_1!11849 lt!396593) (_2!11848 lt!396585))))))

(declare-fun readerFrom!0 (BitStream!11002 (_ BitVec 32) (_ BitVec 32)) BitStream!11002)

(assert (=> b!255326 (= lt!396593 (readBitPure!0 (readerFrom!0 (_2!11848 lt!396585) (currentBit!12031 thiss!1005) (currentByte!12036 thiss!1005))))))

(declare-fun b!255327 () Bool)

(assert (=> b!255327 (= e!176880 e!176876)))

(declare-fun res!213991 () Bool)

(assert (=> b!255327 (=> (not res!213991) (not e!176876))))

(declare-fun lt!396595 () (_ BitVec 64))

(assert (=> b!255327 (= res!213991 (= (bitIndex!0 (size!6040 (buf!6557 (_2!11848 lt!396581))) (currentByte!12036 (_2!11848 lt!396581)) (currentBit!12031 (_2!11848 lt!396581))) (bvadd (bitIndex!0 (size!6040 (buf!6557 (_2!11848 lt!396585))) (currentByte!12036 (_2!11848 lt!396585)) (currentBit!12031 (_2!11848 lt!396585))) lt!396595)))))

(assert (=> b!255327 (= lt!396595 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!213984 () Bool)

(assert (=> start!54624 (=> (not res!213984) (not e!176874))))

(assert (=> start!54624 (= res!213984 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54624 e!176874))

(assert (=> start!54624 true))

(declare-fun inv!12 (BitStream!11002) Bool)

(assert (=> start!54624 (and (inv!12 thiss!1005) e!176881)))

(declare-fun b!255320 () Bool)

(assert (=> b!255320 (= e!176873 (invariant!0 (currentBit!12031 thiss!1005) (currentByte!12036 thiss!1005) (size!6040 (buf!6557 (_2!11848 lt!396581)))))))

(declare-fun b!255328 () Bool)

(declare-fun lt!396578 () tuple2!21830)

(declare-fun lt!396583 () tuple2!21832)

(assert (=> b!255328 (= e!176876 (not (or (not (_2!11849 lt!396578)) (not (= (_1!11849 lt!396578) (_2!11850 lt!396583))))))))

(assert (=> b!255328 (= lt!396578 (checkBitsLoopPure!0 (_1!11850 lt!396583) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255328 (validate_offset_bits!1 ((_ sign_extend 32) (size!6040 (buf!6557 (_2!11848 lt!396581)))) ((_ sign_extend 32) (currentByte!12036 (_2!11848 lt!396585))) ((_ sign_extend 32) (currentBit!12031 (_2!11848 lt!396585))) lt!396595)))

(declare-fun lt!396577 () Unit!18288)

(assert (=> b!255328 (= lt!396577 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11848 lt!396585) (buf!6557 (_2!11848 lt!396581)) lt!396595))))

(assert (=> b!255328 (= lt!396583 (reader!0 (_2!11848 lt!396585) (_2!11848 lt!396581)))))

(declare-fun b!255329 () Bool)

(assert (=> b!255329 (= e!176878 (= (bitIndex!0 (size!6040 (buf!6557 (_1!11849 lt!396593))) (currentByte!12036 (_1!11849 lt!396593)) (currentBit!12031 (_1!11849 lt!396593))) lt!396591))))

(assert (= (and start!54624 res!213984) b!255312))

(assert (= (and b!255312 res!213986) b!255317))

(assert (= (and b!255317 res!213985) b!255323))

(assert (= (and b!255323 res!213979) b!255321))

(assert (= (and b!255321 res!213982) b!255315))

(assert (= (and b!255315 res!213980) b!255326))

(assert (= (and b!255326 res!213981) b!255329))

(assert (= (and b!255323 res!213988) b!255327))

(assert (= (and b!255327 res!213991) b!255325))

(assert (= (and b!255325 res!213989) b!255328))

(assert (= (and b!255323 res!213987) b!255324))

(assert (= (and b!255324 res!213993) b!255320))

(assert (= (and b!255323 res!213978) b!255319))

(assert (= (and b!255323 (not res!213983)) b!255322))

(assert (= (and b!255322 (not res!213992)) b!255316))

(assert (= (and b!255316 (not res!213990)) b!255318))

(assert (= (and b!255318 (not res!213977)) b!255314))

(assert (= start!54624 b!255313))

(declare-fun m!384615 () Bool)

(assert (=> b!255320 m!384615))

(declare-fun m!384617 () Bool)

(assert (=> b!255313 m!384617))

(declare-fun m!384619 () Bool)

(assert (=> b!255327 m!384619))

(declare-fun m!384621 () Bool)

(assert (=> b!255327 m!384621))

(declare-fun m!384623 () Bool)

(assert (=> b!255325 m!384623))

(declare-fun m!384625 () Bool)

(assert (=> b!255326 m!384625))

(assert (=> b!255326 m!384625))

(declare-fun m!384627 () Bool)

(assert (=> b!255326 m!384627))

(assert (=> b!255321 m!384621))

(declare-fun m!384629 () Bool)

(assert (=> b!255321 m!384629))

(declare-fun m!384631 () Bool)

(assert (=> b!255315 m!384631))

(assert (=> b!255318 m!384619))

(assert (=> b!255318 m!384629))

(declare-fun m!384633 () Bool)

(assert (=> b!255312 m!384633))

(declare-fun m!384635 () Bool)

(assert (=> b!255329 m!384635))

(declare-fun m!384637 () Bool)

(assert (=> b!255322 m!384637))

(declare-fun m!384639 () Bool)

(assert (=> start!54624 m!384639))

(declare-fun m!384641 () Bool)

(assert (=> b!255323 m!384641))

(declare-fun m!384643 () Bool)

(assert (=> b!255323 m!384643))

(declare-fun m!384645 () Bool)

(assert (=> b!255323 m!384645))

(declare-fun m!384647 () Bool)

(assert (=> b!255323 m!384647))

(declare-fun m!384649 () Bool)

(assert (=> b!255323 m!384649))

(declare-fun m!384651 () Bool)

(assert (=> b!255323 m!384651))

(declare-fun m!384653 () Bool)

(assert (=> b!255323 m!384653))

(declare-fun m!384655 () Bool)

(assert (=> b!255323 m!384655))

(declare-fun m!384657 () Bool)

(assert (=> b!255323 m!384657))

(declare-fun m!384659 () Bool)

(assert (=> b!255323 m!384659))

(declare-fun m!384661 () Bool)

(assert (=> b!255323 m!384661))

(declare-fun m!384663 () Bool)

(assert (=> b!255323 m!384663))

(declare-fun m!384665 () Bool)

(assert (=> b!255323 m!384665))

(declare-fun m!384667 () Bool)

(assert (=> b!255323 m!384667))

(declare-fun m!384669 () Bool)

(assert (=> b!255323 m!384669))

(declare-fun m!384671 () Bool)

(assert (=> b!255323 m!384671))

(declare-fun m!384673 () Bool)

(assert (=> b!255323 m!384673))

(declare-fun m!384675 () Bool)

(assert (=> b!255323 m!384675))

(declare-fun m!384677 () Bool)

(assert (=> b!255323 m!384677))

(declare-fun m!384679 () Bool)

(assert (=> b!255323 m!384679))

(declare-fun m!384681 () Bool)

(assert (=> b!255324 m!384681))

(declare-fun m!384683 () Bool)

(assert (=> b!255328 m!384683))

(declare-fun m!384685 () Bool)

(assert (=> b!255328 m!384685))

(declare-fun m!384687 () Bool)

(assert (=> b!255328 m!384687))

(assert (=> b!255328 m!384643))

(push 1)

(assert (not b!255326))

(assert (not b!255327))

(assert (not b!255312))

(assert (not b!255328))

(assert (not b!255323))

(assert (not b!255324))

(assert (not b!255325))

(assert (not start!54624))

(assert (not b!255321))

(assert (not b!255329))

(assert (not b!255315))

(assert (not b!255313))

(assert (not b!255320))

(assert (not b!255318))

(assert (not b!255322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

