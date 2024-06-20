; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6504 () Bool)

(assert start!6504)

(declare-fun b!30614 () Bool)

(declare-fun res!26320 () Bool)

(declare-fun e!20387 () Bool)

(assert (=> b!30614 (=> res!26320 e!20387)))

(declare-datatypes ((List!389 0))(
  ( (Nil!386) (Cons!385 (h!504 Bool) (t!1139 List!389)) )
))
(declare-fun lt!44520 () List!389)

(declare-fun length!115 (List!389) Int)

(assert (=> b!30614 (= res!26320 (<= (length!115 lt!44520) 0))))

(declare-fun b!30615 () Bool)

(declare-fun e!20397 () Bool)

(declare-fun e!20388 () Bool)

(assert (=> b!30615 (= e!20397 (not e!20388))))

(declare-fun res!26322 () Bool)

(assert (=> b!30615 (=> res!26322 e!20388)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!30615 (= res!26322 (bvsge i!635 to!314))))

(declare-datatypes ((array!1791 0))(
  ( (array!1792 (arr!1249 (Array (_ BitVec 32) (_ BitVec 8))) (size!783 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1376 0))(
  ( (BitStream!1377 (buf!1111 array!1791) (currentByte!2460 (_ BitVec 32)) (currentBit!2455 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1376)

(declare-fun isPrefixOf!0 (BitStream!1376 BitStream!1376) Bool)

(assert (=> b!30615 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2349 0))(
  ( (Unit!2350) )
))
(declare-fun lt!44522 () Unit!2349)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1376) Unit!2349)

(assert (=> b!30615 (= lt!44522 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!44516 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!30615 (= lt!44516 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(declare-fun b!30616 () Bool)

(declare-fun res!26318 () Bool)

(declare-fun e!20398 () Bool)

(assert (=> b!30616 (=> res!26318 e!20398)))

(declare-datatypes ((tuple2!3210 0))(
  ( (tuple2!3211 (_1!1692 Unit!2349) (_2!1692 BitStream!1376)) )
))
(declare-fun lt!44510 () tuple2!3210)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!30616 (= res!26318 (not (invariant!0 (currentBit!2455 (_2!1692 lt!44510)) (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44510))))))))

(declare-fun b!30617 () Bool)

(declare-fun e!20386 () Bool)

(assert (=> b!30617 (= e!20387 e!20386)))

(declare-fun res!26315 () Bool)

(assert (=> b!30617 (=> res!26315 e!20386)))

(declare-fun lt!44513 () List!389)

(declare-fun lt!44524 () List!389)

(assert (=> b!30617 (= res!26315 (not (= lt!44513 lt!44524)))))

(assert (=> b!30617 (= lt!44524 lt!44513)))

(declare-fun tail!106 (List!389) List!389)

(assert (=> b!30617 (= lt!44513 (tail!106 lt!44520))))

(declare-fun lt!44511 () Unit!2349)

(declare-datatypes ((tuple2!3212 0))(
  ( (tuple2!3213 (_1!1693 BitStream!1376) (_2!1693 BitStream!1376)) )
))
(declare-fun lt!44515 () tuple2!3212)

(declare-fun lt!44518 () tuple2!3212)

(declare-fun lt!44527 () tuple2!3210)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1376 BitStream!1376 BitStream!1376 BitStream!1376 (_ BitVec 64) List!389) Unit!2349)

(assert (=> b!30617 (= lt!44511 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1692 lt!44527) (_2!1692 lt!44527) (_1!1693 lt!44518) (_1!1693 lt!44515) (bvsub to!314 i!635) lt!44520))))

(declare-fun b!30618 () Bool)

(declare-fun res!26316 () Bool)

(assert (=> b!30618 (=> res!26316 e!20398)))

(assert (=> b!30618 (= res!26316 (not (invariant!0 (currentBit!2455 (_2!1692 lt!44510)) (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44527))))))))

(declare-fun b!30619 () Bool)

(assert (=> b!30619 (= e!20398 e!20387)))

(declare-fun res!26325 () Bool)

(assert (=> b!30619 (=> res!26325 e!20387)))

(assert (=> b!30619 (= res!26325 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!44521 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1376 BitStream!1376 (_ BitVec 64)) List!389)

(assert (=> b!30619 (= lt!44524 (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_1!1693 lt!44515) lt!44521))))

(assert (=> b!30619 (= lt!44520 (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_1!1693 lt!44518) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30619 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!44521)))

(declare-fun lt!44514 () Unit!2349)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1376 array!1791 (_ BitVec 64)) Unit!2349)

(assert (=> b!30619 (= lt!44514 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!44527)) lt!44521))))

(declare-fun reader!0 (BitStream!1376 BitStream!1376) tuple2!3212)

(assert (=> b!30619 (= lt!44515 (reader!0 (_2!1692 lt!44510) (_2!1692 lt!44527)))))

(assert (=> b!30619 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44523 () Unit!2349)

(assert (=> b!30619 (= lt!44523 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1111 (_2!1692 lt!44527)) (bvsub to!314 i!635)))))

(assert (=> b!30619 (= lt!44518 (reader!0 thiss!1379 (_2!1692 lt!44527)))))

(declare-fun b!30620 () Bool)

(declare-fun res!26317 () Bool)

(assert (=> b!30620 (=> res!26317 e!20386)))

(declare-fun bitAt!0 (array!1791 (_ BitVec 64)) Bool)

(assert (=> b!30620 (= res!26317 (not (= (bitAt!0 (buf!1111 (_1!1693 lt!44518)) lt!44516) (bitAt!0 (buf!1111 (_1!1693 lt!44515)) lt!44516))))))

(declare-fun b!30621 () Bool)

(declare-fun res!26321 () Bool)

(declare-fun e!20390 () Bool)

(assert (=> b!30621 (=> res!26321 e!20390)))

(assert (=> b!30621 (= res!26321 (not (= (size!783 (buf!1111 thiss!1379)) (size!783 (buf!1111 (_2!1692 lt!44527))))))))

(declare-fun b!30622 () Bool)

(declare-fun e!20394 () Bool)

(declare-fun e!20393 () Bool)

(assert (=> b!30622 (= e!20394 e!20393)))

(declare-fun res!26324 () Bool)

(assert (=> b!30622 (=> res!26324 e!20393)))

(assert (=> b!30622 (= res!26324 (not (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44527))))))

(assert (=> b!30622 (isPrefixOf!0 thiss!1379 (_2!1692 lt!44527))))

(declare-fun lt!44526 () Unit!2349)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1376 BitStream!1376 BitStream!1376) Unit!2349)

(assert (=> b!30622 (= lt!44526 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1692 lt!44510) (_2!1692 lt!44527)))))

(declare-fun srcBuffer!2 () array!1791)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1376 array!1791 (_ BitVec 64) (_ BitVec 64)) tuple2!3210)

(assert (=> b!30622 (= lt!44527 (appendBitsMSBFirstLoop!0 (_2!1692 lt!44510) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20391 () Bool)

(assert (=> b!30622 e!20391))

(declare-fun res!26313 () Bool)

(assert (=> b!30622 (=> (not res!26313) (not e!20391))))

(assert (=> b!30622 (= res!26313 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44525 () Unit!2349)

(assert (=> b!30622 (= lt!44525 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1111 (_2!1692 lt!44510)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44517 () tuple2!3212)

(assert (=> b!30622 (= lt!44517 (reader!0 thiss!1379 (_2!1692 lt!44510)))))

(declare-fun b!30624 () Bool)

(declare-fun e!20396 () Bool)

(declare-fun array_inv!741 (array!1791) Bool)

(assert (=> b!30624 (= e!20396 (array_inv!741 (buf!1111 thiss!1379)))))

(declare-fun b!30625 () Bool)

(declare-fun res!26312 () Bool)

(assert (=> b!30625 (=> res!26312 e!20390)))

(assert (=> b!30625 (= res!26312 (not (invariant!0 (currentBit!2455 (_2!1692 lt!44527)) (currentByte!2460 (_2!1692 lt!44527)) (size!783 (buf!1111 (_2!1692 lt!44527))))))))

(declare-fun b!30626 () Bool)

(declare-fun head!226 (List!389) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1376 array!1791 (_ BitVec 64) (_ BitVec 64)) List!389)

(assert (=> b!30626 (= e!20391 (= (head!226 (byteArrayBitContentToList!0 (_2!1692 lt!44510) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!226 (bitStreamReadBitsIntoList!0 (_2!1692 lt!44510) (_1!1693 lt!44517) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!30627 () Bool)

(declare-fun res!26310 () Bool)

(assert (=> b!30627 (=> (not res!26310) (not e!20397))))

(assert (=> b!30627 (= res!26310 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!30628 () Bool)

(assert (=> b!30628 (= e!20388 e!20394)))

(declare-fun res!26314 () Bool)

(assert (=> b!30628 (=> res!26314 e!20394)))

(assert (=> b!30628 (= res!26314 (not (isPrefixOf!0 thiss!1379 (_2!1692 lt!44510))))))

(assert (=> b!30628 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!44521)))

(assert (=> b!30628 (= lt!44521 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!44519 () Unit!2349)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1376 BitStream!1376 (_ BitVec 64) (_ BitVec 64)) Unit!2349)

(assert (=> b!30628 (= lt!44519 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1692 lt!44510) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1376 (_ BitVec 8) (_ BitVec 32)) tuple2!3210)

(assert (=> b!30628 (= lt!44510 (appendBitFromByte!0 thiss!1379 (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!30629 () Bool)

(assert (=> b!30629 (= e!20393 e!20390)))

(declare-fun res!26309 () Bool)

(assert (=> b!30629 (=> res!26309 e!20390)))

(declare-fun lt!44512 () (_ BitVec 64))

(assert (=> b!30629 (= res!26309 (not (= lt!44512 (bvsub (bvadd lt!44516 to!314) i!635))))))

(assert (=> b!30629 (= lt!44512 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527))))))

(declare-fun e!20395 () Bool)

(declare-fun b!30630 () Bool)

(assert (=> b!30630 (= e!20395 (= lt!44512 (bvsub (bvsub (bvadd (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30631 () Bool)

(assert (=> b!30631 (= e!20390 e!20398)))

(declare-fun res!26323 () Bool)

(assert (=> b!30631 (=> res!26323 e!20398)))

(assert (=> b!30631 (= res!26323 (not (= (size!783 (buf!1111 (_2!1692 lt!44510))) (size!783 (buf!1111 (_2!1692 lt!44527))))))))

(assert (=> b!30631 e!20395))

(declare-fun res!26319 () Bool)

(assert (=> b!30631 (=> (not res!26319) (not e!20395))))

(assert (=> b!30631 (= res!26319 (= (size!783 (buf!1111 (_2!1692 lt!44527))) (size!783 (buf!1111 thiss!1379))))))

(declare-fun res!26311 () Bool)

(assert (=> start!6504 (=> (not res!26311) (not e!20397))))

(assert (=> start!6504 (= res!26311 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!783 srcBuffer!2))))))))

(assert (=> start!6504 e!20397))

(assert (=> start!6504 true))

(assert (=> start!6504 (array_inv!741 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1376) Bool)

(assert (=> start!6504 (and (inv!12 thiss!1379) e!20396)))

(declare-fun b!30623 () Bool)

(assert (=> b!30623 (= e!20386 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44516) (bvslt lt!44516 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!783 (buf!1111 (_1!1693 lt!44518))))))))))

(assert (= (and start!6504 res!26311) b!30627))

(assert (= (and b!30627 res!26310) b!30615))

(assert (= (and b!30615 (not res!26322)) b!30628))

(assert (= (and b!30628 (not res!26314)) b!30622))

(assert (= (and b!30622 res!26313) b!30626))

(assert (= (and b!30622 (not res!26324)) b!30629))

(assert (= (and b!30629 (not res!26309)) b!30625))

(assert (= (and b!30625 (not res!26312)) b!30621))

(assert (= (and b!30621 (not res!26321)) b!30631))

(assert (= (and b!30631 res!26319) b!30630))

(assert (= (and b!30631 (not res!26323)) b!30616))

(assert (= (and b!30616 (not res!26318)) b!30618))

(assert (= (and b!30618 (not res!26316)) b!30619))

(assert (= (and b!30619 (not res!26325)) b!30614))

(assert (= (and b!30614 (not res!26320)) b!30617))

(assert (= (and b!30617 (not res!26315)) b!30620))

(assert (= (and b!30620 (not res!26317)) b!30623))

(assert (= start!6504 b!30624))

(declare-fun m!44735 () Bool)

(assert (=> start!6504 m!44735))

(declare-fun m!44737 () Bool)

(assert (=> start!6504 m!44737))

(declare-fun m!44739 () Bool)

(assert (=> b!30619 m!44739))

(declare-fun m!44741 () Bool)

(assert (=> b!30619 m!44741))

(declare-fun m!44743 () Bool)

(assert (=> b!30619 m!44743))

(declare-fun m!44745 () Bool)

(assert (=> b!30619 m!44745))

(declare-fun m!44747 () Bool)

(assert (=> b!30619 m!44747))

(declare-fun m!44749 () Bool)

(assert (=> b!30619 m!44749))

(declare-fun m!44751 () Bool)

(assert (=> b!30619 m!44751))

(declare-fun m!44753 () Bool)

(assert (=> b!30619 m!44753))

(declare-fun m!44755 () Bool)

(assert (=> b!30625 m!44755))

(declare-fun m!44757 () Bool)

(assert (=> b!30626 m!44757))

(assert (=> b!30626 m!44757))

(declare-fun m!44759 () Bool)

(assert (=> b!30626 m!44759))

(declare-fun m!44761 () Bool)

(assert (=> b!30626 m!44761))

(assert (=> b!30626 m!44761))

(declare-fun m!44763 () Bool)

(assert (=> b!30626 m!44763))

(declare-fun m!44765 () Bool)

(assert (=> b!30627 m!44765))

(declare-fun m!44767 () Bool)

(assert (=> b!30617 m!44767))

(declare-fun m!44769 () Bool)

(assert (=> b!30617 m!44769))

(declare-fun m!44771 () Bool)

(assert (=> b!30616 m!44771))

(declare-fun m!44773 () Bool)

(assert (=> b!30629 m!44773))

(declare-fun m!44775 () Bool)

(assert (=> b!30624 m!44775))

(declare-fun m!44777 () Bool)

(assert (=> b!30630 m!44777))

(declare-fun m!44779 () Bool)

(assert (=> b!30622 m!44779))

(declare-fun m!44781 () Bool)

(assert (=> b!30622 m!44781))

(declare-fun m!44783 () Bool)

(assert (=> b!30622 m!44783))

(declare-fun m!44785 () Bool)

(assert (=> b!30622 m!44785))

(declare-fun m!44787 () Bool)

(assert (=> b!30622 m!44787))

(declare-fun m!44789 () Bool)

(assert (=> b!30622 m!44789))

(declare-fun m!44791 () Bool)

(assert (=> b!30622 m!44791))

(declare-fun m!44793 () Bool)

(assert (=> b!30628 m!44793))

(declare-fun m!44795 () Bool)

(assert (=> b!30628 m!44795))

(declare-fun m!44797 () Bool)

(assert (=> b!30628 m!44797))

(declare-fun m!44799 () Bool)

(assert (=> b!30628 m!44799))

(assert (=> b!30628 m!44795))

(declare-fun m!44801 () Bool)

(assert (=> b!30628 m!44801))

(declare-fun m!44803 () Bool)

(assert (=> b!30614 m!44803))

(declare-fun m!44805 () Bool)

(assert (=> b!30618 m!44805))

(declare-fun m!44807 () Bool)

(assert (=> b!30620 m!44807))

(declare-fun m!44809 () Bool)

(assert (=> b!30620 m!44809))

(declare-fun m!44811 () Bool)

(assert (=> b!30615 m!44811))

(declare-fun m!44813 () Bool)

(assert (=> b!30615 m!44813))

(declare-fun m!44815 () Bool)

(assert (=> b!30615 m!44815))

(push 1)

(assert (not b!30629))

(assert (not b!30617))

(assert (not b!30618))

(assert (not b!30614))

(assert (not b!30615))

(assert (not b!30620))

(assert (not b!30627))

(assert (not b!30628))

(assert (not b!30622))

(assert (not b!30619))

(assert (not b!30624))

(assert (not b!30625))

(assert (not start!6504))

(assert (not b!30616))

(assert (not b!30630))

(assert (not b!30626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8862 () Bool)

(assert (=> d!8862 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!44674 () Unit!2349)

(declare-fun choose!9 (BitStream!1376 array!1791 (_ BitVec 64) BitStream!1376) Unit!2349)

(assert (=> d!8862 (= lt!44674 (choose!9 thiss!1379 (buf!1111 (_2!1692 lt!44527)) (bvsub to!314 i!635) (BitStream!1377 (buf!1111 (_2!1692 lt!44527)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(assert (=> d!8862 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1111 (_2!1692 lt!44527)) (bvsub to!314 i!635)) lt!44674)))

(declare-fun bs!2468 () Bool)

(assert (= bs!2468 d!8862))

(assert (=> bs!2468 m!44753))

(declare-fun m!44907 () Bool)

(assert (=> bs!2468 m!44907))

(assert (=> b!30619 d!8862))

(declare-fun b!30727 () Bool)

(declare-fun e!20448 () Bool)

(declare-fun lt!44682 () List!389)

(assert (=> b!30727 (= e!20448 (> (length!115 lt!44682) 0))))

(declare-fun b!30725 () Bool)

(declare-datatypes ((tuple2!3222 0))(
  ( (tuple2!3223 (_1!1698 List!389) (_2!1698 BitStream!1376)) )
))
(declare-fun e!20449 () tuple2!3222)

(declare-datatypes ((tuple2!3224 0))(
  ( (tuple2!3225 (_1!1699 Bool) (_2!1699 BitStream!1376)) )
))
(declare-fun lt!44683 () tuple2!3224)

(declare-fun lt!44681 () (_ BitVec 64))

(assert (=> b!30725 (= e!20449 (tuple2!3223 (Cons!385 (_1!1699 lt!44683) (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_2!1699 lt!44683) (bvsub (bvsub to!314 i!635) lt!44681))) (_2!1699 lt!44683)))))

(declare-fun readBit!0 (BitStream!1376) tuple2!3224)

(assert (=> b!30725 (= lt!44683 (readBit!0 (_1!1693 lt!44518)))))

(assert (=> b!30725 (= lt!44681 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30726 () Bool)

(declare-fun isEmpty!82 (List!389) Bool)

(assert (=> b!30726 (= e!20448 (isEmpty!82 lt!44682))))

(declare-fun b!30724 () Bool)

(assert (=> b!30724 (= e!20449 (tuple2!3223 Nil!386 (_1!1693 lt!44518)))))

(declare-fun d!8864 () Bool)

(assert (=> d!8864 e!20448))

(declare-fun c!2045 () Bool)

(assert (=> d!8864 (= c!2045 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8864 (= lt!44682 (_1!1698 e!20449))))

(declare-fun c!2046 () Bool)

(assert (=> d!8864 (= c!2046 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8864 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8864 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_1!1693 lt!44518) (bvsub to!314 i!635)) lt!44682)))

(assert (= (and d!8864 c!2046) b!30724))

(assert (= (and d!8864 (not c!2046)) b!30725))

(assert (= (and d!8864 c!2045) b!30726))

(assert (= (and d!8864 (not c!2045)) b!30727))

(declare-fun m!44909 () Bool)

(assert (=> b!30727 m!44909))

(declare-fun m!44911 () Bool)

(assert (=> b!30725 m!44911))

(declare-fun m!44913 () Bool)

(assert (=> b!30725 m!44913))

(declare-fun m!44915 () Bool)

(assert (=> b!30726 m!44915))

(assert (=> b!30619 d!8864))

(declare-fun d!8866 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!8866 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!44521) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510)))) lt!44521))))

(declare-fun bs!2469 () Bool)

(assert (= bs!2469 d!8866))

(declare-fun m!44917 () Bool)

(assert (=> bs!2469 m!44917))

(assert (=> b!30619 d!8866))

(declare-fun b!30731 () Bool)

(declare-fun e!20450 () Bool)

(declare-fun lt!44685 () List!389)

(assert (=> b!30731 (= e!20450 (> (length!115 lt!44685) 0))))

(declare-fun b!30729 () Bool)

(declare-fun lt!44686 () tuple2!3224)

(declare-fun e!20451 () tuple2!3222)

(declare-fun lt!44684 () (_ BitVec 64))

(assert (=> b!30729 (= e!20451 (tuple2!3223 (Cons!385 (_1!1699 lt!44686) (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_2!1699 lt!44686) (bvsub lt!44521 lt!44684))) (_2!1699 lt!44686)))))

(assert (=> b!30729 (= lt!44686 (readBit!0 (_1!1693 lt!44515)))))

(assert (=> b!30729 (= lt!44684 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30730 () Bool)

(assert (=> b!30730 (= e!20450 (isEmpty!82 lt!44685))))

(declare-fun b!30728 () Bool)

(assert (=> b!30728 (= e!20451 (tuple2!3223 Nil!386 (_1!1693 lt!44515)))))

(declare-fun d!8868 () Bool)

(assert (=> d!8868 e!20450))

(declare-fun c!2047 () Bool)

(assert (=> d!8868 (= c!2047 (= lt!44521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8868 (= lt!44685 (_1!1698 e!20451))))

(declare-fun c!2048 () Bool)

(assert (=> d!8868 (= c!2048 (= lt!44521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8868 (bvsge lt!44521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8868 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_1!1693 lt!44515) lt!44521) lt!44685)))

(assert (= (and d!8868 c!2048) b!30728))

(assert (= (and d!8868 (not c!2048)) b!30729))

(assert (= (and d!8868 c!2047) b!30730))

(assert (= (and d!8868 (not c!2047)) b!30731))

(declare-fun m!44919 () Bool)

(assert (=> b!30731 m!44919))

(declare-fun m!44921 () Bool)

(assert (=> b!30729 m!44921))

(declare-fun m!44923 () Bool)

(assert (=> b!30729 m!44923))

(declare-fun m!44925 () Bool)

(assert (=> b!30730 m!44925))

(assert (=> b!30619 d!8868))

(declare-fun d!8870 () Bool)

(assert (=> d!8870 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!44521)))

(declare-fun lt!44687 () Unit!2349)

(assert (=> d!8870 (= lt!44687 (choose!9 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!44527)) lt!44521 (BitStream!1377 (buf!1111 (_2!1692 lt!44527)) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510)))))))

(assert (=> d!8870 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!44527)) lt!44521) lt!44687)))

(declare-fun bs!2470 () Bool)

(assert (= bs!2470 d!8870))

(assert (=> bs!2470 m!44743))

(declare-fun m!44927 () Bool)

(assert (=> bs!2470 m!44927))

(assert (=> b!30619 d!8870))

(declare-fun b!30742 () Bool)

(declare-fun res!26391 () Bool)

(declare-fun e!20457 () Bool)

(assert (=> b!30742 (=> (not res!26391) (not e!20457))))

(declare-fun lt!44743 () tuple2!3212)

(assert (=> b!30742 (= res!26391 (isPrefixOf!0 (_2!1693 lt!44743) (_2!1692 lt!44527)))))

(declare-fun b!30743 () Bool)

(declare-fun e!20456 () Unit!2349)

(declare-fun Unit!2361 () Unit!2349)

(assert (=> b!30743 (= e!20456 Unit!2361)))

(declare-fun b!30744 () Bool)

(declare-fun res!26393 () Bool)

(assert (=> b!30744 (=> (not res!26393) (not e!20457))))

(assert (=> b!30744 (= res!26393 (isPrefixOf!0 (_1!1693 lt!44743) thiss!1379))))

(declare-fun b!30745 () Bool)

(declare-fun lt!44729 () (_ BitVec 64))

(declare-fun lt!44746 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1376 (_ BitVec 64)) BitStream!1376)

(assert (=> b!30745 (= e!20457 (= (_1!1693 lt!44743) (withMovedBitIndex!0 (_2!1693 lt!44743) (bvsub lt!44746 lt!44729))))))

(assert (=> b!30745 (or (= (bvand lt!44746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44746 lt!44729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30745 (= lt!44729 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527))))))

(assert (=> b!30745 (= lt!44746 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(declare-fun b!30746 () Bool)

(declare-fun lt!44728 () Unit!2349)

(assert (=> b!30746 (= e!20456 lt!44728)))

(declare-fun lt!44738 () (_ BitVec 64))

(assert (=> b!30746 (= lt!44738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44735 () (_ BitVec 64))

(assert (=> b!30746 (= lt!44735 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1791 array!1791 (_ BitVec 64) (_ BitVec 64)) Unit!2349)

(assert (=> b!30746 (= lt!44728 (arrayBitRangesEqSymmetric!0 (buf!1111 thiss!1379) (buf!1111 (_2!1692 lt!44527)) lt!44738 lt!44735))))

(declare-fun arrayBitRangesEq!0 (array!1791 array!1791 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!30746 (arrayBitRangesEq!0 (buf!1111 (_2!1692 lt!44527)) (buf!1111 thiss!1379) lt!44738 lt!44735)))

(declare-fun d!8872 () Bool)

(assert (=> d!8872 e!20457))

(declare-fun res!26392 () Bool)

(assert (=> d!8872 (=> (not res!26392) (not e!20457))))

(assert (=> d!8872 (= res!26392 (isPrefixOf!0 (_1!1693 lt!44743) (_2!1693 lt!44743)))))

(declare-fun lt!44745 () BitStream!1376)

(assert (=> d!8872 (= lt!44743 (tuple2!3213 lt!44745 (_2!1692 lt!44527)))))

(declare-fun lt!44742 () Unit!2349)

(declare-fun lt!44747 () Unit!2349)

(assert (=> d!8872 (= lt!44742 lt!44747)))

(assert (=> d!8872 (isPrefixOf!0 lt!44745 (_2!1692 lt!44527))))

(assert (=> d!8872 (= lt!44747 (lemmaIsPrefixTransitive!0 lt!44745 (_2!1692 lt!44527) (_2!1692 lt!44527)))))

(declare-fun lt!44731 () Unit!2349)

(declare-fun lt!44740 () Unit!2349)

(assert (=> d!8872 (= lt!44731 lt!44740)))

(assert (=> d!8872 (isPrefixOf!0 lt!44745 (_2!1692 lt!44527))))

(assert (=> d!8872 (= lt!44740 (lemmaIsPrefixTransitive!0 lt!44745 thiss!1379 (_2!1692 lt!44527)))))

(declare-fun lt!44737 () Unit!2349)

(assert (=> d!8872 (= lt!44737 e!20456)))

(declare-fun c!2051 () Bool)

(assert (=> d!8872 (= c!2051 (not (= (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44730 () Unit!2349)

(declare-fun lt!44732 () Unit!2349)

(assert (=> d!8872 (= lt!44730 lt!44732)))

(assert (=> d!8872 (isPrefixOf!0 (_2!1692 lt!44527) (_2!1692 lt!44527))))

(assert (=> d!8872 (= lt!44732 (lemmaIsPrefixRefl!0 (_2!1692 lt!44527)))))

(declare-fun lt!44734 () Unit!2349)

(declare-fun lt!44744 () Unit!2349)

(assert (=> d!8872 (= lt!44734 lt!44744)))

(assert (=> d!8872 (= lt!44744 (lemmaIsPrefixRefl!0 (_2!1692 lt!44527)))))

(declare-fun lt!44741 () Unit!2349)

(declare-fun lt!44736 () Unit!2349)

(assert (=> d!8872 (= lt!44741 lt!44736)))

(assert (=> d!8872 (isPrefixOf!0 lt!44745 lt!44745)))

(assert (=> d!8872 (= lt!44736 (lemmaIsPrefixRefl!0 lt!44745))))

(declare-fun lt!44739 () Unit!2349)

(declare-fun lt!44733 () Unit!2349)

(assert (=> d!8872 (= lt!44739 lt!44733)))

(assert (=> d!8872 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8872 (= lt!44733 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8872 (= lt!44745 (BitStream!1377 (buf!1111 (_2!1692 lt!44527)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(assert (=> d!8872 (isPrefixOf!0 thiss!1379 (_2!1692 lt!44527))))

(assert (=> d!8872 (= (reader!0 thiss!1379 (_2!1692 lt!44527)) lt!44743)))

(assert (= (and d!8872 c!2051) b!30746))

(assert (= (and d!8872 (not c!2051)) b!30743))

(assert (= (and d!8872 res!26392) b!30744))

(assert (= (and b!30744 res!26393) b!30742))

(assert (= (and b!30742 res!26391) b!30745))

(declare-fun m!44929 () Bool)

(assert (=> b!30744 m!44929))

(declare-fun m!44931 () Bool)

(assert (=> d!8872 m!44931))

(assert (=> d!8872 m!44811))

(declare-fun m!44933 () Bool)

(assert (=> d!8872 m!44933))

(declare-fun m!44935 () Bool)

(assert (=> d!8872 m!44935))

(assert (=> d!8872 m!44813))

(declare-fun m!44937 () Bool)

(assert (=> d!8872 m!44937))

(assert (=> d!8872 m!44779))

(declare-fun m!44939 () Bool)

(assert (=> d!8872 m!44939))

(declare-fun m!44941 () Bool)

(assert (=> d!8872 m!44941))

(declare-fun m!44943 () Bool)

(assert (=> d!8872 m!44943))

(declare-fun m!44945 () Bool)

(assert (=> d!8872 m!44945))

(declare-fun m!44947 () Bool)

(assert (=> b!30742 m!44947))

(assert (=> b!30746 m!44815))

(declare-fun m!44949 () Bool)

(assert (=> b!30746 m!44949))

(declare-fun m!44951 () Bool)

(assert (=> b!30746 m!44951))

(declare-fun m!44953 () Bool)

(assert (=> b!30745 m!44953))

(assert (=> b!30745 m!44773))

(assert (=> b!30745 m!44815))

(assert (=> b!30619 d!8872))

(declare-fun b!30747 () Bool)

(declare-fun res!26394 () Bool)

(declare-fun e!20459 () Bool)

(assert (=> b!30747 (=> (not res!26394) (not e!20459))))

(declare-fun lt!44763 () tuple2!3212)

(assert (=> b!30747 (= res!26394 (isPrefixOf!0 (_2!1693 lt!44763) (_2!1692 lt!44527)))))

(declare-fun b!30748 () Bool)

(declare-fun e!20458 () Unit!2349)

(declare-fun Unit!2362 () Unit!2349)

(assert (=> b!30748 (= e!20458 Unit!2362)))

(declare-fun b!30749 () Bool)

(declare-fun res!26396 () Bool)

(assert (=> b!30749 (=> (not res!26396) (not e!20459))))

(assert (=> b!30749 (= res!26396 (isPrefixOf!0 (_1!1693 lt!44763) (_2!1692 lt!44510)))))

(declare-fun lt!44766 () (_ BitVec 64))

(declare-fun lt!44749 () (_ BitVec 64))

(declare-fun b!30750 () Bool)

(assert (=> b!30750 (= e!20459 (= (_1!1693 lt!44763) (withMovedBitIndex!0 (_2!1693 lt!44763) (bvsub lt!44766 lt!44749))))))

(assert (=> b!30750 (or (= (bvand lt!44766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44749 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44766 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44766 lt!44749) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30750 (= lt!44749 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527))))))

(assert (=> b!30750 (= lt!44766 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(declare-fun b!30751 () Bool)

(declare-fun lt!44748 () Unit!2349)

(assert (=> b!30751 (= e!20458 lt!44748)))

(declare-fun lt!44758 () (_ BitVec 64))

(assert (=> b!30751 (= lt!44758 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44755 () (_ BitVec 64))

(assert (=> b!30751 (= lt!44755 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(assert (=> b!30751 (= lt!44748 (arrayBitRangesEqSymmetric!0 (buf!1111 (_2!1692 lt!44510)) (buf!1111 (_2!1692 lt!44527)) lt!44758 lt!44755))))

(assert (=> b!30751 (arrayBitRangesEq!0 (buf!1111 (_2!1692 lt!44527)) (buf!1111 (_2!1692 lt!44510)) lt!44758 lt!44755)))

(declare-fun d!8874 () Bool)

(assert (=> d!8874 e!20459))

(declare-fun res!26395 () Bool)

(assert (=> d!8874 (=> (not res!26395) (not e!20459))))

(assert (=> d!8874 (= res!26395 (isPrefixOf!0 (_1!1693 lt!44763) (_2!1693 lt!44763)))))

(declare-fun lt!44765 () BitStream!1376)

(assert (=> d!8874 (= lt!44763 (tuple2!3213 lt!44765 (_2!1692 lt!44527)))))

(declare-fun lt!44762 () Unit!2349)

(declare-fun lt!44767 () Unit!2349)

(assert (=> d!8874 (= lt!44762 lt!44767)))

(assert (=> d!8874 (isPrefixOf!0 lt!44765 (_2!1692 lt!44527))))

(assert (=> d!8874 (= lt!44767 (lemmaIsPrefixTransitive!0 lt!44765 (_2!1692 lt!44527) (_2!1692 lt!44527)))))

(declare-fun lt!44751 () Unit!2349)

(declare-fun lt!44760 () Unit!2349)

(assert (=> d!8874 (= lt!44751 lt!44760)))

(assert (=> d!8874 (isPrefixOf!0 lt!44765 (_2!1692 lt!44527))))

(assert (=> d!8874 (= lt!44760 (lemmaIsPrefixTransitive!0 lt!44765 (_2!1692 lt!44510) (_2!1692 lt!44527)))))

(declare-fun lt!44757 () Unit!2349)

(assert (=> d!8874 (= lt!44757 e!20458)))

(declare-fun c!2052 () Bool)

(assert (=> d!8874 (= c!2052 (not (= (size!783 (buf!1111 (_2!1692 lt!44510))) #b00000000000000000000000000000000)))))

(declare-fun lt!44750 () Unit!2349)

(declare-fun lt!44752 () Unit!2349)

(assert (=> d!8874 (= lt!44750 lt!44752)))

(assert (=> d!8874 (isPrefixOf!0 (_2!1692 lt!44527) (_2!1692 lt!44527))))

(assert (=> d!8874 (= lt!44752 (lemmaIsPrefixRefl!0 (_2!1692 lt!44527)))))

(declare-fun lt!44754 () Unit!2349)

(declare-fun lt!44764 () Unit!2349)

(assert (=> d!8874 (= lt!44754 lt!44764)))

(assert (=> d!8874 (= lt!44764 (lemmaIsPrefixRefl!0 (_2!1692 lt!44527)))))

(declare-fun lt!44761 () Unit!2349)

(declare-fun lt!44756 () Unit!2349)

(assert (=> d!8874 (= lt!44761 lt!44756)))

(assert (=> d!8874 (isPrefixOf!0 lt!44765 lt!44765)))

(assert (=> d!8874 (= lt!44756 (lemmaIsPrefixRefl!0 lt!44765))))

(declare-fun lt!44759 () Unit!2349)

(declare-fun lt!44753 () Unit!2349)

(assert (=> d!8874 (= lt!44759 lt!44753)))

(assert (=> d!8874 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44510))))

(assert (=> d!8874 (= lt!44753 (lemmaIsPrefixRefl!0 (_2!1692 lt!44510)))))

(assert (=> d!8874 (= lt!44765 (BitStream!1377 (buf!1111 (_2!1692 lt!44527)) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(assert (=> d!8874 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44527))))

(assert (=> d!8874 (= (reader!0 (_2!1692 lt!44510) (_2!1692 lt!44527)) lt!44763)))

(assert (= (and d!8874 c!2052) b!30751))

(assert (= (and d!8874 (not c!2052)) b!30748))

(assert (= (and d!8874 res!26395) b!30749))

(assert (= (and b!30749 res!26396) b!30747))

(assert (= (and b!30747 res!26394) b!30750))

(declare-fun m!44955 () Bool)

(assert (=> b!30749 m!44955))

(assert (=> d!8874 m!44931))

(declare-fun m!44957 () Bool)

(assert (=> d!8874 m!44957))

(declare-fun m!44959 () Bool)

(assert (=> d!8874 m!44959))

(declare-fun m!44961 () Bool)

(assert (=> d!8874 m!44961))

(declare-fun m!44963 () Bool)

(assert (=> d!8874 m!44963))

(declare-fun m!44965 () Bool)

(assert (=> d!8874 m!44965))

(assert (=> d!8874 m!44785))

(declare-fun m!44967 () Bool)

(assert (=> d!8874 m!44967))

(assert (=> d!8874 m!44941))

(declare-fun m!44969 () Bool)

(assert (=> d!8874 m!44969))

(declare-fun m!44971 () Bool)

(assert (=> d!8874 m!44971))

(declare-fun m!44973 () Bool)

(assert (=> b!30747 m!44973))

(assert (=> b!30751 m!44777))

(declare-fun m!44975 () Bool)

(assert (=> b!30751 m!44975))

(declare-fun m!44977 () Bool)

(assert (=> b!30751 m!44977))

(declare-fun m!44979 () Bool)

(assert (=> b!30750 m!44979))

(assert (=> b!30750 m!44773))

(assert (=> b!30750 m!44777))

(assert (=> b!30619 d!8874))

(declare-fun d!8876 () Bool)

(assert (=> d!8876 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2471 () Bool)

(assert (= bs!2471 d!8876))

(declare-fun m!44981 () Bool)

(assert (=> bs!2471 m!44981))

(assert (=> b!30619 d!8876))

(declare-fun d!8878 () Bool)

(assert (=> d!8878 (= (invariant!0 (currentBit!2455 (_2!1692 lt!44510)) (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44527)))) (and (bvsge (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (bvslt (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000001000) (bvsge (currentByte!2460 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44527)))) (and (= (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (= (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44527))))))))))

(assert (=> b!30618 d!8878))

(declare-fun d!8880 () Bool)

(declare-fun e!20462 () Bool)

(assert (=> d!8880 e!20462))

(declare-fun res!26401 () Bool)

(assert (=> d!8880 (=> (not res!26401) (not e!20462))))

(declare-fun lt!44785 () (_ BitVec 64))

(declare-fun lt!44783 () (_ BitVec 64))

(declare-fun lt!44781 () (_ BitVec 64))

(assert (=> d!8880 (= res!26401 (= lt!44785 (bvsub lt!44783 lt!44781)))))

(assert (=> d!8880 (or (= (bvand lt!44783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44781 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44783 lt!44781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8880 (= lt!44781 (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44527))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44527)))))))

(declare-fun lt!44784 () (_ BitVec 64))

(declare-fun lt!44782 () (_ BitVec 64))

(assert (=> d!8880 (= lt!44783 (bvmul lt!44784 lt!44782))))

(assert (=> d!8880 (or (= lt!44784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44782 (bvsdiv (bvmul lt!44784 lt!44782) lt!44784)))))

(assert (=> d!8880 (= lt!44782 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8880 (= lt!44784 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))))))

(assert (=> d!8880 (= lt!44785 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44527))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44527)))))))

(assert (=> d!8880 (invariant!0 (currentBit!2455 (_2!1692 lt!44527)) (currentByte!2460 (_2!1692 lt!44527)) (size!783 (buf!1111 (_2!1692 lt!44527))))))

(assert (=> d!8880 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527))) lt!44785)))

(declare-fun b!30756 () Bool)

(declare-fun res!26402 () Bool)

(assert (=> b!30756 (=> (not res!26402) (not e!20462))))

(assert (=> b!30756 (= res!26402 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44785))))

(declare-fun b!30757 () Bool)

(declare-fun lt!44780 () (_ BitVec 64))

(assert (=> b!30757 (= e!20462 (bvsle lt!44785 (bvmul lt!44780 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30757 (or (= lt!44780 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44780 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44780)))))

(assert (=> b!30757 (= lt!44780 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44527)))))))

(assert (= (and d!8880 res!26401) b!30756))

(assert (= (and b!30756 res!26402) b!30757))

(declare-fun m!44983 () Bool)

(assert (=> d!8880 m!44983))

(assert (=> d!8880 m!44755))

(assert (=> b!30629 d!8880))

(declare-fun d!8882 () Bool)

(assert (=> d!8882 (= (bitAt!0 (buf!1111 (_1!1693 lt!44518)) lt!44516) (not (= (bvand ((_ sign_extend 24) (select (arr!1249 (buf!1111 (_1!1693 lt!44518))) ((_ extract 31 0) (bvsdiv lt!44516 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44516 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2472 () Bool)

(assert (= bs!2472 d!8882))

(declare-fun m!44985 () Bool)

(assert (=> bs!2472 m!44985))

(declare-fun m!44987 () Bool)

(assert (=> bs!2472 m!44987))

(assert (=> b!30620 d!8882))

(declare-fun d!8884 () Bool)

(assert (=> d!8884 (= (bitAt!0 (buf!1111 (_1!1693 lt!44515)) lt!44516) (not (= (bvand ((_ sign_extend 24) (select (arr!1249 (buf!1111 (_1!1693 lt!44515))) ((_ extract 31 0) (bvsdiv lt!44516 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!44516 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2473 () Bool)

(assert (= bs!2473 d!8884))

(declare-fun m!44989 () Bool)

(assert (=> bs!2473 m!44989))

(assert (=> bs!2473 m!44987))

(assert (=> b!30620 d!8884))

(declare-fun d!8886 () Bool)

(declare-fun e!20463 () Bool)

(assert (=> d!8886 e!20463))

(declare-fun res!26403 () Bool)

(assert (=> d!8886 (=> (not res!26403) (not e!20463))))

(declare-fun lt!44789 () (_ BitVec 64))

(declare-fun lt!44787 () (_ BitVec 64))

(declare-fun lt!44791 () (_ BitVec 64))

(assert (=> d!8886 (= res!26403 (= lt!44791 (bvsub lt!44789 lt!44787)))))

(assert (=> d!8886 (or (= (bvand lt!44789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44789 lt!44787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8886 (= lt!44787 (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510)))))))

(declare-fun lt!44790 () (_ BitVec 64))

(declare-fun lt!44788 () (_ BitVec 64))

(assert (=> d!8886 (= lt!44789 (bvmul lt!44790 lt!44788))))

(assert (=> d!8886 (or (= lt!44790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!44788 (bvsdiv (bvmul lt!44790 lt!44788) lt!44790)))))

(assert (=> d!8886 (= lt!44788 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8886 (= lt!44790 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))))))

(assert (=> d!8886 (= lt!44791 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510)))))))

(assert (=> d!8886 (invariant!0 (currentBit!2455 (_2!1692 lt!44510)) (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44510))))))

(assert (=> d!8886 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))) lt!44791)))

(declare-fun b!30758 () Bool)

(declare-fun res!26404 () Bool)

(assert (=> b!30758 (=> (not res!26404) (not e!20463))))

(assert (=> b!30758 (= res!26404 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!44791))))

(declare-fun b!30759 () Bool)

(declare-fun lt!44786 () (_ BitVec 64))

(assert (=> b!30759 (= e!20463 (bvsle lt!44791 (bvmul lt!44786 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30759 (or (= lt!44786 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!44786 #b0000000000000000000000000000000000000000000000000000000000001000) lt!44786)))))

(assert (=> b!30759 (= lt!44786 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))))))

(assert (= (and d!8886 res!26403) b!30758))

(assert (= (and b!30758 res!26404) b!30759))

(declare-fun m!44991 () Bool)

(assert (=> d!8886 m!44991))

(assert (=> d!8886 m!44771))

(assert (=> b!30630 d!8886))

(declare-fun b!30760 () Bool)

(declare-fun res!26405 () Bool)

(declare-fun e!20465 () Bool)

(assert (=> b!30760 (=> (not res!26405) (not e!20465))))

(declare-fun lt!44807 () tuple2!3212)

(assert (=> b!30760 (= res!26405 (isPrefixOf!0 (_2!1693 lt!44807) (_2!1692 lt!44510)))))

(declare-fun b!30761 () Bool)

(declare-fun e!20464 () Unit!2349)

(declare-fun Unit!2363 () Unit!2349)

(assert (=> b!30761 (= e!20464 Unit!2363)))

(declare-fun b!30762 () Bool)

(declare-fun res!26407 () Bool)

(assert (=> b!30762 (=> (not res!26407) (not e!20465))))

(assert (=> b!30762 (= res!26407 (isPrefixOf!0 (_1!1693 lt!44807) thiss!1379))))

(declare-fun lt!44793 () (_ BitVec 64))

(declare-fun b!30763 () Bool)

(declare-fun lt!44810 () (_ BitVec 64))

(assert (=> b!30763 (= e!20465 (= (_1!1693 lt!44807) (withMovedBitIndex!0 (_2!1693 lt!44807) (bvsub lt!44810 lt!44793))))))

(assert (=> b!30763 (or (= (bvand lt!44810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!44793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!44810 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!44810 lt!44793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30763 (= lt!44793 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(assert (=> b!30763 (= lt!44810 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(declare-fun b!30764 () Bool)

(declare-fun lt!44792 () Unit!2349)

(assert (=> b!30764 (= e!20464 lt!44792)))

(declare-fun lt!44802 () (_ BitVec 64))

(assert (=> b!30764 (= lt!44802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!44799 () (_ BitVec 64))

(assert (=> b!30764 (= lt!44799 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(assert (=> b!30764 (= lt!44792 (arrayBitRangesEqSymmetric!0 (buf!1111 thiss!1379) (buf!1111 (_2!1692 lt!44510)) lt!44802 lt!44799))))

(assert (=> b!30764 (arrayBitRangesEq!0 (buf!1111 (_2!1692 lt!44510)) (buf!1111 thiss!1379) lt!44802 lt!44799)))

(declare-fun d!8888 () Bool)

(assert (=> d!8888 e!20465))

(declare-fun res!26406 () Bool)

(assert (=> d!8888 (=> (not res!26406) (not e!20465))))

(assert (=> d!8888 (= res!26406 (isPrefixOf!0 (_1!1693 lt!44807) (_2!1693 lt!44807)))))

(declare-fun lt!44809 () BitStream!1376)

(assert (=> d!8888 (= lt!44807 (tuple2!3213 lt!44809 (_2!1692 lt!44510)))))

(declare-fun lt!44806 () Unit!2349)

(declare-fun lt!44811 () Unit!2349)

(assert (=> d!8888 (= lt!44806 lt!44811)))

(assert (=> d!8888 (isPrefixOf!0 lt!44809 (_2!1692 lt!44510))))

(assert (=> d!8888 (= lt!44811 (lemmaIsPrefixTransitive!0 lt!44809 (_2!1692 lt!44510) (_2!1692 lt!44510)))))

(declare-fun lt!44795 () Unit!2349)

(declare-fun lt!44804 () Unit!2349)

(assert (=> d!8888 (= lt!44795 lt!44804)))

(assert (=> d!8888 (isPrefixOf!0 lt!44809 (_2!1692 lt!44510))))

(assert (=> d!8888 (= lt!44804 (lemmaIsPrefixTransitive!0 lt!44809 thiss!1379 (_2!1692 lt!44510)))))

(declare-fun lt!44801 () Unit!2349)

(assert (=> d!8888 (= lt!44801 e!20464)))

(declare-fun c!2053 () Bool)

(assert (=> d!8888 (= c!2053 (not (= (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!44794 () Unit!2349)

(declare-fun lt!44796 () Unit!2349)

(assert (=> d!8888 (= lt!44794 lt!44796)))

(assert (=> d!8888 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44510))))

(assert (=> d!8888 (= lt!44796 (lemmaIsPrefixRefl!0 (_2!1692 lt!44510)))))

(declare-fun lt!44798 () Unit!2349)

(declare-fun lt!44808 () Unit!2349)

(assert (=> d!8888 (= lt!44798 lt!44808)))

(assert (=> d!8888 (= lt!44808 (lemmaIsPrefixRefl!0 (_2!1692 lt!44510)))))

(declare-fun lt!44805 () Unit!2349)

(declare-fun lt!44800 () Unit!2349)

(assert (=> d!8888 (= lt!44805 lt!44800)))

(assert (=> d!8888 (isPrefixOf!0 lt!44809 lt!44809)))

(assert (=> d!8888 (= lt!44800 (lemmaIsPrefixRefl!0 lt!44809))))

(declare-fun lt!44803 () Unit!2349)

(declare-fun lt!44797 () Unit!2349)

(assert (=> d!8888 (= lt!44803 lt!44797)))

(assert (=> d!8888 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!8888 (= lt!44797 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!8888 (= lt!44809 (BitStream!1377 (buf!1111 (_2!1692 lt!44510)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(assert (=> d!8888 (isPrefixOf!0 thiss!1379 (_2!1692 lt!44510))))

(assert (=> d!8888 (= (reader!0 thiss!1379 (_2!1692 lt!44510)) lt!44807)))

(assert (= (and d!8888 c!2053) b!30764))

(assert (= (and d!8888 (not c!2053)) b!30761))

(assert (= (and d!8888 res!26406) b!30762))

(assert (= (and b!30762 res!26407) b!30760))

(assert (= (and b!30760 res!26405) b!30763))

(declare-fun m!44993 () Bool)

(assert (=> b!30762 m!44993))

(assert (=> d!8888 m!44963))

(assert (=> d!8888 m!44811))

(declare-fun m!44995 () Bool)

(assert (=> d!8888 m!44995))

(declare-fun m!44997 () Bool)

(assert (=> d!8888 m!44997))

(assert (=> d!8888 m!44813))

(declare-fun m!44999 () Bool)

(assert (=> d!8888 m!44999))

(assert (=> d!8888 m!44799))

(declare-fun m!45001 () Bool)

(assert (=> d!8888 m!45001))

(assert (=> d!8888 m!44957))

(declare-fun m!45003 () Bool)

(assert (=> d!8888 m!45003))

(declare-fun m!45005 () Bool)

(assert (=> d!8888 m!45005))

(declare-fun m!45007 () Bool)

(assert (=> b!30760 m!45007))

(assert (=> b!30764 m!44815))

(declare-fun m!45009 () Bool)

(assert (=> b!30764 m!45009))

(declare-fun m!45011 () Bool)

(assert (=> b!30764 m!45011))

(declare-fun m!45013 () Bool)

(assert (=> b!30763 m!45013))

(assert (=> b!30763 m!44777))

(assert (=> b!30763 m!44815))

(assert (=> b!30622 d!8888))

(declare-fun d!8890 () Bool)

(declare-fun res!26415 () Bool)

(declare-fun e!20470 () Bool)

(assert (=> d!8890 (=> (not res!26415) (not e!20470))))

(assert (=> d!8890 (= res!26415 (= (size!783 (buf!1111 thiss!1379)) (size!783 (buf!1111 (_2!1692 lt!44527)))))))

(assert (=> d!8890 (= (isPrefixOf!0 thiss!1379 (_2!1692 lt!44527)) e!20470)))

(declare-fun b!30771 () Bool)

(declare-fun res!26414 () Bool)

(assert (=> b!30771 (=> (not res!26414) (not e!20470))))

(assert (=> b!30771 (= res!26414 (bvsle (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)) (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527)))))))

(declare-fun b!30772 () Bool)

(declare-fun e!20471 () Bool)

(assert (=> b!30772 (= e!20470 e!20471)))

(declare-fun res!26416 () Bool)

(assert (=> b!30772 (=> res!26416 e!20471)))

(assert (=> b!30772 (= res!26416 (= (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30773 () Bool)

(assert (=> b!30773 (= e!20471 (arrayBitRangesEq!0 (buf!1111 thiss!1379) (buf!1111 (_2!1692 lt!44527)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(assert (= (and d!8890 res!26415) b!30771))

(assert (= (and b!30771 res!26414) b!30772))

(assert (= (and b!30772 (not res!26416)) b!30773))

(assert (=> b!30771 m!44815))

(assert (=> b!30771 m!44773))

(assert (=> b!30773 m!44815))

(assert (=> b!30773 m!44815))

(declare-fun m!45015 () Bool)

(assert (=> b!30773 m!45015))

(assert (=> b!30622 d!8890))

(declare-fun d!8892 () Bool)

(assert (=> d!8892 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2474 () Bool)

(assert (= bs!2474 d!8892))

(declare-fun m!45017 () Bool)

(assert (=> bs!2474 m!45017))

(assert (=> b!30622 d!8892))

(declare-fun d!8894 () Bool)

(assert (=> d!8894 (isPrefixOf!0 thiss!1379 (_2!1692 lt!44527))))

(declare-fun lt!44814 () Unit!2349)

(declare-fun choose!30 (BitStream!1376 BitStream!1376 BitStream!1376) Unit!2349)

(assert (=> d!8894 (= lt!44814 (choose!30 thiss!1379 (_2!1692 lt!44510) (_2!1692 lt!44527)))))

(assert (=> d!8894 (isPrefixOf!0 thiss!1379 (_2!1692 lt!44510))))

(assert (=> d!8894 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1692 lt!44510) (_2!1692 lt!44527)) lt!44814)))

(declare-fun bs!2475 () Bool)

(assert (= bs!2475 d!8894))

(assert (=> bs!2475 m!44779))

(declare-fun m!45019 () Bool)

(assert (=> bs!2475 m!45019))

(assert (=> bs!2475 m!44799))

(assert (=> b!30622 d!8894))

(declare-fun d!8896 () Bool)

(assert (=> d!8896 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!44815 () Unit!2349)

(assert (=> d!8896 (= lt!44815 (choose!9 thiss!1379 (buf!1111 (_2!1692 lt!44510)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1377 (buf!1111 (_2!1692 lt!44510)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(assert (=> d!8896 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1111 (_2!1692 lt!44510)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!44815)))

(declare-fun bs!2476 () Bool)

(assert (= bs!2476 d!8896))

(assert (=> bs!2476 m!44787))

(declare-fun m!45021 () Bool)

(assert (=> bs!2476 m!45021))

(assert (=> b!30622 d!8896))

(declare-fun b!30843 () Bool)

(declare-fun res!26468 () Bool)

(declare-fun e!20504 () Bool)

(assert (=> b!30843 (=> (not res!26468) (not e!20504))))

(declare-fun lt!45130 () tuple2!3210)

(assert (=> b!30843 (= res!26468 (invariant!0 (currentBit!2455 (_2!1692 lt!45130)) (currentByte!2460 (_2!1692 lt!45130)) (size!783 (buf!1111 (_2!1692 lt!45130)))))))

(declare-fun d!8898 () Bool)

(assert (=> d!8898 e!20504))

(declare-fun res!26469 () Bool)

(assert (=> d!8898 (=> (not res!26469) (not e!20504))))

(declare-fun lt!45108 () (_ BitVec 64))

(assert (=> d!8898 (= res!26469 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45130))) (currentByte!2460 (_2!1692 lt!45130)) (currentBit!2455 (_2!1692 lt!45130))) (bvsub lt!45108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!8898 (or (= (bvand lt!45108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45108 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45108 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45110 () (_ BitVec 64))

(assert (=> d!8898 (= lt!45108 (bvadd lt!45110 to!314))))

(assert (=> d!8898 (or (not (= (bvand lt!45110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!45110 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!45110 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8898 (= lt!45110 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(declare-fun e!20505 () tuple2!3210)

(assert (=> d!8898 (= lt!45130 e!20505)))

(declare-fun c!2065 () Bool)

(assert (=> d!8898 (= c!2065 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!45122 () Unit!2349)

(declare-fun lt!45143 () Unit!2349)

(assert (=> d!8898 (= lt!45122 lt!45143)))

(assert (=> d!8898 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44510))))

(assert (=> d!8898 (= lt!45143 (lemmaIsPrefixRefl!0 (_2!1692 lt!44510)))))

(declare-fun lt!45142 () (_ BitVec 64))

(assert (=> d!8898 (= lt!45142 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))))))

(assert (=> d!8898 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8898 (= (appendBitsMSBFirstLoop!0 (_2!1692 lt!44510) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!45130)))

(declare-fun b!30844 () Bool)

(declare-fun res!26465 () Bool)

(assert (=> b!30844 (=> (not res!26465) (not e!20504))))

(assert (=> b!30844 (= res!26465 (= (size!783 (buf!1111 (_2!1692 lt!45130))) (size!783 (buf!1111 (_2!1692 lt!44510)))))))

(declare-fun b!30845 () Bool)

(declare-fun lt!45129 () tuple2!3212)

(assert (=> b!30845 (= e!20504 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!45130) (_1!1693 lt!45129) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1692 lt!45130) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!30845 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30845 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45137 () Unit!2349)

(declare-fun lt!45113 () Unit!2349)

(assert (=> b!30845 (= lt!45137 lt!45113)))

(declare-fun lt!45131 () (_ BitVec 64))

(assert (=> b!30845 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!45130)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!45131)))

(assert (=> b!30845 (= lt!45113 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!45130)) lt!45131))))

(declare-fun e!20503 () Bool)

(assert (=> b!30845 e!20503))

(declare-fun res!26464 () Bool)

(assert (=> b!30845 (=> (not res!26464) (not e!20503))))

(assert (=> b!30845 (= res!26464 (and (= (size!783 (buf!1111 (_2!1692 lt!44510))) (size!783 (buf!1111 (_2!1692 lt!45130)))) (bvsge lt!45131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30845 (= lt!45131 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!30845 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30845 (= lt!45129 (reader!0 (_2!1692 lt!44510) (_2!1692 lt!45130)))))

(declare-fun call!397 () tuple2!3212)

(declare-fun bm!394 () Bool)

(declare-fun lt!45146 () tuple2!3210)

(assert (=> bm!394 (= call!397 (reader!0 (_2!1692 lt!44510) (ite c!2065 (_2!1692 lt!45146) (_2!1692 lt!44510))))))

(declare-fun b!30846 () Bool)

(declare-fun res!26466 () Bool)

(assert (=> b!30846 (=> (not res!26466) (not e!20504))))

(assert (=> b!30846 (= res!26466 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!45130)))))

(declare-fun b!30847 () Bool)

(declare-fun lt!45120 () tuple2!3210)

(declare-fun Unit!2364 () Unit!2349)

(assert (=> b!30847 (= e!20505 (tuple2!3211 Unit!2364 (_2!1692 lt!45120)))))

(assert (=> b!30847 (= lt!45146 (appendBitFromByte!0 (_2!1692 lt!44510) (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!45135 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45135 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45111 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45111 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45136 () Unit!2349)

(assert (=> b!30847 (= lt!45136 (validateOffsetBitsIneqLemma!0 (_2!1692 lt!44510) (_2!1692 lt!45146) lt!45135 lt!45111))))

(assert (=> b!30847 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!45146)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!45146))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!45146))) (bvsub lt!45135 lt!45111))))

(declare-fun lt!45139 () Unit!2349)

(assert (=> b!30847 (= lt!45139 lt!45136)))

(declare-fun lt!45134 () tuple2!3212)

(assert (=> b!30847 (= lt!45134 call!397)))

(declare-fun lt!45119 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45119 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45145 () Unit!2349)

(assert (=> b!30847 (= lt!45145 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!45146)) lt!45119))))

(assert (=> b!30847 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!45146)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!45119)))

(declare-fun lt!45112 () Unit!2349)

(assert (=> b!30847 (= lt!45112 lt!45145)))

(assert (=> b!30847 (= (head!226 (byteArrayBitContentToList!0 (_2!1692 lt!45146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!226 (bitStreamReadBitsIntoList!0 (_2!1692 lt!45146) (_1!1693 lt!45134) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45115 () Unit!2349)

(declare-fun Unit!2365 () Unit!2349)

(assert (=> b!30847 (= lt!45115 Unit!2365)))

(assert (=> b!30847 (= lt!45120 (appendBitsMSBFirstLoop!0 (_2!1692 lt!45146) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!45127 () Unit!2349)

(assert (=> b!30847 (= lt!45127 (lemmaIsPrefixTransitive!0 (_2!1692 lt!44510) (_2!1692 lt!45146) (_2!1692 lt!45120)))))

(assert (=> b!30847 (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!45120))))

(declare-fun lt!45133 () Unit!2349)

(assert (=> b!30847 (= lt!45133 lt!45127)))

(assert (=> b!30847 (= (size!783 (buf!1111 (_2!1692 lt!45120))) (size!783 (buf!1111 (_2!1692 lt!44510))))))

(declare-fun lt!45123 () Unit!2349)

(declare-fun Unit!2366 () Unit!2349)

(assert (=> b!30847 (= lt!45123 Unit!2366)))

(assert (=> b!30847 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45120))) (currentByte!2460 (_2!1692 lt!45120)) (currentBit!2455 (_2!1692 lt!45120))) (bvsub (bvadd (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45105 () Unit!2349)

(declare-fun Unit!2367 () Unit!2349)

(assert (=> b!30847 (= lt!45105 Unit!2367)))

(assert (=> b!30847 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45120))) (currentByte!2460 (_2!1692 lt!45120)) (currentBit!2455 (_2!1692 lt!45120))) (bvsub (bvsub (bvadd (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45146))) (currentByte!2460 (_2!1692 lt!45146)) (currentBit!2455 (_2!1692 lt!45146))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45140 () Unit!2349)

(declare-fun Unit!2368 () Unit!2349)

(assert (=> b!30847 (= lt!45140 Unit!2368)))

(declare-fun lt!45121 () tuple2!3212)

(assert (=> b!30847 (= lt!45121 (reader!0 (_2!1692 lt!44510) (_2!1692 lt!45120)))))

(declare-fun lt!45125 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45125 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45107 () Unit!2349)

(assert (=> b!30847 (= lt!45107 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!44510) (buf!1111 (_2!1692 lt!45120)) lt!45125))))

(assert (=> b!30847 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!45120)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!45125)))

(declare-fun lt!45141 () Unit!2349)

(assert (=> b!30847 (= lt!45141 lt!45107)))

(declare-fun lt!45109 () tuple2!3212)

(assert (=> b!30847 (= lt!45109 (reader!0 (_2!1692 lt!45146) (_2!1692 lt!45120)))))

(declare-fun lt!45148 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45148 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45138 () Unit!2349)

(assert (=> b!30847 (= lt!45138 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1692 lt!45146) (buf!1111 (_2!1692 lt!45120)) lt!45148))))

(assert (=> b!30847 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!45120)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!45146))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!45146))) lt!45148)))

(declare-fun lt!45114 () Unit!2349)

(assert (=> b!30847 (= lt!45114 lt!45138)))

(declare-fun lt!45118 () List!389)

(assert (=> b!30847 (= lt!45118 (byteArrayBitContentToList!0 (_2!1692 lt!45120) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45144 () List!389)

(assert (=> b!30847 (= lt!45144 (byteArrayBitContentToList!0 (_2!1692 lt!45120) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45106 () List!389)

(assert (=> b!30847 (= lt!45106 (bitStreamReadBitsIntoList!0 (_2!1692 lt!45120) (_1!1693 lt!45121) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45126 () List!389)

(assert (=> b!30847 (= lt!45126 (bitStreamReadBitsIntoList!0 (_2!1692 lt!45120) (_1!1693 lt!45109) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45147 () (_ BitVec 64))

(assert (=> b!30847 (= lt!45147 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45124 () Unit!2349)

(assert (=> b!30847 (= lt!45124 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1692 lt!45120) (_2!1692 lt!45120) (_1!1693 lt!45121) (_1!1693 lt!45109) lt!45147 lt!45106))))

(assert (=> b!30847 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!45120) (_1!1693 lt!45109) (bvsub lt!45147 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!106 lt!45106))))

(declare-fun lt!45132 () Unit!2349)

(assert (=> b!30847 (= lt!45132 lt!45124)))

(declare-fun lt!45117 () Unit!2349)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1791 array!1791 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2349)

(assert (=> b!30847 (= lt!45117 (arrayBitRangesEqImpliesEq!0 (buf!1111 (_2!1692 lt!45146)) (buf!1111 (_2!1692 lt!45120)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!45142 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45146))) (currentByte!2460 (_2!1692 lt!45146)) (currentBit!2455 (_2!1692 lt!45146)))))))

(assert (=> b!30847 (= (bitAt!0 (buf!1111 (_2!1692 lt!45146)) lt!45142) (bitAt!0 (buf!1111 (_2!1692 lt!45120)) lt!45142))))

(declare-fun lt!45116 () Unit!2349)

(assert (=> b!30847 (= lt!45116 lt!45117)))

(declare-fun b!30848 () Bool)

(assert (=> b!30848 (= e!20503 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!45131))))

(declare-fun b!30849 () Bool)

(declare-fun Unit!2369 () Unit!2349)

(assert (=> b!30849 (= e!20505 (tuple2!3211 Unit!2369 (_2!1692 lt!44510)))))

(assert (=> b!30849 (= (size!783 (buf!1111 (_2!1692 lt!44510))) (size!783 (buf!1111 (_2!1692 lt!44510))))))

(declare-fun lt!45128 () Unit!2349)

(declare-fun Unit!2370 () Unit!2349)

(assert (=> b!30849 (= lt!45128 Unit!2370)))

(declare-fun checkByteArrayBitContent!0 (BitStream!1376 array!1791 array!1791 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3226 0))(
  ( (tuple2!3227 (_1!1700 array!1791) (_2!1700 BitStream!1376)) )
))
(declare-fun readBits!0 (BitStream!1376 (_ BitVec 64)) tuple2!3226)

(assert (=> b!30849 (checkByteArrayBitContent!0 (_2!1692 lt!44510) srcBuffer!2 (_1!1700 (readBits!0 (_1!1693 call!397) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!30850 () Bool)

(declare-fun res!26467 () Bool)

(assert (=> b!30850 (=> (not res!26467) (not e!20504))))

(assert (=> b!30850 (= res!26467 (= (size!783 (buf!1111 (_2!1692 lt!44510))) (size!783 (buf!1111 (_2!1692 lt!45130)))))))

(assert (= (and d!8898 c!2065) b!30847))

(assert (= (and d!8898 (not c!2065)) b!30849))

(assert (= (or b!30847 b!30849) bm!394))

(assert (= (and d!8898 res!26469) b!30843))

(assert (= (and b!30843 res!26468) b!30850))

(assert (= (and b!30850 res!26467) b!30846))

(assert (= (and b!30846 res!26466) b!30844))

(assert (= (and b!30844 res!26465) b!30845))

(assert (= (and b!30845 res!26464) b!30848))

(declare-fun m!45207 () Bool)

(assert (=> b!30846 m!45207))

(declare-fun m!45209 () Bool)

(assert (=> bm!394 m!45209))

(declare-fun m!45211 () Bool)

(assert (=> b!30845 m!45211))

(declare-fun m!45213 () Bool)

(assert (=> b!30845 m!45213))

(declare-fun m!45215 () Bool)

(assert (=> b!30845 m!45215))

(declare-fun m!45217 () Bool)

(assert (=> b!30845 m!45217))

(declare-fun m!45219 () Bool)

(assert (=> b!30845 m!45219))

(declare-fun m!45221 () Bool)

(assert (=> b!30849 m!45221))

(declare-fun m!45223 () Bool)

(assert (=> b!30849 m!45223))

(declare-fun m!45225 () Bool)

(assert (=> b!30848 m!45225))

(declare-fun m!45227 () Bool)

(assert (=> d!8898 m!45227))

(assert (=> d!8898 m!44777))

(assert (=> d!8898 m!44957))

(assert (=> d!8898 m!44963))

(declare-fun m!45229 () Bool)

(assert (=> b!30843 m!45229))

(declare-fun m!45231 () Bool)

(assert (=> b!30847 m!45231))

(declare-fun m!45233 () Bool)

(assert (=> b!30847 m!45233))

(declare-fun m!45235 () Bool)

(assert (=> b!30847 m!45235))

(declare-fun m!45237 () Bool)

(assert (=> b!30847 m!45237))

(declare-fun m!45239 () Bool)

(assert (=> b!30847 m!45239))

(declare-fun m!45241 () Bool)

(assert (=> b!30847 m!45241))

(declare-fun m!45243 () Bool)

(assert (=> b!30847 m!45243))

(declare-fun m!45245 () Bool)

(assert (=> b!30847 m!45245))

(declare-fun m!45247 () Bool)

(assert (=> b!30847 m!45247))

(declare-fun m!45249 () Bool)

(assert (=> b!30847 m!45249))

(declare-fun m!45251 () Bool)

(assert (=> b!30847 m!45251))

(declare-fun m!45253 () Bool)

(assert (=> b!30847 m!45253))

(declare-fun m!45255 () Bool)

(assert (=> b!30847 m!45255))

(declare-fun m!45257 () Bool)

(assert (=> b!30847 m!45257))

(declare-fun m!45259 () Bool)

(assert (=> b!30847 m!45259))

(assert (=> b!30847 m!45257))

(declare-fun m!45261 () Bool)

(assert (=> b!30847 m!45261))

(declare-fun m!45263 () Bool)

(assert (=> b!30847 m!45263))

(declare-fun m!45265 () Bool)

(assert (=> b!30847 m!45265))

(assert (=> b!30847 m!44777))

(assert (=> b!30847 m!45263))

(declare-fun m!45267 () Bool)

(assert (=> b!30847 m!45267))

(declare-fun m!45269 () Bool)

(assert (=> b!30847 m!45269))

(declare-fun m!45271 () Bool)

(assert (=> b!30847 m!45271))

(declare-fun m!45273 () Bool)

(assert (=> b!30847 m!45273))

(declare-fun m!45275 () Bool)

(assert (=> b!30847 m!45275))

(declare-fun m!45277 () Bool)

(assert (=> b!30847 m!45277))

(declare-fun m!45279 () Bool)

(assert (=> b!30847 m!45279))

(declare-fun m!45281 () Bool)

(assert (=> b!30847 m!45281))

(declare-fun m!45283 () Bool)

(assert (=> b!30847 m!45283))

(assert (=> b!30847 m!45239))

(assert (=> b!30847 m!45235))

(declare-fun m!45285 () Bool)

(assert (=> b!30847 m!45285))

(declare-fun m!45287 () Bool)

(assert (=> b!30847 m!45287))

(declare-fun m!45289 () Bool)

(assert (=> b!30847 m!45289))

(declare-fun m!45291 () Bool)

(assert (=> b!30847 m!45291))

(assert (=> b!30622 d!8898))

(declare-fun d!8948 () Bool)

(declare-fun res!26471 () Bool)

(declare-fun e!20506 () Bool)

(assert (=> d!8948 (=> (not res!26471) (not e!20506))))

(assert (=> d!8948 (= res!26471 (= (size!783 (buf!1111 (_2!1692 lt!44510))) (size!783 (buf!1111 (_2!1692 lt!44527)))))))

(assert (=> d!8948 (= (isPrefixOf!0 (_2!1692 lt!44510) (_2!1692 lt!44527)) e!20506)))

(declare-fun b!30851 () Bool)

(declare-fun res!26470 () Bool)

(assert (=> b!30851 (=> (not res!26470) (not e!20506))))

(assert (=> b!30851 (= res!26470 (bvsle (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510))) (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44527))) (currentByte!2460 (_2!1692 lt!44527)) (currentBit!2455 (_2!1692 lt!44527)))))))

(declare-fun b!30852 () Bool)

(declare-fun e!20507 () Bool)

(assert (=> b!30852 (= e!20506 e!20507)))

(declare-fun res!26472 () Bool)

(assert (=> b!30852 (=> res!26472 e!20507)))

(assert (=> b!30852 (= res!26472 (= (size!783 (buf!1111 (_2!1692 lt!44510))) #b00000000000000000000000000000000))))

(declare-fun b!30853 () Bool)

(assert (=> b!30853 (= e!20507 (arrayBitRangesEq!0 (buf!1111 (_2!1692 lt!44510)) (buf!1111 (_2!1692 lt!44527)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510)))))))

(assert (= (and d!8948 res!26471) b!30851))

(assert (= (and b!30851 res!26470) b!30852))

(assert (= (and b!30852 (not res!26472)) b!30853))

(assert (=> b!30851 m!44777))

(assert (=> b!30851 m!44773))

(assert (=> b!30853 m!44777))

(assert (=> b!30853 m!44777))

(declare-fun m!45293 () Bool)

(assert (=> b!30853 m!45293))

(assert (=> b!30622 d!8948))

(declare-fun d!8950 () Bool)

(assert (=> d!8950 (= (array_inv!741 (buf!1111 thiss!1379)) (bvsge (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!30624 d!8950))

(declare-fun d!8952 () Bool)

(declare-fun res!26474 () Bool)

(declare-fun e!20508 () Bool)

(assert (=> d!8952 (=> (not res!26474) (not e!20508))))

(assert (=> d!8952 (= res!26474 (= (size!783 (buf!1111 thiss!1379)) (size!783 (buf!1111 thiss!1379))))))

(assert (=> d!8952 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20508)))

(declare-fun b!30854 () Bool)

(declare-fun res!26473 () Bool)

(assert (=> b!30854 (=> (not res!26473) (not e!20508))))

(assert (=> b!30854 (= res!26473 (bvsle (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)) (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(declare-fun b!30855 () Bool)

(declare-fun e!20509 () Bool)

(assert (=> b!30855 (= e!20508 e!20509)))

(declare-fun res!26475 () Bool)

(assert (=> b!30855 (=> res!26475 e!20509)))

(assert (=> b!30855 (= res!26475 (= (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30856 () Bool)

(assert (=> b!30856 (= e!20509 (arrayBitRangesEq!0 (buf!1111 thiss!1379) (buf!1111 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(assert (= (and d!8952 res!26474) b!30854))

(assert (= (and b!30854 res!26473) b!30855))

(assert (= (and b!30855 (not res!26475)) b!30856))

(assert (=> b!30854 m!44815))

(assert (=> b!30854 m!44815))

(assert (=> b!30856 m!44815))

(assert (=> b!30856 m!44815))

(declare-fun m!45295 () Bool)

(assert (=> b!30856 m!45295))

(assert (=> b!30615 d!8952))

(declare-fun d!8954 () Bool)

(assert (=> d!8954 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45151 () Unit!2349)

(declare-fun choose!11 (BitStream!1376) Unit!2349)

(assert (=> d!8954 (= lt!45151 (choose!11 thiss!1379))))

(assert (=> d!8954 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!45151)))

(declare-fun bs!2491 () Bool)

(assert (= bs!2491 d!8954))

(assert (=> bs!2491 m!44811))

(declare-fun m!45297 () Bool)

(assert (=> bs!2491 m!45297))

(assert (=> b!30615 d!8954))

(declare-fun d!8956 () Bool)

(declare-fun e!20510 () Bool)

(assert (=> d!8956 e!20510))

(declare-fun res!26476 () Bool)

(assert (=> d!8956 (=> (not res!26476) (not e!20510))))

(declare-fun lt!45157 () (_ BitVec 64))

(declare-fun lt!45155 () (_ BitVec 64))

(declare-fun lt!45153 () (_ BitVec 64))

(assert (=> d!8956 (= res!26476 (= lt!45157 (bvsub lt!45155 lt!45153)))))

(assert (=> d!8956 (or (= (bvand lt!45155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45153 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45155 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45155 lt!45153) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8956 (= lt!45153 (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379))))))

(declare-fun lt!45156 () (_ BitVec 64))

(declare-fun lt!45154 () (_ BitVec 64))

(assert (=> d!8956 (= lt!45155 (bvmul lt!45156 lt!45154))))

(assert (=> d!8956 (or (= lt!45156 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45154 (bvsdiv (bvmul lt!45156 lt!45154) lt!45156)))))

(assert (=> d!8956 (= lt!45154 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!8956 (= lt!45156 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))))))

(assert (=> d!8956 (= lt!45157 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2460 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2455 thiss!1379))))))

(assert (=> d!8956 (invariant!0 (currentBit!2455 thiss!1379) (currentByte!2460 thiss!1379) (size!783 (buf!1111 thiss!1379)))))

(assert (=> d!8956 (= (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)) lt!45157)))

(declare-fun b!30857 () Bool)

(declare-fun res!26477 () Bool)

(assert (=> b!30857 (=> (not res!26477) (not e!20510))))

(assert (=> b!30857 (= res!26477 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45157))))

(declare-fun b!30858 () Bool)

(declare-fun lt!45152 () (_ BitVec 64))

(assert (=> b!30858 (= e!20510 (bvsle lt!45157 (bvmul lt!45152 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!30858 (or (= lt!45152 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45152 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45152)))))

(assert (=> b!30858 (= lt!45152 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))))))

(assert (= (and d!8956 res!26476) b!30857))

(assert (= (and b!30857 res!26477) b!30858))

(declare-fun m!45299 () Bool)

(assert (=> d!8956 m!45299))

(declare-fun m!45301 () Bool)

(assert (=> d!8956 m!45301))

(assert (=> b!30615 d!8956))

(declare-fun d!8958 () Bool)

(declare-fun size!785 (List!389) Int)

(assert (=> d!8958 (= (length!115 lt!44520) (size!785 lt!44520))))

(declare-fun bs!2492 () Bool)

(assert (= bs!2492 d!8958))

(declare-fun m!45303 () Bool)

(assert (=> bs!2492 m!45303))

(assert (=> b!30614 d!8958))

(declare-fun d!8960 () Bool)

(assert (=> d!8960 (= (invariant!0 (currentBit!2455 (_2!1692 lt!44527)) (currentByte!2460 (_2!1692 lt!44527)) (size!783 (buf!1111 (_2!1692 lt!44527)))) (and (bvsge (currentBit!2455 (_2!1692 lt!44527)) #b00000000000000000000000000000000) (bvslt (currentBit!2455 (_2!1692 lt!44527)) #b00000000000000000000000000001000) (bvsge (currentByte!2460 (_2!1692 lt!44527)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2460 (_2!1692 lt!44527)) (size!783 (buf!1111 (_2!1692 lt!44527)))) (and (= (currentBit!2455 (_2!1692 lt!44527)) #b00000000000000000000000000000000) (= (currentByte!2460 (_2!1692 lt!44527)) (size!783 (buf!1111 (_2!1692 lt!44527))))))))))

(assert (=> b!30625 d!8960))

(declare-fun d!8962 () Bool)

(assert (=> d!8962 (= (array_inv!741 srcBuffer!2) (bvsge (size!783 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6504 d!8962))

(declare-fun d!8964 () Bool)

(assert (=> d!8964 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2455 thiss!1379) (currentByte!2460 thiss!1379) (size!783 (buf!1111 thiss!1379))))))

(declare-fun bs!2493 () Bool)

(assert (= bs!2493 d!8964))

(assert (=> bs!2493 m!45301))

(assert (=> start!6504 d!8964))

(declare-fun d!8966 () Bool)

(assert (=> d!8966 (= (invariant!0 (currentBit!2455 (_2!1692 lt!44510)) (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44510)))) (and (bvsge (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (bvslt (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000001000) (bvsge (currentByte!2460 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44510)))) (and (= (currentBit!2455 (_2!1692 lt!44510)) #b00000000000000000000000000000000) (= (currentByte!2460 (_2!1692 lt!44510)) (size!783 (buf!1111 (_2!1692 lt!44510))))))))))

(assert (=> b!30616 d!8966))

(declare-fun d!8968 () Bool)

(assert (=> d!8968 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 thiss!1379))) ((_ sign_extend 32) (currentByte!2460 thiss!1379)) ((_ sign_extend 32) (currentBit!2455 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2494 () Bool)

(assert (= bs!2494 d!8968))

(assert (=> bs!2494 m!45299))

(assert (=> b!30627 d!8968))

(declare-fun d!8970 () Bool)

(assert (=> d!8970 (= (head!226 (byteArrayBitContentToList!0 (_2!1692 lt!44510) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!504 (byteArrayBitContentToList!0 (_2!1692 lt!44510) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30626 d!8970))

(declare-fun d!8972 () Bool)

(declare-fun c!2068 () Bool)

(assert (=> d!8972 (= c!2068 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20513 () List!389)

(assert (=> d!8972 (= (byteArrayBitContentToList!0 (_2!1692 lt!44510) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20513)))

(declare-fun b!30863 () Bool)

(assert (=> b!30863 (= e!20513 Nil!386)))

(declare-fun b!30864 () Bool)

(assert (=> b!30864 (= e!20513 (Cons!385 (not (= (bvand ((_ sign_extend 24) (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1692 lt!44510) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!8972 c!2068) b!30863))

(assert (= (and d!8972 (not c!2068)) b!30864))

(assert (=> b!30864 m!44795))

(declare-fun m!45305 () Bool)

(assert (=> b!30864 m!45305))

(declare-fun m!45307 () Bool)

(assert (=> b!30864 m!45307))

(assert (=> b!30626 d!8972))

(declare-fun d!8974 () Bool)

(assert (=> d!8974 (= (head!226 (bitStreamReadBitsIntoList!0 (_2!1692 lt!44510) (_1!1693 lt!44517) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!504 (bitStreamReadBitsIntoList!0 (_2!1692 lt!44510) (_1!1693 lt!44517) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!30626 d!8974))

(declare-fun b!30868 () Bool)

(declare-fun e!20514 () Bool)

(declare-fun lt!45159 () List!389)

(assert (=> b!30868 (= e!20514 (> (length!115 lt!45159) 0))))

(declare-fun e!20515 () tuple2!3222)

(declare-fun lt!45160 () tuple2!3224)

(declare-fun b!30866 () Bool)

(declare-fun lt!45158 () (_ BitVec 64))

(assert (=> b!30866 (= e!20515 (tuple2!3223 (Cons!385 (_1!1699 lt!45160) (bitStreamReadBitsIntoList!0 (_2!1692 lt!44510) (_2!1699 lt!45160) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!45158))) (_2!1699 lt!45160)))))

(assert (=> b!30866 (= lt!45160 (readBit!0 (_1!1693 lt!44517)))))

(assert (=> b!30866 (= lt!45158 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!30867 () Bool)

(assert (=> b!30867 (= e!20514 (isEmpty!82 lt!45159))))

(declare-fun b!30865 () Bool)

(assert (=> b!30865 (= e!20515 (tuple2!3223 Nil!386 (_1!1693 lt!44517)))))

(declare-fun d!8976 () Bool)

(assert (=> d!8976 e!20514))

(declare-fun c!2069 () Bool)

(assert (=> d!8976 (= c!2069 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8976 (= lt!45159 (_1!1698 e!20515))))

(declare-fun c!2070 () Bool)

(assert (=> d!8976 (= c!2070 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8976 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8976 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!44510) (_1!1693 lt!44517) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45159)))

(assert (= (and d!8976 c!2070) b!30865))

(assert (= (and d!8976 (not c!2070)) b!30866))

(assert (= (and d!8976 c!2069) b!30867))

(assert (= (and d!8976 (not c!2069)) b!30868))

(declare-fun m!45309 () Bool)

(assert (=> b!30868 m!45309))

(declare-fun m!45311 () Bool)

(assert (=> b!30866 m!45311))

(declare-fun m!45313 () Bool)

(assert (=> b!30866 m!45313))

(declare-fun m!45315 () Bool)

(assert (=> b!30867 m!45315))

(assert (=> b!30626 d!8976))

(declare-fun d!8978 () Bool)

(declare-fun res!26479 () Bool)

(declare-fun e!20516 () Bool)

(assert (=> d!8978 (=> (not res!26479) (not e!20516))))

(assert (=> d!8978 (= res!26479 (= (size!783 (buf!1111 thiss!1379)) (size!783 (buf!1111 (_2!1692 lt!44510)))))))

(assert (=> d!8978 (= (isPrefixOf!0 thiss!1379 (_2!1692 lt!44510)) e!20516)))

(declare-fun b!30869 () Bool)

(declare-fun res!26478 () Bool)

(assert (=> b!30869 (=> (not res!26478) (not e!20516))))

(assert (=> b!30869 (= res!26478 (bvsle (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)) (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!44510))) (currentByte!2460 (_2!1692 lt!44510)) (currentBit!2455 (_2!1692 lt!44510)))))))

(declare-fun b!30870 () Bool)

(declare-fun e!20517 () Bool)

(assert (=> b!30870 (= e!20516 e!20517)))

(declare-fun res!26480 () Bool)

(assert (=> b!30870 (=> res!26480 e!20517)))

(assert (=> b!30870 (= res!26480 (= (size!783 (buf!1111 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!30871 () Bool)

(assert (=> b!30871 (= e!20517 (arrayBitRangesEq!0 (buf!1111 thiss!1379) (buf!1111 (_2!1692 lt!44510)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379))))))

(assert (= (and d!8978 res!26479) b!30869))

(assert (= (and b!30869 res!26478) b!30870))

(assert (= (and b!30870 (not res!26480)) b!30871))

(assert (=> b!30869 m!44815))

(assert (=> b!30869 m!44777))

(assert (=> b!30871 m!44815))

(assert (=> b!30871 m!44815))

(declare-fun m!45317 () Bool)

(assert (=> b!30871 m!45317))

(assert (=> b!30628 d!8978))

(declare-fun d!8980 () Bool)

(assert (=> d!8980 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) lt!44521) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510)))) lt!44521))))

(declare-fun bs!2495 () Bool)

(assert (= bs!2495 d!8980))

(assert (=> bs!2495 m!44991))

(assert (=> b!30628 d!8980))

(declare-fun d!8982 () Bool)

(declare-fun e!20520 () Bool)

(assert (=> d!8982 e!20520))

(declare-fun res!26483 () Bool)

(assert (=> d!8982 (=> (not res!26483) (not e!20520))))

(assert (=> d!8982 (= res!26483 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45163 () Unit!2349)

(declare-fun choose!27 (BitStream!1376 BitStream!1376 (_ BitVec 64) (_ BitVec 64)) Unit!2349)

(assert (=> d!8982 (= lt!45163 (choose!27 thiss!1379 (_2!1692 lt!44510) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!8982 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!8982 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1692 lt!44510) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45163)))

(declare-fun b!30874 () Bool)

(assert (=> b!30874 (= e!20520 (validate_offset_bits!1 ((_ sign_extend 32) (size!783 (buf!1111 (_2!1692 lt!44510)))) ((_ sign_extend 32) (currentByte!2460 (_2!1692 lt!44510))) ((_ sign_extend 32) (currentBit!2455 (_2!1692 lt!44510))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!8982 res!26483) b!30874))

(declare-fun m!45319 () Bool)

(assert (=> d!8982 m!45319))

(declare-fun m!45321 () Bool)

(assert (=> b!30874 m!45321))

(assert (=> b!30628 d!8982))

(declare-fun b!30892 () Bool)

(declare-fun res!26502 () Bool)

(declare-fun e!20532 () Bool)

(assert (=> b!30892 (=> (not res!26502) (not e!20532))))

(declare-fun lt!45196 () tuple2!3210)

(assert (=> b!30892 (= res!26502 (isPrefixOf!0 thiss!1379 (_2!1692 lt!45196)))))

(declare-fun b!30893 () Bool)

(declare-fun e!20531 () Bool)

(declare-datatypes ((tuple2!3230 0))(
  ( (tuple2!3231 (_1!1702 BitStream!1376) (_2!1702 Bool)) )
))
(declare-fun lt!45194 () tuple2!3230)

(assert (=> b!30893 (= e!20531 (= (bitIndex!0 (size!783 (buf!1111 (_1!1702 lt!45194))) (currentByte!2460 (_1!1702 lt!45194)) (currentBit!2455 (_1!1702 lt!45194))) (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45196))) (currentByte!2460 (_2!1692 lt!45196)) (currentBit!2455 (_2!1692 lt!45196)))))))

(declare-fun d!8984 () Bool)

(declare-fun e!20530 () Bool)

(assert (=> d!8984 e!20530))

(declare-fun res!26504 () Bool)

(assert (=> d!8984 (=> (not res!26504) (not e!20530))))

(declare-fun lt!45191 () tuple2!3210)

(assert (=> d!8984 (= res!26504 (= (size!783 (buf!1111 (_2!1692 lt!45191))) (size!783 (buf!1111 thiss!1379))))))

(declare-fun lt!45199 () (_ BitVec 8))

(declare-fun lt!45190 () array!1791)

(assert (=> d!8984 (= lt!45199 (select (arr!1249 lt!45190) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!8984 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!783 lt!45190)))))

(assert (=> d!8984 (= lt!45190 (array!1792 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!45189 () tuple2!3210)

(assert (=> d!8984 (= lt!45191 (tuple2!3211 (_1!1692 lt!45189) (_2!1692 lt!45189)))))

(assert (=> d!8984 (= lt!45189 lt!45196)))

(assert (=> d!8984 e!20532))

(declare-fun res!26506 () Bool)

(assert (=> d!8984 (=> (not res!26506) (not e!20532))))

(assert (=> d!8984 (= res!26506 (= (size!783 (buf!1111 thiss!1379)) (size!783 (buf!1111 (_2!1692 lt!45196)))))))

(declare-fun lt!45193 () Bool)

(declare-fun appendBit!0 (BitStream!1376 Bool) tuple2!3210)

(assert (=> d!8984 (= lt!45196 (appendBit!0 thiss!1379 lt!45193))))

(assert (=> d!8984 (= lt!45193 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!8984 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!8984 (= (appendBitFromByte!0 thiss!1379 (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!45191)))

(declare-fun b!30894 () Bool)

(declare-fun res!26503 () Bool)

(assert (=> b!30894 (=> (not res!26503) (not e!20530))))

(declare-fun lt!45195 () (_ BitVec 64))

(declare-fun lt!45188 () (_ BitVec 64))

(assert (=> b!30894 (= res!26503 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45191))) (currentByte!2460 (_2!1692 lt!45191)) (currentBit!2455 (_2!1692 lt!45191))) (bvadd lt!45195 lt!45188)))))

(assert (=> b!30894 (or (not (= (bvand lt!45195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45188 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!45195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!45195 lt!45188) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!30894 (= lt!45188 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!30894 (= lt!45195 (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)))))

(declare-fun b!30895 () Bool)

(declare-fun res!26507 () Bool)

(assert (=> b!30895 (=> (not res!26507) (not e!20532))))

(assert (=> b!30895 (= res!26507 (= (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45196))) (currentByte!2460 (_2!1692 lt!45196)) (currentBit!2455 (_2!1692 lt!45196))) (bvadd (bitIndex!0 (size!783 (buf!1111 thiss!1379)) (currentByte!2460 thiss!1379) (currentBit!2455 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!30896 () Bool)

(declare-fun res!26505 () Bool)

(assert (=> b!30896 (=> (not res!26505) (not e!20530))))

(assert (=> b!30896 (= res!26505 (isPrefixOf!0 thiss!1379 (_2!1692 lt!45191)))))

(declare-fun b!30897 () Bool)

(declare-fun e!20529 () Bool)

(assert (=> b!30897 (= e!20530 e!20529)))

(declare-fun res!26501 () Bool)

(assert (=> b!30897 (=> (not res!26501) (not e!20529))))

(declare-fun lt!45198 () tuple2!3230)

(assert (=> b!30897 (= res!26501 (and (= (_2!1702 lt!45198) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1249 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!45199)) #b00000000000000000000000000000000))) (= (_1!1702 lt!45198) (_2!1692 lt!45191))))))

(declare-fun lt!45197 () tuple2!3226)

(declare-fun lt!45192 () BitStream!1376)

(assert (=> b!30897 (= lt!45197 (readBits!0 lt!45192 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1376) tuple2!3230)

(assert (=> b!30897 (= lt!45198 (readBitPure!0 lt!45192))))

(declare-fun readerFrom!0 (BitStream!1376 (_ BitVec 32) (_ BitVec 32)) BitStream!1376)

(assert (=> b!30897 (= lt!45192 (readerFrom!0 (_2!1692 lt!45191) (currentBit!2455 thiss!1379) (currentByte!2460 thiss!1379)))))

(declare-fun b!30898 () Bool)

(assert (=> b!30898 (= e!20529 (= (bitIndex!0 (size!783 (buf!1111 (_1!1702 lt!45198))) (currentByte!2460 (_1!1702 lt!45198)) (currentBit!2455 (_1!1702 lt!45198))) (bitIndex!0 (size!783 (buf!1111 (_2!1692 lt!45191))) (currentByte!2460 (_2!1692 lt!45191)) (currentBit!2455 (_2!1692 lt!45191)))))))

(declare-fun b!30899 () Bool)

(assert (=> b!30899 (= e!20532 e!20531)))

(declare-fun res!26500 () Bool)

(assert (=> b!30899 (=> (not res!26500) (not e!20531))))

(assert (=> b!30899 (= res!26500 (and (= (_2!1702 lt!45194) lt!45193) (= (_1!1702 lt!45194) (_2!1692 lt!45196))))))

(assert (=> b!30899 (= lt!45194 (readBitPure!0 (readerFrom!0 (_2!1692 lt!45196) (currentBit!2455 thiss!1379) (currentByte!2460 thiss!1379))))))

(assert (= (and d!8984 res!26506) b!30895))

(assert (= (and b!30895 res!26507) b!30892))

(assert (= (and b!30892 res!26502) b!30899))

(assert (= (and b!30899 res!26500) b!30893))

(assert (= (and d!8984 res!26504) b!30894))

(assert (= (and b!30894 res!26503) b!30896))

(assert (= (and b!30896 res!26505) b!30897))

(assert (= (and b!30897 res!26501) b!30898))

(declare-fun m!45323 () Bool)

(assert (=> b!30893 m!45323))

(declare-fun m!45325 () Bool)

(assert (=> b!30893 m!45325))

(declare-fun m!45327 () Bool)

(assert (=> d!8984 m!45327))

(declare-fun m!45329 () Bool)

(assert (=> d!8984 m!45329))

(assert (=> d!8984 m!45305))

(declare-fun m!45331 () Bool)

(assert (=> b!30892 m!45331))

(declare-fun m!45333 () Bool)

(assert (=> b!30896 m!45333))

(declare-fun m!45335 () Bool)

(assert (=> b!30899 m!45335))

(assert (=> b!30899 m!45335))

(declare-fun m!45337 () Bool)

(assert (=> b!30899 m!45337))

(declare-fun m!45339 () Bool)

(assert (=> b!30898 m!45339))

(declare-fun m!45341 () Bool)

(assert (=> b!30898 m!45341))

(declare-fun m!45343 () Bool)

(assert (=> b!30897 m!45343))

(declare-fun m!45345 () Bool)

(assert (=> b!30897 m!45345))

(declare-fun m!45347 () Bool)

(assert (=> b!30897 m!45347))

(assert (=> b!30895 m!45325))

(assert (=> b!30895 m!44815))

(assert (=> b!30894 m!45341))

(assert (=> b!30894 m!44815))

(assert (=> b!30628 d!8984))

(declare-fun d!8986 () Bool)

(assert (=> d!8986 (= (tail!106 lt!44520) (t!1139 lt!44520))))

(assert (=> b!30617 d!8986))

(declare-fun d!8988 () Bool)

(declare-fun e!20535 () Bool)

(assert (=> d!8988 e!20535))

(declare-fun res!26510 () Bool)

(assert (=> d!8988 (=> (not res!26510) (not e!20535))))

(declare-fun lt!45205 () (_ BitVec 64))

(assert (=> d!8988 (= res!26510 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45205 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!45205) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8988 (= lt!45205 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45204 () Unit!2349)

(declare-fun choose!42 (BitStream!1376 BitStream!1376 BitStream!1376 BitStream!1376 (_ BitVec 64) List!389) Unit!2349)

(assert (=> d!8988 (= lt!45204 (choose!42 (_2!1692 lt!44527) (_2!1692 lt!44527) (_1!1693 lt!44518) (_1!1693 lt!44515) (bvsub to!314 i!635) lt!44520))))

(assert (=> d!8988 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!8988 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1692 lt!44527) (_2!1692 lt!44527) (_1!1693 lt!44518) (_1!1693 lt!44515) (bvsub to!314 i!635) lt!44520) lt!45204)))

(declare-fun b!30902 () Bool)

(assert (=> b!30902 (= e!20535 (= (bitStreamReadBitsIntoList!0 (_2!1692 lt!44527) (_1!1693 lt!44515) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!106 lt!44520)))))

(assert (= (and d!8988 res!26510) b!30902))

(declare-fun m!45349 () Bool)

(assert (=> d!8988 m!45349))

(declare-fun m!45351 () Bool)

(assert (=> b!30902 m!45351))

(assert (=> b!30902 m!44767))

(assert (=> b!30617 d!8988))

(push 1)

(assert (not b!30853))

(assert (not b!30894))

(assert (not d!8954))

(assert (not b!30898))

(assert (not d!8896))

(assert (not b!30874))

(assert (not b!30868))

(assert (not d!8886))

(assert (not d!8870))

(assert (not d!8880))

(assert (not b!30848))

(assert (not b!30896))

(assert (not d!8968))

(assert (not d!8956))

(assert (not b!30731))

(assert (not d!8894))

(assert (not b!30854))

(assert (not b!30727))

(assert (not b!30866))

(assert (not b!30746))

(assert (not bm!394))

(assert (not b!30729))

(assert (not d!8872))

(assert (not b!30725))

(assert (not b!30744))

(assert (not b!30730))

(assert (not d!8964))

(assert (not d!8876))

(assert (not b!30764))

(assert (not b!30902))

(assert (not b!30742))

(assert (not d!8984))

(assert (not d!8888))

(assert (not b!30856))

(assert (not b!30749))

(assert (not b!30773))

(assert (not b!30899))

(assert (not d!8982))

(assert (not b!30867))

(assert (not d!8862))

(assert (not d!8874))

(assert (not b!30843))

(assert (not b!30892))

(assert (not d!8898))

(assert (not b!30869))

(assert (not b!30751))

(assert (not b!30747))

(assert (not b!30726))

(assert (not d!8958))

(assert (not b!30750))

(assert (not b!30771))

(assert (not b!30846))

(assert (not b!30763))

(assert (not b!30893))

(assert (not b!30849))

(assert (not d!8892))

(assert (not d!8980))

(assert (not b!30845))

(assert (not b!30895))

(assert (not b!30847))

(assert (not b!30864))

(assert (not b!30851))

(assert (not b!30871))

(assert (not b!30762))

(assert (not b!30760))

(assert (not d!8866))

(assert (not b!30897))

(assert (not b!30745))

(assert (not d!8988))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

