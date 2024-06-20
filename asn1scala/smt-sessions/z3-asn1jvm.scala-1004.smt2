; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28532 () Bool)

(assert start!28532)

(declare-fun res!123524 () Bool)

(declare-fun e!98447 () Bool)

(assert (=> start!28532 (=> (not res!123524) (not e!98447))))

(declare-datatypes ((array!6649 0))(
  ( (array!6650 (arr!3777 (Array (_ BitVec 32) (_ BitVec 8))) (size!3008 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6649)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!28532 (= res!123524 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3008 arr!237))))))

(assert (=> start!28532 e!98447))

(assert (=> start!28532 true))

(declare-fun array_inv!2797 (array!6649) Bool)

(assert (=> start!28532 (array_inv!2797 arr!237)))

(declare-datatypes ((BitStream!5274 0))(
  ( (BitStream!5275 (buf!3473 array!6649) (currentByte!6381 (_ BitVec 32)) (currentBit!6376 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5274)

(declare-fun e!98453 () Bool)

(declare-fun inv!12 (BitStream!5274) Bool)

(assert (=> start!28532 (and (inv!12 thiss!1634) e!98453)))

(declare-fun b!147605 () Bool)

(declare-fun res!123518 () Bool)

(assert (=> b!147605 (=> (not res!123518) (not e!98447))))

(assert (=> b!147605 (= res!123518 (bvslt from!447 to!404))))

(declare-fun b!147606 () Bool)

(assert (=> b!147606 (= e!98447 (not true))))

(declare-datatypes ((tuple2!13132 0))(
  ( (tuple2!13133 (_1!6925 BitStream!5274) (_2!6925 array!6649)) )
))
(declare-fun lt!229736 () tuple2!13132)

(declare-fun lt!229725 () tuple2!13132)

(declare-fun arrayRangesEq!324 (array!6649 array!6649 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147606 (arrayRangesEq!324 (_2!6925 lt!229736) (_2!6925 lt!229725) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((tuple2!13134 0))(
  ( (tuple2!13135 (_1!6926 BitStream!5274) (_2!6926 BitStream!5274)) )
))
(declare-fun lt!229735 () tuple2!13134)

(declare-datatypes ((Unit!9304 0))(
  ( (Unit!9305) )
))
(declare-fun lt!229724 () Unit!9304)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5274 array!6649 (_ BitVec 32) (_ BitVec 32)) Unit!9304)

(assert (=> b!147606 (= lt!229724 (readByteArrayLoopArrayPrefixLemma!0 (_1!6926 lt!229735) arr!237 from!447 to!404))))

(declare-fun lt!229712 () array!6649)

(declare-fun readByteArrayLoopPure!0 (BitStream!5274 array!6649 (_ BitVec 32) (_ BitVec 32)) tuple2!13132)

(declare-fun withMovedByteIndex!0 (BitStream!5274 (_ BitVec 32)) BitStream!5274)

(assert (=> b!147606 (= lt!229725 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6926 lt!229735) #b00000000000000000000000000000001) lt!229712 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229733 () tuple2!13132)

(declare-fun lt!229715 () tuple2!13134)

(assert (=> b!147606 (= lt!229733 (readByteArrayLoopPure!0 (_1!6926 lt!229715) lt!229712 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13136 0))(
  ( (tuple2!13137 (_1!6927 BitStream!5274) (_2!6927 (_ BitVec 8))) )
))
(declare-fun lt!229731 () tuple2!13136)

(assert (=> b!147606 (= lt!229712 (array!6650 (store (arr!3777 arr!237) from!447 (_2!6927 lt!229731)) (size!3008 arr!237)))))

(declare-datatypes ((tuple2!13138 0))(
  ( (tuple2!13139 (_1!6928 Unit!9304) (_2!6928 BitStream!5274)) )
))
(declare-fun lt!229718 () tuple2!13138)

(declare-fun lt!229719 () tuple2!13138)

(declare-fun lt!229730 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!147606 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3008 (buf!3473 (_2!6928 lt!229718)))) ((_ sign_extend 32) (currentByte!6381 (_2!6928 lt!229719))) ((_ sign_extend 32) (currentBit!6376 (_2!6928 lt!229719))) lt!229730)))

(declare-fun lt!229714 () Unit!9304)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5274 array!6649 (_ BitVec 32)) Unit!9304)

(assert (=> b!147606 (= lt!229714 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6928 lt!229719) (buf!3473 (_2!6928 lt!229718)) lt!229730))))

(assert (=> b!147606 (= (_1!6925 lt!229736) (_2!6926 lt!229735))))

(assert (=> b!147606 (= lt!229736 (readByteArrayLoopPure!0 (_1!6926 lt!229735) arr!237 from!447 to!404))))

(assert (=> b!147606 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3008 (buf!3473 (_2!6928 lt!229718)))) ((_ sign_extend 32) (currentByte!6381 thiss!1634)) ((_ sign_extend 32) (currentBit!6376 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!229721 () Unit!9304)

(assert (=> b!147606 (= lt!229721 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3473 (_2!6928 lt!229718)) (bvsub to!404 from!447)))))

(assert (=> b!147606 (= (_2!6927 lt!229731) (select (arr!3777 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5274) tuple2!13136)

(assert (=> b!147606 (= lt!229731 (readBytePure!0 (_1!6926 lt!229735)))))

(declare-fun reader!0 (BitStream!5274 BitStream!5274) tuple2!13134)

(assert (=> b!147606 (= lt!229715 (reader!0 (_2!6928 lt!229719) (_2!6928 lt!229718)))))

(assert (=> b!147606 (= lt!229735 (reader!0 thiss!1634 (_2!6928 lt!229718)))))

(declare-fun e!98449 () Bool)

(assert (=> b!147606 e!98449))

(declare-fun res!123521 () Bool)

(assert (=> b!147606 (=> (not res!123521) (not e!98449))))

(declare-fun lt!229723 () tuple2!13136)

(declare-fun lt!229717 () tuple2!13136)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!147606 (= res!123521 (= (bitIndex!0 (size!3008 (buf!3473 (_1!6927 lt!229723))) (currentByte!6381 (_1!6927 lt!229723)) (currentBit!6376 (_1!6927 lt!229723))) (bitIndex!0 (size!3008 (buf!3473 (_1!6927 lt!229717))) (currentByte!6381 (_1!6927 lt!229717)) (currentBit!6376 (_1!6927 lt!229717)))))))

(declare-fun lt!229716 () Unit!9304)

(declare-fun lt!229728 () BitStream!5274)

(declare-fun readBytePrefixLemma!0 (BitStream!5274 BitStream!5274) Unit!9304)

(assert (=> b!147606 (= lt!229716 (readBytePrefixLemma!0 lt!229728 (_2!6928 lt!229718)))))

(assert (=> b!147606 (= lt!229717 (readBytePure!0 (BitStream!5275 (buf!3473 (_2!6928 lt!229718)) (currentByte!6381 thiss!1634) (currentBit!6376 thiss!1634))))))

(assert (=> b!147606 (= lt!229723 (readBytePure!0 lt!229728))))

(assert (=> b!147606 (= lt!229728 (BitStream!5275 (buf!3473 (_2!6928 lt!229719)) (currentByte!6381 thiss!1634) (currentBit!6376 thiss!1634)))))

(declare-fun e!98450 () Bool)

(assert (=> b!147606 e!98450))

(declare-fun res!123516 () Bool)

(assert (=> b!147606 (=> (not res!123516) (not e!98450))))

(declare-fun isPrefixOf!0 (BitStream!5274 BitStream!5274) Bool)

(assert (=> b!147606 (= res!123516 (isPrefixOf!0 thiss!1634 (_2!6928 lt!229718)))))

(declare-fun lt!229722 () Unit!9304)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5274 BitStream!5274 BitStream!5274) Unit!9304)

(assert (=> b!147606 (= lt!229722 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6928 lt!229719) (_2!6928 lt!229718)))))

(declare-fun e!98445 () Bool)

(assert (=> b!147606 e!98445))

(declare-fun res!123522 () Bool)

(assert (=> b!147606 (=> (not res!123522) (not e!98445))))

(assert (=> b!147606 (= res!123522 (= (size!3008 (buf!3473 (_2!6928 lt!229719))) (size!3008 (buf!3473 (_2!6928 lt!229718)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5274 array!6649 (_ BitVec 32) (_ BitVec 32)) tuple2!13138)

(assert (=> b!147606 (= lt!229718 (appendByteArrayLoop!0 (_2!6928 lt!229719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!147606 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3008 (buf!3473 (_2!6928 lt!229719)))) ((_ sign_extend 32) (currentByte!6381 (_2!6928 lt!229719))) ((_ sign_extend 32) (currentBit!6376 (_2!6928 lt!229719))) lt!229730)))

(assert (=> b!147606 (= lt!229730 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!229726 () Unit!9304)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5274 BitStream!5274 (_ BitVec 64) (_ BitVec 32)) Unit!9304)

(assert (=> b!147606 (= lt!229726 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6928 lt!229719) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!98448 () Bool)

(assert (=> b!147606 e!98448))

(declare-fun res!123519 () Bool)

(assert (=> b!147606 (=> (not res!123519) (not e!98448))))

(assert (=> b!147606 (= res!123519 (= (size!3008 (buf!3473 thiss!1634)) (size!3008 (buf!3473 (_2!6928 lt!229719)))))))

(declare-fun appendByte!0 (BitStream!5274 (_ BitVec 8)) tuple2!13138)

(assert (=> b!147606 (= lt!229719 (appendByte!0 thiss!1634 (select (arr!3777 arr!237) from!447)))))

(declare-fun b!147607 () Bool)

(declare-fun res!123515 () Bool)

(declare-fun e!98451 () Bool)

(assert (=> b!147607 (=> (not res!123515) (not e!98451))))

(assert (=> b!147607 (= res!123515 (isPrefixOf!0 (_2!6928 lt!229719) (_2!6928 lt!229718)))))

(declare-fun b!147608 () Bool)

(declare-fun res!123513 () Bool)

(assert (=> b!147608 (=> (not res!123513) (not e!98448))))

(assert (=> b!147608 (= res!123513 (isPrefixOf!0 thiss!1634 (_2!6928 lt!229719)))))

(declare-fun b!147609 () Bool)

(declare-fun res!123514 () Bool)

(assert (=> b!147609 (=> (not res!123514) (not e!98447))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!147609 (= res!123514 (invariant!0 (currentBit!6376 thiss!1634) (currentByte!6381 thiss!1634) (size!3008 (buf!3473 thiss!1634))))))

(declare-fun b!147610 () Bool)

(assert (=> b!147610 (= e!98453 (array_inv!2797 (buf!3473 thiss!1634)))))

(declare-fun b!147611 () Bool)

(declare-fun res!123512 () Bool)

(assert (=> b!147611 (=> (not res!123512) (not e!98447))))

(assert (=> b!147611 (= res!123512 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3008 (buf!3473 thiss!1634))) ((_ sign_extend 32) (currentByte!6381 thiss!1634)) ((_ sign_extend 32) (currentBit!6376 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!147612 () Bool)

(declare-fun e!98454 () Bool)

(assert (=> b!147612 (= e!98451 (not e!98454))))

(declare-fun res!123517 () Bool)

(assert (=> b!147612 (=> res!123517 e!98454)))

(declare-fun lt!229732 () tuple2!13132)

(declare-fun lt!229720 () tuple2!13134)

(assert (=> b!147612 (= res!123517 (or (not (= (size!3008 (_2!6925 lt!229732)) (size!3008 arr!237))) (not (= (_1!6925 lt!229732) (_2!6926 lt!229720)))))))

(assert (=> b!147612 (= lt!229732 (readByteArrayLoopPure!0 (_1!6926 lt!229720) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!229729 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!147612 (validate_offset_bits!1 ((_ sign_extend 32) (size!3008 (buf!3473 (_2!6928 lt!229718)))) ((_ sign_extend 32) (currentByte!6381 (_2!6928 lt!229719))) ((_ sign_extend 32) (currentBit!6376 (_2!6928 lt!229719))) lt!229729)))

(declare-fun lt!229734 () Unit!9304)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5274 array!6649 (_ BitVec 64)) Unit!9304)

(assert (=> b!147612 (= lt!229734 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6928 lt!229719) (buf!3473 (_2!6928 lt!229718)) lt!229729))))

(assert (=> b!147612 (= lt!229720 (reader!0 (_2!6928 lt!229719) (_2!6928 lt!229718)))))

(declare-fun b!147613 () Bool)

(assert (=> b!147613 (= e!98449 (= (_2!6927 lt!229723) (_2!6927 lt!229717)))))

(declare-fun b!147614 () Bool)

(assert (=> b!147614 (= e!98450 (invariant!0 (currentBit!6376 thiss!1634) (currentByte!6381 thiss!1634) (size!3008 (buf!3473 (_2!6928 lt!229719)))))))

(declare-fun lt!229713 () tuple2!13134)

(declare-fun lt!229727 () tuple2!13136)

(declare-fun b!147615 () Bool)

(assert (=> b!147615 (= e!98448 (and (= (_2!6927 lt!229727) (select (arr!3777 arr!237) from!447)) (= (_1!6927 lt!229727) (_2!6926 lt!229713))))))

(assert (=> b!147615 (= lt!229727 (readBytePure!0 (_1!6926 lt!229713)))))

(assert (=> b!147615 (= lt!229713 (reader!0 thiss!1634 (_2!6928 lt!229719)))))

(declare-fun b!147616 () Bool)

(assert (=> b!147616 (= e!98445 e!98451)))

(declare-fun res!123520 () Bool)

(assert (=> b!147616 (=> (not res!123520) (not e!98451))))

(assert (=> b!147616 (= res!123520 (= (bitIndex!0 (size!3008 (buf!3473 (_2!6928 lt!229718))) (currentByte!6381 (_2!6928 lt!229718)) (currentBit!6376 (_2!6928 lt!229718))) (bvadd (bitIndex!0 (size!3008 (buf!3473 (_2!6928 lt!229719))) (currentByte!6381 (_2!6928 lt!229719)) (currentBit!6376 (_2!6928 lt!229719))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!229729))))))

(assert (=> b!147616 (= lt!229729 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!147617 () Bool)

(assert (=> b!147617 (= e!98454 (not (arrayRangesEq!324 arr!237 (_2!6925 lt!229732) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!147618 () Bool)

(declare-fun res!123523 () Bool)

(assert (=> b!147618 (=> (not res!123523) (not e!98448))))

(assert (=> b!147618 (= res!123523 (= (bitIndex!0 (size!3008 (buf!3473 (_2!6928 lt!229719))) (currentByte!6381 (_2!6928 lt!229719)) (currentBit!6376 (_2!6928 lt!229719))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3008 (buf!3473 thiss!1634)) (currentByte!6381 thiss!1634) (currentBit!6376 thiss!1634)))))))

(assert (= (and start!28532 res!123524) b!147611))

(assert (= (and b!147611 res!123512) b!147605))

(assert (= (and b!147605 res!123518) b!147609))

(assert (= (and b!147609 res!123514) b!147606))

(assert (= (and b!147606 res!123519) b!147618))

(assert (= (and b!147618 res!123523) b!147608))

(assert (= (and b!147608 res!123513) b!147615))

(assert (= (and b!147606 res!123522) b!147616))

(assert (= (and b!147616 res!123520) b!147607))

(assert (= (and b!147607 res!123515) b!147612))

(assert (= (and b!147612 (not res!123517)) b!147617))

(assert (= (and b!147606 res!123516) b!147614))

(assert (= (and b!147606 res!123521) b!147613))

(assert (= start!28532 b!147610))

(declare-fun m!228563 () Bool)

(assert (=> b!147607 m!228563))

(declare-fun m!228565 () Bool)

(assert (=> b!147614 m!228565))

(declare-fun m!228567 () Bool)

(assert (=> b!147608 m!228567))

(declare-fun m!228569 () Bool)

(assert (=> b!147610 m!228569))

(declare-fun m!228571 () Bool)

(assert (=> b!147615 m!228571))

(declare-fun m!228573 () Bool)

(assert (=> b!147615 m!228573))

(declare-fun m!228575 () Bool)

(assert (=> b!147615 m!228575))

(declare-fun m!228577 () Bool)

(assert (=> b!147612 m!228577))

(declare-fun m!228579 () Bool)

(assert (=> b!147612 m!228579))

(declare-fun m!228581 () Bool)

(assert (=> b!147612 m!228581))

(declare-fun m!228583 () Bool)

(assert (=> b!147612 m!228583))

(declare-fun m!228585 () Bool)

(assert (=> b!147611 m!228585))

(declare-fun m!228587 () Bool)

(assert (=> b!147609 m!228587))

(declare-fun m!228589 () Bool)

(assert (=> b!147606 m!228589))

(declare-fun m!228591 () Bool)

(assert (=> b!147606 m!228591))

(declare-fun m!228593 () Bool)

(assert (=> b!147606 m!228593))

(declare-fun m!228595 () Bool)

(assert (=> b!147606 m!228595))

(declare-fun m!228597 () Bool)

(assert (=> b!147606 m!228597))

(declare-fun m!228599 () Bool)

(assert (=> b!147606 m!228599))

(assert (=> b!147606 m!228583))

(assert (=> b!147606 m!228595))

(declare-fun m!228601 () Bool)

(assert (=> b!147606 m!228601))

(declare-fun m!228603 () Bool)

(assert (=> b!147606 m!228603))

(declare-fun m!228605 () Bool)

(assert (=> b!147606 m!228605))

(declare-fun m!228607 () Bool)

(assert (=> b!147606 m!228607))

(declare-fun m!228609 () Bool)

(assert (=> b!147606 m!228609))

(declare-fun m!228611 () Bool)

(assert (=> b!147606 m!228611))

(declare-fun m!228613 () Bool)

(assert (=> b!147606 m!228613))

(assert (=> b!147606 m!228571))

(declare-fun m!228615 () Bool)

(assert (=> b!147606 m!228615))

(declare-fun m!228617 () Bool)

(assert (=> b!147606 m!228617))

(assert (=> b!147606 m!228571))

(declare-fun m!228619 () Bool)

(assert (=> b!147606 m!228619))

(declare-fun m!228621 () Bool)

(assert (=> b!147606 m!228621))

(declare-fun m!228623 () Bool)

(assert (=> b!147606 m!228623))

(declare-fun m!228625 () Bool)

(assert (=> b!147606 m!228625))

(declare-fun m!228627 () Bool)

(assert (=> b!147606 m!228627))

(declare-fun m!228629 () Bool)

(assert (=> b!147606 m!228629))

(declare-fun m!228631 () Bool)

(assert (=> b!147606 m!228631))

(declare-fun m!228633 () Bool)

(assert (=> b!147606 m!228633))

(declare-fun m!228635 () Bool)

(assert (=> b!147606 m!228635))

(declare-fun m!228637 () Bool)

(assert (=> b!147617 m!228637))

(declare-fun m!228639 () Bool)

(assert (=> b!147616 m!228639))

(declare-fun m!228641 () Bool)

(assert (=> b!147616 m!228641))

(declare-fun m!228643 () Bool)

(assert (=> start!28532 m!228643))

(declare-fun m!228645 () Bool)

(assert (=> start!28532 m!228645))

(assert (=> b!147618 m!228641))

(declare-fun m!228647 () Bool)

(assert (=> b!147618 m!228647))

(check-sat (not b!147615) (not b!147618) (not b!147609) (not b!147606) (not start!28532) (not b!147607) (not b!147610) (not b!147611) (not b!147616) (not b!147612) (not b!147617) (not b!147614) (not b!147608))
