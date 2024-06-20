; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40428 () Bool)

(assert start!40428)

(declare-fun lt!286538 () (_ BitVec 64))

(declare-fun lt!286525 () (_ BitVec 64))

(declare-fun e!128631 () Bool)

(declare-fun b!185800 () Bool)

(declare-datatypes ((array!9815 0))(
  ( (array!9816 (arr!5259 (Array (_ BitVec 32) (_ BitVec 8))) (size!4329 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7766 0))(
  ( (BitStream!7767 (buf!4789 array!9815) (currentByte!9033 (_ BitVec 32)) (currentBit!9028 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16088 0))(
  ( (tuple2!16089 (_1!8689 BitStream!7766) (_2!8689 BitStream!7766)) )
))
(declare-fun lt!286531 () tuple2!16088)

(declare-fun withMovedBitIndex!0 (BitStream!7766 (_ BitVec 64)) BitStream!7766)

(assert (=> b!185800 (= e!128631 (= (_1!8689 lt!286531) (withMovedBitIndex!0 (_2!8689 lt!286531) (bvsub lt!286525 lt!286538))))))

(declare-fun b!185801 () Bool)

(declare-fun e!128625 () Bool)

(declare-datatypes ((tuple2!16090 0))(
  ( (tuple2!16091 (_1!8690 BitStream!7766) (_2!8690 Bool)) )
))
(declare-fun lt!286537 () tuple2!16090)

(declare-fun lt!286529 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185801 (= e!128625 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286537))) (currentByte!9033 (_1!8690 lt!286537)) (currentBit!9028 (_1!8690 lt!286537))) lt!286529))))

(declare-fun b!185802 () Bool)

(declare-fun e!128621 () Bool)

(declare-fun e!128629 () Bool)

(assert (=> b!185802 (= e!128621 e!128629)))

(declare-fun res!154670 () Bool)

(assert (=> b!185802 (=> res!154670 e!128629)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!286543 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!185802 (= res!154670 (not (= lt!286538 (bvsub (bvsub (bvadd lt!286543 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((Unit!13288 0))(
  ( (Unit!13289) )
))
(declare-datatypes ((tuple2!16092 0))(
  ( (tuple2!16093 (_1!8691 Unit!13288) (_2!8691 BitStream!7766)) )
))
(declare-fun lt!286549 () tuple2!16092)

(assert (=> b!185802 (= lt!286538 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549))))))

(declare-fun thiss!1204 () BitStream!7766)

(declare-fun isPrefixOf!0 (BitStream!7766 BitStream!7766) Bool)

(assert (=> b!185802 (isPrefixOf!0 thiss!1204 (_2!8691 lt!286549))))

(declare-fun lt!286535 () tuple2!16092)

(declare-fun lt!286541 () Unit!13288)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7766 BitStream!7766 BitStream!7766) Unit!13288)

(assert (=> b!185802 (= lt!286541 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8691 lt!286535) (_2!8691 lt!286549)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7766 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16092)

(assert (=> b!185802 (= lt!286549 (appendBitsLSBFirstLoopTR!0 (_2!8691 lt!286535) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185803 () Bool)

(declare-fun e!128628 () Bool)

(declare-fun array_inv!4070 (array!9815) Bool)

(assert (=> b!185803 (= e!128628 (array_inv!4070 (buf!4789 thiss!1204)))))

(declare-fun b!185804 () Bool)

(declare-fun res!154673 () Bool)

(declare-fun e!128626 () Bool)

(assert (=> b!185804 (=> (not res!154673) (not e!128626))))

(assert (=> b!185804 (= res!154673 (isPrefixOf!0 thiss!1204 (_2!8691 lt!286535)))))

(declare-fun b!185805 () Bool)

(declare-fun e!128630 () Bool)

(assert (=> b!185805 (= e!128630 e!128626)))

(declare-fun res!154682 () Bool)

(assert (=> b!185805 (=> (not res!154682) (not e!128626))))

(declare-fun lt!286532 () (_ BitVec 64))

(assert (=> b!185805 (= res!154682 (= lt!286529 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286532)))))

(assert (=> b!185805 (= lt!286529 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(assert (=> b!185805 (= lt!286532 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(declare-fun b!185806 () Bool)

(assert (=> b!185806 (= e!128626 e!128625)))

(declare-fun res!154680 () Bool)

(assert (=> b!185806 (=> (not res!154680) (not e!128625))))

(declare-fun lt!286540 () Bool)

(assert (=> b!185806 (= res!154680 (and (= (_2!8690 lt!286537) lt!286540) (= (_1!8690 lt!286537) (_2!8691 lt!286535))))))

(declare-fun readBitPure!0 (BitStream!7766) tuple2!16090)

(declare-fun readerFrom!0 (BitStream!7766 (_ BitVec 32) (_ BitVec 32)) BitStream!7766)

(assert (=> b!185806 (= lt!286537 (readBitPure!0 (readerFrom!0 (_2!8691 lt!286535) (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204))))))

(declare-fun b!185807 () Bool)

(declare-fun e!128632 () Bool)

(declare-fun lt!286523 () tuple2!16090)

(declare-fun lt!286530 () tuple2!16090)

(assert (=> b!185807 (= e!128632 (= (_2!8690 lt!286523) (_2!8690 lt!286530)))))

(declare-fun b!185808 () Bool)

(declare-fun res!154675 () Bool)

(assert (=> b!185808 (=> res!154675 e!128629)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185808 (= res!154675 (not (invariant!0 (currentBit!9028 (_2!8691 lt!286549)) (currentByte!9033 (_2!8691 lt!286549)) (size!4329 (buf!4789 (_2!8691 lt!286549))))))))

(declare-fun b!185809 () Bool)

(declare-fun res!154672 () Bool)

(assert (=> b!185809 (=> res!154672 e!128629)))

(assert (=> b!185809 (= res!154672 (not (isPrefixOf!0 thiss!1204 (_2!8691 lt!286535))))))

(declare-fun b!185810 () Bool)

(declare-fun e!128624 () Bool)

(assert (=> b!185810 (= e!128624 (not e!128621))))

(declare-fun res!154677 () Bool)

(assert (=> b!185810 (=> res!154677 e!128621)))

(assert (=> b!185810 (= res!154677 (not (= lt!286543 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286525))))))

(assert (=> b!185810 (= lt!286543 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(assert (=> b!185810 (= lt!286525 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(assert (=> b!185810 e!128630))

(declare-fun res!154667 () Bool)

(assert (=> b!185810 (=> (not res!154667) (not e!128630))))

(assert (=> b!185810 (= res!154667 (= (size!4329 (buf!4789 thiss!1204)) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(declare-fun appendBit!0 (BitStream!7766 Bool) tuple2!16092)

(assert (=> b!185810 (= lt!286535 (appendBit!0 thiss!1204 lt!286540))))

(declare-fun lt!286527 () (_ BitVec 64))

(assert (=> b!185810 (= lt!286540 (not (= (bvand v!189 lt!286527) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185810 (= lt!286527 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185811 () Bool)

(declare-fun lt!286544 () tuple2!16088)

(declare-fun e!128620 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!7766 (_ BitVec 64)) Bool)

(assert (=> b!185811 (= e!128620 (moveBitIndexPrecond!0 (_2!8689 lt!286544) (bvsub lt!286543 lt!286538)))))

(assert (=> b!185811 e!128631))

(declare-fun res!154678 () Bool)

(assert (=> b!185811 (=> (not res!154678) (not e!128631))))

(declare-datatypes ((tuple2!16094 0))(
  ( (tuple2!16095 (_1!8692 BitStream!7766) (_2!8692 (_ BitVec 64))) )
))
(declare-fun lt!286526 () tuple2!16094)

(declare-fun lt!286524 () tuple2!16094)

(assert (=> b!185811 (= res!154678 (and (= (_2!8692 lt!286526) (_2!8692 lt!286524)) (= (_1!8692 lt!286526) (_1!8692 lt!286524))))))

(declare-fun lt!286545 () Unit!13288)

(declare-fun lt!286539 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13288)

(assert (=> b!185811 (= lt!286545 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539))))

(declare-fun lt!286548 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16094)

(assert (=> b!185811 (= lt!286524 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548))))

(declare-fun b!185812 () Bool)

(declare-fun res!154676 () Bool)

(assert (=> b!185812 (=> res!154676 e!128629)))

(assert (=> b!185812 (= res!154676 (or (not (= (size!4329 (buf!4789 (_2!8691 lt!286549))) (size!4329 (buf!4789 thiss!1204)))) (not (= lt!286538 (bvsub (bvadd lt!286525 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185813 () Bool)

(declare-fun res!154679 () Bool)

(assert (=> b!185813 (=> res!154679 e!128629)))

(assert (=> b!185813 (= res!154679 (not (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!286549))))))

(declare-fun b!185814 () Bool)

(assert (=> b!185814 (= e!128629 e!128620)))

(declare-fun res!154668 () Bool)

(assert (=> b!185814 (=> res!154668 e!128620)))

(assert (=> b!185814 (= res!154668 (not (= (_1!8692 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!286544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548)) (_2!8689 lt!286544))))))

(declare-fun lt!286528 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!286528)))

(declare-fun lt!286536 () Unit!13288)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7766 array!9815 (_ BitVec 64)) Unit!13288)

(assert (=> b!185814 (= lt!286536 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!286549)) lt!286528))))

(assert (=> b!185814 (= lt!286528 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286542 () tuple2!16090)

(assert (=> b!185814 (= lt!286548 (bvor lt!286539 (ite (_2!8690 lt!286542) lt!286527 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185814 (= lt!286526 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539))))

(declare-fun lt!286546 () (_ BitVec 64))

(assert (=> b!185814 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)) lt!286546)))

(declare-fun lt!286534 () Unit!13288)

(assert (=> b!185814 (= lt!286534 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4789 (_2!8691 lt!286549)) lt!286546))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185814 (= lt!286539 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!185814 (= (_2!8690 lt!286542) lt!286540)))

(assert (=> b!185814 (= lt!286542 (readBitPure!0 (_1!8689 lt!286531)))))

(declare-fun reader!0 (BitStream!7766 BitStream!7766) tuple2!16088)

(assert (=> b!185814 (= lt!286544 (reader!0 (_2!8691 lt!286535) (_2!8691 lt!286549)))))

(assert (=> b!185814 (= lt!286531 (reader!0 thiss!1204 (_2!8691 lt!286549)))))

(assert (=> b!185814 e!128632))

(declare-fun res!154671 () Bool)

(assert (=> b!185814 (=> (not res!154671) (not e!128632))))

(assert (=> b!185814 (= res!154671 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286523))) (currentByte!9033 (_1!8690 lt!286523)) (currentBit!9028 (_1!8690 lt!286523))) (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286530))) (currentByte!9033 (_1!8690 lt!286530)) (currentBit!9028 (_1!8690 lt!286530)))))))

(declare-fun lt!286533 () Unit!13288)

(declare-fun lt!286547 () BitStream!7766)

(declare-fun readBitPrefixLemma!0 (BitStream!7766 BitStream!7766) Unit!13288)

(assert (=> b!185814 (= lt!286533 (readBitPrefixLemma!0 lt!286547 (_2!8691 lt!286549)))))

(assert (=> b!185814 (= lt!286530 (readBitPure!0 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))))))

(assert (=> b!185814 (= lt!286523 (readBitPure!0 lt!286547))))

(declare-fun e!128622 () Bool)

(assert (=> b!185814 e!128622))

(declare-fun res!154669 () Bool)

(assert (=> b!185814 (=> (not res!154669) (not e!128622))))

(assert (=> b!185814 (= res!154669 (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (=> b!185814 (= lt!286547 (BitStream!7767 (buf!4789 (_2!8691 lt!286535)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(declare-fun b!185815 () Bool)

(declare-fun res!154683 () Bool)

(assert (=> b!185815 (=> (not res!154683) (not e!128624))))

(assert (=> b!185815 (= res!154683 (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204))))))

(declare-fun b!185816 () Bool)

(assert (=> b!185816 (= e!128622 (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286549)))))))

(declare-fun res!154666 () Bool)

(declare-fun e!128623 () Bool)

(assert (=> start!40428 (=> (not res!154666) (not e!128623))))

(assert (=> start!40428 (= res!154666 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40428 e!128623))

(assert (=> start!40428 true))

(declare-fun inv!12 (BitStream!7766) Bool)

(assert (=> start!40428 (and (inv!12 thiss!1204) e!128628)))

(declare-fun b!185817 () Bool)

(assert (=> b!185817 (= e!128623 e!128624)))

(declare-fun res!154674 () Bool)

(assert (=> b!185817 (=> (not res!154674) (not e!128624))))

(assert (=> b!185817 (= res!154674 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)) lt!286546))))

(assert (=> b!185817 (= lt!286546 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185818 () Bool)

(declare-fun res!154681 () Bool)

(assert (=> b!185818 (=> (not res!154681) (not e!128624))))

(assert (=> b!185818 (= res!154681 (not (= i!590 nBits!348)))))

(assert (= (and start!40428 res!154666) b!185817))

(assert (= (and b!185817 res!154674) b!185815))

(assert (= (and b!185815 res!154683) b!185818))

(assert (= (and b!185818 res!154681) b!185810))

(assert (= (and b!185810 res!154667) b!185805))

(assert (= (and b!185805 res!154682) b!185804))

(assert (= (and b!185804 res!154673) b!185806))

(assert (= (and b!185806 res!154680) b!185801))

(assert (= (and b!185810 (not res!154677)) b!185802))

(assert (= (and b!185802 (not res!154670)) b!185808))

(assert (= (and b!185808 (not res!154675)) b!185812))

(assert (= (and b!185812 (not res!154676)) b!185813))

(assert (= (and b!185813 (not res!154679)) b!185809))

(assert (= (and b!185809 (not res!154672)) b!185814))

(assert (= (and b!185814 res!154669) b!185816))

(assert (= (and b!185814 res!154671) b!185807))

(assert (= (and b!185814 (not res!154668)) b!185811))

(assert (= (and b!185811 res!154678) b!185800))

(assert (= start!40428 b!185803))

(declare-fun m!288763 () Bool)

(assert (=> b!185800 m!288763))

(declare-fun m!288765 () Bool)

(assert (=> b!185815 m!288765))

(declare-fun m!288767 () Bool)

(assert (=> b!185814 m!288767))

(declare-fun m!288769 () Bool)

(assert (=> b!185814 m!288769))

(declare-fun m!288771 () Bool)

(assert (=> b!185814 m!288771))

(declare-fun m!288773 () Bool)

(assert (=> b!185814 m!288773))

(declare-fun m!288775 () Bool)

(assert (=> b!185814 m!288775))

(declare-fun m!288777 () Bool)

(assert (=> b!185814 m!288777))

(declare-fun m!288779 () Bool)

(assert (=> b!185814 m!288779))

(declare-fun m!288781 () Bool)

(assert (=> b!185814 m!288781))

(declare-fun m!288783 () Bool)

(assert (=> b!185814 m!288783))

(declare-fun m!288785 () Bool)

(assert (=> b!185814 m!288785))

(declare-fun m!288787 () Bool)

(assert (=> b!185814 m!288787))

(declare-fun m!288789 () Bool)

(assert (=> b!185814 m!288789))

(declare-fun m!288791 () Bool)

(assert (=> b!185814 m!288791))

(declare-fun m!288793 () Bool)

(assert (=> b!185814 m!288793))

(declare-fun m!288795 () Bool)

(assert (=> b!185814 m!288795))

(declare-fun m!288797 () Bool)

(assert (=> b!185814 m!288797))

(declare-fun m!288799 () Bool)

(assert (=> start!40428 m!288799))

(declare-fun m!288801 () Bool)

(assert (=> b!185802 m!288801))

(declare-fun m!288803 () Bool)

(assert (=> b!185802 m!288803))

(declare-fun m!288805 () Bool)

(assert (=> b!185802 m!288805))

(declare-fun m!288807 () Bool)

(assert (=> b!185802 m!288807))

(declare-fun m!288809 () Bool)

(assert (=> b!185809 m!288809))

(declare-fun m!288811 () Bool)

(assert (=> b!185816 m!288811))

(declare-fun m!288813 () Bool)

(assert (=> b!185801 m!288813))

(declare-fun m!288815 () Bool)

(assert (=> b!185817 m!288815))

(declare-fun m!288817 () Bool)

(assert (=> b!185803 m!288817))

(declare-fun m!288819 () Bool)

(assert (=> b!185811 m!288819))

(declare-fun m!288821 () Bool)

(assert (=> b!185811 m!288821))

(declare-fun m!288823 () Bool)

(assert (=> b!185811 m!288823))

(assert (=> b!185811 m!288823))

(declare-fun m!288825 () Bool)

(assert (=> b!185811 m!288825))

(declare-fun m!288827 () Bool)

(assert (=> b!185808 m!288827))

(declare-fun m!288829 () Bool)

(assert (=> b!185810 m!288829))

(declare-fun m!288831 () Bool)

(assert (=> b!185810 m!288831))

(declare-fun m!288833 () Bool)

(assert (=> b!185810 m!288833))

(declare-fun m!288835 () Bool)

(assert (=> b!185806 m!288835))

(assert (=> b!185806 m!288835))

(declare-fun m!288837 () Bool)

(assert (=> b!185806 m!288837))

(assert (=> b!185805 m!288829))

(assert (=> b!185805 m!288831))

(declare-fun m!288839 () Bool)

(assert (=> b!185813 m!288839))

(assert (=> b!185804 m!288809))

(push 1)

(assert (not b!185814))

(assert (not b!185811))

(assert (not b!185803))

(assert (not b!185800))

(assert (not b!185817))

(assert (not b!185809))

(assert (not b!185802))

(assert (not b!185815))

(assert (not b!185805))

(assert (not b!185816))

(assert (not b!185813))

(assert (not b!185810))

(assert (not b!185808))

(assert (not b!185806))

(assert (not start!40428))

(assert (not b!185801))

(assert (not b!185804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64041 () Bool)

(declare-fun res!154716 () Bool)

(declare-fun e!128654 () Bool)

(assert (=> d!64041 (=> (not res!154716) (not e!128654))))

(assert (=> d!64041 (= res!154716 (= (size!4329 (buf!4789 (_2!8691 lt!286535))) (size!4329 (buf!4789 (_2!8691 lt!286549)))))))

(assert (=> d!64041 (= (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!286549)) e!128654)))

(declare-fun b!185853 () Bool)

(declare-fun res!154717 () Bool)

(assert (=> b!185853 (=> (not res!154717) (not e!128654))))

(assert (=> b!185853 (= res!154717 (bvsle (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549)))))))

(declare-fun b!185854 () Bool)

(declare-fun e!128653 () Bool)

(assert (=> b!185854 (= e!128654 e!128653)))

(declare-fun res!154718 () Bool)

(assert (=> b!185854 (=> res!154718 e!128653)))

(assert (=> b!185854 (= res!154718 (= (size!4329 (buf!4789 (_2!8691 lt!286535))) #b00000000000000000000000000000000))))

(declare-fun b!185855 () Bool)

(declare-fun arrayBitRangesEq!0 (array!9815 array!9815 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185855 (= e!128653 (arrayBitRangesEq!0 (buf!4789 (_2!8691 lt!286535)) (buf!4789 (_2!8691 lt!286549)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535)))))))

(assert (= (and d!64041 res!154716) b!185853))

(assert (= (and b!185853 res!154717) b!185854))

(assert (= (and b!185854 (not res!154718)) b!185855))

(assert (=> b!185853 m!288829))

(assert (=> b!185853 m!288801))

(assert (=> b!185855 m!288829))

(assert (=> b!185855 m!288829))

(declare-fun m!288877 () Bool)

(assert (=> b!185855 m!288877))

(assert (=> b!185813 d!64041))

(declare-fun d!64045 () Bool)

(assert (=> d!64045 (= (array_inv!4070 (buf!4789 thiss!1204)) (bvsge (size!4329 (buf!4789 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!185803 d!64045))

(declare-fun d!64047 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!64047 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!286528) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535)))) lt!286528))))

(declare-fun bs!15945 () Bool)

(assert (= bs!15945 d!64047))

(declare-fun m!288879 () Bool)

(assert (=> bs!15945 m!288879))

(assert (=> b!185814 d!64047))

(declare-fun d!64049 () Bool)

(assert (=> d!64049 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!185814 d!64049))

(declare-fun d!64051 () Bool)

(declare-fun e!128666 () Bool)

(assert (=> d!64051 e!128666))

(declare-fun res!154737 () Bool)

(assert (=> d!64051 (=> (not res!154737) (not e!128666))))

(declare-fun lt!286638 () (_ BitVec 64))

(declare-fun lt!286639 () (_ BitVec 64))

(declare-fun lt!286642 () (_ BitVec 64))

(assert (=> d!64051 (= res!154737 (= lt!286642 (bvsub lt!286638 lt!286639)))))

(assert (=> d!64051 (or (= (bvand lt!286638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286639 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286638 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286638 lt!286639) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64051 (= lt!286639 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286530)))) ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286530))) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286530)))))))

(declare-fun lt!286637 () (_ BitVec 64))

(declare-fun lt!286641 () (_ BitVec 64))

(assert (=> d!64051 (= lt!286638 (bvmul lt!286637 lt!286641))))

(assert (=> d!64051 (or (= lt!286637 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286641 (bvsdiv (bvmul lt!286637 lt!286641) lt!286637)))))

(assert (=> d!64051 (= lt!286641 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64051 (= lt!286637 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286530)))))))

(assert (=> d!64051 (= lt!286642 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286530))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286530)))))))

(assert (=> d!64051 (invariant!0 (currentBit!9028 (_1!8690 lt!286530)) (currentByte!9033 (_1!8690 lt!286530)) (size!4329 (buf!4789 (_1!8690 lt!286530))))))

(assert (=> d!64051 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286530))) (currentByte!9033 (_1!8690 lt!286530)) (currentBit!9028 (_1!8690 lt!286530))) lt!286642)))

(declare-fun b!185874 () Bool)

(declare-fun res!154738 () Bool)

(assert (=> b!185874 (=> (not res!154738) (not e!128666))))

(assert (=> b!185874 (= res!154738 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286642))))

(declare-fun b!185875 () Bool)

(declare-fun lt!286640 () (_ BitVec 64))

(assert (=> b!185875 (= e!128666 (bvsle lt!286642 (bvmul lt!286640 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185875 (or (= lt!286640 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286640 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286640)))))

(assert (=> b!185875 (= lt!286640 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286530)))))))

(assert (= (and d!64051 res!154737) b!185874))

(assert (= (and b!185874 res!154738) b!185875))

(declare-fun m!288889 () Bool)

(assert (=> d!64051 m!288889))

(declare-fun m!288891 () Bool)

(assert (=> d!64051 m!288891))

(assert (=> b!185814 d!64051))

(declare-fun d!64061 () Bool)

(declare-fun e!128671 () Bool)

(assert (=> d!64061 e!128671))

(declare-fun res!154747 () Bool)

(assert (=> d!64061 (=> (not res!154747) (not e!128671))))

(declare-fun lt!286687 () tuple2!16088)

(assert (=> d!64061 (= res!154747 (isPrefixOf!0 (_1!8689 lt!286687) (_2!8689 lt!286687)))))

(declare-fun lt!286683 () BitStream!7766)

(assert (=> d!64061 (= lt!286687 (tuple2!16089 lt!286683 (_2!8691 lt!286549)))))

(declare-fun lt!286692 () Unit!13288)

(declare-fun lt!286690 () Unit!13288)

(assert (=> d!64061 (= lt!286692 lt!286690)))

(assert (=> d!64061 (isPrefixOf!0 lt!286683 (_2!8691 lt!286549))))

(assert (=> d!64061 (= lt!286690 (lemmaIsPrefixTransitive!0 lt!286683 (_2!8691 lt!286549) (_2!8691 lt!286549)))))

(declare-fun lt!286684 () Unit!13288)

(declare-fun lt!286689 () Unit!13288)

(assert (=> d!64061 (= lt!286684 lt!286689)))

(assert (=> d!64061 (isPrefixOf!0 lt!286683 (_2!8691 lt!286549))))

(assert (=> d!64061 (= lt!286689 (lemmaIsPrefixTransitive!0 lt!286683 (_2!8691 lt!286535) (_2!8691 lt!286549)))))

(declare-fun lt!286700 () Unit!13288)

(declare-fun e!128672 () Unit!13288)

(assert (=> d!64061 (= lt!286700 e!128672)))

(declare-fun c!9479 () Bool)

(assert (=> d!64061 (= c!9479 (not (= (size!4329 (buf!4789 (_2!8691 lt!286535))) #b00000000000000000000000000000000)))))

(declare-fun lt!286699 () Unit!13288)

(declare-fun lt!286701 () Unit!13288)

(assert (=> d!64061 (= lt!286699 lt!286701)))

(assert (=> d!64061 (isPrefixOf!0 (_2!8691 lt!286549) (_2!8691 lt!286549))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7766) Unit!13288)

(assert (=> d!64061 (= lt!286701 (lemmaIsPrefixRefl!0 (_2!8691 lt!286549)))))

(declare-fun lt!286688 () Unit!13288)

(declare-fun lt!286685 () Unit!13288)

(assert (=> d!64061 (= lt!286688 lt!286685)))

(assert (=> d!64061 (= lt!286685 (lemmaIsPrefixRefl!0 (_2!8691 lt!286549)))))

(declare-fun lt!286694 () Unit!13288)

(declare-fun lt!286695 () Unit!13288)

(assert (=> d!64061 (= lt!286694 lt!286695)))

(assert (=> d!64061 (isPrefixOf!0 lt!286683 lt!286683)))

(assert (=> d!64061 (= lt!286695 (lemmaIsPrefixRefl!0 lt!286683))))

(declare-fun lt!286691 () Unit!13288)

(declare-fun lt!286696 () Unit!13288)

(assert (=> d!64061 (= lt!286691 lt!286696)))

(assert (=> d!64061 (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!286535))))

(assert (=> d!64061 (= lt!286696 (lemmaIsPrefixRefl!0 (_2!8691 lt!286535)))))

(assert (=> d!64061 (= lt!286683 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(assert (=> d!64061 (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!286549))))

(assert (=> d!64061 (= (reader!0 (_2!8691 lt!286535) (_2!8691 lt!286549)) lt!286687)))

(declare-fun b!185886 () Bool)

(declare-fun Unit!13301 () Unit!13288)

(assert (=> b!185886 (= e!128672 Unit!13301)))

(declare-fun lt!286698 () (_ BitVec 64))

(declare-fun b!185887 () Bool)

(declare-fun lt!286686 () (_ BitVec 64))

(assert (=> b!185887 (= e!128671 (= (_1!8689 lt!286687) (withMovedBitIndex!0 (_2!8689 lt!286687) (bvsub lt!286698 lt!286686))))))

(assert (=> b!185887 (or (= (bvand lt!286698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286698 lt!286686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185887 (= lt!286686 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549))))))

(assert (=> b!185887 (= lt!286698 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(declare-fun b!185888 () Bool)

(declare-fun lt!286693 () Unit!13288)

(assert (=> b!185888 (= e!128672 lt!286693)))

(declare-fun lt!286702 () (_ BitVec 64))

(assert (=> b!185888 (= lt!286702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!286697 () (_ BitVec 64))

(assert (=> b!185888 (= lt!286697 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9815 array!9815 (_ BitVec 64) (_ BitVec 64)) Unit!13288)

(assert (=> b!185888 (= lt!286693 (arrayBitRangesEqSymmetric!0 (buf!4789 (_2!8691 lt!286535)) (buf!4789 (_2!8691 lt!286549)) lt!286702 lt!286697))))

(assert (=> b!185888 (arrayBitRangesEq!0 (buf!4789 (_2!8691 lt!286549)) (buf!4789 (_2!8691 lt!286535)) lt!286702 lt!286697)))

(declare-fun b!185889 () Bool)

(declare-fun res!154746 () Bool)

(assert (=> b!185889 (=> (not res!154746) (not e!128671))))

(assert (=> b!185889 (= res!154746 (isPrefixOf!0 (_1!8689 lt!286687) (_2!8691 lt!286535)))))

(declare-fun b!185890 () Bool)

(declare-fun res!154745 () Bool)

(assert (=> b!185890 (=> (not res!154745) (not e!128671))))

(assert (=> b!185890 (= res!154745 (isPrefixOf!0 (_2!8689 lt!286687) (_2!8691 lt!286549)))))

(assert (= (and d!64061 c!9479) b!185888))

(assert (= (and d!64061 (not c!9479)) b!185886))

(assert (= (and d!64061 res!154747) b!185889))

(assert (= (and b!185889 res!154746) b!185890))

(assert (= (and b!185890 res!154745) b!185887))

(declare-fun m!288893 () Bool)

(assert (=> b!185889 m!288893))

(assert (=> b!185888 m!288829))

(declare-fun m!288895 () Bool)

(assert (=> b!185888 m!288895))

(declare-fun m!288897 () Bool)

(assert (=> b!185888 m!288897))

(declare-fun m!288899 () Bool)

(assert (=> d!64061 m!288899))

(declare-fun m!288901 () Bool)

(assert (=> d!64061 m!288901))

(declare-fun m!288903 () Bool)

(assert (=> d!64061 m!288903))

(declare-fun m!288905 () Bool)

(assert (=> d!64061 m!288905))

(declare-fun m!288907 () Bool)

(assert (=> d!64061 m!288907))

(declare-fun m!288909 () Bool)

(assert (=> d!64061 m!288909))

(declare-fun m!288911 () Bool)

(assert (=> d!64061 m!288911))

(declare-fun m!288913 () Bool)

(assert (=> d!64061 m!288913))

(declare-fun m!288915 () Bool)

(assert (=> d!64061 m!288915))

(assert (=> d!64061 m!288839))

(declare-fun m!288917 () Bool)

(assert (=> d!64061 m!288917))

(declare-fun m!288919 () Bool)

(assert (=> b!185890 m!288919))

(declare-fun m!288921 () Bool)

(assert (=> b!185887 m!288921))

(assert (=> b!185887 m!288801))

(assert (=> b!185887 m!288829))

(assert (=> b!185814 d!64061))

(declare-fun d!64063 () Bool)

(assert (=> d!64063 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!286528)))

(declare-fun lt!286705 () Unit!13288)

(declare-fun choose!9 (BitStream!7766 array!9815 (_ BitVec 64) BitStream!7766) Unit!13288)

(assert (=> d!64063 (= lt!286705 (choose!9 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!286549)) lt!286528 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535)))))))

(assert (=> d!64063 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!286549)) lt!286528) lt!286705)))

(declare-fun bs!15947 () Bool)

(assert (= bs!15947 d!64063))

(assert (=> bs!15947 m!288781))

(declare-fun m!288923 () Bool)

(assert (=> bs!15947 m!288923))

(assert (=> b!185814 d!64063))

(declare-fun d!64065 () Bool)

(declare-datatypes ((tuple2!16100 0))(
  ( (tuple2!16101 (_1!8695 Bool) (_2!8695 BitStream!7766)) )
))
(declare-fun lt!286708 () tuple2!16100)

(declare-fun readBit!0 (BitStream!7766) tuple2!16100)

(assert (=> d!64065 (= lt!286708 (readBit!0 lt!286547))))

(assert (=> d!64065 (= (readBitPure!0 lt!286547) (tuple2!16091 (_2!8695 lt!286708) (_1!8695 lt!286708)))))

(declare-fun bs!15948 () Bool)

(assert (= bs!15948 d!64065))

(declare-fun m!288925 () Bool)

(assert (=> bs!15948 m!288925))

(assert (=> b!185814 d!64065))

(declare-fun d!64067 () Bool)

(declare-fun lt!286709 () tuple2!16100)

(assert (=> d!64067 (= lt!286709 (readBit!0 (_1!8689 lt!286531)))))

(assert (=> d!64067 (= (readBitPure!0 (_1!8689 lt!286531)) (tuple2!16091 (_2!8695 lt!286709) (_1!8695 lt!286709)))))

(declare-fun bs!15949 () Bool)

(assert (= bs!15949 d!64067))

(declare-fun m!288927 () Bool)

(assert (=> bs!15949 m!288927))

(assert (=> b!185814 d!64067))

(declare-fun d!64069 () Bool)

(assert (=> d!64069 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)) lt!286546)))

(declare-fun lt!286710 () Unit!13288)

(assert (=> d!64069 (= lt!286710 (choose!9 thiss!1204 (buf!4789 (_2!8691 lt!286549)) lt!286546 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))))))

(assert (=> d!64069 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4789 (_2!8691 lt!286549)) lt!286546) lt!286710)))

(declare-fun bs!15950 () Bool)

(assert (= bs!15950 d!64069))

(assert (=> bs!15950 m!288775))

(declare-fun m!288929 () Bool)

(assert (=> bs!15950 m!288929))

(assert (=> b!185814 d!64069))

(declare-fun d!64071 () Bool)

(declare-fun e!128673 () Bool)

(assert (=> d!64071 e!128673))

(declare-fun res!154750 () Bool)

(assert (=> d!64071 (=> (not res!154750) (not e!128673))))

(declare-fun lt!286715 () tuple2!16088)

(assert (=> d!64071 (= res!154750 (isPrefixOf!0 (_1!8689 lt!286715) (_2!8689 lt!286715)))))

(declare-fun lt!286711 () BitStream!7766)

(assert (=> d!64071 (= lt!286715 (tuple2!16089 lt!286711 (_2!8691 lt!286549)))))

(declare-fun lt!286720 () Unit!13288)

(declare-fun lt!286718 () Unit!13288)

(assert (=> d!64071 (= lt!286720 lt!286718)))

(assert (=> d!64071 (isPrefixOf!0 lt!286711 (_2!8691 lt!286549))))

(assert (=> d!64071 (= lt!286718 (lemmaIsPrefixTransitive!0 lt!286711 (_2!8691 lt!286549) (_2!8691 lt!286549)))))

(declare-fun lt!286712 () Unit!13288)

(declare-fun lt!286717 () Unit!13288)

(assert (=> d!64071 (= lt!286712 lt!286717)))

(assert (=> d!64071 (isPrefixOf!0 lt!286711 (_2!8691 lt!286549))))

(assert (=> d!64071 (= lt!286717 (lemmaIsPrefixTransitive!0 lt!286711 thiss!1204 (_2!8691 lt!286549)))))

(declare-fun lt!286728 () Unit!13288)

(declare-fun e!128674 () Unit!13288)

(assert (=> d!64071 (= lt!286728 e!128674)))

(declare-fun c!9480 () Bool)

(assert (=> d!64071 (= c!9480 (not (= (size!4329 (buf!4789 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!286727 () Unit!13288)

(declare-fun lt!286729 () Unit!13288)

(assert (=> d!64071 (= lt!286727 lt!286729)))

(assert (=> d!64071 (isPrefixOf!0 (_2!8691 lt!286549) (_2!8691 lt!286549))))

(assert (=> d!64071 (= lt!286729 (lemmaIsPrefixRefl!0 (_2!8691 lt!286549)))))

(declare-fun lt!286716 () Unit!13288)

(declare-fun lt!286713 () Unit!13288)

(assert (=> d!64071 (= lt!286716 lt!286713)))

(assert (=> d!64071 (= lt!286713 (lemmaIsPrefixRefl!0 (_2!8691 lt!286549)))))

(declare-fun lt!286722 () Unit!13288)

(declare-fun lt!286723 () Unit!13288)

(assert (=> d!64071 (= lt!286722 lt!286723)))

(assert (=> d!64071 (isPrefixOf!0 lt!286711 lt!286711)))

(assert (=> d!64071 (= lt!286723 (lemmaIsPrefixRefl!0 lt!286711))))

(declare-fun lt!286719 () Unit!13288)

(declare-fun lt!286724 () Unit!13288)

(assert (=> d!64071 (= lt!286719 lt!286724)))

(assert (=> d!64071 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!64071 (= lt!286724 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!64071 (= lt!286711 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(assert (=> d!64071 (isPrefixOf!0 thiss!1204 (_2!8691 lt!286549))))

(assert (=> d!64071 (= (reader!0 thiss!1204 (_2!8691 lt!286549)) lt!286715)))

(declare-fun b!185891 () Bool)

(declare-fun Unit!13302 () Unit!13288)

(assert (=> b!185891 (= e!128674 Unit!13302)))

(declare-fun b!185892 () Bool)

(declare-fun lt!286714 () (_ BitVec 64))

(declare-fun lt!286726 () (_ BitVec 64))

(assert (=> b!185892 (= e!128673 (= (_1!8689 lt!286715) (withMovedBitIndex!0 (_2!8689 lt!286715) (bvsub lt!286726 lt!286714))))))

(assert (=> b!185892 (or (= (bvand lt!286726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286714 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286726 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286726 lt!286714) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185892 (= lt!286714 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549))))))

(assert (=> b!185892 (= lt!286726 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(declare-fun b!185893 () Bool)

(declare-fun lt!286721 () Unit!13288)

(assert (=> b!185893 (= e!128674 lt!286721)))

(declare-fun lt!286730 () (_ BitVec 64))

(assert (=> b!185893 (= lt!286730 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!286725 () (_ BitVec 64))

(assert (=> b!185893 (= lt!286725 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(assert (=> b!185893 (= lt!286721 (arrayBitRangesEqSymmetric!0 (buf!4789 thiss!1204) (buf!4789 (_2!8691 lt!286549)) lt!286730 lt!286725))))

(assert (=> b!185893 (arrayBitRangesEq!0 (buf!4789 (_2!8691 lt!286549)) (buf!4789 thiss!1204) lt!286730 lt!286725)))

(declare-fun b!185894 () Bool)

(declare-fun res!154749 () Bool)

(assert (=> b!185894 (=> (not res!154749) (not e!128673))))

(assert (=> b!185894 (= res!154749 (isPrefixOf!0 (_1!8689 lt!286715) thiss!1204))))

(declare-fun b!185895 () Bool)

(declare-fun res!154748 () Bool)

(assert (=> b!185895 (=> (not res!154748) (not e!128673))))

(assert (=> b!185895 (= res!154748 (isPrefixOf!0 (_2!8689 lt!286715) (_2!8691 lt!286549)))))

(assert (= (and d!64071 c!9480) b!185893))

(assert (= (and d!64071 (not c!9480)) b!185891))

(assert (= (and d!64071 res!154750) b!185894))

(assert (= (and b!185894 res!154749) b!185895))

(assert (= (and b!185895 res!154748) b!185892))

(declare-fun m!288931 () Bool)

(assert (=> b!185894 m!288931))

(assert (=> b!185893 m!288831))

(declare-fun m!288933 () Bool)

(assert (=> b!185893 m!288933))

(declare-fun m!288935 () Bool)

(assert (=> b!185893 m!288935))

(assert (=> d!64071 m!288899))

(assert (=> d!64071 m!288901))

(declare-fun m!288937 () Bool)

(assert (=> d!64071 m!288937))

(declare-fun m!288939 () Bool)

(assert (=> d!64071 m!288939))

(declare-fun m!288941 () Bool)

(assert (=> d!64071 m!288941))

(declare-fun m!288943 () Bool)

(assert (=> d!64071 m!288943))

(declare-fun m!288945 () Bool)

(assert (=> d!64071 m!288945))

(declare-fun m!288947 () Bool)

(assert (=> d!64071 m!288947))

(declare-fun m!288949 () Bool)

(assert (=> d!64071 m!288949))

(assert (=> d!64071 m!288803))

(declare-fun m!288951 () Bool)

(assert (=> d!64071 m!288951))

(declare-fun m!288953 () Bool)

(assert (=> b!185895 m!288953))

(declare-fun m!288955 () Bool)

(assert (=> b!185892 m!288955))

(assert (=> b!185892 m!288801))

(assert (=> b!185892 m!288831))

(assert (=> b!185814 d!64071))

(declare-datatypes ((tuple2!16102 0))(
  ( (tuple2!16103 (_1!8696 (_ BitVec 64)) (_2!8696 BitStream!7766)) )
))
(declare-fun lt!286733 () tuple2!16102)

(declare-fun d!64073 () Bool)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!7766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16102)

(assert (=> d!64073 (= lt!286733 (readNBitsLSBFirstsLoop!0 (_1!8689 lt!286544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548))))

(assert (=> d!64073 (= (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!286544) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548) (tuple2!16095 (_2!8696 lt!286733) (_1!8696 lt!286733)))))

(declare-fun bs!15951 () Bool)

(assert (= bs!15951 d!64073))

(declare-fun m!288957 () Bool)

(assert (=> bs!15951 m!288957))

(assert (=> b!185814 d!64073))

(declare-fun d!64075 () Bool)

(assert (=> d!64075 (= (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286535)))) (and (bvsge (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9028 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9033 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286535)))) (and (= (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286535))))))))))

(assert (=> b!185814 d!64075))

(declare-fun d!64077 () Bool)

(declare-fun lt!286734 () tuple2!16100)

(assert (=> d!64077 (= lt!286734 (readBit!0 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))))))

(assert (=> d!64077 (= (readBitPure!0 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))) (tuple2!16091 (_2!8695 lt!286734) (_1!8695 lt!286734)))))

(declare-fun bs!15952 () Bool)

(assert (= bs!15952 d!64077))

(declare-fun m!288959 () Bool)

(assert (=> bs!15952 m!288959))

(assert (=> b!185814 d!64077))

(declare-fun d!64079 () Bool)

(declare-fun e!128675 () Bool)

(assert (=> d!64079 e!128675))

(declare-fun res!154751 () Bool)

(assert (=> d!64079 (=> (not res!154751) (not e!128675))))

(declare-fun lt!286737 () (_ BitVec 64))

(declare-fun lt!286736 () (_ BitVec 64))

(declare-fun lt!286740 () (_ BitVec 64))

(assert (=> d!64079 (= res!154751 (= lt!286740 (bvsub lt!286736 lt!286737)))))

(assert (=> d!64079 (or (= (bvand lt!286736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286736 lt!286737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64079 (= lt!286737 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286523)))) ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286523))) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286523)))))))

(declare-fun lt!286735 () (_ BitVec 64))

(declare-fun lt!286739 () (_ BitVec 64))

(assert (=> d!64079 (= lt!286736 (bvmul lt!286735 lt!286739))))

(assert (=> d!64079 (or (= lt!286735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286739 (bvsdiv (bvmul lt!286735 lt!286739) lt!286735)))))

(assert (=> d!64079 (= lt!286739 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64079 (= lt!286735 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286523)))))))

(assert (=> d!64079 (= lt!286740 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286523)))))))

(assert (=> d!64079 (invariant!0 (currentBit!9028 (_1!8690 lt!286523)) (currentByte!9033 (_1!8690 lt!286523)) (size!4329 (buf!4789 (_1!8690 lt!286523))))))

(assert (=> d!64079 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286523))) (currentByte!9033 (_1!8690 lt!286523)) (currentBit!9028 (_1!8690 lt!286523))) lt!286740)))

(declare-fun b!185896 () Bool)

(declare-fun res!154752 () Bool)

(assert (=> b!185896 (=> (not res!154752) (not e!128675))))

(assert (=> b!185896 (= res!154752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286740))))

(declare-fun b!185897 () Bool)

(declare-fun lt!286738 () (_ BitVec 64))

(assert (=> b!185897 (= e!128675 (bvsle lt!286740 (bvmul lt!286738 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185897 (or (= lt!286738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286738)))))

(assert (=> b!185897 (= lt!286738 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286523)))))))

(assert (= (and d!64079 res!154751) b!185896))

(assert (= (and b!185896 res!154752) b!185897))

(declare-fun m!288961 () Bool)

(assert (=> d!64079 m!288961))

(declare-fun m!288963 () Bool)

(assert (=> d!64079 m!288963))

(assert (=> b!185814 d!64079))

(declare-fun d!64081 () Bool)

(assert (=> d!64081 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)) lt!286546) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204))) lt!286546))))

(declare-fun bs!15953 () Bool)

(assert (= bs!15953 d!64081))

(declare-fun m!288965 () Bool)

(assert (=> bs!15953 m!288965))

(assert (=> b!185814 d!64081))

(declare-fun d!64083 () Bool)

(declare-fun lt!286741 () tuple2!16102)

(assert (=> d!64083 (= lt!286741 (readNBitsLSBFirstsLoop!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539))))

(assert (=> d!64083 (= (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539) (tuple2!16095 (_2!8696 lt!286741) (_1!8696 lt!286741)))))

(declare-fun bs!15954 () Bool)

(assert (= bs!15954 d!64083))

(declare-fun m!288967 () Bool)

(assert (=> bs!15954 m!288967))

(assert (=> b!185814 d!64083))

(declare-fun d!64085 () Bool)

(declare-fun e!128678 () Bool)

(assert (=> d!64085 e!128678))

(declare-fun res!154755 () Bool)

(assert (=> d!64085 (=> (not res!154755) (not e!128678))))

(declare-fun lt!286751 () tuple2!16090)

(declare-fun lt!286753 () tuple2!16090)

(assert (=> d!64085 (= res!154755 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286751))) (currentByte!9033 (_1!8690 lt!286751)) (currentBit!9028 (_1!8690 lt!286751))) (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286753))) (currentByte!9033 (_1!8690 lt!286753)) (currentBit!9028 (_1!8690 lt!286753)))))))

(declare-fun lt!286750 () Unit!13288)

(declare-fun lt!286752 () BitStream!7766)

(declare-fun choose!50 (BitStream!7766 BitStream!7766 BitStream!7766 tuple2!16090 tuple2!16090 BitStream!7766 Bool tuple2!16090 tuple2!16090 BitStream!7766 Bool) Unit!13288)

(assert (=> d!64085 (= lt!286750 (choose!50 lt!286547 (_2!8691 lt!286549) lt!286752 lt!286751 (tuple2!16091 (_1!8690 lt!286751) (_2!8690 lt!286751)) (_1!8690 lt!286751) (_2!8690 lt!286751) lt!286753 (tuple2!16091 (_1!8690 lt!286753) (_2!8690 lt!286753)) (_1!8690 lt!286753) (_2!8690 lt!286753)))))

(assert (=> d!64085 (= lt!286753 (readBitPure!0 lt!286752))))

(assert (=> d!64085 (= lt!286751 (readBitPure!0 lt!286547))))

(assert (=> d!64085 (= lt!286752 (BitStream!7767 (buf!4789 (_2!8691 lt!286549)) (currentByte!9033 lt!286547) (currentBit!9028 lt!286547)))))

(assert (=> d!64085 (invariant!0 (currentBit!9028 lt!286547) (currentByte!9033 lt!286547) (size!4329 (buf!4789 (_2!8691 lt!286549))))))

(assert (=> d!64085 (= (readBitPrefixLemma!0 lt!286547 (_2!8691 lt!286549)) lt!286750)))

(declare-fun b!185900 () Bool)

(assert (=> b!185900 (= e!128678 (= (_2!8690 lt!286751) (_2!8690 lt!286753)))))

(assert (= (and d!64085 res!154755) b!185900))

(declare-fun m!288969 () Bool)

(assert (=> d!64085 m!288969))

(declare-fun m!288971 () Bool)

(assert (=> d!64085 m!288971))

(declare-fun m!288973 () Bool)

(assert (=> d!64085 m!288973))

(assert (=> d!64085 m!288797))

(declare-fun m!288975 () Bool)

(assert (=> d!64085 m!288975))

(declare-fun m!288977 () Bool)

(assert (=> d!64085 m!288977))

(assert (=> b!185814 d!64085))

(declare-fun d!64087 () Bool)

(declare-fun e!128679 () Bool)

(assert (=> d!64087 e!128679))

(declare-fun res!154756 () Bool)

(assert (=> d!64087 (=> (not res!154756) (not e!128679))))

(declare-fun lt!286755 () (_ BitVec 64))

(declare-fun lt!286756 () (_ BitVec 64))

(declare-fun lt!286759 () (_ BitVec 64))

(assert (=> d!64087 (= res!154756 (= lt!286759 (bvsub lt!286755 lt!286756)))))

(assert (=> d!64087 (or (= (bvand lt!286755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286755 lt!286756) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64087 (= lt!286756 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286537)))) ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286537))) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286537)))))))

(declare-fun lt!286754 () (_ BitVec 64))

(declare-fun lt!286758 () (_ BitVec 64))

(assert (=> d!64087 (= lt!286755 (bvmul lt!286754 lt!286758))))

(assert (=> d!64087 (or (= lt!286754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286758 (bvsdiv (bvmul lt!286754 lt!286758) lt!286754)))))

(assert (=> d!64087 (= lt!286758 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64087 (= lt!286754 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286537)))))))

(assert (=> d!64087 (= lt!286759 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 (_1!8690 lt!286537))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 (_1!8690 lt!286537)))))))

(assert (=> d!64087 (invariant!0 (currentBit!9028 (_1!8690 lt!286537)) (currentByte!9033 (_1!8690 lt!286537)) (size!4329 (buf!4789 (_1!8690 lt!286537))))))

(assert (=> d!64087 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!286537))) (currentByte!9033 (_1!8690 lt!286537)) (currentBit!9028 (_1!8690 lt!286537))) lt!286759)))

(declare-fun b!185901 () Bool)

(declare-fun res!154757 () Bool)

(assert (=> b!185901 (=> (not res!154757) (not e!128679))))

(assert (=> b!185901 (= res!154757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286759))))

(declare-fun b!185902 () Bool)

(declare-fun lt!286757 () (_ BitVec 64))

(assert (=> b!185902 (= e!128679 (bvsle lt!286759 (bvmul lt!286757 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185902 (or (= lt!286757 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286757 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286757)))))

(assert (=> b!185902 (= lt!286757 ((_ sign_extend 32) (size!4329 (buf!4789 (_1!8690 lt!286537)))))))

(assert (= (and d!64087 res!154756) b!185901))

(assert (= (and b!185901 res!154757) b!185902))

(declare-fun m!288979 () Bool)

(assert (=> d!64087 m!288979))

(declare-fun m!288981 () Bool)

(assert (=> d!64087 m!288981))

(assert (=> b!185801 d!64087))

(declare-fun d!64089 () Bool)

(declare-fun e!128680 () Bool)

(assert (=> d!64089 e!128680))

(declare-fun res!154758 () Bool)

(assert (=> d!64089 (=> (not res!154758) (not e!128680))))

(declare-fun lt!286765 () (_ BitVec 64))

(declare-fun lt!286762 () (_ BitVec 64))

(declare-fun lt!286761 () (_ BitVec 64))

(assert (=> d!64089 (= res!154758 (= lt!286765 (bvsub lt!286761 lt!286762)))))

(assert (=> d!64089 (or (= (bvand lt!286761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!286762 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!286761 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286761 lt!286762) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64089 (= lt!286762 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286549))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286549)))))))

(declare-fun lt!286760 () (_ BitVec 64))

(declare-fun lt!286764 () (_ BitVec 64))

(assert (=> d!64089 (= lt!286761 (bvmul lt!286760 lt!286764))))

(assert (=> d!64089 (or (= lt!286760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!286764 (bvsdiv (bvmul lt!286760 lt!286764) lt!286760)))))

(assert (=> d!64089 (= lt!286764 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64089 (= lt!286760 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))))))

(assert (=> d!64089 (= lt!286765 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286549))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286549)))))))

(assert (=> d!64089 (invariant!0 (currentBit!9028 (_2!8691 lt!286549)) (currentByte!9033 (_2!8691 lt!286549)) (size!4329 (buf!4789 (_2!8691 lt!286549))))))

(assert (=> d!64089 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549))) lt!286765)))

(declare-fun b!185903 () Bool)

(declare-fun res!154759 () Bool)

(assert (=> b!185903 (=> (not res!154759) (not e!128680))))

(assert (=> b!185903 (= res!154759 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!286765))))

(declare-fun b!185904 () Bool)

(declare-fun lt!286763 () (_ BitVec 64))

(assert (=> b!185904 (= e!128680 (bvsle lt!286765 (bvmul lt!286763 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!185904 (or (= lt!286763 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!286763 #b0000000000000000000000000000000000000000000000000000000000001000) lt!286763)))))

(assert (=> b!185904 (= lt!286763 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286549)))))))

(assert (= (and d!64089 res!154758) b!185903))

(assert (= (and b!185903 res!154759) b!185904))

(declare-fun m!288983 () Bool)

(assert (=> d!64089 m!288983))

(assert (=> d!64089 m!288827))

(assert (=> b!185802 d!64089))

(declare-fun d!64091 () Bool)

(declare-fun res!154760 () Bool)

(declare-fun e!128682 () Bool)

(assert (=> d!64091 (=> (not res!154760) (not e!128682))))

(assert (=> d!64091 (= res!154760 (= (size!4329 (buf!4789 thiss!1204)) (size!4329 (buf!4789 (_2!8691 lt!286549)))))))

(assert (=> d!64091 (= (isPrefixOf!0 thiss!1204 (_2!8691 lt!286549)) e!128682)))

(declare-fun b!185905 () Bool)

(declare-fun res!154761 () Bool)

(assert (=> b!185905 (=> (not res!154761) (not e!128682))))

(assert (=> b!185905 (= res!154761 (bvsle (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286549))) (currentByte!9033 (_2!8691 lt!286549)) (currentBit!9028 (_2!8691 lt!286549)))))))

(declare-fun b!185906 () Bool)

(declare-fun e!128681 () Bool)

(assert (=> b!185906 (= e!128682 e!128681)))

(declare-fun res!154762 () Bool)

(assert (=> b!185906 (=> res!154762 e!128681)))

(assert (=> b!185906 (= res!154762 (= (size!4329 (buf!4789 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!185907 () Bool)

(assert (=> b!185907 (= e!128681 (arrayBitRangesEq!0 (buf!4789 thiss!1204) (buf!4789 (_2!8691 lt!286549)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))))))

(assert (= (and d!64091 res!154760) b!185905))

(assert (= (and b!185905 res!154761) b!185906))

(assert (= (and b!185906 (not res!154762)) b!185907))

(assert (=> b!185905 m!288831))

(assert (=> b!185905 m!288801))

(assert (=> b!185907 m!288831))

(assert (=> b!185907 m!288831))

(declare-fun m!288985 () Bool)

(assert (=> b!185907 m!288985))

(assert (=> b!185802 d!64091))

(declare-fun d!64093 () Bool)

(assert (=> d!64093 (isPrefixOf!0 thiss!1204 (_2!8691 lt!286549))))

(declare-fun lt!286768 () Unit!13288)

(declare-fun choose!30 (BitStream!7766 BitStream!7766 BitStream!7766) Unit!13288)

(assert (=> d!64093 (= lt!286768 (choose!30 thiss!1204 (_2!8691 lt!286535) (_2!8691 lt!286549)))))

(assert (=> d!64093 (isPrefixOf!0 thiss!1204 (_2!8691 lt!286535))))

(assert (=> d!64093 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8691 lt!286535) (_2!8691 lt!286549)) lt!286768)))

(declare-fun bs!15955 () Bool)

(assert (= bs!15955 d!64093))

(assert (=> bs!15955 m!288803))

(declare-fun m!288987 () Bool)

(assert (=> bs!15955 m!288987))

(assert (=> bs!15955 m!288809))

(assert (=> b!185802 d!64093))

(declare-fun b!186024 () Bool)

(declare-fun res!154860 () Bool)

(declare-fun lt!287184 () tuple2!16092)

(assert (=> b!186024 (= res!154860 (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!287184)))))

(declare-fun e!128749 () Bool)

(assert (=> b!186024 (=> (not res!154860) (not e!128749))))

(declare-fun b!186025 () Bool)

(declare-fun e!128753 () Bool)

(declare-fun lt!287180 () tuple2!16090)

(assert (=> b!186025 (= e!128753 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!287180))) (currentByte!9033 (_1!8690 lt!287180)) (currentBit!9028 (_1!8690 lt!287180))) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287184))) (currentByte!9033 (_2!8691 lt!287184)) (currentBit!9028 (_2!8691 lt!287184)))))))

(declare-fun b!186026 () Bool)

(declare-fun res!154863 () Bool)

(declare-fun e!128751 () Bool)

(assert (=> b!186026 (=> (not res!154863) (not e!128751))))

(declare-fun lt!287198 () (_ BitVec 64))

(declare-fun lt!287171 () (_ BitVec 64))

(declare-fun lt!287218 () tuple2!16092)

(assert (=> b!186026 (= res!154863 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287218))) (currentByte!9033 (_2!8691 lt!287218)) (currentBit!9028 (_2!8691 lt!287218))) (bvsub lt!287171 lt!287198)))))

(assert (=> b!186026 (or (= (bvand lt!287171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287198 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287171 lt!287198) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186026 (= lt!287198 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!287190 () (_ BitVec 64))

(declare-fun lt!287193 () (_ BitVec 64))

(assert (=> b!186026 (= lt!287171 (bvadd lt!287190 lt!287193))))

(assert (=> b!186026 (or (not (= (bvand lt!287190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287193 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287190 lt!287193) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186026 (= lt!287193 ((_ sign_extend 32) nBits!348))))

(assert (=> b!186026 (= lt!287190 (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(declare-fun b!186027 () Bool)

(declare-fun e!128755 () Bool)

(declare-fun lt!287216 () tuple2!16090)

(declare-fun lt!287206 () tuple2!16090)

(assert (=> b!186027 (= e!128755 (= (_2!8690 lt!287216) (_2!8690 lt!287206)))))

(declare-fun b!186028 () Bool)

(assert (=> b!186028 (= lt!287180 (readBitPure!0 (readerFrom!0 (_2!8691 lt!287184) (currentBit!9028 (_2!8691 lt!286535)) (currentByte!9033 (_2!8691 lt!286535)))))))

(declare-fun lt!287176 () Bool)

(declare-fun res!154852 () Bool)

(assert (=> b!186028 (= res!154852 (and (= (_2!8690 lt!287180) lt!287176) (= (_1!8690 lt!287180) (_2!8691 lt!287184))))))

(assert (=> b!186028 (=> (not res!154852) (not e!128753))))

(assert (=> b!186028 (= e!128749 e!128753)))

(declare-fun d!64095 () Bool)

(assert (=> d!64095 e!128751))

(declare-fun res!154861 () Bool)

(assert (=> d!64095 (=> (not res!154861) (not e!128751))))

(assert (=> d!64095 (= res!154861 (invariant!0 (currentBit!9028 (_2!8691 lt!287218)) (currentByte!9033 (_2!8691 lt!287218)) (size!4329 (buf!4789 (_2!8691 lt!287218)))))))

(declare-fun e!128754 () tuple2!16092)

(assert (=> d!64095 (= lt!287218 e!128754)))

(declare-fun c!9496 () Bool)

(assert (=> d!64095 (= c!9496 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!64095 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!64095 (= (appendBitsLSBFirstLoopTR!0 (_2!8691 lt!286535) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!287218)))

(declare-fun b!186029 () Bool)

(declare-fun e!128756 () Bool)

(assert (=> b!186029 (= e!128751 e!128756)))

(declare-fun res!154853 () Bool)

(assert (=> b!186029 (=> (not res!154853) (not e!128756))))

(declare-fun lt!287203 () tuple2!16094)

(assert (=> b!186029 (= res!154853 (= (_2!8692 lt!287203) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun lt!287172 () tuple2!16088)

(assert (=> b!186029 (= lt!287203 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!287172) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!287185 () Unit!13288)

(declare-fun lt!287196 () Unit!13288)

(assert (=> b!186029 (= lt!287185 lt!287196)))

(declare-fun lt!287189 () (_ BitVec 64))

(assert (=> b!186029 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!287218)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!287189)))

(assert (=> b!186029 (= lt!287196 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!287218)) lt!287189))))

(declare-fun e!128752 () Bool)

(assert (=> b!186029 e!128752))

(declare-fun res!154858 () Bool)

(assert (=> b!186029 (=> (not res!154858) (not e!128752))))

(assert (=> b!186029 (= res!154858 (and (= (size!4329 (buf!4789 (_2!8691 lt!286535))) (size!4329 (buf!4789 (_2!8691 lt!287218)))) (bvsge lt!287189 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186029 (= lt!287189 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!186029 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!186029 (= lt!287172 (reader!0 (_2!8691 lt!286535) (_2!8691 lt!287218)))))

(declare-fun b!186030 () Bool)

(declare-fun res!154859 () Bool)

(assert (=> b!186030 (= res!154859 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287184))) (currentByte!9033 (_2!8691 lt!287184)) (currentBit!9028 (_2!8691 lt!287184))) (bvadd (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!186030 (=> (not res!154859) (not e!128749))))

(declare-fun b!186031 () Bool)

(assert (=> b!186031 (= e!128752 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286535)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!287189))))

(declare-fun b!186032 () Bool)

(declare-fun e!128748 () (_ BitVec 64))

(assert (=> b!186032 (= e!128748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!186033 () Bool)

(declare-fun res!154854 () Bool)

(assert (=> b!186033 (=> (not res!154854) (not e!128751))))

(assert (=> b!186033 (= res!154854 (= (size!4329 (buf!4789 (_2!8691 lt!286535))) (size!4329 (buf!4789 (_2!8691 lt!287218)))))))

(declare-fun b!186034 () Bool)

(assert (=> b!186034 (= e!128748 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287182 () tuple2!16092)

(declare-fun call!2993 () Bool)

(declare-fun bm!2990 () Bool)

(assert (=> bm!2990 (= call!2993 (isPrefixOf!0 (_2!8691 lt!286535) (ite c!9496 (_2!8691 lt!286535) (_2!8691 lt!287182))))))

(declare-fun b!186035 () Bool)

(declare-fun e!128750 () Bool)

(declare-fun lt!287211 () tuple2!16094)

(declare-fun lt!287222 () tuple2!16088)

(assert (=> b!186035 (= e!128750 (= (_1!8692 lt!287211) (_2!8689 lt!287222)))))

(declare-fun b!186036 () Bool)

(declare-fun Unit!13305 () Unit!13288)

(assert (=> b!186036 (= e!128754 (tuple2!16093 Unit!13305 (_2!8691 lt!286535)))))

(declare-fun lt!287186 () Unit!13288)

(assert (=> b!186036 (= lt!287186 (lemmaIsPrefixRefl!0 (_2!8691 lt!286535)))))

(assert (=> b!186036 call!2993))

(declare-fun lt!287199 () Unit!13288)

(assert (=> b!186036 (= lt!287199 lt!287186)))

(declare-fun b!186037 () Bool)

(assert (=> b!186037 (= e!128756 (= (_1!8692 lt!287203) (_2!8689 lt!287172)))))

(declare-fun b!186038 () Bool)

(assert (=> b!186038 (= e!128754 (tuple2!16093 (_1!8691 lt!287182) (_2!8691 lt!287182)))))

(assert (=> b!186038 (= lt!287176 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186038 (= lt!287184 (appendBit!0 (_2!8691 lt!286535) lt!287176))))

(declare-fun res!154856 () Bool)

(assert (=> b!186038 (= res!154856 (= (size!4329 (buf!4789 (_2!8691 lt!286535))) (size!4329 (buf!4789 (_2!8691 lt!287184)))))))

(assert (=> b!186038 (=> (not res!154856) (not e!128749))))

(assert (=> b!186038 e!128749))

(declare-fun lt!287188 () tuple2!16092)

(assert (=> b!186038 (= lt!287188 lt!287184)))

(assert (=> b!186038 (= lt!287182 (appendBitsLSBFirstLoopTR!0 (_2!8691 lt!287188) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!287213 () Unit!13288)

(assert (=> b!186038 (= lt!287213 (lemmaIsPrefixTransitive!0 (_2!8691 lt!286535) (_2!8691 lt!287188) (_2!8691 lt!287182)))))

(assert (=> b!186038 call!2993))

(declare-fun lt!287191 () Unit!13288)

(assert (=> b!186038 (= lt!287191 lt!287213)))

(assert (=> b!186038 (invariant!0 (currentBit!9028 (_2!8691 lt!286535)) (currentByte!9033 (_2!8691 lt!286535)) (size!4329 (buf!4789 (_2!8691 lt!287188))))))

(declare-fun lt!287210 () BitStream!7766)

(assert (=> b!186038 (= lt!287210 (BitStream!7767 (buf!4789 (_2!8691 lt!287188)) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))))))

(assert (=> b!186038 (invariant!0 (currentBit!9028 lt!287210) (currentByte!9033 lt!287210) (size!4329 (buf!4789 (_2!8691 lt!287182))))))

(declare-fun lt!287202 () BitStream!7766)

(assert (=> b!186038 (= lt!287202 (BitStream!7767 (buf!4789 (_2!8691 lt!287182)) (currentByte!9033 lt!287210) (currentBit!9028 lt!287210)))))

(assert (=> b!186038 (= lt!287216 (readBitPure!0 lt!287210))))

(assert (=> b!186038 (= lt!287206 (readBitPure!0 lt!287202))))

(declare-fun lt!287183 () Unit!13288)

(assert (=> b!186038 (= lt!287183 (readBitPrefixLemma!0 lt!287210 (_2!8691 lt!287182)))))

(declare-fun res!154862 () Bool)

(assert (=> b!186038 (= res!154862 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!287216))) (currentByte!9033 (_1!8690 lt!287216)) (currentBit!9028 (_1!8690 lt!287216))) (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!287206))) (currentByte!9033 (_1!8690 lt!287206)) (currentBit!9028 (_1!8690 lt!287206)))))))

(assert (=> b!186038 (=> (not res!154862) (not e!128755))))

(assert (=> b!186038 e!128755))

(declare-fun lt!287167 () Unit!13288)

(assert (=> b!186038 (= lt!287167 lt!287183)))

(declare-fun lt!287204 () tuple2!16088)

(assert (=> b!186038 (= lt!287204 (reader!0 (_2!8691 lt!286535) (_2!8691 lt!287182)))))

(declare-fun lt!287220 () tuple2!16088)

(assert (=> b!186038 (= lt!287220 (reader!0 (_2!8691 lt!287188) (_2!8691 lt!287182)))))

(declare-fun lt!287212 () tuple2!16090)

(assert (=> b!186038 (= lt!287212 (readBitPure!0 (_1!8689 lt!287204)))))

(assert (=> b!186038 (= (_2!8690 lt!287212) lt!287176)))

(declare-fun lt!287181 () Unit!13288)

(declare-fun Unit!13306 () Unit!13288)

(assert (=> b!186038 (= lt!287181 Unit!13306)))

(declare-fun lt!287174 () (_ BitVec 64))

(assert (=> b!186038 (= lt!287174 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287177 () (_ BitVec 64))

(assert (=> b!186038 (= lt!287177 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287168 () Unit!13288)

(assert (=> b!186038 (= lt!287168 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!287182)) lt!287177))))

(assert (=> b!186038 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!287182)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!287177)))

(declare-fun lt!287197 () Unit!13288)

(assert (=> b!186038 (= lt!287197 lt!287168)))

(declare-fun lt!287205 () tuple2!16094)

(assert (=> b!186038 (= lt!287205 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!287204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287174))))

(declare-fun lt!287170 () (_ BitVec 64))

(assert (=> b!186038 (= lt!287170 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!287175 () Unit!13288)

(assert (=> b!186038 (= lt!287175 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!287188) (buf!4789 (_2!8691 lt!287182)) lt!287170))))

(assert (=> b!186038 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!287182)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!287188))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!287188))) lt!287170)))

(declare-fun lt!287208 () Unit!13288)

(assert (=> b!186038 (= lt!287208 lt!287175)))

(declare-fun lt!287215 () tuple2!16094)

(assert (=> b!186038 (= lt!287215 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!287220) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!287174 (ite (_2!8690 lt!287212) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!287173 () tuple2!16094)

(assert (=> b!186038 (= lt!287173 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!287204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287174))))

(declare-fun c!9495 () Bool)

(assert (=> b!186038 (= c!9495 (_2!8690 (readBitPure!0 (_1!8689 lt!287204))))))

(declare-fun lt!287178 () tuple2!16094)

(assert (=> b!186038 (= lt!287178 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8689 lt!287204) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!287174 e!128748)))))

(declare-fun lt!287192 () Unit!13288)

(assert (=> b!186038 (= lt!287192 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8689 lt!287204) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!287174))))

(assert (=> b!186038 (and (= (_2!8692 lt!287173) (_2!8692 lt!287178)) (= (_1!8692 lt!287173) (_1!8692 lt!287178)))))

(declare-fun lt!287219 () Unit!13288)

(assert (=> b!186038 (= lt!287219 lt!287192)))

(assert (=> b!186038 (= (_1!8689 lt!287204) (withMovedBitIndex!0 (_2!8689 lt!287204) (bvsub (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287182))) (currentByte!9033 (_2!8691 lt!287182)) (currentBit!9028 (_2!8691 lt!287182))))))))

(declare-fun lt!287207 () Unit!13288)

(declare-fun Unit!13307 () Unit!13288)

(assert (=> b!186038 (= lt!287207 Unit!13307)))

(assert (=> b!186038 (= (_1!8689 lt!287220) (withMovedBitIndex!0 (_2!8689 lt!287220) (bvsub (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287188))) (currentByte!9033 (_2!8691 lt!287188)) (currentBit!9028 (_2!8691 lt!287188))) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287182))) (currentByte!9033 (_2!8691 lt!287182)) (currentBit!9028 (_2!8691 lt!287182))))))))

(declare-fun lt!287187 () Unit!13288)

(declare-fun Unit!13308 () Unit!13288)

(assert (=> b!186038 (= lt!287187 Unit!13308)))

(assert (=> b!186038 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) (bvsub (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287188))) (currentByte!9033 (_2!8691 lt!287188)) (currentBit!9028 (_2!8691 lt!287188))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!287221 () Unit!13288)

(declare-fun Unit!13309 () Unit!13288)

(assert (=> b!186038 (= lt!287221 Unit!13309)))

(assert (=> b!186038 (= (_2!8692 lt!287205) (_2!8692 lt!287215))))

(declare-fun lt!287200 () Unit!13288)

(declare-fun Unit!13310 () Unit!13288)

(assert (=> b!186038 (= lt!287200 Unit!13310)))

(assert (=> b!186038 (invariant!0 (currentBit!9028 (_2!8691 lt!287182)) (currentByte!9033 (_2!8691 lt!287182)) (size!4329 (buf!4789 (_2!8691 lt!287182))))))

(declare-fun lt!287201 () Unit!13288)

(declare-fun Unit!13311 () Unit!13288)

(assert (=> b!186038 (= lt!287201 Unit!13311)))

(assert (=> b!186038 (= (size!4329 (buf!4789 (_2!8691 lt!286535))) (size!4329 (buf!4789 (_2!8691 lt!287182))))))

(declare-fun lt!287214 () Unit!13288)

(declare-fun Unit!13312 () Unit!13288)

(assert (=> b!186038 (= lt!287214 Unit!13312)))

(assert (=> b!186038 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287182))) (currentByte!9033 (_2!8691 lt!287182)) (currentBit!9028 (_2!8691 lt!287182))) (bvsub (bvadd (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287195 () Unit!13288)

(declare-fun Unit!13313 () Unit!13288)

(assert (=> b!186038 (= lt!287195 Unit!13313)))

(declare-fun lt!287179 () Unit!13288)

(declare-fun Unit!13314 () Unit!13288)

(assert (=> b!186038 (= lt!287179 Unit!13314)))

(assert (=> b!186038 (= lt!287222 (reader!0 (_2!8691 lt!286535) (_2!8691 lt!287182)))))

(declare-fun lt!287217 () (_ BitVec 64))

(assert (=> b!186038 (= lt!287217 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!287209 () Unit!13288)

(assert (=> b!186038 (= lt!287209 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8691 lt!286535) (buf!4789 (_2!8691 lt!287182)) lt!287217))))

(assert (=> b!186038 (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!287182)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535))) lt!287217)))

(declare-fun lt!287194 () Unit!13288)

(assert (=> b!186038 (= lt!287194 lt!287209)))

(assert (=> b!186038 (= lt!287211 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!287222) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!154855 () Bool)

(assert (=> b!186038 (= res!154855 (= (_2!8692 lt!287211) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!186038 (=> (not res!154855) (not e!128750))))

(assert (=> b!186038 e!128750))

(declare-fun lt!287169 () Unit!13288)

(declare-fun Unit!13315 () Unit!13288)

(assert (=> b!186038 (= lt!287169 Unit!13315)))

(declare-fun b!186039 () Bool)

(declare-fun res!154857 () Bool)

(assert (=> b!186039 (=> (not res!154857) (not e!128751))))

(assert (=> b!186039 (= res!154857 (isPrefixOf!0 (_2!8691 lt!286535) (_2!8691 lt!287218)))))

(assert (= (and d!64095 c!9496) b!186036))

(assert (= (and d!64095 (not c!9496)) b!186038))

(assert (= (and b!186038 res!154856) b!186030))

(assert (= (and b!186030 res!154859) b!186024))

(assert (= (and b!186024 res!154860) b!186028))

(assert (= (and b!186028 res!154852) b!186025))

(assert (= (and b!186038 res!154862) b!186027))

(assert (= (and b!186038 c!9495) b!186034))

(assert (= (and b!186038 (not c!9495)) b!186032))

(assert (= (and b!186038 res!154855) b!186035))

(assert (= (or b!186036 b!186038) bm!2990))

(assert (= (and d!64095 res!154861) b!186033))

(assert (= (and b!186033 res!154854) b!186026))

(assert (= (and b!186026 res!154863) b!186039))

(assert (= (and b!186039 res!154857) b!186029))

(assert (= (and b!186029 res!154858) b!186031))

(assert (= (and b!186029 res!154853) b!186037))

(declare-fun m!289183 () Bool)

(assert (=> b!186039 m!289183))

(declare-fun m!289185 () Bool)

(assert (=> bm!2990 m!289185))

(declare-fun m!289187 () Bool)

(assert (=> b!186024 m!289187))

(declare-fun m!289189 () Bool)

(assert (=> b!186029 m!289189))

(declare-fun m!289191 () Bool)

(assert (=> b!186029 m!289191))

(declare-fun m!289193 () Bool)

(assert (=> b!186029 m!289193))

(declare-fun m!289195 () Bool)

(assert (=> b!186029 m!289195))

(declare-fun m!289197 () Bool)

(assert (=> b!186029 m!289197))

(declare-fun m!289199 () Bool)

(assert (=> b!186029 m!289199))

(declare-fun m!289201 () Bool)

(assert (=> b!186031 m!289201))

(declare-fun m!289203 () Bool)

(assert (=> b!186038 m!289203))

(declare-fun m!289205 () Bool)

(assert (=> b!186038 m!289205))

(declare-fun m!289207 () Bool)

(assert (=> b!186038 m!289207))

(declare-fun m!289209 () Bool)

(assert (=> b!186038 m!289209))

(declare-fun m!289211 () Bool)

(assert (=> b!186038 m!289211))

(declare-fun m!289213 () Bool)

(assert (=> b!186038 m!289213))

(declare-fun m!289215 () Bool)

(assert (=> b!186038 m!289215))

(declare-fun m!289219 () Bool)

(assert (=> b!186038 m!289219))

(declare-fun m!289221 () Bool)

(assert (=> b!186038 m!289221))

(declare-fun m!289223 () Bool)

(assert (=> b!186038 m!289223))

(declare-fun m!289225 () Bool)

(assert (=> b!186038 m!289225))

(declare-fun m!289227 () Bool)

(assert (=> b!186038 m!289227))

(declare-fun m!289229 () Bool)

(assert (=> b!186038 m!289229))

(declare-fun m!289231 () Bool)

(assert (=> b!186038 m!289231))

(declare-fun m!289233 () Bool)

(assert (=> b!186038 m!289233))

(declare-fun m!289235 () Bool)

(assert (=> b!186038 m!289235))

(declare-fun m!289237 () Bool)

(assert (=> b!186038 m!289237))

(declare-fun m!289241 () Bool)

(assert (=> b!186038 m!289241))

(declare-fun m!289243 () Bool)

(assert (=> b!186038 m!289243))

(declare-fun m!289245 () Bool)

(assert (=> b!186038 m!289245))

(declare-fun m!289247 () Bool)

(assert (=> b!186038 m!289247))

(declare-fun m!289249 () Bool)

(assert (=> b!186038 m!289249))

(declare-fun m!289251 () Bool)

(assert (=> b!186038 m!289251))

(assert (=> b!186038 m!289193))

(declare-fun m!289253 () Bool)

(assert (=> b!186038 m!289253))

(declare-fun m!289255 () Bool)

(assert (=> b!186038 m!289255))

(declare-fun m!289259 () Bool)

(assert (=> b!186038 m!289259))

(assert (=> b!186038 m!289195))

(assert (=> b!186038 m!289221))

(declare-fun m!289261 () Bool)

(assert (=> b!186038 m!289261))

(assert (=> b!186038 m!288829))

(declare-fun m!289263 () Bool)

(assert (=> b!186038 m!289263))

(declare-fun m!289265 () Bool)

(assert (=> b!186038 m!289265))

(declare-fun m!289267 () Bool)

(assert (=> b!186038 m!289267))

(declare-fun m!289269 () Bool)

(assert (=> b!186026 m!289269))

(assert (=> b!186026 m!288829))

(declare-fun m!289271 () Bool)

(assert (=> b!186028 m!289271))

(assert (=> b!186028 m!289271))

(declare-fun m!289273 () Bool)

(assert (=> b!186028 m!289273))

(declare-fun m!289275 () Bool)

(assert (=> d!64095 m!289275))

(declare-fun m!289277 () Bool)

(assert (=> b!186030 m!289277))

(assert (=> b!186030 m!288829))

(declare-fun m!289279 () Bool)

(assert (=> b!186025 m!289279))

(assert (=> b!186025 m!289277))

(assert (=> b!186036 m!288909))

(assert (=> b!185802 d!64095))

(declare-fun d!64151 () Bool)

(declare-fun e!128761 () Bool)

(assert (=> d!64151 e!128761))

(declare-fun res!154870 () Bool)

(assert (=> d!64151 (=> (not res!154870) (not e!128761))))

(declare-fun lt!287246 () (_ BitVec 64))

(declare-fun lt!287245 () BitStream!7766)

(assert (=> d!64151 (= res!154870 (= (bvadd lt!287246 (bvsub lt!286525 lt!286538)) (bitIndex!0 (size!4329 (buf!4789 lt!287245)) (currentByte!9033 lt!287245) (currentBit!9028 lt!287245))))))

(assert (=> d!64151 (or (not (= (bvand lt!287246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!286525 lt!286538) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287246 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287246 (bvsub lt!286525 lt!286538)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64151 (= lt!287246 (bitIndex!0 (size!4329 (buf!4789 (_2!8689 lt!286531))) (currentByte!9033 (_2!8689 lt!286531)) (currentBit!9028 (_2!8689 lt!286531))))))

(declare-fun moveBitIndex!0 (BitStream!7766 (_ BitVec 64)) tuple2!16092)

(assert (=> d!64151 (= lt!287245 (_2!8691 (moveBitIndex!0 (_2!8689 lt!286531) (bvsub lt!286525 lt!286538))))))

(assert (=> d!64151 (moveBitIndexPrecond!0 (_2!8689 lt!286531) (bvsub lt!286525 lt!286538))))

(assert (=> d!64151 (= (withMovedBitIndex!0 (_2!8689 lt!286531) (bvsub lt!286525 lt!286538)) lt!287245)))

(declare-fun b!186046 () Bool)

(assert (=> b!186046 (= e!128761 (= (size!4329 (buf!4789 (_2!8689 lt!286531))) (size!4329 (buf!4789 lt!287245))))))

(assert (= (and d!64151 res!154870) b!186046))

(declare-fun m!289281 () Bool)

(assert (=> d!64151 m!289281))

(declare-fun m!289283 () Bool)

(assert (=> d!64151 m!289283))

(declare-fun m!289285 () Bool)

(assert (=> d!64151 m!289285))

(declare-fun m!289287 () Bool)

(assert (=> d!64151 m!289287))

(assert (=> b!185800 d!64151))

(declare-fun d!64153 () Bool)

(declare-fun res!154877 () Bool)

(declare-fun e!128766 () Bool)

(assert (=> d!64153 (=> (not res!154877) (not e!128766))))

(assert (=> d!64153 (= res!154877 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8689 lt!286544))))) (bvsub lt!286543 lt!286538)) (bvsle (bvsub lt!286543 lt!286538) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8689 lt!286544))))))))))

(assert (=> d!64153 (= (moveBitIndexPrecond!0 (_2!8689 lt!286544) (bvsub lt!286543 lt!286538)) e!128766)))

(declare-fun b!186054 () Bool)

(declare-fun lt!287261 () (_ BitVec 64))

(assert (=> b!186054 (= e!128766 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287261) (bvsle lt!287261 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8689 lt!286544))))))))))

(assert (=> b!186054 (= lt!287261 (bvadd (bitIndex!0 (size!4329 (buf!4789 (_2!8689 lt!286544))) (currentByte!9033 (_2!8689 lt!286544)) (currentBit!9028 (_2!8689 lt!286544))) (bvsub lt!286543 lt!286538)))))

(assert (= (and d!64153 res!154877) b!186054))

(declare-fun m!289295 () Bool)

(assert (=> b!186054 m!289295))

(assert (=> b!185811 d!64153))

(declare-fun d!64159 () Bool)

(declare-fun lt!287275 () tuple2!16094)

(declare-fun lt!287278 () tuple2!16094)

(assert (=> d!64159 (and (= (_2!8692 lt!287275) (_2!8692 lt!287278)) (= (_1!8692 lt!287275) (_1!8692 lt!287278)))))

(declare-fun lt!287277 () BitStream!7766)

(declare-fun lt!287274 () (_ BitVec 64))

(declare-fun lt!287279 () Unit!13288)

(declare-fun lt!287276 () Bool)

(declare-fun choose!56 (BitStream!7766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!16094 tuple2!16094 BitStream!7766 (_ BitVec 64) Bool BitStream!7766 (_ BitVec 64) tuple2!16094 tuple2!16094 BitStream!7766 (_ BitVec 64)) Unit!13288)

(assert (=> d!64159 (= lt!287279 (choose!56 (_1!8689 lt!286531) nBits!348 i!590 lt!286539 lt!287275 (tuple2!16095 (_1!8692 lt!287275) (_2!8692 lt!287275)) (_1!8692 lt!287275) (_2!8692 lt!287275) lt!287276 lt!287277 lt!287274 lt!287278 (tuple2!16095 (_1!8692 lt!287278) (_2!8692 lt!287278)) (_1!8692 lt!287278) (_2!8692 lt!287278)))))

(assert (=> d!64159 (= lt!287278 (readNBitsLSBFirstsLoopPure!0 lt!287277 nBits!348 (bvadd i!590 #b00000000000000000000000000000001) lt!287274))))

(assert (=> d!64159 (= lt!287274 (bvor lt!286539 (ite lt!287276 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64159 (= lt!287277 (withMovedBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!64159 (= lt!287276 (_2!8690 (readBitPure!0 (_1!8689 lt!286531))))))

(assert (=> d!64159 (= lt!287275 (readNBitsLSBFirstsLoopPure!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539))))

(assert (=> d!64159 (= (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8689 lt!286531) nBits!348 i!590 lt!286539) lt!287279)))

(declare-fun bs!15969 () Bool)

(assert (= bs!15969 d!64159))

(declare-fun m!289297 () Bool)

(assert (=> bs!15969 m!289297))

(assert (=> bs!15969 m!288823))

(assert (=> bs!15969 m!288783))

(assert (=> bs!15969 m!288785))

(declare-fun m!289299 () Bool)

(assert (=> bs!15969 m!289299))

(assert (=> b!185811 d!64159))

(declare-fun d!64161 () Bool)

(declare-fun lt!287280 () tuple2!16102)

(assert (=> d!64161 (= lt!287280 (readNBitsLSBFirstsLoop!0 (withMovedBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548))))

(assert (=> d!64161 (= (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286548) (tuple2!16095 (_2!8696 lt!287280) (_1!8696 lt!287280)))))

(declare-fun bs!15970 () Bool)

(assert (= bs!15970 d!64161))

(assert (=> bs!15970 m!288823))

(declare-fun m!289301 () Bool)

(assert (=> bs!15970 m!289301))

(assert (=> b!185811 d!64161))

(declare-fun d!64163 () Bool)

(declare-fun e!128767 () Bool)

(assert (=> d!64163 e!128767))

(declare-fun res!154878 () Bool)

(assert (=> d!64163 (=> (not res!154878) (not e!128767))))

(declare-fun lt!287284 () (_ BitVec 64))

(declare-fun lt!287283 () BitStream!7766)

(assert (=> d!64163 (= res!154878 (= (bvadd lt!287284 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!4329 (buf!4789 lt!287283)) (currentByte!9033 lt!287283) (currentBit!9028 lt!287283))))))

(assert (=> d!64163 (or (not (= (bvand lt!287284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287284 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64163 (= lt!287284 (bitIndex!0 (size!4329 (buf!4789 (_1!8689 lt!286531))) (currentByte!9033 (_1!8689 lt!286531)) (currentBit!9028 (_1!8689 lt!286531))))))

(assert (=> d!64163 (= lt!287283 (_2!8691 (moveBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!64163 (moveBitIndexPrecond!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!64163 (= (withMovedBitIndex!0 (_1!8689 lt!286531) #b0000000000000000000000000000000000000000000000000000000000000001) lt!287283)))

(declare-fun b!186056 () Bool)

(assert (=> b!186056 (= e!128767 (= (size!4329 (buf!4789 (_1!8689 lt!286531))) (size!4329 (buf!4789 lt!287283))))))

(assert (= (and d!64163 res!154878) b!186056))

(declare-fun m!289303 () Bool)

(assert (=> d!64163 m!289303))

(declare-fun m!289305 () Bool)

(assert (=> d!64163 m!289305))

(declare-fun m!289307 () Bool)

(assert (=> d!64163 m!289307))

(declare-fun m!289309 () Bool)

(assert (=> d!64163 m!289309))

(assert (=> b!185811 d!64163))

(declare-fun d!64165 () Bool)

(assert (=> d!64165 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204))))))

(declare-fun bs!15971 () Bool)

(assert (= bs!15971 d!64165))

(assert (=> bs!15971 m!288765))

(assert (=> start!40428 d!64165))

(declare-fun d!64167 () Bool)

(declare-fun res!154887 () Bool)

(declare-fun e!128773 () Bool)

(assert (=> d!64167 (=> (not res!154887) (not e!128773))))

(assert (=> d!64167 (= res!154887 (= (size!4329 (buf!4789 thiss!1204)) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (=> d!64167 (= (isPrefixOf!0 thiss!1204 (_2!8691 lt!286535)) e!128773)))

(declare-fun b!186065 () Bool)

(declare-fun res!154888 () Bool)

(assert (=> b!186065 (=> (not res!154888) (not e!128773))))

(assert (=> b!186065 (= res!154888 (bvsle (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535)))))))

(declare-fun b!186066 () Bool)

(declare-fun e!128772 () Bool)

(assert (=> b!186066 (= e!128773 e!128772)))

(declare-fun res!154889 () Bool)

(assert (=> b!186066 (=> res!154889 e!128772)))

(assert (=> b!186066 (= res!154889 (= (size!4329 (buf!4789 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!186067 () Bool)

(assert (=> b!186067 (= e!128772 (arrayBitRangesEq!0 (buf!4789 thiss!1204) (buf!4789 (_2!8691 lt!286535)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204))))))

(assert (= (and d!64167 res!154887) b!186065))

(assert (= (and b!186065 res!154888) b!186066))

(assert (= (and b!186066 (not res!154889)) b!186067))

(assert (=> b!186065 m!288831))

(assert (=> b!186065 m!288829))

(assert (=> b!186067 m!288831))

(assert (=> b!186067 m!288831))

(declare-fun m!289311 () Bool)

(assert (=> b!186067 m!289311))

(assert (=> b!185809 d!64167))

(declare-fun d!64169 () Bool)

(declare-fun e!128774 () Bool)

(assert (=> d!64169 e!128774))

(declare-fun res!154890 () Bool)

(assert (=> d!64169 (=> (not res!154890) (not e!128774))))

(declare-fun lt!287296 () (_ BitVec 64))

(declare-fun lt!287293 () (_ BitVec 64))

(declare-fun lt!287292 () (_ BitVec 64))

(assert (=> d!64169 (= res!154890 (= lt!287296 (bvsub lt!287292 lt!287293)))))

(assert (=> d!64169 (or (= (bvand lt!287292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287293 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287292 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287292 lt!287293) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64169 (= lt!287293 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286535)))) ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535)))))))

(declare-fun lt!287291 () (_ BitVec 64))

(declare-fun lt!287295 () (_ BitVec 64))

(assert (=> d!64169 (= lt!287292 (bvmul lt!287291 lt!287295))))

(assert (=> d!64169 (or (= lt!287291 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287295 (bvsdiv (bvmul lt!287291 lt!287295) lt!287291)))))

(assert (=> d!64169 (= lt!287295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64169 (= lt!287291 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (=> d!64169 (= lt!287296 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 (_2!8691 lt!286535))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 (_2!8691 lt!286535)))))))

(assert (=> d!64169 (invariant!0 (currentBit!9028 (_2!8691 lt!286535)) (currentByte!9033 (_2!8691 lt!286535)) (size!4329 (buf!4789 (_2!8691 lt!286535))))))

(assert (=> d!64169 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!286535))) (currentByte!9033 (_2!8691 lt!286535)) (currentBit!9028 (_2!8691 lt!286535))) lt!287296)))

(declare-fun b!186068 () Bool)

(declare-fun res!154891 () Bool)

(assert (=> b!186068 (=> (not res!154891) (not e!128774))))

(assert (=> b!186068 (= res!154891 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287296))))

(declare-fun b!186069 () Bool)

(declare-fun lt!287294 () (_ BitVec 64))

(assert (=> b!186069 (= e!128774 (bvsle lt!287296 (bvmul lt!287294 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186069 (or (= lt!287294 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287294 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287294)))))

(assert (=> b!186069 (= lt!287294 ((_ sign_extend 32) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (= (and d!64169 res!154890) b!186068))

(assert (= (and b!186068 res!154891) b!186069))

(declare-fun m!289313 () Bool)

(assert (=> d!64169 m!289313))

(declare-fun m!289315 () Bool)

(assert (=> d!64169 m!289315))

(assert (=> b!185810 d!64169))

(declare-fun d!64171 () Bool)

(declare-fun e!128775 () Bool)

(assert (=> d!64171 e!128775))

(declare-fun res!154892 () Bool)

(assert (=> d!64171 (=> (not res!154892) (not e!128775))))

(declare-fun lt!287299 () (_ BitVec 64))

(declare-fun lt!287302 () (_ BitVec 64))

(declare-fun lt!287298 () (_ BitVec 64))

(assert (=> d!64171 (= res!154892 (= lt!287302 (bvsub lt!287298 lt!287299)))))

(assert (=> d!64171 (or (= (bvand lt!287298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287299 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!287298 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!287298 lt!287299) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!64171 (= lt!287299 (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204))))))

(declare-fun lt!287297 () (_ BitVec 64))

(declare-fun lt!287301 () (_ BitVec 64))

(assert (=> d!64171 (= lt!287298 (bvmul lt!287297 lt!287301))))

(assert (=> d!64171 (or (= lt!287297 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!287301 (bvsdiv (bvmul lt!287297 lt!287301) lt!287297)))))

(assert (=> d!64171 (= lt!287301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!64171 (= lt!287297 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))))))

(assert (=> d!64171 (= lt!287302 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9033 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9028 thiss!1204))))))

(assert (=> d!64171 (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204)))))

(assert (=> d!64171 (= (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)) lt!287302)))

(declare-fun b!186070 () Bool)

(declare-fun res!154893 () Bool)

(assert (=> b!186070 (=> (not res!154893) (not e!128775))))

(assert (=> b!186070 (= res!154893 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!287302))))

(declare-fun b!186071 () Bool)

(declare-fun lt!287300 () (_ BitVec 64))

(assert (=> b!186071 (= e!128775 (bvsle lt!287302 (bvmul lt!287300 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!186071 (or (= lt!287300 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!287300 #b0000000000000000000000000000000000000000000000000000000000001000) lt!287300)))))

(assert (=> b!186071 (= lt!287300 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))))))

(assert (= (and d!64171 res!154892) b!186070))

(assert (= (and b!186070 res!154893) b!186071))

(declare-fun m!289317 () Bool)

(assert (=> d!64171 m!289317))

(assert (=> d!64171 m!288765))

(assert (=> b!185810 d!64171))

(declare-fun d!64173 () Bool)

(declare-fun e!128792 () Bool)

(assert (=> d!64173 e!128792))

(declare-fun res!154921 () Bool)

(assert (=> d!64173 (=> (not res!154921) (not e!128792))))

(declare-fun lt!287329 () tuple2!16092)

(assert (=> d!64173 (= res!154921 (= (size!4329 (buf!4789 thiss!1204)) (size!4329 (buf!4789 (_2!8691 lt!287329)))))))

(declare-fun choose!16 (BitStream!7766 Bool) tuple2!16092)

(assert (=> d!64173 (= lt!287329 (choose!16 thiss!1204 lt!286540))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!64173 (validate_offset_bit!0 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)))))

(assert (=> d!64173 (= (appendBit!0 thiss!1204 lt!286540) lt!287329)))

(declare-fun b!186099 () Bool)

(declare-fun res!154923 () Bool)

(assert (=> b!186099 (=> (not res!154923) (not e!128792))))

(declare-fun lt!287327 () (_ BitVec 64))

(declare-fun lt!287328 () (_ BitVec 64))

(assert (=> b!186099 (= res!154923 (= (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287329))) (currentByte!9033 (_2!8691 lt!287329)) (currentBit!9028 (_2!8691 lt!287329))) (bvadd lt!287327 lt!287328)))))

(assert (=> b!186099 (or (not (= (bvand lt!287327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!287328 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!287327 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!287327 lt!287328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!186099 (= lt!287328 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!186099 (= lt!287327 (bitIndex!0 (size!4329 (buf!4789 thiss!1204)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(declare-fun b!186101 () Bool)

(declare-fun e!128793 () Bool)

(assert (=> b!186101 (= e!128792 e!128793)))

(declare-fun res!154922 () Bool)

(assert (=> b!186101 (=> (not res!154922) (not e!128793))))

(declare-fun lt!287330 () tuple2!16090)

(assert (=> b!186101 (= res!154922 (and (= (_2!8690 lt!287330) lt!286540) (= (_1!8690 lt!287330) (_2!8691 lt!287329))))))

(assert (=> b!186101 (= lt!287330 (readBitPure!0 (readerFrom!0 (_2!8691 lt!287329) (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204))))))

(declare-fun b!186100 () Bool)

(declare-fun res!154924 () Bool)

(assert (=> b!186100 (=> (not res!154924) (not e!128792))))

(assert (=> b!186100 (= res!154924 (isPrefixOf!0 thiss!1204 (_2!8691 lt!287329)))))

(declare-fun b!186102 () Bool)

(assert (=> b!186102 (= e!128793 (= (bitIndex!0 (size!4329 (buf!4789 (_1!8690 lt!287330))) (currentByte!9033 (_1!8690 lt!287330)) (currentBit!9028 (_1!8690 lt!287330))) (bitIndex!0 (size!4329 (buf!4789 (_2!8691 lt!287329))) (currentByte!9033 (_2!8691 lt!287329)) (currentBit!9028 (_2!8691 lt!287329)))))))

(assert (= (and d!64173 res!154921) b!186099))

(assert (= (and b!186099 res!154923) b!186100))

(assert (= (and b!186100 res!154924) b!186101))

(assert (= (and b!186101 res!154922) b!186102))

(declare-fun m!289343 () Bool)

(assert (=> b!186102 m!289343))

(declare-fun m!289345 () Bool)

(assert (=> b!186102 m!289345))

(assert (=> b!186099 m!289345))

(assert (=> b!186099 m!288831))

(declare-fun m!289347 () Bool)

(assert (=> d!64173 m!289347))

(declare-fun m!289349 () Bool)

(assert (=> d!64173 m!289349))

(declare-fun m!289351 () Bool)

(assert (=> b!186100 m!289351))

(declare-fun m!289353 () Bool)

(assert (=> b!186101 m!289353))

(assert (=> b!186101 m!289353))

(declare-fun m!289355 () Bool)

(assert (=> b!186101 m!289355))

(assert (=> b!185810 d!64173))

(declare-fun d!64197 () Bool)

(assert (=> d!64197 (= (invariant!0 (currentBit!9028 (_2!8691 lt!286549)) (currentByte!9033 (_2!8691 lt!286549)) (size!4329 (buf!4789 (_2!8691 lt!286549)))) (and (bvsge (currentBit!9028 (_2!8691 lt!286549)) #b00000000000000000000000000000000) (bvslt (currentBit!9028 (_2!8691 lt!286549)) #b00000000000000000000000000001000) (bvsge (currentByte!9033 (_2!8691 lt!286549)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9033 (_2!8691 lt!286549)) (size!4329 (buf!4789 (_2!8691 lt!286549)))) (and (= (currentBit!9028 (_2!8691 lt!286549)) #b00000000000000000000000000000000) (= (currentByte!9033 (_2!8691 lt!286549)) (size!4329 (buf!4789 (_2!8691 lt!286549))))))))))

(assert (=> b!185808 d!64197))

(declare-fun d!64199 () Bool)

(assert (=> d!64199 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204)) lt!286546) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4329 (buf!4789 thiss!1204))) ((_ sign_extend 32) (currentByte!9033 thiss!1204)) ((_ sign_extend 32) (currentBit!9028 thiss!1204))) lt!286546))))

(declare-fun bs!15975 () Bool)

(assert (= bs!15975 d!64199))

(assert (=> bs!15975 m!289317))

(assert (=> b!185817 d!64199))

(assert (=> b!185805 d!64169))

(assert (=> b!185805 d!64171))

(declare-fun d!64201 () Bool)

(assert (=> d!64201 (= (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286549)))) (and (bvsge (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9028 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9033 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286549)))) (and (= (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286549))))))))))

(assert (=> b!185816 d!64201))

(declare-fun d!64203 () Bool)

(declare-fun lt!287331 () tuple2!16100)

(assert (=> d!64203 (= lt!287331 (readBit!0 (readerFrom!0 (_2!8691 lt!286535) (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204))))))

(assert (=> d!64203 (= (readBitPure!0 (readerFrom!0 (_2!8691 lt!286535) (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204))) (tuple2!16091 (_2!8695 lt!287331) (_1!8695 lt!287331)))))

(declare-fun bs!15976 () Bool)

(assert (= bs!15976 d!64203))

(assert (=> bs!15976 m!288835))

(declare-fun m!289357 () Bool)

(assert (=> bs!15976 m!289357))

(assert (=> b!185806 d!64203))

(declare-fun d!64205 () Bool)

(declare-fun e!128796 () Bool)

(assert (=> d!64205 e!128796))

(declare-fun res!154928 () Bool)

(assert (=> d!64205 (=> (not res!154928) (not e!128796))))

(assert (=> d!64205 (= res!154928 (invariant!0 (currentBit!9028 (_2!8691 lt!286535)) (currentByte!9033 (_2!8691 lt!286535)) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (=> d!64205 (= (readerFrom!0 (_2!8691 lt!286535) (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204)) (BitStream!7767 (buf!4789 (_2!8691 lt!286535)) (currentByte!9033 thiss!1204) (currentBit!9028 thiss!1204)))))

(declare-fun b!186105 () Bool)

(assert (=> b!186105 (= e!128796 (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 (_2!8691 lt!286535)))))))

(assert (= (and d!64205 res!154928) b!186105))

(assert (=> d!64205 m!289315))

(assert (=> b!186105 m!288771))

(assert (=> b!185806 d!64205))

(assert (=> b!185804 d!64167))

(declare-fun d!64207 () Bool)

(assert (=> d!64207 (= (invariant!0 (currentBit!9028 thiss!1204) (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204))) (and (bvsge (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9028 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9033 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204))) (and (= (currentBit!9028 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9033 thiss!1204) (size!4329 (buf!4789 thiss!1204)))))))))

(assert (=> b!185815 d!64207))

(push 1)

(assert (not d!64063))

(assert (not b!186067))

(assert (not d!64165))

(assert (not d!64069))

(assert (not b!186036))

(assert (not b!186024))

(assert (not b!186100))

(assert (not b!186025))

(assert (not b!186030))

(assert (not b!186105))

(assert (not b!185855))

(assert (not d!64095))

(assert (not d!64205))

(assert (not d!64087))

(assert (not bm!2990))

(assert (not d!64071))

(assert (not b!186099))

(assert (not d!64203))

(assert (not b!185907))

(assert (not d!64085))

(assert (not d!64093))

(assert (not d!64083))

(assert (not b!185853))

(assert (not d!64199))

(assert (not b!186101))

(assert (not d!64051))

(assert (not d!64163))

(assert (not b!185893))

(assert (not b!186031))

(assert (not b!185905))

(assert (not d!64169))

(assert (not b!186026))

(assert (not b!186039))

(assert (not d!64161))

(assert (not b!186038))

(assert (not b!186102))

(assert (not b!186054))

(assert (not b!186029))

(assert (not b!185892))

(assert (not d!64047))

(assert (not d!64089))

(assert (not b!186028))

(assert (not d!64065))

(assert (not d!64173))

(assert (not d!64061))

(assert (not b!185894))

(assert (not b!185889))

(assert (not d!64081))

(assert (not d!64151))

(assert (not d!64079))

(assert (not b!185890))

(assert (not d!64159))

(assert (not b!185888))

(assert (not b!186065))

(assert (not d!64067))

(assert (not b!185895))

(assert (not b!185887))

(assert (not d!64171))

(assert (not d!64073))

(assert (not d!64077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

