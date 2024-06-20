; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40426 () Bool)

(assert start!40426)

(declare-fun b!185743 () Bool)

(declare-fun res!154629 () Bool)

(declare-fun e!128584 () Bool)

(assert (=> b!185743 (=> res!154629 e!128584)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!286445 () (_ BitVec 64))

(declare-datatypes ((array!9813 0))(
  ( (array!9814 (arr!5258 (Array (_ BitVec 32) (_ BitVec 8))) (size!4328 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7764 0))(
  ( (BitStream!7765 (buf!4788 array!9813) (currentByte!9032 (_ BitVec 32)) (currentBit!9027 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13286 0))(
  ( (Unit!13287) )
))
(declare-datatypes ((tuple2!16080 0))(
  ( (tuple2!16081 (_1!8685 Unit!13286) (_2!8685 BitStream!7764)) )
))
(declare-fun lt!286454 () tuple2!16080)

(declare-fun lt!286444 () (_ BitVec 64))

(declare-fun thiss!1204 () BitStream!7764)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!185743 (= res!154629 (or (not (= (size!4328 (buf!4788 (_2!8685 lt!286454))) (size!4328 (buf!4788 thiss!1204)))) (not (= lt!286445 (bvsub (bvadd lt!286444 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185744 () Bool)

(declare-fun e!128588 () Bool)

(declare-fun e!128586 () Bool)

(assert (=> b!185744 (= e!128588 e!128586)))

(declare-fun res!154613 () Bool)

(assert (=> b!185744 (=> (not res!154613) (not e!128586))))

(declare-fun lt!286452 () tuple2!16080)

(declare-fun lt!286448 () Bool)

(declare-datatypes ((tuple2!16082 0))(
  ( (tuple2!16083 (_1!8686 BitStream!7764) (_2!8686 Bool)) )
))
(declare-fun lt!286442 () tuple2!16082)

(assert (=> b!185744 (= res!154613 (and (= (_2!8686 lt!286442) lt!286448) (= (_1!8686 lt!286442) (_2!8685 lt!286452))))))

(declare-fun readBitPure!0 (BitStream!7764) tuple2!16082)

(declare-fun readerFrom!0 (BitStream!7764 (_ BitVec 32) (_ BitVec 32)) BitStream!7764)

(assert (=> b!185744 (= lt!286442 (readBitPure!0 (readerFrom!0 (_2!8685 lt!286452) (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204))))))

(declare-fun b!185745 () Bool)

(declare-fun res!154625 () Bool)

(assert (=> b!185745 (=> res!154625 e!128584)))

(declare-fun isPrefixOf!0 (BitStream!7764 BitStream!7764) Bool)

(assert (=> b!185745 (= res!154625 (not (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!286454))))))

(declare-fun b!185746 () Bool)

(declare-fun e!128589 () Bool)

(declare-fun e!128592 () Bool)

(assert (=> b!185746 (= e!128589 e!128592)))

(declare-fun res!154615 () Bool)

(assert (=> b!185746 (=> (not res!154615) (not e!128592))))

(declare-fun lt!286465 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185746 (= res!154615 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)) lt!286465))))

(assert (=> b!185746 (= lt!286465 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185747 () Bool)

(declare-fun res!154618 () Bool)

(assert (=> b!185747 (=> (not res!154618) (not e!128592))))

(assert (=> b!185747 (= res!154618 (not (= i!590 nBits!348)))))

(declare-fun lt!286462 () (_ BitVec 64))

(declare-datatypes ((tuple2!16084 0))(
  ( (tuple2!16085 (_1!8687 BitStream!7764) (_2!8687 BitStream!7764)) )
))
(declare-fun lt!286460 () tuple2!16084)

(declare-fun b!185748 () Bool)

(declare-fun e!128590 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7764 (_ BitVec 64)) Bool)

(assert (=> b!185748 (= e!128590 (moveBitIndexPrecond!0 (_2!8687 lt!286460) (bvsub lt!286462 lt!286445)))))

(declare-fun e!128583 () Bool)

(assert (=> b!185748 e!128583))

(declare-fun res!154614 () Bool)

(assert (=> b!185748 (=> (not res!154614) (not e!128583))))

(declare-datatypes ((tuple2!16086 0))(
  ( (tuple2!16087 (_1!8688 BitStream!7764) (_2!8688 (_ BitVec 64))) )
))
(declare-fun lt!286447 () tuple2!16086)

(declare-fun lt!286456 () tuple2!16086)

(assert (=> b!185748 (= res!154614 (and (= (_2!8688 lt!286447) (_2!8688 lt!286456)) (= (_1!8688 lt!286447) (_1!8688 lt!286456))))))

(declare-fun lt!286467 () tuple2!16084)

(declare-fun lt!286443 () (_ BitVec 64))

(declare-fun lt!286468 () Unit!13286)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13286)

(assert (=> b!185748 (= lt!286468 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443))))

(declare-fun lt!286458 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16086)

(declare-fun withMovedBitIndex!0 (BitStream!7764 (_ BitVec 64)) BitStream!7764)

(assert (=> b!185748 (= lt!286456 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458))))

(declare-fun b!185749 () Bool)

(declare-fun lt!286463 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185749 (= e!128586 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286442))) (currentByte!9032 (_1!8686 lt!286442)) (currentBit!9027 (_1!8686 lt!286442))) lt!286463))))

(declare-fun b!185750 () Bool)

(declare-fun res!154616 () Bool)

(assert (=> b!185750 (=> res!154616 e!128584)))

(assert (=> b!185750 (= res!154616 (not (isPrefixOf!0 thiss!1204 (_2!8685 lt!286452))))))

(declare-fun b!185751 () Bool)

(declare-fun e!128591 () Bool)

(declare-fun array_inv!4069 (array!9813) Bool)

(assert (=> b!185751 (= e!128591 (array_inv!4069 (buf!4788 thiss!1204)))))

(declare-fun b!185752 () Bool)

(declare-fun res!154617 () Bool)

(assert (=> b!185752 (=> (not res!154617) (not e!128592))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185752 (= res!154617 (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204))))))

(declare-fun b!185753 () Bool)

(declare-fun e!128581 () Bool)

(assert (=> b!185753 (= e!128581 (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286454)))))))

(declare-fun b!185754 () Bool)

(declare-fun e!128587 () Bool)

(assert (=> b!185754 (= e!128592 (not e!128587))))

(declare-fun res!154619 () Bool)

(assert (=> b!185754 (=> res!154619 e!128587)))

(assert (=> b!185754 (= res!154619 (not (= lt!286462 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286444))))))

(assert (=> b!185754 (= lt!286462 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(assert (=> b!185754 (= lt!286444 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(declare-fun e!128582 () Bool)

(assert (=> b!185754 e!128582))

(declare-fun res!154620 () Bool)

(assert (=> b!185754 (=> (not res!154620) (not e!128582))))

(assert (=> b!185754 (= res!154620 (= (size!4328 (buf!4788 thiss!1204)) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(declare-fun appendBit!0 (BitStream!7764 Bool) tuple2!16080)

(assert (=> b!185754 (= lt!286452 (appendBit!0 thiss!1204 lt!286448))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!286446 () (_ BitVec 64))

(assert (=> b!185754 (= lt!286448 (not (= (bvand v!189 lt!286446) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185754 (= lt!286446 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185755 () Bool)

(assert (=> b!185755 (= e!128582 e!128588)))

(declare-fun res!154628 () Bool)

(assert (=> b!185755 (=> (not res!154628) (not e!128588))))

(declare-fun lt!286451 () (_ BitVec 64))

(assert (=> b!185755 (= res!154628 (= lt!286463 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286451)))))

(assert (=> b!185755 (= lt!286463 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(assert (=> b!185755 (= lt!286451 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(declare-fun b!185756 () Bool)

(declare-fun e!128585 () Bool)

(declare-fun lt!286455 () tuple2!16082)

(declare-fun lt!286450 () tuple2!16082)

(assert (=> b!185756 (= e!128585 (= (_2!8686 lt!286455) (_2!8686 lt!286450)))))

(declare-fun res!154623 () Bool)

(assert (=> start!40426 (=> (not res!154623) (not e!128589))))

(assert (=> start!40426 (= res!154623 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40426 e!128589))

(assert (=> start!40426 true))

(declare-fun inv!12 (BitStream!7764) Bool)

(assert (=> start!40426 (and (inv!12 thiss!1204) e!128591)))

(declare-fun b!185757 () Bool)

(declare-fun res!154612 () Bool)

(assert (=> b!185757 (=> res!154612 e!128584)))

(assert (=> b!185757 (= res!154612 (not (invariant!0 (currentBit!9027 (_2!8685 lt!286454)) (currentByte!9032 (_2!8685 lt!286454)) (size!4328 (buf!4788 (_2!8685 lt!286454))))))))

(declare-fun b!185758 () Bool)

(assert (=> b!185758 (= e!128583 (= (_1!8687 lt!286467) (withMovedBitIndex!0 (_2!8687 lt!286467) (bvsub lt!286444 lt!286445))))))

(declare-fun b!185759 () Bool)

(declare-fun res!154626 () Bool)

(assert (=> b!185759 (=> (not res!154626) (not e!128588))))

(assert (=> b!185759 (= res!154626 (isPrefixOf!0 thiss!1204 (_2!8685 lt!286452)))))

(declare-fun b!185760 () Bool)

(assert (=> b!185760 (= e!128587 e!128584)))

(declare-fun res!154624 () Bool)

(assert (=> b!185760 (=> res!154624 e!128584)))

(assert (=> b!185760 (= res!154624 (not (= lt!286445 (bvsub (bvsub (bvadd lt!286462 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185760 (= lt!286445 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454))))))

(assert (=> b!185760 (isPrefixOf!0 thiss!1204 (_2!8685 lt!286454))))

(declare-fun lt!286449 () Unit!13286)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7764 BitStream!7764 BitStream!7764) Unit!13286)

(assert (=> b!185760 (= lt!286449 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8685 lt!286452) (_2!8685 lt!286454)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7764 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16080)

(assert (=> b!185760 (= lt!286454 (appendBitsLSBFirstLoopTR!0 (_2!8685 lt!286452) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185761 () Bool)

(assert (=> b!185761 (= e!128584 e!128590)))

(declare-fun res!154622 () Bool)

(assert (=> b!185761 (=> res!154622 e!128590)))

(assert (=> b!185761 (= res!154622 (not (= (_1!8688 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!286460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458)) (_2!8687 lt!286460))))))

(declare-fun lt!286461 () (_ BitVec 64))

(assert (=> b!185761 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!286461)))

(declare-fun lt!286453 () Unit!13286)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7764 array!9813 (_ BitVec 64)) Unit!13286)

(assert (=> b!185761 (= lt!286453 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!286454)) lt!286461))))

(assert (=> b!185761 (= lt!286461 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286459 () tuple2!16082)

(assert (=> b!185761 (= lt!286458 (bvor lt!286443 (ite (_2!8686 lt!286459) lt!286446 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185761 (= lt!286447 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443))))

(assert (=> b!185761 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)) lt!286465)))

(declare-fun lt!286464 () Unit!13286)

(assert (=> b!185761 (= lt!286464 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4788 (_2!8685 lt!286454)) lt!286465))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185761 (= lt!286443 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!185761 (= (_2!8686 lt!286459) lt!286448)))

(assert (=> b!185761 (= lt!286459 (readBitPure!0 (_1!8687 lt!286467)))))

(declare-fun reader!0 (BitStream!7764 BitStream!7764) tuple2!16084)

(assert (=> b!185761 (= lt!286460 (reader!0 (_2!8685 lt!286452) (_2!8685 lt!286454)))))

(assert (=> b!185761 (= lt!286467 (reader!0 thiss!1204 (_2!8685 lt!286454)))))

(assert (=> b!185761 e!128585))

(declare-fun res!154621 () Bool)

(assert (=> b!185761 (=> (not res!154621) (not e!128585))))

(assert (=> b!185761 (= res!154621 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286455))) (currentByte!9032 (_1!8686 lt!286455)) (currentBit!9027 (_1!8686 lt!286455))) (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286450))) (currentByte!9032 (_1!8686 lt!286450)) (currentBit!9027 (_1!8686 lt!286450)))))))

(declare-fun lt!286457 () Unit!13286)

(declare-fun lt!286466 () BitStream!7764)

(declare-fun readBitPrefixLemma!0 (BitStream!7764 BitStream!7764) Unit!13286)

(assert (=> b!185761 (= lt!286457 (readBitPrefixLemma!0 lt!286466 (_2!8685 lt!286454)))))

(assert (=> b!185761 (= lt!286450 (readBitPure!0 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))))))

(assert (=> b!185761 (= lt!286455 (readBitPure!0 lt!286466))))

(assert (=> b!185761 e!128581))

(declare-fun res!154627 () Bool)

(assert (=> b!185761 (=> (not res!154627) (not e!128581))))

(assert (=> b!185761 (= res!154627 (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (=> b!185761 (= lt!286466 (BitStream!7765 (buf!4788 (_2!8685 lt!286452)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(assert (= (and start!40426 res!154623) b!185746))

(assert (= (and b!185746 res!154615) b!185752))

(assert (= (and b!185752 res!154617) b!185747))

(assert (= (and b!185747 res!154618) b!185754))

(assert (= (and b!185754 res!154620) b!185755))

(assert (= (and b!185755 res!154628) b!185759))

(assert (= (and b!185759 res!154626) b!185744))

(assert (= (and b!185744 res!154613) b!185749))

(assert (= (and b!185754 (not res!154619)) b!185760))

(assert (= (and b!185760 (not res!154624)) b!185757))

(assert (= (and b!185757 (not res!154612)) b!185743))

(assert (= (and b!185743 (not res!154629)) b!185745))

(assert (= (and b!185745 (not res!154625)) b!185750))

(assert (= (and b!185750 (not res!154616)) b!185761))

(assert (= (and b!185761 res!154627) b!185753))

(assert (= (and b!185761 res!154621) b!185756))

(assert (= (and b!185761 (not res!154622)) b!185748))

(assert (= (and b!185748 res!154614) b!185758))

(assert (= start!40426 b!185751))

(declare-fun m!288685 () Bool)

(assert (=> b!185759 m!288685))

(declare-fun m!288687 () Bool)

(assert (=> b!185754 m!288687))

(declare-fun m!288689 () Bool)

(assert (=> b!185754 m!288689))

(declare-fun m!288691 () Bool)

(assert (=> b!185754 m!288691))

(declare-fun m!288693 () Bool)

(assert (=> b!185758 m!288693))

(declare-fun m!288695 () Bool)

(assert (=> b!185753 m!288695))

(declare-fun m!288697 () Bool)

(assert (=> b!185752 m!288697))

(declare-fun m!288699 () Bool)

(assert (=> b!185757 m!288699))

(declare-fun m!288701 () Bool)

(assert (=> b!185746 m!288701))

(declare-fun m!288703 () Bool)

(assert (=> b!185760 m!288703))

(declare-fun m!288705 () Bool)

(assert (=> b!185760 m!288705))

(declare-fun m!288707 () Bool)

(assert (=> b!185760 m!288707))

(declare-fun m!288709 () Bool)

(assert (=> b!185760 m!288709))

(assert (=> b!185750 m!288685))

(declare-fun m!288711 () Bool)

(assert (=> start!40426 m!288711))

(declare-fun m!288713 () Bool)

(assert (=> b!185761 m!288713))

(declare-fun m!288715 () Bool)

(assert (=> b!185761 m!288715))

(declare-fun m!288717 () Bool)

(assert (=> b!185761 m!288717))

(declare-fun m!288719 () Bool)

(assert (=> b!185761 m!288719))

(declare-fun m!288721 () Bool)

(assert (=> b!185761 m!288721))

(declare-fun m!288723 () Bool)

(assert (=> b!185761 m!288723))

(declare-fun m!288725 () Bool)

(assert (=> b!185761 m!288725))

(declare-fun m!288727 () Bool)

(assert (=> b!185761 m!288727))

(declare-fun m!288729 () Bool)

(assert (=> b!185761 m!288729))

(declare-fun m!288731 () Bool)

(assert (=> b!185761 m!288731))

(declare-fun m!288733 () Bool)

(assert (=> b!185761 m!288733))

(declare-fun m!288735 () Bool)

(assert (=> b!185761 m!288735))

(declare-fun m!288737 () Bool)

(assert (=> b!185761 m!288737))

(declare-fun m!288739 () Bool)

(assert (=> b!185761 m!288739))

(declare-fun m!288741 () Bool)

(assert (=> b!185761 m!288741))

(declare-fun m!288743 () Bool)

(assert (=> b!185761 m!288743))

(declare-fun m!288745 () Bool)

(assert (=> b!185744 m!288745))

(assert (=> b!185744 m!288745))

(declare-fun m!288747 () Bool)

(assert (=> b!185744 m!288747))

(declare-fun m!288749 () Bool)

(assert (=> b!185751 m!288749))

(declare-fun m!288751 () Bool)

(assert (=> b!185748 m!288751))

(declare-fun m!288753 () Bool)

(assert (=> b!185748 m!288753))

(declare-fun m!288755 () Bool)

(assert (=> b!185748 m!288755))

(assert (=> b!185748 m!288755))

(declare-fun m!288757 () Bool)

(assert (=> b!185748 m!288757))

(assert (=> b!185755 m!288687))

(assert (=> b!185755 m!288689))

(declare-fun m!288759 () Bool)

(assert (=> b!185745 m!288759))

(declare-fun m!288761 () Bool)

(assert (=> b!185749 m!288761))

(check-sat (not b!185754) (not b!185758) (not b!185745) (not b!185760) (not b!185759) (not b!185744) (not b!185753) (not b!185749) (not b!185755) (not b!185746) (not b!185752) (not b!185750) (not b!185751) (not b!185761) (not b!185757) (not start!40426) (not b!185748))
(check-sat)
(get-model)

(declare-fun d!64143 () Bool)

(declare-fun e!128762 () Bool)

(assert (=> d!64143 e!128762))

(declare-fun res!154871 () Bool)

(assert (=> d!64143 (=> (not res!154871) (not e!128762))))

(declare-fun lt!287247 () (_ BitVec 64))

(declare-fun lt!287248 () (_ BitVec 64))

(declare-fun lt!287249 () (_ BitVec 64))

(assert (=> d!64143 (= res!154871 (= lt!287249 (bvsub lt!287248 lt!287247)))))

(assert (=> d!64143 (or (= (bvand lt!287248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287247 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287248 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287248 lt!287247) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64143 (= lt!287247 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286452)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452)))))))

(declare-fun lt!287250 () (_ BitVec 64))

(declare-fun lt!287251 () (_ BitVec 64))

(assert (=> d!64143 (= lt!287248 (bvmul lt!287250 lt!287251))))

(assert (=> d!64143 (or (= lt!287250 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287251 (bvsdiv (bvmul lt!287250 lt!287251) lt!287250)))))

(assert (=> d!64143 (= lt!287251 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64143 (= lt!287250 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (=> d!64143 (= lt!287249 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452)))))))

(assert (=> d!64143 (invariant!0 (currentBit!9027 (_2!8685 lt!286452)) (currentByte!9032 (_2!8685 lt!286452)) (size!4328 (buf!4788 (_2!8685 lt!286452))))))

(assert (=> d!64143 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) lt!287249)))

(declare-fun b!186047 () Bool)

(declare-fun res!154872 () Bool)

(assert (=> b!186047 (=> (not res!154872) (not e!128762))))

(assert (=> b!186047 (= res!154872 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287249))))

(declare-fun b!186048 () Bool)

(declare-fun lt!287252 () (_ BitVec 64))

(assert (=> b!186048 (= e!128762 (bvsle lt!287249 (bvmul lt!287252 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186048 (or (= lt!287252 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287252 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287252)))))

(assert (=> b!186048 (= lt!287252 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (= (and d!64143 res!154871) b!186047))

(assert (= (and b!186047 res!154872) b!186048))

(declare-fun m!289289 () Bool)

(assert (=> d!64143 m!289289))

(declare-fun m!289291 () Bool)

(assert (=> d!64143 m!289291))

(assert (=> b!185754 d!64143))

(declare-fun d!64155 () Bool)

(declare-fun e!128763 () Bool)

(assert (=> d!64155 e!128763))

(declare-fun res!154873 () Bool)

(assert (=> d!64155 (=> (not res!154873) (not e!128763))))

(declare-fun lt!287255 () (_ BitVec 64))

(declare-fun lt!287254 () (_ BitVec 64))

(declare-fun lt!287253 () (_ BitVec 64))

(assert (=> d!64155 (= res!154873 (= lt!287255 (bvsub lt!287254 lt!287253)))))

(assert (=> d!64155 (or (= (bvand lt!287254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287253 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287254 lt!287253) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64155 (= lt!287253 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204))))))

(declare-fun lt!287256 () (_ BitVec 64))

(declare-fun lt!287257 () (_ BitVec 64))

(assert (=> d!64155 (= lt!287254 (bvmul lt!287256 lt!287257))))

(assert (=> d!64155 (or (= lt!287256 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287257 (bvsdiv (bvmul lt!287256 lt!287257) lt!287256)))))

(assert (=> d!64155 (= lt!287257 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64155 (= lt!287256 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))))))

(assert (=> d!64155 (= lt!287255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 thiss!1204))))))

(assert (=> d!64155 (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204)))))

(assert (=> d!64155 (= (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)) lt!287255)))

(declare-fun b!186049 () Bool)

(declare-fun res!154874 () Bool)

(assert (=> b!186049 (=> (not res!154874) (not e!128763))))

(assert (=> b!186049 (= res!154874 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287255))))

(declare-fun b!186050 () Bool)

(declare-fun lt!287258 () (_ BitVec 64))

(assert (=> b!186050 (= e!128763 (bvsle lt!287255 (bvmul lt!287258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186050 (or (= lt!287258 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287258 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287258)))))

(assert (=> b!186050 (= lt!287258 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))))))

(assert (= (and d!64155 res!154873) b!186049))

(assert (= (and b!186049 res!154874) b!186050))

(declare-fun m!289293 () Bool)

(assert (=> d!64155 m!289293))

(assert (=> d!64155 m!288697))

(assert (=> b!185754 d!64155))

(declare-fun b!186072 () Bool)

(declare-fun res!154897 () Bool)

(declare-fun e!128777 () Bool)

(assert (=> b!186072 (=> (not res!154897) (not e!128777))))

(declare-fun lt!287306 () (_ BitVec 64))

(declare-fun lt!287303 () (_ BitVec 64))

(declare-fun lt!287304 () tuple2!16080)

(assert (=> b!186072 (= res!154897 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287304))) (currentByte!9032 (_2!8685 lt!287304)) (currentBit!9027 (_2!8685 lt!287304))) (bvadd lt!287303 lt!287306)))))

(assert (=> b!186072 (or (not (= (bvand lt!287303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287306 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287303 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287303 lt!287306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186072 (= lt!287306 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!186072 (= lt!287303 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(declare-fun b!186073 () Bool)

(declare-fun res!154896 () Bool)

(assert (=> b!186073 (=> (not res!154896) (not e!128777))))

(assert (=> b!186073 (= res!154896 (isPrefixOf!0 thiss!1204 (_2!8685 lt!287304)))))

(declare-fun d!64157 () Bool)

(assert (=> d!64157 e!128777))

(declare-fun res!154895 () Bool)

(assert (=> d!64157 (=> (not res!154895) (not e!128777))))

(assert (=> d!64157 (= res!154895 (= (size!4328 (buf!4788 thiss!1204)) (size!4328 (buf!4788 (_2!8685 lt!287304)))))))

(declare-fun choose!16 (BitStream!7764 Bool) tuple2!16080)

(assert (=> d!64157 (= lt!287304 (choose!16 thiss!1204 lt!286448))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64157 (validate_offset_bit!0 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)))))

(assert (=> d!64157 (= (appendBit!0 thiss!1204 lt!286448) lt!287304)))

(declare-fun b!186074 () Bool)

(declare-fun e!128776 () Bool)

(assert (=> b!186074 (= e!128777 e!128776)))

(declare-fun res!154894 () Bool)

(assert (=> b!186074 (=> (not res!154894) (not e!128776))))

(declare-fun lt!287305 () tuple2!16082)

(assert (=> b!186074 (= res!154894 (and (= (_2!8686 lt!287305) lt!286448) (= (_1!8686 lt!287305) (_2!8685 lt!287304))))))

(assert (=> b!186074 (= lt!287305 (readBitPure!0 (readerFrom!0 (_2!8685 lt!287304) (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204))))))

(declare-fun b!186075 () Bool)

(assert (=> b!186075 (= e!128776 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287305))) (currentByte!9032 (_1!8686 lt!287305)) (currentBit!9027 (_1!8686 lt!287305))) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287304))) (currentByte!9032 (_2!8685 lt!287304)) (currentBit!9027 (_2!8685 lt!287304)))))))

(assert (= (and d!64157 res!154895) b!186072))

(assert (= (and b!186072 res!154897) b!186073))

(assert (= (and b!186073 res!154896) b!186074))

(assert (= (and b!186074 res!154894) b!186075))

(declare-fun m!289319 () Bool)

(assert (=> b!186075 m!289319))

(declare-fun m!289321 () Bool)

(assert (=> b!186075 m!289321))

(declare-fun m!289323 () Bool)

(assert (=> b!186074 m!289323))

(assert (=> b!186074 m!289323))

(declare-fun m!289325 () Bool)

(assert (=> b!186074 m!289325))

(declare-fun m!289327 () Bool)

(assert (=> b!186073 m!289327))

(assert (=> b!186072 m!289321))

(assert (=> b!186072 m!288689))

(declare-fun m!289329 () Bool)

(assert (=> d!64157 m!289329))

(declare-fun m!289331 () Bool)

(assert (=> d!64157 m!289331))

(assert (=> b!185754 d!64157))

(declare-fun d!64175 () Bool)

(assert (=> d!64175 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204))))))

(declare-fun bs!15972 () Bool)

(assert (= bs!15972 d!64175))

(assert (=> bs!15972 m!288697))

(assert (=> start!40426 d!64175))

(declare-fun d!64177 () Bool)

(declare-datatypes ((tuple2!16104 0))(
  ( (tuple2!16105 (_1!8697 Bool) (_2!8697 BitStream!7764)) )
))
(declare-fun lt!287309 () tuple2!16104)

(declare-fun readBit!0 (BitStream!7764) tuple2!16104)

(assert (=> d!64177 (= lt!287309 (readBit!0 (readerFrom!0 (_2!8685 lt!286452) (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204))))))

(assert (=> d!64177 (= (readBitPure!0 (readerFrom!0 (_2!8685 lt!286452) (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204))) (tuple2!16083 (_2!8697 lt!287309) (_1!8697 lt!287309)))))

(declare-fun bs!15973 () Bool)

(assert (= bs!15973 d!64177))

(assert (=> bs!15973 m!288745))

(declare-fun m!289333 () Bool)

(assert (=> bs!15973 m!289333))

(assert (=> b!185744 d!64177))

(declare-fun d!64179 () Bool)

(declare-fun e!128780 () Bool)

(assert (=> d!64179 e!128780))

(declare-fun res!154901 () Bool)

(assert (=> d!64179 (=> (not res!154901) (not e!128780))))

(assert (=> d!64179 (= res!154901 (invariant!0 (currentBit!9027 (_2!8685 lt!286452)) (currentByte!9032 (_2!8685 lt!286452)) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (=> d!64179 (= (readerFrom!0 (_2!8685 lt!286452) (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204)) (BitStream!7765 (buf!4788 (_2!8685 lt!286452)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(declare-fun b!186078 () Bool)

(assert (=> b!186078 (= e!128780 (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (= (and d!64179 res!154901) b!186078))

(assert (=> d!64179 m!289291))

(assert (=> b!186078 m!288739))

(assert (=> b!185744 d!64179))

(declare-fun d!64181 () Bool)

(assert (=> d!64181 (= (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286454)))) (and (bvsge (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9027 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9032 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286454)))) (and (= (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286454))))))))))

(assert (=> b!185753 d!64181))

(declare-fun d!64183 () Bool)

(assert (=> d!64183 (= (array_inv!4069 (buf!4788 thiss!1204)) (bvsge (size!4328 (buf!4788 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!185751 d!64183))

(declare-fun d!64185 () Bool)

(assert (=> d!64185 (= (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204))) (and (bvsge (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9027 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9032 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204))) (and (= (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9032 thiss!1204) (size!4328 (buf!4788 thiss!1204)))))))))

(assert (=> b!185752 d!64185))

(declare-fun d!64187 () Bool)

(declare-fun res!154908 () Bool)

(declare-fun e!128785 () Bool)

(assert (=> d!64187 (=> (not res!154908) (not e!128785))))

(assert (=> d!64187 (= res!154908 (= (size!4328 (buf!4788 thiss!1204)) (size!4328 (buf!4788 (_2!8685 lt!286452)))))))

(assert (=> d!64187 (= (isPrefixOf!0 thiss!1204 (_2!8685 lt!286452)) e!128785)))

(declare-fun b!186085 () Bool)

(declare-fun res!154910 () Bool)

(assert (=> b!186085 (=> (not res!154910) (not e!128785))))

(assert (=> b!186085 (= res!154910 (bvsle (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452)))))))

(declare-fun b!186086 () Bool)

(declare-fun e!128786 () Bool)

(assert (=> b!186086 (= e!128785 e!128786)))

(declare-fun res!154909 () Bool)

(assert (=> b!186086 (=> res!154909 e!128786)))

(assert (=> b!186086 (= res!154909 (= (size!4328 (buf!4788 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186087 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9813 array!9813 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!186087 (= e!128786 (arrayBitRangesEq!0 (buf!4788 thiss!1204) (buf!4788 (_2!8685 lt!286452)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))))))

(assert (= (and d!64187 res!154908) b!186085))

(assert (= (and b!186085 res!154910) b!186086))

(assert (= (and b!186086 (not res!154909)) b!186087))

(assert (=> b!186085 m!288689))

(assert (=> b!186085 m!288687))

(assert (=> b!186087 m!288689))

(assert (=> b!186087 m!288689))

(declare-fun m!289335 () Bool)

(assert (=> b!186087 m!289335))

(assert (=> b!185750 d!64187))

(declare-fun d!64189 () Bool)

(assert (=> d!64189 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!286461)))

(declare-fun lt!287320 () Unit!13286)

(declare-fun choose!9 (BitStream!7764 array!9813 (_ BitVec 64) BitStream!7764) Unit!13286)

(assert (=> d!64189 (= lt!287320 (choose!9 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!286454)) lt!286461 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452)))))))

(assert (=> d!64189 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!286454)) lt!286461) lt!287320)))

(declare-fun bs!15974 () Bool)

(assert (= bs!15974 d!64189))

(assert (=> bs!15974 m!288715))

(declare-fun m!289337 () Bool)

(assert (=> bs!15974 m!289337))

(assert (=> b!185761 d!64189))

(declare-fun d!64191 () Bool)

(assert (=> d!64191 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!185761 d!64191))

(declare-fun d!64193 () Bool)

(declare-fun e!128791 () Bool)

(assert (=> d!64193 e!128791))

(declare-fun res!154919 () Bool)

(assert (=> d!64193 (=> (not res!154919) (not e!128791))))

(declare-fun lt!287323 () (_ BitVec 64))

(declare-fun lt!287321 () (_ BitVec 64))

(declare-fun lt!287322 () (_ BitVec 64))

(assert (=> d!64193 (= res!154919 (= lt!287323 (bvsub lt!287322 lt!287321)))))

(assert (=> d!64193 (or (= (bvand lt!287322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287322 lt!287321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64193 (= lt!287321 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286450)))) ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286450))) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286450)))))))

(declare-fun lt!287324 () (_ BitVec 64))

(declare-fun lt!287325 () (_ BitVec 64))

(assert (=> d!64193 (= lt!287322 (bvmul lt!287324 lt!287325))))

(assert (=> d!64193 (or (= lt!287324 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287325 (bvsdiv (bvmul lt!287324 lt!287325) lt!287324)))))

(assert (=> d!64193 (= lt!287325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64193 (= lt!287324 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286450)))))))

(assert (=> d!64193 (= lt!287323 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286450))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286450)))))))

(assert (=> d!64193 (invariant!0 (currentBit!9027 (_1!8686 lt!286450)) (currentByte!9032 (_1!8686 lt!286450)) (size!4328 (buf!4788 (_1!8686 lt!286450))))))

(assert (=> d!64193 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286450))) (currentByte!9032 (_1!8686 lt!286450)) (currentBit!9027 (_1!8686 lt!286450))) lt!287323)))

(declare-fun b!186097 () Bool)

(declare-fun res!154920 () Bool)

(assert (=> b!186097 (=> (not res!154920) (not e!128791))))

(assert (=> b!186097 (= res!154920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287323))))

(declare-fun b!186098 () Bool)

(declare-fun lt!287326 () (_ BitVec 64))

(assert (=> b!186098 (= e!128791 (bvsle lt!287323 (bvmul lt!287326 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186098 (or (= lt!287326 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287326 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287326)))))

(assert (=> b!186098 (= lt!287326 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286450)))))))

(assert (= (and d!64193 res!154919) b!186097))

(assert (= (and b!186097 res!154920) b!186098))

(declare-fun m!289339 () Bool)

(assert (=> d!64193 m!289339))

(declare-fun m!289341 () Bool)

(assert (=> d!64193 m!289341))

(assert (=> b!185761 d!64193))

(declare-fun lt!287381 () tuple2!16084)

(declare-fun b!186116 () Bool)

(declare-fun lt!287388 () (_ BitVec 64))

(declare-fun e!128802 () Bool)

(declare-fun lt!287374 () (_ BitVec 64))

(assert (=> b!186116 (= e!128802 (= (_1!8687 lt!287381) (withMovedBitIndex!0 (_2!8687 lt!287381) (bvsub lt!287388 lt!287374))))))

(assert (=> b!186116 (or (= (bvand lt!287388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287374 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287388 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287388 lt!287374) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186116 (= lt!287374 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454))))))

(assert (=> b!186116 (= lt!287388 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(declare-fun b!186117 () Bool)

(declare-fun e!128801 () Unit!13286)

(declare-fun lt!287385 () Unit!13286)

(assert (=> b!186117 (= e!128801 lt!287385)))

(declare-fun lt!287386 () (_ BitVec 64))

(assert (=> b!186117 (= lt!287386 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!287384 () (_ BitVec 64))

(assert (=> b!186117 (= lt!287384 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9813 array!9813 (_ BitVec 64) (_ BitVec 64)) Unit!13286)

(assert (=> b!186117 (= lt!287385 (arrayBitRangesEqSymmetric!0 (buf!4788 (_2!8685 lt!286452)) (buf!4788 (_2!8685 lt!286454)) lt!287386 lt!287384))))

(assert (=> b!186117 (arrayBitRangesEq!0 (buf!4788 (_2!8685 lt!286454)) (buf!4788 (_2!8685 lt!286452)) lt!287386 lt!287384)))

(declare-fun b!186118 () Bool)

(declare-fun Unit!13316 () Unit!13286)

(assert (=> b!186118 (= e!128801 Unit!13316)))

(declare-fun d!64195 () Bool)

(assert (=> d!64195 e!128802))

(declare-fun res!154937 () Bool)

(assert (=> d!64195 (=> (not res!154937) (not e!128802))))

(assert (=> d!64195 (= res!154937 (isPrefixOf!0 (_1!8687 lt!287381) (_2!8687 lt!287381)))))

(declare-fun lt!287377 () BitStream!7764)

(assert (=> d!64195 (= lt!287381 (tuple2!16085 lt!287377 (_2!8685 lt!286454)))))

(declare-fun lt!287376 () Unit!13286)

(declare-fun lt!287390 () Unit!13286)

(assert (=> d!64195 (= lt!287376 lt!287390)))

(assert (=> d!64195 (isPrefixOf!0 lt!287377 (_2!8685 lt!286454))))

(assert (=> d!64195 (= lt!287390 (lemmaIsPrefixTransitive!0 lt!287377 (_2!8685 lt!286454) (_2!8685 lt!286454)))))

(declare-fun lt!287380 () Unit!13286)

(declare-fun lt!287389 () Unit!13286)

(assert (=> d!64195 (= lt!287380 lt!287389)))

(assert (=> d!64195 (isPrefixOf!0 lt!287377 (_2!8685 lt!286454))))

(assert (=> d!64195 (= lt!287389 (lemmaIsPrefixTransitive!0 lt!287377 (_2!8685 lt!286452) (_2!8685 lt!286454)))))

(declare-fun lt!287383 () Unit!13286)

(assert (=> d!64195 (= lt!287383 e!128801)))

(declare-fun c!9499 () Bool)

(assert (=> d!64195 (= c!9499 (not (= (size!4328 (buf!4788 (_2!8685 lt!286452))) #b00000000000000000000000000000000)))))

(declare-fun lt!287382 () Unit!13286)

(declare-fun lt!287391 () Unit!13286)

(assert (=> d!64195 (= lt!287382 lt!287391)))

(assert (=> d!64195 (isPrefixOf!0 (_2!8685 lt!286454) (_2!8685 lt!286454))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7764) Unit!13286)

(assert (=> d!64195 (= lt!287391 (lemmaIsPrefixRefl!0 (_2!8685 lt!286454)))))

(declare-fun lt!287379 () Unit!13286)

(declare-fun lt!287387 () Unit!13286)

(assert (=> d!64195 (= lt!287379 lt!287387)))

(assert (=> d!64195 (= lt!287387 (lemmaIsPrefixRefl!0 (_2!8685 lt!286454)))))

(declare-fun lt!287378 () Unit!13286)

(declare-fun lt!287375 () Unit!13286)

(assert (=> d!64195 (= lt!287378 lt!287375)))

(assert (=> d!64195 (isPrefixOf!0 lt!287377 lt!287377)))

(assert (=> d!64195 (= lt!287375 (lemmaIsPrefixRefl!0 lt!287377))))

(declare-fun lt!287373 () Unit!13286)

(declare-fun lt!287372 () Unit!13286)

(assert (=> d!64195 (= lt!287373 lt!287372)))

(assert (=> d!64195 (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!286452))))

(assert (=> d!64195 (= lt!287372 (lemmaIsPrefixRefl!0 (_2!8685 lt!286452)))))

(assert (=> d!64195 (= lt!287377 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(assert (=> d!64195 (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!286454))))

(assert (=> d!64195 (= (reader!0 (_2!8685 lt!286452) (_2!8685 lt!286454)) lt!287381)))

(declare-fun b!186119 () Bool)

(declare-fun res!154936 () Bool)

(assert (=> b!186119 (=> (not res!154936) (not e!128802))))

(assert (=> b!186119 (= res!154936 (isPrefixOf!0 (_2!8687 lt!287381) (_2!8685 lt!286454)))))

(declare-fun b!186120 () Bool)

(declare-fun res!154935 () Bool)

(assert (=> b!186120 (=> (not res!154935) (not e!128802))))

(assert (=> b!186120 (= res!154935 (isPrefixOf!0 (_1!8687 lt!287381) (_2!8685 lt!286452)))))

(assert (= (and d!64195 c!9499) b!186117))

(assert (= (and d!64195 (not c!9499)) b!186118))

(assert (= (and d!64195 res!154937) b!186120))

(assert (= (and b!186120 res!154935) b!186119))

(assert (= (and b!186119 res!154936) b!186116))

(assert (=> b!186117 m!288687))

(declare-fun m!289359 () Bool)

(assert (=> b!186117 m!289359))

(declare-fun m!289361 () Bool)

(assert (=> b!186117 m!289361))

(declare-fun m!289363 () Bool)

(assert (=> d!64195 m!289363))

(assert (=> d!64195 m!288759))

(declare-fun m!289365 () Bool)

(assert (=> d!64195 m!289365))

(declare-fun m!289367 () Bool)

(assert (=> d!64195 m!289367))

(declare-fun m!289369 () Bool)

(assert (=> d!64195 m!289369))

(declare-fun m!289371 () Bool)

(assert (=> d!64195 m!289371))

(declare-fun m!289373 () Bool)

(assert (=> d!64195 m!289373))

(declare-fun m!289375 () Bool)

(assert (=> d!64195 m!289375))

(declare-fun m!289377 () Bool)

(assert (=> d!64195 m!289377))

(declare-fun m!289379 () Bool)

(assert (=> d!64195 m!289379))

(declare-fun m!289381 () Bool)

(assert (=> d!64195 m!289381))

(declare-fun m!289383 () Bool)

(assert (=> b!186120 m!289383))

(declare-fun m!289385 () Bool)

(assert (=> b!186119 m!289385))

(declare-fun m!289387 () Bool)

(assert (=> b!186116 m!289387))

(assert (=> b!186116 m!288703))

(assert (=> b!186116 m!288687))

(assert (=> b!185761 d!64195))

(declare-fun d!64209 () Bool)

(assert (=> d!64209 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)) lt!286465)))

(declare-fun lt!287392 () Unit!13286)

(assert (=> d!64209 (= lt!287392 (choose!9 thiss!1204 (buf!4788 (_2!8685 lt!286454)) lt!286465 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))))))

(assert (=> d!64209 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4788 (_2!8685 lt!286454)) lt!286465) lt!287392)))

(declare-fun bs!15977 () Bool)

(assert (= bs!15977 d!64209))

(assert (=> bs!15977 m!288719))

(declare-fun m!289389 () Bool)

(assert (=> bs!15977 m!289389))

(assert (=> b!185761 d!64209))

(declare-datatypes ((tuple2!16106 0))(
  ( (tuple2!16107 (_1!8698 (_ BitVec 64)) (_2!8698 BitStream!7764)) )
))
(declare-fun lt!287395 () tuple2!16106)

(declare-fun d!64211 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16106)

(assert (=> d!64211 (= lt!287395 (readNBitsLSBFirstsLoop!0 (_1!8687 lt!286460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458))))

(assert (=> d!64211 (= (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!286460) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458) (tuple2!16087 (_2!8698 lt!287395) (_1!8698 lt!287395)))))

(declare-fun bs!15978 () Bool)

(assert (= bs!15978 d!64211))

(declare-fun m!289391 () Bool)

(assert (=> bs!15978 m!289391))

(assert (=> b!185761 d!64211))

(declare-fun lt!287412 () (_ BitVec 64))

(declare-fun b!186121 () Bool)

(declare-fun lt!287405 () tuple2!16084)

(declare-fun lt!287398 () (_ BitVec 64))

(declare-fun e!128804 () Bool)

(assert (=> b!186121 (= e!128804 (= (_1!8687 lt!287405) (withMovedBitIndex!0 (_2!8687 lt!287405) (bvsub lt!287412 lt!287398))))))

(assert (=> b!186121 (or (= (bvand lt!287412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287398 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287412 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287412 lt!287398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186121 (= lt!287398 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454))))))

(assert (=> b!186121 (= lt!287412 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(declare-fun b!186122 () Bool)

(declare-fun e!128803 () Unit!13286)

(declare-fun lt!287409 () Unit!13286)

(assert (=> b!186122 (= e!128803 lt!287409)))

(declare-fun lt!287410 () (_ BitVec 64))

(assert (=> b!186122 (= lt!287410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!287408 () (_ BitVec 64))

(assert (=> b!186122 (= lt!287408 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(assert (=> b!186122 (= lt!287409 (arrayBitRangesEqSymmetric!0 (buf!4788 thiss!1204) (buf!4788 (_2!8685 lt!286454)) lt!287410 lt!287408))))

(assert (=> b!186122 (arrayBitRangesEq!0 (buf!4788 (_2!8685 lt!286454)) (buf!4788 thiss!1204) lt!287410 lt!287408)))

(declare-fun b!186123 () Bool)

(declare-fun Unit!13317 () Unit!13286)

(assert (=> b!186123 (= e!128803 Unit!13317)))

(declare-fun d!64213 () Bool)

(assert (=> d!64213 e!128804))

(declare-fun res!154940 () Bool)

(assert (=> d!64213 (=> (not res!154940) (not e!128804))))

(assert (=> d!64213 (= res!154940 (isPrefixOf!0 (_1!8687 lt!287405) (_2!8687 lt!287405)))))

(declare-fun lt!287401 () BitStream!7764)

(assert (=> d!64213 (= lt!287405 (tuple2!16085 lt!287401 (_2!8685 lt!286454)))))

(declare-fun lt!287400 () Unit!13286)

(declare-fun lt!287414 () Unit!13286)

(assert (=> d!64213 (= lt!287400 lt!287414)))

(assert (=> d!64213 (isPrefixOf!0 lt!287401 (_2!8685 lt!286454))))

(assert (=> d!64213 (= lt!287414 (lemmaIsPrefixTransitive!0 lt!287401 (_2!8685 lt!286454) (_2!8685 lt!286454)))))

(declare-fun lt!287404 () Unit!13286)

(declare-fun lt!287413 () Unit!13286)

(assert (=> d!64213 (= lt!287404 lt!287413)))

(assert (=> d!64213 (isPrefixOf!0 lt!287401 (_2!8685 lt!286454))))

(assert (=> d!64213 (= lt!287413 (lemmaIsPrefixTransitive!0 lt!287401 thiss!1204 (_2!8685 lt!286454)))))

(declare-fun lt!287407 () Unit!13286)

(assert (=> d!64213 (= lt!287407 e!128803)))

(declare-fun c!9500 () Bool)

(assert (=> d!64213 (= c!9500 (not (= (size!4328 (buf!4788 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!287406 () Unit!13286)

(declare-fun lt!287415 () Unit!13286)

(assert (=> d!64213 (= lt!287406 lt!287415)))

(assert (=> d!64213 (isPrefixOf!0 (_2!8685 lt!286454) (_2!8685 lt!286454))))

(assert (=> d!64213 (= lt!287415 (lemmaIsPrefixRefl!0 (_2!8685 lt!286454)))))

(declare-fun lt!287403 () Unit!13286)

(declare-fun lt!287411 () Unit!13286)

(assert (=> d!64213 (= lt!287403 lt!287411)))

(assert (=> d!64213 (= lt!287411 (lemmaIsPrefixRefl!0 (_2!8685 lt!286454)))))

(declare-fun lt!287402 () Unit!13286)

(declare-fun lt!287399 () Unit!13286)

(assert (=> d!64213 (= lt!287402 lt!287399)))

(assert (=> d!64213 (isPrefixOf!0 lt!287401 lt!287401)))

(assert (=> d!64213 (= lt!287399 (lemmaIsPrefixRefl!0 lt!287401))))

(declare-fun lt!287397 () Unit!13286)

(declare-fun lt!287396 () Unit!13286)

(assert (=> d!64213 (= lt!287397 lt!287396)))

(assert (=> d!64213 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64213 (= lt!287396 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64213 (= lt!287401 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)))))

(assert (=> d!64213 (isPrefixOf!0 thiss!1204 (_2!8685 lt!286454))))

(assert (=> d!64213 (= (reader!0 thiss!1204 (_2!8685 lt!286454)) lt!287405)))

(declare-fun b!186124 () Bool)

(declare-fun res!154939 () Bool)

(assert (=> b!186124 (=> (not res!154939) (not e!128804))))

(assert (=> b!186124 (= res!154939 (isPrefixOf!0 (_2!8687 lt!287405) (_2!8685 lt!286454)))))

(declare-fun b!186125 () Bool)

(declare-fun res!154938 () Bool)

(assert (=> b!186125 (=> (not res!154938) (not e!128804))))

(assert (=> b!186125 (= res!154938 (isPrefixOf!0 (_1!8687 lt!287405) thiss!1204))))

(assert (= (and d!64213 c!9500) b!186122))

(assert (= (and d!64213 (not c!9500)) b!186123))

(assert (= (and d!64213 res!154940) b!186125))

(assert (= (and b!186125 res!154938) b!186124))

(assert (= (and b!186124 res!154939) b!186121))

(assert (=> b!186122 m!288689))

(declare-fun m!289393 () Bool)

(assert (=> b!186122 m!289393))

(declare-fun m!289395 () Bool)

(assert (=> b!186122 m!289395))

(assert (=> d!64213 m!289363))

(assert (=> d!64213 m!288705))

(declare-fun m!289397 () Bool)

(assert (=> d!64213 m!289397))

(declare-fun m!289399 () Bool)

(assert (=> d!64213 m!289399))

(assert (=> d!64213 m!289369))

(declare-fun m!289401 () Bool)

(assert (=> d!64213 m!289401))

(declare-fun m!289403 () Bool)

(assert (=> d!64213 m!289403))

(declare-fun m!289405 () Bool)

(assert (=> d!64213 m!289405))

(declare-fun m!289407 () Bool)

(assert (=> d!64213 m!289407))

(declare-fun m!289409 () Bool)

(assert (=> d!64213 m!289409))

(declare-fun m!289411 () Bool)

(assert (=> d!64213 m!289411))

(declare-fun m!289413 () Bool)

(assert (=> b!186125 m!289413))

(declare-fun m!289415 () Bool)

(assert (=> b!186124 m!289415))

(declare-fun m!289417 () Bool)

(assert (=> b!186121 m!289417))

(assert (=> b!186121 m!288703))

(assert (=> b!186121 m!288689))

(assert (=> b!185761 d!64213))

(declare-fun d!64215 () Bool)

(declare-fun lt!287416 () tuple2!16104)

(assert (=> d!64215 (= lt!287416 (readBit!0 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))))))

(assert (=> d!64215 (= (readBitPure!0 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))) (tuple2!16083 (_2!8697 lt!287416) (_1!8697 lt!287416)))))

(declare-fun bs!15979 () Bool)

(assert (= bs!15979 d!64215))

(declare-fun m!289419 () Bool)

(assert (=> bs!15979 m!289419))

(assert (=> b!185761 d!64215))

(declare-fun d!64217 () Bool)

(declare-fun lt!287417 () tuple2!16104)

(assert (=> d!64217 (= lt!287417 (readBit!0 (_1!8687 lt!286467)))))

(assert (=> d!64217 (= (readBitPure!0 (_1!8687 lt!286467)) (tuple2!16083 (_2!8697 lt!287417) (_1!8697 lt!287417)))))

(declare-fun bs!15980 () Bool)

(assert (= bs!15980 d!64217))

(declare-fun m!289421 () Bool)

(assert (=> bs!15980 m!289421))

(assert (=> b!185761 d!64217))

(declare-fun d!64219 () Bool)

(assert (=> d!64219 (= (invariant!0 (currentBit!9027 thiss!1204) (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286452)))) (and (bvsge (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9027 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9032 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286452)))) (and (= (currentBit!9027 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9032 thiss!1204) (size!4328 (buf!4788 (_2!8685 lt!286452))))))))))

(assert (=> b!185761 d!64219))

(declare-fun d!64221 () Bool)

(assert (=> d!64221 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)) lt!286465) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204))) lt!286465))))

(declare-fun bs!15981 () Bool)

(assert (= bs!15981 d!64221))

(declare-fun m!289423 () Bool)

(assert (=> bs!15981 m!289423))

(assert (=> b!185761 d!64221))

(declare-fun d!64223 () Bool)

(declare-fun lt!287418 () tuple2!16104)

(assert (=> d!64223 (= lt!287418 (readBit!0 lt!286466))))

(assert (=> d!64223 (= (readBitPure!0 lt!286466) (tuple2!16083 (_2!8697 lt!287418) (_1!8697 lt!287418)))))

(declare-fun bs!15982 () Bool)

(assert (= bs!15982 d!64223))

(declare-fun m!289425 () Bool)

(assert (=> bs!15982 m!289425))

(assert (=> b!185761 d!64223))

(declare-fun d!64225 () Bool)

(assert (=> d!64225 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!286461) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452)))) lt!286461))))

(declare-fun bs!15983 () Bool)

(assert (= bs!15983 d!64225))

(declare-fun m!289427 () Bool)

(assert (=> bs!15983 m!289427))

(assert (=> b!185761 d!64225))

(declare-fun d!64227 () Bool)

(declare-fun e!128807 () Bool)

(assert (=> d!64227 e!128807))

(declare-fun res!154943 () Bool)

(assert (=> d!64227 (=> (not res!154943) (not e!128807))))

(declare-fun lt!287430 () tuple2!16082)

(declare-fun lt!287429 () tuple2!16082)

(assert (=> d!64227 (= res!154943 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287430))) (currentByte!9032 (_1!8686 lt!287430)) (currentBit!9027 (_1!8686 lt!287430))) (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287429))) (currentByte!9032 (_1!8686 lt!287429)) (currentBit!9027 (_1!8686 lt!287429)))))))

(declare-fun lt!287428 () BitStream!7764)

(declare-fun lt!287427 () Unit!13286)

(declare-fun choose!50 (BitStream!7764 BitStream!7764 BitStream!7764 tuple2!16082 tuple2!16082 BitStream!7764 Bool tuple2!16082 tuple2!16082 BitStream!7764 Bool) Unit!13286)

(assert (=> d!64227 (= lt!287427 (choose!50 lt!286466 (_2!8685 lt!286454) lt!287428 lt!287430 (tuple2!16083 (_1!8686 lt!287430) (_2!8686 lt!287430)) (_1!8686 lt!287430) (_2!8686 lt!287430) lt!287429 (tuple2!16083 (_1!8686 lt!287429) (_2!8686 lt!287429)) (_1!8686 lt!287429) (_2!8686 lt!287429)))))

(assert (=> d!64227 (= lt!287429 (readBitPure!0 lt!287428))))

(assert (=> d!64227 (= lt!287430 (readBitPure!0 lt!286466))))

(assert (=> d!64227 (= lt!287428 (BitStream!7765 (buf!4788 (_2!8685 lt!286454)) (currentByte!9032 lt!286466) (currentBit!9027 lt!286466)))))

(assert (=> d!64227 (invariant!0 (currentBit!9027 lt!286466) (currentByte!9032 lt!286466) (size!4328 (buf!4788 (_2!8685 lt!286454))))))

(assert (=> d!64227 (= (readBitPrefixLemma!0 lt!286466 (_2!8685 lt!286454)) lt!287427)))

(declare-fun b!186128 () Bool)

(assert (=> b!186128 (= e!128807 (= (_2!8686 lt!287430) (_2!8686 lt!287429)))))

(assert (= (and d!64227 res!154943) b!186128))

(assert (=> d!64227 m!288737))

(declare-fun m!289429 () Bool)

(assert (=> d!64227 m!289429))

(declare-fun m!289431 () Bool)

(assert (=> d!64227 m!289431))

(declare-fun m!289433 () Bool)

(assert (=> d!64227 m!289433))

(declare-fun m!289435 () Bool)

(assert (=> d!64227 m!289435))

(declare-fun m!289437 () Bool)

(assert (=> d!64227 m!289437))

(assert (=> b!185761 d!64227))

(declare-fun lt!287431 () tuple2!16106)

(declare-fun d!64229 () Bool)

(assert (=> d!64229 (= lt!287431 (readNBitsLSBFirstsLoop!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443))))

(assert (=> d!64229 (= (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443) (tuple2!16087 (_2!8698 lt!287431) (_1!8698 lt!287431)))))

(declare-fun bs!15984 () Bool)

(assert (= bs!15984 d!64229))

(declare-fun m!289439 () Bool)

(assert (=> bs!15984 m!289439))

(assert (=> b!185761 d!64229))

(declare-fun d!64231 () Bool)

(declare-fun e!128808 () Bool)

(assert (=> d!64231 e!128808))

(declare-fun res!154944 () Bool)

(assert (=> d!64231 (=> (not res!154944) (not e!128808))))

(declare-fun lt!287434 () (_ BitVec 64))

(declare-fun lt!287432 () (_ BitVec 64))

(declare-fun lt!287433 () (_ BitVec 64))

(assert (=> d!64231 (= res!154944 (= lt!287434 (bvsub lt!287433 lt!287432)))))

(assert (=> d!64231 (or (= (bvand lt!287433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287433 lt!287432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64231 (= lt!287432 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286455)))) ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286455))) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286455)))))))

(declare-fun lt!287435 () (_ BitVec 64))

(declare-fun lt!287436 () (_ BitVec 64))

(assert (=> d!64231 (= lt!287433 (bvmul lt!287435 lt!287436))))

(assert (=> d!64231 (or (= lt!287435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287436 (bvsdiv (bvmul lt!287435 lt!287436) lt!287435)))))

(assert (=> d!64231 (= lt!287436 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64231 (= lt!287435 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286455)))))))

(assert (=> d!64231 (= lt!287434 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286455))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286455)))))))

(assert (=> d!64231 (invariant!0 (currentBit!9027 (_1!8686 lt!286455)) (currentByte!9032 (_1!8686 lt!286455)) (size!4328 (buf!4788 (_1!8686 lt!286455))))))

(assert (=> d!64231 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286455))) (currentByte!9032 (_1!8686 lt!286455)) (currentBit!9027 (_1!8686 lt!286455))) lt!287434)))

(declare-fun b!186129 () Bool)

(declare-fun res!154945 () Bool)

(assert (=> b!186129 (=> (not res!154945) (not e!128808))))

(assert (=> b!186129 (= res!154945 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287434))))

(declare-fun b!186130 () Bool)

(declare-fun lt!287437 () (_ BitVec 64))

(assert (=> b!186130 (= e!128808 (bvsle lt!287434 (bvmul lt!287437 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186130 (or (= lt!287437 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287437 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287437)))))

(assert (=> b!186130 (= lt!287437 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286455)))))))

(assert (= (and d!64231 res!154944) b!186129))

(assert (= (and b!186129 res!154945) b!186130))

(declare-fun m!289441 () Bool)

(assert (=> d!64231 m!289441))

(declare-fun m!289443 () Bool)

(assert (=> d!64231 m!289443))

(assert (=> b!185761 d!64231))

(assert (=> b!185759 d!64187))

(declare-fun d!64233 () Bool)

(declare-fun e!128809 () Bool)

(assert (=> d!64233 e!128809))

(declare-fun res!154946 () Bool)

(assert (=> d!64233 (=> (not res!154946) (not e!128809))))

(declare-fun lt!287438 () (_ BitVec 64))

(declare-fun lt!287439 () (_ BitVec 64))

(declare-fun lt!287440 () (_ BitVec 64))

(assert (=> d!64233 (= res!154946 (= lt!287440 (bvsub lt!287439 lt!287438)))))

(assert (=> d!64233 (or (= (bvand lt!287439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287439 lt!287438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64233 (= lt!287438 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286442)))) ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286442))) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286442)))))))

(declare-fun lt!287441 () (_ BitVec 64))

(declare-fun lt!287442 () (_ BitVec 64))

(assert (=> d!64233 (= lt!287439 (bvmul lt!287441 lt!287442))))

(assert (=> d!64233 (or (= lt!287441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287442 (bvsdiv (bvmul lt!287441 lt!287442) lt!287441)))))

(assert (=> d!64233 (= lt!287442 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64233 (= lt!287441 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286442)))))))

(assert (=> d!64233 (= lt!287440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 (_1!8686 lt!286442))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 (_1!8686 lt!286442)))))))

(assert (=> d!64233 (invariant!0 (currentBit!9027 (_1!8686 lt!286442)) (currentByte!9032 (_1!8686 lt!286442)) (size!4328 (buf!4788 (_1!8686 lt!286442))))))

(assert (=> d!64233 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!286442))) (currentByte!9032 (_1!8686 lt!286442)) (currentBit!9027 (_1!8686 lt!286442))) lt!287440)))

(declare-fun b!186131 () Bool)

(declare-fun res!154947 () Bool)

(assert (=> b!186131 (=> (not res!154947) (not e!128809))))

(assert (=> b!186131 (= res!154947 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287440))))

(declare-fun b!186132 () Bool)

(declare-fun lt!287443 () (_ BitVec 64))

(assert (=> b!186132 (= e!128809 (bvsle lt!287440 (bvmul lt!287443 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186132 (or (= lt!287443 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287443 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287443)))))

(assert (=> b!186132 (= lt!287443 ((_ sign_extend 32) (size!4328 (buf!4788 (_1!8686 lt!286442)))))))

(assert (= (and d!64233 res!154946) b!186131))

(assert (= (and b!186131 res!154947) b!186132))

(declare-fun m!289445 () Bool)

(assert (=> d!64233 m!289445))

(declare-fun m!289447 () Bool)

(assert (=> d!64233 m!289447))

(assert (=> b!185749 d!64233))

(declare-fun d!64235 () Bool)

(declare-fun e!128810 () Bool)

(assert (=> d!64235 e!128810))

(declare-fun res!154948 () Bool)

(assert (=> d!64235 (=> (not res!154948) (not e!128810))))

(declare-fun lt!287445 () (_ BitVec 64))

(declare-fun lt!287446 () (_ BitVec 64))

(declare-fun lt!287444 () (_ BitVec 64))

(assert (=> d!64235 (= res!154948 (= lt!287446 (bvsub lt!287445 lt!287444)))))

(assert (=> d!64235 (or (= (bvand lt!287445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287445 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287445 lt!287444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64235 (= lt!287444 (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286454))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286454)))))))

(declare-fun lt!287447 () (_ BitVec 64))

(declare-fun lt!287448 () (_ BitVec 64))

(assert (=> d!64235 (= lt!287445 (bvmul lt!287447 lt!287448))))

(assert (=> d!64235 (or (= lt!287447 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287448 (bvsdiv (bvmul lt!287447 lt!287448) lt!287447)))))

(assert (=> d!64235 (= lt!287448 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64235 (= lt!287447 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))))))

(assert (=> d!64235 (= lt!287446 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286454))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286454)))))))

(assert (=> d!64235 (invariant!0 (currentBit!9027 (_2!8685 lt!286454)) (currentByte!9032 (_2!8685 lt!286454)) (size!4328 (buf!4788 (_2!8685 lt!286454))))))

(assert (=> d!64235 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454))) lt!287446)))

(declare-fun b!186133 () Bool)

(declare-fun res!154949 () Bool)

(assert (=> b!186133 (=> (not res!154949) (not e!128810))))

(assert (=> b!186133 (= res!154949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287446))))

(declare-fun b!186134 () Bool)

(declare-fun lt!287449 () (_ BitVec 64))

(assert (=> b!186134 (= e!128810 (bvsle lt!287446 (bvmul lt!287449 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186134 (or (= lt!287449 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287449 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287449)))))

(assert (=> b!186134 (= lt!287449 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286454)))))))

(assert (= (and d!64235 res!154948) b!186133))

(assert (= (and b!186133 res!154949) b!186134))

(declare-fun m!289449 () Bool)

(assert (=> d!64235 m!289449))

(assert (=> d!64235 m!288699))

(assert (=> b!185760 d!64235))

(declare-fun d!64237 () Bool)

(declare-fun res!154950 () Bool)

(declare-fun e!128811 () Bool)

(assert (=> d!64237 (=> (not res!154950) (not e!128811))))

(assert (=> d!64237 (= res!154950 (= (size!4328 (buf!4788 thiss!1204)) (size!4328 (buf!4788 (_2!8685 lt!286454)))))))

(assert (=> d!64237 (= (isPrefixOf!0 thiss!1204 (_2!8685 lt!286454)) e!128811)))

(declare-fun b!186135 () Bool)

(declare-fun res!154952 () Bool)

(assert (=> b!186135 (=> (not res!154952) (not e!128811))))

(assert (=> b!186135 (= res!154952 (bvsle (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204)) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454)))))))

(declare-fun b!186136 () Bool)

(declare-fun e!128812 () Bool)

(assert (=> b!186136 (= e!128811 e!128812)))

(declare-fun res!154951 () Bool)

(assert (=> b!186136 (=> res!154951 e!128812)))

(assert (=> b!186136 (= res!154951 (= (size!4328 (buf!4788 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186137 () Bool)

(assert (=> b!186137 (= e!128812 (arrayBitRangesEq!0 (buf!4788 thiss!1204) (buf!4788 (_2!8685 lt!286454)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4328 (buf!4788 thiss!1204)) (currentByte!9032 thiss!1204) (currentBit!9027 thiss!1204))))))

(assert (= (and d!64237 res!154950) b!186135))

(assert (= (and b!186135 res!154952) b!186136))

(assert (= (and b!186136 (not res!154951)) b!186137))

(assert (=> b!186135 m!288689))

(assert (=> b!186135 m!288703))

(assert (=> b!186137 m!288689))

(assert (=> b!186137 m!288689))

(declare-fun m!289451 () Bool)

(assert (=> b!186137 m!289451))

(assert (=> b!185760 d!64237))

(declare-fun d!64239 () Bool)

(assert (=> d!64239 (isPrefixOf!0 thiss!1204 (_2!8685 lt!286454))))

(declare-fun lt!287452 () Unit!13286)

(declare-fun choose!30 (BitStream!7764 BitStream!7764 BitStream!7764) Unit!13286)

(assert (=> d!64239 (= lt!287452 (choose!30 thiss!1204 (_2!8685 lt!286452) (_2!8685 lt!286454)))))

(assert (=> d!64239 (isPrefixOf!0 thiss!1204 (_2!8685 lt!286452))))

(assert (=> d!64239 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8685 lt!286452) (_2!8685 lt!286454)) lt!287452)))

(declare-fun bs!15985 () Bool)

(assert (= bs!15985 d!64239))

(assert (=> bs!15985 m!288705))

(declare-fun m!289453 () Bool)

(assert (=> bs!15985 m!289453))

(assert (=> bs!15985 m!288685))

(assert (=> b!185760 d!64239))

(declare-fun b!186170 () Bool)

(declare-fun res!154986 () Bool)

(declare-fun e!128838 () Bool)

(assert (=> b!186170 (=> (not res!154986) (not e!128838))))

(declare-fun lt!287594 () tuple2!16080)

(assert (=> b!186170 (= res!154986 (= (size!4328 (buf!4788 (_2!8685 lt!286452))) (size!4328 (buf!4788 (_2!8685 lt!287594)))))))

(declare-fun b!186171 () Bool)

(declare-fun e!128836 () tuple2!16080)

(declare-fun Unit!13318 () Unit!13286)

(assert (=> b!186171 (= e!128836 (tuple2!16081 Unit!13318 (_2!8685 lt!286452)))))

(declare-fun lt!287592 () Unit!13286)

(assert (=> b!186171 (= lt!287592 (lemmaIsPrefixRefl!0 (_2!8685 lt!286452)))))

(declare-fun call!2996 () Bool)

(assert (=> b!186171 call!2996))

(declare-fun lt!287578 () Unit!13286)

(assert (=> b!186171 (= lt!287578 lt!287592)))

(declare-fun b!186172 () Bool)

(declare-fun res!154983 () Bool)

(assert (=> b!186172 (=> (not res!154983) (not e!128838))))

(assert (=> b!186172 (= res!154983 (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!287594)))))

(declare-fun b!186173 () Bool)

(declare-fun res!154984 () Bool)

(assert (=> b!186173 (= res!154984 call!2996)))

(declare-fun e!128835 () Bool)

(assert (=> b!186173 (=> (not res!154984) (not e!128835))))

(declare-fun b!186174 () Bool)

(declare-fun e!128832 () (_ BitVec 64))

(assert (=> b!186174 (= e!128832 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!186175 () Bool)

(declare-fun e!128839 () Bool)

(assert (=> b!186175 (= e!128838 e!128839)))

(declare-fun res!154977 () Bool)

(assert (=> b!186175 (=> (not res!154977) (not e!128839))))

(declare-fun lt!287587 () tuple2!16086)

(assert (=> b!186175 (= res!154977 (= (_2!8688 lt!287587) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!287576 () tuple2!16084)

(assert (=> b!186175 (= lt!287587 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!287576) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!287617 () Unit!13286)

(declare-fun lt!287612 () Unit!13286)

(assert (=> b!186175 (= lt!287617 lt!287612)))

(declare-fun lt!287599 () (_ BitVec 64))

(assert (=> b!186175 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!287594)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!287599)))

(assert (=> b!186175 (= lt!287612 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!287594)) lt!287599))))

(declare-fun e!128831 () Bool)

(assert (=> b!186175 e!128831))

(declare-fun res!154980 () Bool)

(assert (=> b!186175 (=> (not res!154980) (not e!128831))))

(assert (=> b!186175 (= res!154980 (and (= (size!4328 (buf!4788 (_2!8685 lt!286452))) (size!4328 (buf!4788 (_2!8685 lt!287594)))) (bvsge lt!287599 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186175 (= lt!287599 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!186175 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!186175 (= lt!287576 (reader!0 (_2!8685 lt!286452) (_2!8685 lt!287594)))))

(declare-fun b!186176 () Bool)

(declare-fun e!128833 () Bool)

(declare-fun lt!287595 () tuple2!16086)

(declare-fun lt!287586 () tuple2!16084)

(assert (=> b!186176 (= e!128833 (= (_1!8688 lt!287595) (_2!8687 lt!287586)))))

(declare-fun b!186177 () Bool)

(declare-fun lt!287596 () tuple2!16082)

(declare-fun lt!287598 () tuple2!16080)

(assert (=> b!186177 (= lt!287596 (readBitPure!0 (readerFrom!0 (_2!8685 lt!287598) (currentBit!9027 (_2!8685 lt!286452)) (currentByte!9032 (_2!8685 lt!286452)))))))

(declare-fun res!154982 () Bool)

(declare-fun lt!287600 () Bool)

(assert (=> b!186177 (= res!154982 (and (= (_2!8686 lt!287596) lt!287600) (= (_1!8686 lt!287596) (_2!8685 lt!287598))))))

(declare-fun e!128834 () Bool)

(assert (=> b!186177 (=> (not res!154982) (not e!128834))))

(assert (=> b!186177 (= e!128835 e!128834)))

(declare-fun b!186178 () Bool)

(assert (=> b!186178 (= e!128834 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287596))) (currentByte!9032 (_1!8686 lt!287596)) (currentBit!9027 (_1!8686 lt!287596))) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287598))) (currentByte!9032 (_2!8685 lt!287598)) (currentBit!9027 (_2!8685 lt!287598)))))))

(declare-fun b!186179 () Bool)

(assert (=> b!186179 (= e!128831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!286452)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!287599))))

(declare-fun b!186180 () Bool)

(declare-fun res!154985 () Bool)

(assert (=> b!186180 (=> (not res!154985) (not e!128838))))

(declare-fun lt!287606 () (_ BitVec 64))

(declare-fun lt!287566 () (_ BitVec 64))

(assert (=> b!186180 (= res!154985 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287594))) (currentByte!9032 (_2!8685 lt!287594)) (currentBit!9027 (_2!8685 lt!287594))) (bvsub lt!287606 lt!287566)))))

(assert (=> b!186180 (or (= (bvand lt!287606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287566 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287606 lt!287566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186180 (= lt!287566 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!287605 () (_ BitVec 64))

(declare-fun lt!287620 () (_ BitVec 64))

(assert (=> b!186180 (= lt!287606 (bvadd lt!287605 lt!287620))))

(assert (=> b!186180 (or (not (= (bvand lt!287605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287620 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287605 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287605 lt!287620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186180 (= lt!287620 ((_ sign_extend 32) nBits!348))))

(assert (=> b!186180 (= lt!287605 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(declare-fun b!186181 () Bool)

(declare-fun res!154988 () Bool)

(assert (=> b!186181 (= res!154988 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287598))) (currentByte!9032 (_2!8685 lt!287598)) (currentBit!9027 (_2!8685 lt!287598))) (bvadd (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!186181 (=> (not res!154988) (not e!128835))))

(declare-fun b!186182 () Bool)

(assert (=> b!186182 (= e!128839 (= (_1!8688 lt!287587) (_2!8687 lt!287576)))))

(declare-fun d!64241 () Bool)

(assert (=> d!64241 e!128838))

(declare-fun res!154979 () Bool)

(assert (=> d!64241 (=> (not res!154979) (not e!128838))))

(assert (=> d!64241 (= res!154979 (invariant!0 (currentBit!9027 (_2!8685 lt!287594)) (currentByte!9032 (_2!8685 lt!287594)) (size!4328 (buf!4788 (_2!8685 lt!287594)))))))

(assert (=> d!64241 (= lt!287594 e!128836)))

(declare-fun c!9506 () Bool)

(assert (=> d!64241 (= c!9506 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64241 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64241 (= (appendBitsLSBFirstLoopTR!0 (_2!8685 lt!286452) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!287594)))

(declare-fun bm!2993 () Bool)

(assert (=> bm!2993 (= call!2996 (isPrefixOf!0 (_2!8685 lt!286452) (ite c!9506 (_2!8685 lt!286452) (_2!8685 lt!287598))))))

(declare-fun b!186183 () Bool)

(assert (=> b!186183 (= e!128832 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!186184 () Bool)

(declare-fun lt!287585 () tuple2!16080)

(assert (=> b!186184 (= e!128836 (tuple2!16081 (_1!8685 lt!287585) (_2!8685 lt!287585)))))

(assert (=> b!186184 (= lt!287600 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186184 (= lt!287598 (appendBit!0 (_2!8685 lt!286452) lt!287600))))

(declare-fun res!154987 () Bool)

(assert (=> b!186184 (= res!154987 (= (size!4328 (buf!4788 (_2!8685 lt!286452))) (size!4328 (buf!4788 (_2!8685 lt!287598)))))))

(assert (=> b!186184 (=> (not res!154987) (not e!128835))))

(assert (=> b!186184 e!128835))

(declare-fun lt!287577 () tuple2!16080)

(assert (=> b!186184 (= lt!287577 lt!287598)))

(assert (=> b!186184 (= lt!287585 (appendBitsLSBFirstLoopTR!0 (_2!8685 lt!287577) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!287589 () Unit!13286)

(assert (=> b!186184 (= lt!287589 (lemmaIsPrefixTransitive!0 (_2!8685 lt!286452) (_2!8685 lt!287577) (_2!8685 lt!287585)))))

(assert (=> b!186184 (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!287585))))

(declare-fun lt!287602 () Unit!13286)

(assert (=> b!186184 (= lt!287602 lt!287589)))

(assert (=> b!186184 (invariant!0 (currentBit!9027 (_2!8685 lt!286452)) (currentByte!9032 (_2!8685 lt!286452)) (size!4328 (buf!4788 (_2!8685 lt!287577))))))

(declare-fun lt!287603 () BitStream!7764)

(assert (=> b!186184 (= lt!287603 (BitStream!7765 (buf!4788 (_2!8685 lt!287577)) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))))))

(assert (=> b!186184 (invariant!0 (currentBit!9027 lt!287603) (currentByte!9032 lt!287603) (size!4328 (buf!4788 (_2!8685 lt!287585))))))

(declare-fun lt!287582 () BitStream!7764)

(assert (=> b!186184 (= lt!287582 (BitStream!7765 (buf!4788 (_2!8685 lt!287585)) (currentByte!9032 lt!287603) (currentBit!9027 lt!287603)))))

(declare-fun lt!287583 () tuple2!16082)

(assert (=> b!186184 (= lt!287583 (readBitPure!0 lt!287603))))

(declare-fun lt!287573 () tuple2!16082)

(assert (=> b!186184 (= lt!287573 (readBitPure!0 lt!287582))))

(declare-fun lt!287584 () Unit!13286)

(assert (=> b!186184 (= lt!287584 (readBitPrefixLemma!0 lt!287603 (_2!8685 lt!287585)))))

(declare-fun res!154981 () Bool)

(assert (=> b!186184 (= res!154981 (= (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287583))) (currentByte!9032 (_1!8686 lt!287583)) (currentBit!9027 (_1!8686 lt!287583))) (bitIndex!0 (size!4328 (buf!4788 (_1!8686 lt!287573))) (currentByte!9032 (_1!8686 lt!287573)) (currentBit!9027 (_1!8686 lt!287573)))))))

(declare-fun e!128837 () Bool)

(assert (=> b!186184 (=> (not res!154981) (not e!128837))))

(assert (=> b!186184 e!128837))

(declare-fun lt!287601 () Unit!13286)

(assert (=> b!186184 (= lt!287601 lt!287584)))

(declare-fun lt!287597 () tuple2!16084)

(assert (=> b!186184 (= lt!287597 (reader!0 (_2!8685 lt!286452) (_2!8685 lt!287585)))))

(declare-fun lt!287574 () tuple2!16084)

(assert (=> b!186184 (= lt!287574 (reader!0 (_2!8685 lt!287577) (_2!8685 lt!287585)))))

(declare-fun lt!287568 () tuple2!16082)

(assert (=> b!186184 (= lt!287568 (readBitPure!0 (_1!8687 lt!287597)))))

(assert (=> b!186184 (= (_2!8686 lt!287568) lt!287600)))

(declare-fun lt!287565 () Unit!13286)

(declare-fun Unit!13319 () Unit!13286)

(assert (=> b!186184 (= lt!287565 Unit!13319)))

(declare-fun lt!287567 () (_ BitVec 64))

(assert (=> b!186184 (= lt!287567 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287572 () (_ BitVec 64))

(assert (=> b!186184 (= lt!287572 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287616 () Unit!13286)

(assert (=> b!186184 (= lt!287616 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!287585)) lt!287572))))

(assert (=> b!186184 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!287585)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!287572)))

(declare-fun lt!287611 () Unit!13286)

(assert (=> b!186184 (= lt!287611 lt!287616)))

(declare-fun lt!287569 () tuple2!16086)

(assert (=> b!186184 (= lt!287569 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!287597) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287567))))

(declare-fun lt!287580 () (_ BitVec 64))

(assert (=> b!186184 (= lt!287580 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!287618 () Unit!13286)

(assert (=> b!186184 (= lt!287618 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!287577) (buf!4788 (_2!8685 lt!287585)) lt!287580))))

(assert (=> b!186184 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!287585)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!287577))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!287577))) lt!287580)))

(declare-fun lt!287579 () Unit!13286)

(assert (=> b!186184 (= lt!287579 lt!287618)))

(declare-fun lt!287571 () tuple2!16086)

(assert (=> b!186184 (= lt!287571 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!287574) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!287567 (ite (_2!8686 lt!287568) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!287613 () tuple2!16086)

(assert (=> b!186184 (= lt!287613 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!287597) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287567))))

(declare-fun c!9505 () Bool)

(assert (=> b!186184 (= c!9505 (_2!8686 (readBitPure!0 (_1!8687 lt!287597))))))

(declare-fun lt!287575 () tuple2!16086)

(assert (=> b!186184 (= lt!287575 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8687 lt!287597) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!287567 e!128832)))))

(declare-fun lt!287619 () Unit!13286)

(assert (=> b!186184 (= lt!287619 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8687 lt!287597) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287567))))

(assert (=> b!186184 (and (= (_2!8688 lt!287613) (_2!8688 lt!287575)) (= (_1!8688 lt!287613) (_1!8688 lt!287575)))))

(declare-fun lt!287614 () Unit!13286)

(assert (=> b!186184 (= lt!287614 lt!287619)))

(assert (=> b!186184 (= (_1!8687 lt!287597) (withMovedBitIndex!0 (_2!8687 lt!287597) (bvsub (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287585))) (currentByte!9032 (_2!8685 lt!287585)) (currentBit!9027 (_2!8685 lt!287585))))))))

(declare-fun lt!287581 () Unit!13286)

(declare-fun Unit!13320 () Unit!13286)

(assert (=> b!186184 (= lt!287581 Unit!13320)))

(assert (=> b!186184 (= (_1!8687 lt!287574) (withMovedBitIndex!0 (_2!8687 lt!287574) (bvsub (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287577))) (currentByte!9032 (_2!8685 lt!287577)) (currentBit!9027 (_2!8685 lt!287577))) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287585))) (currentByte!9032 (_2!8685 lt!287585)) (currentBit!9027 (_2!8685 lt!287585))))))))

(declare-fun lt!287604 () Unit!13286)

(declare-fun Unit!13321 () Unit!13286)

(assert (=> b!186184 (= lt!287604 Unit!13321)))

(assert (=> b!186184 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) (bvsub (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287577))) (currentByte!9032 (_2!8685 lt!287577)) (currentBit!9027 (_2!8685 lt!287577))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!287615 () Unit!13286)

(declare-fun Unit!13322 () Unit!13286)

(assert (=> b!186184 (= lt!287615 Unit!13322)))

(assert (=> b!186184 (= (_2!8688 lt!287569) (_2!8688 lt!287571))))

(declare-fun lt!287591 () Unit!13286)

(declare-fun Unit!13323 () Unit!13286)

(assert (=> b!186184 (= lt!287591 Unit!13323)))

(assert (=> b!186184 (invariant!0 (currentBit!9027 (_2!8685 lt!287585)) (currentByte!9032 (_2!8685 lt!287585)) (size!4328 (buf!4788 (_2!8685 lt!287585))))))

(declare-fun lt!287590 () Unit!13286)

(declare-fun Unit!13324 () Unit!13286)

(assert (=> b!186184 (= lt!287590 Unit!13324)))

(assert (=> b!186184 (= (size!4328 (buf!4788 (_2!8685 lt!286452))) (size!4328 (buf!4788 (_2!8685 lt!287585))))))

(declare-fun lt!287607 () Unit!13286)

(declare-fun Unit!13325 () Unit!13286)

(assert (=> b!186184 (= lt!287607 Unit!13325)))

(assert (=> b!186184 (= (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!287585))) (currentByte!9032 (_2!8685 lt!287585)) (currentBit!9027 (_2!8685 lt!287585))) (bvsub (bvadd (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287570 () Unit!13286)

(declare-fun Unit!13326 () Unit!13286)

(assert (=> b!186184 (= lt!287570 Unit!13326)))

(declare-fun lt!287588 () Unit!13286)

(declare-fun Unit!13327 () Unit!13286)

(assert (=> b!186184 (= lt!287588 Unit!13327)))

(assert (=> b!186184 (= lt!287586 (reader!0 (_2!8685 lt!286452) (_2!8685 lt!287585)))))

(declare-fun lt!287608 () (_ BitVec 64))

(assert (=> b!186184 (= lt!287608 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287609 () Unit!13286)

(assert (=> b!186184 (= lt!287609 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8685 lt!286452) (buf!4788 (_2!8685 lt!287585)) lt!287608))))

(assert (=> b!186184 (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8685 lt!287585)))) ((_ sign_extend 32) (currentByte!9032 (_2!8685 lt!286452))) ((_ sign_extend 32) (currentBit!9027 (_2!8685 lt!286452))) lt!287608)))

(declare-fun lt!287610 () Unit!13286)

(assert (=> b!186184 (= lt!287610 lt!287609)))

(assert (=> b!186184 (= lt!287595 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!287586) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!154978 () Bool)

(assert (=> b!186184 (= res!154978 (= (_2!8688 lt!287595) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!186184 (=> (not res!154978) (not e!128833))))

(assert (=> b!186184 e!128833))

(declare-fun lt!287593 () Unit!13286)

(declare-fun Unit!13328 () Unit!13286)

(assert (=> b!186184 (= lt!287593 Unit!13328)))

(declare-fun b!186185 () Bool)

(assert (=> b!186185 (= e!128837 (= (_2!8686 lt!287583) (_2!8686 lt!287573)))))

(assert (= (and d!64241 c!9506) b!186171))

(assert (= (and d!64241 (not c!9506)) b!186184))

(assert (= (and b!186184 res!154987) b!186181))

(assert (= (and b!186181 res!154988) b!186173))

(assert (= (and b!186173 res!154984) b!186177))

(assert (= (and b!186177 res!154982) b!186178))

(assert (= (and b!186184 res!154981) b!186185))

(assert (= (and b!186184 c!9505) b!186183))

(assert (= (and b!186184 (not c!9505)) b!186174))

(assert (= (and b!186184 res!154978) b!186176))

(assert (= (or b!186171 b!186173) bm!2993))

(assert (= (and d!64241 res!154979) b!186170))

(assert (= (and b!186170 res!154986) b!186180))

(assert (= (and b!186180 res!154985) b!186172))

(assert (= (and b!186172 res!154983) b!186175))

(assert (= (and b!186175 res!154980) b!186179))

(assert (= (and b!186175 res!154977) b!186182))

(declare-fun m!289455 () Bool)

(assert (=> b!186184 m!289455))

(declare-fun m!289457 () Bool)

(assert (=> b!186184 m!289457))

(declare-fun m!289459 () Bool)

(assert (=> b!186184 m!289459))

(declare-fun m!289461 () Bool)

(assert (=> b!186184 m!289461))

(declare-fun m!289463 () Bool)

(assert (=> b!186184 m!289463))

(declare-fun m!289465 () Bool)

(assert (=> b!186184 m!289465))

(declare-fun m!289467 () Bool)

(assert (=> b!186184 m!289467))

(declare-fun m!289469 () Bool)

(assert (=> b!186184 m!289469))

(declare-fun m!289471 () Bool)

(assert (=> b!186184 m!289471))

(declare-fun m!289473 () Bool)

(assert (=> b!186184 m!289473))

(declare-fun m!289475 () Bool)

(assert (=> b!186184 m!289475))

(declare-fun m!289477 () Bool)

(assert (=> b!186184 m!289477))

(declare-fun m!289479 () Bool)

(assert (=> b!186184 m!289479))

(declare-fun m!289481 () Bool)

(assert (=> b!186184 m!289481))

(declare-fun m!289483 () Bool)

(assert (=> b!186184 m!289483))

(declare-fun m!289485 () Bool)

(assert (=> b!186184 m!289485))

(declare-fun m!289487 () Bool)

(assert (=> b!186184 m!289487))

(assert (=> b!186184 m!288687))

(declare-fun m!289489 () Bool)

(assert (=> b!186184 m!289489))

(declare-fun m!289491 () Bool)

(assert (=> b!186184 m!289491))

(declare-fun m!289493 () Bool)

(assert (=> b!186184 m!289493))

(declare-fun m!289495 () Bool)

(assert (=> b!186184 m!289495))

(declare-fun m!289497 () Bool)

(assert (=> b!186184 m!289497))

(declare-fun m!289499 () Bool)

(assert (=> b!186184 m!289499))

(declare-fun m!289501 () Bool)

(assert (=> b!186184 m!289501))

(declare-fun m!289503 () Bool)

(assert (=> b!186184 m!289503))

(declare-fun m!289505 () Bool)

(assert (=> b!186184 m!289505))

(declare-fun m!289507 () Bool)

(assert (=> b!186184 m!289507))

(assert (=> b!186184 m!289493))

(declare-fun m!289509 () Bool)

(assert (=> b!186184 m!289509))

(declare-fun m!289511 () Bool)

(assert (=> b!186184 m!289511))

(declare-fun m!289513 () Bool)

(assert (=> b!186184 m!289513))

(declare-fun m!289515 () Bool)

(assert (=> b!186184 m!289515))

(declare-fun m!289517 () Bool)

(assert (=> b!186184 m!289517))

(declare-fun m!289519 () Bool)

(assert (=> b!186184 m!289519))

(declare-fun m!289521 () Bool)

(assert (=> b!186175 m!289521))

(assert (=> b!186175 m!289507))

(assert (=> b!186175 m!289515))

(declare-fun m!289523 () Bool)

(assert (=> b!186175 m!289523))

(declare-fun m!289525 () Bool)

(assert (=> b!186175 m!289525))

(declare-fun m!289527 () Bool)

(assert (=> b!186175 m!289527))

(declare-fun m!289529 () Bool)

(assert (=> bm!2993 m!289529))

(declare-fun m!289531 () Bool)

(assert (=> b!186172 m!289531))

(declare-fun m!289533 () Bool)

(assert (=> d!64241 m!289533))

(assert (=> b!186171 m!289379))

(declare-fun m!289535 () Bool)

(assert (=> b!186178 m!289535))

(declare-fun m!289537 () Bool)

(assert (=> b!186178 m!289537))

(declare-fun m!289539 () Bool)

(assert (=> b!186180 m!289539))

(assert (=> b!186180 m!288687))

(assert (=> b!186181 m!289537))

(assert (=> b!186181 m!288687))

(declare-fun m!289541 () Bool)

(assert (=> b!186179 m!289541))

(declare-fun m!289543 () Bool)

(assert (=> b!186177 m!289543))

(assert (=> b!186177 m!289543))

(declare-fun m!289545 () Bool)

(assert (=> b!186177 m!289545))

(assert (=> b!185760 d!64241))

(declare-fun d!64243 () Bool)

(declare-fun e!128842 () Bool)

(assert (=> d!64243 e!128842))

(declare-fun res!154991 () Bool)

(assert (=> d!64243 (=> (not res!154991) (not e!128842))))

(declare-fun lt!287626 () (_ BitVec 64))

(declare-fun lt!287625 () BitStream!7764)

(assert (=> d!64243 (= res!154991 (= (bvadd lt!287626 (bvsub lt!286444 lt!286445)) (bitIndex!0 (size!4328 (buf!4788 lt!287625)) (currentByte!9032 lt!287625) (currentBit!9027 lt!287625))))))

(assert (=> d!64243 (or (not (= (bvand lt!287626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286444 lt!286445) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287626 (bvsub lt!286444 lt!286445)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64243 (= lt!287626 (bitIndex!0 (size!4328 (buf!4788 (_2!8687 lt!286467))) (currentByte!9032 (_2!8687 lt!286467)) (currentBit!9027 (_2!8687 lt!286467))))))

(declare-fun moveBitIndex!0 (BitStream!7764 (_ BitVec 64)) tuple2!16080)

(assert (=> d!64243 (= lt!287625 (_2!8685 (moveBitIndex!0 (_2!8687 lt!286467) (bvsub lt!286444 lt!286445))))))

(assert (=> d!64243 (moveBitIndexPrecond!0 (_2!8687 lt!286467) (bvsub lt!286444 lt!286445))))

(assert (=> d!64243 (= (withMovedBitIndex!0 (_2!8687 lt!286467) (bvsub lt!286444 lt!286445)) lt!287625)))

(declare-fun b!186188 () Bool)

(assert (=> b!186188 (= e!128842 (= (size!4328 (buf!4788 (_2!8687 lt!286467))) (size!4328 (buf!4788 lt!287625))))))

(assert (= (and d!64243 res!154991) b!186188))

(declare-fun m!289547 () Bool)

(assert (=> d!64243 m!289547))

(declare-fun m!289549 () Bool)

(assert (=> d!64243 m!289549))

(declare-fun m!289551 () Bool)

(assert (=> d!64243 m!289551))

(declare-fun m!289553 () Bool)

(assert (=> d!64243 m!289553))

(assert (=> b!185758 d!64243))

(declare-fun d!64245 () Bool)

(declare-fun res!154994 () Bool)

(declare-fun e!128845 () Bool)

(assert (=> d!64245 (=> (not res!154994) (not e!128845))))

(assert (=> d!64245 (= res!154994 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8687 lt!286460))))) (bvsub lt!286462 lt!286445)) (bvsle (bvsub lt!286462 lt!286445) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8687 lt!286460))))))))))

(assert (=> d!64245 (= (moveBitIndexPrecond!0 (_2!8687 lt!286460) (bvsub lt!286462 lt!286445)) e!128845)))

(declare-fun b!186192 () Bool)

(declare-fun lt!287629 () (_ BitVec 64))

(assert (=> b!186192 (= e!128845 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287629) (bvsle lt!287629 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4328 (buf!4788 (_2!8687 lt!286460))))))))))

(assert (=> b!186192 (= lt!287629 (bvadd (bitIndex!0 (size!4328 (buf!4788 (_2!8687 lt!286460))) (currentByte!9032 (_2!8687 lt!286460)) (currentBit!9027 (_2!8687 lt!286460))) (bvsub lt!286462 lt!286445)))))

(assert (= (and d!64245 res!154994) b!186192))

(declare-fun m!289555 () Bool)

(assert (=> b!186192 m!289555))

(assert (=> b!185748 d!64245))

(declare-fun d!64247 () Bool)

(declare-fun lt!287643 () tuple2!16086)

(declare-fun lt!287646 () tuple2!16086)

(assert (=> d!64247 (and (= (_2!8688 lt!287643) (_2!8688 lt!287646)) (= (_1!8688 lt!287643) (_1!8688 lt!287646)))))

(declare-fun lt!287645 () (_ BitVec 64))

(declare-fun lt!287642 () BitStream!7764)

(declare-fun lt!287644 () Bool)

(declare-fun lt!287647 () Unit!13286)

(declare-fun choose!56 (BitStream!7764 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16086 tuple2!16086 BitStream!7764 (_ BitVec 64) Bool BitStream!7764 (_ BitVec 64) tuple2!16086 tuple2!16086 BitStream!7764 (_ BitVec 64)) Unit!13286)

(assert (=> d!64247 (= lt!287647 (choose!56 (_1!8687 lt!286467) nBits!348 i!590 lt!286443 lt!287643 (tuple2!16087 (_1!8688 lt!287643) (_2!8688 lt!287643)) (_1!8688 lt!287643) (_2!8688 lt!287643) lt!287644 lt!287642 lt!287645 lt!287646 (tuple2!16087 (_1!8688 lt!287646) (_2!8688 lt!287646)) (_1!8688 lt!287646) (_2!8688 lt!287646)))))

(assert (=> d!64247 (= lt!287646 (readNBitsLSBFirstsLoopPure!0 lt!287642 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!287645))))

(assert (=> d!64247 (= lt!287645 (bvor lt!286443 (ite lt!287644 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64247 (= lt!287642 (withMovedBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64247 (= lt!287644 (_2!8686 (readBitPure!0 (_1!8687 lt!286467))))))

(assert (=> d!64247 (= lt!287643 (readNBitsLSBFirstsLoopPure!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443))))

(assert (=> d!64247 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8687 lt!286467) nBits!348 i!590 lt!286443) lt!287647)))

(declare-fun bs!15987 () Bool)

(assert (= bs!15987 d!64247))

(assert (=> bs!15987 m!288741))

(assert (=> bs!15987 m!288755))

(declare-fun m!289557 () Bool)

(assert (=> bs!15987 m!289557))

(assert (=> bs!15987 m!288727))

(declare-fun m!289559 () Bool)

(assert (=> bs!15987 m!289559))

(assert (=> b!185748 d!64247))

(declare-fun d!64249 () Bool)

(declare-fun lt!287648 () tuple2!16106)

(assert (=> d!64249 (= lt!287648 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458))))

(assert (=> d!64249 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286458) (tuple2!16087 (_2!8698 lt!287648) (_1!8698 lt!287648)))))

(declare-fun bs!15988 () Bool)

(assert (= bs!15988 d!64249))

(assert (=> bs!15988 m!288755))

(declare-fun m!289561 () Bool)

(assert (=> bs!15988 m!289561))

(assert (=> b!185748 d!64249))

(declare-fun d!64251 () Bool)

(declare-fun e!128846 () Bool)

(assert (=> d!64251 e!128846))

(declare-fun res!154995 () Bool)

(assert (=> d!64251 (=> (not res!154995) (not e!128846))))

(declare-fun lt!287650 () (_ BitVec 64))

(declare-fun lt!287649 () BitStream!7764)

(assert (=> d!64251 (= res!154995 (= (bvadd lt!287650 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4328 (buf!4788 lt!287649)) (currentByte!9032 lt!287649) (currentBit!9027 lt!287649))))))

(assert (=> d!64251 (or (not (= (bvand lt!287650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287650 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287650 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64251 (= lt!287650 (bitIndex!0 (size!4328 (buf!4788 (_1!8687 lt!286467))) (currentByte!9032 (_1!8687 lt!286467)) (currentBit!9027 (_1!8687 lt!286467))))))

(assert (=> d!64251 (= lt!287649 (_2!8685 (moveBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64251 (moveBitIndexPrecond!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64251 (= (withMovedBitIndex!0 (_1!8687 lt!286467) #b0000000000000000000000000000000000000000000000000000000000000001) lt!287649)))

(declare-fun b!186193 () Bool)

(assert (=> b!186193 (= e!128846 (= (size!4328 (buf!4788 (_1!8687 lt!286467))) (size!4328 (buf!4788 lt!287649))))))

(assert (= (and d!64251 res!154995) b!186193))

(declare-fun m!289563 () Bool)

(assert (=> d!64251 m!289563))

(declare-fun m!289565 () Bool)

(assert (=> d!64251 m!289565))

(declare-fun m!289567 () Bool)

(assert (=> d!64251 m!289567))

(declare-fun m!289569 () Bool)

(assert (=> d!64251 m!289569))

(assert (=> b!185748 d!64251))

(declare-fun d!64253 () Bool)

(assert (=> d!64253 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204)) lt!286465) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4328 (buf!4788 thiss!1204))) ((_ sign_extend 32) (currentByte!9032 thiss!1204)) ((_ sign_extend 32) (currentBit!9027 thiss!1204))) lt!286465))))

(declare-fun bs!15989 () Bool)

(assert (= bs!15989 d!64253))

(assert (=> bs!15989 m!289293))

(assert (=> b!185746 d!64253))

(declare-fun d!64255 () Bool)

(assert (=> d!64255 (= (invariant!0 (currentBit!9027 (_2!8685 lt!286454)) (currentByte!9032 (_2!8685 lt!286454)) (size!4328 (buf!4788 (_2!8685 lt!286454)))) (and (bvsge (currentBit!9027 (_2!8685 lt!286454)) #b00000000000000000000000000000000) (bvslt (currentBit!9027 (_2!8685 lt!286454)) #b00000000000000000000000000001000) (bvsge (currentByte!9032 (_2!8685 lt!286454)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9032 (_2!8685 lt!286454)) (size!4328 (buf!4788 (_2!8685 lt!286454)))) (and (= (currentBit!9027 (_2!8685 lt!286454)) #b00000000000000000000000000000000) (= (currentByte!9032 (_2!8685 lt!286454)) (size!4328 (buf!4788 (_2!8685 lt!286454))))))))))

(assert (=> b!185757 d!64255))

(assert (=> b!185755 d!64143))

(assert (=> b!185755 d!64155))

(declare-fun d!64257 () Bool)

(declare-fun res!154996 () Bool)

(declare-fun e!128847 () Bool)

(assert (=> d!64257 (=> (not res!154996) (not e!128847))))

(assert (=> d!64257 (= res!154996 (= (size!4328 (buf!4788 (_2!8685 lt!286452))) (size!4328 (buf!4788 (_2!8685 lt!286454)))))))

(assert (=> d!64257 (= (isPrefixOf!0 (_2!8685 lt!286452) (_2!8685 lt!286454)) e!128847)))

(declare-fun b!186194 () Bool)

(declare-fun res!154998 () Bool)

(assert (=> b!186194 (=> (not res!154998) (not e!128847))))

(assert (=> b!186194 (= res!154998 (bvsle (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452))) (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286454))) (currentByte!9032 (_2!8685 lt!286454)) (currentBit!9027 (_2!8685 lt!286454)))))))

(declare-fun b!186195 () Bool)

(declare-fun e!128848 () Bool)

(assert (=> b!186195 (= e!128847 e!128848)))

(declare-fun res!154997 () Bool)

(assert (=> b!186195 (=> res!154997 e!128848)))

(assert (=> b!186195 (= res!154997 (= (size!4328 (buf!4788 (_2!8685 lt!286452))) #b00000000000000000000000000000000))))

(declare-fun b!186196 () Bool)

(assert (=> b!186196 (= e!128848 (arrayBitRangesEq!0 (buf!4788 (_2!8685 lt!286452)) (buf!4788 (_2!8685 lt!286454)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4328 (buf!4788 (_2!8685 lt!286452))) (currentByte!9032 (_2!8685 lt!286452)) (currentBit!9027 (_2!8685 lt!286452)))))))

(assert (= (and d!64257 res!154996) b!186194))

(assert (= (and b!186194 res!154998) b!186195))

(assert (= (and b!186195 (not res!154997)) b!186196))

(assert (=> b!186194 m!288687))

(assert (=> b!186194 m!288703))

(assert (=> b!186196 m!288687))

(assert (=> b!186196 m!288687))

(declare-fun m!289571 () Bool)

(assert (=> b!186196 m!289571))

(assert (=> b!185745 d!64257))

(check-sat (not b!186184) (not d!64179) (not d!64241) (not b!186119) (not d!64239) (not d!64211) (not d!64229) (not b!186137) (not b!186135) (not d!64155) (not d!64193) (not d!64233) (not b!186072) (not b!186120) (not d!64221) (not bm!2993) (not d!64247) (not d!64231) (not b!186078) (not b!186085) (not d!64235) (not b!186073) (not d!64175) (not b!186171) (not d!64217) (not d!64177) (not b!186178) (not d!64209) (not b!186194) (not b!186075) (not b!186074) (not b!186172) (not b!186122) (not d!64227) (not b!186180) (not d!64195) (not b!186125) (not d!64249) (not b!186117) (not b!186192) (not b!186116) (not d!64225) (not b!186181) (not d!64213) (not d!64243) (not d!64157) (not b!186121) (not d!64143) (not d!64251) (not d!64253) (not d!64223) (not b!186177) (not b!186087) (not b!186175) (not d!64215) (not b!186179) (not b!186196) (not b!186124) (not d!64189))
(check-sat)
