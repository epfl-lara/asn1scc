; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10020 () Bool)

(assert start!10020)

(declare-fun b!50754 () Bool)

(declare-fun e!33552 () Bool)

(declare-fun e!33543 () Bool)

(assert (=> b!50754 (= e!33552 e!33543)))

(declare-fun res!42518 () Bool)

(assert (=> b!50754 (=> res!42518 e!33543)))

(declare-datatypes ((array!2342 0))(
  ( (array!2343 (arr!1594 (Array (_ BitVec 32) (_ BitVec 8))) (size!1065 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2342)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!78607 () Bool)

(declare-datatypes ((BitStream!1844 0))(
  ( (BitStream!1845 (buf!1420 array!2342) (currentByte!2943 (_ BitVec 32)) (currentBit!2938 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3505 0))(
  ( (Unit!3506) )
))
(declare-datatypes ((tuple2!4676 0))(
  ( (tuple2!4677 (_1!2443 Unit!3505) (_2!2443 BitStream!1844)) )
))
(declare-fun lt!78622 () tuple2!4676)

(declare-datatypes ((List!563 0))(
  ( (Nil!560) (Cons!559 (h!678 Bool) (t!1313 List!563)) )
))
(declare-fun head!382 (List!563) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1844 array!2342 (_ BitVec 64) (_ BitVec 64)) List!563)

(assert (=> b!50754 (= res!42518 (not (= (head!382 (byteArrayBitContentToList!0 (_2!2443 lt!78622) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!78607)))))

(declare-fun bitAt!0 (array!2342 (_ BitVec 64)) Bool)

(assert (=> b!50754 (= lt!78607 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!50755 () Bool)

(declare-fun e!33545 () Bool)

(assert (=> b!50755 (= e!33543 e!33545)))

(declare-fun res!42517 () Bool)

(assert (=> b!50755 (=> res!42517 e!33545)))

(declare-fun lt!78617 () Bool)

(assert (=> b!50755 (= res!42517 (not (= lt!78617 lt!78607)))))

(declare-fun lt!78613 () tuple2!4676)

(declare-fun lt!78619 () (_ BitVec 64))

(assert (=> b!50755 (= lt!78617 (bitAt!0 (buf!1420 (_2!2443 lt!78613)) lt!78619))))

(declare-fun e!33557 () Bool)

(declare-fun b!50756 () Bool)

(declare-datatypes ((tuple2!4678 0))(
  ( (tuple2!4679 (_1!2444 BitStream!1844) (_2!2444 BitStream!1844)) )
))
(declare-fun lt!78612 () tuple2!4678)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1844 BitStream!1844 (_ BitVec 64)) List!563)

(assert (=> b!50756 (= e!33557 (= (head!382 (byteArrayBitContentToList!0 (_2!2443 lt!78613) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!382 (bitStreamReadBitsIntoList!0 (_2!2443 lt!78613) (_1!2444 lt!78612) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!42510 () Bool)

(declare-fun e!33546 () Bool)

(assert (=> start!10020 (=> (not res!42510) (not e!33546))))

(assert (=> start!10020 (= res!42510 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1065 srcBuffer!2))))))))

(assert (=> start!10020 e!33546))

(assert (=> start!10020 true))

(declare-fun array_inv!975 (array!2342) Bool)

(assert (=> start!10020 (array_inv!975 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1844)

(declare-fun e!33554 () Bool)

(declare-fun inv!12 (BitStream!1844) Bool)

(assert (=> start!10020 (and (inv!12 thiss!1379) e!33554)))

(declare-fun b!50757 () Bool)

(declare-fun res!42515 () Bool)

(declare-fun e!33556 () Bool)

(assert (=> b!50757 (=> res!42515 e!33556)))

(declare-fun lt!78605 () List!563)

(declare-fun length!258 (List!563) Int)

(assert (=> b!50757 (= res!42515 (<= (length!258 lt!78605) 0))))

(declare-fun b!50758 () Bool)

(declare-fun res!42523 () Bool)

(declare-fun e!33550 () Bool)

(assert (=> b!50758 (=> res!42523 e!33550)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!50758 (= res!42523 (not (invariant!0 (currentBit!2938 (_2!2443 lt!78613)) (currentByte!2943 (_2!2443 lt!78613)) (size!1065 (buf!1420 (_2!2443 lt!78613))))))))

(declare-fun b!50759 () Bool)

(declare-fun res!42528 () Bool)

(assert (=> b!50759 (=> (not res!42528) (not e!33546))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!50759 (= res!42528 (validate_offset_bits!1 ((_ sign_extend 32) (size!1065 (buf!1420 thiss!1379))) ((_ sign_extend 32) (currentByte!2943 thiss!1379)) ((_ sign_extend 32) (currentBit!2938 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!50760 () Bool)

(declare-fun e!33548 () Bool)

(declare-fun e!33551 () Bool)

(assert (=> b!50760 (= e!33548 e!33551)))

(declare-fun res!42525 () Bool)

(assert (=> b!50760 (=> res!42525 e!33551)))

(declare-fun isPrefixOf!0 (BitStream!1844 BitStream!1844) Bool)

(assert (=> b!50760 (= res!42525 (not (isPrefixOf!0 thiss!1379 (_2!2443 lt!78613))))))

(declare-fun lt!78627 () (_ BitVec 64))

(assert (=> b!50760 (validate_offset_bits!1 ((_ sign_extend 32) (size!1065 (buf!1420 (_2!2443 lt!78613)))) ((_ sign_extend 32) (currentByte!2943 (_2!2443 lt!78613))) ((_ sign_extend 32) (currentBit!2938 (_2!2443 lt!78613))) lt!78627)))

(assert (=> b!50760 (= lt!78627 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78616 () Unit!3505)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1844 BitStream!1844 (_ BitVec 64) (_ BitVec 64)) Unit!3505)

(assert (=> b!50760 (= lt!78616 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2443 lt!78613) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1844 (_ BitVec 8) (_ BitVec 32)) tuple2!4676)

(assert (=> b!50760 (= lt!78613 (appendBitFromByte!0 thiss!1379 (select (arr!1594 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!50761 () Bool)

(assert (=> b!50761 (= e!33550 e!33556)))

(declare-fun res!42514 () Bool)

(assert (=> b!50761 (=> res!42514 e!33556)))

(assert (=> b!50761 (= res!42514 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!78609 () List!563)

(declare-fun lt!78621 () tuple2!4678)

(assert (=> b!50761 (= lt!78609 (bitStreamReadBitsIntoList!0 (_2!2443 lt!78622) (_1!2444 lt!78621) lt!78627))))

(declare-fun lt!78608 () tuple2!4678)

(assert (=> b!50761 (= lt!78605 (bitStreamReadBitsIntoList!0 (_2!2443 lt!78622) (_1!2444 lt!78608) (bvsub to!314 i!635)))))

(assert (=> b!50761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1065 (buf!1420 (_2!2443 lt!78622)))) ((_ sign_extend 32) (currentByte!2943 (_2!2443 lt!78613))) ((_ sign_extend 32) (currentBit!2938 (_2!2443 lt!78613))) lt!78627)))

(declare-fun lt!78623 () Unit!3505)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1844 array!2342 (_ BitVec 64)) Unit!3505)

(assert (=> b!50761 (= lt!78623 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2443 lt!78613) (buf!1420 (_2!2443 lt!78622)) lt!78627))))

(declare-fun reader!0 (BitStream!1844 BitStream!1844) tuple2!4678)

(assert (=> b!50761 (= lt!78621 (reader!0 (_2!2443 lt!78613) (_2!2443 lt!78622)))))

(assert (=> b!50761 (validate_offset_bits!1 ((_ sign_extend 32) (size!1065 (buf!1420 (_2!2443 lt!78622)))) ((_ sign_extend 32) (currentByte!2943 thiss!1379)) ((_ sign_extend 32) (currentBit!2938 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!78611 () Unit!3505)

(assert (=> b!50761 (= lt!78611 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1420 (_2!2443 lt!78622)) (bvsub to!314 i!635)))))

(assert (=> b!50761 (= lt!78608 (reader!0 thiss!1379 (_2!2443 lt!78622)))))

(declare-fun b!50762 () Bool)

(declare-fun e!33547 () Bool)

(assert (=> b!50762 (= e!33551 e!33547)))

(declare-fun res!42516 () Bool)

(assert (=> b!50762 (=> res!42516 e!33547)))

(assert (=> b!50762 (= res!42516 (not (isPrefixOf!0 (_2!2443 lt!78613) (_2!2443 lt!78622))))))

(assert (=> b!50762 (isPrefixOf!0 thiss!1379 (_2!2443 lt!78622))))

(declare-fun lt!78620 () Unit!3505)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1844 BitStream!1844 BitStream!1844) Unit!3505)

(assert (=> b!50762 (= lt!78620 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2443 lt!78613) (_2!2443 lt!78622)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1844 array!2342 (_ BitVec 64) (_ BitVec 64)) tuple2!4676)

(assert (=> b!50762 (= lt!78622 (appendBitsMSBFirstLoop!0 (_2!2443 lt!78613) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!50762 e!33557))

(declare-fun res!42527 () Bool)

(assert (=> b!50762 (=> (not res!42527) (not e!33557))))

(assert (=> b!50762 (= res!42527 (validate_offset_bits!1 ((_ sign_extend 32) (size!1065 (buf!1420 (_2!2443 lt!78613)))) ((_ sign_extend 32) (currentByte!2943 thiss!1379)) ((_ sign_extend 32) (currentBit!2938 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!78626 () Unit!3505)

(assert (=> b!50762 (= lt!78626 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1420 (_2!2443 lt!78613)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50762 (= lt!78612 (reader!0 thiss!1379 (_2!2443 lt!78613)))))

(declare-fun b!50763 () Bool)

(declare-fun res!42511 () Bool)

(assert (=> b!50763 (=> res!42511 e!33552)))

(declare-fun lt!78618 () Bool)

(assert (=> b!50763 (= res!42511 (not (= (head!382 lt!78605) lt!78618)))))

(declare-fun b!50764 () Bool)

(declare-fun res!42519 () Bool)

(declare-fun e!33555 () Bool)

(assert (=> b!50764 (=> res!42519 e!33555)))

(assert (=> b!50764 (= res!42519 (not (invariant!0 (currentBit!2938 (_2!2443 lt!78622)) (currentByte!2943 (_2!2443 lt!78622)) (size!1065 (buf!1420 (_2!2443 lt!78622))))))))

(declare-fun b!50765 () Bool)

(declare-fun e!33544 () Bool)

(assert (=> b!50765 (= e!33556 e!33544)))

(declare-fun res!42524 () Bool)

(assert (=> b!50765 (=> res!42524 e!33544)))

(declare-fun lt!78615 () List!563)

(assert (=> b!50765 (= res!42524 (not (= lt!78615 lt!78609)))))

(assert (=> b!50765 (= lt!78609 lt!78615)))

(declare-fun tail!249 (List!563) List!563)

(assert (=> b!50765 (= lt!78615 (tail!249 lt!78605))))

(declare-fun lt!78628 () Unit!3505)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1844 BitStream!1844 BitStream!1844 BitStream!1844 (_ BitVec 64) List!563) Unit!3505)

(assert (=> b!50765 (= lt!78628 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2443 lt!78622) (_2!2443 lt!78622) (_1!2444 lt!78608) (_1!2444 lt!78621) (bvsub to!314 i!635) lt!78605))))

(declare-fun b!50766 () Bool)

(assert (=> b!50766 (= e!33544 e!33552)))

(declare-fun res!42520 () Bool)

(assert (=> b!50766 (=> res!42520 e!33552)))

(assert (=> b!50766 (= res!42520 (not (= lt!78618 (bitAt!0 (buf!1420 (_1!2444 lt!78621)) lt!78619))))))

(assert (=> b!50766 (= lt!78618 (bitAt!0 (buf!1420 (_1!2444 lt!78608)) lt!78619))))

(declare-fun b!50767 () Bool)

(assert (=> b!50767 (= e!33546 (not e!33548))))

(declare-fun res!42521 () Bool)

(assert (=> b!50767 (=> res!42521 e!33548)))

(assert (=> b!50767 (= res!42521 (bvsge i!635 to!314))))

(assert (=> b!50767 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!78624 () Unit!3505)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1844) Unit!3505)

(assert (=> b!50767 (= lt!78624 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!50767 (= lt!78619 (bitIndex!0 (size!1065 (buf!1420 thiss!1379)) (currentByte!2943 thiss!1379) (currentBit!2938 thiss!1379)))))

(declare-fun b!50768 () Bool)

(assert (=> b!50768 (= e!33555 e!33550)))

(declare-fun res!42513 () Bool)

(assert (=> b!50768 (=> res!42513 e!33550)))

(assert (=> b!50768 (= res!42513 (not (= (size!1065 (buf!1420 (_2!2443 lt!78613))) (size!1065 (buf!1420 (_2!2443 lt!78622))))))))

(declare-fun lt!78606 () (_ BitVec 64))

(declare-fun lt!78625 () (_ BitVec 64))

(assert (=> b!50768 (= lt!78606 (bvsub (bvsub (bvadd lt!78625 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!50768 (= lt!78625 (bitIndex!0 (size!1065 (buf!1420 (_2!2443 lt!78613))) (currentByte!2943 (_2!2443 lt!78613)) (currentBit!2938 (_2!2443 lt!78613))))))

(assert (=> b!50768 (= (size!1065 (buf!1420 (_2!2443 lt!78622))) (size!1065 (buf!1420 thiss!1379)))))

(declare-fun b!50769 () Bool)

(declare-fun res!42512 () Bool)

(assert (=> b!50769 (=> res!42512 e!33555)))

(assert (=> b!50769 (= res!42512 (not (= (size!1065 (buf!1420 thiss!1379)) (size!1065 (buf!1420 (_2!2443 lt!78622))))))))

(declare-fun b!50770 () Bool)

(declare-fun res!42526 () Bool)

(assert (=> b!50770 (=> res!42526 e!33550)))

(assert (=> b!50770 (= res!42526 (not (invariant!0 (currentBit!2938 (_2!2443 lt!78613)) (currentByte!2943 (_2!2443 lt!78613)) (size!1065 (buf!1420 (_2!2443 lt!78622))))))))

(declare-fun b!50771 () Bool)

(assert (=> b!50771 (= e!33547 e!33555)))

(declare-fun res!42522 () Bool)

(assert (=> b!50771 (=> res!42522 e!33555)))

(assert (=> b!50771 (= res!42522 (not (= lt!78606 (bvsub (bvadd lt!78619 to!314) i!635))))))

(assert (=> b!50771 (= lt!78606 (bitIndex!0 (size!1065 (buf!1420 (_2!2443 lt!78622))) (currentByte!2943 (_2!2443 lt!78622)) (currentBit!2938 (_2!2443 lt!78622))))))

(declare-fun b!50772 () Bool)

(declare-fun lt!78614 () Bool)

(assert (=> b!50772 (= e!33545 (= lt!78614 lt!78607))))

(assert (=> b!50772 (= lt!78617 lt!78614)))

(assert (=> b!50772 (= lt!78614 (bitAt!0 (buf!1420 (_2!2443 lt!78622)) lt!78619))))

(declare-fun lt!78610 () Unit!3505)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2342 array!2342 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3505)

(assert (=> b!50772 (= lt!78610 (arrayBitRangesEqImpliesEq!0 (buf!1420 (_2!2443 lt!78613)) (buf!1420 (_2!2443 lt!78622)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!78619 lt!78625))))

(declare-fun b!50773 () Bool)

(assert (=> b!50773 (= e!33554 (array_inv!975 (buf!1420 thiss!1379)))))

(assert (= (and start!10020 res!42510) b!50759))

(assert (= (and b!50759 res!42528) b!50767))

(assert (= (and b!50767 (not res!42521)) b!50760))

(assert (= (and b!50760 (not res!42525)) b!50762))

(assert (= (and b!50762 res!42527) b!50756))

(assert (= (and b!50762 (not res!42516)) b!50771))

(assert (= (and b!50771 (not res!42522)) b!50764))

(assert (= (and b!50764 (not res!42519)) b!50769))

(assert (= (and b!50769 (not res!42512)) b!50768))

(assert (= (and b!50768 (not res!42513)) b!50758))

(assert (= (and b!50758 (not res!42523)) b!50770))

(assert (= (and b!50770 (not res!42526)) b!50761))

(assert (= (and b!50761 (not res!42514)) b!50757))

(assert (= (and b!50757 (not res!42515)) b!50765))

(assert (= (and b!50765 (not res!42524)) b!50766))

(assert (= (and b!50766 (not res!42520)) b!50763))

(assert (= (and b!50763 (not res!42511)) b!50754))

(assert (= (and b!50754 (not res!42518)) b!50755))

(assert (= (and b!50755 (not res!42517)) b!50772))

(assert (= start!10020 b!50773))

(declare-fun m!79851 () Bool)

(assert (=> b!50756 m!79851))

(assert (=> b!50756 m!79851))

(declare-fun m!79853 () Bool)

(assert (=> b!50756 m!79853))

(declare-fun m!79855 () Bool)

(assert (=> b!50756 m!79855))

(assert (=> b!50756 m!79855))

(declare-fun m!79857 () Bool)

(assert (=> b!50756 m!79857))

(declare-fun m!79859 () Bool)

(assert (=> b!50758 m!79859))

(declare-fun m!79861 () Bool)

(assert (=> b!50767 m!79861))

(declare-fun m!79863 () Bool)

(assert (=> b!50767 m!79863))

(declare-fun m!79865 () Bool)

(assert (=> b!50767 m!79865))

(declare-fun m!79867 () Bool)

(assert (=> b!50765 m!79867))

(declare-fun m!79869 () Bool)

(assert (=> b!50765 m!79869))

(declare-fun m!79871 () Bool)

(assert (=> start!10020 m!79871))

(declare-fun m!79873 () Bool)

(assert (=> start!10020 m!79873))

(declare-fun m!79875 () Bool)

(assert (=> b!50771 m!79875))

(declare-fun m!79877 () Bool)

(assert (=> b!50766 m!79877))

(declare-fun m!79879 () Bool)

(assert (=> b!50766 m!79879))

(declare-fun m!79881 () Bool)

(assert (=> b!50764 m!79881))

(declare-fun m!79883 () Bool)

(assert (=> b!50772 m!79883))

(declare-fun m!79885 () Bool)

(assert (=> b!50772 m!79885))

(declare-fun m!79887 () Bool)

(assert (=> b!50770 m!79887))

(declare-fun m!79889 () Bool)

(assert (=> b!50763 m!79889))

(declare-fun m!79891 () Bool)

(assert (=> b!50755 m!79891))

(declare-fun m!79893 () Bool)

(assert (=> b!50773 m!79893))

(declare-fun m!79895 () Bool)

(assert (=> b!50759 m!79895))

(declare-fun m!79897 () Bool)

(assert (=> b!50768 m!79897))

(declare-fun m!79899 () Bool)

(assert (=> b!50761 m!79899))

(declare-fun m!79901 () Bool)

(assert (=> b!50761 m!79901))

(declare-fun m!79903 () Bool)

(assert (=> b!50761 m!79903))

(declare-fun m!79905 () Bool)

(assert (=> b!50761 m!79905))

(declare-fun m!79907 () Bool)

(assert (=> b!50761 m!79907))

(declare-fun m!79909 () Bool)

(assert (=> b!50761 m!79909))

(declare-fun m!79911 () Bool)

(assert (=> b!50761 m!79911))

(declare-fun m!79913 () Bool)

(assert (=> b!50761 m!79913))

(declare-fun m!79915 () Bool)

(assert (=> b!50762 m!79915))

(declare-fun m!79917 () Bool)

(assert (=> b!50762 m!79917))

(declare-fun m!79919 () Bool)

(assert (=> b!50762 m!79919))

(declare-fun m!79921 () Bool)

(assert (=> b!50762 m!79921))

(declare-fun m!79923 () Bool)

(assert (=> b!50762 m!79923))

(declare-fun m!79925 () Bool)

(assert (=> b!50762 m!79925))

(declare-fun m!79927 () Bool)

(assert (=> b!50762 m!79927))

(declare-fun m!79929 () Bool)

(assert (=> b!50754 m!79929))

(assert (=> b!50754 m!79929))

(declare-fun m!79931 () Bool)

(assert (=> b!50754 m!79931))

(declare-fun m!79933 () Bool)

(assert (=> b!50754 m!79933))

(declare-fun m!79935 () Bool)

(assert (=> b!50760 m!79935))

(declare-fun m!79937 () Bool)

(assert (=> b!50760 m!79937))

(declare-fun m!79939 () Bool)

(assert (=> b!50760 m!79939))

(declare-fun m!79941 () Bool)

(assert (=> b!50760 m!79941))

(assert (=> b!50760 m!79937))

(declare-fun m!79943 () Bool)

(assert (=> b!50760 m!79943))

(declare-fun m!79945 () Bool)

(assert (=> b!50757 m!79945))

(push 1)

(assert (not b!50760))

(assert (not b!50755))

(assert (not start!10020))

(assert (not b!50754))

(assert (not b!50758))

(assert (not b!50765))

(assert (not b!50763))

(assert (not b!50759))

(assert (not b!50764))

(assert (not b!50772))

(assert (not b!50767))

(assert (not b!50773))

(assert (not b!50766))

(assert (not b!50768))

(assert (not b!50757))

(assert (not b!50761))

(assert (not b!50770))

(assert (not b!50756))

(assert (not b!50762))

(assert (not b!50771))

(check-sat)

(pop 1)

(push 1)

(check-sat)

