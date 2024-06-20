; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28000 () Bool)

(assert start!28000)

(declare-fun b!144800 () Bool)

(declare-fun res!121027 () Bool)

(declare-fun e!96511 () Bool)

(assert (=> b!144800 (=> (not res!121027) (not e!96511))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!144800 (= res!121027 (bvslt from!447 to!404))))

(declare-datatypes ((array!6592 0))(
  ( (array!6593 (arr!3717 (Array (_ BitVec 32) (_ BitVec 8))) (size!2984 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6592)

(declare-fun b!144801 () Bool)

(declare-datatypes ((BitStream!5226 0))(
  ( (BitStream!5227 (buf!3423 array!6592) (currentByte!6313 (_ BitVec 32)) (currentBit!6308 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12914 0))(
  ( (tuple2!12915 (_1!6803 BitStream!5226) (_2!6803 array!6592)) )
))
(declare-fun lt!224462 () tuple2!12914)

(declare-fun e!96504 () Bool)

(declare-fun arrayRangesEq!300 (array!6592 array!6592 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144801 (= e!96504 (not (arrayRangesEq!300 arr!237 (_2!6803 lt!224462) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!144802 () Bool)

(declare-fun e!96505 () Bool)

(declare-datatypes ((tuple2!12916 0))(
  ( (tuple2!12917 (_1!6804 BitStream!5226) (_2!6804 BitStream!5226)) )
))
(declare-fun lt!224456 () tuple2!12916)

(declare-fun readByteArrayLoopPure!0 (BitStream!5226 array!6592 (_ BitVec 32) (_ BitVec 32)) tuple2!12914)

(assert (=> b!144802 (= e!96505 (= (_1!6803 (readByteArrayLoopPure!0 (_1!6804 lt!224456) arr!237 from!447 to!404)) (_2!6804 lt!224456)))))

(declare-fun b!144803 () Bool)

(declare-fun e!96512 () Bool)

(assert (=> b!144803 (= e!96512 (not e!96504))))

(declare-fun res!121026 () Bool)

(assert (=> b!144803 (=> res!121026 e!96504)))

(declare-fun lt!224471 () tuple2!12916)

(assert (=> b!144803 (= res!121026 (or (not (= (size!2984 (_2!6803 lt!224462)) (size!2984 arr!237))) (not (= (_1!6803 lt!224462) (_2!6804 lt!224471)))))))

(assert (=> b!144803 (= lt!224462 (readByteArrayLoopPure!0 (_1!6804 lt!224471) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9041 0))(
  ( (Unit!9042) )
))
(declare-datatypes ((tuple2!12918 0))(
  ( (tuple2!12919 (_1!6805 Unit!9041) (_2!6805 BitStream!5226)) )
))
(declare-fun lt!224461 () tuple2!12918)

(declare-fun lt!224464 () tuple2!12918)

(declare-fun lt!224466 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!144803 (validate_offset_bits!1 ((_ sign_extend 32) (size!2984 (buf!3423 (_2!6805 lt!224461)))) ((_ sign_extend 32) (currentByte!6313 (_2!6805 lt!224464))) ((_ sign_extend 32) (currentBit!6308 (_2!6805 lt!224464))) lt!224466)))

(declare-fun lt!224458 () Unit!9041)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5226 array!6592 (_ BitVec 64)) Unit!9041)

(assert (=> b!144803 (= lt!224458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6805 lt!224464) (buf!3423 (_2!6805 lt!224461)) lt!224466))))

(declare-fun reader!0 (BitStream!5226 BitStream!5226) tuple2!12916)

(assert (=> b!144803 (= lt!224471 (reader!0 (_2!6805 lt!224464) (_2!6805 lt!224461)))))

(declare-fun b!144804 () Bool)

(declare-fun res!121020 () Bool)

(assert (=> b!144804 (=> (not res!121020) (not e!96511))))

(declare-fun thiss!1634 () BitStream!5226)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144804 (= res!121020 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2984 (buf!3423 thiss!1634))) ((_ sign_extend 32) (currentByte!6313 thiss!1634)) ((_ sign_extend 32) (currentBit!6308 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!144805 () Bool)

(declare-fun res!121028 () Bool)

(declare-fun e!96507 () Bool)

(assert (=> b!144805 (=> (not res!121028) (not e!96507))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!144805 (= res!121028 (= (bitIndex!0 (size!2984 (buf!3423 (_2!6805 lt!224464))) (currentByte!6313 (_2!6805 lt!224464)) (currentBit!6308 (_2!6805 lt!224464))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2984 (buf!3423 thiss!1634)) (currentByte!6313 thiss!1634) (currentBit!6308 thiss!1634)))))))

(declare-fun lt!224472 () tuple2!12916)

(declare-fun b!144806 () Bool)

(declare-datatypes ((tuple2!12920 0))(
  ( (tuple2!12921 (_1!6806 BitStream!5226) (_2!6806 (_ BitVec 8))) )
))
(declare-fun lt!224469 () tuple2!12920)

(assert (=> b!144806 (= e!96507 (and (= (_2!6806 lt!224469) (select (arr!3717 arr!237) from!447)) (= (_1!6806 lt!224469) (_2!6804 lt!224472))))))

(declare-fun readBytePure!0 (BitStream!5226) tuple2!12920)

(assert (=> b!144806 (= lt!224469 (readBytePure!0 (_1!6804 lt!224472)))))

(assert (=> b!144806 (= lt!224472 (reader!0 thiss!1634 (_2!6805 lt!224464)))))

(declare-fun b!144807 () Bool)

(assert (=> b!144807 (= e!96511 (not true))))

(assert (=> b!144807 e!96505))

(declare-fun res!121022 () Bool)

(assert (=> b!144807 (=> (not res!121022) (not e!96505))))

(assert (=> b!144807 (= res!121022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2984 (buf!3423 (_2!6805 lt!224461)))) ((_ sign_extend 32) (currentByte!6313 thiss!1634)) ((_ sign_extend 32) (currentBit!6308 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!224459 () Unit!9041)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5226 array!6592 (_ BitVec 32)) Unit!9041)

(assert (=> b!144807 (= lt!224459 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3423 (_2!6805 lt!224461)) (bvsub to!404 from!447)))))

(assert (=> b!144807 (= (_2!6806 (readBytePure!0 (_1!6804 lt!224456))) (select (arr!3717 arr!237) from!447))))

(declare-fun lt!224470 () tuple2!12916)

(assert (=> b!144807 (= lt!224470 (reader!0 (_2!6805 lt!224464) (_2!6805 lt!224461)))))

(assert (=> b!144807 (= lt!224456 (reader!0 thiss!1634 (_2!6805 lt!224461)))))

(declare-fun e!96509 () Bool)

(assert (=> b!144807 e!96509))

(declare-fun res!121025 () Bool)

(assert (=> b!144807 (=> (not res!121025) (not e!96509))))

(declare-fun lt!224457 () tuple2!12920)

(declare-fun lt!224460 () tuple2!12920)

(assert (=> b!144807 (= res!121025 (= (bitIndex!0 (size!2984 (buf!3423 (_1!6806 lt!224457))) (currentByte!6313 (_1!6806 lt!224457)) (currentBit!6308 (_1!6806 lt!224457))) (bitIndex!0 (size!2984 (buf!3423 (_1!6806 lt!224460))) (currentByte!6313 (_1!6806 lt!224460)) (currentBit!6308 (_1!6806 lt!224460)))))))

(declare-fun lt!224467 () Unit!9041)

(declare-fun lt!224463 () BitStream!5226)

(declare-fun readBytePrefixLemma!0 (BitStream!5226 BitStream!5226) Unit!9041)

(assert (=> b!144807 (= lt!224467 (readBytePrefixLemma!0 lt!224463 (_2!6805 lt!224461)))))

(assert (=> b!144807 (= lt!224460 (readBytePure!0 (BitStream!5227 (buf!3423 (_2!6805 lt!224461)) (currentByte!6313 thiss!1634) (currentBit!6308 thiss!1634))))))

(assert (=> b!144807 (= lt!224457 (readBytePure!0 lt!224463))))

(assert (=> b!144807 (= lt!224463 (BitStream!5227 (buf!3423 (_2!6805 lt!224464)) (currentByte!6313 thiss!1634) (currentBit!6308 thiss!1634)))))

(declare-fun e!96503 () Bool)

(assert (=> b!144807 e!96503))

(declare-fun res!121024 () Bool)

(assert (=> b!144807 (=> (not res!121024) (not e!96503))))

(declare-fun isPrefixOf!0 (BitStream!5226 BitStream!5226) Bool)

(assert (=> b!144807 (= res!121024 (isPrefixOf!0 thiss!1634 (_2!6805 lt!224461)))))

(declare-fun lt!224465 () Unit!9041)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5226 BitStream!5226 BitStream!5226) Unit!9041)

(assert (=> b!144807 (= lt!224465 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6805 lt!224464) (_2!6805 lt!224461)))))

(declare-fun e!96513 () Bool)

(assert (=> b!144807 e!96513))

(declare-fun res!121023 () Bool)

(assert (=> b!144807 (=> (not res!121023) (not e!96513))))

(assert (=> b!144807 (= res!121023 (= (size!2984 (buf!3423 (_2!6805 lt!224464))) (size!2984 (buf!3423 (_2!6805 lt!224461)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5226 array!6592 (_ BitVec 32) (_ BitVec 32)) tuple2!12918)

(assert (=> b!144807 (= lt!224461 (appendByteArrayLoop!0 (_2!6805 lt!224464) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!144807 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2984 (buf!3423 (_2!6805 lt!224464)))) ((_ sign_extend 32) (currentByte!6313 (_2!6805 lt!224464))) ((_ sign_extend 32) (currentBit!6308 (_2!6805 lt!224464))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!224468 () Unit!9041)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5226 BitStream!5226 (_ BitVec 64) (_ BitVec 32)) Unit!9041)

(assert (=> b!144807 (= lt!224468 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6805 lt!224464) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!144807 e!96507))

(declare-fun res!121018 () Bool)

(assert (=> b!144807 (=> (not res!121018) (not e!96507))))

(assert (=> b!144807 (= res!121018 (= (size!2984 (buf!3423 thiss!1634)) (size!2984 (buf!3423 (_2!6805 lt!224464)))))))

(declare-fun appendByte!0 (BitStream!5226 (_ BitVec 8)) tuple2!12918)

(assert (=> b!144807 (= lt!224464 (appendByte!0 thiss!1634 (select (arr!3717 arr!237) from!447)))))

(declare-fun b!144809 () Bool)

(declare-fun res!121017 () Bool)

(assert (=> b!144809 (=> (not res!121017) (not e!96507))))

(assert (=> b!144809 (= res!121017 (isPrefixOf!0 thiss!1634 (_2!6805 lt!224464)))))

(declare-fun b!144810 () Bool)

(declare-fun res!121030 () Bool)

(assert (=> b!144810 (=> (not res!121030) (not e!96511))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!144810 (= res!121030 (invariant!0 (currentBit!6308 thiss!1634) (currentByte!6313 thiss!1634) (size!2984 (buf!3423 thiss!1634))))))

(declare-fun b!144811 () Bool)

(assert (=> b!144811 (= e!96503 (invariant!0 (currentBit!6308 thiss!1634) (currentByte!6313 thiss!1634) (size!2984 (buf!3423 (_2!6805 lt!224464)))))))

(declare-fun b!144812 () Bool)

(declare-fun e!96506 () Bool)

(declare-fun array_inv!2773 (array!6592) Bool)

(assert (=> b!144812 (= e!96506 (array_inv!2773 (buf!3423 thiss!1634)))))

(declare-fun b!144808 () Bool)

(assert (=> b!144808 (= e!96513 e!96512)))

(declare-fun res!121021 () Bool)

(assert (=> b!144808 (=> (not res!121021) (not e!96512))))

(assert (=> b!144808 (= res!121021 (= (bitIndex!0 (size!2984 (buf!3423 (_2!6805 lt!224461))) (currentByte!6313 (_2!6805 lt!224461)) (currentBit!6308 (_2!6805 lt!224461))) (bvadd (bitIndex!0 (size!2984 (buf!3423 (_2!6805 lt!224464))) (currentByte!6313 (_2!6805 lt!224464)) (currentBit!6308 (_2!6805 lt!224464))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!224466))))))

(assert (=> b!144808 (= lt!224466 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!121019 () Bool)

(assert (=> start!28000 (=> (not res!121019) (not e!96511))))

(assert (=> start!28000 (= res!121019 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2984 arr!237))))))

(assert (=> start!28000 e!96511))

(assert (=> start!28000 true))

(assert (=> start!28000 (array_inv!2773 arr!237)))

(declare-fun inv!12 (BitStream!5226) Bool)

(assert (=> start!28000 (and (inv!12 thiss!1634) e!96506)))

(declare-fun b!144813 () Bool)

(assert (=> b!144813 (= e!96509 (= (_2!6806 lt!224457) (_2!6806 lt!224460)))))

(declare-fun b!144814 () Bool)

(declare-fun res!121029 () Bool)

(assert (=> b!144814 (=> (not res!121029) (not e!96512))))

(assert (=> b!144814 (= res!121029 (isPrefixOf!0 (_2!6805 lt!224464) (_2!6805 lt!224461)))))

(assert (= (and start!28000 res!121019) b!144804))

(assert (= (and b!144804 res!121020) b!144800))

(assert (= (and b!144800 res!121027) b!144810))

(assert (= (and b!144810 res!121030) b!144807))

(assert (= (and b!144807 res!121018) b!144805))

(assert (= (and b!144805 res!121028) b!144809))

(assert (= (and b!144809 res!121017) b!144806))

(assert (= (and b!144807 res!121023) b!144808))

(assert (= (and b!144808 res!121021) b!144814))

(assert (= (and b!144814 res!121029) b!144803))

(assert (= (and b!144803 (not res!121026)) b!144801))

(assert (= (and b!144807 res!121024) b!144811))

(assert (= (and b!144807 res!121025) b!144813))

(assert (= (and b!144807 res!121022) b!144802))

(assert (= start!28000 b!144812))

(declare-fun m!222711 () Bool)

(assert (=> start!28000 m!222711))

(declare-fun m!222713 () Bool)

(assert (=> start!28000 m!222713))

(declare-fun m!222715 () Bool)

(assert (=> b!144812 m!222715))

(declare-fun m!222717 () Bool)

(assert (=> b!144807 m!222717))

(declare-fun m!222719 () Bool)

(assert (=> b!144807 m!222719))

(declare-fun m!222721 () Bool)

(assert (=> b!144807 m!222721))

(declare-fun m!222723 () Bool)

(assert (=> b!144807 m!222723))

(declare-fun m!222725 () Bool)

(assert (=> b!144807 m!222725))

(declare-fun m!222727 () Bool)

(assert (=> b!144807 m!222727))

(declare-fun m!222729 () Bool)

(assert (=> b!144807 m!222729))

(declare-fun m!222731 () Bool)

(assert (=> b!144807 m!222731))

(declare-fun m!222733 () Bool)

(assert (=> b!144807 m!222733))

(declare-fun m!222735 () Bool)

(assert (=> b!144807 m!222735))

(declare-fun m!222737 () Bool)

(assert (=> b!144807 m!222737))

(assert (=> b!144807 m!222733))

(declare-fun m!222739 () Bool)

(assert (=> b!144807 m!222739))

(declare-fun m!222741 () Bool)

(assert (=> b!144807 m!222741))

(declare-fun m!222743 () Bool)

(assert (=> b!144807 m!222743))

(declare-fun m!222745 () Bool)

(assert (=> b!144807 m!222745))

(declare-fun m!222747 () Bool)

(assert (=> b!144807 m!222747))

(declare-fun m!222749 () Bool)

(assert (=> b!144807 m!222749))

(declare-fun m!222751 () Bool)

(assert (=> b!144814 m!222751))

(declare-fun m!222753 () Bool)

(assert (=> b!144803 m!222753))

(declare-fun m!222755 () Bool)

(assert (=> b!144803 m!222755))

(declare-fun m!222757 () Bool)

(assert (=> b!144803 m!222757))

(assert (=> b!144803 m!222725))

(declare-fun m!222759 () Bool)

(assert (=> b!144808 m!222759))

(declare-fun m!222761 () Bool)

(assert (=> b!144808 m!222761))

(assert (=> b!144805 m!222761))

(declare-fun m!222763 () Bool)

(assert (=> b!144805 m!222763))

(assert (=> b!144806 m!222733))

(declare-fun m!222765 () Bool)

(assert (=> b!144806 m!222765))

(declare-fun m!222767 () Bool)

(assert (=> b!144806 m!222767))

(declare-fun m!222769 () Bool)

(assert (=> b!144811 m!222769))

(declare-fun m!222771 () Bool)

(assert (=> b!144809 m!222771))

(declare-fun m!222773 () Bool)

(assert (=> b!144802 m!222773))

(declare-fun m!222775 () Bool)

(assert (=> b!144801 m!222775))

(declare-fun m!222777 () Bool)

(assert (=> b!144804 m!222777))

(declare-fun m!222779 () Bool)

(assert (=> b!144810 m!222779))

(check-sat (not b!144806) (not b!144802) (not start!28000) (not b!144803) (not b!144812) (not b!144814) (not b!144811) (not b!144809) (not b!144801) (not b!144810) (not b!144804) (not b!144807) (not b!144805) (not b!144808))
