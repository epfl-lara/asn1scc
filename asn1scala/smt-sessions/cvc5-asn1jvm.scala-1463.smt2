; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40190 () Bool)

(assert start!40190)

(declare-fun b!183652 () Bool)

(declare-fun e!127314 () Bool)

(declare-fun e!127310 () Bool)

(assert (=> b!183652 (= e!127314 e!127310)))

(declare-fun res!152706 () Bool)

(assert (=> b!183652 (=> (not res!152706) (not e!127310))))

(declare-datatypes ((array!9758 0))(
  ( (array!9759 (arr!5233 (Array (_ BitVec 32) (_ BitVec 8))) (size!4303 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7714 0))(
  ( (BitStream!7715 (buf!4758 array!9758) (currentByte!8992 (_ BitVec 32)) (currentBit!8987 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7714)

(declare-fun lt!282621 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!183652 (= res!152706 (validate_offset_bits!1 ((_ sign_extend 32) (size!4303 (buf!4758 thiss!1204))) ((_ sign_extend 32) (currentByte!8992 thiss!1204)) ((_ sign_extend 32) (currentBit!8987 thiss!1204)) lt!282621))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!183652 (= lt!282621 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!183653 () Bool)

(declare-fun res!152712 () Bool)

(declare-fun e!127307 () Bool)

(assert (=> b!183653 (=> res!152712 e!127307)))

(assert (=> b!183653 (= res!152712 (bvsge i!590 nBits!348))))

(declare-fun b!183654 () Bool)

(assert (=> b!183654 (= e!127307 true)))

(declare-fun lt!282619 () (_ BitVec 64))

(declare-datatypes ((tuple2!15860 0))(
  ( (tuple2!15861 (_1!8575 BitStream!7714) (_2!8575 (_ BitVec 64))) )
))
(declare-fun lt!282643 () tuple2!15860)

(declare-datatypes ((tuple2!15862 0))(
  ( (tuple2!15863 (_1!8576 BitStream!7714) (_2!8576 BitStream!7714)) )
))
(declare-fun lt!282627 () tuple2!15862)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15860)

(declare-fun withMovedBitIndex!0 (BitStream!7714 (_ BitVec 64)) BitStream!7714)

(assert (=> b!183654 (= lt!282643 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8576 lt!282627) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282619))))

(declare-fun b!183655 () Bool)

(declare-fun res!152698 () Bool)

(declare-fun e!127316 () Bool)

(assert (=> b!183655 (=> res!152698 e!127316)))

(declare-datatypes ((Unit!13181 0))(
  ( (Unit!13182) )
))
(declare-datatypes ((tuple2!15864 0))(
  ( (tuple2!15865 (_1!8577 Unit!13181) (_2!8577 BitStream!7714)) )
))
(declare-fun lt!282633 () tuple2!15864)

(declare-fun isPrefixOf!0 (BitStream!7714 BitStream!7714) Bool)

(assert (=> b!183655 (= res!152698 (not (isPrefixOf!0 thiss!1204 (_2!8577 lt!282633))))))

(declare-fun b!183656 () Bool)

(declare-fun res!152708 () Bool)

(assert (=> b!183656 (=> (not res!152708) (not e!127310))))

(assert (=> b!183656 (= res!152708 (not (= i!590 nBits!348)))))

(declare-fun b!183657 () Bool)

(declare-fun e!127313 () Bool)

(declare-fun e!127318 () Bool)

(assert (=> b!183657 (= e!127313 e!127318)))

(declare-fun res!152699 () Bool)

(assert (=> b!183657 (=> (not res!152699) (not e!127318))))

(declare-datatypes ((tuple2!15866 0))(
  ( (tuple2!15867 (_1!8578 BitStream!7714) (_2!8578 Bool)) )
))
(declare-fun lt!282635 () tuple2!15866)

(declare-fun lt!282624 () Bool)

(assert (=> b!183657 (= res!152699 (and (= (_2!8578 lt!282635) lt!282624) (= (_1!8578 lt!282635) (_2!8577 lt!282633))))))

(declare-fun readBitPure!0 (BitStream!7714) tuple2!15866)

(declare-fun readerFrom!0 (BitStream!7714 (_ BitVec 32) (_ BitVec 32)) BitStream!7714)

(assert (=> b!183657 (= lt!282635 (readBitPure!0 (readerFrom!0 (_2!8577 lt!282633) (currentBit!8987 thiss!1204) (currentByte!8992 thiss!1204))))))

(declare-fun b!183658 () Bool)

(declare-fun res!152718 () Bool)

(assert (=> b!183658 (=> res!152718 e!127307)))

(assert (=> b!183658 (= res!152718 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4303 (buf!4758 (_1!8576 lt!282627)))) ((_ sign_extend 32) (currentByte!8992 (_1!8576 lt!282627))) ((_ sign_extend 32) (currentBit!8987 (_1!8576 lt!282627))) lt!282621)))))

(declare-fun b!183659 () Bool)

(declare-fun res!152700 () Bool)

(assert (=> b!183659 (=> res!152700 e!127316)))

(declare-fun lt!282639 () tuple2!15864)

(assert (=> b!183659 (= res!152700 (not (isPrefixOf!0 (_2!8577 lt!282633) (_2!8577 lt!282639))))))

(declare-fun b!183660 () Bool)

(assert (=> b!183660 (= e!127316 e!127307)))

(declare-fun res!152701 () Bool)

(assert (=> b!183660 (=> res!152701 e!127307)))

(declare-fun lt!282622 () tuple2!15862)

(assert (=> b!183660 (= res!152701 (not (= (_1!8575 (readNBitsLSBFirstsLoopPure!0 (_1!8576 lt!282622) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!282619)) (_2!8576 lt!282622))))))

(declare-fun lt!282640 () (_ BitVec 64))

(assert (=> b!183660 (validate_offset_bits!1 ((_ sign_extend 32) (size!4303 (buf!4758 (_2!8577 lt!282639)))) ((_ sign_extend 32) (currentByte!8992 (_2!8577 lt!282633))) ((_ sign_extend 32) (currentBit!8987 (_2!8577 lt!282633))) lt!282640)))

(declare-fun lt!282638 () Unit!13181)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7714 array!9758 (_ BitVec 64)) Unit!13181)

(assert (=> b!183660 (= lt!282638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8577 lt!282633) (buf!4758 (_2!8577 lt!282639)) lt!282640))))

(assert (=> b!183660 (= lt!282640 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!282631 () tuple2!15866)

(declare-fun lt!282637 () (_ BitVec 64))

(declare-fun lt!282626 () (_ BitVec 64))

(assert (=> b!183660 (= lt!282619 (bvor lt!282626 (ite (_2!8578 lt!282631) lt!282637 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!282628 () tuple2!15860)

(assert (=> b!183660 (= lt!282628 (readNBitsLSBFirstsLoopPure!0 (_1!8576 lt!282627) nBits!348 i!590 lt!282626))))

(assert (=> b!183660 (validate_offset_bits!1 ((_ sign_extend 32) (size!4303 (buf!4758 (_2!8577 lt!282639)))) ((_ sign_extend 32) (currentByte!8992 thiss!1204)) ((_ sign_extend 32) (currentBit!8987 thiss!1204)) lt!282621)))

(declare-fun lt!282636 () Unit!13181)

(assert (=> b!183660 (= lt!282636 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4758 (_2!8577 lt!282639)) lt!282621))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183660 (= lt!282626 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!183660 (= (_2!8578 lt!282631) lt!282624)))

(assert (=> b!183660 (= lt!282631 (readBitPure!0 (_1!8576 lt!282627)))))

(declare-fun reader!0 (BitStream!7714 BitStream!7714) tuple2!15862)

(assert (=> b!183660 (= lt!282622 (reader!0 (_2!8577 lt!282633) (_2!8577 lt!282639)))))

(assert (=> b!183660 (= lt!282627 (reader!0 thiss!1204 (_2!8577 lt!282639)))))

(declare-fun e!127308 () Bool)

(assert (=> b!183660 e!127308))

(declare-fun res!152705 () Bool)

(assert (=> b!183660 (=> (not res!152705) (not e!127308))))

(declare-fun lt!282644 () tuple2!15866)

(declare-fun lt!282630 () tuple2!15866)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183660 (= res!152705 (= (bitIndex!0 (size!4303 (buf!4758 (_1!8578 lt!282644))) (currentByte!8992 (_1!8578 lt!282644)) (currentBit!8987 (_1!8578 lt!282644))) (bitIndex!0 (size!4303 (buf!4758 (_1!8578 lt!282630))) (currentByte!8992 (_1!8578 lt!282630)) (currentBit!8987 (_1!8578 lt!282630)))))))

(declare-fun lt!282642 () Unit!13181)

(declare-fun lt!282625 () BitStream!7714)

(declare-fun readBitPrefixLemma!0 (BitStream!7714 BitStream!7714) Unit!13181)

(assert (=> b!183660 (= lt!282642 (readBitPrefixLemma!0 lt!282625 (_2!8577 lt!282639)))))

(assert (=> b!183660 (= lt!282630 (readBitPure!0 (BitStream!7715 (buf!4758 (_2!8577 lt!282639)) (currentByte!8992 thiss!1204) (currentBit!8987 thiss!1204))))))

(assert (=> b!183660 (= lt!282644 (readBitPure!0 lt!282625))))

(declare-fun e!127312 () Bool)

(assert (=> b!183660 e!127312))

(declare-fun res!152704 () Bool)

(assert (=> b!183660 (=> (not res!152704) (not e!127312))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!183660 (= res!152704 (invariant!0 (currentBit!8987 thiss!1204) (currentByte!8992 thiss!1204) (size!4303 (buf!4758 (_2!8577 lt!282633)))))))

(assert (=> b!183660 (= lt!282625 (BitStream!7715 (buf!4758 (_2!8577 lt!282633)) (currentByte!8992 thiss!1204) (currentBit!8987 thiss!1204)))))

(declare-fun b!183661 () Bool)

(declare-fun e!127315 () Bool)

(assert (=> b!183661 (= e!127315 e!127313)))

(declare-fun res!152703 () Bool)

(assert (=> b!183661 (=> (not res!152703) (not e!127313))))

(declare-fun lt!282623 () (_ BitVec 64))

(declare-fun lt!282620 () (_ BitVec 64))

(assert (=> b!183661 (= res!152703 (= lt!282623 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282620)))))

(assert (=> b!183661 (= lt!282623 (bitIndex!0 (size!4303 (buf!4758 (_2!8577 lt!282633))) (currentByte!8992 (_2!8577 lt!282633)) (currentBit!8987 (_2!8577 lt!282633))))))

(assert (=> b!183661 (= lt!282620 (bitIndex!0 (size!4303 (buf!4758 thiss!1204)) (currentByte!8992 thiss!1204) (currentBit!8987 thiss!1204)))))

(declare-fun b!183662 () Bool)

(assert (=> b!183662 (= e!127312 (invariant!0 (currentBit!8987 thiss!1204) (currentByte!8992 thiss!1204) (size!4303 (buf!4758 (_2!8577 lt!282639)))))))

(declare-fun b!183651 () Bool)

(declare-fun e!127311 () Bool)

(declare-fun array_inv!4044 (array!9758) Bool)

(assert (=> b!183651 (= e!127311 (array_inv!4044 (buf!4758 thiss!1204)))))

(declare-fun res!152714 () Bool)

(assert (=> start!40190 (=> (not res!152714) (not e!127314))))

(assert (=> start!40190 (= res!152714 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40190 e!127314))

(assert (=> start!40190 true))

(declare-fun inv!12 (BitStream!7714) Bool)

(assert (=> start!40190 (and (inv!12 thiss!1204) e!127311)))

(declare-fun b!183663 () Bool)

(declare-fun res!152710 () Bool)

(assert (=> b!183663 (=> res!152710 e!127307)))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!183663 (= res!152710 (not (= (bvand lt!282626 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!183664 () Bool)

(declare-fun res!152702 () Bool)

(assert (=> b!183664 (=> (not res!152702) (not e!127313))))

(assert (=> b!183664 (= res!152702 (isPrefixOf!0 thiss!1204 (_2!8577 lt!282633)))))

(declare-fun b!183665 () Bool)

(assert (=> b!183665 (= e!127308 (= (_2!8578 lt!282644) (_2!8578 lt!282630)))))

(declare-fun b!183666 () Bool)

(declare-fun e!127317 () Bool)

(assert (=> b!183666 (= e!127317 e!127316)))

(declare-fun res!152709 () Bool)

(assert (=> b!183666 (=> res!152709 e!127316)))

(declare-fun lt!282641 () (_ BitVec 64))

(declare-fun lt!282634 () (_ BitVec 64))

(assert (=> b!183666 (= res!152709 (not (= lt!282634 (bvsub (bvsub (bvadd lt!282641 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!183666 (= lt!282634 (bitIndex!0 (size!4303 (buf!4758 (_2!8577 lt!282639))) (currentByte!8992 (_2!8577 lt!282639)) (currentBit!8987 (_2!8577 lt!282639))))))

(assert (=> b!183666 (isPrefixOf!0 thiss!1204 (_2!8577 lt!282639))))

(declare-fun lt!282629 () Unit!13181)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7714 BitStream!7714 BitStream!7714) Unit!13181)

(assert (=> b!183666 (= lt!282629 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8577 lt!282633) (_2!8577 lt!282639)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7714 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15864)

(assert (=> b!183666 (= lt!282639 (appendBitsLSBFirstLoopTR!0 (_2!8577 lt!282633) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!183667 () Bool)

(declare-fun res!152715 () Bool)

(assert (=> b!183667 (=> res!152715 e!127316)))

(declare-fun lt!282632 () (_ BitVec 64))

(assert (=> b!183667 (= res!152715 (or (not (= (size!4303 (buf!4758 (_2!8577 lt!282639))) (size!4303 (buf!4758 thiss!1204)))) (not (= lt!282634 (bvsub (bvadd lt!282632 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!183668 () Bool)

(assert (=> b!183668 (= e!127310 (not e!127317))))

(declare-fun res!152711 () Bool)

(assert (=> b!183668 (=> res!152711 e!127317)))

(assert (=> b!183668 (= res!152711 (not (= lt!282641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!282632))))))

(assert (=> b!183668 (= lt!282641 (bitIndex!0 (size!4303 (buf!4758 (_2!8577 lt!282633))) (currentByte!8992 (_2!8577 lt!282633)) (currentBit!8987 (_2!8577 lt!282633))))))

(assert (=> b!183668 (= lt!282632 (bitIndex!0 (size!4303 (buf!4758 thiss!1204)) (currentByte!8992 thiss!1204) (currentBit!8987 thiss!1204)))))

(assert (=> b!183668 e!127315))

(declare-fun res!152716 () Bool)

(assert (=> b!183668 (=> (not res!152716) (not e!127315))))

(assert (=> b!183668 (= res!152716 (= (size!4303 (buf!4758 thiss!1204)) (size!4303 (buf!4758 (_2!8577 lt!282633)))))))

(declare-fun appendBit!0 (BitStream!7714 Bool) tuple2!15864)

(assert (=> b!183668 (= lt!282633 (appendBit!0 thiss!1204 lt!282624))))

(assert (=> b!183668 (= lt!282624 (not (= (bvand v!189 lt!282637) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!183668 (= lt!282637 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!183669 () Bool)

(declare-fun res!152713 () Bool)

(assert (=> b!183669 (=> res!152713 e!127307)))

(assert (=> b!183669 (= res!152713 (not (= (bvand lt!282626 #b1111111111111111111111111111111111111111111111111111111111111111) lt!282626)))))

(declare-fun b!183670 () Bool)

(declare-fun res!152717 () Bool)

(assert (=> b!183670 (=> res!152717 e!127316)))

(assert (=> b!183670 (= res!152717 (not (invariant!0 (currentBit!8987 (_2!8577 lt!282639)) (currentByte!8992 (_2!8577 lt!282639)) (size!4303 (buf!4758 (_2!8577 lt!282639))))))))

(declare-fun b!183671 () Bool)

(declare-fun res!152707 () Bool)

(assert (=> b!183671 (=> (not res!152707) (not e!127310))))

(assert (=> b!183671 (= res!152707 (invariant!0 (currentBit!8987 thiss!1204) (currentByte!8992 thiss!1204) (size!4303 (buf!4758 thiss!1204))))))

(declare-fun b!183672 () Bool)

(assert (=> b!183672 (= e!127318 (= (bitIndex!0 (size!4303 (buf!4758 (_1!8578 lt!282635))) (currentByte!8992 (_1!8578 lt!282635)) (currentBit!8987 (_1!8578 lt!282635))) lt!282623))))

(assert (= (and start!40190 res!152714) b!183652))

(assert (= (and b!183652 res!152706) b!183671))

(assert (= (and b!183671 res!152707) b!183656))

(assert (= (and b!183656 res!152708) b!183668))

(assert (= (and b!183668 res!152716) b!183661))

(assert (= (and b!183661 res!152703) b!183664))

(assert (= (and b!183664 res!152702) b!183657))

(assert (= (and b!183657 res!152699) b!183672))

(assert (= (and b!183668 (not res!152711)) b!183666))

(assert (= (and b!183666 (not res!152709)) b!183670))

(assert (= (and b!183670 (not res!152717)) b!183667))

(assert (= (and b!183667 (not res!152715)) b!183659))

(assert (= (and b!183659 (not res!152700)) b!183655))

(assert (= (and b!183655 (not res!152698)) b!183660))

(assert (= (and b!183660 res!152704) b!183662))

(assert (= (and b!183660 res!152705) b!183665))

(assert (= (and b!183660 (not res!152701)) b!183653))

(assert (= (and b!183653 (not res!152712)) b!183658))

(assert (= (and b!183658 (not res!152718)) b!183663))

(assert (= (and b!183663 (not res!152710)) b!183669))

(assert (= (and b!183669 (not res!152713)) b!183654))

(assert (= start!40190 b!183651))

(declare-fun m!285601 () Bool)

(assert (=> start!40190 m!285601))

(declare-fun m!285603 () Bool)

(assert (=> b!183659 m!285603))

(declare-fun m!285605 () Bool)

(assert (=> b!183661 m!285605))

(declare-fun m!285607 () Bool)

(assert (=> b!183661 m!285607))

(assert (=> b!183668 m!285605))

(assert (=> b!183668 m!285607))

(declare-fun m!285609 () Bool)

(assert (=> b!183668 m!285609))

(declare-fun m!285611 () Bool)

(assert (=> b!183658 m!285611))

(declare-fun m!285613 () Bool)

(assert (=> b!183666 m!285613))

(declare-fun m!285615 () Bool)

(assert (=> b!183666 m!285615))

(declare-fun m!285617 () Bool)

(assert (=> b!183666 m!285617))

(declare-fun m!285619 () Bool)

(assert (=> b!183666 m!285619))

(declare-fun m!285621 () Bool)

(assert (=> b!183664 m!285621))

(declare-fun m!285623 () Bool)

(assert (=> b!183672 m!285623))

(declare-fun m!285625 () Bool)

(assert (=> b!183657 m!285625))

(assert (=> b!183657 m!285625))

(declare-fun m!285627 () Bool)

(assert (=> b!183657 m!285627))

(declare-fun m!285629 () Bool)

(assert (=> b!183671 m!285629))

(declare-fun m!285631 () Bool)

(assert (=> b!183652 m!285631))

(declare-fun m!285633 () Bool)

(assert (=> b!183662 m!285633))

(assert (=> b!183655 m!285621))

(declare-fun m!285635 () Bool)

(assert (=> b!183660 m!285635))

(declare-fun m!285637 () Bool)

(assert (=> b!183660 m!285637))

(declare-fun m!285639 () Bool)

(assert (=> b!183660 m!285639))

(declare-fun m!285641 () Bool)

(assert (=> b!183660 m!285641))

(declare-fun m!285643 () Bool)

(assert (=> b!183660 m!285643))

(declare-fun m!285645 () Bool)

(assert (=> b!183660 m!285645))

(declare-fun m!285647 () Bool)

(assert (=> b!183660 m!285647))

(declare-fun m!285649 () Bool)

(assert (=> b!183660 m!285649))

(declare-fun m!285651 () Bool)

(assert (=> b!183660 m!285651))

(declare-fun m!285653 () Bool)

(assert (=> b!183660 m!285653))

(declare-fun m!285655 () Bool)

(assert (=> b!183660 m!285655))

(declare-fun m!285657 () Bool)

(assert (=> b!183660 m!285657))

(declare-fun m!285659 () Bool)

(assert (=> b!183660 m!285659))

(declare-fun m!285661 () Bool)

(assert (=> b!183660 m!285661))

(declare-fun m!285663 () Bool)

(assert (=> b!183660 m!285663))

(declare-fun m!285665 () Bool)

(assert (=> b!183660 m!285665))

(declare-fun m!285667 () Bool)

(assert (=> b!183670 m!285667))

(declare-fun m!285669 () Bool)

(assert (=> b!183654 m!285669))

(assert (=> b!183654 m!285669))

(declare-fun m!285671 () Bool)

(assert (=> b!183654 m!285671))

(declare-fun m!285673 () Bool)

(assert (=> b!183651 m!285673))

(declare-fun m!285675 () Bool)

(assert (=> b!183663 m!285675))

(push 1)

(assert (not b!183661))

(assert (not b!183664))

(assert (not b!183663))

(assert (not b!183668))

(assert (not b!183655))

(assert (not b!183670))

(assert (not b!183658))

(assert (not b!183662))

(assert (not start!40190))

(assert (not b!183652))

(assert (not b!183666))

(assert (not b!183651))

(assert (not b!183672))

(assert (not b!183657))

(assert (not b!183660))

(assert (not b!183654))

(assert (not b!183671))

(assert (not b!183659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

