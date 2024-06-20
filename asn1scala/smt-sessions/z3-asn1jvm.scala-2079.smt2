; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52636 () Bool)

(assert start!52636)

(declare-fun b!243485 () Bool)

(declare-fun e!168785 () Bool)

(declare-datatypes ((array!13348 0))(
  ( (array!13349 (arr!6839 (Array (_ BitVec 32) (_ BitVec 8))) (size!5852 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10626 0))(
  ( (BitStream!10627 (buf!6321 array!13348) (currentByte!11693 (_ BitVec 32)) (currentBit!11688 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10626)

(declare-fun array_inv!5593 (array!13348) Bool)

(assert (=> b!243485 (= e!168785 (array_inv!5593 (buf!6321 thiss!1005)))))

(declare-fun b!243486 () Bool)

(declare-fun e!168791 () Bool)

(declare-fun e!168789 () Bool)

(assert (=> b!243486 (= e!168791 e!168789)))

(declare-fun res!203431 () Bool)

(assert (=> b!243486 (=> (not res!203431) (not e!168789))))

(declare-fun lt!379412 () (_ BitVec 64))

(declare-datatypes ((Unit!17793 0))(
  ( (Unit!17794) )
))
(declare-datatypes ((tuple2!20868 0))(
  ( (tuple2!20869 (_1!11356 Unit!17793) (_2!11356 BitStream!10626)) )
))
(declare-fun lt!379408 () tuple2!20868)

(declare-fun lt!379407 () tuple2!20868)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243486 (= res!203431 (= (bitIndex!0 (size!5852 (buf!6321 (_2!11356 lt!379407))) (currentByte!11693 (_2!11356 lt!379407)) (currentBit!11688 (_2!11356 lt!379407))) (bvadd (bitIndex!0 (size!5852 (buf!6321 (_2!11356 lt!379408))) (currentByte!11693 (_2!11356 lt!379408)) (currentBit!11688 (_2!11356 lt!379408))) lt!379412)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!243486 (= lt!379412 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243487 () Bool)

(declare-fun e!168782 () Bool)

(assert (=> b!243487 (= e!168782 (not true))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243487 (validate_offset_bits!1 ((_ sign_extend 32) (size!5852 (buf!6321 (_2!11356 lt!379407)))) ((_ sign_extend 32) (currentByte!11693 thiss!1005)) ((_ sign_extend 32) (currentBit!11688 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!379419 () Unit!17793)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10626 array!13348 (_ BitVec 64)) Unit!17793)

(assert (=> b!243487 (= lt!379419 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6321 (_2!11356 lt!379407)) (bvsub nBits!297 from!289)))))

(declare-datatypes ((tuple2!20870 0))(
  ( (tuple2!20871 (_1!11357 BitStream!10626) (_2!11357 BitStream!10626)) )
))
(declare-fun lt!379406 () tuple2!20870)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20872 0))(
  ( (tuple2!20873 (_1!11358 BitStream!10626) (_2!11358 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!10626) tuple2!20872)

(assert (=> b!243487 (= (_2!11358 (readBitPure!0 (_1!11357 lt!379406))) bit!26)))

(declare-fun lt!379418 () tuple2!20870)

(declare-fun reader!0 (BitStream!10626 BitStream!10626) tuple2!20870)

(assert (=> b!243487 (= lt!379418 (reader!0 (_2!11356 lt!379408) (_2!11356 lt!379407)))))

(assert (=> b!243487 (= lt!379406 (reader!0 thiss!1005 (_2!11356 lt!379407)))))

(declare-fun e!168787 () Bool)

(assert (=> b!243487 e!168787))

(declare-fun res!203432 () Bool)

(assert (=> b!243487 (=> (not res!203432) (not e!168787))))

(declare-fun lt!379413 () tuple2!20872)

(declare-fun lt!379410 () tuple2!20872)

(assert (=> b!243487 (= res!203432 (= (bitIndex!0 (size!5852 (buf!6321 (_1!11358 lt!379413))) (currentByte!11693 (_1!11358 lt!379413)) (currentBit!11688 (_1!11358 lt!379413))) (bitIndex!0 (size!5852 (buf!6321 (_1!11358 lt!379410))) (currentByte!11693 (_1!11358 lt!379410)) (currentBit!11688 (_1!11358 lt!379410)))))))

(declare-fun lt!379417 () Unit!17793)

(declare-fun lt!379422 () BitStream!10626)

(declare-fun readBitPrefixLemma!0 (BitStream!10626 BitStream!10626) Unit!17793)

(assert (=> b!243487 (= lt!379417 (readBitPrefixLemma!0 lt!379422 (_2!11356 lt!379407)))))

(assert (=> b!243487 (= lt!379410 (readBitPure!0 (BitStream!10627 (buf!6321 (_2!11356 lt!379407)) (currentByte!11693 thiss!1005) (currentBit!11688 thiss!1005))))))

(assert (=> b!243487 (= lt!379413 (readBitPure!0 lt!379422))))

(assert (=> b!243487 (= lt!379422 (BitStream!10627 (buf!6321 (_2!11356 lt!379408)) (currentByte!11693 thiss!1005) (currentBit!11688 thiss!1005)))))

(declare-fun e!168790 () Bool)

(assert (=> b!243487 e!168790))

(declare-fun res!203434 () Bool)

(assert (=> b!243487 (=> (not res!203434) (not e!168790))))

(declare-fun isPrefixOf!0 (BitStream!10626 BitStream!10626) Bool)

(assert (=> b!243487 (= res!203434 (isPrefixOf!0 thiss!1005 (_2!11356 lt!379407)))))

(declare-fun lt!379420 () Unit!17793)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10626 BitStream!10626 BitStream!10626) Unit!17793)

(assert (=> b!243487 (= lt!379420 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11356 lt!379408) (_2!11356 lt!379407)))))

(assert (=> b!243487 e!168791))

(declare-fun res!203435 () Bool)

(assert (=> b!243487 (=> (not res!203435) (not e!168791))))

(assert (=> b!243487 (= res!203435 (= (size!5852 (buf!6321 (_2!11356 lt!379408))) (size!5852 (buf!6321 (_2!11356 lt!379407)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10626 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20868)

(assert (=> b!243487 (= lt!379407 (appendNBitsLoop!0 (_2!11356 lt!379408) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243487 (validate_offset_bits!1 ((_ sign_extend 32) (size!5852 (buf!6321 (_2!11356 lt!379408)))) ((_ sign_extend 32) (currentByte!11693 (_2!11356 lt!379408))) ((_ sign_extend 32) (currentBit!11688 (_2!11356 lt!379408))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379421 () Unit!17793)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10626 BitStream!10626 (_ BitVec 64) (_ BitVec 64)) Unit!17793)

(assert (=> b!243487 (= lt!379421 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11356 lt!379408) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168786 () Bool)

(assert (=> b!243487 e!168786))

(declare-fun res!203427 () Bool)

(assert (=> b!243487 (=> (not res!203427) (not e!168786))))

(assert (=> b!243487 (= res!203427 (= (size!5852 (buf!6321 thiss!1005)) (size!5852 (buf!6321 (_2!11356 lt!379408)))))))

(declare-fun appendBit!0 (BitStream!10626 Bool) tuple2!20868)

(assert (=> b!243487 (= lt!379408 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243488 () Bool)

(declare-fun res!203426 () Bool)

(assert (=> b!243488 (=> (not res!203426) (not e!168782))))

(assert (=> b!243488 (= res!203426 (bvslt from!289 nBits!297))))

(declare-fun b!243489 () Bool)

(declare-fun res!203425 () Bool)

(declare-fun e!168784 () Bool)

(assert (=> b!243489 (=> (not res!203425) (not e!168784))))

(assert (=> b!243489 (= res!203425 (isPrefixOf!0 thiss!1005 (_2!11356 lt!379408)))))

(declare-fun b!243490 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243490 (= e!168790 (invariant!0 (currentBit!11688 thiss!1005) (currentByte!11693 thiss!1005) (size!5852 (buf!6321 (_2!11356 lt!379407)))))))

(declare-fun b!243491 () Bool)

(declare-fun e!168788 () Bool)

(declare-fun lt!379414 () tuple2!20872)

(declare-fun lt!379411 () (_ BitVec 64))

(assert (=> b!243491 (= e!168788 (= (bitIndex!0 (size!5852 (buf!6321 (_1!11358 lt!379414))) (currentByte!11693 (_1!11358 lt!379414)) (currentBit!11688 (_1!11358 lt!379414))) lt!379411))))

(declare-fun b!243492 () Bool)

(declare-fun res!203424 () Bool)

(assert (=> b!243492 (=> (not res!203424) (not e!168790))))

(assert (=> b!243492 (= res!203424 (invariant!0 (currentBit!11688 thiss!1005) (currentByte!11693 thiss!1005) (size!5852 (buf!6321 (_2!11356 lt!379408)))))))

(declare-fun b!243484 () Bool)

(assert (=> b!243484 (= e!168787 (= (_2!11358 lt!379413) (_2!11358 lt!379410)))))

(declare-fun res!203428 () Bool)

(assert (=> start!52636 (=> (not res!203428) (not e!168782))))

(assert (=> start!52636 (= res!203428 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52636 e!168782))

(assert (=> start!52636 true))

(declare-fun inv!12 (BitStream!10626) Bool)

(assert (=> start!52636 (and (inv!12 thiss!1005) e!168785)))

(declare-fun b!243493 () Bool)

(declare-fun res!203433 () Bool)

(assert (=> b!243493 (=> (not res!203433) (not e!168789))))

(assert (=> b!243493 (= res!203433 (isPrefixOf!0 (_2!11356 lt!379408) (_2!11356 lt!379407)))))

(declare-fun b!243494 () Bool)

(declare-fun lt!379416 () tuple2!20872)

(declare-fun lt!379409 () tuple2!20870)

(assert (=> b!243494 (= e!168789 (not (or (not (_2!11358 lt!379416)) (not (= (_1!11358 lt!379416) (_2!11357 lt!379409))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10626 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20872)

(assert (=> b!243494 (= lt!379416 (checkBitsLoopPure!0 (_1!11357 lt!379409) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243494 (validate_offset_bits!1 ((_ sign_extend 32) (size!5852 (buf!6321 (_2!11356 lt!379407)))) ((_ sign_extend 32) (currentByte!11693 (_2!11356 lt!379408))) ((_ sign_extend 32) (currentBit!11688 (_2!11356 lt!379408))) lt!379412)))

(declare-fun lt!379415 () Unit!17793)

(assert (=> b!243494 (= lt!379415 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11356 lt!379408) (buf!6321 (_2!11356 lt!379407)) lt!379412))))

(assert (=> b!243494 (= lt!379409 (reader!0 (_2!11356 lt!379408) (_2!11356 lt!379407)))))

(declare-fun b!243495 () Bool)

(assert (=> b!243495 (= e!168784 e!168788)))

(declare-fun res!203436 () Bool)

(assert (=> b!243495 (=> (not res!203436) (not e!168788))))

(assert (=> b!243495 (= res!203436 (and (= (_2!11358 lt!379414) bit!26) (= (_1!11358 lt!379414) (_2!11356 lt!379408))))))

(declare-fun readerFrom!0 (BitStream!10626 (_ BitVec 32) (_ BitVec 32)) BitStream!10626)

(assert (=> b!243495 (= lt!379414 (readBitPure!0 (readerFrom!0 (_2!11356 lt!379408) (currentBit!11688 thiss!1005) (currentByte!11693 thiss!1005))))))

(declare-fun b!243496 () Bool)

(declare-fun res!203429 () Bool)

(assert (=> b!243496 (=> (not res!203429) (not e!168782))))

(assert (=> b!243496 (= res!203429 (validate_offset_bits!1 ((_ sign_extend 32) (size!5852 (buf!6321 thiss!1005))) ((_ sign_extend 32) (currentByte!11693 thiss!1005)) ((_ sign_extend 32) (currentBit!11688 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243497 () Bool)

(assert (=> b!243497 (= e!168786 e!168784)))

(declare-fun res!203430 () Bool)

(assert (=> b!243497 (=> (not res!203430) (not e!168784))))

(declare-fun lt!379405 () (_ BitVec 64))

(assert (=> b!243497 (= res!203430 (= lt!379411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379405)))))

(assert (=> b!243497 (= lt!379411 (bitIndex!0 (size!5852 (buf!6321 (_2!11356 lt!379408))) (currentByte!11693 (_2!11356 lt!379408)) (currentBit!11688 (_2!11356 lt!379408))))))

(assert (=> b!243497 (= lt!379405 (bitIndex!0 (size!5852 (buf!6321 thiss!1005)) (currentByte!11693 thiss!1005) (currentBit!11688 thiss!1005)))))

(assert (= (and start!52636 res!203428) b!243496))

(assert (= (and b!243496 res!203429) b!243488))

(assert (= (and b!243488 res!203426) b!243487))

(assert (= (and b!243487 res!203427) b!243497))

(assert (= (and b!243497 res!203430) b!243489))

(assert (= (and b!243489 res!203425) b!243495))

(assert (= (and b!243495 res!203436) b!243491))

(assert (= (and b!243487 res!203435) b!243486))

(assert (= (and b!243486 res!203431) b!243493))

(assert (= (and b!243493 res!203433) b!243494))

(assert (= (and b!243487 res!203434) b!243492))

(assert (= (and b!243492 res!203424) b!243490))

(assert (= (and b!243487 res!203432) b!243484))

(assert (= start!52636 b!243485))

(declare-fun m!366849 () Bool)

(assert (=> b!243489 m!366849))

(declare-fun m!366851 () Bool)

(assert (=> start!52636 m!366851))

(declare-fun m!366853 () Bool)

(assert (=> b!243494 m!366853))

(declare-fun m!366855 () Bool)

(assert (=> b!243494 m!366855))

(declare-fun m!366857 () Bool)

(assert (=> b!243494 m!366857))

(declare-fun m!366859 () Bool)

(assert (=> b!243494 m!366859))

(declare-fun m!366861 () Bool)

(assert (=> b!243490 m!366861))

(declare-fun m!366863 () Bool)

(assert (=> b!243486 m!366863))

(declare-fun m!366865 () Bool)

(assert (=> b!243486 m!366865))

(declare-fun m!366867 () Bool)

(assert (=> b!243487 m!366867))

(declare-fun m!366869 () Bool)

(assert (=> b!243487 m!366869))

(declare-fun m!366871 () Bool)

(assert (=> b!243487 m!366871))

(declare-fun m!366873 () Bool)

(assert (=> b!243487 m!366873))

(declare-fun m!366875 () Bool)

(assert (=> b!243487 m!366875))

(declare-fun m!366877 () Bool)

(assert (=> b!243487 m!366877))

(declare-fun m!366879 () Bool)

(assert (=> b!243487 m!366879))

(declare-fun m!366881 () Bool)

(assert (=> b!243487 m!366881))

(declare-fun m!366883 () Bool)

(assert (=> b!243487 m!366883))

(declare-fun m!366885 () Bool)

(assert (=> b!243487 m!366885))

(declare-fun m!366887 () Bool)

(assert (=> b!243487 m!366887))

(declare-fun m!366889 () Bool)

(assert (=> b!243487 m!366889))

(assert (=> b!243487 m!366859))

(declare-fun m!366891 () Bool)

(assert (=> b!243487 m!366891))

(declare-fun m!366893 () Bool)

(assert (=> b!243487 m!366893))

(declare-fun m!366895 () Bool)

(assert (=> b!243487 m!366895))

(assert (=> b!243497 m!366865))

(declare-fun m!366897 () Bool)

(assert (=> b!243497 m!366897))

(declare-fun m!366899 () Bool)

(assert (=> b!243485 m!366899))

(declare-fun m!366901 () Bool)

(assert (=> b!243491 m!366901))

(declare-fun m!366903 () Bool)

(assert (=> b!243492 m!366903))

(declare-fun m!366905 () Bool)

(assert (=> b!243496 m!366905))

(declare-fun m!366907 () Bool)

(assert (=> b!243493 m!366907))

(declare-fun m!366909 () Bool)

(assert (=> b!243495 m!366909))

(assert (=> b!243495 m!366909))

(declare-fun m!366911 () Bool)

(assert (=> b!243495 m!366911))

(check-sat (not b!243494) (not b!243487) (not b!243496) (not b!243495) (not b!243493) (not b!243490) (not b!243485) (not b!243489) (not b!243486) (not b!243491) (not start!52636) (not b!243492) (not b!243497))
