; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7342 () Bool)

(assert start!7342)

(declare-fun b!35780 () Bool)

(declare-fun res!30536 () Bool)

(declare-fun e!23642 () Bool)

(assert (=> b!35780 (=> (not res!30536) (not e!23642))))

(declare-datatypes ((array!1909 0))(
  ( (array!1910 (arr!1335 (Array (_ BitVec 32) (_ BitVec 8))) (size!851 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1476 0))(
  ( (BitStream!1477 (buf!1179 array!1909) (currentByte!2564 (_ BitVec 32)) (currentBit!2559 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1476)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35780 (= res!30536 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!35781 () Bool)

(declare-fun e!23637 () Bool)

(declare-fun array_inv!791 (array!1909) Bool)

(assert (=> b!35781 (= e!23637 (array_inv!791 (buf!1179 thiss!1379)))))

(declare-fun res!30524 () Bool)

(assert (=> start!7342 (=> (not res!30524) (not e!23642))))

(declare-fun srcBuffer!2 () array!1909)

(assert (=> start!7342 (= res!30524 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!851 srcBuffer!2))))))))

(assert (=> start!7342 e!23642))

(assert (=> start!7342 true))

(assert (=> start!7342 (array_inv!791 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1476) Bool)

(assert (=> start!7342 (and (inv!12 thiss!1379) e!23637)))

(declare-fun b!35782 () Bool)

(declare-fun res!30528 () Bool)

(declare-fun e!23647 () Bool)

(assert (=> b!35782 (=> res!30528 e!23647)))

(declare-datatypes ((Unit!2629 0))(
  ( (Unit!2630) )
))
(declare-datatypes ((tuple2!3554 0))(
  ( (tuple2!3555 (_1!1864 Unit!2629) (_2!1864 BitStream!1476)) )
))
(declare-fun lt!53447 () tuple2!3554)

(declare-fun lt!53437 () tuple2!3554)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!35782 (= res!30528 (not (invariant!0 (currentBit!2559 (_2!1864 lt!53447)) (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53437))))))))

(declare-fun b!35783 () Bool)

(declare-fun res!30522 () Bool)

(declare-fun e!23636 () Bool)

(assert (=> b!35783 (=> res!30522 e!23636)))

(assert (=> b!35783 (= res!30522 (not (invariant!0 (currentBit!2559 (_2!1864 lt!53437)) (currentByte!2564 (_2!1864 lt!53437)) (size!851 (buf!1179 (_2!1864 lt!53437))))))))

(declare-fun b!35784 () Bool)

(declare-fun e!23649 () Bool)

(declare-fun e!23640 () Bool)

(assert (=> b!35784 (= e!23649 e!23640)))

(declare-fun res!30530 () Bool)

(assert (=> b!35784 (=> res!30530 e!23640)))

(declare-fun lt!53434 () (_ BitVec 64))

(declare-fun lt!53446 () Bool)

(declare-datatypes ((tuple2!3556 0))(
  ( (tuple2!3557 (_1!1865 BitStream!1476) (_2!1865 BitStream!1476)) )
))
(declare-fun lt!53432 () tuple2!3556)

(declare-fun bitAt!0 (array!1909 (_ BitVec 64)) Bool)

(assert (=> b!35784 (= res!30530 (not (= lt!53446 (bitAt!0 (buf!1179 (_1!1865 lt!53432)) lt!53434))))))

(declare-fun lt!53445 () tuple2!3556)

(assert (=> b!35784 (= lt!53446 (bitAt!0 (buf!1179 (_1!1865 lt!53445)) lt!53434))))

(declare-fun b!35785 () Bool)

(declare-fun res!30525 () Bool)

(declare-fun e!23641 () Bool)

(assert (=> b!35785 (=> res!30525 e!23641)))

(declare-datatypes ((List!439 0))(
  ( (Nil!436) (Cons!435 (h!554 Bool) (t!1189 List!439)) )
))
(declare-fun lt!53448 () List!439)

(declare-fun length!165 (List!439) Int)

(assert (=> b!35785 (= res!30525 (<= (length!165 lt!53448) 0))))

(declare-fun b!35786 () Bool)

(assert (=> b!35786 (= e!23647 e!23641)))

(declare-fun res!30526 () Bool)

(assert (=> b!35786 (=> res!30526 e!23641)))

(assert (=> b!35786 (= res!30526 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!53450 () List!439)

(declare-fun lt!53455 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1476 BitStream!1476 (_ BitVec 64)) List!439)

(assert (=> b!35786 (= lt!53450 (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_1!1865 lt!53432) lt!53455))))

(assert (=> b!35786 (= lt!53448 (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_1!1865 lt!53445) (bvsub to!314 i!635)))))

(assert (=> b!35786 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!53455)))

(declare-fun lt!53438 () Unit!2629)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1476 array!1909 (_ BitVec 64)) Unit!2629)

(assert (=> b!35786 (= lt!53438 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!53437)) lt!53455))))

(declare-fun reader!0 (BitStream!1476 BitStream!1476) tuple2!3556)

(assert (=> b!35786 (= lt!53432 (reader!0 (_2!1864 lt!53447) (_2!1864 lt!53437)))))

(assert (=> b!35786 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53444 () Unit!2629)

(assert (=> b!35786 (= lt!53444 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1179 (_2!1864 lt!53437)) (bvsub to!314 i!635)))))

(assert (=> b!35786 (= lt!53445 (reader!0 thiss!1379 (_2!1864 lt!53437)))))

(declare-fun b!35787 () Bool)

(declare-fun res!30539 () Bool)

(assert (=> b!35787 (=> res!30539 e!23647)))

(assert (=> b!35787 (= res!30539 (not (invariant!0 (currentBit!2559 (_2!1864 lt!53447)) (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53447))))))))

(declare-fun b!35788 () Bool)

(declare-fun e!23644 () Bool)

(assert (=> b!35788 (= e!23644 e!23636)))

(declare-fun res!30527 () Bool)

(assert (=> b!35788 (=> res!30527 e!23636)))

(declare-fun lt!53451 () (_ BitVec 64))

(assert (=> b!35788 (= res!30527 (not (= lt!53451 (bvsub (bvadd lt!53434 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!35788 (= lt!53451 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437))))))

(declare-fun b!35789 () Bool)

(assert (=> b!35789 (= e!23641 e!23649)))

(declare-fun res!30532 () Bool)

(assert (=> b!35789 (=> res!30532 e!23649)))

(declare-fun lt!53436 () List!439)

(assert (=> b!35789 (= res!30532 (not (= lt!53436 lt!53450)))))

(assert (=> b!35789 (= lt!53450 lt!53436)))

(declare-fun tail!156 (List!439) List!439)

(assert (=> b!35789 (= lt!53436 (tail!156 lt!53448))))

(declare-fun lt!53454 () Unit!2629)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1476 BitStream!1476 BitStream!1476 BitStream!1476 (_ BitVec 64) List!439) Unit!2629)

(assert (=> b!35789 (= lt!53454 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1864 lt!53437) (_2!1864 lt!53437) (_1!1865 lt!53445) (_1!1865 lt!53432) (bvsub to!314 i!635) lt!53448))))

(declare-fun b!35790 () Bool)

(declare-fun e!23635 () Bool)

(assert (=> b!35790 (= e!23642 (not e!23635))))

(declare-fun res!30533 () Bool)

(assert (=> b!35790 (=> res!30533 e!23635)))

(assert (=> b!35790 (= res!30533 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1476 BitStream!1476) Bool)

(assert (=> b!35790 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!53453 () Unit!2629)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1476) Unit!2629)

(assert (=> b!35790 (= lt!53453 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!35790 (= lt!53434 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(declare-fun b!35791 () Bool)

(declare-fun e!23648 () Bool)

(declare-fun e!23643 () Bool)

(assert (=> b!35791 (= e!23648 e!23643)))

(declare-fun res!30535 () Bool)

(assert (=> b!35791 (=> res!30535 e!23643)))

(declare-fun lt!53452 () Bool)

(declare-fun lt!53449 () Bool)

(assert (=> b!35791 (= res!30535 (not (= lt!53452 lt!53449)))))

(declare-fun lt!53440 () Bool)

(assert (=> b!35791 (= lt!53440 lt!53452)))

(assert (=> b!35791 (= lt!53452 (bitAt!0 (buf!1179 (_2!1864 lt!53437)) lt!53434))))

(declare-fun lt!53439 () (_ BitVec 64))

(declare-fun lt!53443 () Unit!2629)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1909 array!1909 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2629)

(assert (=> b!35791 (= lt!53443 (arrayBitRangesEqImpliesEq!0 (buf!1179 (_2!1864 lt!53447)) (buf!1179 (_2!1864 lt!53437)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53434 lt!53439))))

(declare-fun b!35792 () Bool)

(declare-fun res!30529 () Bool)

(assert (=> b!35792 (=> res!30529 e!23640)))

(declare-fun head!276 (List!439) Bool)

(assert (=> b!35792 (= res!30529 (not (= (head!276 lt!53448) lt!53446)))))

(declare-fun b!35793 () Bool)

(declare-fun e!23638 () Bool)

(assert (=> b!35793 (= e!23638 e!23644)))

(declare-fun res!30538 () Bool)

(assert (=> b!35793 (=> res!30538 e!23644)))

(assert (=> b!35793 (= res!30538 (not (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53437))))))

(assert (=> b!35793 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53437))))

(declare-fun lt!53433 () Unit!2629)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1476 BitStream!1476 BitStream!1476) Unit!2629)

(assert (=> b!35793 (= lt!53433 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1864 lt!53447) (_2!1864 lt!53437)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1476 array!1909 (_ BitVec 64) (_ BitVec 64)) tuple2!3554)

(assert (=> b!35793 (= lt!53437 (appendBitsMSBFirstLoop!0 (_2!1864 lt!53447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!23650 () Bool)

(assert (=> b!35793 e!23650))

(declare-fun res!30523 () Bool)

(assert (=> b!35793 (=> (not res!30523) (not e!23650))))

(assert (=> b!35793 (= res!30523 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53442 () Unit!2629)

(assert (=> b!35793 (= lt!53442 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1179 (_2!1864 lt!53447)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53435 () tuple2!3556)

(assert (=> b!35793 (= lt!53435 (reader!0 thiss!1379 (_2!1864 lt!53447)))))

(declare-fun b!35794 () Bool)

(declare-fun e!23646 () Bool)

(assert (=> b!35794 (= e!23646 e!23648)))

(declare-fun res!30540 () Bool)

(assert (=> b!35794 (=> res!30540 e!23648)))

(assert (=> b!35794 (= res!30540 (not (= lt!53440 lt!53449)))))

(assert (=> b!35794 (= lt!53440 (bitAt!0 (buf!1179 (_2!1864 lt!53447)) lt!53434))))

(declare-fun b!35795 () Bool)

(assert (=> b!35795 (= e!23636 e!23647)))

(declare-fun res!30537 () Bool)

(assert (=> b!35795 (=> res!30537 e!23647)))

(assert (=> b!35795 (= res!30537 (not (= (size!851 (buf!1179 (_2!1864 lt!53447))) (size!851 (buf!1179 (_2!1864 lt!53437))))))))

(assert (=> b!35795 (= lt!53451 (bvsub (bvsub (bvadd lt!53439 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!35795 (= lt!53439 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(assert (=> b!35795 (= (size!851 (buf!1179 (_2!1864 lt!53437))) (size!851 (buf!1179 thiss!1379)))))

(declare-fun b!35796 () Bool)

(declare-fun res!30531 () Bool)

(assert (=> b!35796 (=> res!30531 e!23636)))

(assert (=> b!35796 (= res!30531 (not (= (size!851 (buf!1179 thiss!1379)) (size!851 (buf!1179 (_2!1864 lt!53437))))))))

(declare-fun b!35797 () Bool)

(assert (=> b!35797 (= e!23635 e!23638)))

(declare-fun res!30534 () Bool)

(assert (=> b!35797 (=> res!30534 e!23638)))

(assert (=> b!35797 (= res!30534 (not (isPrefixOf!0 thiss!1379 (_2!1864 lt!53447))))))

(assert (=> b!35797 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!53455)))

(assert (=> b!35797 (= lt!53455 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!53441 () Unit!2629)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1476 BitStream!1476 (_ BitVec 64) (_ BitVec 64)) Unit!2629)

(assert (=> b!35797 (= lt!53441 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1864 lt!53447) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1476 (_ BitVec 8) (_ BitVec 32)) tuple2!3554)

(assert (=> b!35797 (= lt!53447 (appendBitFromByte!0 thiss!1379 (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!35798 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35798 (= e!23643 (validate_offset_bit!0 ((_ sign_extend 32) (size!851 (buf!1179 (_1!1865 lt!53445)))) ((_ sign_extend 32) (currentByte!2564 (_1!1865 lt!53445))) ((_ sign_extend 32) (currentBit!2559 (_1!1865 lt!53445)))))))

(declare-fun b!35799 () Bool)

(assert (=> b!35799 (= e!23640 e!23646)))

(declare-fun res!30521 () Bool)

(assert (=> b!35799 (=> res!30521 e!23646)))

(declare-fun byteArrayBitContentToList!0 (BitStream!1476 array!1909 (_ BitVec 64) (_ BitVec 64)) List!439)

(assert (=> b!35799 (= res!30521 (not (= (head!276 (byteArrayBitContentToList!0 (_2!1864 lt!53437) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!53449)))))

(assert (=> b!35799 (= lt!53449 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!35800 () Bool)

(assert (=> b!35800 (= e!23650 (= (head!276 (byteArrayBitContentToList!0 (_2!1864 lt!53447) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!276 (bitStreamReadBitsIntoList!0 (_2!1864 lt!53447) (_1!1865 lt!53435) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!7342 res!30524) b!35780))

(assert (= (and b!35780 res!30536) b!35790))

(assert (= (and b!35790 (not res!30533)) b!35797))

(assert (= (and b!35797 (not res!30534)) b!35793))

(assert (= (and b!35793 res!30523) b!35800))

(assert (= (and b!35793 (not res!30538)) b!35788))

(assert (= (and b!35788 (not res!30527)) b!35783))

(assert (= (and b!35783 (not res!30522)) b!35796))

(assert (= (and b!35796 (not res!30531)) b!35795))

(assert (= (and b!35795 (not res!30537)) b!35787))

(assert (= (and b!35787 (not res!30539)) b!35782))

(assert (= (and b!35782 (not res!30528)) b!35786))

(assert (= (and b!35786 (not res!30526)) b!35785))

(assert (= (and b!35785 (not res!30525)) b!35789))

(assert (= (and b!35789 (not res!30532)) b!35784))

(assert (= (and b!35784 (not res!30530)) b!35792))

(assert (= (and b!35792 (not res!30529)) b!35799))

(assert (= (and b!35799 (not res!30521)) b!35794))

(assert (= (and b!35794 (not res!30540)) b!35791))

(assert (= (and b!35791 (not res!30535)) b!35798))

(assert (= start!7342 b!35781))

(declare-fun m!53789 () Bool)

(assert (=> b!35791 m!53789))

(declare-fun m!53791 () Bool)

(assert (=> b!35791 m!53791))

(declare-fun m!53793 () Bool)

(assert (=> b!35797 m!53793))

(declare-fun m!53795 () Bool)

(assert (=> b!35797 m!53795))

(declare-fun m!53797 () Bool)

(assert (=> b!35797 m!53797))

(declare-fun m!53799 () Bool)

(assert (=> b!35797 m!53799))

(assert (=> b!35797 m!53797))

(declare-fun m!53801 () Bool)

(assert (=> b!35797 m!53801))

(declare-fun m!53803 () Bool)

(assert (=> b!35785 m!53803))

(declare-fun m!53805 () Bool)

(assert (=> b!35799 m!53805))

(assert (=> b!35799 m!53805))

(declare-fun m!53807 () Bool)

(assert (=> b!35799 m!53807))

(declare-fun m!53809 () Bool)

(assert (=> b!35799 m!53809))

(declare-fun m!53811 () Bool)

(assert (=> b!35786 m!53811))

(declare-fun m!53813 () Bool)

(assert (=> b!35786 m!53813))

(declare-fun m!53815 () Bool)

(assert (=> b!35786 m!53815))

(declare-fun m!53817 () Bool)

(assert (=> b!35786 m!53817))

(declare-fun m!53819 () Bool)

(assert (=> b!35786 m!53819))

(declare-fun m!53821 () Bool)

(assert (=> b!35786 m!53821))

(declare-fun m!53823 () Bool)

(assert (=> b!35786 m!53823))

(declare-fun m!53825 () Bool)

(assert (=> b!35786 m!53825))

(declare-fun m!53827 () Bool)

(assert (=> b!35800 m!53827))

(assert (=> b!35800 m!53827))

(declare-fun m!53829 () Bool)

(assert (=> b!35800 m!53829))

(declare-fun m!53831 () Bool)

(assert (=> b!35800 m!53831))

(assert (=> b!35800 m!53831))

(declare-fun m!53833 () Bool)

(assert (=> b!35800 m!53833))

(declare-fun m!53835 () Bool)

(assert (=> b!35781 m!53835))

(declare-fun m!53837 () Bool)

(assert (=> b!35784 m!53837))

(declare-fun m!53839 () Bool)

(assert (=> b!35784 m!53839))

(declare-fun m!53841 () Bool)

(assert (=> b!35787 m!53841))

(declare-fun m!53843 () Bool)

(assert (=> start!7342 m!53843))

(declare-fun m!53845 () Bool)

(assert (=> start!7342 m!53845))

(declare-fun m!53847 () Bool)

(assert (=> b!35790 m!53847))

(declare-fun m!53849 () Bool)

(assert (=> b!35790 m!53849))

(declare-fun m!53851 () Bool)

(assert (=> b!35790 m!53851))

(declare-fun m!53853 () Bool)

(assert (=> b!35789 m!53853))

(declare-fun m!53855 () Bool)

(assert (=> b!35789 m!53855))

(declare-fun m!53857 () Bool)

(assert (=> b!35788 m!53857))

(declare-fun m!53859 () Bool)

(assert (=> b!35783 m!53859))

(declare-fun m!53861 () Bool)

(assert (=> b!35782 m!53861))

(declare-fun m!53863 () Bool)

(assert (=> b!35798 m!53863))

(declare-fun m!53865 () Bool)

(assert (=> b!35792 m!53865))

(declare-fun m!53867 () Bool)

(assert (=> b!35794 m!53867))

(declare-fun m!53869 () Bool)

(assert (=> b!35793 m!53869))

(declare-fun m!53871 () Bool)

(assert (=> b!35793 m!53871))

(declare-fun m!53873 () Bool)

(assert (=> b!35793 m!53873))

(declare-fun m!53875 () Bool)

(assert (=> b!35793 m!53875))

(declare-fun m!53877 () Bool)

(assert (=> b!35793 m!53877))

(declare-fun m!53879 () Bool)

(assert (=> b!35793 m!53879))

(declare-fun m!53881 () Bool)

(assert (=> b!35793 m!53881))

(declare-fun m!53883 () Bool)

(assert (=> b!35795 m!53883))

(declare-fun m!53885 () Bool)

(assert (=> b!35780 m!53885))

(check-sat (not b!35800) (not b!35798) (not b!35795) (not b!35794) (not b!35780) (not b!35793) (not b!35785) (not b!35792) (not b!35787) (not b!35797) (not b!35789) (not b!35799) (not b!35790) (not b!35791) (not b!35788) (not b!35784) (not start!7342) (not b!35781) (not b!35782) (not b!35786) (not b!35783))
(check-sat)
(get-model)

(declare-fun d!10448 () Bool)

(assert (=> d!10448 (= (head!276 (byteArrayBitContentToList!0 (_2!1864 lt!53447) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!554 (byteArrayBitContentToList!0 (_2!1864 lt!53447) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35800 d!10448))

(declare-fun d!10450 () Bool)

(declare-fun c!2424 () Bool)

(assert (=> d!10450 (= c!2424 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23701 () List!439)

(assert (=> d!10450 (= (byteArrayBitContentToList!0 (_2!1864 lt!53447) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!23701)))

(declare-fun b!35868 () Bool)

(assert (=> b!35868 (= e!23701 Nil!436)))

(declare-fun b!35869 () Bool)

(assert (=> b!35869 (= e!23701 (Cons!435 (not (= (bvand ((_ sign_extend 24) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1864 lt!53447) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10450 c!2424) b!35868))

(assert (= (and d!10450 (not c!2424)) b!35869))

(assert (=> b!35869 m!53797))

(declare-fun m!53985 () Bool)

(assert (=> b!35869 m!53985))

(declare-fun m!53987 () Bool)

(assert (=> b!35869 m!53987))

(assert (=> b!35800 d!10450))

(declare-fun d!10452 () Bool)

(assert (=> d!10452 (= (head!276 (bitStreamReadBitsIntoList!0 (_2!1864 lt!53447) (_1!1865 lt!53435) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!554 (bitStreamReadBitsIntoList!0 (_2!1864 lt!53447) (_1!1865 lt!53435) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!35800 d!10452))

(declare-fun b!35878 () Bool)

(declare-datatypes ((tuple2!3562 0))(
  ( (tuple2!3563 (_1!1868 List!439) (_2!1868 BitStream!1476)) )
))
(declare-fun e!23707 () tuple2!3562)

(assert (=> b!35878 (= e!23707 (tuple2!3563 Nil!436 (_1!1865 lt!53435)))))

(declare-fun b!35880 () Bool)

(declare-fun e!23706 () Bool)

(declare-fun lt!53536 () List!439)

(declare-fun isEmpty!99 (List!439) Bool)

(assert (=> b!35880 (= e!23706 (isEmpty!99 lt!53536))))

(declare-fun b!35881 () Bool)

(assert (=> b!35881 (= e!23706 (> (length!165 lt!53536) 0))))

(declare-fun b!35879 () Bool)

(declare-datatypes ((tuple2!3564 0))(
  ( (tuple2!3565 (_1!1869 Bool) (_2!1869 BitStream!1476)) )
))
(declare-fun lt!53535 () tuple2!3564)

(declare-fun lt!53534 () (_ BitVec 64))

(assert (=> b!35879 (= e!23707 (tuple2!3563 (Cons!435 (_1!1869 lt!53535) (bitStreamReadBitsIntoList!0 (_2!1864 lt!53447) (_2!1869 lt!53535) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!53534))) (_2!1869 lt!53535)))))

(declare-fun readBit!0 (BitStream!1476) tuple2!3564)

(assert (=> b!35879 (= lt!53535 (readBit!0 (_1!1865 lt!53435)))))

(assert (=> b!35879 (= lt!53534 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10454 () Bool)

(assert (=> d!10454 e!23706))

(declare-fun c!2430 () Bool)

(assert (=> d!10454 (= c!2430 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10454 (= lt!53536 (_1!1868 e!23707))))

(declare-fun c!2429 () Bool)

(assert (=> d!10454 (= c!2429 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10454 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10454 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!53447) (_1!1865 lt!53435) #b0000000000000000000000000000000000000000000000000000000000000001) lt!53536)))

(assert (= (and d!10454 c!2429) b!35878))

(assert (= (and d!10454 (not c!2429)) b!35879))

(assert (= (and d!10454 c!2430) b!35880))

(assert (= (and d!10454 (not c!2430)) b!35881))

(declare-fun m!53989 () Bool)

(assert (=> b!35880 m!53989))

(declare-fun m!53991 () Bool)

(assert (=> b!35881 m!53991))

(declare-fun m!53993 () Bool)

(assert (=> b!35879 m!53993))

(declare-fun m!53995 () Bool)

(assert (=> b!35879 m!53995))

(assert (=> b!35800 d!10454))

(declare-fun d!10456 () Bool)

(assert (=> d!10456 (= (tail!156 lt!53448) (t!1189 lt!53448))))

(assert (=> b!35789 d!10456))

(declare-fun d!10458 () Bool)

(declare-fun e!23710 () Bool)

(assert (=> d!10458 e!23710))

(declare-fun res!30603 () Bool)

(assert (=> d!10458 (=> (not res!30603) (not e!23710))))

(declare-fun lt!53542 () (_ BitVec 64))

(assert (=> d!10458 (= res!30603 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!53542) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!10458 (= lt!53542 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!53541 () Unit!2629)

(declare-fun choose!42 (BitStream!1476 BitStream!1476 BitStream!1476 BitStream!1476 (_ BitVec 64) List!439) Unit!2629)

(assert (=> d!10458 (= lt!53541 (choose!42 (_2!1864 lt!53437) (_2!1864 lt!53437) (_1!1865 lt!53445) (_1!1865 lt!53432) (bvsub to!314 i!635) lt!53448))))

(assert (=> d!10458 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10458 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1864 lt!53437) (_2!1864 lt!53437) (_1!1865 lt!53445) (_1!1865 lt!53432) (bvsub to!314 i!635) lt!53448) lt!53541)))

(declare-fun b!35884 () Bool)

(assert (=> b!35884 (= e!23710 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_1!1865 lt!53432) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!156 lt!53448)))))

(assert (= (and d!10458 res!30603) b!35884))

(declare-fun m!53997 () Bool)

(assert (=> d!10458 m!53997))

(declare-fun m!53999 () Bool)

(assert (=> b!35884 m!53999))

(assert (=> b!35884 m!53853))

(assert (=> b!35789 d!10458))

(declare-fun d!10460 () Bool)

(declare-fun e!23713 () Bool)

(assert (=> d!10460 e!23713))

(declare-fun res!30608 () Bool)

(assert (=> d!10460 (=> (not res!30608) (not e!23713))))

(declare-fun lt!53560 () (_ BitVec 64))

(declare-fun lt!53558 () (_ BitVec 64))

(declare-fun lt!53557 () (_ BitVec 64))

(assert (=> d!10460 (= res!30608 (= lt!53557 (bvsub lt!53558 lt!53560)))))

(assert (=> d!10460 (or (= (bvand lt!53558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53560 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53558 lt!53560) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!10460 (= lt!53560 (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53437))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53437)))))))

(declare-fun lt!53555 () (_ BitVec 64))

(declare-fun lt!53559 () (_ BitVec 64))

(assert (=> d!10460 (= lt!53558 (bvmul lt!53555 lt!53559))))

(assert (=> d!10460 (or (= lt!53555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53559 (bvsdiv (bvmul lt!53555 lt!53559) lt!53555)))))

(assert (=> d!10460 (= lt!53559 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10460 (= lt!53555 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))))))

(assert (=> d!10460 (= lt!53557 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53437)))))))

(assert (=> d!10460 (invariant!0 (currentBit!2559 (_2!1864 lt!53437)) (currentByte!2564 (_2!1864 lt!53437)) (size!851 (buf!1179 (_2!1864 lt!53437))))))

(assert (=> d!10460 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437))) lt!53557)))

(declare-fun b!35889 () Bool)

(declare-fun res!30609 () Bool)

(assert (=> b!35889 (=> (not res!30609) (not e!23713))))

(assert (=> b!35889 (= res!30609 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53557))))

(declare-fun b!35890 () Bool)

(declare-fun lt!53556 () (_ BitVec 64))

(assert (=> b!35890 (= e!23713 (bvsle lt!53557 (bvmul lt!53556 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!35890 (or (= lt!53556 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!53556 #b0000000000000000000000000000000000000000000000000000000000001000) lt!53556)))))

(assert (=> b!35890 (= lt!53556 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))))))

(assert (= (and d!10460 res!30608) b!35889))

(assert (= (and b!35889 res!30609) b!35890))

(declare-fun m!54001 () Bool)

(assert (=> d!10460 m!54001))

(assert (=> d!10460 m!53859))

(assert (=> b!35788 d!10460))

(declare-fun d!10462 () Bool)

(assert (=> d!10462 (= (head!276 (byteArrayBitContentToList!0 (_2!1864 lt!53437) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!554 (byteArrayBitContentToList!0 (_2!1864 lt!53437) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!35799 d!10462))

(declare-fun d!10464 () Bool)

(declare-fun c!2431 () Bool)

(assert (=> d!10464 (= c!2431 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!23714 () List!439)

(assert (=> d!10464 (= (byteArrayBitContentToList!0 (_2!1864 lt!53437) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!23714)))

(declare-fun b!35891 () Bool)

(assert (=> b!35891 (= e!23714 Nil!436)))

(declare-fun b!35892 () Bool)

(assert (=> b!35892 (= e!23714 (Cons!435 (not (= (bvand ((_ sign_extend 24) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1864 lt!53437) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!10464 c!2431) b!35891))

(assert (= (and d!10464 (not c!2431)) b!35892))

(assert (=> b!35892 m!53797))

(assert (=> b!35892 m!53985))

(declare-fun m!54003 () Bool)

(assert (=> b!35892 m!54003))

(assert (=> b!35799 d!10464))

(declare-fun d!10466 () Bool)

(assert (=> d!10466 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2822 () Bool)

(assert (= bs!2822 d!10466))

(assert (=> bs!2822 m!53797))

(assert (=> bs!2822 m!53985))

(assert (=> b!35799 d!10466))

(declare-fun d!10468 () Bool)

(assert (=> d!10468 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!851 (buf!1179 (_1!1865 lt!53445)))) ((_ sign_extend 32) (currentByte!2564 (_1!1865 lt!53445))) ((_ sign_extend 32) (currentBit!2559 (_1!1865 lt!53445)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_1!1865 lt!53445)))) ((_ sign_extend 32) (currentByte!2564 (_1!1865 lt!53445))) ((_ sign_extend 32) (currentBit!2559 (_1!1865 lt!53445)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2823 () Bool)

(assert (= bs!2823 d!10468))

(declare-fun m!54005 () Bool)

(assert (=> bs!2823 m!54005))

(assert (=> b!35798 d!10468))

(declare-fun d!10470 () Bool)

(assert (=> d!10470 (= (invariant!0 (currentBit!2559 (_2!1864 lt!53447)) (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53447)))) (and (bvsge (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (bvslt (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000001000) (bvsge (currentByte!2564 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53447)))) (and (= (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (= (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53447))))))))))

(assert (=> b!35787 d!10470))

(declare-fun d!10472 () Bool)

(assert (=> d!10472 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!53563 () Unit!2629)

(declare-fun choose!9 (BitStream!1476 array!1909 (_ BitVec 64) BitStream!1476) Unit!2629)

(assert (=> d!10472 (= lt!53563 (choose!9 thiss!1379 (buf!1179 (_2!1864 lt!53437)) (bvsub to!314 i!635) (BitStream!1477 (buf!1179 (_2!1864 lt!53437)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(assert (=> d!10472 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1179 (_2!1864 lt!53437)) (bvsub to!314 i!635)) lt!53563)))

(declare-fun bs!2824 () Bool)

(assert (= bs!2824 d!10472))

(assert (=> bs!2824 m!53819))

(declare-fun m!54007 () Bool)

(assert (=> bs!2824 m!54007))

(assert (=> b!35786 d!10472))

(declare-fun lt!53617 () (_ BitVec 64))

(declare-fun lt!53622 () (_ BitVec 64))

(declare-fun lt!53616 () tuple2!3556)

(declare-fun e!23720 () Bool)

(declare-fun b!35903 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1476 (_ BitVec 64)) BitStream!1476)

(assert (=> b!35903 (= e!23720 (= (_1!1865 lt!53616) (withMovedBitIndex!0 (_2!1865 lt!53616) (bvsub lt!53622 lt!53617))))))

(assert (=> b!35903 (or (= (bvand lt!53622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53617 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53622 lt!53617) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35903 (= lt!53617 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437))))))

(assert (=> b!35903 (= lt!53622 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(declare-fun b!35904 () Bool)

(declare-fun e!23719 () Unit!2629)

(declare-fun lt!53609 () Unit!2629)

(assert (=> b!35904 (= e!23719 lt!53609)))

(declare-fun lt!53607 () (_ BitVec 64))

(assert (=> b!35904 (= lt!53607 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53620 () (_ BitVec 64))

(assert (=> b!35904 (= lt!53620 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1909 array!1909 (_ BitVec 64) (_ BitVec 64)) Unit!2629)

(assert (=> b!35904 (= lt!53609 (arrayBitRangesEqSymmetric!0 (buf!1179 (_2!1864 lt!53447)) (buf!1179 (_2!1864 lt!53437)) lt!53607 lt!53620))))

(declare-fun arrayBitRangesEq!0 (array!1909 array!1909 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!35904 (arrayBitRangesEq!0 (buf!1179 (_2!1864 lt!53437)) (buf!1179 (_2!1864 lt!53447)) lt!53607 lt!53620)))

(declare-fun b!35905 () Bool)

(declare-fun res!30617 () Bool)

(assert (=> b!35905 (=> (not res!30617) (not e!23720))))

(assert (=> b!35905 (= res!30617 (isPrefixOf!0 (_1!1865 lt!53616) (_2!1864 lt!53447)))))

(declare-fun d!10474 () Bool)

(assert (=> d!10474 e!23720))

(declare-fun res!30618 () Bool)

(assert (=> d!10474 (=> (not res!30618) (not e!23720))))

(assert (=> d!10474 (= res!30618 (isPrefixOf!0 (_1!1865 lt!53616) (_2!1865 lt!53616)))))

(declare-fun lt!53613 () BitStream!1476)

(assert (=> d!10474 (= lt!53616 (tuple2!3557 lt!53613 (_2!1864 lt!53437)))))

(declare-fun lt!53606 () Unit!2629)

(declare-fun lt!53605 () Unit!2629)

(assert (=> d!10474 (= lt!53606 lt!53605)))

(assert (=> d!10474 (isPrefixOf!0 lt!53613 (_2!1864 lt!53437))))

(assert (=> d!10474 (= lt!53605 (lemmaIsPrefixTransitive!0 lt!53613 (_2!1864 lt!53437) (_2!1864 lt!53437)))))

(declare-fun lt!53615 () Unit!2629)

(declare-fun lt!53623 () Unit!2629)

(assert (=> d!10474 (= lt!53615 lt!53623)))

(assert (=> d!10474 (isPrefixOf!0 lt!53613 (_2!1864 lt!53437))))

(assert (=> d!10474 (= lt!53623 (lemmaIsPrefixTransitive!0 lt!53613 (_2!1864 lt!53447) (_2!1864 lt!53437)))))

(declare-fun lt!53604 () Unit!2629)

(assert (=> d!10474 (= lt!53604 e!23719)))

(declare-fun c!2434 () Bool)

(assert (=> d!10474 (= c!2434 (not (= (size!851 (buf!1179 (_2!1864 lt!53447))) #b00000000000000000000000000000000)))))

(declare-fun lt!53618 () Unit!2629)

(declare-fun lt!53612 () Unit!2629)

(assert (=> d!10474 (= lt!53618 lt!53612)))

(assert (=> d!10474 (isPrefixOf!0 (_2!1864 lt!53437) (_2!1864 lt!53437))))

(assert (=> d!10474 (= lt!53612 (lemmaIsPrefixRefl!0 (_2!1864 lt!53437)))))

(declare-fun lt!53614 () Unit!2629)

(declare-fun lt!53608 () Unit!2629)

(assert (=> d!10474 (= lt!53614 lt!53608)))

(assert (=> d!10474 (= lt!53608 (lemmaIsPrefixRefl!0 (_2!1864 lt!53437)))))

(declare-fun lt!53610 () Unit!2629)

(declare-fun lt!53611 () Unit!2629)

(assert (=> d!10474 (= lt!53610 lt!53611)))

(assert (=> d!10474 (isPrefixOf!0 lt!53613 lt!53613)))

(assert (=> d!10474 (= lt!53611 (lemmaIsPrefixRefl!0 lt!53613))))

(declare-fun lt!53619 () Unit!2629)

(declare-fun lt!53621 () Unit!2629)

(assert (=> d!10474 (= lt!53619 lt!53621)))

(assert (=> d!10474 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53447))))

(assert (=> d!10474 (= lt!53621 (lemmaIsPrefixRefl!0 (_2!1864 lt!53447)))))

(assert (=> d!10474 (= lt!53613 (BitStream!1477 (buf!1179 (_2!1864 lt!53437)) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(assert (=> d!10474 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53437))))

(assert (=> d!10474 (= (reader!0 (_2!1864 lt!53447) (_2!1864 lt!53437)) lt!53616)))

(declare-fun b!35906 () Bool)

(declare-fun Unit!2633 () Unit!2629)

(assert (=> b!35906 (= e!23719 Unit!2633)))

(declare-fun b!35907 () Bool)

(declare-fun res!30616 () Bool)

(assert (=> b!35907 (=> (not res!30616) (not e!23720))))

(assert (=> b!35907 (= res!30616 (isPrefixOf!0 (_2!1865 lt!53616) (_2!1864 lt!53437)))))

(assert (= (and d!10474 c!2434) b!35904))

(assert (= (and d!10474 (not c!2434)) b!35906))

(assert (= (and d!10474 res!30618) b!35905))

(assert (= (and b!35905 res!30617) b!35907))

(assert (= (and b!35907 res!30616) b!35903))

(declare-fun m!54009 () Bool)

(assert (=> b!35905 m!54009))

(assert (=> b!35904 m!53883))

(declare-fun m!54011 () Bool)

(assert (=> b!35904 m!54011))

(declare-fun m!54013 () Bool)

(assert (=> b!35904 m!54013))

(declare-fun m!54015 () Bool)

(assert (=> b!35903 m!54015))

(assert (=> b!35903 m!53857))

(assert (=> b!35903 m!53883))

(declare-fun m!54017 () Bool)

(assert (=> d!10474 m!54017))

(assert (=> d!10474 m!53877))

(declare-fun m!54019 () Bool)

(assert (=> d!10474 m!54019))

(declare-fun m!54021 () Bool)

(assert (=> d!10474 m!54021))

(declare-fun m!54023 () Bool)

(assert (=> d!10474 m!54023))

(declare-fun m!54025 () Bool)

(assert (=> d!10474 m!54025))

(declare-fun m!54027 () Bool)

(assert (=> d!10474 m!54027))

(declare-fun m!54029 () Bool)

(assert (=> d!10474 m!54029))

(declare-fun m!54031 () Bool)

(assert (=> d!10474 m!54031))

(declare-fun m!54033 () Bool)

(assert (=> d!10474 m!54033))

(declare-fun m!54035 () Bool)

(assert (=> d!10474 m!54035))

(declare-fun m!54037 () Bool)

(assert (=> b!35907 m!54037))

(assert (=> b!35786 d!10474))

(declare-fun b!35908 () Bool)

(declare-fun e!23722 () tuple2!3562)

(assert (=> b!35908 (= e!23722 (tuple2!3563 Nil!436 (_1!1865 lt!53432)))))

(declare-fun b!35910 () Bool)

(declare-fun e!23721 () Bool)

(declare-fun lt!53626 () List!439)

(assert (=> b!35910 (= e!23721 (isEmpty!99 lt!53626))))

(declare-fun b!35911 () Bool)

(assert (=> b!35911 (= e!23721 (> (length!165 lt!53626) 0))))

(declare-fun lt!53625 () tuple2!3564)

(declare-fun b!35909 () Bool)

(declare-fun lt!53624 () (_ BitVec 64))

(assert (=> b!35909 (= e!23722 (tuple2!3563 (Cons!435 (_1!1869 lt!53625) (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_2!1869 lt!53625) (bvsub lt!53455 lt!53624))) (_2!1869 lt!53625)))))

(assert (=> b!35909 (= lt!53625 (readBit!0 (_1!1865 lt!53432)))))

(assert (=> b!35909 (= lt!53624 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10476 () Bool)

(assert (=> d!10476 e!23721))

(declare-fun c!2436 () Bool)

(assert (=> d!10476 (= c!2436 (= lt!53455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10476 (= lt!53626 (_1!1868 e!23722))))

(declare-fun c!2435 () Bool)

(assert (=> d!10476 (= c!2435 (= lt!53455 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10476 (bvsge lt!53455 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10476 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_1!1865 lt!53432) lt!53455) lt!53626)))

(assert (= (and d!10476 c!2435) b!35908))

(assert (= (and d!10476 (not c!2435)) b!35909))

(assert (= (and d!10476 c!2436) b!35910))

(assert (= (and d!10476 (not c!2436)) b!35911))

(declare-fun m!54039 () Bool)

(assert (=> b!35910 m!54039))

(declare-fun m!54041 () Bool)

(assert (=> b!35911 m!54041))

(declare-fun m!54043 () Bool)

(assert (=> b!35909 m!54043))

(declare-fun m!54045 () Bool)

(assert (=> b!35909 m!54045))

(assert (=> b!35786 d!10476))

(declare-fun lt!53640 () (_ BitVec 64))

(declare-fun e!23724 () Bool)

(declare-fun b!35912 () Bool)

(declare-fun lt!53639 () tuple2!3556)

(declare-fun lt!53645 () (_ BitVec 64))

(assert (=> b!35912 (= e!23724 (= (_1!1865 lt!53639) (withMovedBitIndex!0 (_2!1865 lt!53639) (bvsub lt!53645 lt!53640))))))

(assert (=> b!35912 (or (= (bvand lt!53645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53640 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53645 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53645 lt!53640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!35912 (= lt!53640 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437))))))

(assert (=> b!35912 (= lt!53645 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(declare-fun b!35913 () Bool)

(declare-fun e!23723 () Unit!2629)

(declare-fun lt!53632 () Unit!2629)

(assert (=> b!35913 (= e!23723 lt!53632)))

(declare-fun lt!53630 () (_ BitVec 64))

(assert (=> b!35913 (= lt!53630 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!53643 () (_ BitVec 64))

(assert (=> b!35913 (= lt!53643 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(assert (=> b!35913 (= lt!53632 (arrayBitRangesEqSymmetric!0 (buf!1179 thiss!1379) (buf!1179 (_2!1864 lt!53437)) lt!53630 lt!53643))))

(assert (=> b!35913 (arrayBitRangesEq!0 (buf!1179 (_2!1864 lt!53437)) (buf!1179 thiss!1379) lt!53630 lt!53643)))

(declare-fun b!35914 () Bool)

(declare-fun res!30620 () Bool)

(assert (=> b!35914 (=> (not res!30620) (not e!23724))))

(assert (=> b!35914 (= res!30620 (isPrefixOf!0 (_1!1865 lt!53639) thiss!1379))))

(declare-fun d!10478 () Bool)

(assert (=> d!10478 e!23724))

(declare-fun res!30621 () Bool)

(assert (=> d!10478 (=> (not res!30621) (not e!23724))))

(assert (=> d!10478 (= res!30621 (isPrefixOf!0 (_1!1865 lt!53639) (_2!1865 lt!53639)))))

(declare-fun lt!53636 () BitStream!1476)

(assert (=> d!10478 (= lt!53639 (tuple2!3557 lt!53636 (_2!1864 lt!53437)))))

(declare-fun lt!53629 () Unit!2629)

(declare-fun lt!53628 () Unit!2629)

(assert (=> d!10478 (= lt!53629 lt!53628)))

(assert (=> d!10478 (isPrefixOf!0 lt!53636 (_2!1864 lt!53437))))

(assert (=> d!10478 (= lt!53628 (lemmaIsPrefixTransitive!0 lt!53636 (_2!1864 lt!53437) (_2!1864 lt!53437)))))

(declare-fun lt!53638 () Unit!2629)

(declare-fun lt!53646 () Unit!2629)

(assert (=> d!10478 (= lt!53638 lt!53646)))

(assert (=> d!10478 (isPrefixOf!0 lt!53636 (_2!1864 lt!53437))))

(assert (=> d!10478 (= lt!53646 (lemmaIsPrefixTransitive!0 lt!53636 thiss!1379 (_2!1864 lt!53437)))))

(declare-fun lt!53627 () Unit!2629)

(assert (=> d!10478 (= lt!53627 e!23723)))

(declare-fun c!2437 () Bool)

(assert (=> d!10478 (= c!2437 (not (= (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!53641 () Unit!2629)

(declare-fun lt!53635 () Unit!2629)

(assert (=> d!10478 (= lt!53641 lt!53635)))

(assert (=> d!10478 (isPrefixOf!0 (_2!1864 lt!53437) (_2!1864 lt!53437))))

(assert (=> d!10478 (= lt!53635 (lemmaIsPrefixRefl!0 (_2!1864 lt!53437)))))

(declare-fun lt!53637 () Unit!2629)

(declare-fun lt!53631 () Unit!2629)

(assert (=> d!10478 (= lt!53637 lt!53631)))

(assert (=> d!10478 (= lt!53631 (lemmaIsPrefixRefl!0 (_2!1864 lt!53437)))))

(declare-fun lt!53633 () Unit!2629)

(declare-fun lt!53634 () Unit!2629)

(assert (=> d!10478 (= lt!53633 lt!53634)))

(assert (=> d!10478 (isPrefixOf!0 lt!53636 lt!53636)))

(assert (=> d!10478 (= lt!53634 (lemmaIsPrefixRefl!0 lt!53636))))

(declare-fun lt!53642 () Unit!2629)

(declare-fun lt!53644 () Unit!2629)

(assert (=> d!10478 (= lt!53642 lt!53644)))

(assert (=> d!10478 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10478 (= lt!53644 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10478 (= lt!53636 (BitStream!1477 (buf!1179 (_2!1864 lt!53437)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(assert (=> d!10478 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53437))))

(assert (=> d!10478 (= (reader!0 thiss!1379 (_2!1864 lt!53437)) lt!53639)))

(declare-fun b!35915 () Bool)

(declare-fun Unit!2634 () Unit!2629)

(assert (=> b!35915 (= e!23723 Unit!2634)))

(declare-fun b!35916 () Bool)

(declare-fun res!30619 () Bool)

(assert (=> b!35916 (=> (not res!30619) (not e!23724))))

(assert (=> b!35916 (= res!30619 (isPrefixOf!0 (_2!1865 lt!53639) (_2!1864 lt!53437)))))

(assert (= (and d!10478 c!2437) b!35913))

(assert (= (and d!10478 (not c!2437)) b!35915))

(assert (= (and d!10478 res!30621) b!35914))

(assert (= (and b!35914 res!30620) b!35916))

(assert (= (and b!35916 res!30619) b!35912))

(declare-fun m!54047 () Bool)

(assert (=> b!35914 m!54047))

(assert (=> b!35913 m!53851))

(declare-fun m!54049 () Bool)

(assert (=> b!35913 m!54049))

(declare-fun m!54051 () Bool)

(assert (=> b!35913 m!54051))

(declare-fun m!54053 () Bool)

(assert (=> b!35912 m!54053))

(assert (=> b!35912 m!53857))

(assert (=> b!35912 m!53851))

(declare-fun m!54055 () Bool)

(assert (=> d!10478 m!54055))

(assert (=> d!10478 m!53871))

(declare-fun m!54057 () Bool)

(assert (=> d!10478 m!54057))

(declare-fun m!54059 () Bool)

(assert (=> d!10478 m!54059))

(assert (=> d!10478 m!53847))

(declare-fun m!54061 () Bool)

(assert (=> d!10478 m!54061))

(assert (=> d!10478 m!54027))

(assert (=> d!10478 m!54029))

(declare-fun m!54063 () Bool)

(assert (=> d!10478 m!54063))

(declare-fun m!54065 () Bool)

(assert (=> d!10478 m!54065))

(assert (=> d!10478 m!53849))

(declare-fun m!54067 () Bool)

(assert (=> b!35916 m!54067))

(assert (=> b!35786 d!10478))

(declare-fun b!35917 () Bool)

(declare-fun e!23726 () tuple2!3562)

(assert (=> b!35917 (= e!23726 (tuple2!3563 Nil!436 (_1!1865 lt!53445)))))

(declare-fun b!35919 () Bool)

(declare-fun e!23725 () Bool)

(declare-fun lt!53649 () List!439)

(assert (=> b!35919 (= e!23725 (isEmpty!99 lt!53649))))

(declare-fun b!35920 () Bool)

(assert (=> b!35920 (= e!23725 (> (length!165 lt!53649) 0))))

(declare-fun b!35918 () Bool)

(declare-fun lt!53648 () tuple2!3564)

(declare-fun lt!53647 () (_ BitVec 64))

(assert (=> b!35918 (= e!23726 (tuple2!3563 (Cons!435 (_1!1869 lt!53648) (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_2!1869 lt!53648) (bvsub (bvsub to!314 i!635) lt!53647))) (_2!1869 lt!53648)))))

(assert (=> b!35918 (= lt!53648 (readBit!0 (_1!1865 lt!53445)))))

(assert (=> b!35918 (= lt!53647 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!10480 () Bool)

(assert (=> d!10480 e!23725))

(declare-fun c!2439 () Bool)

(assert (=> d!10480 (= c!2439 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10480 (= lt!53649 (_1!1868 e!23726))))

(declare-fun c!2438 () Bool)

(assert (=> d!10480 (= c!2438 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!10480 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10480 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!53437) (_1!1865 lt!53445) (bvsub to!314 i!635)) lt!53649)))

(assert (= (and d!10480 c!2438) b!35917))

(assert (= (and d!10480 (not c!2438)) b!35918))

(assert (= (and d!10480 c!2439) b!35919))

(assert (= (and d!10480 (not c!2439)) b!35920))

(declare-fun m!54069 () Bool)

(assert (=> b!35919 m!54069))

(declare-fun m!54071 () Bool)

(assert (=> b!35920 m!54071))

(declare-fun m!54073 () Bool)

(assert (=> b!35918 m!54073))

(declare-fun m!54075 () Bool)

(assert (=> b!35918 m!54075))

(assert (=> b!35786 d!10480))

(declare-fun d!10482 () Bool)

(assert (=> d!10482 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2825 () Bool)

(assert (= bs!2825 d!10482))

(declare-fun m!54077 () Bool)

(assert (=> bs!2825 m!54077))

(assert (=> b!35786 d!10482))

(declare-fun d!10484 () Bool)

(assert (=> d!10484 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!53455)))

(declare-fun lt!53650 () Unit!2629)

(assert (=> d!10484 (= lt!53650 (choose!9 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!53437)) lt!53455 (BitStream!1477 (buf!1179 (_2!1864 lt!53437)) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447)))))))

(assert (=> d!10484 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!53437)) lt!53455) lt!53650)))

(declare-fun bs!2826 () Bool)

(assert (= bs!2826 d!10484))

(assert (=> bs!2826 m!53813))

(declare-fun m!54079 () Bool)

(assert (=> bs!2826 m!54079))

(assert (=> b!35786 d!10484))

(declare-fun d!10486 () Bool)

(assert (=> d!10486 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!53455) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53437)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447)))) lt!53455))))

(declare-fun bs!2827 () Bool)

(assert (= bs!2827 d!10486))

(declare-fun m!54081 () Bool)

(assert (=> bs!2827 m!54081))

(assert (=> b!35786 d!10486))

(declare-fun d!10488 () Bool)

(declare-fun res!30630 () Bool)

(declare-fun e!23732 () Bool)

(assert (=> d!10488 (=> (not res!30630) (not e!23732))))

(assert (=> d!10488 (= res!30630 (= (size!851 (buf!1179 thiss!1379)) (size!851 (buf!1179 (_2!1864 lt!53447)))))))

(assert (=> d!10488 (= (isPrefixOf!0 thiss!1379 (_2!1864 lt!53447)) e!23732)))

(declare-fun b!35927 () Bool)

(declare-fun res!30628 () Bool)

(assert (=> b!35927 (=> (not res!30628) (not e!23732))))

(assert (=> b!35927 (= res!30628 (bvsle (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)) (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447)))))))

(declare-fun b!35928 () Bool)

(declare-fun e!23731 () Bool)

(assert (=> b!35928 (= e!23732 e!23731)))

(declare-fun res!30629 () Bool)

(assert (=> b!35928 (=> res!30629 e!23731)))

(assert (=> b!35928 (= res!30629 (= (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!35929 () Bool)

(assert (=> b!35929 (= e!23731 (arrayBitRangesEq!0 (buf!1179 thiss!1379) (buf!1179 (_2!1864 lt!53447)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(assert (= (and d!10488 res!30630) b!35927))

(assert (= (and b!35927 res!30628) b!35928))

(assert (= (and b!35928 (not res!30629)) b!35929))

(assert (=> b!35927 m!53851))

(assert (=> b!35927 m!53883))

(assert (=> b!35929 m!53851))

(assert (=> b!35929 m!53851))

(declare-fun m!54083 () Bool)

(assert (=> b!35929 m!54083))

(assert (=> b!35797 d!10488))

(declare-fun d!10490 () Bool)

(assert (=> d!10490 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!53455) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447)))) lt!53455))))

(declare-fun bs!2828 () Bool)

(assert (= bs!2828 d!10490))

(declare-fun m!54085 () Bool)

(assert (=> bs!2828 m!54085))

(assert (=> b!35797 d!10490))

(declare-fun d!10492 () Bool)

(declare-fun e!23735 () Bool)

(assert (=> d!10492 e!23735))

(declare-fun res!30633 () Bool)

(assert (=> d!10492 (=> (not res!30633) (not e!23735))))

(assert (=> d!10492 (= res!30633 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!53653 () Unit!2629)

(declare-fun choose!27 (BitStream!1476 BitStream!1476 (_ BitVec 64) (_ BitVec 64)) Unit!2629)

(assert (=> d!10492 (= lt!53653 (choose!27 thiss!1379 (_2!1864 lt!53447) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!10492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!10492 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1864 lt!53447) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!53653)))

(declare-fun b!35932 () Bool)

(assert (=> b!35932 (= e!23735 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!10492 res!30633) b!35932))

(declare-fun m!54087 () Bool)

(assert (=> d!10492 m!54087))

(declare-fun m!54089 () Bool)

(assert (=> b!35932 m!54089))

(assert (=> b!35797 d!10492))

(declare-fun b!36024 () Bool)

(declare-fun res!30718 () Bool)

(declare-fun e!23787 () Bool)

(assert (=> b!36024 (=> (not res!30718) (not e!23787))))

(declare-fun lt!53755 () tuple2!3554)

(assert (=> b!36024 (= res!30718 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53755)))))

(declare-fun b!36025 () Bool)

(declare-fun e!23789 () Bool)

(declare-datatypes ((tuple2!3574 0))(
  ( (tuple2!3575 (_1!1874 BitStream!1476) (_2!1874 Bool)) )
))
(declare-fun lt!53753 () tuple2!3574)

(declare-fun lt!53751 () tuple2!3554)

(assert (=> b!36025 (= e!23789 (= (bitIndex!0 (size!851 (buf!1179 (_1!1874 lt!53753))) (currentByte!2564 (_1!1874 lt!53753)) (currentBit!2559 (_1!1874 lt!53753))) (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53751))) (currentByte!2564 (_2!1864 lt!53751)) (currentBit!2559 (_2!1864 lt!53751)))))))

(declare-fun b!36026 () Bool)

(declare-fun e!23790 () Bool)

(assert (=> b!36026 (= e!23790 e!23789)))

(declare-fun res!30721 () Bool)

(assert (=> b!36026 (=> (not res!30721) (not e!23789))))

(declare-fun lt!53759 () (_ BitVec 8))

(assert (=> b!36026 (= res!30721 (and (= (_2!1874 lt!53753) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!53759)) #b00000000000000000000000000000000))) (= (_1!1874 lt!53753) (_2!1864 lt!53751))))))

(declare-datatypes ((tuple2!3576 0))(
  ( (tuple2!3577 (_1!1875 array!1909) (_2!1875 BitStream!1476)) )
))
(declare-fun lt!53756 () tuple2!3576)

(declare-fun lt!53750 () BitStream!1476)

(declare-fun readBits!0 (BitStream!1476 (_ BitVec 64)) tuple2!3576)

(assert (=> b!36026 (= lt!53756 (readBits!0 lt!53750 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1476) tuple2!3574)

(assert (=> b!36026 (= lt!53753 (readBitPure!0 lt!53750))))

(declare-fun readerFrom!0 (BitStream!1476 (_ BitVec 32) (_ BitVec 32)) BitStream!1476)

(assert (=> b!36026 (= lt!53750 (readerFrom!0 (_2!1864 lt!53751) (currentBit!2559 thiss!1379) (currentByte!2564 thiss!1379)))))

(declare-fun b!36027 () Bool)

(declare-fun res!30717 () Bool)

(assert (=> b!36027 (=> (not res!30717) (not e!23787))))

(assert (=> b!36027 (= res!30717 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53755))) (currentByte!2564 (_2!1864 lt!53755)) (currentBit!2559 (_2!1864 lt!53755))) (bvadd (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!36028 () Bool)

(declare-fun e!23788 () Bool)

(declare-fun lt!53757 () tuple2!3574)

(assert (=> b!36028 (= e!23788 (= (bitIndex!0 (size!851 (buf!1179 (_1!1874 lt!53757))) (currentByte!2564 (_1!1874 lt!53757)) (currentBit!2559 (_1!1874 lt!53757))) (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53755))) (currentByte!2564 (_2!1864 lt!53755)) (currentBit!2559 (_2!1864 lt!53755)))))))

(declare-fun b!36029 () Bool)

(assert (=> b!36029 (= e!23787 e!23788)))

(declare-fun res!30716 () Bool)

(assert (=> b!36029 (=> (not res!30716) (not e!23788))))

(declare-fun lt!53754 () Bool)

(assert (=> b!36029 (= res!30716 (and (= (_2!1874 lt!53757) lt!53754) (= (_1!1874 lt!53757) (_2!1864 lt!53755))))))

(assert (=> b!36029 (= lt!53757 (readBitPure!0 (readerFrom!0 (_2!1864 lt!53755) (currentBit!2559 thiss!1379) (currentByte!2564 thiss!1379))))))

(declare-fun d!10496 () Bool)

(assert (=> d!10496 e!23790))

(declare-fun res!30720 () Bool)

(assert (=> d!10496 (=> (not res!30720) (not e!23790))))

(assert (=> d!10496 (= res!30720 (= (size!851 (buf!1179 (_2!1864 lt!53751))) (size!851 (buf!1179 thiss!1379))))))

(declare-fun lt!53748 () array!1909)

(assert (=> d!10496 (= lt!53759 (select (arr!1335 lt!53748) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!10496 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!851 lt!53748)))))

(assert (=> d!10496 (= lt!53748 (array!1910 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!53749 () tuple2!3554)

(assert (=> d!10496 (= lt!53751 (tuple2!3555 (_1!1864 lt!53749) (_2!1864 lt!53749)))))

(assert (=> d!10496 (= lt!53749 lt!53755)))

(assert (=> d!10496 e!23787))

(declare-fun res!30719 () Bool)

(assert (=> d!10496 (=> (not res!30719) (not e!23787))))

(assert (=> d!10496 (= res!30719 (= (size!851 (buf!1179 thiss!1379)) (size!851 (buf!1179 (_2!1864 lt!53755)))))))

(declare-fun appendBit!0 (BitStream!1476 Bool) tuple2!3554)

(assert (=> d!10496 (= lt!53755 (appendBit!0 thiss!1379 lt!53754))))

(assert (=> d!10496 (= lt!53754 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!10496 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!10496 (= (appendBitFromByte!0 thiss!1379 (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!53751)))

(declare-fun b!36030 () Bool)

(declare-fun res!30722 () Bool)

(assert (=> b!36030 (=> (not res!30722) (not e!23790))))

(declare-fun lt!53752 () (_ BitVec 64))

(declare-fun lt!53758 () (_ BitVec 64))

(assert (=> b!36030 (= res!30722 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53751))) (currentByte!2564 (_2!1864 lt!53751)) (currentBit!2559 (_2!1864 lt!53751))) (bvadd lt!53752 lt!53758)))))

(assert (=> b!36030 (or (not (= (bvand lt!53752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53758 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!53752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!53752 lt!53758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36030 (= lt!53758 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!36030 (= lt!53752 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(declare-fun b!36031 () Bool)

(declare-fun res!30723 () Bool)

(assert (=> b!36031 (=> (not res!30723) (not e!23790))))

(assert (=> b!36031 (= res!30723 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53751)))))

(assert (= (and d!10496 res!30719) b!36027))

(assert (= (and b!36027 res!30717) b!36024))

(assert (= (and b!36024 res!30718) b!36029))

(assert (= (and b!36029 res!30716) b!36028))

(assert (= (and d!10496 res!30720) b!36030))

(assert (= (and b!36030 res!30722) b!36031))

(assert (= (and b!36031 res!30723) b!36026))

(assert (= (and b!36026 res!30721) b!36025))

(declare-fun m!54143 () Bool)

(assert (=> b!36031 m!54143))

(declare-fun m!54145 () Bool)

(assert (=> b!36025 m!54145))

(declare-fun m!54147 () Bool)

(assert (=> b!36025 m!54147))

(declare-fun m!54149 () Bool)

(assert (=> b!36028 m!54149))

(declare-fun m!54151 () Bool)

(assert (=> b!36028 m!54151))

(assert (=> b!36030 m!54147))

(assert (=> b!36030 m!53851))

(declare-fun m!54153 () Bool)

(assert (=> b!36029 m!54153))

(assert (=> b!36029 m!54153))

(declare-fun m!54155 () Bool)

(assert (=> b!36029 m!54155))

(declare-fun m!54157 () Bool)

(assert (=> d!10496 m!54157))

(declare-fun m!54159 () Bool)

(assert (=> d!10496 m!54159))

(assert (=> d!10496 m!53985))

(declare-fun m!54161 () Bool)

(assert (=> b!36026 m!54161))

(declare-fun m!54163 () Bool)

(assert (=> b!36026 m!54163))

(declare-fun m!54165 () Bool)

(assert (=> b!36026 m!54165))

(declare-fun m!54167 () Bool)

(assert (=> b!36024 m!54167))

(assert (=> b!36027 m!54151))

(assert (=> b!36027 m!53851))

(assert (=> b!35797 d!10496))

(declare-fun d!10526 () Bool)

(declare-fun size!854 (List!439) Int)

(assert (=> d!10526 (= (length!165 lt!53448) (size!854 lt!53448))))

(declare-fun bs!2832 () Bool)

(assert (= bs!2832 d!10526))

(declare-fun m!54169 () Bool)

(assert (=> bs!2832 m!54169))

(assert (=> b!35785 d!10526))

(declare-fun d!10528 () Bool)

(assert (=> d!10528 (= (bitAt!0 (buf!1179 (_1!1865 lt!53432)) lt!53434) (not (= (bvand ((_ sign_extend 24) (select (arr!1335 (buf!1179 (_1!1865 lt!53432))) ((_ extract 31 0) (bvsdiv lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2833 () Bool)

(assert (= bs!2833 d!10528))

(declare-fun m!54171 () Bool)

(assert (=> bs!2833 m!54171))

(declare-fun m!54173 () Bool)

(assert (=> bs!2833 m!54173))

(assert (=> b!35784 d!10528))

(declare-fun d!10530 () Bool)

(assert (=> d!10530 (= (bitAt!0 (buf!1179 (_1!1865 lt!53445)) lt!53434) (not (= (bvand ((_ sign_extend 24) (select (arr!1335 (buf!1179 (_1!1865 lt!53445))) ((_ extract 31 0) (bvsdiv lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2835 () Bool)

(assert (= bs!2835 d!10530))

(declare-fun m!54179 () Bool)

(assert (=> bs!2835 m!54179))

(assert (=> bs!2835 m!54173))

(assert (=> b!35784 d!10530))

(declare-fun d!10534 () Bool)

(declare-fun e!23792 () Bool)

(assert (=> d!10534 e!23792))

(declare-fun res!30725 () Bool)

(assert (=> d!10534 (=> (not res!30725) (not e!23792))))

(declare-fun lt!53765 () (_ BitVec 64))

(declare-fun lt!53764 () (_ BitVec 64))

(declare-fun lt!53767 () (_ BitVec 64))

(assert (=> d!10534 (= res!30725 (= lt!53764 (bvsub lt!53765 lt!53767)))))

(assert (=> d!10534 (or (= (bvand lt!53765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!53767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!53765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!53765 lt!53767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10534 (= lt!53767 (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447)))))))

(declare-fun lt!53762 () (_ BitVec 64))

(declare-fun lt!53766 () (_ BitVec 64))

(assert (=> d!10534 (= lt!53765 (bvmul lt!53762 lt!53766))))

(assert (=> d!10534 (or (= lt!53762 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!53766 (bvsdiv (bvmul lt!53762 lt!53766) lt!53762)))))

(assert (=> d!10534 (= lt!53766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10534 (= lt!53762 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))))))

(assert (=> d!10534 (= lt!53764 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447)))))))

(assert (=> d!10534 (invariant!0 (currentBit!2559 (_2!1864 lt!53447)) (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53447))))))

(assert (=> d!10534 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))) lt!53764)))

(declare-fun b!36033 () Bool)

(declare-fun res!30726 () Bool)

(assert (=> b!36033 (=> (not res!30726) (not e!23792))))

(assert (=> b!36033 (= res!30726 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53764))))

(declare-fun b!36034 () Bool)

(declare-fun lt!53763 () (_ BitVec 64))

(assert (=> b!36034 (= e!23792 (bvsle lt!53764 (bvmul lt!53763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36034 (or (= lt!53763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!53763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!53763)))))

(assert (=> b!36034 (= lt!53763 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))))))

(assert (= (and d!10534 res!30725) b!36033))

(assert (= (and b!36033 res!30726) b!36034))

(assert (=> d!10534 m!54085))

(assert (=> d!10534 m!53841))

(assert (=> b!35795 d!10534))

(declare-fun d!10538 () Bool)

(assert (=> d!10538 (= (bitAt!0 (buf!1179 (_2!1864 lt!53447)) lt!53434) (not (= (bvand ((_ sign_extend 24) (select (arr!1335 (buf!1179 (_2!1864 lt!53447))) ((_ extract 31 0) (bvsdiv lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2837 () Bool)

(assert (= bs!2837 d!10538))

(declare-fun m!54183 () Bool)

(assert (=> bs!2837 m!54183))

(assert (=> bs!2837 m!54173))

(assert (=> b!35794 d!10538))

(declare-fun d!10542 () Bool)

(assert (=> d!10542 (= (invariant!0 (currentBit!2559 (_2!1864 lt!53437)) (currentByte!2564 (_2!1864 lt!53437)) (size!851 (buf!1179 (_2!1864 lt!53437)))) (and (bvsge (currentBit!2559 (_2!1864 lt!53437)) #b00000000000000000000000000000000) (bvslt (currentBit!2559 (_2!1864 lt!53437)) #b00000000000000000000000000001000) (bvsge (currentByte!2564 (_2!1864 lt!53437)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2564 (_2!1864 lt!53437)) (size!851 (buf!1179 (_2!1864 lt!53437)))) (and (= (currentBit!2559 (_2!1864 lt!53437)) #b00000000000000000000000000000000) (= (currentByte!2564 (_2!1864 lt!53437)) (size!851 (buf!1179 (_2!1864 lt!53437))))))))))

(assert (=> b!35783 d!10542))

(declare-fun d!10544 () Bool)

(assert (=> d!10544 (= (invariant!0 (currentBit!2559 (_2!1864 lt!53447)) (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53437)))) (and (bvsge (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (bvslt (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000001000) (bvsge (currentByte!2564 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53437)))) (and (= (currentBit!2559 (_2!1864 lt!53447)) #b00000000000000000000000000000000) (= (currentByte!2564 (_2!1864 lt!53447)) (size!851 (buf!1179 (_2!1864 lt!53437))))))))))

(assert (=> b!35782 d!10544))

(declare-fun d!10546 () Bool)

(assert (=> d!10546 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53437))))

(declare-fun lt!53782 () Unit!2629)

(declare-fun choose!30 (BitStream!1476 BitStream!1476 BitStream!1476) Unit!2629)

(assert (=> d!10546 (= lt!53782 (choose!30 thiss!1379 (_2!1864 lt!53447) (_2!1864 lt!53437)))))

(assert (=> d!10546 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53447))))

(assert (=> d!10546 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1864 lt!53447) (_2!1864 lt!53437)) lt!53782)))

(declare-fun bs!2840 () Bool)

(assert (= bs!2840 d!10546))

(assert (=> bs!2840 m!53871))

(declare-fun m!54219 () Bool)

(assert (=> bs!2840 m!54219))

(assert (=> bs!2840 m!53793))

(assert (=> b!35793 d!10546))

(declare-fun b!36183 () Bool)

(declare-fun res!30810 () Bool)

(declare-fun e!23864 () Bool)

(assert (=> b!36183 (=> (not res!30810) (not e!23864))))

(declare-fun lt!54184 () tuple2!3554)

(assert (=> b!36183 (= res!30810 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!54184)))))

(declare-fun c!2477 () Bool)

(declare-fun bm!445 () Bool)

(declare-fun call!448 () tuple2!3556)

(declare-fun lt!54220 () tuple2!3554)

(assert (=> bm!445 (= call!448 (reader!0 (_2!1864 lt!53447) (ite c!2477 (_2!1864 lt!54220) (_2!1864 lt!53447))))))

(declare-fun b!36184 () Bool)

(declare-fun e!23865 () tuple2!3554)

(declare-fun Unit!2637 () Unit!2629)

(assert (=> b!36184 (= e!23865 (tuple2!3555 Unit!2637 (_2!1864 lt!53447)))))

(assert (=> b!36184 (= (size!851 (buf!1179 (_2!1864 lt!53447))) (size!851 (buf!1179 (_2!1864 lt!53447))))))

(declare-fun lt!54210 () Unit!2629)

(declare-fun Unit!2638 () Unit!2629)

(assert (=> b!36184 (= lt!54210 Unit!2638)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1476 array!1909 array!1909 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!36184 (checkByteArrayBitContent!0 (_2!1864 lt!53447) srcBuffer!2 (_1!1875 (readBits!0 (_1!1865 call!448) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!36185 () Bool)

(declare-fun res!30812 () Bool)

(assert (=> b!36185 (=> (not res!30812) (not e!23864))))

(assert (=> b!36185 (= res!30812 (= (size!851 (buf!1179 (_2!1864 lt!53447))) (size!851 (buf!1179 (_2!1864 lt!54184)))))))

(declare-fun b!36186 () Bool)

(declare-fun res!30808 () Bool)

(assert (=> b!36186 (=> (not res!30808) (not e!23864))))

(assert (=> b!36186 (= res!30808 (= (size!851 (buf!1179 (_2!1864 lt!54184))) (size!851 (buf!1179 (_2!1864 lt!53447)))))))

(declare-fun b!36187 () Bool)

(declare-fun res!30811 () Bool)

(assert (=> b!36187 (=> (not res!30811) (not e!23864))))

(assert (=> b!36187 (= res!30811 (invariant!0 (currentBit!2559 (_2!1864 lt!54184)) (currentByte!2564 (_2!1864 lt!54184)) (size!851 (buf!1179 (_2!1864 lt!54184)))))))

(declare-fun d!10558 () Bool)

(assert (=> d!10558 e!23864))

(declare-fun res!30807 () Bool)

(assert (=> d!10558 (=> (not res!30807) (not e!23864))))

(declare-fun lt!54192 () (_ BitVec 64))

(assert (=> d!10558 (= res!30807 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!54184))) (currentByte!2564 (_2!1864 lt!54184)) (currentBit!2559 (_2!1864 lt!54184))) (bvsub lt!54192 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!10558 (or (= (bvand lt!54192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54192 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54218 () (_ BitVec 64))

(assert (=> d!10558 (= lt!54192 (bvadd lt!54218 to!314))))

(assert (=> d!10558 (or (not (= (bvand lt!54218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!54218 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!54218 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10558 (= lt!54218 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(assert (=> d!10558 (= lt!54184 e!23865)))

(assert (=> d!10558 (= c!2477 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!54179 () Unit!2629)

(declare-fun lt!54201 () Unit!2629)

(assert (=> d!10558 (= lt!54179 lt!54201)))

(assert (=> d!10558 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53447))))

(assert (=> d!10558 (= lt!54201 (lemmaIsPrefixRefl!0 (_2!1864 lt!53447)))))

(declare-fun lt!54203 () (_ BitVec 64))

(assert (=> d!10558 (= lt!54203 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(assert (=> d!10558 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!10558 (= (appendBitsMSBFirstLoop!0 (_2!1864 lt!53447) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!54184)))

(declare-fun b!36188 () Bool)

(declare-fun e!23863 () Bool)

(declare-fun lt!54180 () (_ BitVec 64))

(assert (=> b!36188 (= e!23863 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!54180))))

(declare-fun b!36189 () Bool)

(declare-fun lt!54208 () tuple2!3556)

(assert (=> b!36189 (= e!23864 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!54184) (_1!1865 lt!54208) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1864 lt!54184) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!36189 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36189 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!54182 () Unit!2629)

(declare-fun lt!54191 () Unit!2629)

(assert (=> b!36189 (= lt!54182 lt!54191)))

(assert (=> b!36189 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!54184)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!54180)))

(assert (=> b!36189 (= lt!54191 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!54184)) lt!54180))))

(assert (=> b!36189 e!23863))

(declare-fun res!30809 () Bool)

(assert (=> b!36189 (=> (not res!30809) (not e!23863))))

(assert (=> b!36189 (= res!30809 (and (= (size!851 (buf!1179 (_2!1864 lt!53447))) (size!851 (buf!1179 (_2!1864 lt!54184)))) (bvsge lt!54180 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36189 (= lt!54180 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!36189 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36189 (= lt!54208 (reader!0 (_2!1864 lt!53447) (_2!1864 lt!54184)))))

(declare-fun b!36190 () Bool)

(declare-fun lt!54212 () tuple2!3554)

(declare-fun Unit!2640 () Unit!2629)

(assert (=> b!36190 (= e!23865 (tuple2!3555 Unit!2640 (_2!1864 lt!54212)))))

(assert (=> b!36190 (= lt!54220 (appendBitFromByte!0 (_2!1864 lt!53447) (select (arr!1335 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!54217 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54217 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54196 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54196 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54195 () Unit!2629)

(assert (=> b!36190 (= lt!54195 (validateOffsetBitsIneqLemma!0 (_2!1864 lt!53447) (_2!1864 lt!54220) lt!54217 lt!54196))))

(assert (=> b!36190 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!54220)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!54220))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!54220))) (bvsub lt!54217 lt!54196))))

(declare-fun lt!54181 () Unit!2629)

(assert (=> b!36190 (= lt!54181 lt!54195)))

(declare-fun lt!54222 () tuple2!3556)

(assert (=> b!36190 (= lt!54222 call!448)))

(declare-fun lt!54215 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54215 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54186 () Unit!2629)

(assert (=> b!36190 (= lt!54186 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!54220)) lt!54215))))

(assert (=> b!36190 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!54220)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!54215)))

(declare-fun lt!54213 () Unit!2629)

(assert (=> b!36190 (= lt!54213 lt!54186)))

(assert (=> b!36190 (= (head!276 (byteArrayBitContentToList!0 (_2!1864 lt!54220) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!276 (bitStreamReadBitsIntoList!0 (_2!1864 lt!54220) (_1!1865 lt!54222) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54200 () Unit!2629)

(declare-fun Unit!2641 () Unit!2629)

(assert (=> b!36190 (= lt!54200 Unit!2641)))

(assert (=> b!36190 (= lt!54212 (appendBitsMSBFirstLoop!0 (_2!1864 lt!54220) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!54206 () Unit!2629)

(assert (=> b!36190 (= lt!54206 (lemmaIsPrefixTransitive!0 (_2!1864 lt!53447) (_2!1864 lt!54220) (_2!1864 lt!54212)))))

(assert (=> b!36190 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!54212))))

(declare-fun lt!54205 () Unit!2629)

(assert (=> b!36190 (= lt!54205 lt!54206)))

(assert (=> b!36190 (= (size!851 (buf!1179 (_2!1864 lt!54212))) (size!851 (buf!1179 (_2!1864 lt!53447))))))

(declare-fun lt!54216 () Unit!2629)

(declare-fun Unit!2643 () Unit!2629)

(assert (=> b!36190 (= lt!54216 Unit!2643)))

(assert (=> b!36190 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!54212))) (currentByte!2564 (_2!1864 lt!54212)) (currentBit!2559 (_2!1864 lt!54212))) (bvsub (bvadd (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54194 () Unit!2629)

(declare-fun Unit!2644 () Unit!2629)

(assert (=> b!36190 (= lt!54194 Unit!2644)))

(assert (=> b!36190 (= (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!54212))) (currentByte!2564 (_2!1864 lt!54212)) (currentBit!2559 (_2!1864 lt!54212))) (bvsub (bvsub (bvadd (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!54220))) (currentByte!2564 (_2!1864 lt!54220)) (currentBit!2559 (_2!1864 lt!54220))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54202 () Unit!2629)

(declare-fun Unit!2645 () Unit!2629)

(assert (=> b!36190 (= lt!54202 Unit!2645)))

(declare-fun lt!54193 () tuple2!3556)

(assert (=> b!36190 (= lt!54193 (reader!0 (_2!1864 lt!53447) (_2!1864 lt!54212)))))

(declare-fun lt!54211 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54211 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54199 () Unit!2629)

(assert (=> b!36190 (= lt!54199 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!53447) (buf!1179 (_2!1864 lt!54212)) lt!54211))))

(assert (=> b!36190 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!54212)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!53447))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!53447))) lt!54211)))

(declare-fun lt!54188 () Unit!2629)

(assert (=> b!36190 (= lt!54188 lt!54199)))

(declare-fun lt!54183 () tuple2!3556)

(assert (=> b!36190 (= lt!54183 (reader!0 (_2!1864 lt!54220) (_2!1864 lt!54212)))))

(declare-fun lt!54185 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54185 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!54221 () Unit!2629)

(assert (=> b!36190 (= lt!54221 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1864 lt!54220) (buf!1179 (_2!1864 lt!54212)) lt!54185))))

(assert (=> b!36190 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!54212)))) ((_ sign_extend 32) (currentByte!2564 (_2!1864 lt!54220))) ((_ sign_extend 32) (currentBit!2559 (_2!1864 lt!54220))) lt!54185)))

(declare-fun lt!54197 () Unit!2629)

(assert (=> b!36190 (= lt!54197 lt!54221)))

(declare-fun lt!54207 () List!439)

(assert (=> b!36190 (= lt!54207 (byteArrayBitContentToList!0 (_2!1864 lt!54212) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54189 () List!439)

(assert (=> b!36190 (= lt!54189 (byteArrayBitContentToList!0 (_2!1864 lt!54212) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54187 () List!439)

(assert (=> b!36190 (= lt!54187 (bitStreamReadBitsIntoList!0 (_2!1864 lt!54212) (_1!1865 lt!54193) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!54204 () List!439)

(assert (=> b!36190 (= lt!54204 (bitStreamReadBitsIntoList!0 (_2!1864 lt!54212) (_1!1865 lt!54183) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!54190 () (_ BitVec 64))

(assert (=> b!36190 (= lt!54190 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!54214 () Unit!2629)

(assert (=> b!36190 (= lt!54214 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1864 lt!54212) (_2!1864 lt!54212) (_1!1865 lt!54193) (_1!1865 lt!54183) lt!54190 lt!54187))))

(assert (=> b!36190 (= (bitStreamReadBitsIntoList!0 (_2!1864 lt!54212) (_1!1865 lt!54183) (bvsub lt!54190 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!156 lt!54187))))

(declare-fun lt!54198 () Unit!2629)

(assert (=> b!36190 (= lt!54198 lt!54214)))

(declare-fun lt!54219 () Unit!2629)

(assert (=> b!36190 (= lt!54219 (arrayBitRangesEqImpliesEq!0 (buf!1179 (_2!1864 lt!54220)) (buf!1179 (_2!1864 lt!54212)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!54203 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!54220))) (currentByte!2564 (_2!1864 lt!54220)) (currentBit!2559 (_2!1864 lt!54220)))))))

(assert (=> b!36190 (= (bitAt!0 (buf!1179 (_2!1864 lt!54220)) lt!54203) (bitAt!0 (buf!1179 (_2!1864 lt!54212)) lt!54203))))

(declare-fun lt!54209 () Unit!2629)

(assert (=> b!36190 (= lt!54209 lt!54219)))

(assert (= (and d!10558 c!2477) b!36190))

(assert (= (and d!10558 (not c!2477)) b!36184))

(assert (= (or b!36190 b!36184) bm!445))

(assert (= (and d!10558 res!30807) b!36187))

(assert (= (and b!36187 res!30811) b!36185))

(assert (= (and b!36185 res!30812) b!36183))

(assert (= (and b!36183 res!30810) b!36186))

(assert (= (and b!36186 res!30808) b!36189))

(assert (= (and b!36189 res!30809) b!36188))

(declare-fun m!54465 () Bool)

(assert (=> b!36184 m!54465))

(declare-fun m!54467 () Bool)

(assert (=> b!36184 m!54467))

(declare-fun m!54469 () Bool)

(assert (=> b!36189 m!54469))

(declare-fun m!54471 () Bool)

(assert (=> b!36189 m!54471))

(declare-fun m!54473 () Bool)

(assert (=> b!36189 m!54473))

(declare-fun m!54475 () Bool)

(assert (=> b!36189 m!54475))

(declare-fun m!54477 () Bool)

(assert (=> b!36189 m!54477))

(declare-fun m!54479 () Bool)

(assert (=> d!10558 m!54479))

(assert (=> d!10558 m!53883))

(assert (=> d!10558 m!54023))

(assert (=> d!10558 m!54035))

(declare-fun m!54481 () Bool)

(assert (=> b!36183 m!54481))

(declare-fun m!54483 () Bool)

(assert (=> b!36190 m!54483))

(declare-fun m!54485 () Bool)

(assert (=> b!36190 m!54485))

(declare-fun m!54487 () Bool)

(assert (=> b!36190 m!54487))

(declare-fun m!54489 () Bool)

(assert (=> b!36190 m!54489))

(declare-fun m!54491 () Bool)

(assert (=> b!36190 m!54491))

(declare-fun m!54493 () Bool)

(assert (=> b!36190 m!54493))

(declare-fun m!54495 () Bool)

(assert (=> b!36190 m!54495))

(declare-fun m!54497 () Bool)

(assert (=> b!36190 m!54497))

(declare-fun m!54499 () Bool)

(assert (=> b!36190 m!54499))

(declare-fun m!54501 () Bool)

(assert (=> b!36190 m!54501))

(declare-fun m!54503 () Bool)

(assert (=> b!36190 m!54503))

(declare-fun m!54505 () Bool)

(assert (=> b!36190 m!54505))

(declare-fun m!54507 () Bool)

(assert (=> b!36190 m!54507))

(declare-fun m!54509 () Bool)

(assert (=> b!36190 m!54509))

(declare-fun m!54511 () Bool)

(assert (=> b!36190 m!54511))

(declare-fun m!54513 () Bool)

(assert (=> b!36190 m!54513))

(declare-fun m!54515 () Bool)

(assert (=> b!36190 m!54515))

(declare-fun m!54517 () Bool)

(assert (=> b!36190 m!54517))

(assert (=> b!36190 m!53883))

(declare-fun m!54519 () Bool)

(assert (=> b!36190 m!54519))

(declare-fun m!54521 () Bool)

(assert (=> b!36190 m!54521))

(declare-fun m!54523 () Bool)

(assert (=> b!36190 m!54523))

(declare-fun m!54525 () Bool)

(assert (=> b!36190 m!54525))

(assert (=> b!36190 m!54499))

(declare-fun m!54527 () Bool)

(assert (=> b!36190 m!54527))

(assert (=> b!36190 m!54519))

(declare-fun m!54529 () Bool)

(assert (=> b!36190 m!54529))

(declare-fun m!54531 () Bool)

(assert (=> b!36190 m!54531))

(declare-fun m!54533 () Bool)

(assert (=> b!36190 m!54533))

(declare-fun m!54535 () Bool)

(assert (=> b!36190 m!54535))

(declare-fun m!54537 () Bool)

(assert (=> b!36190 m!54537))

(declare-fun m!54539 () Bool)

(assert (=> b!36190 m!54539))

(assert (=> b!36190 m!54523))

(declare-fun m!54541 () Bool)

(assert (=> b!36190 m!54541))

(assert (=> b!36190 m!54497))

(declare-fun m!54543 () Bool)

(assert (=> b!36190 m!54543))

(declare-fun m!54545 () Bool)

(assert (=> b!36188 m!54545))

(declare-fun m!54547 () Bool)

(assert (=> b!36187 m!54547))

(declare-fun m!54549 () Bool)

(assert (=> bm!445 m!54549))

(assert (=> b!35793 d!10558))

(declare-fun lt!54257 () (_ BitVec 64))

(declare-fun e!23869 () Bool)

(declare-fun lt!54251 () tuple2!3556)

(declare-fun b!36197 () Bool)

(declare-fun lt!54252 () (_ BitVec 64))

(assert (=> b!36197 (= e!23869 (= (_1!1865 lt!54251) (withMovedBitIndex!0 (_2!1865 lt!54251) (bvsub lt!54257 lt!54252))))))

(assert (=> b!36197 (or (= (bvand lt!54257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54252 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54257 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54257 lt!54252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!36197 (= lt!54252 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))))))

(assert (=> b!36197 (= lt!54257 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(declare-fun b!36198 () Bool)

(declare-fun e!23867 () Unit!2629)

(declare-fun lt!54244 () Unit!2629)

(assert (=> b!36198 (= e!23867 lt!54244)))

(declare-fun lt!54242 () (_ BitVec 64))

(assert (=> b!36198 (= lt!54242 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!54255 () (_ BitVec 64))

(assert (=> b!36198 (= lt!54255 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(assert (=> b!36198 (= lt!54244 (arrayBitRangesEqSymmetric!0 (buf!1179 thiss!1379) (buf!1179 (_2!1864 lt!53447)) lt!54242 lt!54255))))

(assert (=> b!36198 (arrayBitRangesEq!0 (buf!1179 (_2!1864 lt!53447)) (buf!1179 thiss!1379) lt!54242 lt!54255)))

(declare-fun b!36199 () Bool)

(declare-fun res!30814 () Bool)

(assert (=> b!36199 (=> (not res!30814) (not e!23869))))

(assert (=> b!36199 (= res!30814 (isPrefixOf!0 (_1!1865 lt!54251) thiss!1379))))

(declare-fun d!10662 () Bool)

(assert (=> d!10662 e!23869))

(declare-fun res!30815 () Bool)

(assert (=> d!10662 (=> (not res!30815) (not e!23869))))

(assert (=> d!10662 (= res!30815 (isPrefixOf!0 (_1!1865 lt!54251) (_2!1865 lt!54251)))))

(declare-fun lt!54248 () BitStream!1476)

(assert (=> d!10662 (= lt!54251 (tuple2!3557 lt!54248 (_2!1864 lt!53447)))))

(declare-fun lt!54241 () Unit!2629)

(declare-fun lt!54240 () Unit!2629)

(assert (=> d!10662 (= lt!54241 lt!54240)))

(assert (=> d!10662 (isPrefixOf!0 lt!54248 (_2!1864 lt!53447))))

(assert (=> d!10662 (= lt!54240 (lemmaIsPrefixTransitive!0 lt!54248 (_2!1864 lt!53447) (_2!1864 lt!53447)))))

(declare-fun lt!54250 () Unit!2629)

(declare-fun lt!54258 () Unit!2629)

(assert (=> d!10662 (= lt!54250 lt!54258)))

(assert (=> d!10662 (isPrefixOf!0 lt!54248 (_2!1864 lt!53447))))

(assert (=> d!10662 (= lt!54258 (lemmaIsPrefixTransitive!0 lt!54248 thiss!1379 (_2!1864 lt!53447)))))

(declare-fun lt!54239 () Unit!2629)

(assert (=> d!10662 (= lt!54239 e!23867)))

(declare-fun c!2479 () Bool)

(assert (=> d!10662 (= c!2479 (not (= (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!54253 () Unit!2629)

(declare-fun lt!54247 () Unit!2629)

(assert (=> d!10662 (= lt!54253 lt!54247)))

(assert (=> d!10662 (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53447))))

(assert (=> d!10662 (= lt!54247 (lemmaIsPrefixRefl!0 (_2!1864 lt!53447)))))

(declare-fun lt!54249 () Unit!2629)

(declare-fun lt!54243 () Unit!2629)

(assert (=> d!10662 (= lt!54249 lt!54243)))

(assert (=> d!10662 (= lt!54243 (lemmaIsPrefixRefl!0 (_2!1864 lt!53447)))))

(declare-fun lt!54245 () Unit!2629)

(declare-fun lt!54246 () Unit!2629)

(assert (=> d!10662 (= lt!54245 lt!54246)))

(assert (=> d!10662 (isPrefixOf!0 lt!54248 lt!54248)))

(assert (=> d!10662 (= lt!54246 (lemmaIsPrefixRefl!0 lt!54248))))

(declare-fun lt!54254 () Unit!2629)

(declare-fun lt!54256 () Unit!2629)

(assert (=> d!10662 (= lt!54254 lt!54256)))

(assert (=> d!10662 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!10662 (= lt!54256 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!10662 (= lt!54248 (BitStream!1477 (buf!1179 (_2!1864 lt!53447)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)))))

(assert (=> d!10662 (isPrefixOf!0 thiss!1379 (_2!1864 lt!53447))))

(assert (=> d!10662 (= (reader!0 thiss!1379 (_2!1864 lt!53447)) lt!54251)))

(declare-fun b!36200 () Bool)

(declare-fun Unit!2646 () Unit!2629)

(assert (=> b!36200 (= e!23867 Unit!2646)))

(declare-fun b!36201 () Bool)

(declare-fun res!30813 () Bool)

(assert (=> b!36201 (=> (not res!30813) (not e!23869))))

(assert (=> b!36201 (= res!30813 (isPrefixOf!0 (_2!1865 lt!54251) (_2!1864 lt!53447)))))

(assert (= (and d!10662 c!2479) b!36198))

(assert (= (and d!10662 (not c!2479)) b!36200))

(assert (= (and d!10662 res!30815) b!36199))

(assert (= (and b!36199 res!30814) b!36201))

(assert (= (and b!36201 res!30813) b!36197))

(declare-fun m!54551 () Bool)

(assert (=> b!36199 m!54551))

(assert (=> b!36198 m!53851))

(declare-fun m!54553 () Bool)

(assert (=> b!36198 m!54553))

(declare-fun m!54555 () Bool)

(assert (=> b!36198 m!54555))

(declare-fun m!54557 () Bool)

(assert (=> b!36197 m!54557))

(assert (=> b!36197 m!53883))

(assert (=> b!36197 m!53851))

(declare-fun m!54559 () Bool)

(assert (=> d!10662 m!54559))

(assert (=> d!10662 m!53793))

(declare-fun m!54561 () Bool)

(assert (=> d!10662 m!54561))

(declare-fun m!54563 () Bool)

(assert (=> d!10662 m!54563))

(assert (=> d!10662 m!53847))

(declare-fun m!54565 () Bool)

(assert (=> d!10662 m!54565))

(assert (=> d!10662 m!54023))

(assert (=> d!10662 m!54035))

(declare-fun m!54567 () Bool)

(assert (=> d!10662 m!54567))

(declare-fun m!54569 () Bool)

(assert (=> d!10662 m!54569))

(assert (=> d!10662 m!53849))

(declare-fun m!54571 () Bool)

(assert (=> b!36201 m!54571))

(assert (=> b!35793 d!10662))

(declare-fun d!10664 () Bool)

(declare-fun res!30818 () Bool)

(declare-fun e!23873 () Bool)

(assert (=> d!10664 (=> (not res!30818) (not e!23873))))

(assert (=> d!10664 (= res!30818 (= (size!851 (buf!1179 thiss!1379)) (size!851 (buf!1179 (_2!1864 lt!53437)))))))

(assert (=> d!10664 (= (isPrefixOf!0 thiss!1379 (_2!1864 lt!53437)) e!23873)))

(declare-fun b!36204 () Bool)

(declare-fun res!30816 () Bool)

(assert (=> b!36204 (=> (not res!30816) (not e!23873))))

(assert (=> b!36204 (= res!30816 (bvsle (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)) (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437)))))))

(declare-fun b!36205 () Bool)

(declare-fun e!23872 () Bool)

(assert (=> b!36205 (= e!23873 e!23872)))

(declare-fun res!30817 () Bool)

(assert (=> b!36205 (=> res!30817 e!23872)))

(assert (=> b!36205 (= res!30817 (= (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36206 () Bool)

(assert (=> b!36206 (= e!23872 (arrayBitRangesEq!0 (buf!1179 thiss!1379) (buf!1179 (_2!1864 lt!53437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(assert (= (and d!10664 res!30818) b!36204))

(assert (= (and b!36204 res!30816) b!36205))

(assert (= (and b!36205 (not res!30817)) b!36206))

(assert (=> b!36204 m!53851))

(assert (=> b!36204 m!53857))

(assert (=> b!36206 m!53851))

(assert (=> b!36206 m!53851))

(declare-fun m!54573 () Bool)

(assert (=> b!36206 m!54573))

(assert (=> b!35793 d!10664))

(declare-fun d!10666 () Bool)

(declare-fun res!30821 () Bool)

(declare-fun e!23875 () Bool)

(assert (=> d!10666 (=> (not res!30821) (not e!23875))))

(assert (=> d!10666 (= res!30821 (= (size!851 (buf!1179 (_2!1864 lt!53447))) (size!851 (buf!1179 (_2!1864 lt!53437)))))))

(assert (=> d!10666 (= (isPrefixOf!0 (_2!1864 lt!53447) (_2!1864 lt!53437)) e!23875)))

(declare-fun b!36207 () Bool)

(declare-fun res!30819 () Bool)

(assert (=> b!36207 (=> (not res!30819) (not e!23875))))

(assert (=> b!36207 (= res!30819 (bvsle (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447))) (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53437))) (currentByte!2564 (_2!1864 lt!53437)) (currentBit!2559 (_2!1864 lt!53437)))))))

(declare-fun b!36208 () Bool)

(declare-fun e!23874 () Bool)

(assert (=> b!36208 (= e!23875 e!23874)))

(declare-fun res!30820 () Bool)

(assert (=> b!36208 (=> res!30820 e!23874)))

(assert (=> b!36208 (= res!30820 (= (size!851 (buf!1179 (_2!1864 lt!53447))) #b00000000000000000000000000000000))))

(declare-fun b!36209 () Bool)

(assert (=> b!36209 (= e!23874 (arrayBitRangesEq!0 (buf!1179 (_2!1864 lt!53447)) (buf!1179 (_2!1864 lt!53437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!851 (buf!1179 (_2!1864 lt!53447))) (currentByte!2564 (_2!1864 lt!53447)) (currentBit!2559 (_2!1864 lt!53447)))))))

(assert (= (and d!10666 res!30821) b!36207))

(assert (= (and b!36207 res!30819) b!36208))

(assert (= (and b!36208 (not res!30820)) b!36209))

(assert (=> b!36207 m!53883))

(assert (=> b!36207 m!53857))

(assert (=> b!36209 m!53883))

(assert (=> b!36209 m!53883))

(declare-fun m!54575 () Bool)

(assert (=> b!36209 m!54575))

(assert (=> b!35793 d!10666))

(declare-fun d!10668 () Bool)

(assert (=> d!10668 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2863 () Bool)

(assert (= bs!2863 d!10668))

(declare-fun m!54577 () Bool)

(assert (=> bs!2863 m!54577))

(assert (=> b!35793 d!10668))

(declare-fun d!10670 () Bool)

(assert (=> d!10670 (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 (_2!1864 lt!53447)))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!54313 () Unit!2629)

(assert (=> d!10670 (= lt!54313 (choose!9 thiss!1379 (buf!1179 (_2!1864 lt!53447)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1477 (buf!1179 (_2!1864 lt!53447)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(assert (=> d!10670 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1179 (_2!1864 lt!53447)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!54313)))

(declare-fun bs!2864 () Bool)

(assert (= bs!2864 d!10670))

(assert (=> bs!2864 m!53881))

(declare-fun m!54579 () Bool)

(assert (=> bs!2864 m!54579))

(assert (=> b!35793 d!10670))

(declare-fun d!10672 () Bool)

(assert (=> d!10672 (= (head!276 lt!53448) (h!554 lt!53448))))

(assert (=> b!35792 d!10672))

(declare-fun d!10674 () Bool)

(assert (=> d!10674 (= (array_inv!791 (buf!1179 thiss!1379)) (bvsge (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!35781 d!10674))

(declare-fun d!10676 () Bool)

(assert (=> d!10676 (= (array_inv!791 srcBuffer!2) (bvsge (size!851 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!7342 d!10676))

(declare-fun d!10678 () Bool)

(assert (=> d!10678 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2559 thiss!1379) (currentByte!2564 thiss!1379) (size!851 (buf!1179 thiss!1379))))))

(declare-fun bs!2865 () Bool)

(assert (= bs!2865 d!10678))

(declare-fun m!54581 () Bool)

(assert (=> bs!2865 m!54581))

(assert (=> start!7342 d!10678))

(declare-fun d!10680 () Bool)

(assert (=> d!10680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2866 () Bool)

(assert (= bs!2866 d!10680))

(declare-fun m!54583 () Bool)

(assert (=> bs!2866 m!54583))

(assert (=> b!35780 d!10680))

(declare-fun d!10682 () Bool)

(assert (=> d!10682 (= (bitAt!0 (buf!1179 (_2!1864 lt!53437)) lt!53434) (not (= (bvand ((_ sign_extend 24) (select (arr!1335 (buf!1179 (_2!1864 lt!53437))) ((_ extract 31 0) (bvsdiv lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!53434 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2867 () Bool)

(assert (= bs!2867 d!10682))

(declare-fun m!54585 () Bool)

(assert (=> bs!2867 m!54585))

(assert (=> bs!2867 m!54173))

(assert (=> b!35791 d!10682))

(declare-fun d!10684 () Bool)

(assert (=> d!10684 (= (bitAt!0 (buf!1179 (_2!1864 lt!53447)) lt!53434) (bitAt!0 (buf!1179 (_2!1864 lt!53437)) lt!53434))))

(declare-fun lt!54398 () Unit!2629)

(declare-fun choose!31 (array!1909 array!1909 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2629)

(assert (=> d!10684 (= lt!54398 (choose!31 (buf!1179 (_2!1864 lt!53447)) (buf!1179 (_2!1864 lt!53437)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53434 lt!53439))))

(assert (=> d!10684 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!53439))))

(assert (=> d!10684 (= (arrayBitRangesEqImpliesEq!0 (buf!1179 (_2!1864 lt!53447)) (buf!1179 (_2!1864 lt!53437)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!53434 lt!53439) lt!54398)))

(declare-fun bs!2868 () Bool)

(assert (= bs!2868 d!10684))

(assert (=> bs!2868 m!53867))

(assert (=> bs!2868 m!53789))

(declare-fun m!54587 () Bool)

(assert (=> bs!2868 m!54587))

(assert (=> b!35791 d!10684))

(declare-fun d!10686 () Bool)

(declare-fun res!30826 () Bool)

(declare-fun e!23879 () Bool)

(assert (=> d!10686 (=> (not res!30826) (not e!23879))))

(assert (=> d!10686 (= res!30826 (= (size!851 (buf!1179 thiss!1379)) (size!851 (buf!1179 thiss!1379))))))

(assert (=> d!10686 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!23879)))

(declare-fun b!36210 () Bool)

(declare-fun res!30824 () Bool)

(assert (=> b!36210 (=> (not res!30824) (not e!23879))))

(assert (=> b!36210 (= res!30824 (bvsle (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)) (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(declare-fun b!36211 () Bool)

(declare-fun e!23878 () Bool)

(assert (=> b!36211 (= e!23879 e!23878)))

(declare-fun res!30825 () Bool)

(assert (=> b!36211 (=> res!30825 e!23878)))

(assert (=> b!36211 (= res!30825 (= (size!851 (buf!1179 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!36212 () Bool)

(assert (=> b!36212 (= e!23878 (arrayBitRangesEq!0 (buf!1179 thiss!1379) (buf!1179 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379))))))

(assert (= (and d!10686 res!30826) b!36210))

(assert (= (and b!36210 res!30824) b!36211))

(assert (= (and b!36211 (not res!30825)) b!36212))

(assert (=> b!36210 m!53851))

(assert (=> b!36210 m!53851))

(assert (=> b!36212 m!53851))

(assert (=> b!36212 m!53851))

(declare-fun m!54589 () Bool)

(assert (=> b!36212 m!54589))

(assert (=> b!35790 d!10686))

(declare-fun d!10688 () Bool)

(assert (=> d!10688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!54425 () Unit!2629)

(declare-fun choose!11 (BitStream!1476) Unit!2629)

(assert (=> d!10688 (= lt!54425 (choose!11 thiss!1379))))

(assert (=> d!10688 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!54425)))

(declare-fun bs!2870 () Bool)

(assert (= bs!2870 d!10688))

(assert (=> bs!2870 m!53847))

(declare-fun m!54591 () Bool)

(assert (=> bs!2870 m!54591))

(assert (=> b!35790 d!10688))

(declare-fun d!10690 () Bool)

(declare-fun e!23886 () Bool)

(assert (=> d!10690 e!23886))

(declare-fun res!30849 () Bool)

(assert (=> d!10690 (=> (not res!30849) (not e!23886))))

(declare-fun lt!54428 () (_ BitVec 64))

(declare-fun lt!54429 () (_ BitVec 64))

(declare-fun lt!54431 () (_ BitVec 64))

(assert (=> d!10690 (= res!30849 (= lt!54428 (bvsub lt!54429 lt!54431)))))

(assert (=> d!10690 (or (= (bvand lt!54429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!54431 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!54429 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!54429 lt!54431) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!10690 (= lt!54431 (remainingBits!0 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))) ((_ sign_extend 32) (currentByte!2564 thiss!1379)) ((_ sign_extend 32) (currentBit!2559 thiss!1379))))))

(declare-fun lt!54426 () (_ BitVec 64))

(declare-fun lt!54430 () (_ BitVec 64))

(assert (=> d!10690 (= lt!54429 (bvmul lt!54426 lt!54430))))

(assert (=> d!10690 (or (= lt!54426 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!54430 (bvsdiv (bvmul lt!54426 lt!54430) lt!54426)))))

(assert (=> d!10690 (= lt!54430 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!10690 (= lt!54426 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))))))

(assert (=> d!10690 (= lt!54428 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2564 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2559 thiss!1379))))))

(assert (=> d!10690 (invariant!0 (currentBit!2559 thiss!1379) (currentByte!2564 thiss!1379) (size!851 (buf!1179 thiss!1379)))))

(assert (=> d!10690 (= (bitIndex!0 (size!851 (buf!1179 thiss!1379)) (currentByte!2564 thiss!1379) (currentBit!2559 thiss!1379)) lt!54428)))

(declare-fun b!36237 () Bool)

(declare-fun res!30850 () Bool)

(assert (=> b!36237 (=> (not res!30850) (not e!23886))))

(assert (=> b!36237 (= res!30850 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!54428))))

(declare-fun b!36238 () Bool)

(declare-fun lt!54427 () (_ BitVec 64))

(assert (=> b!36238 (= e!23886 (bvsle lt!54428 (bvmul lt!54427 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!36238 (or (= lt!54427 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!54427 #b0000000000000000000000000000000000000000000000000000000000001000) lt!54427)))))

(assert (=> b!36238 (= lt!54427 ((_ sign_extend 32) (size!851 (buf!1179 thiss!1379))))))

(assert (= (and d!10690 res!30849) b!36237))

(assert (= (and b!36237 res!30850) b!36238))

(assert (=> d!10690 m!54583))

(assert (=> d!10690 m!54581))

(assert (=> b!35790 d!10690))

(check-sat (not b!36207) (not b!35904) (not d!10482) (not d!10546) (not b!36025) (not b!36184) (not b!36024) (not d!10670) (not b!36198) (not b!35919) (not b!35909) (not b!35920) (not d!10496) (not b!35892) (not b!35907) (not d!10484) (not b!35912) (not d!10492) (not b!36204) (not b!35880) (not d!10690) (not b!36189) (not d!10474) (not d!10558) (not b!36199) (not b!35918) (not d!10478) (not b!36197) (not b!36030) (not d!10468) (not b!35903) (not b!36209) (not b!35913) (not b!36183) (not d!10688) (not b!36029) (not b!35910) (not b!35932) (not b!35881) (not d!10526) (not b!35884) (not d!10490) (not b!35914) (not bm!445) (not b!36187) (not d!10460) (not b!36212) (not d!10668) (not b!35905) (not d!10472) (not b!35929) (not d!10678) (not b!35879) (not b!36190) (not d!10486) (not b!36026) (not d!10684) (not b!36027) (not d!10680) (not b!36206) (not b!36031) (not b!36188) (not d!10458) (not d!10662) (not b!36201) (not b!35911) (not b!35927) (not b!36028) (not b!36210) (not b!35869) (not d!10534) (not b!35916))
(check-sat)
