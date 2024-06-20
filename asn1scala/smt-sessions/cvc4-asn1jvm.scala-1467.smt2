; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40218 () Bool)

(assert start!40218)

(declare-fun b!184507 () Bool)

(declare-fun e!127820 () Bool)

(declare-fun e!127813 () Bool)

(assert (=> b!184507 (= e!127820 (not e!127813))))

(declare-fun res!153519 () Bool)

(assert (=> b!184507 (=> res!153519 e!127813)))

(declare-fun lt!283729 () (_ BitVec 64))

(declare-fun lt!283741 () (_ BitVec 64))

(assert (=> b!184507 (= res!153519 (not (= lt!283729 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283741))))))

(declare-datatypes ((array!9786 0))(
  ( (array!9787 (arr!5247 (Array (_ BitVec 32) (_ BitVec 8))) (size!4317 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7742 0))(
  ( (BitStream!7743 (buf!4772 array!9786) (currentByte!9006 (_ BitVec 32)) (currentBit!9001 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13209 0))(
  ( (Unit!13210) )
))
(declare-datatypes ((tuple2!15972 0))(
  ( (tuple2!15973 (_1!8631 Unit!13209) (_2!8631 BitStream!7742)) )
))
(declare-fun lt!283730 () tuple2!15972)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184507 (= lt!283729 (bitIndex!0 (size!4317 (buf!4772 (_2!8631 lt!283730))) (currentByte!9006 (_2!8631 lt!283730)) (currentBit!9001 (_2!8631 lt!283730))))))

(declare-fun thiss!1204 () BitStream!7742)

(assert (=> b!184507 (= lt!283741 (bitIndex!0 (size!4317 (buf!4772 thiss!1204)) (currentByte!9006 thiss!1204) (currentBit!9001 thiss!1204)))))

(declare-fun e!127822 () Bool)

(assert (=> b!184507 e!127822))

(declare-fun res!153518 () Bool)

(assert (=> b!184507 (=> (not res!153518) (not e!127822))))

(assert (=> b!184507 (= res!153518 (= (size!4317 (buf!4772 thiss!1204)) (size!4317 (buf!4772 (_2!8631 lt!283730)))))))

(declare-fun lt!283739 () Bool)

(declare-fun appendBit!0 (BitStream!7742 Bool) tuple2!15972)

(assert (=> b!184507 (= lt!283730 (appendBit!0 thiss!1204 lt!283739))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!283742 () (_ BitVec 64))

(assert (=> b!184507 (= lt!283739 (not (= (bvand v!189 lt!283742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!184507 (= lt!283742 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!184508 () Bool)

(declare-fun res!153527 () Bool)

(assert (=> b!184508 (=> (not res!153527) (not e!127820))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!184508 (= res!153527 (not (= i!590 nBits!348)))))

(declare-fun b!184509 () Bool)

(declare-fun e!127811 () Bool)

(declare-fun e!127812 () Bool)

(assert (=> b!184509 (= e!127811 e!127812)))

(declare-fun res!153521 () Bool)

(assert (=> b!184509 (=> (not res!153521) (not e!127812))))

(declare-datatypes ((tuple2!15974 0))(
  ( (tuple2!15975 (_1!8632 BitStream!7742) (_2!8632 Bool)) )
))
(declare-fun lt!283736 () tuple2!15974)

(assert (=> b!184509 (= res!153521 (and (= (_2!8632 lt!283736) lt!283739) (= (_1!8632 lt!283736) (_2!8631 lt!283730))))))

(declare-fun readBitPure!0 (BitStream!7742) tuple2!15974)

(declare-fun readerFrom!0 (BitStream!7742 (_ BitVec 32) (_ BitVec 32)) BitStream!7742)

(assert (=> b!184509 (= lt!283736 (readBitPure!0 (readerFrom!0 (_2!8631 lt!283730) (currentBit!9001 thiss!1204) (currentByte!9006 thiss!1204))))))

(declare-fun b!184510 () Bool)

(declare-fun e!127821 () Bool)

(declare-fun array_inv!4058 (array!9786) Bool)

(assert (=> b!184510 (= e!127821 (array_inv!4058 (buf!4772 thiss!1204)))))

(declare-fun res!153528 () Bool)

(declare-fun e!127815 () Bool)

(assert (=> start!40218 (=> (not res!153528) (not e!127815))))

(assert (=> start!40218 (= res!153528 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40218 e!127815))

(assert (=> start!40218 true))

(declare-fun inv!12 (BitStream!7742) Bool)

(assert (=> start!40218 (and (inv!12 thiss!1204) e!127821)))

(declare-fun b!184511 () Bool)

(assert (=> b!184511 (= e!127822 e!127811)))

(declare-fun res!153523 () Bool)

(assert (=> b!184511 (=> (not res!153523) (not e!127811))))

(declare-fun lt!283737 () (_ BitVec 64))

(declare-fun lt!283740 () (_ BitVec 64))

(assert (=> b!184511 (= res!153523 (= lt!283737 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!283740)))))

(assert (=> b!184511 (= lt!283737 (bitIndex!0 (size!4317 (buf!4772 (_2!8631 lt!283730))) (currentByte!9006 (_2!8631 lt!283730)) (currentBit!9001 (_2!8631 lt!283730))))))

(assert (=> b!184511 (= lt!283740 (bitIndex!0 (size!4317 (buf!4772 thiss!1204)) (currentByte!9006 thiss!1204) (currentBit!9001 thiss!1204)))))

(declare-fun b!184512 () Bool)

(declare-fun res!153515 () Bool)

(declare-fun e!127819 () Bool)

(assert (=> b!184512 (=> res!153515 e!127819)))

(declare-fun isPrefixOf!0 (BitStream!7742 BitStream!7742) Bool)

(assert (=> b!184512 (= res!153515 (not (isPrefixOf!0 thiss!1204 (_2!8631 lt!283730))))))

(declare-fun b!184513 () Bool)

(declare-fun res!153526 () Bool)

(assert (=> b!184513 (=> res!153526 e!127819)))

(declare-fun lt!283752 () (_ BitVec 64))

(declare-fun lt!283747 () tuple2!15972)

(assert (=> b!184513 (= res!153526 (or (not (= (size!4317 (buf!4772 (_2!8631 lt!283747))) (size!4317 (buf!4772 thiss!1204)))) (not (= lt!283752 (bvsub (bvadd lt!283741 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!184514 () Bool)

(declare-fun e!127818 () Bool)

(declare-fun lt!283754 () tuple2!15974)

(declare-fun lt!283733 () tuple2!15974)

(assert (=> b!184514 (= e!127818 (= (_2!8632 lt!283754) (_2!8632 lt!283733)))))

(declare-fun b!184515 () Bool)

(assert (=> b!184515 (= e!127815 e!127820)))

(declare-fun res!153525 () Bool)

(assert (=> b!184515 (=> (not res!153525) (not e!127820))))

(declare-fun lt!283734 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!184515 (= res!153525 (validate_offset_bits!1 ((_ sign_extend 32) (size!4317 (buf!4772 thiss!1204))) ((_ sign_extend 32) (currentByte!9006 thiss!1204)) ((_ sign_extend 32) (currentBit!9001 thiss!1204)) lt!283734))))

(assert (=> b!184515 (= lt!283734 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!184516 () Bool)

(declare-fun e!127817 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!184516 (= e!127817 (invariant!0 (currentBit!9001 thiss!1204) (currentByte!9006 thiss!1204) (size!4317 (buf!4772 (_2!8631 lt!283747)))))))

(declare-fun b!184517 () Bool)

(declare-fun e!127816 () Bool)

(assert (=> b!184517 (= e!127819 e!127816)))

(declare-fun res!153517 () Bool)

(assert (=> b!184517 (=> res!153517 e!127816)))

(declare-datatypes ((tuple2!15976 0))(
  ( (tuple2!15977 (_1!8633 BitStream!7742) (_2!8633 BitStream!7742)) )
))
(declare-fun lt!283732 () tuple2!15976)

(declare-fun lt!283744 () (_ BitVec 64))

(declare-datatypes ((tuple2!15978 0))(
  ( (tuple2!15979 (_1!8634 BitStream!7742) (_2!8634 (_ BitVec 64))) )
))
(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15978)

(assert (=> b!184517 (= res!153517 (not (= (_1!8634 (readNBitsLSBFirstsLoopPure!0 (_1!8633 lt!283732) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283744)) (_2!8633 lt!283732))))))

(declare-fun lt!283748 () (_ BitVec 64))

(assert (=> b!184517 (validate_offset_bits!1 ((_ sign_extend 32) (size!4317 (buf!4772 (_2!8631 lt!283747)))) ((_ sign_extend 32) (currentByte!9006 (_2!8631 lt!283730))) ((_ sign_extend 32) (currentBit!9001 (_2!8631 lt!283730))) lt!283748)))

(declare-fun lt!283745 () Unit!13209)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7742 array!9786 (_ BitVec 64)) Unit!13209)

(assert (=> b!184517 (= lt!283745 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8631 lt!283730) (buf!4772 (_2!8631 lt!283747)) lt!283748))))

(assert (=> b!184517 (= lt!283748 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!283749 () tuple2!15974)

(declare-fun lt!283751 () (_ BitVec 64))

(assert (=> b!184517 (= lt!283744 (bvor lt!283751 (ite (_2!8632 lt!283749) lt!283742 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!283735 () tuple2!15978)

(declare-fun lt!283750 () tuple2!15976)

(assert (=> b!184517 (= lt!283735 (readNBitsLSBFirstsLoopPure!0 (_1!8633 lt!283750) nBits!348 i!590 lt!283751))))

(assert (=> b!184517 (validate_offset_bits!1 ((_ sign_extend 32) (size!4317 (buf!4772 (_2!8631 lt!283747)))) ((_ sign_extend 32) (currentByte!9006 thiss!1204)) ((_ sign_extend 32) (currentBit!9001 thiss!1204)) lt!283734)))

(declare-fun lt!283738 () Unit!13209)

(assert (=> b!184517 (= lt!283738 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4772 (_2!8631 lt!283747)) lt!283734))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!184517 (= lt!283751 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!184517 (= (_2!8632 lt!283749) lt!283739)))

(assert (=> b!184517 (= lt!283749 (readBitPure!0 (_1!8633 lt!283750)))))

(declare-fun reader!0 (BitStream!7742 BitStream!7742) tuple2!15976)

(assert (=> b!184517 (= lt!283732 (reader!0 (_2!8631 lt!283730) (_2!8631 lt!283747)))))

(assert (=> b!184517 (= lt!283750 (reader!0 thiss!1204 (_2!8631 lt!283747)))))

(assert (=> b!184517 e!127818))

(declare-fun res!153522 () Bool)

(assert (=> b!184517 (=> (not res!153522) (not e!127818))))

(assert (=> b!184517 (= res!153522 (= (bitIndex!0 (size!4317 (buf!4772 (_1!8632 lt!283754))) (currentByte!9006 (_1!8632 lt!283754)) (currentBit!9001 (_1!8632 lt!283754))) (bitIndex!0 (size!4317 (buf!4772 (_1!8632 lt!283733))) (currentByte!9006 (_1!8632 lt!283733)) (currentBit!9001 (_1!8632 lt!283733)))))))

(declare-fun lt!283753 () Unit!13209)

(declare-fun lt!283731 () BitStream!7742)

(declare-fun readBitPrefixLemma!0 (BitStream!7742 BitStream!7742) Unit!13209)

(assert (=> b!184517 (= lt!283753 (readBitPrefixLemma!0 lt!283731 (_2!8631 lt!283747)))))

(assert (=> b!184517 (= lt!283733 (readBitPure!0 (BitStream!7743 (buf!4772 (_2!8631 lt!283747)) (currentByte!9006 thiss!1204) (currentBit!9001 thiss!1204))))))

(assert (=> b!184517 (= lt!283754 (readBitPure!0 lt!283731))))

(assert (=> b!184517 e!127817))

(declare-fun res!153514 () Bool)

(assert (=> b!184517 (=> (not res!153514) (not e!127817))))

(assert (=> b!184517 (= res!153514 (invariant!0 (currentBit!9001 thiss!1204) (currentByte!9006 thiss!1204) (size!4317 (buf!4772 (_2!8631 lt!283730)))))))

(assert (=> b!184517 (= lt!283731 (BitStream!7743 (buf!4772 (_2!8631 lt!283730)) (currentByte!9006 thiss!1204) (currentBit!9001 thiss!1204)))))

(declare-fun b!184518 () Bool)

(assert (=> b!184518 (= e!127812 (= (bitIndex!0 (size!4317 (buf!4772 (_1!8632 lt!283736))) (currentByte!9006 (_1!8632 lt!283736)) (currentBit!9001 (_1!8632 lt!283736))) lt!283737))))

(declare-fun b!184519 () Bool)

(declare-fun res!153513 () Bool)

(assert (=> b!184519 (=> (not res!153513) (not e!127820))))

(assert (=> b!184519 (= res!153513 (invariant!0 (currentBit!9001 thiss!1204) (currentByte!9006 thiss!1204) (size!4317 (buf!4772 thiss!1204))))))

(declare-fun b!184520 () Bool)

(assert (=> b!184520 (= e!127816 true)))

(declare-fun lt!283746 () tuple2!15978)

(assert (=> b!184520 (and (= (_2!8634 lt!283735) (_2!8634 lt!283746)) (= (_1!8634 lt!283735) (_1!8634 lt!283746)))))

(declare-fun lt!283743 () Unit!13209)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13209)

(assert (=> b!184520 (= lt!283743 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8633 lt!283750) nBits!348 i!590 lt!283751))))

(declare-fun withMovedBitIndex!0 (BitStream!7742 (_ BitVec 64)) BitStream!7742)

(assert (=> b!184520 (= lt!283746 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8633 lt!283750) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!283744))))

(declare-fun b!184521 () Bool)

(declare-fun res!153512 () Bool)

(assert (=> b!184521 (=> res!153512 e!127819)))

(assert (=> b!184521 (= res!153512 (not (isPrefixOf!0 (_2!8631 lt!283730) (_2!8631 lt!283747))))))

(declare-fun b!184522 () Bool)

(declare-fun res!153520 () Bool)

(assert (=> b!184522 (=> res!153520 e!127819)))

(assert (=> b!184522 (= res!153520 (not (invariant!0 (currentBit!9001 (_2!8631 lt!283747)) (currentByte!9006 (_2!8631 lt!283747)) (size!4317 (buf!4772 (_2!8631 lt!283747))))))))

(declare-fun b!184523 () Bool)

(assert (=> b!184523 (= e!127813 e!127819)))

(declare-fun res!153516 () Bool)

(assert (=> b!184523 (=> res!153516 e!127819)))

(assert (=> b!184523 (= res!153516 (not (= lt!283752 (bvsub (bvsub (bvadd lt!283729 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!184523 (= lt!283752 (bitIndex!0 (size!4317 (buf!4772 (_2!8631 lt!283747))) (currentByte!9006 (_2!8631 lt!283747)) (currentBit!9001 (_2!8631 lt!283747))))))

(assert (=> b!184523 (isPrefixOf!0 thiss!1204 (_2!8631 lt!283747))))

(declare-fun lt!283728 () Unit!13209)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7742 BitStream!7742 BitStream!7742) Unit!13209)

(assert (=> b!184523 (= lt!283728 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8631 lt!283730) (_2!8631 lt!283747)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7742 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15972)

(assert (=> b!184523 (= lt!283747 (appendBitsLSBFirstLoopTR!0 (_2!8631 lt!283730) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!184524 () Bool)

(declare-fun res!153524 () Bool)

(assert (=> b!184524 (=> (not res!153524) (not e!127811))))

(assert (=> b!184524 (= res!153524 (isPrefixOf!0 thiss!1204 (_2!8631 lt!283730)))))

(assert (= (and start!40218 res!153528) b!184515))

(assert (= (and b!184515 res!153525) b!184519))

(assert (= (and b!184519 res!153513) b!184508))

(assert (= (and b!184508 res!153527) b!184507))

(assert (= (and b!184507 res!153518) b!184511))

(assert (= (and b!184511 res!153523) b!184524))

(assert (= (and b!184524 res!153524) b!184509))

(assert (= (and b!184509 res!153521) b!184518))

(assert (= (and b!184507 (not res!153519)) b!184523))

(assert (= (and b!184523 (not res!153516)) b!184522))

(assert (= (and b!184522 (not res!153520)) b!184513))

(assert (= (and b!184513 (not res!153526)) b!184521))

(assert (= (and b!184521 (not res!153512)) b!184512))

(assert (= (and b!184512 (not res!153515)) b!184517))

(assert (= (and b!184517 res!153514) b!184516))

(assert (= (and b!184517 res!153522) b!184514))

(assert (= (and b!184517 (not res!153517)) b!184520))

(assert (= start!40218 b!184510))

(declare-fun m!286655 () Bool)

(assert (=> b!184516 m!286655))

(declare-fun m!286657 () Bool)

(assert (=> b!184509 m!286657))

(assert (=> b!184509 m!286657))

(declare-fun m!286659 () Bool)

(assert (=> b!184509 m!286659))

(declare-fun m!286661 () Bool)

(assert (=> b!184511 m!286661))

(declare-fun m!286663 () Bool)

(assert (=> b!184511 m!286663))

(assert (=> b!184507 m!286661))

(assert (=> b!184507 m!286663))

(declare-fun m!286665 () Bool)

(assert (=> b!184507 m!286665))

(declare-fun m!286667 () Bool)

(assert (=> b!184524 m!286667))

(declare-fun m!286669 () Bool)

(assert (=> start!40218 m!286669))

(assert (=> b!184512 m!286667))

(declare-fun m!286671 () Bool)

(assert (=> b!184517 m!286671))

(declare-fun m!286673 () Bool)

(assert (=> b!184517 m!286673))

(declare-fun m!286675 () Bool)

(assert (=> b!184517 m!286675))

(declare-fun m!286677 () Bool)

(assert (=> b!184517 m!286677))

(declare-fun m!286679 () Bool)

(assert (=> b!184517 m!286679))

(declare-fun m!286681 () Bool)

(assert (=> b!184517 m!286681))

(declare-fun m!286683 () Bool)

(assert (=> b!184517 m!286683))

(declare-fun m!286685 () Bool)

(assert (=> b!184517 m!286685))

(declare-fun m!286687 () Bool)

(assert (=> b!184517 m!286687))

(declare-fun m!286689 () Bool)

(assert (=> b!184517 m!286689))

(declare-fun m!286691 () Bool)

(assert (=> b!184517 m!286691))

(declare-fun m!286693 () Bool)

(assert (=> b!184517 m!286693))

(declare-fun m!286695 () Bool)

(assert (=> b!184517 m!286695))

(declare-fun m!286697 () Bool)

(assert (=> b!184517 m!286697))

(declare-fun m!286699 () Bool)

(assert (=> b!184517 m!286699))

(declare-fun m!286701 () Bool)

(assert (=> b!184517 m!286701))

(declare-fun m!286703 () Bool)

(assert (=> b!184523 m!286703))

(declare-fun m!286705 () Bool)

(assert (=> b!184523 m!286705))

(declare-fun m!286707 () Bool)

(assert (=> b!184523 m!286707))

(declare-fun m!286709 () Bool)

(assert (=> b!184523 m!286709))

(declare-fun m!286711 () Bool)

(assert (=> b!184518 m!286711))

(declare-fun m!286713 () Bool)

(assert (=> b!184515 m!286713))

(declare-fun m!286715 () Bool)

(assert (=> b!184521 m!286715))

(declare-fun m!286717 () Bool)

(assert (=> b!184519 m!286717))

(declare-fun m!286719 () Bool)

(assert (=> b!184522 m!286719))

(declare-fun m!286721 () Bool)

(assert (=> b!184520 m!286721))

(declare-fun m!286723 () Bool)

(assert (=> b!184520 m!286723))

(assert (=> b!184520 m!286723))

(declare-fun m!286725 () Bool)

(assert (=> b!184520 m!286725))

(declare-fun m!286727 () Bool)

(assert (=> b!184510 m!286727))

(push 1)

(assert (not b!184516))

(assert (not b!184523))

(assert (not b!184512))

(assert (not b!184520))

(assert (not b!184522))

(assert (not b!184511))

(assert (not b!184507))

(assert (not b!184521))

