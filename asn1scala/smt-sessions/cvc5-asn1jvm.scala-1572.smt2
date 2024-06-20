; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44562 () Bool)

(assert start!44562)

(declare-fun b!212747 () Bool)

(declare-fun e!144971 () Bool)

(declare-datatypes ((array!10535 0))(
  ( (array!10536 (arr!5557 (Array (_ BitVec 32) (_ BitVec 8))) (size!4627 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8362 0))(
  ( (BitStream!8363 (buf!5156 array!10535) (currentByte!9722 (_ BitVec 32)) (currentBit!9717 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8362)

(declare-datatypes ((Unit!15160 0))(
  ( (Unit!15161) )
))
(declare-datatypes ((tuple2!18218 0))(
  ( (tuple2!18219 (_1!9764 Unit!15160) (_2!9764 BitStream!8362)) )
))
(declare-fun lt!335474 () tuple2!18218)

(assert (=> b!212747 (= e!144971 (= (size!4627 (buf!5156 thiss!1204)) (size!4627 (buf!5156 (_2!9764 lt!335474)))))))

(declare-fun b!212748 () Bool)

(declare-fun e!144970 () Bool)

(declare-datatypes ((tuple2!18220 0))(
  ( (tuple2!18221 (_1!9765 BitStream!8362) (_2!9765 Bool)) )
))
(declare-fun lt!335472 () tuple2!18220)

(declare-fun lt!335476 () tuple2!18220)

(assert (=> b!212748 (= e!144970 (= (_2!9765 lt!335472) (_2!9765 lt!335476)))))

(declare-fun res!178745 () Bool)

(declare-fun e!144979 () Bool)

(assert (=> start!44562 (=> (not res!178745) (not e!144979))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!44562 (= res!178745 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44562 e!144979))

(assert (=> start!44562 true))

(declare-fun e!144980 () Bool)

(declare-fun inv!12 (BitStream!8362) Bool)

(assert (=> start!44562 (and (inv!12 thiss!1204) e!144980)))

(declare-fun b!212749 () Bool)

(declare-fun e!144976 () Bool)

(assert (=> b!212749 (= e!144979 e!144976)))

(declare-fun res!178759 () Bool)

(assert (=> b!212749 (=> (not res!178759) (not e!144976))))

(declare-fun lt!335492 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!212749 (= res!178759 (validate_offset_bits!1 ((_ sign_extend 32) (size!4627 (buf!5156 thiss!1204))) ((_ sign_extend 32) (currentByte!9722 thiss!1204)) ((_ sign_extend 32) (currentBit!9717 thiss!1204)) lt!335492))))

(assert (=> b!212749 (= lt!335492 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!212750 () Bool)

(declare-fun e!144981 () Bool)

(declare-fun e!144977 () Bool)

(assert (=> b!212750 (= e!144981 e!144977)))

(declare-fun res!178743 () Bool)

(assert (=> b!212750 (=> (not res!178743) (not e!144977))))

(declare-fun lt!335471 () tuple2!18218)

(declare-fun lt!335491 () tuple2!18220)

(declare-fun lt!335480 () Bool)

(assert (=> b!212750 (= res!178743 (and (= (_2!9765 lt!335491) lt!335480) (= (_1!9765 lt!335491) (_2!9764 lt!335471))))))

(declare-fun readBitPure!0 (BitStream!8362) tuple2!18220)

(declare-fun readerFrom!0 (BitStream!8362 (_ BitVec 32) (_ BitVec 32)) BitStream!8362)

(assert (=> b!212750 (= lt!335491 (readBitPure!0 (readerFrom!0 (_2!9764 lt!335471) (currentBit!9717 thiss!1204) (currentByte!9722 thiss!1204))))))

(declare-fun b!212751 () Bool)

(declare-fun res!178754 () Bool)

(declare-fun e!144968 () Bool)

(assert (=> b!212751 (=> res!178754 e!144968)))

(declare-fun isPrefixOf!0 (BitStream!8362 BitStream!8362) Bool)

(assert (=> b!212751 (= res!178754 (not (isPrefixOf!0 (_2!9764 lt!335471) (_2!9764 lt!335474))))))

(declare-fun b!212752 () Bool)

(declare-fun res!178758 () Bool)

(assert (=> b!212752 (=> res!178758 e!144971)))

(declare-datatypes ((tuple2!18222 0))(
  ( (tuple2!18223 (_1!9766 BitStream!8362) (_2!9766 (_ BitVec 64))) )
))
(declare-fun lt!335482 () tuple2!18222)

(declare-datatypes ((tuple2!18224 0))(
  ( (tuple2!18225 (_1!9767 BitStream!8362) (_2!9767 BitStream!8362)) )
))
(declare-fun lt!335485 () tuple2!18224)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212752 (= res!178758 (not (= (bitIndex!0 (size!4627 (buf!5156 (_1!9766 lt!335482))) (currentByte!9722 (_1!9766 lt!335482)) (currentBit!9717 (_1!9766 lt!335482))) (bitIndex!0 (size!4627 (buf!5156 (_2!9767 lt!335485))) (currentByte!9722 (_2!9767 lt!335485)) (currentBit!9717 (_2!9767 lt!335485))))))))

(declare-fun b!212753 () Bool)

(declare-fun res!178746 () Bool)

(assert (=> b!212753 (=> (not res!178746) (not e!144981))))

(assert (=> b!212753 (= res!178746 (isPrefixOf!0 thiss!1204 (_2!9764 lt!335471)))))

(declare-fun b!212754 () Bool)

(declare-fun res!178744 () Bool)

(declare-fun e!144978 () Bool)

(assert (=> b!212754 (=> (not res!178744) (not e!144978))))

(declare-fun lt!335475 () tuple2!18224)

(declare-fun lt!335477 () (_ BitVec 64))

(declare-fun lt!335465 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!8362 (_ BitVec 64)) BitStream!8362)

(assert (=> b!212754 (= res!178744 (= (_1!9767 lt!335475) (withMovedBitIndex!0 (_2!9767 lt!335475) (bvsub lt!335465 lt!335477))))))

(declare-fun b!212755 () Bool)

(declare-fun e!144974 () Bool)

(assert (=> b!212755 (= e!144968 e!144974)))

(declare-fun res!178748 () Bool)

(assert (=> b!212755 (=> res!178748 e!144974)))

(declare-fun lt!335478 () tuple2!18222)

(assert (=> b!212755 (= res!178748 (not (= (_1!9766 lt!335478) (_2!9767 lt!335475))))))

(declare-fun lt!335487 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18222)

(assert (=> b!212755 (= lt!335478 (readNBitsLSBFirstsLoopPure!0 (_1!9767 lt!335475) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335487))))

(declare-fun lt!335483 () (_ BitVec 64))

(assert (=> b!212755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4627 (buf!5156 (_2!9764 lt!335474)))) ((_ sign_extend 32) (currentByte!9722 (_2!9764 lt!335471))) ((_ sign_extend 32) (currentBit!9717 (_2!9764 lt!335471))) lt!335483)))

(declare-fun lt!335486 () Unit!15160)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8362 array!10535 (_ BitVec 64)) Unit!15160)

(assert (=> b!212755 (= lt!335486 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9764 lt!335471) (buf!5156 (_2!9764 lt!335474)) lt!335483))))

(assert (=> b!212755 (= lt!335483 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!335468 () tuple2!18220)

(declare-fun lt!335489 () (_ BitVec 64))

(declare-fun lt!335466 () (_ BitVec 64))

(assert (=> b!212755 (= lt!335487 (bvor lt!335489 (ite (_2!9765 lt!335468) lt!335466 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212755 (= lt!335482 (readNBitsLSBFirstsLoopPure!0 (_1!9767 lt!335485) nBits!348 i!590 lt!335489))))

(assert (=> b!212755 (validate_offset_bits!1 ((_ sign_extend 32) (size!4627 (buf!5156 (_2!9764 lt!335474)))) ((_ sign_extend 32) (currentByte!9722 thiss!1204)) ((_ sign_extend 32) (currentBit!9717 thiss!1204)) lt!335492)))

(declare-fun lt!335464 () Unit!15160)

(assert (=> b!212755 (= lt!335464 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5156 (_2!9764 lt!335474)) lt!335492))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!212755 (= lt!335489 (bvand v!189 (onesLSBLong!0 i!590)))))

(assert (=> b!212755 (= (_2!9765 lt!335468) lt!335480)))

(assert (=> b!212755 (= lt!335468 (readBitPure!0 (_1!9767 lt!335485)))))

(declare-fun reader!0 (BitStream!8362 BitStream!8362) tuple2!18224)

(assert (=> b!212755 (= lt!335475 (reader!0 (_2!9764 lt!335471) (_2!9764 lt!335474)))))

(assert (=> b!212755 (= lt!335485 (reader!0 thiss!1204 (_2!9764 lt!335474)))))

(assert (=> b!212755 e!144970))

(declare-fun res!178761 () Bool)

(assert (=> b!212755 (=> (not res!178761) (not e!144970))))

(assert (=> b!212755 (= res!178761 (= (bitIndex!0 (size!4627 (buf!5156 (_1!9765 lt!335472))) (currentByte!9722 (_1!9765 lt!335472)) (currentBit!9717 (_1!9765 lt!335472))) (bitIndex!0 (size!4627 (buf!5156 (_1!9765 lt!335476))) (currentByte!9722 (_1!9765 lt!335476)) (currentBit!9717 (_1!9765 lt!335476)))))))

(declare-fun lt!335490 () Unit!15160)

(declare-fun lt!335488 () BitStream!8362)

(declare-fun readBitPrefixLemma!0 (BitStream!8362 BitStream!8362) Unit!15160)

(assert (=> b!212755 (= lt!335490 (readBitPrefixLemma!0 lt!335488 (_2!9764 lt!335474)))))

(assert (=> b!212755 (= lt!335476 (readBitPure!0 (BitStream!8363 (buf!5156 (_2!9764 lt!335474)) (currentByte!9722 thiss!1204) (currentBit!9717 thiss!1204))))))

(assert (=> b!212755 (= lt!335472 (readBitPure!0 lt!335488))))

(declare-fun e!144975 () Bool)

(assert (=> b!212755 e!144975))

(declare-fun res!178763 () Bool)

(assert (=> b!212755 (=> (not res!178763) (not e!144975))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!212755 (= res!178763 (invariant!0 (currentBit!9717 thiss!1204) (currentByte!9722 thiss!1204) (size!4627 (buf!5156 (_2!9764 lt!335471)))))))

(assert (=> b!212755 (= lt!335488 (BitStream!8363 (buf!5156 (_2!9764 lt!335471)) (currentByte!9722 thiss!1204) (currentBit!9717 thiss!1204)))))

(declare-fun b!212756 () Bool)

(assert (=> b!212756 (= e!144974 e!144971)))

(declare-fun res!178747 () Bool)

(assert (=> b!212756 (=> res!178747 e!144971)))

(declare-fun lt!335467 () BitStream!8362)

(assert (=> b!212756 (= res!178747 (not (= (_1!9767 lt!335475) lt!335467)))))

(assert (=> b!212756 e!144978))

(declare-fun res!178762 () Bool)

(assert (=> b!212756 (=> (not res!178762) (not e!144978))))

(declare-fun lt!335469 () tuple2!18222)

(assert (=> b!212756 (= res!178762 (and (= (_2!9766 lt!335482) (_2!9766 lt!335469)) (= (_1!9766 lt!335482) (_1!9766 lt!335469))))))

(declare-fun lt!335470 () Unit!15160)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15160)

(assert (=> b!212756 (= lt!335470 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9767 lt!335485) nBits!348 i!590 lt!335489))))

(assert (=> b!212756 (= lt!335469 (readNBitsLSBFirstsLoopPure!0 lt!335467 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!335487))))

(assert (=> b!212756 (= lt!335467 (withMovedBitIndex!0 (_1!9767 lt!335485) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!212757 () Bool)

(declare-fun res!178757 () Bool)

(assert (=> b!212757 (=> res!178757 e!144968)))

(assert (=> b!212757 (= res!178757 (not (invariant!0 (currentBit!9717 (_2!9764 lt!335474)) (currentByte!9722 (_2!9764 lt!335474)) (size!4627 (buf!5156 (_2!9764 lt!335474))))))))

(declare-fun b!212758 () Bool)

(declare-fun res!178753 () Bool)

(assert (=> b!212758 (=> (not res!178753) (not e!144978))))

(declare-fun lt!335481 () (_ BitVec 64))

(assert (=> b!212758 (= res!178753 (= (_1!9767 lt!335485) (withMovedBitIndex!0 (_2!9767 lt!335485) (bvsub lt!335481 lt!335477))))))

(declare-fun b!212759 () Bool)

(declare-fun res!178750 () Bool)

(assert (=> b!212759 (=> (not res!178750) (not e!144976))))

(assert (=> b!212759 (= res!178750 (not (= i!590 nBits!348)))))

(declare-fun b!212760 () Bool)

(declare-fun e!144972 () Bool)

(assert (=> b!212760 (= e!144972 e!144981)))

(declare-fun res!178760 () Bool)

(assert (=> b!212760 (=> (not res!178760) (not e!144981))))

(declare-fun lt!335473 () (_ BitVec 64))

(declare-fun lt!335479 () (_ BitVec 64))

(assert (=> b!212760 (= res!178760 (= lt!335473 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335479)))))

(assert (=> b!212760 (= lt!335473 (bitIndex!0 (size!4627 (buf!5156 (_2!9764 lt!335471))) (currentByte!9722 (_2!9764 lt!335471)) (currentBit!9717 (_2!9764 lt!335471))))))

(assert (=> b!212760 (= lt!335479 (bitIndex!0 (size!4627 (buf!5156 thiss!1204)) (currentByte!9722 thiss!1204) (currentBit!9717 thiss!1204)))))

(declare-fun b!212761 () Bool)

(declare-fun res!178752 () Bool)

(assert (=> b!212761 (=> res!178752 e!144968)))

(assert (=> b!212761 (= res!178752 (not (isPrefixOf!0 thiss!1204 (_2!9764 lt!335471))))))

(declare-fun b!212762 () Bool)

(declare-fun e!144969 () Bool)

(assert (=> b!212762 (= e!144976 (not e!144969))))

(declare-fun res!178755 () Bool)

(assert (=> b!212762 (=> res!178755 e!144969)))

(assert (=> b!212762 (= res!178755 (not (= lt!335465 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!335481))))))

(assert (=> b!212762 (= lt!335465 (bitIndex!0 (size!4627 (buf!5156 (_2!9764 lt!335471))) (currentByte!9722 (_2!9764 lt!335471)) (currentBit!9717 (_2!9764 lt!335471))))))

(assert (=> b!212762 (= lt!335481 (bitIndex!0 (size!4627 (buf!5156 thiss!1204)) (currentByte!9722 thiss!1204) (currentBit!9717 thiss!1204)))))

(assert (=> b!212762 e!144972))

(declare-fun res!178749 () Bool)

(assert (=> b!212762 (=> (not res!178749) (not e!144972))))

(assert (=> b!212762 (= res!178749 (= (size!4627 (buf!5156 thiss!1204)) (size!4627 (buf!5156 (_2!9764 lt!335471)))))))

(declare-fun appendBit!0 (BitStream!8362 Bool) tuple2!18218)

(assert (=> b!212762 (= lt!335471 (appendBit!0 thiss!1204 lt!335480))))

(assert (=> b!212762 (= lt!335480 (not (= (bvand v!189 lt!335466) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!212762 (= lt!335466 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!212763 () Bool)

(assert (=> b!212763 (= e!144969 e!144968)))

(declare-fun res!178742 () Bool)

(assert (=> b!212763 (=> res!178742 e!144968)))

(assert (=> b!212763 (= res!178742 (not (= lt!335477 (bvsub (bvsub (bvadd lt!335465 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!212763 (= lt!335477 (bitIndex!0 (size!4627 (buf!5156 (_2!9764 lt!335474))) (currentByte!9722 (_2!9764 lt!335474)) (currentBit!9717 (_2!9764 lt!335474))))))

(assert (=> b!212763 (isPrefixOf!0 thiss!1204 (_2!9764 lt!335474))))

(declare-fun lt!335484 () Unit!15160)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8362 BitStream!8362 BitStream!8362) Unit!15160)

(assert (=> b!212763 (= lt!335484 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9764 lt!335471) (_2!9764 lt!335474)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8362 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18218)

(assert (=> b!212763 (= lt!335474 (appendBitsLSBFirstLoopTR!0 (_2!9764 lt!335471) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!212764 () Bool)

(declare-fun res!178751 () Bool)

(assert (=> b!212764 (=> res!178751 e!144968)))

(assert (=> b!212764 (= res!178751 (or (not (= (size!4627 (buf!5156 (_2!9764 lt!335474))) (size!4627 (buf!5156 thiss!1204)))) (not (= lt!335477 (bvsub (bvadd lt!335481 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!212765 () Bool)

(declare-fun res!178756 () Bool)

(assert (=> b!212765 (=> (not res!178756) (not e!144976))))

(assert (=> b!212765 (= res!178756 (invariant!0 (currentBit!9717 thiss!1204) (currentByte!9722 thiss!1204) (size!4627 (buf!5156 thiss!1204))))))

(declare-fun b!212766 () Bool)

(declare-fun array_inv!4368 (array!10535) Bool)

(assert (=> b!212766 (= e!144980 (array_inv!4368 (buf!5156 thiss!1204)))))

(declare-fun b!212767 () Bool)

(assert (=> b!212767 (= e!144975 (invariant!0 (currentBit!9717 thiss!1204) (currentByte!9722 thiss!1204) (size!4627 (buf!5156 (_2!9764 lt!335474)))))))

(declare-fun b!212768 () Bool)

(assert (=> b!212768 (= e!144977 (= (bitIndex!0 (size!4627 (buf!5156 (_1!9765 lt!335491))) (currentByte!9722 (_1!9765 lt!335491)) (currentBit!9717 (_1!9765 lt!335491))) lt!335473))))

(declare-fun b!212769 () Bool)

(assert (=> b!212769 (= e!144978 (and (= lt!335481 (bvsub lt!335465 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9767 lt!335475) lt!335467)) (= (_2!9766 lt!335482) (_2!9766 lt!335478)))))))

(assert (= (and start!44562 res!178745) b!212749))

(assert (= (and b!212749 res!178759) b!212765))

(assert (= (and b!212765 res!178756) b!212759))

(assert (= (and b!212759 res!178750) b!212762))

(assert (= (and b!212762 res!178749) b!212760))

(assert (= (and b!212760 res!178760) b!212753))

(assert (= (and b!212753 res!178746) b!212750))

(assert (= (and b!212750 res!178743) b!212768))

(assert (= (and b!212762 (not res!178755)) b!212763))

(assert (= (and b!212763 (not res!178742)) b!212757))

(assert (= (and b!212757 (not res!178757)) b!212764))

(assert (= (and b!212764 (not res!178751)) b!212751))

(assert (= (and b!212751 (not res!178754)) b!212761))

(assert (= (and b!212761 (not res!178752)) b!212755))

(assert (= (and b!212755 res!178763) b!212767))

(assert (= (and b!212755 res!178761) b!212748))

(assert (= (and b!212755 (not res!178748)) b!212756))

(assert (= (and b!212756 res!178762) b!212758))

(assert (= (and b!212758 res!178753) b!212754))

(assert (= (and b!212754 res!178744) b!212769))

(assert (= (and b!212756 (not res!178747)) b!212752))

(assert (= (and b!212752 (not res!178758)) b!212747))

(assert (= start!44562 b!212766))

(declare-fun m!327873 () Bool)

(assert (=> b!212762 m!327873))

(declare-fun m!327875 () Bool)

(assert (=> b!212762 m!327875))

(declare-fun m!327877 () Bool)

(assert (=> b!212762 m!327877))

(declare-fun m!327879 () Bool)

(assert (=> b!212753 m!327879))

(declare-fun m!327881 () Bool)

(assert (=> b!212754 m!327881))

(assert (=> b!212760 m!327873))

(assert (=> b!212760 m!327875))

(declare-fun m!327883 () Bool)

(assert (=> b!212751 m!327883))

(declare-fun m!327885 () Bool)

(assert (=> b!212763 m!327885))

(declare-fun m!327887 () Bool)

(assert (=> b!212763 m!327887))

(declare-fun m!327889 () Bool)

(assert (=> b!212763 m!327889))

(declare-fun m!327891 () Bool)

(assert (=> b!212763 m!327891))

(assert (=> b!212761 m!327879))

(declare-fun m!327893 () Bool)

(assert (=> b!212752 m!327893))

(declare-fun m!327895 () Bool)

(assert (=> b!212752 m!327895))

(declare-fun m!327897 () Bool)

(assert (=> b!212758 m!327897))

(declare-fun m!327899 () Bool)

(assert (=> start!44562 m!327899))

(declare-fun m!327901 () Bool)

(assert (=> b!212768 m!327901))

(declare-fun m!327903 () Bool)

(assert (=> b!212757 m!327903))

(declare-fun m!327905 () Bool)

(assert (=> b!212749 m!327905))

(declare-fun m!327907 () Bool)

(assert (=> b!212765 m!327907))

(declare-fun m!327909 () Bool)

(assert (=> b!212767 m!327909))

(declare-fun m!327911 () Bool)

(assert (=> b!212766 m!327911))

(declare-fun m!327913 () Bool)

(assert (=> b!212750 m!327913))

(assert (=> b!212750 m!327913))

(declare-fun m!327915 () Bool)

(assert (=> b!212750 m!327915))

(declare-fun m!327917 () Bool)

(assert (=> b!212756 m!327917))

(declare-fun m!327919 () Bool)

(assert (=> b!212756 m!327919))

(declare-fun m!327921 () Bool)

(assert (=> b!212756 m!327921))

(declare-fun m!327923 () Bool)

(assert (=> b!212755 m!327923))

(declare-fun m!327925 () Bool)

(assert (=> b!212755 m!327925))

(declare-fun m!327927 () Bool)

(assert (=> b!212755 m!327927))

(declare-fun m!327929 () Bool)

(assert (=> b!212755 m!327929))

(declare-fun m!327931 () Bool)

(assert (=> b!212755 m!327931))

(declare-fun m!327933 () Bool)

(assert (=> b!212755 m!327933))

(declare-fun m!327935 () Bool)

(assert (=> b!212755 m!327935))

(declare-fun m!327937 () Bool)

(assert (=> b!212755 m!327937))

(declare-fun m!327939 () Bool)

(assert (=> b!212755 m!327939))

(declare-fun m!327941 () Bool)

(assert (=> b!212755 m!327941))

(declare-fun m!327943 () Bool)

(assert (=> b!212755 m!327943))

(declare-fun m!327945 () Bool)

(assert (=> b!212755 m!327945))

(declare-fun m!327947 () Bool)

(assert (=> b!212755 m!327947))

(declare-fun m!327949 () Bool)

(assert (=> b!212755 m!327949))

(declare-fun m!327951 () Bool)

(assert (=> b!212755 m!327951))

(declare-fun m!327953 () Bool)

(assert (=> b!212755 m!327953))

(push 1)

(assert (not b!212760))

(assert (not b!212762))

(assert (not b!212755))

(assert (not start!44562))

(assert (not b!212767))

(assert (not b!212768))

(assert (not b!212763))

(assert (not b!212753))

(assert (not b!212765))

(assert (not b!212749))

(assert (not b!212754))

(assert (not b!212752))

(assert (not b!212756))

(assert (not b!212761))

(assert (not b!212750))

(assert (not b!212751))

(assert (not b!212757))

(assert (not b!212766))

(assert (not b!212758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

