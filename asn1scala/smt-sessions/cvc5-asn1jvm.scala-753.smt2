; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21604 () Bool)

(assert start!21604)

(declare-fun b!108918 () Bool)

(declare-fun res!89824 () Bool)

(declare-fun e!71331 () Bool)

(assert (=> b!108918 (=> (not res!89824) (not e!71331))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!108918 (= res!89824 (bvslt i!615 nBits!396))))

(declare-datatypes ((array!4967 0))(
  ( (array!4968 (arr!2853 (Array (_ BitVec 32) (_ BitVec 8))) (size!2260 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3994 0))(
  ( (BitStream!3995 (buf!2651 array!4967) (currentByte!5187 (_ BitVec 32)) (currentBit!5182 (_ BitVec 32))) )
))
(declare-fun lt!164387 () BitStream!3994)

(declare-fun b!108919 () Bool)

(declare-fun lt!164409 () (_ BitVec 64))

(declare-fun e!71329 () Bool)

(declare-datatypes ((tuple2!9012 0))(
  ( (tuple2!9013 (_1!4763 BitStream!3994) (_2!4763 (_ BitVec 64))) )
))
(declare-fun lt!164404 () tuple2!9012)

(declare-datatypes ((tuple2!9014 0))(
  ( (tuple2!9015 (_1!4764 BitStream!3994) (_2!4764 BitStream!3994)) )
))
(declare-fun lt!164410 () tuple2!9014)

(declare-fun lt!164384 () tuple2!9012)

(declare-fun lt!164385 () (_ BitVec 64))

(declare-fun lt!164395 () tuple2!9014)

(assert (=> b!108919 (= e!71329 (and (= lt!164385 (bvsub lt!164409 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4764 lt!164395) lt!164387)) (and (= (_2!4763 lt!164404) (_2!4763 lt!164384)) (= (_1!4763 lt!164404) (_2!4764 lt!164410))))))))

(declare-fun b!108920 () Bool)

(declare-fun e!71324 () Bool)

(declare-datatypes ((tuple2!9016 0))(
  ( (tuple2!9017 (_1!4765 BitStream!3994) (_2!4765 Bool)) )
))
(declare-fun lt!164393 () tuple2!9016)

(declare-fun lt!164411 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108920 (= e!71324 (= (bitIndex!0 (size!2260 (buf!2651 (_1!4765 lt!164393))) (currentByte!5187 (_1!4765 lt!164393)) (currentBit!5182 (_1!4765 lt!164393))) lt!164411))))

(declare-fun b!108921 () Bool)

(declare-fun e!71328 () Bool)

(assert (=> b!108921 (= e!71328 e!71324)))

(declare-fun res!89833 () Bool)

(assert (=> b!108921 (=> (not res!89833) (not e!71324))))

(declare-datatypes ((Unit!6661 0))(
  ( (Unit!6662) )
))
(declare-datatypes ((tuple2!9018 0))(
  ( (tuple2!9019 (_1!4766 Unit!6661) (_2!4766 BitStream!3994)) )
))
(declare-fun lt!164383 () tuple2!9018)

(declare-fun lt!164399 () Bool)

(assert (=> b!108921 (= res!89833 (and (= (_2!4765 lt!164393) lt!164399) (= (_1!4765 lt!164393) (_2!4766 lt!164383))))))

(declare-fun thiss!1305 () BitStream!3994)

(declare-fun readBitPure!0 (BitStream!3994) tuple2!9016)

(declare-fun readerFrom!0 (BitStream!3994 (_ BitVec 32) (_ BitVec 32)) BitStream!3994)

(assert (=> b!108921 (= lt!164393 (readBitPure!0 (readerFrom!0 (_2!4766 lt!164383) (currentBit!5182 thiss!1305) (currentByte!5187 thiss!1305))))))

(declare-fun b!108922 () Bool)

(declare-fun e!71332 () Bool)

(assert (=> b!108922 (= e!71332 e!71328)))

(declare-fun res!89827 () Bool)

(assert (=> b!108922 (=> (not res!89827) (not e!71328))))

(declare-fun lt!164402 () (_ BitVec 64))

(assert (=> b!108922 (= res!89827 (= lt!164411 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!164402)))))

(assert (=> b!108922 (= lt!164411 (bitIndex!0 (size!2260 (buf!2651 (_2!4766 lt!164383))) (currentByte!5187 (_2!4766 lt!164383)) (currentBit!5182 (_2!4766 lt!164383))))))

(assert (=> b!108922 (= lt!164402 (bitIndex!0 (size!2260 (buf!2651 thiss!1305)) (currentByte!5187 thiss!1305) (currentBit!5182 thiss!1305)))))

(declare-fun b!108923 () Bool)

(declare-fun e!71326 () Bool)

(assert (=> b!108923 (= e!71326 e!71331)))

(declare-fun res!89835 () Bool)

(assert (=> b!108923 (=> (not res!89835) (not e!71331))))

(declare-fun lt!164396 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108923 (= res!89835 (validate_offset_bits!1 ((_ sign_extend 32) (size!2260 (buf!2651 thiss!1305))) ((_ sign_extend 32) (currentByte!5187 thiss!1305)) ((_ sign_extend 32) (currentBit!5182 thiss!1305)) lt!164396))))

(assert (=> b!108923 (= lt!164396 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!108924 () Bool)

(declare-fun res!89834 () Bool)

(declare-fun e!71323 () Bool)

(assert (=> b!108924 (=> (not res!89834) (not e!71323))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108924 (= res!89834 (invariant!0 (currentBit!5182 thiss!1305) (currentByte!5187 thiss!1305) (size!2260 (buf!2651 (_2!4766 lt!164383)))))))

(declare-fun res!89832 () Bool)

(assert (=> start!21604 (=> (not res!89832) (not e!71326))))

(assert (=> start!21604 (= res!89832 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21604 e!71326))

(assert (=> start!21604 true))

(declare-fun e!71327 () Bool)

(declare-fun inv!12 (BitStream!3994) Bool)

(assert (=> start!21604 (and (inv!12 thiss!1305) e!71327)))

(declare-fun b!108925 () Bool)

(declare-fun res!89828 () Bool)

(assert (=> b!108925 (=> (not res!89828) (not e!71328))))

(declare-fun isPrefixOf!0 (BitStream!3994 BitStream!3994) Bool)

(assert (=> b!108925 (= res!89828 (isPrefixOf!0 thiss!1305 (_2!4766 lt!164383)))))

(declare-fun b!108926 () Bool)

(declare-fun res!89825 () Bool)

(assert (=> b!108926 (=> (not res!89825) (not e!71331))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108926 (= res!89825 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108927 () Bool)

(declare-fun e!71330 () Bool)

(assert (=> b!108927 (= e!71330 true)))

(assert (=> b!108927 e!71329))

(declare-fun res!89826 () Bool)

(assert (=> b!108927 (=> (not res!89826) (not e!71329))))

(declare-fun lt!164389 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3994 (_ BitVec 64)) BitStream!3994)

(assert (=> b!108927 (= res!89826 (= (_1!4764 lt!164395) (withMovedBitIndex!0 (_2!4764 lt!164395) (bvsub lt!164409 lt!164389))))))

(assert (=> b!108927 (= lt!164409 (bitIndex!0 (size!2260 (buf!2651 (_2!4766 lt!164383))) (currentByte!5187 (_2!4766 lt!164383)) (currentBit!5182 (_2!4766 lt!164383))))))

(assert (=> b!108927 (= (_1!4764 lt!164410) (withMovedBitIndex!0 (_2!4764 lt!164410) (bvsub lt!164385 lt!164389)))))

(declare-fun lt!164408 () tuple2!9018)

(assert (=> b!108927 (= lt!164389 (bitIndex!0 (size!2260 (buf!2651 (_2!4766 lt!164408))) (currentByte!5187 (_2!4766 lt!164408)) (currentBit!5182 (_2!4766 lt!164408))))))

(assert (=> b!108927 (= lt!164385 (bitIndex!0 (size!2260 (buf!2651 thiss!1305)) (currentByte!5187 thiss!1305) (currentBit!5182 thiss!1305)))))

(declare-fun lt!164391 () tuple2!9012)

(assert (=> b!108927 (and (= (_2!4763 lt!164404) (_2!4763 lt!164391)) (= (_1!4763 lt!164404) (_1!4763 lt!164391)))))

(declare-fun lt!164405 () (_ BitVec 64))

(declare-fun lt!164398 () Unit!6661)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6661)

(assert (=> b!108927 (= lt!164398 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4764 lt!164410) nBits!396 i!615 lt!164405))))

(declare-fun lt!164401 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3994 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9012)

(assert (=> b!108927 (= lt!164391 (readNLeastSignificantBitsLoopPure!0 lt!164387 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164401))))

(assert (=> b!108927 (= lt!164387 (withMovedBitIndex!0 (_1!4764 lt!164410) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108928 () Bool)

(assert (=> b!108928 (= e!71331 (not e!71330))))

(declare-fun res!89836 () Bool)

(assert (=> b!108928 (=> res!89836 e!71330)))

(assert (=> b!108928 (= res!89836 (not (= (_1!4763 lt!164384) (_2!4764 lt!164395))))))

(assert (=> b!108928 (= lt!164384 (readNLeastSignificantBitsLoopPure!0 (_1!4764 lt!164395) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!164401))))

(declare-fun lt!164397 () (_ BitVec 64))

(assert (=> b!108928 (validate_offset_bits!1 ((_ sign_extend 32) (size!2260 (buf!2651 (_2!4766 lt!164408)))) ((_ sign_extend 32) (currentByte!5187 (_2!4766 lt!164383))) ((_ sign_extend 32) (currentBit!5182 (_2!4766 lt!164383))) lt!164397)))

(declare-fun lt!164392 () Unit!6661)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3994 array!4967 (_ BitVec 64)) Unit!6661)

(assert (=> b!108928 (= lt!164392 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4766 lt!164383) (buf!2651 (_2!4766 lt!164408)) lt!164397))))

(assert (=> b!108928 (= lt!164397 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!164388 () (_ BitVec 64))

(declare-fun lt!164390 () tuple2!9016)

(assert (=> b!108928 (= lt!164401 (bvor lt!164405 (ite (_2!4765 lt!164390) lt!164388 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108928 (= lt!164404 (readNLeastSignificantBitsLoopPure!0 (_1!4764 lt!164410) nBits!396 i!615 lt!164405))))

(assert (=> b!108928 (validate_offset_bits!1 ((_ sign_extend 32) (size!2260 (buf!2651 (_2!4766 lt!164408)))) ((_ sign_extend 32) (currentByte!5187 thiss!1305)) ((_ sign_extend 32) (currentBit!5182 thiss!1305)) lt!164396)))

(declare-fun lt!164403 () Unit!6661)

(assert (=> b!108928 (= lt!164403 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2651 (_2!4766 lt!164408)) lt!164396))))

(assert (=> b!108928 (= lt!164405 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108928 (= (_2!4765 lt!164390) lt!164399)))

(assert (=> b!108928 (= lt!164390 (readBitPure!0 (_1!4764 lt!164410)))))

(declare-fun reader!0 (BitStream!3994 BitStream!3994) tuple2!9014)

(assert (=> b!108928 (= lt!164395 (reader!0 (_2!4766 lt!164383) (_2!4766 lt!164408)))))

(assert (=> b!108928 (= lt!164410 (reader!0 thiss!1305 (_2!4766 lt!164408)))))

(declare-fun e!71333 () Bool)

(assert (=> b!108928 e!71333))

(declare-fun res!89830 () Bool)

(assert (=> b!108928 (=> (not res!89830) (not e!71333))))

(declare-fun lt!164406 () tuple2!9016)

(declare-fun lt!164394 () tuple2!9016)

(assert (=> b!108928 (= res!89830 (= (bitIndex!0 (size!2260 (buf!2651 (_1!4765 lt!164406))) (currentByte!5187 (_1!4765 lt!164406)) (currentBit!5182 (_1!4765 lt!164406))) (bitIndex!0 (size!2260 (buf!2651 (_1!4765 lt!164394))) (currentByte!5187 (_1!4765 lt!164394)) (currentBit!5182 (_1!4765 lt!164394)))))))

(declare-fun lt!164407 () Unit!6661)

(declare-fun lt!164386 () BitStream!3994)

(declare-fun readBitPrefixLemma!0 (BitStream!3994 BitStream!3994) Unit!6661)

(assert (=> b!108928 (= lt!164407 (readBitPrefixLemma!0 lt!164386 (_2!4766 lt!164408)))))

(assert (=> b!108928 (= lt!164394 (readBitPure!0 (BitStream!3995 (buf!2651 (_2!4766 lt!164408)) (currentByte!5187 thiss!1305) (currentBit!5182 thiss!1305))))))

(assert (=> b!108928 (= lt!164406 (readBitPure!0 lt!164386))))

(assert (=> b!108928 (= lt!164386 (BitStream!3995 (buf!2651 (_2!4766 lt!164383)) (currentByte!5187 thiss!1305) (currentBit!5182 thiss!1305)))))

(assert (=> b!108928 e!71323))

(declare-fun res!89829 () Bool)

(assert (=> b!108928 (=> (not res!89829) (not e!71323))))

(assert (=> b!108928 (= res!89829 (isPrefixOf!0 thiss!1305 (_2!4766 lt!164408)))))

(declare-fun lt!164400 () Unit!6661)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3994 BitStream!3994 BitStream!3994) Unit!6661)

(assert (=> b!108928 (= lt!164400 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4766 lt!164383) (_2!4766 lt!164408)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3994 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9018)

(assert (=> b!108928 (= lt!164408 (appendNLeastSignificantBitsLoop!0 (_2!4766 lt!164383) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108928 e!71332))

(declare-fun res!89831 () Bool)

(assert (=> b!108928 (=> (not res!89831) (not e!71332))))

(assert (=> b!108928 (= res!89831 (= (size!2260 (buf!2651 thiss!1305)) (size!2260 (buf!2651 (_2!4766 lt!164383)))))))

(declare-fun appendBit!0 (BitStream!3994 Bool) tuple2!9018)

(assert (=> b!108928 (= lt!164383 (appendBit!0 thiss!1305 lt!164399))))

(assert (=> b!108928 (= lt!164399 (not (= (bvand v!199 lt!164388) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108928 (= lt!164388 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108929 () Bool)

(assert (=> b!108929 (= e!71323 (invariant!0 (currentBit!5182 thiss!1305) (currentByte!5187 thiss!1305) (size!2260 (buf!2651 (_2!4766 lt!164408)))))))

(declare-fun b!108930 () Bool)

(assert (=> b!108930 (= e!71333 (= (_2!4765 lt!164406) (_2!4765 lt!164394)))))

(declare-fun b!108931 () Bool)

(declare-fun array_inv!2062 (array!4967) Bool)

(assert (=> b!108931 (= e!71327 (array_inv!2062 (buf!2651 thiss!1305)))))

(assert (= (and start!21604 res!89832) b!108923))

(assert (= (and b!108923 res!89835) b!108926))

(assert (= (and b!108926 res!89825) b!108918))

(assert (= (and b!108918 res!89824) b!108928))

(assert (= (and b!108928 res!89831) b!108922))

(assert (= (and b!108922 res!89827) b!108925))

(assert (= (and b!108925 res!89828) b!108921))

(assert (= (and b!108921 res!89833) b!108920))

(assert (= (and b!108928 res!89829) b!108924))

(assert (= (and b!108924 res!89834) b!108929))

(assert (= (and b!108928 res!89830) b!108930))

(assert (= (and b!108928 (not res!89836)) b!108927))

(assert (= (and b!108927 res!89826) b!108919))

(assert (= start!21604 b!108931))

(declare-fun m!161543 () Bool)

(assert (=> b!108929 m!161543))

(declare-fun m!161545 () Bool)

(assert (=> b!108922 m!161545))

(declare-fun m!161547 () Bool)

(assert (=> b!108922 m!161547))

(declare-fun m!161549 () Bool)

(assert (=> b!108927 m!161549))

(assert (=> b!108927 m!161547))

(declare-fun m!161551 () Bool)

(assert (=> b!108927 m!161551))

(declare-fun m!161553 () Bool)

(assert (=> b!108927 m!161553))

(declare-fun m!161555 () Bool)

(assert (=> b!108927 m!161555))

(assert (=> b!108927 m!161545))

(declare-fun m!161557 () Bool)

(assert (=> b!108927 m!161557))

(declare-fun m!161559 () Bool)

(assert (=> b!108927 m!161559))

(declare-fun m!161561 () Bool)

(assert (=> b!108931 m!161561))

(declare-fun m!161563 () Bool)

(assert (=> b!108925 m!161563))

(declare-fun m!161565 () Bool)

(assert (=> b!108920 m!161565))

(declare-fun m!161567 () Bool)

(assert (=> start!21604 m!161567))

(declare-fun m!161569 () Bool)

(assert (=> b!108923 m!161569))

(declare-fun m!161571 () Bool)

(assert (=> b!108921 m!161571))

(assert (=> b!108921 m!161571))

(declare-fun m!161573 () Bool)

(assert (=> b!108921 m!161573))

(declare-fun m!161575 () Bool)

(assert (=> b!108924 m!161575))

(declare-fun m!161577 () Bool)

(assert (=> b!108928 m!161577))

(declare-fun m!161579 () Bool)

(assert (=> b!108928 m!161579))

(declare-fun m!161581 () Bool)

(assert (=> b!108928 m!161581))

(declare-fun m!161583 () Bool)

(assert (=> b!108928 m!161583))

(declare-fun m!161585 () Bool)

(assert (=> b!108928 m!161585))

(declare-fun m!161587 () Bool)

(assert (=> b!108928 m!161587))

(declare-fun m!161589 () Bool)

(assert (=> b!108928 m!161589))

(declare-fun m!161591 () Bool)

(assert (=> b!108928 m!161591))

(declare-fun m!161593 () Bool)

(assert (=> b!108928 m!161593))

(declare-fun m!161595 () Bool)

(assert (=> b!108928 m!161595))

(declare-fun m!161597 () Bool)

(assert (=> b!108928 m!161597))

(declare-fun m!161599 () Bool)

(assert (=> b!108928 m!161599))

(declare-fun m!161601 () Bool)

(assert (=> b!108928 m!161601))

(declare-fun m!161603 () Bool)

(assert (=> b!108928 m!161603))

(declare-fun m!161605 () Bool)

(assert (=> b!108928 m!161605))

(declare-fun m!161607 () Bool)

(assert (=> b!108928 m!161607))

(declare-fun m!161609 () Bool)

(assert (=> b!108928 m!161609))

(declare-fun m!161611 () Bool)

(assert (=> b!108928 m!161611))

(declare-fun m!161613 () Bool)

(assert (=> b!108928 m!161613))

(declare-fun m!161615 () Bool)

(assert (=> b!108926 m!161615))

(push 1)

(assert (not b!108928))

(assert (not b!108926))

(assert (not b!108921))

(assert (not b!108924))

(assert (not b!108922))

(assert (not b!108923))

(assert (not b!108931))

(assert (not start!21604))

(assert (not b!108925))

(assert (not b!108927))

(assert (not b!108920))

(assert (not b!108929))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

