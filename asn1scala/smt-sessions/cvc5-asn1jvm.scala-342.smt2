; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8084 () Bool)

(assert start!8084)

(declare-fun b!40458 () Bool)

(declare-fun res!34412 () Bool)

(declare-fun e!26650 () Bool)

(assert (=> b!40458 (=> res!34412 e!26650)))

(declare-datatypes ((array!2006 0))(
  ( (array!2007 (arr!1406 (Array (_ BitVec 32) (_ BitVec 8))) (size!907 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1558 0))(
  ( (BitStream!1559 (buf!1235 array!2006) (currentByte!2653 (_ BitVec 32)) (currentBit!2648 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2859 0))(
  ( (Unit!2860) )
))
(declare-datatypes ((tuple2!3886 0))(
  ( (tuple2!3887 (_1!2030 Unit!2859) (_2!2030 BitStream!1558)) )
))
(declare-fun lt!61611 () tuple2!3886)

(declare-fun lt!61608 () tuple2!3886)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40458 (= res!34412 (not (invariant!0 (currentBit!2648 (_2!2030 lt!61611)) (currentByte!2653 (_2!2030 lt!61611)) (size!907 (buf!1235 (_2!2030 lt!61608))))))))

(declare-fun b!40459 () Bool)

(declare-fun res!34400 () Bool)

(declare-fun e!26652 () Bool)

(assert (=> b!40459 (=> res!34400 e!26652)))

(assert (=> b!40459 (= res!34400 (not (invariant!0 (currentBit!2648 (_2!2030 lt!61608)) (currentByte!2653 (_2!2030 lt!61608)) (size!907 (buf!1235 (_2!2030 lt!61608))))))))

(declare-fun b!40460 () Bool)

(declare-fun e!26644 () Bool)

(assert (=> b!40460 (= e!26644 e!26652)))

(declare-fun res!34405 () Bool)

(assert (=> b!40460 (=> res!34405 e!26652)))

(declare-fun lt!61591 () (_ BitVec 64))

(declare-fun lt!61602 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!40460 (= res!34405 (not (= lt!61602 (bvsub (bvadd lt!61591 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40460 (= lt!61602 (bitIndex!0 (size!907 (buf!1235 (_2!2030 lt!61608))) (currentByte!2653 (_2!2030 lt!61608)) (currentBit!2648 (_2!2030 lt!61608))))))

(declare-fun b!40461 () Bool)

(declare-fun e!26642 () Bool)

(declare-fun thiss!1379 () BitStream!1558)

(declare-fun array_inv!832 (array!2006) Bool)

(assert (=> b!40461 (= e!26642 (array_inv!832 (buf!1235 thiss!1379)))))

(declare-fun b!40462 () Bool)

(declare-fun e!26654 () Bool)

(declare-fun e!26646 () Bool)

(assert (=> b!40462 (= e!26654 e!26646)))

(declare-fun res!34407 () Bool)

(assert (=> b!40462 (=> res!34407 e!26646)))

(declare-fun lt!61596 () Bool)

(declare-fun lt!61590 () Bool)

(assert (=> b!40462 (= res!34407 (not (= lt!61596 lt!61590)))))

(declare-fun bitAt!0 (array!2006 (_ BitVec 64)) Bool)

(assert (=> b!40462 (= lt!61596 (bitAt!0 (buf!1235 (_2!2030 lt!61611)) lt!61591))))

(declare-fun b!40463 () Bool)

(assert (=> b!40463 (= e!26652 e!26650)))

(declare-fun res!34416 () Bool)

(assert (=> b!40463 (=> res!34416 e!26650)))

(assert (=> b!40463 (= res!34416 (not (= (size!907 (buf!1235 (_2!2030 lt!61611))) (size!907 (buf!1235 (_2!2030 lt!61608))))))))

(declare-fun lt!61604 () (_ BitVec 64))

(assert (=> b!40463 (= lt!61602 (bvsub (bvsub (bvadd lt!61604 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!40463 (= lt!61604 (bitIndex!0 (size!907 (buf!1235 (_2!2030 lt!61611))) (currentByte!2653 (_2!2030 lt!61611)) (currentBit!2648 (_2!2030 lt!61611))))))

(assert (=> b!40463 (= (size!907 (buf!1235 (_2!2030 lt!61608))) (size!907 (buf!1235 thiss!1379)))))

(declare-fun b!40464 () Bool)

(declare-fun e!26651 () Bool)

(assert (=> b!40464 (= e!26646 e!26651)))

(declare-fun res!34411 () Bool)

(assert (=> b!40464 (=> res!34411 e!26651)))

(declare-fun lt!61605 () Bool)

(assert (=> b!40464 (= res!34411 (not (= lt!61605 lt!61590)))))

(assert (=> b!40464 (= lt!61596 lt!61605)))

(assert (=> b!40464 (= lt!61605 (bitAt!0 (buf!1235 (_2!2030 lt!61608)) lt!61591))))

(declare-fun lt!61601 () Unit!2859)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2006 array!2006 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2859)

(assert (=> b!40464 (= lt!61601 (arrayBitRangesEqImpliesEq!0 (buf!1235 (_2!2030 lt!61611)) (buf!1235 (_2!2030 lt!61608)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61591 lt!61604))))

(declare-fun res!34418 () Bool)

(declare-fun e!26645 () Bool)

(assert (=> start!8084 (=> (not res!34418) (not e!26645))))

(declare-fun srcBuffer!2 () array!2006)

(assert (=> start!8084 (= res!34418 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!907 srcBuffer!2))))))))

(assert (=> start!8084 e!26645))

(assert (=> start!8084 true))

(assert (=> start!8084 (array_inv!832 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1558) Bool)

(assert (=> start!8084 (and (inv!12 thiss!1379) e!26642)))

(declare-fun b!40457 () Bool)

(declare-fun res!34406 () Bool)

(assert (=> b!40457 (=> res!34406 e!26652)))

(assert (=> b!40457 (= res!34406 (not (= (size!907 (buf!1235 thiss!1379)) (size!907 (buf!1235 (_2!2030 lt!61608))))))))

(declare-fun b!40465 () Bool)

(declare-fun e!26655 () Bool)

(declare-fun e!26648 () Bool)

(assert (=> b!40465 (= e!26655 e!26648)))

(declare-fun res!34408 () Bool)

(assert (=> b!40465 (=> res!34408 e!26648)))

(declare-fun lt!61606 () Bool)

(declare-datatypes ((tuple2!3888 0))(
  ( (tuple2!3889 (_1!2031 BitStream!1558) (_2!2031 BitStream!1558)) )
))
(declare-fun lt!61612 () tuple2!3888)

(assert (=> b!40465 (= res!34408 (not (= lt!61606 (bitAt!0 (buf!1235 (_1!2031 lt!61612)) lt!61591))))))

(declare-fun lt!61607 () tuple2!3888)

(assert (=> b!40465 (= lt!61606 (bitAt!0 (buf!1235 (_1!2031 lt!61607)) lt!61591))))

(declare-fun b!40466 () Bool)

(declare-fun e!26643 () Bool)

(assert (=> b!40466 (= e!26650 e!26643)))

(declare-fun res!34402 () Bool)

(assert (=> b!40466 (=> res!34402 e!26643)))

(assert (=> b!40466 (= res!34402 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((List!480 0))(
  ( (Nil!477) (Cons!476 (h!595 Bool) (t!1230 List!480)) )
))
(declare-fun lt!61599 () List!480)

(declare-fun lt!61610 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1558 BitStream!1558 (_ BitVec 64)) List!480)

(assert (=> b!40466 (= lt!61599 (bitStreamReadBitsIntoList!0 (_2!2030 lt!61608) (_1!2031 lt!61612) lt!61610))))

(declare-fun lt!61597 () List!480)

(assert (=> b!40466 (= lt!61597 (bitStreamReadBitsIntoList!0 (_2!2030 lt!61608) (_1!2031 lt!61607) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40466 (validate_offset_bits!1 ((_ sign_extend 32) (size!907 (buf!1235 (_2!2030 lt!61608)))) ((_ sign_extend 32) (currentByte!2653 (_2!2030 lt!61611))) ((_ sign_extend 32) (currentBit!2648 (_2!2030 lt!61611))) lt!61610)))

(declare-fun lt!61589 () Unit!2859)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1558 array!2006 (_ BitVec 64)) Unit!2859)

(assert (=> b!40466 (= lt!61589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2030 lt!61611) (buf!1235 (_2!2030 lt!61608)) lt!61610))))

(declare-fun reader!0 (BitStream!1558 BitStream!1558) tuple2!3888)

(assert (=> b!40466 (= lt!61612 (reader!0 (_2!2030 lt!61611) (_2!2030 lt!61608)))))

(assert (=> b!40466 (validate_offset_bits!1 ((_ sign_extend 32) (size!907 (buf!1235 (_2!2030 lt!61608)))) ((_ sign_extend 32) (currentByte!2653 thiss!1379)) ((_ sign_extend 32) (currentBit!2648 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61598 () Unit!2859)

(assert (=> b!40466 (= lt!61598 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1235 (_2!2030 lt!61608)) (bvsub to!314 i!635)))))

(assert (=> b!40466 (= lt!61607 (reader!0 thiss!1379 (_2!2030 lt!61608)))))

(declare-fun b!40467 () Bool)

(declare-fun e!26656 () Bool)

(declare-fun e!26653 () Bool)

(assert (=> b!40467 (= e!26656 e!26653)))

(declare-fun res!34403 () Bool)

(assert (=> b!40467 (=> res!34403 e!26653)))

(declare-fun isPrefixOf!0 (BitStream!1558 BitStream!1558) Bool)

(assert (=> b!40467 (= res!34403 (not (isPrefixOf!0 thiss!1379 (_2!2030 lt!61611))))))

(assert (=> b!40467 (validate_offset_bits!1 ((_ sign_extend 32) (size!907 (buf!1235 (_2!2030 lt!61611)))) ((_ sign_extend 32) (currentByte!2653 (_2!2030 lt!61611))) ((_ sign_extend 32) (currentBit!2648 (_2!2030 lt!61611))) lt!61610)))

(assert (=> b!40467 (= lt!61610 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61600 () Unit!2859)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1558 BitStream!1558 (_ BitVec 64) (_ BitVec 64)) Unit!2859)

(assert (=> b!40467 (= lt!61600 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2030 lt!61611) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1558 (_ BitVec 8) (_ BitVec 32)) tuple2!3886)

(assert (=> b!40467 (= lt!61611 (appendBitFromByte!0 thiss!1379 (select (arr!1406 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!40468 () Bool)

(assert (=> b!40468 (= e!26651 true)))

(declare-datatypes ((tuple2!3890 0))(
  ( (tuple2!3891 (_1!2032 BitStream!1558) (_2!2032 Bool)) )
))
(declare-fun lt!61595 () tuple2!3890)

(declare-fun readBitPure!0 (BitStream!1558) tuple2!3890)

(assert (=> b!40468 (= lt!61595 (readBitPure!0 (_1!2031 lt!61607)))))

(declare-fun b!40469 () Bool)

(assert (=> b!40469 (= e!26648 e!26654)))

(declare-fun res!34404 () Bool)

(assert (=> b!40469 (=> res!34404 e!26654)))

(declare-fun head!317 (List!480) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1558 array!2006 (_ BitVec 64) (_ BitVec 64)) List!480)

(assert (=> b!40469 (= res!34404 (not (= (head!317 (byteArrayBitContentToList!0 (_2!2030 lt!61608) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61590)))))

(assert (=> b!40469 (= lt!61590 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40470 () Bool)

(declare-fun res!34409 () Bool)

(assert (=> b!40470 (=> (not res!34409) (not e!26645))))

(assert (=> b!40470 (= res!34409 (validate_offset_bits!1 ((_ sign_extend 32) (size!907 (buf!1235 thiss!1379))) ((_ sign_extend 32) (currentByte!2653 thiss!1379)) ((_ sign_extend 32) (currentBit!2648 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40471 () Bool)

(assert (=> b!40471 (= e!26653 e!26644)))

(declare-fun res!34413 () Bool)

(assert (=> b!40471 (=> res!34413 e!26644)))

(assert (=> b!40471 (= res!34413 (not (isPrefixOf!0 (_2!2030 lt!61611) (_2!2030 lt!61608))))))

(assert (=> b!40471 (isPrefixOf!0 thiss!1379 (_2!2030 lt!61608))))

(declare-fun lt!61594 () Unit!2859)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1558 BitStream!1558 BitStream!1558) Unit!2859)

(assert (=> b!40471 (= lt!61594 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2030 lt!61611) (_2!2030 lt!61608)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1558 array!2006 (_ BitVec 64) (_ BitVec 64)) tuple2!3886)

(assert (=> b!40471 (= lt!61608 (appendBitsMSBFirstLoop!0 (_2!2030 lt!61611) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!26647 () Bool)

(assert (=> b!40471 e!26647))

(declare-fun res!34417 () Bool)

(assert (=> b!40471 (=> (not res!34417) (not e!26647))))

(assert (=> b!40471 (= res!34417 (validate_offset_bits!1 ((_ sign_extend 32) (size!907 (buf!1235 (_2!2030 lt!61611)))) ((_ sign_extend 32) (currentByte!2653 thiss!1379)) ((_ sign_extend 32) (currentBit!2648 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61592 () Unit!2859)

(assert (=> b!40471 (= lt!61592 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1235 (_2!2030 lt!61611)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61588 () tuple2!3888)

(assert (=> b!40471 (= lt!61588 (reader!0 thiss!1379 (_2!2030 lt!61611)))))

(declare-fun b!40472 () Bool)

(assert (=> b!40472 (= e!26643 e!26655)))

(declare-fun res!34414 () Bool)

(assert (=> b!40472 (=> res!34414 e!26655)))

(declare-fun lt!61603 () List!480)

(assert (=> b!40472 (= res!34414 (not (= lt!61603 lt!61599)))))

(assert (=> b!40472 (= lt!61599 lt!61603)))

(declare-fun tail!197 (List!480) List!480)

(assert (=> b!40472 (= lt!61603 (tail!197 lt!61597))))

(declare-fun lt!61609 () Unit!2859)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1558 BitStream!1558 BitStream!1558 BitStream!1558 (_ BitVec 64) List!480) Unit!2859)

(assert (=> b!40472 (= lt!61609 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2030 lt!61608) (_2!2030 lt!61608) (_1!2031 lt!61607) (_1!2031 lt!61612) (bvsub to!314 i!635) lt!61597))))

(declare-fun b!40473 () Bool)

(declare-fun res!34401 () Bool)

(assert (=> b!40473 (=> res!34401 e!26648)))

(assert (=> b!40473 (= res!34401 (not (= (head!317 lt!61597) lt!61606)))))

(declare-fun b!40474 () Bool)

(declare-fun res!34419 () Bool)

(assert (=> b!40474 (=> res!34419 e!26643)))

(declare-fun length!206 (List!480) Int)

(assert (=> b!40474 (= res!34419 (<= (length!206 lt!61597) 0))))

(declare-fun b!40475 () Bool)

(assert (=> b!40475 (= e!26647 (= (head!317 (byteArrayBitContentToList!0 (_2!2030 lt!61611) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!317 (bitStreamReadBitsIntoList!0 (_2!2030 lt!61611) (_1!2031 lt!61588) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40476 () Bool)

(declare-fun res!34410 () Bool)

(assert (=> b!40476 (=> res!34410 e!26650)))

(assert (=> b!40476 (= res!34410 (not (invariant!0 (currentBit!2648 (_2!2030 lt!61611)) (currentByte!2653 (_2!2030 lt!61611)) (size!907 (buf!1235 (_2!2030 lt!61611))))))))

(declare-fun b!40477 () Bool)

(assert (=> b!40477 (= e!26645 (not e!26656))))

(declare-fun res!34415 () Bool)

(assert (=> b!40477 (=> res!34415 e!26656)))

(assert (=> b!40477 (= res!34415 (bvsge i!635 to!314))))

(assert (=> b!40477 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61593 () Unit!2859)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1558) Unit!2859)

(assert (=> b!40477 (= lt!61593 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!40477 (= lt!61591 (bitIndex!0 (size!907 (buf!1235 thiss!1379)) (currentByte!2653 thiss!1379) (currentBit!2648 thiss!1379)))))

(assert (= (and start!8084 res!34418) b!40470))

(assert (= (and b!40470 res!34409) b!40477))

(assert (= (and b!40477 (not res!34415)) b!40467))

(assert (= (and b!40467 (not res!34403)) b!40471))

(assert (= (and b!40471 res!34417) b!40475))

(assert (= (and b!40471 (not res!34413)) b!40460))

(assert (= (and b!40460 (not res!34405)) b!40459))

(assert (= (and b!40459 (not res!34400)) b!40457))

(assert (= (and b!40457 (not res!34406)) b!40463))

(assert (= (and b!40463 (not res!34416)) b!40476))

(assert (= (and b!40476 (not res!34410)) b!40458))

(assert (= (and b!40458 (not res!34412)) b!40466))

(assert (= (and b!40466 (not res!34402)) b!40474))

(assert (= (and b!40474 (not res!34419)) b!40472))

(assert (= (and b!40472 (not res!34414)) b!40465))

(assert (= (and b!40465 (not res!34408)) b!40473))

(assert (= (and b!40473 (not res!34401)) b!40469))

(assert (= (and b!40469 (not res!34404)) b!40462))

(assert (= (and b!40462 (not res!34407)) b!40464))

(assert (= (and b!40464 (not res!34411)) b!40468))

(assert (= start!8084 b!40461))

(declare-fun m!61869 () Bool)

(assert (=> b!40461 m!61869))

(declare-fun m!61871 () Bool)

(assert (=> b!40468 m!61871))

(declare-fun m!61873 () Bool)

(assert (=> b!40469 m!61873))

(assert (=> b!40469 m!61873))

(declare-fun m!61875 () Bool)

(assert (=> b!40469 m!61875))

(declare-fun m!61877 () Bool)

(assert (=> b!40469 m!61877))

(declare-fun m!61879 () Bool)

(assert (=> b!40458 m!61879))

(declare-fun m!61881 () Bool)

(assert (=> b!40475 m!61881))

(assert (=> b!40475 m!61881))

(declare-fun m!61883 () Bool)

(assert (=> b!40475 m!61883))

(declare-fun m!61885 () Bool)

(assert (=> b!40475 m!61885))

(assert (=> b!40475 m!61885))

(declare-fun m!61887 () Bool)

(assert (=> b!40475 m!61887))

(declare-fun m!61889 () Bool)

(assert (=> b!40473 m!61889))

(declare-fun m!61891 () Bool)

(assert (=> b!40476 m!61891))

(declare-fun m!61893 () Bool)

(assert (=> b!40471 m!61893))

(declare-fun m!61895 () Bool)

(assert (=> b!40471 m!61895))

(declare-fun m!61897 () Bool)

(assert (=> b!40471 m!61897))

(declare-fun m!61899 () Bool)

(assert (=> b!40471 m!61899))

(declare-fun m!61901 () Bool)

(assert (=> b!40471 m!61901))

(declare-fun m!61903 () Bool)

(assert (=> b!40471 m!61903))

(declare-fun m!61905 () Bool)

(assert (=> b!40471 m!61905))

(declare-fun m!61907 () Bool)

(assert (=> b!40467 m!61907))

(declare-fun m!61909 () Bool)

(assert (=> b!40467 m!61909))

(declare-fun m!61911 () Bool)

(assert (=> b!40467 m!61911))

(assert (=> b!40467 m!61909))

(declare-fun m!61913 () Bool)

(assert (=> b!40467 m!61913))

(declare-fun m!61915 () Bool)

(assert (=> b!40467 m!61915))

(declare-fun m!61917 () Bool)

(assert (=> b!40465 m!61917))

(declare-fun m!61919 () Bool)

(assert (=> b!40465 m!61919))

(declare-fun m!61921 () Bool)

(assert (=> b!40477 m!61921))

(declare-fun m!61923 () Bool)

(assert (=> b!40477 m!61923))

(declare-fun m!61925 () Bool)

(assert (=> b!40477 m!61925))

(declare-fun m!61927 () Bool)

(assert (=> b!40470 m!61927))

(declare-fun m!61929 () Bool)

(assert (=> b!40459 m!61929))

(declare-fun m!61931 () Bool)

(assert (=> b!40463 m!61931))

(declare-fun m!61933 () Bool)

(assert (=> b!40466 m!61933))

(declare-fun m!61935 () Bool)

(assert (=> b!40466 m!61935))

(declare-fun m!61937 () Bool)

(assert (=> b!40466 m!61937))

(declare-fun m!61939 () Bool)

(assert (=> b!40466 m!61939))

(declare-fun m!61941 () Bool)

(assert (=> b!40466 m!61941))

(declare-fun m!61943 () Bool)

(assert (=> b!40466 m!61943))

(declare-fun m!61945 () Bool)

(assert (=> b!40466 m!61945))

(declare-fun m!61947 () Bool)

(assert (=> b!40466 m!61947))

(declare-fun m!61949 () Bool)

(assert (=> b!40464 m!61949))

(declare-fun m!61951 () Bool)

(assert (=> b!40464 m!61951))

(declare-fun m!61953 () Bool)

(assert (=> b!40472 m!61953))

(declare-fun m!61955 () Bool)

(assert (=> b!40472 m!61955))

(declare-fun m!61957 () Bool)

(assert (=> b!40474 m!61957))

(declare-fun m!61959 () Bool)

(assert (=> b!40462 m!61959))

(declare-fun m!61961 () Bool)

(assert (=> b!40460 m!61961))

(declare-fun m!61963 () Bool)

(assert (=> start!8084 m!61963))

(declare-fun m!61965 () Bool)

(assert (=> start!8084 m!61965))

(push 1)

(assert (not b!40460))

(assert (not b!40473))

(assert (not b!40470))

(assert (not b!40469))

(assert (not b!40472))

(assert (not b!40458))

(assert (not b!40462))

(assert (not b!40464))

(assert (not b!40476))

(assert (not b!40471))

(assert (not b!40459))

(assert (not b!40477))

(assert (not b!40467))

(assert (not b!40475))

(assert (not b!40463))

(assert (not b!40461))

(assert (not b!40465))

(assert (not b!40474))

(assert (not start!8084))

(assert (not b!40468))

(assert (not b!40466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

