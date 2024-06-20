; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21352 () Bool)

(assert start!21352)

(declare-fun b!107479 () Bool)

(declare-fun e!70342 () Bool)

(declare-fun e!70350 () Bool)

(assert (=> b!107479 (= e!70342 e!70350)))

(declare-fun res!88569 () Bool)

(assert (=> b!107479 (=> (not res!88569) (not e!70350))))

(declare-fun lt!160869 () (_ BitVec 64))

(declare-fun lt!160853 () (_ BitVec 64))

(assert (=> b!107479 (= res!88569 (= lt!160869 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!160853)))))

(declare-datatypes ((array!4925 0))(
  ( (array!4926 (arr!2835 (Array (_ BitVec 32) (_ BitVec 8))) (size!2242 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3958 0))(
  ( (BitStream!3959 (buf!2627 array!4925) (currentByte!5151 (_ BitVec 32)) (currentBit!5146 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6586 0))(
  ( (Unit!6587) )
))
(declare-datatypes ((tuple2!8848 0))(
  ( (tuple2!8849 (_1!4681 Unit!6586) (_2!4681 BitStream!3958)) )
))
(declare-fun lt!160872 () tuple2!8848)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107479 (= lt!160869 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(declare-fun thiss!1305 () BitStream!3958)

(assert (=> b!107479 (= lt!160853 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun b!107480 () Bool)

(declare-fun e!70346 () Bool)

(declare-fun lt!160854 () (_ BitVec 64))

(declare-fun lt!160865 () (_ BitVec 64))

(assert (=> b!107480 (= e!70346 (= lt!160854 (bvsub lt!160865 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!107481 () Bool)

(declare-fun res!88574 () Bool)

(declare-fun e!70340 () Bool)

(assert (=> b!107481 (=> (not res!88574) (not e!70340))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!107481 (= res!88574 (bvslt i!615 nBits!396))))

(declare-fun b!107482 () Bool)

(declare-fun e!70341 () Bool)

(assert (=> b!107482 (= e!70340 (not e!70341))))

(declare-fun res!88567 () Bool)

(assert (=> b!107482 (=> res!88567 e!70341)))

(declare-fun lt!160859 () (_ BitVec 64))

(declare-datatypes ((tuple2!8850 0))(
  ( (tuple2!8851 (_1!4682 BitStream!3958) (_2!4682 BitStream!3958)) )
))
(declare-fun lt!160858 () tuple2!8850)

(declare-datatypes ((tuple2!8852 0))(
  ( (tuple2!8853 (_1!4683 BitStream!3958) (_2!4683 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8852)

(assert (=> b!107482 (= res!88567 (not (= (_1!4683 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!160858) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859)) (_2!4682 lt!160858))))))

(declare-fun lt!160868 () tuple2!8848)

(declare-fun lt!160875 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107482 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!160875)))

(declare-fun lt!160857 () Unit!6586)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3958 array!4925 (_ BitVec 64)) Unit!6586)

(assert (=> b!107482 (= lt!160857 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4681 lt!160872) (buf!2627 (_2!4681 lt!160868)) lt!160875))))

(assert (=> b!107482 (= lt!160875 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!160862 () (_ BitVec 64))

(declare-datatypes ((tuple2!8854 0))(
  ( (tuple2!8855 (_1!4684 BitStream!3958) (_2!4684 Bool)) )
))
(declare-fun lt!160867 () tuple2!8854)

(declare-fun lt!160860 () (_ BitVec 64))

(assert (=> b!107482 (= lt!160859 (bvor lt!160862 (ite (_2!4684 lt!160867) lt!160860 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!160876 () tuple2!8852)

(declare-fun lt!160863 () tuple2!8850)

(assert (=> b!107482 (= lt!160876 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862))))

(declare-fun lt!160874 () (_ BitVec 64))

(assert (=> b!107482 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)) lt!160874)))

(declare-fun lt!160861 () Unit!6586)

(assert (=> b!107482 (= lt!160861 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2627 (_2!4681 lt!160868)) lt!160874))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107482 (= lt!160862 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!160877 () Bool)

(assert (=> b!107482 (= (_2!4684 lt!160867) lt!160877)))

(declare-fun readBitPure!0 (BitStream!3958) tuple2!8854)

(assert (=> b!107482 (= lt!160867 (readBitPure!0 (_1!4682 lt!160863)))))

(declare-fun reader!0 (BitStream!3958 BitStream!3958) tuple2!8850)

(assert (=> b!107482 (= lt!160858 (reader!0 (_2!4681 lt!160872) (_2!4681 lt!160868)))))

(assert (=> b!107482 (= lt!160863 (reader!0 thiss!1305 (_2!4681 lt!160868)))))

(declare-fun e!70344 () Bool)

(assert (=> b!107482 e!70344))

(declare-fun res!88570 () Bool)

(assert (=> b!107482 (=> (not res!88570) (not e!70344))))

(declare-fun lt!160864 () tuple2!8854)

(declare-fun lt!160873 () tuple2!8854)

(assert (=> b!107482 (= res!88570 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160864))) (currentByte!5151 (_1!4684 lt!160864)) (currentBit!5146 (_1!4684 lt!160864))) (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160873))) (currentByte!5151 (_1!4684 lt!160873)) (currentBit!5146 (_1!4684 lt!160873)))))))

(declare-fun lt!160870 () Unit!6586)

(declare-fun lt!160856 () BitStream!3958)

(declare-fun readBitPrefixLemma!0 (BitStream!3958 BitStream!3958) Unit!6586)

(assert (=> b!107482 (= lt!160870 (readBitPrefixLemma!0 lt!160856 (_2!4681 lt!160868)))))

(assert (=> b!107482 (= lt!160873 (readBitPure!0 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))))))

(assert (=> b!107482 (= lt!160864 (readBitPure!0 lt!160856))))

(assert (=> b!107482 (= lt!160856 (BitStream!3959 (buf!2627 (_2!4681 lt!160872)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun e!70348 () Bool)

(assert (=> b!107482 e!70348))

(declare-fun res!88563 () Bool)

(assert (=> b!107482 (=> (not res!88563) (not e!70348))))

(declare-fun isPrefixOf!0 (BitStream!3958 BitStream!3958) Bool)

(assert (=> b!107482 (= res!88563 (isPrefixOf!0 thiss!1305 (_2!4681 lt!160868)))))

(declare-fun lt!160871 () Unit!6586)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3958 BitStream!3958 BitStream!3958) Unit!6586)

(assert (=> b!107482 (= lt!160871 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4681 lt!160872) (_2!4681 lt!160868)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3958 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8848)

(assert (=> b!107482 (= lt!160868 (appendNLeastSignificantBitsLoop!0 (_2!4681 lt!160872) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107482 e!70342))

(declare-fun res!88564 () Bool)

(assert (=> b!107482 (=> (not res!88564) (not e!70342))))

(assert (=> b!107482 (= res!88564 (= (size!2242 (buf!2627 thiss!1305)) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(declare-fun appendBit!0 (BitStream!3958 Bool) tuple2!8848)

(assert (=> b!107482 (= lt!160872 (appendBit!0 thiss!1305 lt!160877))))

(assert (=> b!107482 (= lt!160877 (not (= (bvand v!199 lt!160860) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107482 (= lt!160860 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107483 () Bool)

(declare-fun res!88565 () Bool)

(assert (=> b!107483 (=> (not res!88565) (not e!70340))))

(assert (=> b!107483 (= res!88565 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107484 () Bool)

(declare-fun res!88573 () Bool)

(assert (=> b!107484 (=> (not res!88573) (not e!70350))))

(assert (=> b!107484 (= res!88573 (isPrefixOf!0 thiss!1305 (_2!4681 lt!160872)))))

(declare-fun res!88566 () Bool)

(declare-fun e!70345 () Bool)

(assert (=> start!21352 (=> (not res!88566) (not e!70345))))

(assert (=> start!21352 (= res!88566 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21352 e!70345))

(assert (=> start!21352 true))

(declare-fun e!70349 () Bool)

(declare-fun inv!12 (BitStream!3958) Bool)

(assert (=> start!21352 (and (inv!12 thiss!1305) e!70349)))

(declare-fun b!107485 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107485 (= e!70348 (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160868)))))))

(declare-fun b!107486 () Bool)

(declare-fun e!70343 () Bool)

(assert (=> b!107486 (= e!70350 e!70343)))

(declare-fun res!88572 () Bool)

(assert (=> b!107486 (=> (not res!88572) (not e!70343))))

(declare-fun lt!160852 () tuple2!8854)

(assert (=> b!107486 (= res!88572 (and (= (_2!4684 lt!160852) lt!160877) (= (_1!4684 lt!160852) (_2!4681 lt!160872))))))

(declare-fun readerFrom!0 (BitStream!3958 (_ BitVec 32) (_ BitVec 32)) BitStream!3958)

(assert (=> b!107486 (= lt!160852 (readBitPure!0 (readerFrom!0 (_2!4681 lt!160872) (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305))))))

(declare-fun b!107487 () Bool)

(assert (=> b!107487 (= e!70344 (= (_2!4684 lt!160864) (_2!4684 lt!160873)))))

(declare-fun b!107488 () Bool)

(declare-fun array_inv!2044 (array!4925) Bool)

(assert (=> b!107488 (= e!70349 (array_inv!2044 (buf!2627 thiss!1305)))))

(declare-fun b!107489 () Bool)

(assert (=> b!107489 (= e!70343 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160852))) (currentByte!5151 (_1!4684 lt!160852)) (currentBit!5146 (_1!4684 lt!160852))) lt!160869))))

(declare-fun b!107490 () Bool)

(declare-fun res!88571 () Bool)

(assert (=> b!107490 (=> (not res!88571) (not e!70348))))

(assert (=> b!107490 (= res!88571 (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(declare-fun b!107491 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!3958 (_ BitVec 64)) Bool)

(assert (=> b!107491 (= e!70341 (moveBitIndexPrecond!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!107491 e!70346))

(declare-fun res!88568 () Bool)

(assert (=> b!107491 (=> (not res!88568) (not e!70346))))

(declare-fun lt!160866 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3958 (_ BitVec 64)) BitStream!3958)

(assert (=> b!107491 (= res!88568 (= (_1!4682 lt!160858) (withMovedBitIndex!0 (_2!4682 lt!160858) (bvsub lt!160865 lt!160866))))))

(assert (=> b!107491 (= lt!160865 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(assert (=> b!107491 (= (_1!4682 lt!160863) (withMovedBitIndex!0 (_2!4682 lt!160863) (bvsub lt!160854 lt!160866)))))

(assert (=> b!107491 (= lt!160866 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160868))) (currentByte!5151 (_2!4681 lt!160868)) (currentBit!5146 (_2!4681 lt!160868))))))

(assert (=> b!107491 (= lt!160854 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun lt!160878 () tuple2!8852)

(assert (=> b!107491 (and (= (_2!4683 lt!160876) (_2!4683 lt!160878)) (= (_1!4683 lt!160876) (_1!4683 lt!160878)))))

(declare-fun lt!160855 () Unit!6586)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6586)

(assert (=> b!107491 (= lt!160855 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862))))

(assert (=> b!107491 (= lt!160878 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859))))

(declare-fun b!107492 () Bool)

(assert (=> b!107492 (= e!70345 e!70340)))

(declare-fun res!88575 () Bool)

(assert (=> b!107492 (=> (not res!88575) (not e!70340))))

(assert (=> b!107492 (= res!88575 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)) lt!160874))))

(assert (=> b!107492 (= lt!160874 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!21352 res!88566) b!107492))

(assert (= (and b!107492 res!88575) b!107483))

(assert (= (and b!107483 res!88565) b!107481))

(assert (= (and b!107481 res!88574) b!107482))

(assert (= (and b!107482 res!88564) b!107479))

(assert (= (and b!107479 res!88569) b!107484))

(assert (= (and b!107484 res!88573) b!107486))

(assert (= (and b!107486 res!88572) b!107489))

(assert (= (and b!107482 res!88563) b!107490))

(assert (= (and b!107490 res!88571) b!107485))

(assert (= (and b!107482 res!88570) b!107487))

(assert (= (and b!107482 (not res!88567)) b!107491))

(assert (= (and b!107491 res!88568) b!107480))

(assert (= start!21352 b!107488))

(declare-fun m!158853 () Bool)

(assert (=> b!107488 m!158853))

(declare-fun m!158855 () Bool)

(assert (=> b!107492 m!158855))

(declare-fun m!158857 () Bool)

(assert (=> b!107483 m!158857))

(declare-fun m!158859 () Bool)

(assert (=> b!107479 m!158859))

(declare-fun m!158861 () Bool)

(assert (=> b!107479 m!158861))

(declare-fun m!158863 () Bool)

(assert (=> b!107484 m!158863))

(declare-fun m!158865 () Bool)

(assert (=> b!107489 m!158865))

(declare-fun m!158867 () Bool)

(assert (=> b!107482 m!158867))

(declare-fun m!158869 () Bool)

(assert (=> b!107482 m!158869))

(declare-fun m!158871 () Bool)

(assert (=> b!107482 m!158871))

(declare-fun m!158873 () Bool)

(assert (=> b!107482 m!158873))

(declare-fun m!158875 () Bool)

(assert (=> b!107482 m!158875))

(declare-fun m!158877 () Bool)

(assert (=> b!107482 m!158877))

(declare-fun m!158879 () Bool)

(assert (=> b!107482 m!158879))

(declare-fun m!158881 () Bool)

(assert (=> b!107482 m!158881))

(declare-fun m!158883 () Bool)

(assert (=> b!107482 m!158883))

(declare-fun m!158885 () Bool)

(assert (=> b!107482 m!158885))

(declare-fun m!158887 () Bool)

(assert (=> b!107482 m!158887))

(declare-fun m!158889 () Bool)

(assert (=> b!107482 m!158889))

(declare-fun m!158891 () Bool)

(assert (=> b!107482 m!158891))

(declare-fun m!158893 () Bool)

(assert (=> b!107482 m!158893))

(declare-fun m!158895 () Bool)

(assert (=> b!107482 m!158895))

(declare-fun m!158897 () Bool)

(assert (=> b!107482 m!158897))

(declare-fun m!158899 () Bool)

(assert (=> b!107482 m!158899))

(declare-fun m!158901 () Bool)

(assert (=> b!107482 m!158901))

(declare-fun m!158903 () Bool)

(assert (=> b!107482 m!158903))

(declare-fun m!158905 () Bool)

(assert (=> b!107486 m!158905))

(assert (=> b!107486 m!158905))

(declare-fun m!158907 () Bool)

(assert (=> b!107486 m!158907))

(declare-fun m!158909 () Bool)

(assert (=> start!21352 m!158909))

(declare-fun m!158911 () Bool)

(assert (=> b!107485 m!158911))

(declare-fun m!158913 () Bool)

(assert (=> b!107490 m!158913))

(declare-fun m!158915 () Bool)

(assert (=> b!107491 m!158915))

(declare-fun m!158917 () Bool)

(assert (=> b!107491 m!158917))

(assert (=> b!107491 m!158861))

(declare-fun m!158919 () Bool)

(assert (=> b!107491 m!158919))

(assert (=> b!107491 m!158915))

(declare-fun m!158921 () Bool)

(assert (=> b!107491 m!158921))

(declare-fun m!158923 () Bool)

(assert (=> b!107491 m!158923))

(declare-fun m!158925 () Bool)

(assert (=> b!107491 m!158925))

(declare-fun m!158927 () Bool)

(assert (=> b!107491 m!158927))

(assert (=> b!107491 m!158859))

(push 1)

(assert (not b!107490))

(assert (not b!107485))

(assert (not b!107479))

(assert (not b!107491))

(assert (not b!107483))

(assert (not b!107486))

(assert (not b!107484))

(assert (not b!107489))

(assert (not b!107488))

(assert (not b!107482))

(assert (not start!21352))

(assert (not b!107492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33972 () Bool)

(declare-fun e!70419 () Bool)

(assert (=> d!33972 e!70419))

(declare-fun res!88658 () Bool)

(assert (=> d!33972 (=> (not res!88658) (not e!70419))))

(declare-fun lt!161055 () (_ BitVec 64))

(declare-fun lt!161054 () (_ BitVec 64))

(declare-fun lt!161053 () (_ BitVec 64))

(assert (=> d!33972 (= res!88658 (= lt!161054 (bvsub lt!161053 lt!161055)))))

(assert (=> d!33972 (or (= (bvand lt!161053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161053 lt!161055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33972 (= lt!161055 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160872)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872)))))))

(declare-fun lt!161058 () (_ BitVec 64))

(declare-fun lt!161056 () (_ BitVec 64))

(assert (=> d!33972 (= lt!161053 (bvmul lt!161058 lt!161056))))

(assert (=> d!33972 (or (= lt!161058 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161056 (bvsdiv (bvmul lt!161058 lt!161056) lt!161058)))))

(assert (=> d!33972 (= lt!161056 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33972 (= lt!161058 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(assert (=> d!33972 (= lt!161054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872)))))))

(assert (=> d!33972 (invariant!0 (currentBit!5146 (_2!4681 lt!160872)) (currentByte!5151 (_2!4681 lt!160872)) (size!2242 (buf!2627 (_2!4681 lt!160872))))))

(assert (=> d!33972 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))) lt!161054)))

(declare-fun b!107581 () Bool)

(declare-fun res!88659 () Bool)

(assert (=> b!107581 (=> (not res!88659) (not e!70419))))

(assert (=> b!107581 (= res!88659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161054))))

(declare-fun b!107582 () Bool)

(declare-fun lt!161057 () (_ BitVec 64))

(assert (=> b!107582 (= e!70419 (bvsle lt!161054 (bvmul lt!161057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107582 (or (= lt!161057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161057)))))

(assert (=> b!107582 (= lt!161057 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(assert (= (and d!33972 res!88658) b!107581))

(assert (= (and b!107581 res!88659) b!107582))

(declare-fun m!159083 () Bool)

(assert (=> d!33972 m!159083))

(declare-fun m!159085 () Bool)

(assert (=> d!33972 m!159085))

(assert (=> b!107479 d!33972))

(declare-fun d!33978 () Bool)

(declare-fun e!70422 () Bool)

(assert (=> d!33978 e!70422))

(declare-fun res!88662 () Bool)

(assert (=> d!33978 (=> (not res!88662) (not e!70422))))

(declare-fun lt!161065 () (_ BitVec 64))

(declare-fun lt!161066 () (_ BitVec 64))

(declare-fun lt!161067 () (_ BitVec 64))

(assert (=> d!33978 (= res!88662 (= lt!161066 (bvsub lt!161065 lt!161067)))))

(assert (=> d!33978 (or (= (bvand lt!161065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161067 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161065 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161065 lt!161067) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33978 (= lt!161067 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305))))))

(declare-fun lt!161070 () (_ BitVec 64))

(declare-fun lt!161068 () (_ BitVec 64))

(assert (=> d!33978 (= lt!161065 (bvmul lt!161070 lt!161068))))

(assert (=> d!33978 (or (= lt!161070 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161068 (bvsdiv (bvmul lt!161070 lt!161068) lt!161070)))))

(assert (=> d!33978 (= lt!161068 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33978 (= lt!161070 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))))))

(assert (=> d!33978 (= lt!161066 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 thiss!1305))))))

(assert (=> d!33978 (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 thiss!1305)))))

(assert (=> d!33978 (= (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)) lt!161066)))

(declare-fun b!107583 () Bool)

(declare-fun res!88663 () Bool)

(assert (=> b!107583 (=> (not res!88663) (not e!70422))))

(assert (=> b!107583 (= res!88663 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161066))))

(declare-fun b!107584 () Bool)

(declare-fun lt!161069 () (_ BitVec 64))

(assert (=> b!107584 (= e!70422 (bvsle lt!161066 (bvmul lt!161069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107584 (or (= lt!161069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161069)))))

(assert (=> b!107584 (= lt!161069 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))))))

(assert (= (and d!33978 res!88662) b!107583))

(assert (= (and b!107583 res!88663) b!107584))

(declare-fun m!159087 () Bool)

(assert (=> d!33978 m!159087))

(declare-fun m!159089 () Bool)

(assert (=> d!33978 m!159089))

(assert (=> b!107479 d!33978))

(declare-fun d!33980 () Bool)

(assert (=> d!33980 (= (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160872)))) (and (bvsge (currentBit!5146 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5146 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5151 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160872)))) (and (= (currentBit!5146 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160872))))))))))

(assert (=> b!107490 d!33980))

(declare-fun d!33982 () Bool)

(declare-fun e!70424 () Bool)

(assert (=> d!33982 e!70424))

(declare-fun res!88668 () Bool)

(assert (=> d!33982 (=> (not res!88668) (not e!70424))))

(declare-fun lt!161085 () (_ BitVec 64))

(declare-fun lt!161084 () (_ BitVec 64))

(declare-fun lt!161083 () (_ BitVec 64))

(assert (=> d!33982 (= res!88668 (= lt!161084 (bvsub lt!161083 lt!161085)))))

(assert (=> d!33982 (or (= (bvand lt!161083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161085 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161083 lt!161085) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33982 (= lt!161085 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160852)))) ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160852))) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160852)))))))

(declare-fun lt!161088 () (_ BitVec 64))

(declare-fun lt!161086 () (_ BitVec 64))

(assert (=> d!33982 (= lt!161083 (bvmul lt!161088 lt!161086))))

(assert (=> d!33982 (or (= lt!161088 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161086 (bvsdiv (bvmul lt!161088 lt!161086) lt!161088)))))

(assert (=> d!33982 (= lt!161086 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33982 (= lt!161088 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160852)))))))

(assert (=> d!33982 (= lt!161084 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160852))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160852)))))))

(assert (=> d!33982 (invariant!0 (currentBit!5146 (_1!4684 lt!160852)) (currentByte!5151 (_1!4684 lt!160852)) (size!2242 (buf!2627 (_1!4684 lt!160852))))))

(assert (=> d!33982 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160852))) (currentByte!5151 (_1!4684 lt!160852)) (currentBit!5146 (_1!4684 lt!160852))) lt!161084)))

(declare-fun b!107591 () Bool)

(declare-fun res!88669 () Bool)

(assert (=> b!107591 (=> (not res!88669) (not e!70424))))

(assert (=> b!107591 (= res!88669 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161084))))

(declare-fun b!107592 () Bool)

(declare-fun lt!161087 () (_ BitVec 64))

(assert (=> b!107592 (= e!70424 (bvsle lt!161084 (bvmul lt!161087 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107592 (or (= lt!161087 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161087 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161087)))))

(assert (=> b!107592 (= lt!161087 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160852)))))))

(assert (= (and d!33982 res!88668) b!107591))

(assert (= (and b!107591 res!88669) b!107592))

(declare-fun m!159095 () Bool)

(assert (=> d!33982 m!159095))

(declare-fun m!159097 () Bool)

(assert (=> d!33982 m!159097))

(assert (=> b!107489 d!33982))

(declare-fun d!33986 () Bool)

(assert (=> d!33986 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!160875) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872)))) lt!160875))))

(declare-fun bs!8290 () Bool)

(assert (= bs!8290 d!33986))

(declare-fun m!159101 () Bool)

(assert (=> bs!8290 m!159101))

(assert (=> b!107482 d!33986))

(declare-fun b!107639 () Bool)

(declare-fun res!88709 () Bool)

(declare-fun lt!161265 () tuple2!8848)

(assert (=> b!107639 (= res!88709 (isPrefixOf!0 (_2!4681 lt!160872) (_2!4681 lt!161265)))))

(declare-fun e!70454 () Bool)

(assert (=> b!107639 (=> (not res!88709) (not e!70454))))

(declare-fun b!107640 () Bool)

(declare-fun res!88704 () Bool)

(assert (=> b!107640 (= res!88704 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161265))) (currentByte!5151 (_2!4681 lt!161265)) (currentBit!5146 (_2!4681 lt!161265))) (bvadd (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!107640 (=> (not res!88704) (not e!70454))))

(declare-fun b!107641 () Bool)

(declare-fun e!70452 () tuple2!8848)

(declare-fun lt!161304 () Unit!6586)

(assert (=> b!107641 (= e!70452 (tuple2!8849 lt!161304 (_2!4681 lt!160872)))))

(declare-fun lt!161294 () BitStream!3958)

(assert (=> b!107641 (= lt!161294 (_2!4681 lt!160872))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3958) Unit!6586)

(assert (=> b!107641 (= lt!161304 (lemmaIsPrefixRefl!0 lt!161294))))

(declare-fun call!1362 () Bool)

(assert (=> b!107641 call!1362))

(declare-fun b!107642 () Bool)

(declare-fun e!70453 () Bool)

(declare-fun lt!161266 () tuple2!8854)

(declare-fun lt!161302 () tuple2!8854)

(assert (=> b!107642 (= e!70453 (= (_2!4684 lt!161266) (_2!4684 lt!161302)))))

(declare-fun b!107643 () Bool)

(declare-fun res!88705 () Bool)

(declare-fun e!70450 () Bool)

(assert (=> b!107643 (=> (not res!88705) (not e!70450))))

(declare-fun lt!161285 () tuple2!8848)

(assert (=> b!107643 (= res!88705 (isPrefixOf!0 (_2!4681 lt!160872) (_2!4681 lt!161285)))))

(declare-fun b!107644 () Bool)

(declare-fun lt!161282 () tuple2!8854)

(assert (=> b!107644 (= lt!161282 (readBitPure!0 (readerFrom!0 (_2!4681 lt!161265) (currentBit!5146 (_2!4681 lt!160872)) (currentByte!5151 (_2!4681 lt!160872)))))))

(declare-fun res!88706 () Bool)

(declare-fun lt!161286 () Bool)

(assert (=> b!107644 (= res!88706 (and (= (_2!4684 lt!161282) lt!161286) (= (_1!4684 lt!161282) (_2!4681 lt!161265))))))

(declare-fun e!70451 () Bool)

(assert (=> b!107644 (=> (not res!88706) (not e!70451))))

(assert (=> b!107644 (= e!70454 e!70451)))

(declare-fun b!107645 () Bool)

(declare-fun e!70449 () (_ BitVec 64))

(assert (=> b!107645 (= e!70449 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161284 () tuple2!8852)

(declare-fun b!107646 () Bool)

(declare-fun lt!161272 () tuple2!8850)

(assert (=> b!107646 (= e!70450 (and (= (_2!4683 lt!161284) v!199) (= (_1!4683 lt!161284) (_2!4682 lt!161272))))))

(declare-fun lt!161279 () (_ BitVec 64))

(assert (=> b!107646 (= lt!161284 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!161272) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161279))))

(declare-fun lt!161269 () Unit!6586)

(declare-fun lt!161267 () Unit!6586)

(assert (=> b!107646 (= lt!161269 lt!161267)))

(declare-fun lt!161289 () (_ BitVec 64))

(assert (=> b!107646 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!161285)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!161289)))

(assert (=> b!107646 (= lt!161267 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4681 lt!160872) (buf!2627 (_2!4681 lt!161285)) lt!161289))))

(declare-fun e!70455 () Bool)

(assert (=> b!107646 e!70455))

(declare-fun res!88710 () Bool)

(assert (=> b!107646 (=> (not res!88710) (not e!70455))))

(assert (=> b!107646 (= res!88710 (and (= (size!2242 (buf!2627 (_2!4681 lt!160872))) (size!2242 (buf!2627 (_2!4681 lt!161285)))) (bvsge lt!161289 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107646 (= lt!161289 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107646 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107646 (= lt!161279 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!107646 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107646 (= lt!161272 (reader!0 (_2!4681 lt!160872) (_2!4681 lt!161285)))))

(declare-fun lt!161288 () tuple2!8848)

(declare-fun bm!1359 () Bool)

(declare-fun c!6638 () Bool)

(assert (=> bm!1359 (= call!1362 (isPrefixOf!0 (ite c!6638 (_2!4681 lt!160872) lt!161294) (ite c!6638 (_2!4681 lt!161288) lt!161294)))))

(declare-fun d!33990 () Bool)

(assert (=> d!33990 e!70450))

(declare-fun res!88708 () Bool)

(assert (=> d!33990 (=> (not res!88708) (not e!70450))))

(assert (=> d!33990 (= res!88708 (= (size!2242 (buf!2627 (_2!4681 lt!160872))) (size!2242 (buf!2627 (_2!4681 lt!161285)))))))

(assert (=> d!33990 (= lt!161285 e!70452)))

(assert (=> d!33990 (= c!6638 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33990 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33990 (= (appendNLeastSignificantBitsLoop!0 (_2!4681 lt!160872) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!161285)))

(declare-fun b!107647 () Bool)

(assert (=> b!107647 (= e!70455 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160872)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!161289))))

(declare-fun b!107648 () Bool)

(declare-fun res!88707 () Bool)

(assert (=> b!107648 (=> (not res!88707) (not e!70450))))

(declare-fun lt!161271 () (_ BitVec 64))

(declare-fun lt!161309 () (_ BitVec 64))

(assert (=> b!107648 (= res!88707 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161285))) (currentByte!5151 (_2!4681 lt!161285)) (currentBit!5146 (_2!4681 lt!161285))) (bvadd lt!161309 lt!161271)))))

(assert (=> b!107648 (or (not (= (bvand lt!161309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161271 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161309 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161309 lt!161271) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107648 (= lt!161271 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107648 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107648 (= lt!161309 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(declare-fun b!107649 () Bool)

(assert (=> b!107649 (= e!70449 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!107650 () Bool)

(assert (=> b!107650 (= e!70451 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161282))) (currentByte!5151 (_1!4684 lt!161282)) (currentBit!5146 (_1!4684 lt!161282))) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161265))) (currentByte!5151 (_2!4681 lt!161265)) (currentBit!5146 (_2!4681 lt!161265)))))))

(declare-fun b!107651 () Bool)

(declare-fun Unit!6593 () Unit!6586)

(assert (=> b!107651 (= e!70452 (tuple2!8849 Unit!6593 (_2!4681 lt!161288)))))

(assert (=> b!107651 (= lt!161286 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107651 (= lt!161265 (appendBit!0 (_2!4681 lt!160872) lt!161286))))

(declare-fun res!88702 () Bool)

(assert (=> b!107651 (= res!88702 (= (size!2242 (buf!2627 (_2!4681 lt!160872))) (size!2242 (buf!2627 (_2!4681 lt!161265)))))))

(assert (=> b!107651 (=> (not res!88702) (not e!70454))))

(assert (=> b!107651 e!70454))

(declare-fun lt!161283 () tuple2!8848)

(assert (=> b!107651 (= lt!161283 lt!161265)))

(assert (=> b!107651 (= lt!161288 (appendNLeastSignificantBitsLoop!0 (_2!4681 lt!161283) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!161307 () Unit!6586)

(assert (=> b!107651 (= lt!161307 (lemmaIsPrefixTransitive!0 (_2!4681 lt!160872) (_2!4681 lt!161283) (_2!4681 lt!161288)))))

(assert (=> b!107651 call!1362))

(declare-fun lt!161293 () Unit!6586)

(assert (=> b!107651 (= lt!161293 lt!161307)))

(assert (=> b!107651 (invariant!0 (currentBit!5146 (_2!4681 lt!160872)) (currentByte!5151 (_2!4681 lt!160872)) (size!2242 (buf!2627 (_2!4681 lt!161283))))))

(declare-fun lt!161277 () BitStream!3958)

(assert (=> b!107651 (= lt!161277 (BitStream!3959 (buf!2627 (_2!4681 lt!161283)) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(assert (=> b!107651 (invariant!0 (currentBit!5146 lt!161277) (currentByte!5151 lt!161277) (size!2242 (buf!2627 (_2!4681 lt!161288))))))

(declare-fun lt!161278 () BitStream!3958)

(assert (=> b!107651 (= lt!161278 (BitStream!3959 (buf!2627 (_2!4681 lt!161288)) (currentByte!5151 lt!161277) (currentBit!5146 lt!161277)))))

(assert (=> b!107651 (= lt!161266 (readBitPure!0 lt!161277))))

(assert (=> b!107651 (= lt!161302 (readBitPure!0 lt!161278))))

(declare-fun lt!161301 () Unit!6586)

(assert (=> b!107651 (= lt!161301 (readBitPrefixLemma!0 lt!161277 (_2!4681 lt!161288)))))

(declare-fun res!88703 () Bool)

(assert (=> b!107651 (= res!88703 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161266))) (currentByte!5151 (_1!4684 lt!161266)) (currentBit!5146 (_1!4684 lt!161266))) (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161302))) (currentByte!5151 (_1!4684 lt!161302)) (currentBit!5146 (_1!4684 lt!161302)))))))

(assert (=> b!107651 (=> (not res!88703) (not e!70453))))

(assert (=> b!107651 e!70453))

(declare-fun lt!161298 () Unit!6586)

(assert (=> b!107651 (= lt!161298 lt!161301)))

(declare-fun lt!161296 () tuple2!8850)

(assert (=> b!107651 (= lt!161296 (reader!0 (_2!4681 lt!160872) (_2!4681 lt!161288)))))

(declare-fun lt!161274 () tuple2!8850)

(assert (=> b!107651 (= lt!161274 (reader!0 (_2!4681 lt!161283) (_2!4681 lt!161288)))))

(declare-fun lt!161275 () tuple2!8854)

(assert (=> b!107651 (= lt!161275 (readBitPure!0 (_1!4682 lt!161296)))))

(assert (=> b!107651 (= (_2!4684 lt!161275) lt!161286)))

(declare-fun lt!161281 () Unit!6586)

(declare-fun Unit!6594 () Unit!6586)

(assert (=> b!107651 (= lt!161281 Unit!6594)))

(declare-fun lt!161292 () (_ BitVec 64))

(assert (=> b!107651 (= lt!161292 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!161305 () (_ BitVec 64))

(assert (=> b!107651 (= lt!161305 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!161299 () Unit!6586)

(assert (=> b!107651 (= lt!161299 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4681 lt!160872) (buf!2627 (_2!4681 lt!161288)) lt!161305))))

(assert (=> b!107651 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!161288)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!161305)))

(declare-fun lt!161291 () Unit!6586)

(assert (=> b!107651 (= lt!161291 lt!161299)))

(declare-fun lt!161306 () tuple2!8852)

(assert (=> b!107651 (= lt!161306 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!161296) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161292))))

(declare-fun lt!161276 () (_ BitVec 64))

(assert (=> b!107651 (= lt!161276 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!161280 () Unit!6586)

(assert (=> b!107651 (= lt!161280 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4681 lt!161283) (buf!2627 (_2!4681 lt!161288)) lt!161276))))

(assert (=> b!107651 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!161288)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!161283))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!161283))) lt!161276)))

(declare-fun lt!161273 () Unit!6586)

(assert (=> b!107651 (= lt!161273 lt!161280)))

(declare-fun lt!161300 () tuple2!8852)

(assert (=> b!107651 (= lt!161300 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!161274) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!161292 (ite (_2!4684 lt!161275) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!161295 () tuple2!8852)

(assert (=> b!107651 (= lt!161295 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!161296) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161292))))

(declare-fun c!6637 () Bool)

(assert (=> b!107651 (= c!6637 (_2!4684 (readBitPure!0 (_1!4682 lt!161296))))))

(declare-fun lt!161303 () tuple2!8852)

(assert (=> b!107651 (= lt!161303 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4682 lt!161296) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!161292 e!70449)))))

(declare-fun lt!161290 () Unit!6586)

(assert (=> b!107651 (= lt!161290 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4682 lt!161296) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161292))))

(assert (=> b!107651 (and (= (_2!4683 lt!161295) (_2!4683 lt!161303)) (= (_1!4683 lt!161295) (_1!4683 lt!161303)))))

(declare-fun lt!161270 () Unit!6586)

(assert (=> b!107651 (= lt!161270 lt!161290)))

(assert (=> b!107651 (= (_1!4682 lt!161296) (withMovedBitIndex!0 (_2!4682 lt!161296) (bvsub (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161288))) (currentByte!5151 (_2!4681 lt!161288)) (currentBit!5146 (_2!4681 lt!161288))))))))

(declare-fun lt!161287 () Unit!6586)

(declare-fun Unit!6595 () Unit!6586)

(assert (=> b!107651 (= lt!161287 Unit!6595)))

(assert (=> b!107651 (= (_1!4682 lt!161274) (withMovedBitIndex!0 (_2!4682 lt!161274) (bvsub (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161283))) (currentByte!5151 (_2!4681 lt!161283)) (currentBit!5146 (_2!4681 lt!161283))) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161288))) (currentByte!5151 (_2!4681 lt!161288)) (currentBit!5146 (_2!4681 lt!161288))))))))

(declare-fun lt!161297 () Unit!6586)

(declare-fun Unit!6596 () Unit!6586)

(assert (=> b!107651 (= lt!161297 Unit!6596)))

(assert (=> b!107651 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))) (bvsub (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161283))) (currentByte!5151 (_2!4681 lt!161283)) (currentBit!5146 (_2!4681 lt!161283))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!161268 () Unit!6586)

(declare-fun Unit!6598 () Unit!6586)

(assert (=> b!107651 (= lt!161268 Unit!6598)))

(assert (=> b!107651 (= (_2!4683 lt!161306) (_2!4683 lt!161300))))

(declare-fun lt!161308 () Unit!6586)

(declare-fun Unit!6599 () Unit!6586)

(assert (=> b!107651 (= lt!161308 Unit!6599)))

(assert (=> b!107651 (= (_1!4683 lt!161306) (_2!4682 lt!161296))))

(assert (= (and d!33990 c!6638) b!107651))

(assert (= (and d!33990 (not c!6638)) b!107641))

(assert (= (and b!107651 res!88702) b!107640))

(assert (= (and b!107640 res!88704) b!107639))

(assert (= (and b!107639 res!88709) b!107644))

(assert (= (and b!107644 res!88706) b!107650))

(assert (= (and b!107651 res!88703) b!107642))

(assert (= (and b!107651 c!6637) b!107649))

(assert (= (and b!107651 (not c!6637)) b!107645))

(assert (= (or b!107651 b!107641) bm!1359))

(assert (= (and d!33990 res!88708) b!107648))

(assert (= (and b!107648 res!88707) b!107643))

(assert (= (and b!107643 res!88705) b!107646))

(assert (= (and b!107646 res!88710) b!107647))

(declare-fun m!159153 () Bool)

(assert (=> b!107647 m!159153))

(declare-fun m!159155 () Bool)

(assert (=> b!107644 m!159155))

(assert (=> b!107644 m!159155))

(declare-fun m!159157 () Bool)

(assert (=> b!107644 m!159157))

(declare-fun m!159159 () Bool)

(assert (=> b!107650 m!159159))

(declare-fun m!159161 () Bool)

(assert (=> b!107650 m!159161))

(declare-fun m!159163 () Bool)

(assert (=> b!107641 m!159163))

(declare-fun m!159165 () Bool)

(assert (=> b!107648 m!159165))

(assert (=> b!107648 m!158859))

(assert (=> b!107640 m!159161))

(assert (=> b!107640 m!158859))

(declare-fun m!159167 () Bool)

(assert (=> b!107643 m!159167))

(declare-fun m!159169 () Bool)

(assert (=> bm!1359 m!159169))

(declare-fun m!159171 () Bool)

(assert (=> b!107651 m!159171))

(declare-fun m!159173 () Bool)

(assert (=> b!107651 m!159173))

(declare-fun m!159175 () Bool)

(assert (=> b!107651 m!159175))

(declare-fun m!159177 () Bool)

(assert (=> b!107651 m!159177))

(declare-fun m!159179 () Bool)

(assert (=> b!107651 m!159179))

(declare-fun m!159181 () Bool)

(assert (=> b!107651 m!159181))

(declare-fun m!159183 () Bool)

(assert (=> b!107651 m!159183))

(declare-fun m!159185 () Bool)

(assert (=> b!107651 m!159185))

(declare-fun m!159187 () Bool)

(assert (=> b!107651 m!159187))

(declare-fun m!159189 () Bool)

(assert (=> b!107651 m!159189))

(declare-fun m!159191 () Bool)

(assert (=> b!107651 m!159191))

(declare-fun m!159193 () Bool)

(assert (=> b!107651 m!159193))

(declare-fun m!159195 () Bool)

(assert (=> b!107651 m!159195))

(assert (=> b!107651 m!158859))

(declare-fun m!159197 () Bool)

(assert (=> b!107651 m!159197))

(declare-fun m!159199 () Bool)

(assert (=> b!107651 m!159199))

(declare-fun m!159201 () Bool)

(assert (=> b!107651 m!159201))

(declare-fun m!159203 () Bool)

(assert (=> b!107651 m!159203))

(declare-fun m!159205 () Bool)

(assert (=> b!107651 m!159205))

(declare-fun m!159207 () Bool)

(assert (=> b!107651 m!159207))

(declare-fun m!159209 () Bool)

(assert (=> b!107651 m!159209))

(declare-fun m!159211 () Bool)

(assert (=> b!107651 m!159211))

(declare-fun m!159213 () Bool)

(assert (=> b!107651 m!159213))

(assert (=> b!107651 m!159177))

(declare-fun m!159215 () Bool)

(assert (=> b!107651 m!159215))

(declare-fun m!159217 () Bool)

(assert (=> b!107651 m!159217))

(declare-fun m!159219 () Bool)

(assert (=> b!107651 m!159219))

(declare-fun m!159221 () Bool)

(assert (=> b!107651 m!159221))

(declare-fun m!159223 () Bool)

(assert (=> b!107651 m!159223))

(declare-fun m!159225 () Bool)

(assert (=> b!107646 m!159225))

(declare-fun m!159227 () Bool)

(assert (=> b!107646 m!159227))

(declare-fun m!159229 () Bool)

(assert (=> b!107646 m!159229))

(assert (=> b!107646 m!159201))

(declare-fun m!159231 () Bool)

(assert (=> b!107646 m!159231))

(declare-fun m!159233 () Bool)

(assert (=> b!107639 m!159233))

(assert (=> b!107482 d!33990))

(declare-fun d!34004 () Bool)

(declare-datatypes ((tuple2!8876 0))(
  ( (tuple2!8877 (_1!4695 (_ BitVec 64)) (_2!4695 BitStream!3958)) )
))
(declare-fun lt!161312 () tuple2!8876)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8876)

(assert (=> d!34004 (= lt!161312 (readNLeastSignificantBitsLoop!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862))))

(assert (=> d!34004 (= (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862) (tuple2!8853 (_2!4695 lt!161312) (_1!4695 lt!161312)))))

(declare-fun bs!8295 () Bool)

(assert (= bs!8295 d!34004))

(declare-fun m!159235 () Bool)

(assert (=> bs!8295 m!159235))

(assert (=> b!107482 d!34004))

(declare-fun lt!161313 () tuple2!8876)

(declare-fun d!34006 () Bool)

(assert (=> d!34006 (= lt!161313 (readNLeastSignificantBitsLoop!0 (_1!4682 lt!160858) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859))))

(assert (=> d!34006 (= (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!160858) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859) (tuple2!8853 (_2!4695 lt!161313) (_1!4695 lt!161313)))))

(declare-fun bs!8296 () Bool)

(assert (= bs!8296 d!34006))

(declare-fun m!159237 () Bool)

(assert (=> bs!8296 m!159237))

(assert (=> b!107482 d!34006))

(declare-fun d!34008 () Bool)

(declare-fun e!70456 () Bool)

(assert (=> d!34008 e!70456))

(declare-fun res!88711 () Bool)

(assert (=> d!34008 (=> (not res!88711) (not e!70456))))

(declare-fun lt!161315 () (_ BitVec 64))

(declare-fun lt!161314 () (_ BitVec 64))

(declare-fun lt!161316 () (_ BitVec 64))

(assert (=> d!34008 (= res!88711 (= lt!161315 (bvsub lt!161314 lt!161316)))))

(assert (=> d!34008 (or (= (bvand lt!161314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161316 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161314 lt!161316) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34008 (= lt!161316 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160873)))) ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160873))) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160873)))))))

(declare-fun lt!161319 () (_ BitVec 64))

(declare-fun lt!161317 () (_ BitVec 64))

(assert (=> d!34008 (= lt!161314 (bvmul lt!161319 lt!161317))))

(assert (=> d!34008 (or (= lt!161319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161317 (bvsdiv (bvmul lt!161319 lt!161317) lt!161319)))))

(assert (=> d!34008 (= lt!161317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34008 (= lt!161319 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160873)))))))

(assert (=> d!34008 (= lt!161315 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160873))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160873)))))))

(assert (=> d!34008 (invariant!0 (currentBit!5146 (_1!4684 lt!160873)) (currentByte!5151 (_1!4684 lt!160873)) (size!2242 (buf!2627 (_1!4684 lt!160873))))))

(assert (=> d!34008 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160873))) (currentByte!5151 (_1!4684 lt!160873)) (currentBit!5146 (_1!4684 lt!160873))) lt!161315)))

(declare-fun b!107652 () Bool)

(declare-fun res!88712 () Bool)

(assert (=> b!107652 (=> (not res!88712) (not e!70456))))

(assert (=> b!107652 (= res!88712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161315))))

(declare-fun b!107653 () Bool)

(declare-fun lt!161318 () (_ BitVec 64))

(assert (=> b!107653 (= e!70456 (bvsle lt!161315 (bvmul lt!161318 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107653 (or (= lt!161318 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161318 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161318)))))

(assert (=> b!107653 (= lt!161318 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160873)))))))

(assert (= (and d!34008 res!88711) b!107652))

(assert (= (and b!107652 res!88712) b!107653))

(declare-fun m!159239 () Bool)

(assert (=> d!34008 m!159239))

(declare-fun m!159241 () Bool)

(assert (=> d!34008 m!159241))

(assert (=> b!107482 d!34008))

(declare-fun d!34010 () Bool)

(declare-datatypes ((tuple2!8878 0))(
  ( (tuple2!8879 (_1!4696 Bool) (_2!4696 BitStream!3958)) )
))
(declare-fun lt!161322 () tuple2!8878)

(declare-fun readBit!0 (BitStream!3958) tuple2!8878)

(assert (=> d!34010 (= lt!161322 (readBit!0 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))))))

(assert (=> d!34010 (= (readBitPure!0 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))) (tuple2!8855 (_2!4696 lt!161322) (_1!4696 lt!161322)))))

(declare-fun bs!8297 () Bool)

(assert (= bs!8297 d!34010))

(declare-fun m!159243 () Bool)

(assert (=> bs!8297 m!159243))

(assert (=> b!107482 d!34010))

(declare-fun d!34012 () Bool)

(declare-fun lt!161323 () tuple2!8878)

(assert (=> d!34012 (= lt!161323 (readBit!0 (_1!4682 lt!160863)))))

(assert (=> d!34012 (= (readBitPure!0 (_1!4682 lt!160863)) (tuple2!8855 (_2!4696 lt!161323) (_1!4696 lt!161323)))))

(declare-fun bs!8298 () Bool)

(assert (= bs!8298 d!34012))

(declare-fun m!159245 () Bool)

(assert (=> bs!8298 m!159245))

(assert (=> b!107482 d!34012))

(declare-fun d!34014 () Bool)

(declare-fun lt!161324 () tuple2!8878)

(assert (=> d!34014 (= lt!161324 (readBit!0 lt!160856))))

(assert (=> d!34014 (= (readBitPure!0 lt!160856) (tuple2!8855 (_2!4696 lt!161324) (_1!4696 lt!161324)))))

(declare-fun bs!8299 () Bool)

(assert (= bs!8299 d!34014))

(declare-fun m!159247 () Bool)

(assert (=> bs!8299 m!159247))

(assert (=> b!107482 d!34014))

(declare-fun d!34016 () Bool)

(assert (=> d!34016 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107482 d!34016))

(declare-fun d!34018 () Bool)

(declare-fun res!88730 () Bool)

(declare-fun e!70469 () Bool)

(assert (=> d!34018 (=> (not res!88730) (not e!70469))))

(assert (=> d!34018 (= res!88730 (= (size!2242 (buf!2627 thiss!1305)) (size!2242 (buf!2627 (_2!4681 lt!160868)))))))

(assert (=> d!34018 (= (isPrefixOf!0 thiss!1305 (_2!4681 lt!160868)) e!70469)))

(declare-fun b!107674 () Bool)

(declare-fun res!88731 () Bool)

(assert (=> b!107674 (=> (not res!88731) (not e!70469))))

(assert (=> b!107674 (= res!88731 (bvsle (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160868))) (currentByte!5151 (_2!4681 lt!160868)) (currentBit!5146 (_2!4681 lt!160868)))))))

(declare-fun b!107675 () Bool)

(declare-fun e!70470 () Bool)

(assert (=> b!107675 (= e!70469 e!70470)))

(declare-fun res!88729 () Bool)

(assert (=> b!107675 (=> res!88729 e!70470)))

(assert (=> b!107675 (= res!88729 (= (size!2242 (buf!2627 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107676 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4925 array!4925 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107676 (= e!70470 (arrayBitRangesEq!0 (buf!2627 thiss!1305) (buf!2627 (_2!4681 lt!160868)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))))))

(assert (= (and d!34018 res!88730) b!107674))

(assert (= (and b!107674 res!88731) b!107675))

(assert (= (and b!107675 (not res!88729)) b!107676))

(assert (=> b!107674 m!158861))

(assert (=> b!107674 m!158925))

(assert (=> b!107676 m!158861))

(assert (=> b!107676 m!158861))

(declare-fun m!159249 () Bool)

(assert (=> b!107676 m!159249))

(assert (=> b!107482 d!34018))

(declare-fun d!34020 () Bool)

(assert (=> d!34020 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)) lt!160874) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305))) lt!160874))))

(declare-fun bs!8300 () Bool)

(assert (= bs!8300 d!34020))

(declare-fun m!159251 () Bool)

(assert (=> bs!8300 m!159251))

(assert (=> b!107482 d!34020))

(declare-fun d!34022 () Bool)

(assert (=> d!34022 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160872))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160872))) lt!160875)))

(declare-fun lt!161387 () Unit!6586)

(declare-fun choose!9 (BitStream!3958 array!4925 (_ BitVec 64) BitStream!3958) Unit!6586)

(assert (=> d!34022 (= lt!161387 (choose!9 (_2!4681 lt!160872) (buf!2627 (_2!4681 lt!160868)) lt!160875 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872)))))))

(assert (=> d!34022 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4681 lt!160872) (buf!2627 (_2!4681 lt!160868)) lt!160875) lt!161387)))

(declare-fun bs!8301 () Bool)

(assert (= bs!8301 d!34022))

(assert (=> bs!8301 m!158893))

(declare-fun m!159253 () Bool)

(assert (=> bs!8301 m!159253))

(assert (=> b!107482 d!34022))

(declare-fun d!34024 () Bool)

(declare-fun e!70479 () Bool)

(assert (=> d!34024 e!70479))

(declare-fun res!88742 () Bool)

(assert (=> d!34024 (=> (not res!88742) (not e!70479))))

(declare-fun lt!161426 () tuple2!8854)

(declare-fun lt!161429 () tuple2!8854)

(assert (=> d!34024 (= res!88742 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161426))) (currentByte!5151 (_1!4684 lt!161426)) (currentBit!5146 (_1!4684 lt!161426))) (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161429))) (currentByte!5151 (_1!4684 lt!161429)) (currentBit!5146 (_1!4684 lt!161429)))))))

(declare-fun lt!161427 () Unit!6586)

(declare-fun lt!161428 () BitStream!3958)

(declare-fun choose!50 (BitStream!3958 BitStream!3958 BitStream!3958 tuple2!8854 tuple2!8854 BitStream!3958 Bool tuple2!8854 tuple2!8854 BitStream!3958 Bool) Unit!6586)

(assert (=> d!34024 (= lt!161427 (choose!50 lt!160856 (_2!4681 lt!160868) lt!161428 lt!161426 (tuple2!8855 (_1!4684 lt!161426) (_2!4684 lt!161426)) (_1!4684 lt!161426) (_2!4684 lt!161426) lt!161429 (tuple2!8855 (_1!4684 lt!161429) (_2!4684 lt!161429)) (_1!4684 lt!161429) (_2!4684 lt!161429)))))

(assert (=> d!34024 (= lt!161429 (readBitPure!0 lt!161428))))

(assert (=> d!34024 (= lt!161426 (readBitPure!0 lt!160856))))

(assert (=> d!34024 (= lt!161428 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 lt!160856) (currentBit!5146 lt!160856)))))

(assert (=> d!34024 (invariant!0 (currentBit!5146 lt!160856) (currentByte!5151 lt!160856) (size!2242 (buf!2627 (_2!4681 lt!160868))))))

(assert (=> d!34024 (= (readBitPrefixLemma!0 lt!160856 (_2!4681 lt!160868)) lt!161427)))

(declare-fun b!107691 () Bool)

(assert (=> b!107691 (= e!70479 (= (_2!4684 lt!161426) (_2!4684 lt!161429)))))

(assert (= (and d!34024 res!88742) b!107691))

(declare-fun m!159255 () Bool)

(assert (=> d!34024 m!159255))

(declare-fun m!159257 () Bool)

(assert (=> d!34024 m!159257))

(declare-fun m!159259 () Bool)

(assert (=> d!34024 m!159259))

(declare-fun m!159261 () Bool)

(assert (=> d!34024 m!159261))

(assert (=> d!34024 m!158877))

(declare-fun m!159263 () Bool)

(assert (=> d!34024 m!159263))

(assert (=> b!107482 d!34024))

(declare-fun b!107719 () Bool)

(declare-fun e!70492 () Bool)

(declare-fun lt!161493 () tuple2!8854)

(declare-fun lt!161494 () tuple2!8848)

(assert (=> b!107719 (= e!70492 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!161493))) (currentByte!5151 (_1!4684 lt!161493)) (currentBit!5146 (_1!4684 lt!161493))) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161494))) (currentByte!5151 (_2!4681 lt!161494)) (currentBit!5146 (_2!4681 lt!161494)))))))

(declare-fun d!34026 () Bool)

(declare-fun e!70493 () Bool)

(assert (=> d!34026 e!70493))

(declare-fun res!88765 () Bool)

(assert (=> d!34026 (=> (not res!88765) (not e!70493))))

(assert (=> d!34026 (= res!88765 (= (size!2242 (buf!2627 thiss!1305)) (size!2242 (buf!2627 (_2!4681 lt!161494)))))))

(declare-fun choose!16 (BitStream!3958 Bool) tuple2!8848)

(assert (=> d!34026 (= lt!161494 (choose!16 thiss!1305 lt!160877))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34026 (validate_offset_bit!0 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)))))

(assert (=> d!34026 (= (appendBit!0 thiss!1305 lt!160877) lt!161494)))

(declare-fun b!107717 () Bool)

(declare-fun res!88762 () Bool)

(assert (=> b!107717 (=> (not res!88762) (not e!70493))))

(assert (=> b!107717 (= res!88762 (isPrefixOf!0 thiss!1305 (_2!4681 lt!161494)))))

(declare-fun b!107718 () Bool)

(assert (=> b!107718 (= e!70493 e!70492)))

(declare-fun res!88763 () Bool)

(assert (=> b!107718 (=> (not res!88763) (not e!70492))))

(assert (=> b!107718 (= res!88763 (and (= (_2!4684 lt!161493) lt!160877) (= (_1!4684 lt!161493) (_2!4681 lt!161494))))))

(assert (=> b!107718 (= lt!161493 (readBitPure!0 (readerFrom!0 (_2!4681 lt!161494) (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305))))))

(declare-fun b!107716 () Bool)

(declare-fun res!88764 () Bool)

(assert (=> b!107716 (=> (not res!88764) (not e!70493))))

(declare-fun lt!161496 () (_ BitVec 64))

(declare-fun lt!161495 () (_ BitVec 64))

(assert (=> b!107716 (= res!88764 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!161494))) (currentByte!5151 (_2!4681 lt!161494)) (currentBit!5146 (_2!4681 lt!161494))) (bvadd lt!161495 lt!161496)))))

(assert (=> b!107716 (or (not (= (bvand lt!161495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161496 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161495 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161495 lt!161496) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107716 (= lt!161496 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!107716 (= lt!161495 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(assert (= (and d!34026 res!88765) b!107716))

(assert (= (and b!107716 res!88764) b!107717))

(assert (= (and b!107717 res!88762) b!107718))

(assert (= (and b!107718 res!88763) b!107719))

(declare-fun m!159363 () Bool)

(assert (=> b!107718 m!159363))

(assert (=> b!107718 m!159363))

(declare-fun m!159365 () Bool)

(assert (=> b!107718 m!159365))

(declare-fun m!159367 () Bool)

(assert (=> d!34026 m!159367))

(declare-fun m!159369 () Bool)

(assert (=> d!34026 m!159369))

(declare-fun m!159371 () Bool)

(assert (=> b!107719 m!159371))

(declare-fun m!159373 () Bool)

(assert (=> b!107719 m!159373))

(declare-fun m!159375 () Bool)

(assert (=> b!107717 m!159375))

(assert (=> b!107716 m!159373))

(assert (=> b!107716 m!158861))

(assert (=> b!107482 d!34026))

(declare-fun e!70516 () Bool)

(declare-fun b!107764 () Bool)

(declare-fun lt!161602 () (_ BitVec 64))

(declare-fun lt!161599 () (_ BitVec 64))

(declare-fun lt!161589 () tuple2!8850)

(assert (=> b!107764 (= e!70516 (= (_1!4682 lt!161589) (withMovedBitIndex!0 (_2!4682 lt!161589) (bvsub lt!161602 lt!161599))))))

(assert (=> b!107764 (or (= (bvand lt!161602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161599 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161602 lt!161599) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107764 (= lt!161599 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160868))) (currentByte!5151 (_2!4681 lt!160868)) (currentBit!5146 (_2!4681 lt!160868))))))

(assert (=> b!107764 (= lt!161602 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun d!34044 () Bool)

(assert (=> d!34044 e!70516))

(declare-fun res!88804 () Bool)

(assert (=> d!34044 (=> (not res!88804) (not e!70516))))

(assert (=> d!34044 (= res!88804 (isPrefixOf!0 (_1!4682 lt!161589) (_2!4682 lt!161589)))))

(declare-fun lt!161600 () BitStream!3958)

(assert (=> d!34044 (= lt!161589 (tuple2!8851 lt!161600 (_2!4681 lt!160868)))))

(declare-fun lt!161588 () Unit!6586)

(declare-fun lt!161585 () Unit!6586)

(assert (=> d!34044 (= lt!161588 lt!161585)))

(assert (=> d!34044 (isPrefixOf!0 lt!161600 (_2!4681 lt!160868))))

(assert (=> d!34044 (= lt!161585 (lemmaIsPrefixTransitive!0 lt!161600 (_2!4681 lt!160868) (_2!4681 lt!160868)))))

(declare-fun lt!161587 () Unit!6586)

(declare-fun lt!161604 () Unit!6586)

(assert (=> d!34044 (= lt!161587 lt!161604)))

(assert (=> d!34044 (isPrefixOf!0 lt!161600 (_2!4681 lt!160868))))

(assert (=> d!34044 (= lt!161604 (lemmaIsPrefixTransitive!0 lt!161600 thiss!1305 (_2!4681 lt!160868)))))

(declare-fun lt!161591 () Unit!6586)

(declare-fun e!70517 () Unit!6586)

(assert (=> d!34044 (= lt!161591 e!70517)))

(declare-fun c!6648 () Bool)

(assert (=> d!34044 (= c!6648 (not (= (size!2242 (buf!2627 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!161593 () Unit!6586)

(declare-fun lt!161586 () Unit!6586)

(assert (=> d!34044 (= lt!161593 lt!161586)))

(assert (=> d!34044 (isPrefixOf!0 (_2!4681 lt!160868) (_2!4681 lt!160868))))

(assert (=> d!34044 (= lt!161586 (lemmaIsPrefixRefl!0 (_2!4681 lt!160868)))))

(declare-fun lt!161592 () Unit!6586)

(declare-fun lt!161598 () Unit!6586)

(assert (=> d!34044 (= lt!161592 lt!161598)))

(assert (=> d!34044 (= lt!161598 (lemmaIsPrefixRefl!0 (_2!4681 lt!160868)))))

(declare-fun lt!161595 () Unit!6586)

(declare-fun lt!161603 () Unit!6586)

(assert (=> d!34044 (= lt!161595 lt!161603)))

(assert (=> d!34044 (isPrefixOf!0 lt!161600 lt!161600)))

(assert (=> d!34044 (= lt!161603 (lemmaIsPrefixRefl!0 lt!161600))))

(declare-fun lt!161590 () Unit!6586)

(declare-fun lt!161597 () Unit!6586)

(assert (=> d!34044 (= lt!161590 lt!161597)))

(assert (=> d!34044 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34044 (= lt!161597 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34044 (= lt!161600 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(assert (=> d!34044 (isPrefixOf!0 thiss!1305 (_2!4681 lt!160868))))

(assert (=> d!34044 (= (reader!0 thiss!1305 (_2!4681 lt!160868)) lt!161589)))

(declare-fun b!107765 () Bool)

(declare-fun lt!161601 () Unit!6586)

(assert (=> b!107765 (= e!70517 lt!161601)))

(declare-fun lt!161594 () (_ BitVec 64))

(assert (=> b!107765 (= lt!161594 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161596 () (_ BitVec 64))

(assert (=> b!107765 (= lt!161596 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4925 array!4925 (_ BitVec 64) (_ BitVec 64)) Unit!6586)

(assert (=> b!107765 (= lt!161601 (arrayBitRangesEqSymmetric!0 (buf!2627 thiss!1305) (buf!2627 (_2!4681 lt!160868)) lt!161594 lt!161596))))

(assert (=> b!107765 (arrayBitRangesEq!0 (buf!2627 (_2!4681 lt!160868)) (buf!2627 thiss!1305) lt!161594 lt!161596)))

(declare-fun b!107766 () Bool)

(declare-fun res!88803 () Bool)

(assert (=> b!107766 (=> (not res!88803) (not e!70516))))

(assert (=> b!107766 (= res!88803 (isPrefixOf!0 (_1!4682 lt!161589) thiss!1305))))

(declare-fun b!107767 () Bool)

(declare-fun res!88805 () Bool)

(assert (=> b!107767 (=> (not res!88805) (not e!70516))))

(assert (=> b!107767 (= res!88805 (isPrefixOf!0 (_2!4682 lt!161589) (_2!4681 lt!160868)))))

(declare-fun b!107768 () Bool)

(declare-fun Unit!6605 () Unit!6586)

(assert (=> b!107768 (= e!70517 Unit!6605)))

(assert (= (and d!34044 c!6648) b!107765))

(assert (= (and d!34044 (not c!6648)) b!107768))

(assert (= (and d!34044 res!88804) b!107766))

(assert (= (and b!107766 res!88803) b!107767))

(assert (= (and b!107767 res!88805) b!107764))

(declare-fun m!159431 () Bool)

(assert (=> d!34044 m!159431))

(declare-fun m!159433 () Bool)

(assert (=> d!34044 m!159433))

(declare-fun m!159435 () Bool)

(assert (=> d!34044 m!159435))

(declare-fun m!159437 () Bool)

(assert (=> d!34044 m!159437))

(declare-fun m!159439 () Bool)

(assert (=> d!34044 m!159439))

(declare-fun m!159441 () Bool)

(assert (=> d!34044 m!159441))

(assert (=> d!34044 m!158897))

(declare-fun m!159443 () Bool)

(assert (=> d!34044 m!159443))

(declare-fun m!159445 () Bool)

(assert (=> d!34044 m!159445))

(declare-fun m!159447 () Bool)

(assert (=> d!34044 m!159447))

(declare-fun m!159449 () Bool)

(assert (=> d!34044 m!159449))

(declare-fun m!159451 () Bool)

(assert (=> b!107766 m!159451))

(declare-fun m!159453 () Bool)

(assert (=> b!107764 m!159453))

(assert (=> b!107764 m!158925))

(assert (=> b!107764 m!158861))

(assert (=> b!107765 m!158861))

(declare-fun m!159455 () Bool)

(assert (=> b!107765 m!159455))

(declare-fun m!159457 () Bool)

(assert (=> b!107765 m!159457))

(declare-fun m!159459 () Bool)

(assert (=> b!107767 m!159459))

(assert (=> b!107482 d!34044))

(declare-fun d!34068 () Bool)

(declare-fun e!70518 () Bool)

(assert (=> d!34068 e!70518))

(declare-fun res!88807 () Bool)

(assert (=> d!34068 (=> (not res!88807) (not e!70518))))

(declare-fun lt!161608 () (_ BitVec 64))

(declare-fun lt!161607 () (_ BitVec 64))

(declare-fun lt!161606 () (_ BitVec 64))

(assert (=> d!34068 (= res!88807 (= lt!161607 (bvsub lt!161606 lt!161608)))))

(assert (=> d!34068 (or (= (bvand lt!161606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161606 lt!161608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34068 (= lt!161608 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160864)))) ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160864))) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160864)))))))

(declare-fun lt!161611 () (_ BitVec 64))

(declare-fun lt!161609 () (_ BitVec 64))

(assert (=> d!34068 (= lt!161606 (bvmul lt!161611 lt!161609))))

(assert (=> d!34068 (or (= lt!161611 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161609 (bvsdiv (bvmul lt!161611 lt!161609) lt!161611)))))

(assert (=> d!34068 (= lt!161609 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34068 (= lt!161611 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160864)))))))

(assert (=> d!34068 (= lt!161607 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 (_1!4684 lt!160864))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 (_1!4684 lt!160864)))))))

(assert (=> d!34068 (invariant!0 (currentBit!5146 (_1!4684 lt!160864)) (currentByte!5151 (_1!4684 lt!160864)) (size!2242 (buf!2627 (_1!4684 lt!160864))))))

(assert (=> d!34068 (= (bitIndex!0 (size!2242 (buf!2627 (_1!4684 lt!160864))) (currentByte!5151 (_1!4684 lt!160864)) (currentBit!5146 (_1!4684 lt!160864))) lt!161607)))

(declare-fun b!107769 () Bool)

(declare-fun res!88808 () Bool)

(assert (=> b!107769 (=> (not res!88808) (not e!70518))))

(assert (=> b!107769 (= res!88808 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161607))))

(declare-fun b!107770 () Bool)

(declare-fun lt!161610 () (_ BitVec 64))

(assert (=> b!107770 (= e!70518 (bvsle lt!161607 (bvmul lt!161610 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107770 (or (= lt!161610 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161610 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161610)))))

(assert (=> b!107770 (= lt!161610 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4684 lt!160864)))))))

(assert (= (and d!34068 res!88807) b!107769))

(assert (= (and b!107769 res!88808) b!107770))

(declare-fun m!159461 () Bool)

(assert (=> d!34068 m!159461))

(declare-fun m!159463 () Bool)

(assert (=> d!34068 m!159463))

(assert (=> b!107482 d!34068))

(declare-fun d!34070 () Bool)

(assert (=> d!34070 (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)) lt!160874)))

(declare-fun lt!161612 () Unit!6586)

(assert (=> d!34070 (= lt!161612 (choose!9 thiss!1305 (buf!2627 (_2!4681 lt!160868)) lt!160874 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))))))

(assert (=> d!34070 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2627 (_2!4681 lt!160868)) lt!160874) lt!161612)))

(declare-fun bs!8310 () Bool)

(assert (= bs!8310 d!34070))

(assert (=> bs!8310 m!158889))

(declare-fun m!159465 () Bool)

(assert (=> bs!8310 m!159465))

(assert (=> b!107482 d!34070))

(declare-fun d!34072 () Bool)

(assert (=> d!34072 (isPrefixOf!0 thiss!1305 (_2!4681 lt!160868))))

(declare-fun lt!161615 () Unit!6586)

(declare-fun choose!30 (BitStream!3958 BitStream!3958 BitStream!3958) Unit!6586)

(assert (=> d!34072 (= lt!161615 (choose!30 thiss!1305 (_2!4681 lt!160872) (_2!4681 lt!160868)))))

(assert (=> d!34072 (isPrefixOf!0 thiss!1305 (_2!4681 lt!160872))))

(assert (=> d!34072 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4681 lt!160872) (_2!4681 lt!160868)) lt!161615)))

(declare-fun bs!8311 () Bool)

(assert (= bs!8311 d!34072))

(assert (=> bs!8311 m!158897))

(declare-fun m!159467 () Bool)

(assert (=> bs!8311 m!159467))

(assert (=> bs!8311 m!158863))

(assert (=> b!107482 d!34072))

(declare-fun e!70522 () Bool)

(declare-fun lt!161620 () tuple2!8850)

(declare-fun lt!161630 () (_ BitVec 64))

(declare-fun b!107774 () Bool)

(declare-fun lt!161633 () (_ BitVec 64))

(assert (=> b!107774 (= e!70522 (= (_1!4682 lt!161620) (withMovedBitIndex!0 (_2!4682 lt!161620) (bvsub lt!161633 lt!161630))))))

(assert (=> b!107774 (or (= (bvand lt!161633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161633 lt!161630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107774 (= lt!161630 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160868))) (currentByte!5151 (_2!4681 lt!160868)) (currentBit!5146 (_2!4681 lt!160868))))))

(assert (=> b!107774 (= lt!161633 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(declare-fun d!34078 () Bool)

(assert (=> d!34078 e!70522))

(declare-fun res!88813 () Bool)

(assert (=> d!34078 (=> (not res!88813) (not e!70522))))

(assert (=> d!34078 (= res!88813 (isPrefixOf!0 (_1!4682 lt!161620) (_2!4682 lt!161620)))))

(declare-fun lt!161631 () BitStream!3958)

(assert (=> d!34078 (= lt!161620 (tuple2!8851 lt!161631 (_2!4681 lt!160868)))))

(declare-fun lt!161619 () Unit!6586)

(declare-fun lt!161616 () Unit!6586)

(assert (=> d!34078 (= lt!161619 lt!161616)))

(assert (=> d!34078 (isPrefixOf!0 lt!161631 (_2!4681 lt!160868))))

(assert (=> d!34078 (= lt!161616 (lemmaIsPrefixTransitive!0 lt!161631 (_2!4681 lt!160868) (_2!4681 lt!160868)))))

(declare-fun lt!161618 () Unit!6586)

(declare-fun lt!161635 () Unit!6586)

(assert (=> d!34078 (= lt!161618 lt!161635)))

(assert (=> d!34078 (isPrefixOf!0 lt!161631 (_2!4681 lt!160868))))

(assert (=> d!34078 (= lt!161635 (lemmaIsPrefixTransitive!0 lt!161631 (_2!4681 lt!160872) (_2!4681 lt!160868)))))

(declare-fun lt!161622 () Unit!6586)

(declare-fun e!70523 () Unit!6586)

(assert (=> d!34078 (= lt!161622 e!70523)))

(declare-fun c!6649 () Bool)

(assert (=> d!34078 (= c!6649 (not (= (size!2242 (buf!2627 (_2!4681 lt!160872))) #b00000000000000000000000000000000)))))

(declare-fun lt!161624 () Unit!6586)

(declare-fun lt!161617 () Unit!6586)

(assert (=> d!34078 (= lt!161624 lt!161617)))

(assert (=> d!34078 (isPrefixOf!0 (_2!4681 lt!160868) (_2!4681 lt!160868))))

(assert (=> d!34078 (= lt!161617 (lemmaIsPrefixRefl!0 (_2!4681 lt!160868)))))

(declare-fun lt!161623 () Unit!6586)

(declare-fun lt!161629 () Unit!6586)

(assert (=> d!34078 (= lt!161623 lt!161629)))

(assert (=> d!34078 (= lt!161629 (lemmaIsPrefixRefl!0 (_2!4681 lt!160868)))))

(declare-fun lt!161626 () Unit!6586)

(declare-fun lt!161634 () Unit!6586)

(assert (=> d!34078 (= lt!161626 lt!161634)))

(assert (=> d!34078 (isPrefixOf!0 lt!161631 lt!161631)))

(assert (=> d!34078 (= lt!161634 (lemmaIsPrefixRefl!0 lt!161631))))

(declare-fun lt!161621 () Unit!6586)

(declare-fun lt!161628 () Unit!6586)

(assert (=> d!34078 (= lt!161621 lt!161628)))

(assert (=> d!34078 (isPrefixOf!0 (_2!4681 lt!160872) (_2!4681 lt!160872))))

(assert (=> d!34078 (= lt!161628 (lemmaIsPrefixRefl!0 (_2!4681 lt!160872)))))

(assert (=> d!34078 (= lt!161631 (BitStream!3959 (buf!2627 (_2!4681 lt!160868)) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(assert (=> d!34078 (isPrefixOf!0 (_2!4681 lt!160872) (_2!4681 lt!160868))))

(assert (=> d!34078 (= (reader!0 (_2!4681 lt!160872) (_2!4681 lt!160868)) lt!161620)))

(declare-fun b!107775 () Bool)

(declare-fun lt!161632 () Unit!6586)

(assert (=> b!107775 (= e!70523 lt!161632)))

(declare-fun lt!161625 () (_ BitVec 64))

(assert (=> b!107775 (= lt!161625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161627 () (_ BitVec 64))

(assert (=> b!107775 (= lt!161627 (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872))))))

(assert (=> b!107775 (= lt!161632 (arrayBitRangesEqSymmetric!0 (buf!2627 (_2!4681 lt!160872)) (buf!2627 (_2!4681 lt!160868)) lt!161625 lt!161627))))

(assert (=> b!107775 (arrayBitRangesEq!0 (buf!2627 (_2!4681 lt!160868)) (buf!2627 (_2!4681 lt!160872)) lt!161625 lt!161627)))

(declare-fun b!107776 () Bool)

(declare-fun res!88812 () Bool)

(assert (=> b!107776 (=> (not res!88812) (not e!70522))))

(assert (=> b!107776 (= res!88812 (isPrefixOf!0 (_1!4682 lt!161620) (_2!4681 lt!160872)))))

(declare-fun b!107777 () Bool)

(declare-fun res!88814 () Bool)

(assert (=> b!107777 (=> (not res!88814) (not e!70522))))

(assert (=> b!107777 (= res!88814 (isPrefixOf!0 (_2!4682 lt!161620) (_2!4681 lt!160868)))))

(declare-fun b!107778 () Bool)

(declare-fun Unit!6606 () Unit!6586)

(assert (=> b!107778 (= e!70523 Unit!6606)))

(assert (= (and d!34078 c!6649) b!107775))

(assert (= (and d!34078 (not c!6649)) b!107778))

(assert (= (and d!34078 res!88813) b!107776))

(assert (= (and b!107776 res!88812) b!107777))

(assert (= (and b!107777 res!88814) b!107774))

(assert (=> d!34078 m!159431))

(declare-fun m!159469 () Bool)

(assert (=> d!34078 m!159469))

(declare-fun m!159471 () Bool)

(assert (=> d!34078 m!159471))

(declare-fun m!159473 () Bool)

(assert (=> d!34078 m!159473))

(declare-fun m!159475 () Bool)

(assert (=> d!34078 m!159475))

(declare-fun m!159477 () Bool)

(assert (=> d!34078 m!159477))

(declare-fun m!159479 () Bool)

(assert (=> d!34078 m!159479))

(assert (=> d!34078 m!159443))

(declare-fun m!159481 () Bool)

(assert (=> d!34078 m!159481))

(declare-fun m!159483 () Bool)

(assert (=> d!34078 m!159483))

(declare-fun m!159485 () Bool)

(assert (=> d!34078 m!159485))

(declare-fun m!159487 () Bool)

(assert (=> b!107776 m!159487))

(declare-fun m!159489 () Bool)

(assert (=> b!107774 m!159489))

(assert (=> b!107774 m!158925))

(assert (=> b!107774 m!158859))

(assert (=> b!107775 m!158859))

(declare-fun m!159491 () Bool)

(assert (=> b!107775 m!159491))

(declare-fun m!159493 () Bool)

(assert (=> b!107775 m!159493))

(declare-fun m!159495 () Bool)

(assert (=> b!107777 m!159495))

(assert (=> b!107482 d!34078))

(declare-fun d!34080 () Bool)

(declare-fun res!88822 () Bool)

(declare-fun e!70530 () Bool)

(assert (=> d!34080 (=> (not res!88822) (not e!70530))))

(assert (=> d!34080 (= res!88822 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4682 lt!160863))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4682 lt!160863))))))))))

(assert (=> d!34080 (= (moveBitIndexPrecond!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001) e!70530)))

(declare-fun b!107787 () Bool)

(declare-fun lt!161650 () (_ BitVec 64))

(assert (=> b!107787 (= e!70530 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161650) (bvsle lt!161650 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2242 (buf!2627 (_1!4682 lt!160863))))))))))

(assert (=> b!107787 (= lt!161650 (bvadd (bitIndex!0 (size!2242 (buf!2627 (_1!4682 lt!160863))) (currentByte!5151 (_1!4682 lt!160863)) (currentBit!5146 (_1!4682 lt!160863))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!34080 res!88822) b!107787))

(declare-fun m!159507 () Bool)

(assert (=> b!107787 m!159507))

(assert (=> b!107491 d!34080))

(declare-fun d!34084 () Bool)

(declare-fun e!70531 () Bool)

(assert (=> d!34084 e!70531))

(declare-fun res!88823 () Bool)

(assert (=> d!34084 (=> (not res!88823) (not e!70531))))

(declare-fun lt!161651 () (_ BitVec 64))

(declare-fun lt!161653 () (_ BitVec 64))

(declare-fun lt!161652 () (_ BitVec 64))

(assert (=> d!34084 (= res!88823 (= lt!161652 (bvsub lt!161651 lt!161653)))))

(assert (=> d!34084 (or (= (bvand lt!161651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161653 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161651 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161651 lt!161653) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34084 (= lt!161653 (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))) ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160868))) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160868)))))))

(declare-fun lt!161656 () (_ BitVec 64))

(declare-fun lt!161654 () (_ BitVec 64))

(assert (=> d!34084 (= lt!161651 (bvmul lt!161656 lt!161654))))

(assert (=> d!34084 (or (= lt!161656 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161654 (bvsdiv (bvmul lt!161656 lt!161654) lt!161656)))))

(assert (=> d!34084 (= lt!161654 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34084 (= lt!161656 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))))))

(assert (=> d!34084 (= lt!161652 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5151 (_2!4681 lt!160868))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5146 (_2!4681 lt!160868)))))))

(assert (=> d!34084 (invariant!0 (currentBit!5146 (_2!4681 lt!160868)) (currentByte!5151 (_2!4681 lt!160868)) (size!2242 (buf!2627 (_2!4681 lt!160868))))))

(assert (=> d!34084 (= (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160868))) (currentByte!5151 (_2!4681 lt!160868)) (currentBit!5146 (_2!4681 lt!160868))) lt!161652)))

(declare-fun b!107788 () Bool)

(declare-fun res!88824 () Bool)

(assert (=> b!107788 (=> (not res!88824) (not e!70531))))

(assert (=> b!107788 (= res!88824 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161652))))

(declare-fun b!107789 () Bool)

(declare-fun lt!161655 () (_ BitVec 64))

(assert (=> b!107789 (= e!70531 (bvsle lt!161652 (bvmul lt!161655 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107789 (or (= lt!161655 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161655 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161655)))))

(assert (=> b!107789 (= lt!161655 ((_ sign_extend 32) (size!2242 (buf!2627 (_2!4681 lt!160868)))))))

(assert (= (and d!34084 res!88823) b!107788))

(assert (= (and b!107788 res!88824) b!107789))

(declare-fun m!159511 () Bool)

(assert (=> d!34084 m!159511))

(declare-fun m!159513 () Bool)

(assert (=> d!34084 m!159513))

(assert (=> b!107491 d!34084))

(declare-fun d!34088 () Bool)

(declare-fun e!70534 () Bool)

(assert (=> d!34088 e!70534))

(declare-fun res!88827 () Bool)

(assert (=> d!34088 (=> (not res!88827) (not e!70534))))

(declare-fun lt!161661 () BitStream!3958)

(declare-fun lt!161662 () (_ BitVec 64))

(assert (=> d!34088 (= res!88827 (= (bvadd lt!161662 (bvsub lt!160865 lt!160866)) (bitIndex!0 (size!2242 (buf!2627 lt!161661)) (currentByte!5151 lt!161661) (currentBit!5146 lt!161661))))))

(assert (=> d!34088 (or (not (= (bvand lt!161662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160865 lt!160866) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161662 (bvsub lt!160865 lt!160866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34088 (= lt!161662 (bitIndex!0 (size!2242 (buf!2627 (_2!4682 lt!160858))) (currentByte!5151 (_2!4682 lt!160858)) (currentBit!5146 (_2!4682 lt!160858))))))

(declare-fun moveBitIndex!0 (BitStream!3958 (_ BitVec 64)) tuple2!8848)

(assert (=> d!34088 (= lt!161661 (_2!4681 (moveBitIndex!0 (_2!4682 lt!160858) (bvsub lt!160865 lt!160866))))))

(assert (=> d!34088 (moveBitIndexPrecond!0 (_2!4682 lt!160858) (bvsub lt!160865 lt!160866))))

(assert (=> d!34088 (= (withMovedBitIndex!0 (_2!4682 lt!160858) (bvsub lt!160865 lt!160866)) lt!161661)))

(declare-fun b!107792 () Bool)

(assert (=> b!107792 (= e!70534 (= (size!2242 (buf!2627 (_2!4682 lt!160858))) (size!2242 (buf!2627 lt!161661))))))

(assert (= (and d!34088 res!88827) b!107792))

(declare-fun m!159515 () Bool)

(assert (=> d!34088 m!159515))

(declare-fun m!159517 () Bool)

(assert (=> d!34088 m!159517))

(declare-fun m!159519 () Bool)

(assert (=> d!34088 m!159519))

(declare-fun m!159521 () Bool)

(assert (=> d!34088 m!159521))

(assert (=> b!107491 d!34088))

(declare-fun d!34090 () Bool)

(declare-fun e!70535 () Bool)

(assert (=> d!34090 e!70535))

(declare-fun res!88828 () Bool)

(assert (=> d!34090 (=> (not res!88828) (not e!70535))))

(declare-fun lt!161664 () (_ BitVec 64))

(declare-fun lt!161663 () BitStream!3958)

(assert (=> d!34090 (= res!88828 (= (bvadd lt!161664 (bvsub lt!160854 lt!160866)) (bitIndex!0 (size!2242 (buf!2627 lt!161663)) (currentByte!5151 lt!161663) (currentBit!5146 lt!161663))))))

(assert (=> d!34090 (or (not (= (bvand lt!161664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!160854 lt!160866) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161664 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161664 (bvsub lt!160854 lt!160866)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34090 (= lt!161664 (bitIndex!0 (size!2242 (buf!2627 (_2!4682 lt!160863))) (currentByte!5151 (_2!4682 lt!160863)) (currentBit!5146 (_2!4682 lt!160863))))))

(assert (=> d!34090 (= lt!161663 (_2!4681 (moveBitIndex!0 (_2!4682 lt!160863) (bvsub lt!160854 lt!160866))))))

(assert (=> d!34090 (moveBitIndexPrecond!0 (_2!4682 lt!160863) (bvsub lt!160854 lt!160866))))

(assert (=> d!34090 (= (withMovedBitIndex!0 (_2!4682 lt!160863) (bvsub lt!160854 lt!160866)) lt!161663)))

(declare-fun b!107793 () Bool)

(assert (=> b!107793 (= e!70535 (= (size!2242 (buf!2627 (_2!4682 lt!160863))) (size!2242 (buf!2627 lt!161663))))))

(assert (= (and d!34090 res!88828) b!107793))

(declare-fun m!159523 () Bool)

(assert (=> d!34090 m!159523))

(declare-fun m!159525 () Bool)

(assert (=> d!34090 m!159525))

(declare-fun m!159527 () Bool)

(assert (=> d!34090 m!159527))

(declare-fun m!159529 () Bool)

(assert (=> d!34090 m!159529))

(assert (=> b!107491 d!34090))

(assert (=> b!107491 d!33972))

(declare-fun d!34092 () Bool)

(declare-fun lt!161704 () tuple2!8852)

(declare-fun lt!161705 () tuple2!8852)

(assert (=> d!34092 (and (= (_2!4683 lt!161704) (_2!4683 lt!161705)) (= (_1!4683 lt!161704) (_1!4683 lt!161705)))))

(declare-fun lt!161703 () Unit!6586)

(declare-fun lt!161706 () Bool)

(declare-fun lt!161707 () BitStream!3958)

(declare-fun lt!161708 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3958 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8852 tuple2!8852 BitStream!3958 (_ BitVec 64) Bool BitStream!3958 (_ BitVec 64) tuple2!8852 tuple2!8852 BitStream!3958 (_ BitVec 64)) Unit!6586)

(assert (=> d!34092 (= lt!161703 (choose!45 (_1!4682 lt!160863) nBits!396 i!615 lt!160862 lt!161704 (tuple2!8853 (_1!4683 lt!161704) (_2!4683 lt!161704)) (_1!4683 lt!161704) (_2!4683 lt!161704) lt!161706 lt!161707 lt!161708 lt!161705 (tuple2!8853 (_1!4683 lt!161705) (_2!4683 lt!161705)) (_1!4683 lt!161705) (_2!4683 lt!161705)))))

(assert (=> d!34092 (= lt!161705 (readNLeastSignificantBitsLoopPure!0 lt!161707 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!161708))))

(assert (=> d!34092 (= lt!161708 (bvor lt!160862 (ite lt!161706 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34092 (= lt!161707 (withMovedBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34092 (= lt!161706 (_2!4684 (readBitPure!0 (_1!4682 lt!160863))))))

(assert (=> d!34092 (= lt!161704 (readNLeastSignificantBitsLoopPure!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862))))

(assert (=> d!34092 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4682 lt!160863) nBits!396 i!615 lt!160862) lt!161703)))

(declare-fun bs!8316 () Bool)

(assert (= bs!8316 d!34092))

(assert (=> bs!8316 m!158879))

(declare-fun m!159551 () Bool)

(assert (=> bs!8316 m!159551))

(assert (=> bs!8316 m!158915))

(declare-fun m!159553 () Bool)

(assert (=> bs!8316 m!159553))

(assert (=> bs!8316 m!158895))

(assert (=> b!107491 d!34092))

(declare-fun d!34104 () Bool)

(declare-fun lt!161709 () tuple2!8876)

(assert (=> d!34104 (= lt!161709 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859))))

(assert (=> d!34104 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!160859) (tuple2!8853 (_2!4695 lt!161709) (_1!4695 lt!161709)))))

(declare-fun bs!8317 () Bool)

(assert (= bs!8317 d!34104))

(assert (=> bs!8317 m!158915))

(declare-fun m!159555 () Bool)

(assert (=> bs!8317 m!159555))

(assert (=> b!107491 d!34104))

(declare-fun d!34106 () Bool)

(declare-fun e!70541 () Bool)

(assert (=> d!34106 e!70541))

(declare-fun res!88834 () Bool)

(assert (=> d!34106 (=> (not res!88834) (not e!70541))))

(declare-fun lt!161711 () (_ BitVec 64))

(declare-fun lt!161710 () BitStream!3958)

(assert (=> d!34106 (= res!88834 (= (bvadd lt!161711 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2242 (buf!2627 lt!161710)) (currentByte!5151 lt!161710) (currentBit!5146 lt!161710))))))

(assert (=> d!34106 (or (not (= (bvand lt!161711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161711 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161711 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34106 (= lt!161711 (bitIndex!0 (size!2242 (buf!2627 (_1!4682 lt!160863))) (currentByte!5151 (_1!4682 lt!160863)) (currentBit!5146 (_1!4682 lt!160863))))))

(assert (=> d!34106 (= lt!161710 (_2!4681 (moveBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!34106 (moveBitIndexPrecond!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34106 (= (withMovedBitIndex!0 (_1!4682 lt!160863) #b0000000000000000000000000000000000000000000000000000000000000001) lt!161710)))

(declare-fun b!107800 () Bool)

(assert (=> b!107800 (= e!70541 (= (size!2242 (buf!2627 (_1!4682 lt!160863))) (size!2242 (buf!2627 lt!161710))))))

(assert (= (and d!34106 res!88834) b!107800))

(declare-fun m!159557 () Bool)

(assert (=> d!34106 m!159557))

(assert (=> d!34106 m!159507))

(declare-fun m!159559 () Bool)

(assert (=> d!34106 m!159559))

(assert (=> d!34106 m!158927))

(assert (=> b!107491 d!34106))

(assert (=> b!107491 d!33978))

(declare-fun d!34108 () Bool)

(assert (=> d!34108 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305)) lt!160874) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2242 (buf!2627 thiss!1305))) ((_ sign_extend 32) (currentByte!5151 thiss!1305)) ((_ sign_extend 32) (currentBit!5146 thiss!1305))) lt!160874))))

(declare-fun bs!8318 () Bool)

(assert (= bs!8318 d!34108))

(assert (=> bs!8318 m!159087))

(assert (=> b!107492 d!34108))

(declare-fun d!34110 () Bool)

(assert (=> d!34110 (= (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160868)))) (and (bvsge (currentBit!5146 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5146 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5151 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160868)))) (and (= (currentBit!5146 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160868))))))))))

(assert (=> b!107485 d!34110))

(declare-fun d!34112 () Bool)

(assert (=> d!34112 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107483 d!34112))

(declare-fun d!34114 () Bool)

(declare-fun res!88836 () Bool)

(declare-fun e!70542 () Bool)

(assert (=> d!34114 (=> (not res!88836) (not e!70542))))

(assert (=> d!34114 (= res!88836 (= (size!2242 (buf!2627 thiss!1305)) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(assert (=> d!34114 (= (isPrefixOf!0 thiss!1305 (_2!4681 lt!160872)) e!70542)))

(declare-fun b!107801 () Bool)

(declare-fun res!88837 () Bool)

(assert (=> b!107801 (=> (not res!88837) (not e!70542))))

(assert (=> b!107801 (= res!88837 (bvsle (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)) (bitIndex!0 (size!2242 (buf!2627 (_2!4681 lt!160872))) (currentByte!5151 (_2!4681 lt!160872)) (currentBit!5146 (_2!4681 lt!160872)))))))

(declare-fun b!107802 () Bool)

(declare-fun e!70543 () Bool)

(assert (=> b!107802 (= e!70542 e!70543)))

(declare-fun res!88835 () Bool)

(assert (=> b!107802 (=> res!88835 e!70543)))

(assert (=> b!107802 (= res!88835 (= (size!2242 (buf!2627 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107803 () Bool)

(assert (=> b!107803 (= e!70543 (arrayBitRangesEq!0 (buf!2627 thiss!1305) (buf!2627 (_2!4681 lt!160872)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2242 (buf!2627 thiss!1305)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305))))))

(assert (= (and d!34114 res!88836) b!107801))

(assert (= (and b!107801 res!88837) b!107802))

(assert (= (and b!107802 (not res!88835)) b!107803))

(assert (=> b!107801 m!158861))

(assert (=> b!107801 m!158859))

(assert (=> b!107803 m!158861))

(assert (=> b!107803 m!158861))

(declare-fun m!159561 () Bool)

(assert (=> b!107803 m!159561))

(assert (=> b!107484 d!34114))

(declare-fun d!34116 () Bool)

(assert (=> d!34116 (= (array_inv!2044 (buf!2627 thiss!1305)) (bvsge (size!2242 (buf!2627 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107488 d!34116))

(declare-fun d!34118 () Bool)

(assert (=> d!34118 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 thiss!1305))))))

(declare-fun bs!8319 () Bool)

(assert (= bs!8319 d!34118))

(assert (=> bs!8319 m!159089))

(assert (=> start!21352 d!34118))

(declare-fun d!34120 () Bool)

(declare-fun lt!161714 () tuple2!8878)

(assert (=> d!34120 (= lt!161714 (readBit!0 (readerFrom!0 (_2!4681 lt!160872) (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305))))))

(assert (=> d!34120 (= (readBitPure!0 (readerFrom!0 (_2!4681 lt!160872) (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305))) (tuple2!8855 (_2!4696 lt!161714) (_1!4696 lt!161714)))))

(declare-fun bs!8320 () Bool)

(assert (= bs!8320 d!34120))

(assert (=> bs!8320 m!158905))

(declare-fun m!159563 () Bool)

(assert (=> bs!8320 m!159563))

(assert (=> b!107486 d!34120))

(declare-fun d!34122 () Bool)

(declare-fun e!70546 () Bool)

(assert (=> d!34122 e!70546))

(declare-fun res!88841 () Bool)

(assert (=> d!34122 (=> (not res!88841) (not e!70546))))

(assert (=> d!34122 (= res!88841 (invariant!0 (currentBit!5146 (_2!4681 lt!160872)) (currentByte!5151 (_2!4681 lt!160872)) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(assert (=> d!34122 (= (readerFrom!0 (_2!4681 lt!160872) (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305)) (BitStream!3959 (buf!2627 (_2!4681 lt!160872)) (currentByte!5151 thiss!1305) (currentBit!5146 thiss!1305)))))

(declare-fun b!107806 () Bool)

(assert (=> b!107806 (= e!70546 (invariant!0 (currentBit!5146 thiss!1305) (currentByte!5151 thiss!1305) (size!2242 (buf!2627 (_2!4681 lt!160872)))))))

(assert (= (and d!34122 res!88841) b!107806))

(assert (=> d!34122 m!159085))

(assert (=> b!107806 m!158913))

(assert (=> b!107486 d!34122))

(push 1)

