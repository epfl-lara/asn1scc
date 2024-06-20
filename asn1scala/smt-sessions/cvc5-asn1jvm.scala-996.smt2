; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27998 () Bool)

(assert start!27998)

(declare-fun b!144755 () Bool)

(declare-fun res!120982 () Bool)

(declare-fun e!96476 () Bool)

(assert (=> b!144755 (=> (not res!120982) (not e!96476))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6590 0))(
  ( (array!6591 (arr!3716 (Array (_ BitVec 32) (_ BitVec 8))) (size!2983 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5224 0))(
  ( (BitStream!5225 (buf!3422 array!6590) (currentByte!6312 (_ BitVec 32)) (currentBit!6307 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5224)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144755 (= res!120982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2983 (buf!3422 thiss!1634))) ((_ sign_extend 32) (currentByte!6312 thiss!1634)) ((_ sign_extend 32) (currentBit!6307 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144756 () Bool)

(declare-fun e!96478 () Bool)

(declare-datatypes ((Unit!9039 0))(
  ( (Unit!9040) )
))
(declare-datatypes ((tuple2!12906 0))(
  ( (tuple2!12907 (_1!6799 Unit!9039) (_2!6799 BitStream!5224)) )
))
(declare-fun lt!224420 () tuple2!12906)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144756 (= e!96478 (invariant!0 (currentBit!6307 thiss!1634) (currentByte!6312 thiss!1634) (size!2983 (buf!3422 (_2!6799 lt!224420)))))))

(declare-fun b!144757 () Bool)

(declare-fun arr!237 () array!6590)

(declare-datatypes ((tuple2!12908 0))(
  ( (tuple2!12909 (_1!6800 BitStream!5224) (_2!6800 array!6590)) )
))
(declare-fun lt!224408 () tuple2!12908)

(declare-fun e!96474 () Bool)

(declare-fun arrayRangesEq!299 (array!6590 array!6590 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144757 (= e!96474 (not (arrayRangesEq!299 arr!237 (_2!6800 lt!224408) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144758 () Bool)

(declare-fun e!96477 () Bool)

(assert (=> b!144758 (= e!96477 (not e!96474))))

(declare-fun res!120983 () Bool)

(assert (=> b!144758 (=> res!120983 e!96474)))

(declare-datatypes ((tuple2!12910 0))(
  ( (tuple2!12911 (_1!6801 BitStream!5224) (_2!6801 BitStream!5224)) )
))
(declare-fun lt!224407 () tuple2!12910)

(assert (=> b!144758 (= res!120983 (or (not (= (size!2983 (_2!6800 lt!224408)) (size!2983 arr!237))) (not (= (_1!6800 lt!224408) (_2!6801 lt!224407)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5224 array!6590 (_ BitVec 32) (_ BitVec 32)) tuple2!12908)

(assert (=> b!144758 (= lt!224408 (readByteArrayLoopPure!0 (_1!6801 lt!224407) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!224406 () tuple2!12906)

(declare-fun lt!224415 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144758 (validate_offset_bits!1 ((_ sign_extend 32) (size!2983 (buf!3422 (_2!6799 lt!224406)))) ((_ sign_extend 32) (currentByte!6312 (_2!6799 lt!224420))) ((_ sign_extend 32) (currentBit!6307 (_2!6799 lt!224420))) lt!224415)))

(declare-fun lt!224409 () Unit!9039)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5224 array!6590 (_ BitVec 64)) Unit!9039)

(assert (=> b!144758 (= lt!224409 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6799 lt!224420) (buf!3422 (_2!6799 lt!224406)) lt!224415))))

(declare-fun reader!0 (BitStream!5224 BitStream!5224) tuple2!12910)

(assert (=> b!144758 (= lt!224407 (reader!0 (_2!6799 lt!224420) (_2!6799 lt!224406)))))

(declare-fun b!144759 () Bool)

(declare-fun res!120984 () Bool)

(declare-fun e!96470 () Bool)

(assert (=> b!144759 (=> (not res!120984) (not e!96470))))

(declare-fun isPrefixOf!0 (BitStream!5224 BitStream!5224) Bool)

(assert (=> b!144759 (= res!120984 (isPrefixOf!0 thiss!1634 (_2!6799 lt!224420)))))

(declare-fun b!144761 () Bool)

(assert (=> b!144761 (= e!96476 (not true))))

(declare-fun e!96472 () Bool)

(assert (=> b!144761 e!96472))

(declare-fun res!120977 () Bool)

(assert (=> b!144761 (=> (not res!120977) (not e!96472))))

(assert (=> b!144761 (= res!120977 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2983 (buf!3422 (_2!6799 lt!224406)))) ((_ sign_extend 32) (currentByte!6312 thiss!1634)) ((_ sign_extend 32) (currentBit!6307 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224414 () Unit!9039)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5224 array!6590 (_ BitVec 32)) Unit!9039)

(assert (=> b!144761 (= lt!224414 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3422 (_2!6799 lt!224406)) (bvsub to!404 from!447)))))

(declare-fun lt!224410 () tuple2!12910)

(declare-datatypes ((tuple2!12912 0))(
  ( (tuple2!12913 (_1!6802 BitStream!5224) (_2!6802 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5224) tuple2!12912)

(assert (=> b!144761 (= (_2!6802 (readBytePure!0 (_1!6801 lt!224410))) (select (arr!3716 arr!237) from!447))))

(declare-fun lt!224413 () tuple2!12910)

(assert (=> b!144761 (= lt!224413 (reader!0 (_2!6799 lt!224420) (_2!6799 lt!224406)))))

(assert (=> b!144761 (= lt!224410 (reader!0 thiss!1634 (_2!6799 lt!224406)))))

(declare-fun e!96471 () Bool)

(assert (=> b!144761 e!96471))

(declare-fun res!120988 () Bool)

(assert (=> b!144761 (=> (not res!120988) (not e!96471))))

(declare-fun lt!224419 () tuple2!12912)

(declare-fun lt!224412 () tuple2!12912)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144761 (= res!120988 (= (bitIndex!0 (size!2983 (buf!3422 (_1!6802 lt!224419))) (currentByte!6312 (_1!6802 lt!224419)) (currentBit!6307 (_1!6802 lt!224419))) (bitIndex!0 (size!2983 (buf!3422 (_1!6802 lt!224412))) (currentByte!6312 (_1!6802 lt!224412)) (currentBit!6307 (_1!6802 lt!224412)))))))

(declare-fun lt!224411 () Unit!9039)

(declare-fun lt!224417 () BitStream!5224)

(declare-fun readBytePrefixLemma!0 (BitStream!5224 BitStream!5224) Unit!9039)

(assert (=> b!144761 (= lt!224411 (readBytePrefixLemma!0 lt!224417 (_2!6799 lt!224406)))))

(assert (=> b!144761 (= lt!224412 (readBytePure!0 (BitStream!5225 (buf!3422 (_2!6799 lt!224406)) (currentByte!6312 thiss!1634) (currentBit!6307 thiss!1634))))))

(assert (=> b!144761 (= lt!224419 (readBytePure!0 lt!224417))))

(assert (=> b!144761 (= lt!224417 (BitStream!5225 (buf!3422 (_2!6799 lt!224420)) (currentByte!6312 thiss!1634) (currentBit!6307 thiss!1634)))))

(assert (=> b!144761 e!96478))

(declare-fun res!120979 () Bool)

(assert (=> b!144761 (=> (not res!120979) (not e!96478))))

(assert (=> b!144761 (= res!120979 (isPrefixOf!0 thiss!1634 (_2!6799 lt!224406)))))

(declare-fun lt!224405 () Unit!9039)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5224 BitStream!5224 BitStream!5224) Unit!9039)

(assert (=> b!144761 (= lt!224405 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6799 lt!224420) (_2!6799 lt!224406)))))

(declare-fun e!96479 () Bool)

(assert (=> b!144761 e!96479))

(declare-fun res!120986 () Bool)

(assert (=> b!144761 (=> (not res!120986) (not e!96479))))

(assert (=> b!144761 (= res!120986 (= (size!2983 (buf!3422 (_2!6799 lt!224420))) (size!2983 (buf!3422 (_2!6799 lt!224406)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5224 array!6590 (_ BitVec 32) (_ BitVec 32)) tuple2!12906)

(assert (=> b!144761 (= lt!224406 (appendByteArrayLoop!0 (_2!6799 lt!224420) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144761 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2983 (buf!3422 (_2!6799 lt!224420)))) ((_ sign_extend 32) (currentByte!6312 (_2!6799 lt!224420))) ((_ sign_extend 32) (currentBit!6307 (_2!6799 lt!224420))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224418 () Unit!9039)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5224 BitStream!5224 (_ BitVec 64) (_ BitVec 32)) Unit!9039)

(assert (=> b!144761 (= lt!224418 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6799 lt!224420) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144761 e!96470))

(declare-fun res!120985 () Bool)

(assert (=> b!144761 (=> (not res!120985) (not e!96470))))

(assert (=> b!144761 (= res!120985 (= (size!2983 (buf!3422 thiss!1634)) (size!2983 (buf!3422 (_2!6799 lt!224420)))))))

(declare-fun appendByte!0 (BitStream!5224 (_ BitVec 8)) tuple2!12906)

(assert (=> b!144761 (= lt!224420 (appendByte!0 thiss!1634 (select (arr!3716 arr!237) from!447)))))

(declare-fun b!144762 () Bool)

(assert (=> b!144762 (= e!96479 e!96477)))

(declare-fun res!120975 () Bool)

(assert (=> b!144762 (=> (not res!120975) (not e!96477))))

(assert (=> b!144762 (= res!120975 (= (bitIndex!0 (size!2983 (buf!3422 (_2!6799 lt!224406))) (currentByte!6312 (_2!6799 lt!224406)) (currentBit!6307 (_2!6799 lt!224406))) (bvadd (bitIndex!0 (size!2983 (buf!3422 (_2!6799 lt!224420))) (currentByte!6312 (_2!6799 lt!224420)) (currentBit!6307 (_2!6799 lt!224420))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224415))))))

(assert (=> b!144762 (= lt!224415 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!144763 () Bool)

(declare-fun res!120976 () Bool)

(assert (=> b!144763 (=> (not res!120976) (not e!96476))))

(assert (=> b!144763 (= res!120976 (bvslt from!447 to!404))))

(declare-fun b!144760 () Bool)

(declare-fun res!120978 () Bool)

(assert (=> b!144760 (=> (not res!120978) (not e!96470))))

(assert (=> b!144760 (= res!120978 (= (bitIndex!0 (size!2983 (buf!3422 (_2!6799 lt!224420))) (currentByte!6312 (_2!6799 lt!224420)) (currentBit!6307 (_2!6799 lt!224420))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2983 (buf!3422 thiss!1634)) (currentByte!6312 thiss!1634) (currentBit!6307 thiss!1634)))))))

(declare-fun res!120980 () Bool)

(assert (=> start!27998 (=> (not res!120980) (not e!96476))))

(assert (=> start!27998 (= res!120980 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2983 arr!237))))))

(assert (=> start!27998 e!96476))

(assert (=> start!27998 true))

(declare-fun array_inv!2772 (array!6590) Bool)

(assert (=> start!27998 (array_inv!2772 arr!237)))

(declare-fun e!96475 () Bool)

(declare-fun inv!12 (BitStream!5224) Bool)

(assert (=> start!27998 (and (inv!12 thiss!1634) e!96475)))

(declare-fun b!144764 () Bool)

(declare-fun res!120987 () Bool)

(assert (=> b!144764 (=> (not res!120987) (not e!96477))))

(assert (=> b!144764 (= res!120987 (isPrefixOf!0 (_2!6799 lt!224420) (_2!6799 lt!224406)))))

(declare-fun b!144765 () Bool)

(assert (=> b!144765 (= e!96472 (= (_1!6800 (readByteArrayLoopPure!0 (_1!6801 lt!224410) arr!237 from!447 to!404)) (_2!6801 lt!224410)))))

(declare-fun b!144766 () Bool)

(assert (=> b!144766 (= e!96475 (array_inv!2772 (buf!3422 thiss!1634)))))

(declare-fun b!144767 () Bool)

(declare-fun res!120981 () Bool)

(assert (=> b!144767 (=> (not res!120981) (not e!96476))))

(assert (=> b!144767 (= res!120981 (invariant!0 (currentBit!6307 thiss!1634) (currentByte!6312 thiss!1634) (size!2983 (buf!3422 thiss!1634))))))

(declare-fun lt!224421 () tuple2!12912)

(declare-fun b!144768 () Bool)

(declare-fun lt!224416 () tuple2!12910)

(assert (=> b!144768 (= e!96470 (and (= (_2!6802 lt!224421) (select (arr!3716 arr!237) from!447)) (= (_1!6802 lt!224421) (_2!6801 lt!224416))))))

(assert (=> b!144768 (= lt!224421 (readBytePure!0 (_1!6801 lt!224416)))))

(assert (=> b!144768 (= lt!224416 (reader!0 thiss!1634 (_2!6799 lt!224420)))))

(declare-fun b!144769 () Bool)

(assert (=> b!144769 (= e!96471 (= (_2!6802 lt!224419) (_2!6802 lt!224412)))))

(assert (= (and start!27998 res!120980) b!144755))

(assert (= (and b!144755 res!120982) b!144763))

(assert (= (and b!144763 res!120976) b!144767))

(assert (= (and b!144767 res!120981) b!144761))

(assert (= (and b!144761 res!120985) b!144760))

(assert (= (and b!144760 res!120978) b!144759))

(assert (= (and b!144759 res!120984) b!144768))

(assert (= (and b!144761 res!120986) b!144762))

(assert (= (and b!144762 res!120975) b!144764))

(assert (= (and b!144764 res!120987) b!144758))

(assert (= (and b!144758 (not res!120983)) b!144757))

(assert (= (and b!144761 res!120979) b!144756))

(assert (= (and b!144761 res!120988) b!144769))

(assert (= (and b!144761 res!120977) b!144765))

(assert (= start!27998 b!144766))

(declare-fun m!222641 () Bool)

(assert (=> start!27998 m!222641))

(declare-fun m!222643 () Bool)

(assert (=> start!27998 m!222643))

(declare-fun m!222645 () Bool)

(assert (=> b!144767 m!222645))

(declare-fun m!222647 () Bool)

(assert (=> b!144761 m!222647))

(declare-fun m!222649 () Bool)

(assert (=> b!144761 m!222649))

(declare-fun m!222651 () Bool)

(assert (=> b!144761 m!222651))

(declare-fun m!222653 () Bool)

(assert (=> b!144761 m!222653))

(declare-fun m!222655 () Bool)

(assert (=> b!144761 m!222655))

(declare-fun m!222657 () Bool)

(assert (=> b!144761 m!222657))

(declare-fun m!222659 () Bool)

(assert (=> b!144761 m!222659))

(declare-fun m!222661 () Bool)

(assert (=> b!144761 m!222661))

(declare-fun m!222663 () Bool)

(assert (=> b!144761 m!222663))

(declare-fun m!222665 () Bool)

(assert (=> b!144761 m!222665))

(declare-fun m!222667 () Bool)

(assert (=> b!144761 m!222667))

(declare-fun m!222669 () Bool)

(assert (=> b!144761 m!222669))

(declare-fun m!222671 () Bool)

(assert (=> b!144761 m!222671))

(declare-fun m!222673 () Bool)

(assert (=> b!144761 m!222673))

(declare-fun m!222675 () Bool)

(assert (=> b!144761 m!222675))

(assert (=> b!144761 m!222671))

(declare-fun m!222677 () Bool)

(assert (=> b!144761 m!222677))

(declare-fun m!222679 () Bool)

(assert (=> b!144761 m!222679))

(declare-fun m!222681 () Bool)

(assert (=> b!144758 m!222681))

(declare-fun m!222683 () Bool)

(assert (=> b!144758 m!222683))

(declare-fun m!222685 () Bool)

(assert (=> b!144758 m!222685))

(assert (=> b!144758 m!222655))

(declare-fun m!222687 () Bool)

(assert (=> b!144755 m!222687))

(declare-fun m!222689 () Bool)

(assert (=> b!144757 m!222689))

(declare-fun m!222691 () Bool)

(assert (=> b!144765 m!222691))

(declare-fun m!222693 () Bool)

(assert (=> b!144762 m!222693))

(declare-fun m!222695 () Bool)

(assert (=> b!144762 m!222695))

(declare-fun m!222697 () Bool)

(assert (=> b!144756 m!222697))

(declare-fun m!222699 () Bool)

(assert (=> b!144766 m!222699))

(assert (=> b!144760 m!222695))

(declare-fun m!222701 () Bool)

(assert (=> b!144760 m!222701))

(declare-fun m!222703 () Bool)

(assert (=> b!144764 m!222703))

(assert (=> b!144768 m!222671))

(declare-fun m!222705 () Bool)

(assert (=> b!144768 m!222705))

(declare-fun m!222707 () Bool)

(assert (=> b!144768 m!222707))

(declare-fun m!222709 () Bool)

(assert (=> b!144759 m!222709))

(push 1)

(assert (not b!144768))

(assert (not b!144761))

(assert (not b!144765))

(assert (not b!144759))

(assert (not b!144755))

(assert (not b!144758))

(assert (not b!144757))

(assert (not b!144756))

(assert (not b!144762))

(assert (not b!144767))

(assert (not b!144760))

(assert (not b!144766))

(assert (not start!27998))

(assert (not b!144764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

