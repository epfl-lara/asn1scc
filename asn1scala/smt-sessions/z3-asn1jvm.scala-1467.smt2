; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40216 () Bool)

(assert start!40216)

(declare-fun b!184453 () Bool)

(declare-fun e!127786 () Bool)

(declare-datatypes ((array!9784 0))(
  ( (array!9785 (arr!5246 (Array (_ BitVec 32) (_ BitVec 8))) (size!4316 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7740 0))(
  ( (BitStream!7741 (buf!4771 array!9784) (currentByte!9005 (_ BitVec 32)) (currentBit!9000 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15964 0))(
  ( (tuple2!15965 (_1!8627 BitStream!7740) (_2!8627 Bool)) )
))
(declare-fun lt!283660 () tuple2!15964)

(declare-fun lt!283668 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184453 (= e!127786 (= (bitIndex!0 (size!4316 (buf!4771 (_1!8627 lt!283660))) (currentByte!9005 (_1!8627 lt!283660)) (currentBit!9000 (_1!8627 lt!283660))) lt!283668))))

(declare-fun b!184454 () Bool)

(declare-fun e!127779 () Bool)

(declare-fun e!127776 () Bool)

(assert (=> b!184454 (= e!127779 e!127776)))

(declare-fun res!153470 () Bool)

(assert (=> b!184454 (=> (not res!153470) (not e!127776))))

(declare-fun thiss!1204 () BitStream!7740)

(declare-fun lt!283651 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184454 (= res!153470 (validate_offset_bits!1 ((_ sign_extend 32) (size!4316 (buf!4771 thiss!1204))) ((_ sign_extend 32) (currentByte!9005 thiss!1204)) ((_ sign_extend 32) (currentBit!9000 thiss!1204)) lt!283651))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!184454 (= lt!283651 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184455 () Bool)

(declare-fun e!127777 () Bool)

(declare-fun array_inv!4057 (array!9784) Bool)

(assert (=> b!184455 (= e!127777 (array_inv!4057 (buf!4771 thiss!1204)))))

(declare-fun b!184456 () Bool)

(declare-fun e!127784 () Bool)

(assert (=> b!184456 (= e!127784 true)))

(declare-datatypes ((tuple2!15966 0))(
  ( (tuple2!15967 (_1!8628 BitStream!7740) (_2!8628 (_ BitVec 64))) )
))
(declare-fun lt!283665 () tuple2!15966)

(declare-fun lt!283666 () tuple2!15966)

(assert (=> b!184456 (and (= (_2!8628 lt!283665) (_2!8628 lt!283666)) (= (_1!8628 lt!283665) (_1!8628 lt!283666)))))

(declare-fun lt!283650 () (_ BitVec 64))

(declare-datatypes ((Unit!13207 0))(
  ( (Unit!13208) )
))
(declare-fun lt!283659 () Unit!13207)

(declare-datatypes ((tuple2!15968 0))(
  ( (tuple2!15969 (_1!8629 BitStream!7740) (_2!8629 BitStream!7740)) )
))
(declare-fun lt!283670 () tuple2!15968)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13207)

(assert (=> b!184456 (= lt!283659 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8629 lt!283670) nBits!348 i!590 lt!283650))))

(declare-fun lt!283647 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15966)

(declare-fun withMovedBitIndex!0 (BitStream!7740 (_ BitVec 64)) BitStream!7740)

(assert (=> b!184456 (= lt!283666 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8629 lt!283670) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283647))))

(declare-fun b!184457 () Bool)

(declare-fun res!153475 () Bool)

(declare-fun e!127783 () Bool)

(assert (=> b!184457 (=> res!153475 e!127783)))

(declare-datatypes ((tuple2!15970 0))(
  ( (tuple2!15971 (_1!8630 Unit!13207) (_2!8630 BitStream!7740)) )
))
(declare-fun lt!283656 () tuple2!15970)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184457 (= res!153475 (not (invariant!0 (currentBit!9000 (_2!8630 lt!283656)) (currentByte!9005 (_2!8630 lt!283656)) (size!4316 (buf!4771 (_2!8630 lt!283656))))))))

(declare-fun b!184458 () Bool)

(assert (=> b!184458 (= e!127783 e!127784)))

(declare-fun res!153464 () Bool)

(assert (=> b!184458 (=> res!153464 e!127784)))

(declare-fun lt!283653 () tuple2!15968)

(assert (=> b!184458 (= res!153464 (not (= (_1!8628 (readNBitsLSBFirstsLoopPure!0 (_1!8629 lt!283653) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283647)) (_2!8629 lt!283653))))))

(declare-fun lt!283662 () tuple2!15970)

(declare-fun lt!283658 () (_ BitVec 64))

(assert (=> b!184458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4316 (buf!4771 (_2!8630 lt!283656)))) ((_ sign_extend 32) (currentByte!9005 (_2!8630 lt!283662))) ((_ sign_extend 32) (currentBit!9000 (_2!8630 lt!283662))) lt!283658)))

(declare-fun lt!283667 () Unit!13207)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7740 array!9784 (_ BitVec 64)) Unit!13207)

(assert (=> b!184458 (= lt!283667 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8630 lt!283662) (buf!4771 (_2!8630 lt!283656)) lt!283658))))

(assert (=> b!184458 (= lt!283658 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283663 () tuple2!15964)

(declare-fun lt!283652 () (_ BitVec 64))

(assert (=> b!184458 (= lt!283647 (bvor lt!283650 (ite (_2!8627 lt!283663) lt!283652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184458 (= lt!283665 (readNBitsLSBFirstsLoopPure!0 (_1!8629 lt!283670) nBits!348 i!590 lt!283650))))

(assert (=> b!184458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4316 (buf!4771 (_2!8630 lt!283656)))) ((_ sign_extend 32) (currentByte!9005 thiss!1204)) ((_ sign_extend 32) (currentBit!9000 thiss!1204)) lt!283651)))

(declare-fun lt!283669 () Unit!13207)

(assert (=> b!184458 (= lt!283669 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4771 (_2!8630 lt!283656)) lt!283651))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184458 (= lt!283650 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!283672 () Bool)

(assert (=> b!184458 (= (_2!8627 lt!283663) lt!283672)))

(declare-fun readBitPure!0 (BitStream!7740) tuple2!15964)

(assert (=> b!184458 (= lt!283663 (readBitPure!0 (_1!8629 lt!283670)))))

(declare-fun reader!0 (BitStream!7740 BitStream!7740) tuple2!15968)

(assert (=> b!184458 (= lt!283653 (reader!0 (_2!8630 lt!283662) (_2!8630 lt!283656)))))

(assert (=> b!184458 (= lt!283670 (reader!0 thiss!1204 (_2!8630 lt!283656)))))

(declare-fun e!127780 () Bool)

(assert (=> b!184458 e!127780))

(declare-fun res!153476 () Bool)

(assert (=> b!184458 (=> (not res!153476) (not e!127780))))

(declare-fun lt!283648 () tuple2!15964)

(declare-fun lt!283664 () tuple2!15964)

(assert (=> b!184458 (= res!153476 (= (bitIndex!0 (size!4316 (buf!4771 (_1!8627 lt!283648))) (currentByte!9005 (_1!8627 lt!283648)) (currentBit!9000 (_1!8627 lt!283648))) (bitIndex!0 (size!4316 (buf!4771 (_1!8627 lt!283664))) (currentByte!9005 (_1!8627 lt!283664)) (currentBit!9000 (_1!8627 lt!283664)))))))

(declare-fun lt!283661 () Unit!13207)

(declare-fun lt!283673 () BitStream!7740)

(declare-fun readBitPrefixLemma!0 (BitStream!7740 BitStream!7740) Unit!13207)

(assert (=> b!184458 (= lt!283661 (readBitPrefixLemma!0 lt!283673 (_2!8630 lt!283656)))))

(assert (=> b!184458 (= lt!283664 (readBitPure!0 (BitStream!7741 (buf!4771 (_2!8630 lt!283656)) (currentByte!9005 thiss!1204) (currentBit!9000 thiss!1204))))))

(assert (=> b!184458 (= lt!283648 (readBitPure!0 lt!283673))))

(declare-fun e!127778 () Bool)

(assert (=> b!184458 e!127778))

(declare-fun res!153463 () Bool)

(assert (=> b!184458 (=> (not res!153463) (not e!127778))))

(assert (=> b!184458 (= res!153463 (invariant!0 (currentBit!9000 thiss!1204) (currentByte!9005 thiss!1204) (size!4316 (buf!4771 (_2!8630 lt!283662)))))))

(assert (=> b!184458 (= lt!283673 (BitStream!7741 (buf!4771 (_2!8630 lt!283662)) (currentByte!9005 thiss!1204) (currentBit!9000 thiss!1204)))))

(declare-fun b!184459 () Bool)

(assert (=> b!184459 (= e!127778 (invariant!0 (currentBit!9000 thiss!1204) (currentByte!9005 thiss!1204) (size!4316 (buf!4771 (_2!8630 lt!283656)))))))

(declare-fun b!184461 () Bool)

(declare-fun res!153477 () Bool)

(assert (=> b!184461 (=> (not res!153477) (not e!127776))))

(assert (=> b!184461 (= res!153477 (invariant!0 (currentBit!9000 thiss!1204) (currentByte!9005 thiss!1204) (size!4316 (buf!4771 thiss!1204))))))

(declare-fun b!184462 () Bool)

(declare-fun res!153461 () Bool)

(assert (=> b!184462 (=> (not res!153461) (not e!127776))))

(assert (=> b!184462 (= res!153461 (not (= i!590 nBits!348)))))

(declare-fun b!184463 () Bool)

(declare-fun e!127775 () Bool)

(assert (=> b!184463 (= e!127775 e!127783)))

(declare-fun res!153471 () Bool)

(assert (=> b!184463 (=> res!153471 e!127783)))

(declare-fun lt!283657 () (_ BitVec 64))

(declare-fun lt!283649 () (_ BitVec 64))

(assert (=> b!184463 (= res!153471 (not (= lt!283649 (bvsub (bvsub (bvadd lt!283657 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184463 (= lt!283649 (bitIndex!0 (size!4316 (buf!4771 (_2!8630 lt!283656))) (currentByte!9005 (_2!8630 lt!283656)) (currentBit!9000 (_2!8630 lt!283656))))))

(declare-fun isPrefixOf!0 (BitStream!7740 BitStream!7740) Bool)

(assert (=> b!184463 (isPrefixOf!0 thiss!1204 (_2!8630 lt!283656))))

(declare-fun lt!283654 () Unit!13207)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7740 BitStream!7740 BitStream!7740) Unit!13207)

(assert (=> b!184463 (= lt!283654 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8630 lt!283662) (_2!8630 lt!283656)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7740 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15970)

(assert (=> b!184463 (= lt!283656 (appendBitsLSBFirstLoopTR!0 (_2!8630 lt!283662) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184464 () Bool)

(declare-fun e!127782 () Bool)

(declare-fun e!127785 () Bool)

(assert (=> b!184464 (= e!127782 e!127785)))

(declare-fun res!153466 () Bool)

(assert (=> b!184464 (=> (not res!153466) (not e!127785))))

(declare-fun lt!283671 () (_ BitVec 64))

(assert (=> b!184464 (= res!153466 (= lt!283668 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283671)))))

(assert (=> b!184464 (= lt!283668 (bitIndex!0 (size!4316 (buf!4771 (_2!8630 lt!283662))) (currentByte!9005 (_2!8630 lt!283662)) (currentBit!9000 (_2!8630 lt!283662))))))

(assert (=> b!184464 (= lt!283671 (bitIndex!0 (size!4316 (buf!4771 thiss!1204)) (currentByte!9005 thiss!1204) (currentBit!9000 thiss!1204)))))

(declare-fun b!184465 () Bool)

(assert (=> b!184465 (= e!127776 (not e!127775))))

(declare-fun res!153468 () Bool)

(assert (=> b!184465 (=> res!153468 e!127775)))

(declare-fun lt!283655 () (_ BitVec 64))

(assert (=> b!184465 (= res!153468 (not (= lt!283657 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283655))))))

(assert (=> b!184465 (= lt!283657 (bitIndex!0 (size!4316 (buf!4771 (_2!8630 lt!283662))) (currentByte!9005 (_2!8630 lt!283662)) (currentBit!9000 (_2!8630 lt!283662))))))

(assert (=> b!184465 (= lt!283655 (bitIndex!0 (size!4316 (buf!4771 thiss!1204)) (currentByte!9005 thiss!1204) (currentBit!9000 thiss!1204)))))

(assert (=> b!184465 e!127782))

(declare-fun res!153472 () Bool)

(assert (=> b!184465 (=> (not res!153472) (not e!127782))))

(assert (=> b!184465 (= res!153472 (= (size!4316 (buf!4771 thiss!1204)) (size!4316 (buf!4771 (_2!8630 lt!283662)))))))

(declare-fun appendBit!0 (BitStream!7740 Bool) tuple2!15970)

(assert (=> b!184465 (= lt!283662 (appendBit!0 thiss!1204 lt!283672))))

(assert (=> b!184465 (= lt!283672 (not (= (bvand v!189 lt!283652) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184465 (= lt!283652 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184466 () Bool)

(declare-fun res!153467 () Bool)

(assert (=> b!184466 (=> res!153467 e!127783)))

(assert (=> b!184466 (= res!153467 (not (isPrefixOf!0 thiss!1204 (_2!8630 lt!283662))))))

(declare-fun b!184467 () Bool)

(assert (=> b!184467 (= e!127785 e!127786)))

(declare-fun res!153473 () Bool)

(assert (=> b!184467 (=> (not res!153473) (not e!127786))))

(assert (=> b!184467 (= res!153473 (and (= (_2!8627 lt!283660) lt!283672) (= (_1!8627 lt!283660) (_2!8630 lt!283662))))))

(declare-fun readerFrom!0 (BitStream!7740 (_ BitVec 32) (_ BitVec 32)) BitStream!7740)

(assert (=> b!184467 (= lt!283660 (readBitPure!0 (readerFrom!0 (_2!8630 lt!283662) (currentBit!9000 thiss!1204) (currentByte!9005 thiss!1204))))))

(declare-fun b!184468 () Bool)

(declare-fun res!153462 () Bool)

(assert (=> b!184468 (=> res!153462 e!127783)))

(assert (=> b!184468 (= res!153462 (or (not (= (size!4316 (buf!4771 (_2!8630 lt!283656))) (size!4316 (buf!4771 thiss!1204)))) (not (= lt!283649 (bvsub (bvadd lt!283655 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184460 () Bool)

(assert (=> b!184460 (= e!127780 (= (_2!8627 lt!283648) (_2!8627 lt!283664)))))

(declare-fun res!153469 () Bool)

(assert (=> start!40216 (=> (not res!153469) (not e!127779))))

(assert (=> start!40216 (= res!153469 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40216 e!127779))

(assert (=> start!40216 true))

(declare-fun inv!12 (BitStream!7740) Bool)

(assert (=> start!40216 (and (inv!12 thiss!1204) e!127777)))

(declare-fun b!184469 () Bool)

(declare-fun res!153465 () Bool)

(assert (=> b!184469 (=> (not res!153465) (not e!127785))))

(assert (=> b!184469 (= res!153465 (isPrefixOf!0 thiss!1204 (_2!8630 lt!283662)))))

(declare-fun b!184470 () Bool)

(declare-fun res!153474 () Bool)

(assert (=> b!184470 (=> res!153474 e!127783)))

(assert (=> b!184470 (= res!153474 (not (isPrefixOf!0 (_2!8630 lt!283662) (_2!8630 lt!283656))))))

(assert (= (and start!40216 res!153469) b!184454))

(assert (= (and b!184454 res!153470) b!184461))

(assert (= (and b!184461 res!153477) b!184462))

(assert (= (and b!184462 res!153461) b!184465))

(assert (= (and b!184465 res!153472) b!184464))

(assert (= (and b!184464 res!153466) b!184469))

(assert (= (and b!184469 res!153465) b!184467))

(assert (= (and b!184467 res!153473) b!184453))

(assert (= (and b!184465 (not res!153468)) b!184463))

(assert (= (and b!184463 (not res!153471)) b!184457))

(assert (= (and b!184457 (not res!153475)) b!184468))

(assert (= (and b!184468 (not res!153462)) b!184470))

(assert (= (and b!184470 (not res!153474)) b!184466))

(assert (= (and b!184466 (not res!153467)) b!184458))

(assert (= (and b!184458 res!153463) b!184459))

(assert (= (and b!184458 res!153476) b!184460))

(assert (= (and b!184458 (not res!153464)) b!184456))

(assert (= start!40216 b!184455))

(declare-fun m!286581 () Bool)

(assert (=> b!184454 m!286581))

(declare-fun m!286583 () Bool)

(assert (=> b!184470 m!286583))

(declare-fun m!286585 () Bool)

(assert (=> b!184455 m!286585))

(declare-fun m!286587 () Bool)

(assert (=> b!184467 m!286587))

(assert (=> b!184467 m!286587))

(declare-fun m!286589 () Bool)

(assert (=> b!184467 m!286589))

(declare-fun m!286591 () Bool)

(assert (=> b!184466 m!286591))

(declare-fun m!286593 () Bool)

(assert (=> b!184458 m!286593))

(declare-fun m!286595 () Bool)

(assert (=> b!184458 m!286595))

(declare-fun m!286597 () Bool)

(assert (=> b!184458 m!286597))

(declare-fun m!286599 () Bool)

(assert (=> b!184458 m!286599))

(declare-fun m!286601 () Bool)

(assert (=> b!184458 m!286601))

(declare-fun m!286603 () Bool)

(assert (=> b!184458 m!286603))

(declare-fun m!286605 () Bool)

(assert (=> b!184458 m!286605))

(declare-fun m!286607 () Bool)

(assert (=> b!184458 m!286607))

(declare-fun m!286609 () Bool)

(assert (=> b!184458 m!286609))

(declare-fun m!286611 () Bool)

(assert (=> b!184458 m!286611))

(declare-fun m!286613 () Bool)

(assert (=> b!184458 m!286613))

(declare-fun m!286615 () Bool)

(assert (=> b!184458 m!286615))

(declare-fun m!286617 () Bool)

(assert (=> b!184458 m!286617))

(declare-fun m!286619 () Bool)

(assert (=> b!184458 m!286619))

(declare-fun m!286621 () Bool)

(assert (=> b!184458 m!286621))

(declare-fun m!286623 () Bool)

(assert (=> b!184458 m!286623))

(declare-fun m!286625 () Bool)

(assert (=> b!184463 m!286625))

(declare-fun m!286627 () Bool)

(assert (=> b!184463 m!286627))

(declare-fun m!286629 () Bool)

(assert (=> b!184463 m!286629))

(declare-fun m!286631 () Bool)

(assert (=> b!184463 m!286631))

(declare-fun m!286633 () Bool)

(assert (=> start!40216 m!286633))

(declare-fun m!286635 () Bool)

(assert (=> b!184461 m!286635))

(declare-fun m!286637 () Bool)

(assert (=> b!184457 m!286637))

(declare-fun m!286639 () Bool)

(assert (=> b!184465 m!286639))

(declare-fun m!286641 () Bool)

(assert (=> b!184465 m!286641))

(declare-fun m!286643 () Bool)

(assert (=> b!184465 m!286643))

(declare-fun m!286645 () Bool)

(assert (=> b!184456 m!286645))

(declare-fun m!286647 () Bool)

(assert (=> b!184456 m!286647))

(assert (=> b!184456 m!286647))

(declare-fun m!286649 () Bool)

(assert (=> b!184456 m!286649))

(assert (=> b!184469 m!286591))

(assert (=> b!184464 m!286639))

(assert (=> b!184464 m!286641))

(declare-fun m!286651 () Bool)

(assert (=> b!184453 m!286651))

(declare-fun m!286653 () Bool)

(assert (=> b!184459 m!286653))

(check-sat (not b!184469) (not b!184464) (not b!184461) (not b!184465) (not b!184459) (not b!184458) (not b!184453) (not b!184467) (not b!184463) (not start!40216) (not b!184466) (not b!184456) (not b!184457) (not b!184454) (not b!184455) (not b!184470))
