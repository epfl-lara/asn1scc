; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44566 () Bool)

(assert start!44566)

(declare-fun b!212885 () Bool)

(declare-fun res!178879 () Bool)

(declare-fun e!145055 () Bool)

(assert (=> b!212885 (=> res!178879 e!145055)))

(declare-datatypes ((array!10539 0))(
  ( (array!10540 (arr!5559 (Array (_ BitVec 32) (_ BitVec 8))) (size!4629 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8366 0))(
  ( (BitStream!8367 (buf!5158 array!10539) (currentByte!9724 (_ BitVec 32)) (currentBit!9719 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15164 0))(
  ( (Unit!15165) )
))
(declare-datatypes ((tuple2!18234 0))(
  ( (tuple2!18235 (_1!9772 Unit!15164) (_2!9772 BitStream!8366)) )
))
(declare-fun lt!335658 () tuple2!18234)

(declare-fun lt!335640 () tuple2!18234)

(declare-fun isPrefixOf!0 (BitStream!8366 BitStream!8366) Bool)

(assert (=> b!212885 (= res!178879 (not (isPrefixOf!0 (_2!9772 lt!335658) (_2!9772 lt!335640))))))

(declare-fun b!212886 () Bool)

(declare-fun e!145058 () Bool)

(declare-fun e!145065 () Bool)

(assert (=> b!212886 (= e!145058 e!145065)))

(declare-fun res!178874 () Bool)

(assert (=> b!212886 (=> (not res!178874) (not e!145065))))

(declare-datatypes ((tuple2!18236 0))(
  ( (tuple2!18237 (_1!9773 BitStream!8366) (_2!9773 Bool)) )
))
(declare-fun lt!335646 () tuple2!18236)

(declare-fun lt!335662 () Bool)

(assert (=> b!212886 (= res!178874 (and (= (_2!9773 lt!335646) lt!335662) (= (_1!9773 lt!335646) (_2!9772 lt!335658))))))

(declare-fun thiss!1204 () BitStream!8366)

(declare-fun readBitPure!0 (BitStream!8366) tuple2!18236)

(declare-fun readerFrom!0 (BitStream!8366 (_ BitVec 32) (_ BitVec 32)) BitStream!8366)

(assert (=> b!212886 (= lt!335646 (readBitPure!0 (readerFrom!0 (_2!9772 lt!335658) (currentBit!9719 thiss!1204) (currentByte!9724 thiss!1204))))))

(declare-fun b!212887 () Bool)

(declare-fun res!178889 () Bool)

(assert (=> b!212887 (=> (not res!178889) (not e!145058))))

(assert (=> b!212887 (= res!178889 (isPrefixOf!0 thiss!1204 (_2!9772 lt!335658)))))

(declare-fun b!212888 () Bool)

(declare-fun res!178894 () Bool)

(declare-fun e!145052 () Bool)

(assert (=> b!212888 (=> (not res!178894) (not e!145052))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!212888 (= res!178894 (not (= i!590 nBits!348)))))

(declare-fun b!212889 () Bool)

(declare-fun e!145059 () Bool)

(declare-fun lt!335644 () tuple2!18236)

(declare-fun lt!335654 () tuple2!18236)

(assert (=> b!212889 (= e!145059 (= (_2!9773 lt!335644) (_2!9773 lt!335654)))))

(declare-fun b!212890 () Bool)

(declare-fun res!178891 () Bool)

(declare-fun e!145053 () Bool)

(assert (=> b!212890 (=> (not res!178891) (not e!145053))))

(declare-fun lt!335638 () (_ BitVec 64))

(declare-datatypes ((tuple2!18238 0))(
  ( (tuple2!18239 (_1!9774 BitStream!8366) (_2!9774 BitStream!8366)) )
))
(declare-fun lt!335647 () tuple2!18238)

(declare-fun lt!335641 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8366 (_ BitVec 64)) BitStream!8366)

(assert (=> b!212890 (= res!178891 (= (_1!9774 lt!335647) (withMovedBitIndex!0 (_2!9774 lt!335647) (bvsub lt!335638 lt!335641))))))

(declare-fun b!212891 () Bool)

(declare-fun e!145060 () Bool)

(declare-fun array_inv!4370 (array!10539) Bool)

(assert (=> b!212891 (= e!145060 (array_inv!4370 (buf!5158 thiss!1204)))))

(declare-fun b!212892 () Bool)

(declare-fun res!178882 () Bool)

(assert (=> b!212892 (=> (not res!178882) (not e!145052))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212892 (= res!178882 (invariant!0 (currentBit!9719 thiss!1204) (currentByte!9724 thiss!1204) (size!4629 (buf!5158 thiss!1204))))))

(declare-fun b!212893 () Bool)

(declare-fun e!145061 () Bool)

(assert (=> b!212893 (= e!145052 (not e!145061))))

(declare-fun res!178883 () Bool)

(assert (=> b!212893 (=> res!178883 e!145061)))

(declare-fun lt!335663 () (_ BitVec 64))

(assert (=> b!212893 (= res!178883 (not (= lt!335663 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335638))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212893 (= lt!335663 (bitIndex!0 (size!4629 (buf!5158 (_2!9772 lt!335658))) (currentByte!9724 (_2!9772 lt!335658)) (currentBit!9719 (_2!9772 lt!335658))))))

(assert (=> b!212893 (= lt!335638 (bitIndex!0 (size!4629 (buf!5158 thiss!1204)) (currentByte!9724 thiss!1204) (currentBit!9719 thiss!1204)))))

(declare-fun e!145057 () Bool)

(assert (=> b!212893 e!145057))

(declare-fun res!178893 () Bool)

(assert (=> b!212893 (=> (not res!178893) (not e!145057))))

(assert (=> b!212893 (= res!178893 (= (size!4629 (buf!5158 thiss!1204)) (size!4629 (buf!5158 (_2!9772 lt!335658)))))))

(declare-fun appendBit!0 (BitStream!8366 Bool) tuple2!18234)

(assert (=> b!212893 (= lt!335658 (appendBit!0 thiss!1204 lt!335662))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun lt!335645 () (_ BitVec 64))

(assert (=> b!212893 (= lt!335662 (not (= (bvand v!189 lt!335645) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212893 (= lt!335645 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212894 () Bool)

(assert (=> b!212894 (= e!145057 e!145058)))

(declare-fun res!178881 () Bool)

(assert (=> b!212894 (=> (not res!178881) (not e!145058))))

(declare-fun lt!335649 () (_ BitVec 64))

(declare-fun lt!335648 () (_ BitVec 64))

(assert (=> b!212894 (= res!178881 (= lt!335649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335648)))))

(assert (=> b!212894 (= lt!335649 (bitIndex!0 (size!4629 (buf!5158 (_2!9772 lt!335658))) (currentByte!9724 (_2!9772 lt!335658)) (currentBit!9719 (_2!9772 lt!335658))))))

(assert (=> b!212894 (= lt!335648 (bitIndex!0 (size!4629 (buf!5158 thiss!1204)) (currentByte!9724 thiss!1204) (currentBit!9719 thiss!1204)))))

(declare-fun b!212895 () Bool)

(declare-fun res!178895 () Bool)

(assert (=> b!212895 (=> res!178895 e!145055)))

(assert (=> b!212895 (= res!178895 (not (isPrefixOf!0 thiss!1204 (_2!9772 lt!335658))))))

(declare-fun b!212896 () Bool)

(declare-fun e!145063 () Bool)

(assert (=> b!212896 (= e!145055 e!145063)))

(declare-fun res!178890 () Bool)

(assert (=> b!212896 (=> res!178890 e!145063)))

(declare-datatypes ((tuple2!18240 0))(
  ( (tuple2!18241 (_1!9775 BitStream!8366) (_2!9775 (_ BitVec 64))) )
))
(declare-fun lt!335661 () tuple2!18240)

(declare-fun lt!335657 () tuple2!18238)

(assert (=> b!212896 (= res!178890 (not (= (_1!9775 lt!335661) (_2!9774 lt!335657))))))

(declare-fun lt!335652 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18240)

(assert (=> b!212896 (= lt!335661 (readNBitsLSBFirstsLoopPure!0 (_1!9774 lt!335657) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335652))))

(declare-fun lt!335651 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212896 (validate_offset_bits!1 ((_ sign_extend 32) (size!4629 (buf!5158 (_2!9772 lt!335640)))) ((_ sign_extend 32) (currentByte!9724 (_2!9772 lt!335658))) ((_ sign_extend 32) (currentBit!9719 (_2!9772 lt!335658))) lt!335651)))

(declare-fun lt!335665 () Unit!15164)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8366 array!10539 (_ BitVec 64)) Unit!15164)

(assert (=> b!212896 (= lt!335665 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9772 lt!335658) (buf!5158 (_2!9772 lt!335640)) lt!335651))))

(assert (=> b!212896 (= lt!335651 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335653 () tuple2!18236)

(declare-fun lt!335639 () (_ BitVec 64))

(assert (=> b!212896 (= lt!335652 (bvor lt!335639 (ite (_2!9773 lt!335653) lt!335645 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!335659 () tuple2!18240)

(assert (=> b!212896 (= lt!335659 (readNBitsLSBFirstsLoopPure!0 (_1!9774 lt!335647) nBits!348 i!590 lt!335639))))

(declare-fun lt!335664 () (_ BitVec 64))

(assert (=> b!212896 (validate_offset_bits!1 ((_ sign_extend 32) (size!4629 (buf!5158 (_2!9772 lt!335640)))) ((_ sign_extend 32) (currentByte!9724 thiss!1204)) ((_ sign_extend 32) (currentBit!9719 thiss!1204)) lt!335664)))

(declare-fun lt!335655 () Unit!15164)

(assert (=> b!212896 (= lt!335655 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5158 (_2!9772 lt!335640)) lt!335664))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212896 (= lt!335639 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!212896 (= (_2!9773 lt!335653) lt!335662)))

(assert (=> b!212896 (= lt!335653 (readBitPure!0 (_1!9774 lt!335647)))))

(declare-fun reader!0 (BitStream!8366 BitStream!8366) tuple2!18238)

(assert (=> b!212896 (= lt!335657 (reader!0 (_2!9772 lt!335658) (_2!9772 lt!335640)))))

(assert (=> b!212896 (= lt!335647 (reader!0 thiss!1204 (_2!9772 lt!335640)))))

(assert (=> b!212896 e!145059))

(declare-fun res!178884 () Bool)

(assert (=> b!212896 (=> (not res!178884) (not e!145059))))

(assert (=> b!212896 (= res!178884 (= (bitIndex!0 (size!4629 (buf!5158 (_1!9773 lt!335644))) (currentByte!9724 (_1!9773 lt!335644)) (currentBit!9719 (_1!9773 lt!335644))) (bitIndex!0 (size!4629 (buf!5158 (_1!9773 lt!335654))) (currentByte!9724 (_1!9773 lt!335654)) (currentBit!9719 (_1!9773 lt!335654)))))))

(declare-fun lt!335650 () Unit!15164)

(declare-fun lt!335660 () BitStream!8366)

(declare-fun readBitPrefixLemma!0 (BitStream!8366 BitStream!8366) Unit!15164)

(assert (=> b!212896 (= lt!335650 (readBitPrefixLemma!0 lt!335660 (_2!9772 lt!335640)))))

(assert (=> b!212896 (= lt!335654 (readBitPure!0 (BitStream!8367 (buf!5158 (_2!9772 lt!335640)) (currentByte!9724 thiss!1204) (currentBit!9719 thiss!1204))))))

(assert (=> b!212896 (= lt!335644 (readBitPure!0 lt!335660))))

(declare-fun e!145064 () Bool)

(assert (=> b!212896 e!145064))

(declare-fun res!178886 () Bool)

(assert (=> b!212896 (=> (not res!178886) (not e!145064))))

(assert (=> b!212896 (= res!178886 (invariant!0 (currentBit!9719 thiss!1204) (currentByte!9724 thiss!1204) (size!4629 (buf!5158 (_2!9772 lt!335658)))))))

(assert (=> b!212896 (= lt!335660 (BitStream!8367 (buf!5158 (_2!9772 lt!335658)) (currentByte!9724 thiss!1204) (currentBit!9719 thiss!1204)))))

(declare-fun res!178876 () Bool)

(declare-fun e!145062 () Bool)

(assert (=> start!44566 (=> (not res!178876) (not e!145062))))

(assert (=> start!44566 (= res!178876 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44566 e!145062))

(assert (=> start!44566 true))

(declare-fun inv!12 (BitStream!8366) Bool)

(assert (=> start!44566 (and (inv!12 thiss!1204) e!145060)))

(declare-fun b!212897 () Bool)

(assert (=> b!212897 (= e!145062 e!145052)))

(declare-fun res!178885 () Bool)

(assert (=> b!212897 (=> (not res!178885) (not e!145052))))

(assert (=> b!212897 (= res!178885 (validate_offset_bits!1 ((_ sign_extend 32) (size!4629 (buf!5158 thiss!1204))) ((_ sign_extend 32) (currentByte!9724 thiss!1204)) ((_ sign_extend 32) (currentBit!9719 thiss!1204)) lt!335664))))

(assert (=> b!212897 (= lt!335664 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212898 () Bool)

(declare-fun res!178887 () Bool)

(assert (=> b!212898 (=> res!178887 e!145055)))

(assert (=> b!212898 (= res!178887 (not (invariant!0 (currentBit!9719 (_2!9772 lt!335640)) (currentByte!9724 (_2!9772 lt!335640)) (size!4629 (buf!5158 (_2!9772 lt!335640))))))))

(declare-fun b!212899 () Bool)

(assert (=> b!212899 (= e!145061 e!145055)))

(declare-fun res!178875 () Bool)

(assert (=> b!212899 (=> res!178875 e!145055)))

(assert (=> b!212899 (= res!178875 (not (= lt!335641 (bvsub (bvsub (bvadd lt!335663 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212899 (= lt!335641 (bitIndex!0 (size!4629 (buf!5158 (_2!9772 lt!335640))) (currentByte!9724 (_2!9772 lt!335640)) (currentBit!9719 (_2!9772 lt!335640))))))

(assert (=> b!212899 (isPrefixOf!0 thiss!1204 (_2!9772 lt!335640))))

(declare-fun lt!335642 () Unit!15164)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8366 BitStream!8366 BitStream!8366) Unit!15164)

(assert (=> b!212899 (= lt!335642 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9772 lt!335658) (_2!9772 lt!335640)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8366 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18234)

(assert (=> b!212899 (= lt!335640 (appendBitsLSBFirstLoopTR!0 (_2!9772 lt!335658) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212900 () Bool)

(declare-fun res!178892 () Bool)

(declare-fun e!145054 () Bool)

(assert (=> b!212900 (=> res!178892 e!145054)))

(assert (=> b!212900 (= res!178892 (not (= (bitIndex!0 (size!4629 (buf!5158 (_1!9775 lt!335659))) (currentByte!9724 (_1!9775 lt!335659)) (currentBit!9719 (_1!9775 lt!335659))) (bitIndex!0 (size!4629 (buf!5158 (_2!9774 lt!335647))) (currentByte!9724 (_2!9774 lt!335647)) (currentBit!9719 (_2!9774 lt!335647))))))))

(declare-fun b!212901 () Bool)

(declare-fun res!178888 () Bool)

(assert (=> b!212901 (=> res!178888 e!145055)))

(assert (=> b!212901 (= res!178888 (or (not (= (size!4629 (buf!5158 (_2!9772 lt!335640))) (size!4629 (buf!5158 thiss!1204)))) (not (= lt!335641 (bvsub (bvadd lt!335638 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212902 () Bool)

(assert (=> b!212902 (= e!145064 (invariant!0 (currentBit!9719 thiss!1204) (currentByte!9724 thiss!1204) (size!4629 (buf!5158 (_2!9772 lt!335640)))))))

(declare-fun b!212903 () Bool)

(assert (=> b!212903 (= e!145065 (= (bitIndex!0 (size!4629 (buf!5158 (_1!9773 lt!335646))) (currentByte!9724 (_1!9773 lt!335646)) (currentBit!9719 (_1!9773 lt!335646))) lt!335649))))

(declare-fun b!212904 () Bool)

(assert (=> b!212904 (= e!145063 e!145054)))

(declare-fun res!178877 () Bool)

(assert (=> b!212904 (=> res!178877 e!145054)))

(declare-fun lt!335666 () BitStream!8366)

(assert (=> b!212904 (= res!178877 (not (= (_1!9774 lt!335657) lt!335666)))))

(assert (=> b!212904 e!145053))

(declare-fun res!178880 () Bool)

(assert (=> b!212904 (=> (not res!178880) (not e!145053))))

(declare-fun lt!335643 () tuple2!18240)

(assert (=> b!212904 (= res!178880 (and (= (_2!9775 lt!335659) (_2!9775 lt!335643)) (= (_1!9775 lt!335659) (_1!9775 lt!335643))))))

(declare-fun lt!335656 () Unit!15164)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15164)

(assert (=> b!212904 (= lt!335656 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9774 lt!335647) nBits!348 i!590 lt!335639))))

(assert (=> b!212904 (= lt!335643 (readNBitsLSBFirstsLoopPure!0 lt!335666 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335652))))

(assert (=> b!212904 (= lt!335666 (withMovedBitIndex!0 (_1!9774 lt!335647) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!212905 () Bool)

(declare-fun res!178878 () Bool)

(assert (=> b!212905 (=> (not res!178878) (not e!145053))))

(assert (=> b!212905 (= res!178878 (= (_1!9774 lt!335657) (withMovedBitIndex!0 (_2!9774 lt!335657) (bvsub lt!335663 lt!335641))))))

(declare-fun b!212906 () Bool)

(assert (=> b!212906 (= e!145053 (and (= lt!335638 (bvsub lt!335663 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9774 lt!335657) lt!335666)) (= (_2!9775 lt!335659) (_2!9775 lt!335661)))))))

(declare-fun b!212907 () Bool)

(assert (=> b!212907 (= e!145054 (= (size!4629 (buf!5158 thiss!1204)) (size!4629 (buf!5158 (_2!9772 lt!335640)))))))

(assert (= (and start!44566 res!178876) b!212897))

(assert (= (and b!212897 res!178885) b!212892))

(assert (= (and b!212892 res!178882) b!212888))

(assert (= (and b!212888 res!178894) b!212893))

(assert (= (and b!212893 res!178893) b!212894))

(assert (= (and b!212894 res!178881) b!212887))

(assert (= (and b!212887 res!178889) b!212886))

(assert (= (and b!212886 res!178874) b!212903))

(assert (= (and b!212893 (not res!178883)) b!212899))

(assert (= (and b!212899 (not res!178875)) b!212898))

(assert (= (and b!212898 (not res!178887)) b!212901))

(assert (= (and b!212901 (not res!178888)) b!212885))

(assert (= (and b!212885 (not res!178879)) b!212895))

(assert (= (and b!212895 (not res!178895)) b!212896))

(assert (= (and b!212896 res!178886) b!212902))

(assert (= (and b!212896 res!178884) b!212889))

(assert (= (and b!212896 (not res!178890)) b!212904))

(assert (= (and b!212904 res!178880) b!212890))

(assert (= (and b!212890 res!178891) b!212905))

(assert (= (and b!212905 res!178878) b!212906))

(assert (= (and b!212904 (not res!178877)) b!212900))

(assert (= (and b!212900 (not res!178892)) b!212907))

(assert (= start!44566 b!212891))

(declare-fun m!328037 () Bool)

(assert (=> b!212887 m!328037))

(declare-fun m!328039 () Bool)

(assert (=> b!212903 m!328039))

(declare-fun m!328041 () Bool)

(assert (=> b!212886 m!328041))

(assert (=> b!212886 m!328041))

(declare-fun m!328043 () Bool)

(assert (=> b!212886 m!328043))

(declare-fun m!328045 () Bool)

(assert (=> b!212893 m!328045))

(declare-fun m!328047 () Bool)

(assert (=> b!212893 m!328047))

(declare-fun m!328049 () Bool)

(assert (=> b!212893 m!328049))

(declare-fun m!328051 () Bool)

(assert (=> b!212897 m!328051))

(declare-fun m!328053 () Bool)

(assert (=> b!212905 m!328053))

(assert (=> b!212895 m!328037))

(assert (=> b!212894 m!328045))

(assert (=> b!212894 m!328047))

(declare-fun m!328055 () Bool)

(assert (=> b!212891 m!328055))

(declare-fun m!328057 () Bool)

(assert (=> b!212899 m!328057))

(declare-fun m!328059 () Bool)

(assert (=> b!212899 m!328059))

(declare-fun m!328061 () Bool)

(assert (=> b!212899 m!328061))

(declare-fun m!328063 () Bool)

(assert (=> b!212899 m!328063))

(declare-fun m!328065 () Bool)

(assert (=> b!212892 m!328065))

(declare-fun m!328067 () Bool)

(assert (=> b!212902 m!328067))

(declare-fun m!328069 () Bool)

(assert (=> b!212900 m!328069))

(declare-fun m!328071 () Bool)

(assert (=> b!212900 m!328071))

(declare-fun m!328073 () Bool)

(assert (=> b!212890 m!328073))

(declare-fun m!328075 () Bool)

(assert (=> start!44566 m!328075))

(declare-fun m!328077 () Bool)

(assert (=> b!212896 m!328077))

(declare-fun m!328079 () Bool)

(assert (=> b!212896 m!328079))

(declare-fun m!328081 () Bool)

(assert (=> b!212896 m!328081))

(declare-fun m!328083 () Bool)

(assert (=> b!212896 m!328083))

(declare-fun m!328085 () Bool)

(assert (=> b!212896 m!328085))

(declare-fun m!328087 () Bool)

(assert (=> b!212896 m!328087))

(declare-fun m!328089 () Bool)

(assert (=> b!212896 m!328089))

(declare-fun m!328091 () Bool)

(assert (=> b!212896 m!328091))

(declare-fun m!328093 () Bool)

(assert (=> b!212896 m!328093))

(declare-fun m!328095 () Bool)

(assert (=> b!212896 m!328095))

(declare-fun m!328097 () Bool)

(assert (=> b!212896 m!328097))

(declare-fun m!328099 () Bool)

(assert (=> b!212896 m!328099))

(declare-fun m!328101 () Bool)

(assert (=> b!212896 m!328101))

(declare-fun m!328103 () Bool)

(assert (=> b!212896 m!328103))

(declare-fun m!328105 () Bool)

(assert (=> b!212896 m!328105))

(declare-fun m!328107 () Bool)

(assert (=> b!212896 m!328107))

(declare-fun m!328109 () Bool)

(assert (=> b!212885 m!328109))

(declare-fun m!328111 () Bool)

(assert (=> b!212898 m!328111))

(declare-fun m!328113 () Bool)

(assert (=> b!212904 m!328113))

(declare-fun m!328115 () Bool)

(assert (=> b!212904 m!328115))

(declare-fun m!328117 () Bool)

(assert (=> b!212904 m!328117))

(push 1)

(assert (not b!212890))

(assert (not b!212899))

(assert (not start!44566))

(assert (not b!212900))

(assert (not b!212904))

(assert (not b!212903))

(assert (not b!212891))

(assert (not b!212886))

(assert (not b!212902))

(assert (not b!212887))

(assert (not b!212894))

(assert (not b!212897))

(assert (not b!212905))

(assert (not b!212892))

(assert (not b!212898))

(assert (not b!212895))

(assert (not b!212893))

(assert (not b!212885))

(assert (not b!212896))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

