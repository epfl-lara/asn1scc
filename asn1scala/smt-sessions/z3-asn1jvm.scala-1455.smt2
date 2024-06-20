; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39946 () Bool)

(assert start!39946)

(declare-fun b!181661 () Bool)

(declare-fun res!150907 () Bool)

(declare-fun e!126122 () Bool)

(assert (=> b!181661 (=> res!150907 e!126122)))

(declare-datatypes ((array!9706 0))(
  ( (array!9707 (arr!5210 (Array (_ BitVec 32) (_ BitVec 8))) (size!4280 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7668 0))(
  ( (BitStream!7669 (buf!4729 array!9706) (currentByte!8951 (_ BitVec 32)) (currentBit!8946 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7668)

(declare-datatypes ((Unit!13057 0))(
  ( (Unit!13058) )
))
(declare-datatypes ((tuple2!15652 0))(
  ( (tuple2!15653 (_1!8471 Unit!13057) (_2!8471 BitStream!7668)) )
))
(declare-fun lt!279087 () tuple2!15652)

(declare-fun isPrefixOf!0 (BitStream!7668 BitStream!7668) Bool)

(assert (=> b!181661 (= res!150907 (not (isPrefixOf!0 thiss!1204 (_2!8471 lt!279087))))))

(declare-fun b!181662 () Bool)

(declare-fun res!150905 () Bool)

(assert (=> b!181662 (=> res!150905 e!126122)))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!279089 () tuple2!15652)

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!279085 () (_ BitVec 64))

(declare-fun lt!279095 () (_ BitVec 64))

(assert (=> b!181662 (= res!150905 (or (not (= (size!4280 (buf!4729 (_2!8471 lt!279089))) (size!4280 (buf!4729 thiss!1204)))) (not (= lt!279085 (bvsub (bvadd lt!279095 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!181663 () Bool)

(declare-fun res!150908 () Bool)

(assert (=> b!181663 (=> res!150908 e!126122)))

(assert (=> b!181663 (= res!150908 (not (isPrefixOf!0 (_2!8471 lt!279087) (_2!8471 lt!279089))))))

(declare-fun b!181664 () Bool)

(declare-fun res!150910 () Bool)

(assert (=> b!181664 (=> res!150910 e!126122)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!181664 (= res!150910 (not (invariant!0 (currentBit!8946 (_2!8471 lt!279089)) (currentByte!8951 (_2!8471 lt!279089)) (size!4280 (buf!4729 (_2!8471 lt!279089))))))))

(declare-fun b!181665 () Bool)

(declare-fun res!150902 () Bool)

(declare-fun e!126130 () Bool)

(assert (=> b!181665 (=> (not res!150902) (not e!126130))))

(assert (=> b!181665 (= res!150902 (isPrefixOf!0 thiss!1204 (_2!8471 lt!279087)))))

(declare-fun b!181666 () Bool)

(declare-fun e!126129 () Bool)

(assert (=> b!181666 (= e!126130 e!126129)))

(declare-fun res!150900 () Bool)

(assert (=> b!181666 (=> (not res!150900) (not e!126129))))

(declare-datatypes ((tuple2!15654 0))(
  ( (tuple2!15655 (_1!8472 BitStream!7668) (_2!8472 Bool)) )
))
(declare-fun lt!279091 () tuple2!15654)

(declare-fun lt!279098 () Bool)

(assert (=> b!181666 (= res!150900 (and (= (_2!8472 lt!279091) lt!279098) (= (_1!8472 lt!279091) (_2!8471 lt!279087))))))

(declare-fun readBitPure!0 (BitStream!7668) tuple2!15654)

(declare-fun readerFrom!0 (BitStream!7668 (_ BitVec 32) (_ BitVec 32)) BitStream!7668)

(assert (=> b!181666 (= lt!279091 (readBitPure!0 (readerFrom!0 (_2!8471 lt!279087) (currentBit!8946 thiss!1204) (currentByte!8951 thiss!1204))))))

(declare-fun b!181667 () Bool)

(declare-fun lt!279080 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181667 (= e!126129 (= (bitIndex!0 (size!4280 (buf!4729 (_1!8472 lt!279091))) (currentByte!8951 (_1!8472 lt!279091)) (currentBit!8946 (_1!8472 lt!279091))) lt!279080))))

(declare-fun b!181668 () Bool)

(declare-fun e!126120 () Bool)

(declare-fun array_inv!4021 (array!9706) Bool)

(assert (=> b!181668 (= e!126120 (array_inv!4021 (buf!4729 thiss!1204)))))

(declare-fun res!150904 () Bool)

(declare-fun e!126127 () Bool)

(assert (=> start!39946 (=> (not res!150904) (not e!126127))))

(assert (=> start!39946 (= res!150904 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39946 e!126127))

(assert (=> start!39946 true))

(declare-fun inv!12 (BitStream!7668) Bool)

(assert (=> start!39946 (and (inv!12 thiss!1204) e!126120)))

(declare-fun b!181669 () Bool)

(declare-fun e!126123 () Bool)

(assert (=> b!181669 (= e!126127 e!126123)))

(declare-fun res!150897 () Bool)

(assert (=> b!181669 (=> (not res!150897) (not e!126123))))

(declare-fun lt!279096 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!181669 (= res!150897 (validate_offset_bits!1 ((_ sign_extend 32) (size!4280 (buf!4729 thiss!1204))) ((_ sign_extend 32) (currentByte!8951 thiss!1204)) ((_ sign_extend 32) (currentBit!8946 thiss!1204)) lt!279096))))

(assert (=> b!181669 (= lt!279096 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!181670 () Bool)

(declare-fun res!150899 () Bool)

(assert (=> b!181670 (=> (not res!150899) (not e!126123))))

(assert (=> b!181670 (= res!150899 (invariant!0 (currentBit!8946 thiss!1204) (currentByte!8951 thiss!1204) (size!4280 (buf!4729 thiss!1204))))))

(declare-fun b!181671 () Bool)

(assert (=> b!181671 (= e!126122 true)))

(declare-fun v!189 () (_ BitVec 64))

(declare-datatypes ((tuple2!15656 0))(
  ( (tuple2!15657 (_1!8473 BitStream!7668) (_2!8473 BitStream!7668)) )
))
(declare-fun lt!279084 () tuple2!15656)

(declare-datatypes ((tuple2!15658 0))(
  ( (tuple2!15659 (_1!8474 BitStream!7668) (_2!8474 (_ BitVec 64))) )
))
(declare-fun lt!279097 () tuple2!15658)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15658)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!181671 (= lt!279097 (readNBitsLSBFirstsLoopPure!0 (_1!8473 lt!279084) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(assert (=> b!181671 (validate_offset_bits!1 ((_ sign_extend 32) (size!4280 (buf!4729 (_2!8471 lt!279089)))) ((_ sign_extend 32) (currentByte!8951 thiss!1204)) ((_ sign_extend 32) (currentBit!8946 thiss!1204)) lt!279096)))

(declare-fun lt!279082 () Unit!13057)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7668 array!9706 (_ BitVec 64)) Unit!13057)

(assert (=> b!181671 (= lt!279082 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4729 (_2!8471 lt!279089)) lt!279096))))

(assert (=> b!181671 (= (_2!8472 (readBitPure!0 (_1!8473 lt!279084))) lt!279098)))

(declare-fun lt!279092 () tuple2!15656)

(declare-fun reader!0 (BitStream!7668 BitStream!7668) tuple2!15656)

(assert (=> b!181671 (= lt!279092 (reader!0 (_2!8471 lt!279087) (_2!8471 lt!279089)))))

(assert (=> b!181671 (= lt!279084 (reader!0 thiss!1204 (_2!8471 lt!279089)))))

(declare-fun e!126126 () Bool)

(assert (=> b!181671 e!126126))

(declare-fun res!150898 () Bool)

(assert (=> b!181671 (=> (not res!150898) (not e!126126))))

(declare-fun lt!279086 () tuple2!15654)

(declare-fun lt!279088 () tuple2!15654)

(assert (=> b!181671 (= res!150898 (= (bitIndex!0 (size!4280 (buf!4729 (_1!8472 lt!279086))) (currentByte!8951 (_1!8472 lt!279086)) (currentBit!8946 (_1!8472 lt!279086))) (bitIndex!0 (size!4280 (buf!4729 (_1!8472 lt!279088))) (currentByte!8951 (_1!8472 lt!279088)) (currentBit!8946 (_1!8472 lt!279088)))))))

(declare-fun lt!279090 () Unit!13057)

(declare-fun lt!279081 () BitStream!7668)

(declare-fun readBitPrefixLemma!0 (BitStream!7668 BitStream!7668) Unit!13057)

(assert (=> b!181671 (= lt!279090 (readBitPrefixLemma!0 lt!279081 (_2!8471 lt!279089)))))

(assert (=> b!181671 (= lt!279088 (readBitPure!0 (BitStream!7669 (buf!4729 (_2!8471 lt!279089)) (currentByte!8951 thiss!1204) (currentBit!8946 thiss!1204))))))

(assert (=> b!181671 (= lt!279086 (readBitPure!0 lt!279081))))

(declare-fun e!126124 () Bool)

(assert (=> b!181671 e!126124))

(declare-fun res!150909 () Bool)

(assert (=> b!181671 (=> (not res!150909) (not e!126124))))

(assert (=> b!181671 (= res!150909 (invariant!0 (currentBit!8946 thiss!1204) (currentByte!8951 thiss!1204) (size!4280 (buf!4729 (_2!8471 lt!279087)))))))

(assert (=> b!181671 (= lt!279081 (BitStream!7669 (buf!4729 (_2!8471 lt!279087)) (currentByte!8951 thiss!1204) (currentBit!8946 thiss!1204)))))

(declare-fun b!181672 () Bool)

(declare-fun e!126128 () Bool)

(assert (=> b!181672 (= e!126128 e!126122)))

(declare-fun res!150911 () Bool)

(assert (=> b!181672 (=> res!150911 e!126122)))

(declare-fun lt!279093 () (_ BitVec 64))

(assert (=> b!181672 (= res!150911 (not (= lt!279085 (bvsub (bvsub (bvadd lt!279093 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!181672 (= lt!279085 (bitIndex!0 (size!4280 (buf!4729 (_2!8471 lt!279089))) (currentByte!8951 (_2!8471 lt!279089)) (currentBit!8946 (_2!8471 lt!279089))))))

(assert (=> b!181672 (isPrefixOf!0 thiss!1204 (_2!8471 lt!279089))))

(declare-fun lt!279083 () Unit!13057)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7668 BitStream!7668 BitStream!7668) Unit!13057)

(assert (=> b!181672 (= lt!279083 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8471 lt!279087) (_2!8471 lt!279089)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7668 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15652)

(assert (=> b!181672 (= lt!279089 (appendBitsLSBFirstLoopTR!0 (_2!8471 lt!279087) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!181673 () Bool)

(declare-fun res!150901 () Bool)

(assert (=> b!181673 (=> (not res!150901) (not e!126123))))

(assert (=> b!181673 (= res!150901 (not (= i!590 nBits!348)))))

(declare-fun b!181674 () Bool)

(declare-fun e!126121 () Bool)

(assert (=> b!181674 (= e!126121 e!126130)))

(declare-fun res!150903 () Bool)

(assert (=> b!181674 (=> (not res!150903) (not e!126130))))

(declare-fun lt!279094 () (_ BitVec 64))

(assert (=> b!181674 (= res!150903 (= lt!279080 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279094)))))

(assert (=> b!181674 (= lt!279080 (bitIndex!0 (size!4280 (buf!4729 (_2!8471 lt!279087))) (currentByte!8951 (_2!8471 lt!279087)) (currentBit!8946 (_2!8471 lt!279087))))))

(assert (=> b!181674 (= lt!279094 (bitIndex!0 (size!4280 (buf!4729 thiss!1204)) (currentByte!8951 thiss!1204) (currentBit!8946 thiss!1204)))))

(declare-fun b!181675 () Bool)

(assert (=> b!181675 (= e!126126 (= (_2!8472 lt!279086) (_2!8472 lt!279088)))))

(declare-fun b!181676 () Bool)

(assert (=> b!181676 (= e!126123 (not e!126128))))

(declare-fun res!150912 () Bool)

(assert (=> b!181676 (=> res!150912 e!126128)))

(assert (=> b!181676 (= res!150912 (not (= lt!279093 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279095))))))

(assert (=> b!181676 (= lt!279093 (bitIndex!0 (size!4280 (buf!4729 (_2!8471 lt!279087))) (currentByte!8951 (_2!8471 lt!279087)) (currentBit!8946 (_2!8471 lt!279087))))))

(assert (=> b!181676 (= lt!279095 (bitIndex!0 (size!4280 (buf!4729 thiss!1204)) (currentByte!8951 thiss!1204) (currentBit!8946 thiss!1204)))))

(assert (=> b!181676 e!126121))

(declare-fun res!150906 () Bool)

(assert (=> b!181676 (=> (not res!150906) (not e!126121))))

(assert (=> b!181676 (= res!150906 (= (size!4280 (buf!4729 thiss!1204)) (size!4280 (buf!4729 (_2!8471 lt!279087)))))))

(declare-fun appendBit!0 (BitStream!7668 Bool) tuple2!15652)

(assert (=> b!181676 (= lt!279087 (appendBit!0 thiss!1204 lt!279098))))

(assert (=> b!181676 (= lt!279098 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!181677 () Bool)

(assert (=> b!181677 (= e!126124 (invariant!0 (currentBit!8946 thiss!1204) (currentByte!8951 thiss!1204) (size!4280 (buf!4729 (_2!8471 lt!279089)))))))

(assert (= (and start!39946 res!150904) b!181669))

(assert (= (and b!181669 res!150897) b!181670))

(assert (= (and b!181670 res!150899) b!181673))

(assert (= (and b!181673 res!150901) b!181676))

(assert (= (and b!181676 res!150906) b!181674))

(assert (= (and b!181674 res!150903) b!181665))

(assert (= (and b!181665 res!150902) b!181666))

(assert (= (and b!181666 res!150900) b!181667))

(assert (= (and b!181676 (not res!150912)) b!181672))

(assert (= (and b!181672 (not res!150911)) b!181664))

(assert (= (and b!181664 (not res!150910)) b!181662))

(assert (= (and b!181662 (not res!150905)) b!181663))

(assert (= (and b!181663 (not res!150908)) b!181661))

(assert (= (and b!181661 (not res!150907)) b!181671))

(assert (= (and b!181671 res!150909) b!181677))

(assert (= (and b!181671 res!150898) b!181675))

(assert (= start!39946 b!181668))

(declare-fun m!282735 () Bool)

(assert (=> b!181668 m!282735))

(declare-fun m!282737 () Bool)

(assert (=> b!181664 m!282737))

(declare-fun m!282739 () Bool)

(assert (=> b!181671 m!282739))

(declare-fun m!282741 () Bool)

(assert (=> b!181671 m!282741))

(declare-fun m!282743 () Bool)

(assert (=> b!181671 m!282743))

(declare-fun m!282745 () Bool)

(assert (=> b!181671 m!282745))

(declare-fun m!282747 () Bool)

(assert (=> b!181671 m!282747))

(declare-fun m!282749 () Bool)

(assert (=> b!181671 m!282749))

(declare-fun m!282751 () Bool)

(assert (=> b!181671 m!282751))

(declare-fun m!282753 () Bool)

(assert (=> b!181671 m!282753))

(declare-fun m!282755 () Bool)

(assert (=> b!181671 m!282755))

(declare-fun m!282757 () Bool)

(assert (=> b!181671 m!282757))

(declare-fun m!282759 () Bool)

(assert (=> b!181671 m!282759))

(declare-fun m!282761 () Bool)

(assert (=> b!181671 m!282761))

(declare-fun m!282763 () Bool)

(assert (=> b!181671 m!282763))

(declare-fun m!282765 () Bool)

(assert (=> b!181666 m!282765))

(assert (=> b!181666 m!282765))

(declare-fun m!282767 () Bool)

(assert (=> b!181666 m!282767))

(declare-fun m!282769 () Bool)

(assert (=> b!181661 m!282769))

(declare-fun m!282771 () Bool)

(assert (=> b!181674 m!282771))

(declare-fun m!282773 () Bool)

(assert (=> b!181674 m!282773))

(declare-fun m!282775 () Bool)

(assert (=> b!181677 m!282775))

(declare-fun m!282777 () Bool)

(assert (=> b!181667 m!282777))

(declare-fun m!282779 () Bool)

(assert (=> b!181669 m!282779))

(declare-fun m!282781 () Bool)

(assert (=> start!39946 m!282781))

(declare-fun m!282783 () Bool)

(assert (=> b!181663 m!282783))

(assert (=> b!181676 m!282771))

(assert (=> b!181676 m!282773))

(declare-fun m!282785 () Bool)

(assert (=> b!181676 m!282785))

(assert (=> b!181665 m!282769))

(declare-fun m!282787 () Bool)

(assert (=> b!181672 m!282787))

(declare-fun m!282789 () Bool)

(assert (=> b!181672 m!282789))

(declare-fun m!282791 () Bool)

(assert (=> b!181672 m!282791))

(declare-fun m!282793 () Bool)

(assert (=> b!181672 m!282793))

(declare-fun m!282795 () Bool)

(assert (=> b!181670 m!282795))

(check-sat (not b!181671) (not b!181676) (not b!181674) (not b!181663) (not b!181677) (not b!181670) (not b!181668) (not b!181666) (not b!181665) (not b!181669) (not b!181672) (not b!181661) (not b!181667) (not b!181664) (not start!39946))
