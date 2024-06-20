; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21116 () Bool)

(assert start!21116)

(declare-fun b!106511 () Bool)

(declare-fun e!69737 () Bool)

(declare-datatypes ((array!4905 0))(
  ( (array!4906 (arr!2828 (Array (_ BitVec 32) (_ BitVec 8))) (size!2235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3944 0))(
  ( (BitStream!3945 (buf!2614 array!4905) (currentByte!5126 (_ BitVec 32)) (currentBit!5121 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3944)

(declare-fun array_inv!2037 (array!4905) Bool)

(assert (=> b!106511 (= e!69737 (array_inv!2037 (buf!2614 thiss!1305)))))

(declare-fun b!106512 () Bool)

(declare-fun res!87740 () Bool)

(declare-fun e!69734 () Bool)

(assert (=> b!106512 (=> (not res!87740) (not e!69734))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106512 (= res!87740 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!106514 () Bool)

(declare-fun e!69738 () Bool)

(declare-fun e!69732 () Bool)

(assert (=> b!106514 (= e!69738 e!69732)))

(declare-fun res!87745 () Bool)

(assert (=> b!106514 (=> (not res!87745) (not e!69732))))

(declare-fun lt!158319 () (_ BitVec 64))

(declare-fun lt!158314 () (_ BitVec 64))

(assert (=> b!106514 (= res!87745 (= lt!158319 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!158314)))))

(declare-datatypes ((Unit!6524 0))(
  ( (Unit!6525) )
))
(declare-datatypes ((tuple2!8768 0))(
  ( (tuple2!8769 (_1!4641 Unit!6524) (_2!4641 BitStream!3944)) )
))
(declare-fun lt!158308 () tuple2!8768)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!106514 (= lt!158319 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(assert (=> b!106514 (= lt!158314 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(declare-fun b!106515 () Bool)

(declare-fun e!69739 () Bool)

(declare-fun lt!158305 () tuple2!8768)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!106515 (= e!69739 (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158305)))))))

(declare-fun b!106516 () Bool)

(declare-fun e!69740 () Bool)

(declare-datatypes ((tuple2!8770 0))(
  ( (tuple2!8771 (_1!4642 BitStream!3944) (_2!4642 Bool)) )
))
(declare-fun lt!158322 () tuple2!8770)

(assert (=> b!106516 (= e!69740 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158322))) (currentByte!5126 (_1!4642 lt!158322)) (currentBit!5121 (_1!4642 lt!158322))) lt!158319))))

(declare-fun b!106517 () Bool)

(declare-fun res!87750 () Bool)

(assert (=> b!106517 (=> (not res!87750) (not e!69732))))

(declare-fun isPrefixOf!0 (BitStream!3944 BitStream!3944) Bool)

(assert (=> b!106517 (= res!87750 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158308)))))

(declare-fun b!106518 () Bool)

(declare-fun e!69735 () Bool)

(assert (=> b!106518 (= e!69734 (not e!69735))))

(declare-fun res!87746 () Bool)

(assert (=> b!106518 (=> res!87746 e!69735)))

(declare-fun lt!158315 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-datatypes ((tuple2!8772 0))(
  ( (tuple2!8773 (_1!4643 BitStream!3944) (_2!4643 BitStream!3944)) )
))
(declare-fun lt!158317 () tuple2!8772)

(declare-datatypes ((tuple2!8774 0))(
  ( (tuple2!8775 (_1!4644 BitStream!3944) (_2!4644 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8774)

(assert (=> b!106518 (= res!87746 (not (= (_1!4644 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158317) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315)) (_2!4643 lt!158317))))))

(declare-fun lt!158310 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158310)))

(declare-fun lt!158312 () Unit!6524)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3944 array!4905 (_ BitVec 64)) Unit!6524)

(assert (=> b!106518 (= lt!158312 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4641 lt!158308) (buf!2614 (_2!4641 lt!158305)) lt!158310))))

(assert (=> b!106518 (= lt!158310 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!158318 () (_ BitVec 64))

(declare-fun lt!158324 () (_ BitVec 64))

(declare-fun lt!158311 () tuple2!8770)

(assert (=> b!106518 (= lt!158315 (bvor lt!158324 (ite (_2!4642 lt!158311) lt!158318 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!158326 () tuple2!8774)

(declare-fun lt!158321 () tuple2!8772)

(assert (=> b!106518 (= lt!158326 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324))))

(declare-fun lt!158328 () (_ BitVec 64))

(assert (=> b!106518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)) lt!158328)))

(declare-fun lt!158325 () Unit!6524)

(assert (=> b!106518 (= lt!158325 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2614 (_2!4641 lt!158305)) lt!158328))))

(assert (=> b!106518 (= lt!158324 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!158327 () Bool)

(assert (=> b!106518 (= (_2!4642 lt!158311) lt!158327)))

(declare-fun readBitPure!0 (BitStream!3944) tuple2!8770)

(assert (=> b!106518 (= lt!158311 (readBitPure!0 (_1!4643 lt!158321)))))

(declare-fun reader!0 (BitStream!3944 BitStream!3944) tuple2!8772)

(assert (=> b!106518 (= lt!158317 (reader!0 (_2!4641 lt!158308) (_2!4641 lt!158305)))))

(assert (=> b!106518 (= lt!158321 (reader!0 thiss!1305 (_2!4641 lt!158305)))))

(declare-fun e!69736 () Bool)

(assert (=> b!106518 e!69736))

(declare-fun res!87741 () Bool)

(assert (=> b!106518 (=> (not res!87741) (not e!69736))))

(declare-fun lt!158309 () tuple2!8770)

(declare-fun lt!158304 () tuple2!8770)

(assert (=> b!106518 (= res!87741 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158309))) (currentByte!5126 (_1!4642 lt!158309)) (currentBit!5121 (_1!4642 lt!158309))) (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158304))) (currentByte!5126 (_1!4642 lt!158304)) (currentBit!5121 (_1!4642 lt!158304)))))))

(declare-fun lt!158320 () Unit!6524)

(declare-fun lt!158323 () BitStream!3944)

(declare-fun readBitPrefixLemma!0 (BitStream!3944 BitStream!3944) Unit!6524)

(assert (=> b!106518 (= lt!158320 (readBitPrefixLemma!0 lt!158323 (_2!4641 lt!158305)))))

(assert (=> b!106518 (= lt!158304 (readBitPure!0 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))))))

(assert (=> b!106518 (= lt!158309 (readBitPure!0 lt!158323))))

(assert (=> b!106518 (= lt!158323 (BitStream!3945 (buf!2614 (_2!4641 lt!158308)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(assert (=> b!106518 e!69739))

(declare-fun res!87744 () Bool)

(assert (=> b!106518 (=> (not res!87744) (not e!69739))))

(assert (=> b!106518 (= res!87744 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158305)))))

(declare-fun lt!158316 () Unit!6524)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3944 BitStream!3944 BitStream!3944) Unit!6524)

(assert (=> b!106518 (= lt!158316 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4641 lt!158308) (_2!4641 lt!158305)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3944 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8768)

(assert (=> b!106518 (= lt!158305 (appendNLeastSignificantBitsLoop!0 (_2!4641 lt!158308) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!106518 e!69738))

(declare-fun res!87739 () Bool)

(assert (=> b!106518 (=> (not res!87739) (not e!69738))))

(assert (=> b!106518 (= res!87739 (= (size!2235 (buf!2614 thiss!1305)) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(declare-fun appendBit!0 (BitStream!3944 Bool) tuple2!8768)

(assert (=> b!106518 (= lt!158308 (appendBit!0 thiss!1305 lt!158327))))

(assert (=> b!106518 (= lt!158327 (not (= (bvand v!199 lt!158318) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106518 (= lt!158318 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!106519 () Bool)

(assert (=> b!106519 (= e!69736 (= (_2!4642 lt!158309) (_2!4642 lt!158304)))))

(declare-fun b!106520 () Bool)

(declare-fun res!87749 () Bool)

(assert (=> b!106520 (=> (not res!87749) (not e!69734))))

(assert (=> b!106520 (= res!87749 (bvslt i!615 nBits!396))))

(declare-fun b!106521 () Bool)

(declare-fun res!87748 () Bool)

(assert (=> b!106521 (=> (not res!87748) (not e!69739))))

(assert (=> b!106521 (= res!87748 (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(declare-fun b!106522 () Bool)

(declare-fun lt!158306 () (_ BitVec 64))

(declare-fun moveBitIndexPrecond!0 (BitStream!3944 (_ BitVec 64)) Bool)

(assert (=> b!106522 (= e!69735 (moveBitIndexPrecond!0 (_2!4643 lt!158317) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158306)))))

(declare-fun lt!158303 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3944 (_ BitVec 64)) BitStream!3944)

(assert (=> b!106522 (= (_1!4643 lt!158321) (withMovedBitIndex!0 (_2!4643 lt!158321) (bvsub lt!158303 lt!158306)))))

(assert (=> b!106522 (= lt!158306 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158305))) (currentByte!5126 (_2!4641 lt!158305)) (currentBit!5121 (_2!4641 lt!158305))))))

(assert (=> b!106522 (= lt!158303 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(declare-fun lt!158307 () tuple2!8774)

(assert (=> b!106522 (and (= (_2!4644 lt!158326) (_2!4644 lt!158307)) (= (_1!4644 lt!158326) (_1!4644 lt!158307)))))

(declare-fun lt!158313 () Unit!6524)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6524)

(assert (=> b!106522 (= lt!158313 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324))))

(assert (=> b!106522 (= lt!158307 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315))))

(declare-fun b!106523 () Bool)

(assert (=> b!106523 (= e!69732 e!69740)))

(declare-fun res!87743 () Bool)

(assert (=> b!106523 (=> (not res!87743) (not e!69740))))

(assert (=> b!106523 (= res!87743 (and (= (_2!4642 lt!158322) lt!158327) (= (_1!4642 lt!158322) (_2!4641 lt!158308))))))

(declare-fun readerFrom!0 (BitStream!3944 (_ BitVec 32) (_ BitVec 32)) BitStream!3944)

(assert (=> b!106523 (= lt!158322 (readBitPure!0 (readerFrom!0 (_2!4641 lt!158308) (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305))))))

(declare-fun b!106513 () Bool)

(declare-fun e!69741 () Bool)

(assert (=> b!106513 (= e!69741 e!69734)))

(declare-fun res!87742 () Bool)

(assert (=> b!106513 (=> (not res!87742) (not e!69734))))

(assert (=> b!106513 (= res!87742 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)) lt!158328))))

(assert (=> b!106513 (= lt!158328 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!87747 () Bool)

(assert (=> start!21116 (=> (not res!87747) (not e!69741))))

(assert (=> start!21116 (= res!87747 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21116 e!69741))

(assert (=> start!21116 true))

(declare-fun inv!12 (BitStream!3944) Bool)

(assert (=> start!21116 (and (inv!12 thiss!1305) e!69737)))

(assert (= (and start!21116 res!87747) b!106513))

(assert (= (and b!106513 res!87742) b!106512))

(assert (= (and b!106512 res!87740) b!106520))

(assert (= (and b!106520 res!87749) b!106518))

(assert (= (and b!106518 res!87739) b!106514))

(assert (= (and b!106514 res!87745) b!106517))

(assert (= (and b!106517 res!87750) b!106523))

(assert (= (and b!106523 res!87743) b!106516))

(assert (= (and b!106518 res!87744) b!106521))

(assert (= (and b!106521 res!87748) b!106515))

(assert (= (and b!106518 res!87741) b!106519))

(assert (= (and b!106518 (not res!87746)) b!106522))

(assert (= start!21116 b!106511))

(declare-fun m!156883 () Bool)

(assert (=> b!106514 m!156883))

(declare-fun m!156885 () Bool)

(assert (=> b!106514 m!156885))

(declare-fun m!156887 () Bool)

(assert (=> b!106516 m!156887))

(declare-fun m!156889 () Bool)

(assert (=> b!106521 m!156889))

(declare-fun m!156891 () Bool)

(assert (=> b!106511 m!156891))

(declare-fun m!156893 () Bool)

(assert (=> start!21116 m!156893))

(declare-fun m!156895 () Bool)

(assert (=> b!106512 m!156895))

(declare-fun m!156897 () Bool)

(assert (=> b!106523 m!156897))

(assert (=> b!106523 m!156897))

(declare-fun m!156899 () Bool)

(assert (=> b!106523 m!156899))

(declare-fun m!156901 () Bool)

(assert (=> b!106522 m!156901))

(declare-fun m!156903 () Bool)

(assert (=> b!106522 m!156903))

(declare-fun m!156905 () Bool)

(assert (=> b!106522 m!156905))

(declare-fun m!156907 () Bool)

(assert (=> b!106522 m!156907))

(assert (=> b!106522 m!156901))

(declare-fun m!156909 () Bool)

(assert (=> b!106522 m!156909))

(assert (=> b!106522 m!156883))

(declare-fun m!156911 () Bool)

(assert (=> b!106522 m!156911))

(assert (=> b!106522 m!156885))

(declare-fun m!156913 () Bool)

(assert (=> b!106518 m!156913))

(declare-fun m!156915 () Bool)

(assert (=> b!106518 m!156915))

(declare-fun m!156917 () Bool)

(assert (=> b!106518 m!156917))

(declare-fun m!156919 () Bool)

(assert (=> b!106518 m!156919))

(declare-fun m!156921 () Bool)

(assert (=> b!106518 m!156921))

(declare-fun m!156923 () Bool)

(assert (=> b!106518 m!156923))

(declare-fun m!156925 () Bool)

(assert (=> b!106518 m!156925))

(declare-fun m!156927 () Bool)

(assert (=> b!106518 m!156927))

(declare-fun m!156929 () Bool)

(assert (=> b!106518 m!156929))

(declare-fun m!156931 () Bool)

(assert (=> b!106518 m!156931))

(declare-fun m!156933 () Bool)

(assert (=> b!106518 m!156933))

(declare-fun m!156935 () Bool)

(assert (=> b!106518 m!156935))

(declare-fun m!156937 () Bool)

(assert (=> b!106518 m!156937))

(declare-fun m!156939 () Bool)

(assert (=> b!106518 m!156939))

(declare-fun m!156941 () Bool)

(assert (=> b!106518 m!156941))

(declare-fun m!156943 () Bool)

(assert (=> b!106518 m!156943))

(declare-fun m!156945 () Bool)

(assert (=> b!106518 m!156945))

(declare-fun m!156947 () Bool)

(assert (=> b!106518 m!156947))

(declare-fun m!156949 () Bool)

(assert (=> b!106518 m!156949))

(declare-fun m!156951 () Bool)

(assert (=> b!106515 m!156951))

(declare-fun m!156953 () Bool)

(assert (=> b!106517 m!156953))

(declare-fun m!156955 () Bool)

(assert (=> b!106513 m!156955))

(push 1)

(assert (not b!106522))

(assert (not b!106512))

(assert (not b!106511))

(assert (not b!106518))

(assert (not b!106515))

(assert (not b!106523))

(assert (not b!106517))

(assert (not start!21116))

(assert (not b!106516))

(assert (not b!106513))

(assert (not b!106521))

(assert (not b!106514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33540 () Bool)

(assert (=> d!33540 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 thiss!1305))))))

(declare-fun bs!8189 () Bool)

(assert (= bs!8189 d!33540))

(declare-fun m!156997 () Bool)

(assert (=> bs!8189 m!156997))

(assert (=> start!21116 d!33540))

(declare-fun d!33542 () Bool)

(declare-fun res!87789 () Bool)

(declare-fun e!69769 () Bool)

(assert (=> d!33542 (=> (not res!87789) (not e!69769))))

(assert (=> d!33542 (= res!87789 (= (size!2235 (buf!2614 thiss!1305)) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(assert (=> d!33542 (= (isPrefixOf!0 thiss!1305 (_2!4641 lt!158308)) e!69769)))

(declare-fun b!106567 () Bool)

(declare-fun res!87790 () Bool)

(assert (=> b!106567 (=> (not res!87790) (not e!69769))))

(assert (=> b!106567 (= res!87790 (bvsle (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308)))))))

(declare-fun b!106568 () Bool)

(declare-fun e!69768 () Bool)

(assert (=> b!106568 (= e!69769 e!69768)))

(declare-fun res!87791 () Bool)

(assert (=> b!106568 (=> res!87791 e!69768)))

(assert (=> b!106568 (= res!87791 (= (size!2235 (buf!2614 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106569 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4905 array!4905 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!106569 (= e!69768 (arrayBitRangesEq!0 (buf!2614 thiss!1305) (buf!2614 (_2!4641 lt!158308)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))))))

(assert (= (and d!33542 res!87789) b!106567))

(assert (= (and b!106567 res!87790) b!106568))

(assert (= (and b!106568 (not res!87791)) b!106569))

(assert (=> b!106567 m!156885))

(assert (=> b!106567 m!156883))

(assert (=> b!106569 m!156885))

(assert (=> b!106569 m!156885))

(declare-fun m!156999 () Bool)

(assert (=> b!106569 m!156999))

(assert (=> b!106517 d!33542))

(declare-fun d!33544 () Bool)

(assert (=> d!33544 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!106518 d!33544))

(declare-fun d!33546 () Bool)

(assert (=> d!33546 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158310)))

(declare-fun lt!158454 () Unit!6524)

(declare-fun choose!9 (BitStream!3944 array!4905 (_ BitVec 64) BitStream!3944) Unit!6524)

(assert (=> d!33546 (= lt!158454 (choose!9 (_2!4641 lt!158308) (buf!2614 (_2!4641 lt!158305)) lt!158310 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308)))))))

(assert (=> d!33546 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4641 lt!158308) (buf!2614 (_2!4641 lt!158305)) lt!158310) lt!158454)))

(declare-fun bs!8190 () Bool)

(assert (= bs!8190 d!33546))

(assert (=> bs!8190 m!156941))

(declare-fun m!157001 () Bool)

(assert (=> bs!8190 m!157001))

(assert (=> b!106518 d!33546))

(declare-fun b!106597 () Bool)

(declare-fun res!87811 () Bool)

(declare-fun e!69783 () Bool)

(assert (=> b!106597 (=> (not res!87811) (not e!69783))))

(declare-fun lt!158565 () tuple2!8772)

(assert (=> b!106597 (= res!87811 (isPrefixOf!0 (_2!4643 lt!158565) (_2!4641 lt!158305)))))

(declare-fun d!33548 () Bool)

(assert (=> d!33548 e!69783))

(declare-fun res!87813 () Bool)

(assert (=> d!33548 (=> (not res!87813) (not e!69783))))

(assert (=> d!33548 (= res!87813 (isPrefixOf!0 (_1!4643 lt!158565) (_2!4643 lt!158565)))))

(declare-fun lt!158550 () BitStream!3944)

(assert (=> d!33548 (= lt!158565 (tuple2!8773 lt!158550 (_2!4641 lt!158305)))))

(declare-fun lt!158549 () Unit!6524)

(declare-fun lt!158554 () Unit!6524)

(assert (=> d!33548 (= lt!158549 lt!158554)))

(assert (=> d!33548 (isPrefixOf!0 lt!158550 (_2!4641 lt!158305))))

(assert (=> d!33548 (= lt!158554 (lemmaIsPrefixTransitive!0 lt!158550 (_2!4641 lt!158305) (_2!4641 lt!158305)))))

(declare-fun lt!158560 () Unit!6524)

(declare-fun lt!158562 () Unit!6524)

(assert (=> d!33548 (= lt!158560 lt!158562)))

(assert (=> d!33548 (isPrefixOf!0 lt!158550 (_2!4641 lt!158305))))

(assert (=> d!33548 (= lt!158562 (lemmaIsPrefixTransitive!0 lt!158550 (_2!4641 lt!158308) (_2!4641 lt!158305)))))

(declare-fun lt!158553 () Unit!6524)

(declare-fun e!69784 () Unit!6524)

(assert (=> d!33548 (= lt!158553 e!69784)))

(declare-fun c!6576 () Bool)

(assert (=> d!33548 (= c!6576 (not (= (size!2235 (buf!2614 (_2!4641 lt!158308))) #b00000000000000000000000000000000)))))

(declare-fun lt!158555 () Unit!6524)

(declare-fun lt!158547 () Unit!6524)

(assert (=> d!33548 (= lt!158555 lt!158547)))

(assert (=> d!33548 (isPrefixOf!0 (_2!4641 lt!158305) (_2!4641 lt!158305))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3944) Unit!6524)

(assert (=> d!33548 (= lt!158547 (lemmaIsPrefixRefl!0 (_2!4641 lt!158305)))))

(declare-fun lt!158563 () Unit!6524)

(declare-fun lt!158551 () Unit!6524)

(assert (=> d!33548 (= lt!158563 lt!158551)))

(assert (=> d!33548 (= lt!158551 (lemmaIsPrefixRefl!0 (_2!4641 lt!158305)))))

(declare-fun lt!158561 () Unit!6524)

(declare-fun lt!158566 () Unit!6524)

(assert (=> d!33548 (= lt!158561 lt!158566)))

(assert (=> d!33548 (isPrefixOf!0 lt!158550 lt!158550)))

(assert (=> d!33548 (= lt!158566 (lemmaIsPrefixRefl!0 lt!158550))))

(declare-fun lt!158552 () Unit!6524)

(declare-fun lt!158548 () Unit!6524)

(assert (=> d!33548 (= lt!158552 lt!158548)))

(assert (=> d!33548 (isPrefixOf!0 (_2!4641 lt!158308) (_2!4641 lt!158308))))

(assert (=> d!33548 (= lt!158548 (lemmaIsPrefixRefl!0 (_2!4641 lt!158308)))))

(assert (=> d!33548 (= lt!158550 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(assert (=> d!33548 (isPrefixOf!0 (_2!4641 lt!158308) (_2!4641 lt!158305))))

(assert (=> d!33548 (= (reader!0 (_2!4641 lt!158308) (_2!4641 lt!158305)) lt!158565)))

(declare-fun b!106598 () Bool)

(declare-fun res!87812 () Bool)

(assert (=> b!106598 (=> (not res!87812) (not e!69783))))

(assert (=> b!106598 (= res!87812 (isPrefixOf!0 (_1!4643 lt!158565) (_2!4641 lt!158308)))))

(declare-fun b!106599 () Bool)

(declare-fun lt!158556 () (_ BitVec 64))

(declare-fun lt!158558 () (_ BitVec 64))

(assert (=> b!106599 (= e!69783 (= (_1!4643 lt!158565) (withMovedBitIndex!0 (_2!4643 lt!158565) (bvsub lt!158556 lt!158558))))))

(assert (=> b!106599 (or (= (bvand lt!158556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158558 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158556 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158556 lt!158558) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106599 (= lt!158558 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158305))) (currentByte!5126 (_2!4641 lt!158305)) (currentBit!5121 (_2!4641 lt!158305))))))

(assert (=> b!106599 (= lt!158556 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(declare-fun b!106600 () Bool)

(declare-fun Unit!6530 () Unit!6524)

(assert (=> b!106600 (= e!69784 Unit!6530)))

(declare-fun b!106601 () Bool)

(declare-fun lt!158564 () Unit!6524)

(assert (=> b!106601 (= e!69784 lt!158564)))

(declare-fun lt!158557 () (_ BitVec 64))

(assert (=> b!106601 (= lt!158557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158559 () (_ BitVec 64))

(assert (=> b!106601 (= lt!158559 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4905 array!4905 (_ BitVec 64) (_ BitVec 64)) Unit!6524)

(assert (=> b!106601 (= lt!158564 (arrayBitRangesEqSymmetric!0 (buf!2614 (_2!4641 lt!158308)) (buf!2614 (_2!4641 lt!158305)) lt!158557 lt!158559))))

(assert (=> b!106601 (arrayBitRangesEq!0 (buf!2614 (_2!4641 lt!158305)) (buf!2614 (_2!4641 lt!158308)) lt!158557 lt!158559)))

(assert (= (and d!33548 c!6576) b!106601))

(assert (= (and d!33548 (not c!6576)) b!106600))

(assert (= (and d!33548 res!87813) b!106598))

(assert (= (and b!106598 res!87812) b!106597))

(assert (= (and b!106597 res!87811) b!106599))

(declare-fun m!157087 () Bool)

(assert (=> b!106597 m!157087))

(assert (=> b!106601 m!156883))

(declare-fun m!157089 () Bool)

(assert (=> b!106601 m!157089))

(declare-fun m!157091 () Bool)

(assert (=> b!106601 m!157091))

(declare-fun m!157093 () Bool)

(assert (=> b!106598 m!157093))

(declare-fun m!157095 () Bool)

(assert (=> d!33548 m!157095))

(declare-fun m!157097 () Bool)

(assert (=> d!33548 m!157097))

(declare-fun m!157099 () Bool)

(assert (=> d!33548 m!157099))

(declare-fun m!157101 () Bool)

(assert (=> d!33548 m!157101))

(declare-fun m!157103 () Bool)

(assert (=> d!33548 m!157103))

(declare-fun m!157105 () Bool)

(assert (=> d!33548 m!157105))

(declare-fun m!157107 () Bool)

(assert (=> d!33548 m!157107))

(declare-fun m!157109 () Bool)

(assert (=> d!33548 m!157109))

(declare-fun m!157111 () Bool)

(assert (=> d!33548 m!157111))

(declare-fun m!157113 () Bool)

(assert (=> d!33548 m!157113))

(declare-fun m!157115 () Bool)

(assert (=> d!33548 m!157115))

(declare-fun m!157117 () Bool)

(assert (=> b!106599 m!157117))

(assert (=> b!106599 m!156905))

(assert (=> b!106599 m!156883))

(assert (=> b!106518 d!33548))

(declare-fun d!33570 () Bool)

(declare-fun e!69787 () Bool)

(assert (=> d!33570 e!69787))

(declare-fun res!87816 () Bool)

(assert (=> d!33570 (=> (not res!87816) (not e!69787))))

(declare-fun lt!158576 () tuple2!8770)

(declare-fun lt!158577 () tuple2!8770)

(assert (=> d!33570 (= res!87816 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158576))) (currentByte!5126 (_1!4642 lt!158576)) (currentBit!5121 (_1!4642 lt!158576))) (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158577))) (currentByte!5126 (_1!4642 lt!158577)) (currentBit!5121 (_1!4642 lt!158577)))))))

(declare-fun lt!158578 () Unit!6524)

(declare-fun lt!158575 () BitStream!3944)

(declare-fun choose!50 (BitStream!3944 BitStream!3944 BitStream!3944 tuple2!8770 tuple2!8770 BitStream!3944 Bool tuple2!8770 tuple2!8770 BitStream!3944 Bool) Unit!6524)

(assert (=> d!33570 (= lt!158578 (choose!50 lt!158323 (_2!4641 lt!158305) lt!158575 lt!158576 (tuple2!8771 (_1!4642 lt!158576) (_2!4642 lt!158576)) (_1!4642 lt!158576) (_2!4642 lt!158576) lt!158577 (tuple2!8771 (_1!4642 lt!158577) (_2!4642 lt!158577)) (_1!4642 lt!158577) (_2!4642 lt!158577)))))

(assert (=> d!33570 (= lt!158577 (readBitPure!0 lt!158575))))

(assert (=> d!33570 (= lt!158576 (readBitPure!0 lt!158323))))

(assert (=> d!33570 (= lt!158575 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 lt!158323) (currentBit!5121 lt!158323)))))

(assert (=> d!33570 (invariant!0 (currentBit!5121 lt!158323) (currentByte!5126 lt!158323) (size!2235 (buf!2614 (_2!4641 lt!158305))))))

(assert (=> d!33570 (= (readBitPrefixLemma!0 lt!158323 (_2!4641 lt!158305)) lt!158578)))

(declare-fun b!106604 () Bool)

(assert (=> b!106604 (= e!69787 (= (_2!4642 lt!158576) (_2!4642 lt!158577)))))

(assert (= (and d!33570 res!87816) b!106604))

(assert (=> d!33570 m!156935))

(declare-fun m!157119 () Bool)

(assert (=> d!33570 m!157119))

(declare-fun m!157121 () Bool)

(assert (=> d!33570 m!157121))

(declare-fun m!157123 () Bool)

(assert (=> d!33570 m!157123))

(declare-fun m!157125 () Bool)

(assert (=> d!33570 m!157125))

(declare-fun m!157127 () Bool)

(assert (=> d!33570 m!157127))

(assert (=> b!106518 d!33570))

(declare-fun b!106616 () Bool)

(declare-fun e!69793 () Bool)

(declare-fun e!69792 () Bool)

(assert (=> b!106616 (= e!69793 e!69792)))

(declare-fun res!87826 () Bool)

(assert (=> b!106616 (=> (not res!87826) (not e!69792))))

(declare-fun lt!158588 () tuple2!8768)

(declare-fun lt!158590 () tuple2!8770)

(assert (=> b!106616 (= res!87826 (and (= (_2!4642 lt!158590) lt!158327) (= (_1!4642 lt!158590) (_2!4641 lt!158588))))))

(assert (=> b!106616 (= lt!158590 (readBitPure!0 (readerFrom!0 (_2!4641 lt!158588) (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305))))))

(declare-fun b!106615 () Bool)

(declare-fun res!87825 () Bool)

(assert (=> b!106615 (=> (not res!87825) (not e!69793))))

(assert (=> b!106615 (= res!87825 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158588)))))

(declare-fun b!106614 () Bool)

(declare-fun res!87828 () Bool)

(assert (=> b!106614 (=> (not res!87828) (not e!69793))))

(declare-fun lt!158589 () (_ BitVec 64))

(declare-fun lt!158587 () (_ BitVec 64))

(assert (=> b!106614 (= res!87828 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158588))) (currentByte!5126 (_2!4641 lt!158588)) (currentBit!5121 (_2!4641 lt!158588))) (bvadd lt!158587 lt!158589)))))

(assert (=> b!106614 (or (not (= (bvand lt!158587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158589 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158587 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158587 lt!158589) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106614 (= lt!158589 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!106614 (= lt!158587 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(declare-fun d!33572 () Bool)

(assert (=> d!33572 e!69793))

(declare-fun res!87827 () Bool)

(assert (=> d!33572 (=> (not res!87827) (not e!69793))))

(assert (=> d!33572 (= res!87827 (= (size!2235 (buf!2614 thiss!1305)) (size!2235 (buf!2614 (_2!4641 lt!158588)))))))

(declare-fun choose!16 (BitStream!3944 Bool) tuple2!8768)

(assert (=> d!33572 (= lt!158588 (choose!16 thiss!1305 lt!158327))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33572 (validate_offset_bit!0 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)))))

(assert (=> d!33572 (= (appendBit!0 thiss!1305 lt!158327) lt!158588)))

(declare-fun b!106617 () Bool)

(assert (=> b!106617 (= e!69792 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158590))) (currentByte!5126 (_1!4642 lt!158590)) (currentBit!5121 (_1!4642 lt!158590))) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158588))) (currentByte!5126 (_2!4641 lt!158588)) (currentBit!5121 (_2!4641 lt!158588)))))))

(assert (= (and d!33572 res!87827) b!106614))

(assert (= (and b!106614 res!87828) b!106615))

(assert (= (and b!106615 res!87825) b!106616))

(assert (= (and b!106616 res!87826) b!106617))

(declare-fun m!157129 () Bool)

(assert (=> b!106617 m!157129))

(declare-fun m!157131 () Bool)

(assert (=> b!106617 m!157131))

(declare-fun m!157133 () Bool)

(assert (=> d!33572 m!157133))

(declare-fun m!157135 () Bool)

(assert (=> d!33572 m!157135))

(assert (=> b!106614 m!157131))

(assert (=> b!106614 m!156885))

(declare-fun m!157137 () Bool)

(assert (=> b!106616 m!157137))

(assert (=> b!106616 m!157137))

(declare-fun m!157139 () Bool)

(assert (=> b!106616 m!157139))

(declare-fun m!157141 () Bool)

(assert (=> b!106615 m!157141))

(assert (=> b!106518 d!33572))

(declare-datatypes ((tuple2!8780 0))(
  ( (tuple2!8781 (_1!4647 (_ BitVec 64)) (_2!4647 BitStream!3944)) )
))
(declare-fun lt!158593 () tuple2!8780)

(declare-fun d!33574 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8780)

(assert (=> d!33574 (= lt!158593 (readNLeastSignificantBitsLoop!0 (_1!4643 lt!158317) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315))))

(assert (=> d!33574 (= (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158317) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315) (tuple2!8775 (_2!4647 lt!158593) (_1!4647 lt!158593)))))

(declare-fun bs!8195 () Bool)

(assert (= bs!8195 d!33574))

(declare-fun m!157143 () Bool)

(assert (=> bs!8195 m!157143))

(assert (=> b!106518 d!33574))

(declare-fun d!33576 () Bool)

(declare-fun e!69796 () Bool)

(assert (=> d!33576 e!69796))

(declare-fun res!87833 () Bool)

(assert (=> d!33576 (=> (not res!87833) (not e!69796))))

(declare-fun lt!158610 () (_ BitVec 64))

(declare-fun lt!158611 () (_ BitVec 64))

(declare-fun lt!158608 () (_ BitVec 64))

(assert (=> d!33576 (= res!87833 (= lt!158610 (bvsub lt!158611 lt!158608)))))

(assert (=> d!33576 (or (= (bvand lt!158611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158608 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158611 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158611 lt!158608) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33576 (= lt!158608 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158304)))) ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158304))) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158304)))))))

(declare-fun lt!158609 () (_ BitVec 64))

(declare-fun lt!158606 () (_ BitVec 64))

(assert (=> d!33576 (= lt!158611 (bvmul lt!158609 lt!158606))))

(assert (=> d!33576 (or (= lt!158609 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158606 (bvsdiv (bvmul lt!158609 lt!158606) lt!158609)))))

(assert (=> d!33576 (= lt!158606 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33576 (= lt!158609 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158304)))))))

(assert (=> d!33576 (= lt!158610 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158304))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158304)))))))

(assert (=> d!33576 (invariant!0 (currentBit!5121 (_1!4642 lt!158304)) (currentByte!5126 (_1!4642 lt!158304)) (size!2235 (buf!2614 (_1!4642 lt!158304))))))

(assert (=> d!33576 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158304))) (currentByte!5126 (_1!4642 lt!158304)) (currentBit!5121 (_1!4642 lt!158304))) lt!158610)))

(declare-fun b!106622 () Bool)

(declare-fun res!87834 () Bool)

(assert (=> b!106622 (=> (not res!87834) (not e!69796))))

(assert (=> b!106622 (= res!87834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158610))))

(declare-fun b!106623 () Bool)

(declare-fun lt!158607 () (_ BitVec 64))

(assert (=> b!106623 (= e!69796 (bvsle lt!158610 (bvmul lt!158607 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106623 (or (= lt!158607 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158607 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158607)))))

(assert (=> b!106623 (= lt!158607 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158304)))))))

(assert (= (and d!33576 res!87833) b!106622))

(assert (= (and b!106622 res!87834) b!106623))

(declare-fun m!157145 () Bool)

(assert (=> d!33576 m!157145))

(declare-fun m!157147 () Bool)

(assert (=> d!33576 m!157147))

(assert (=> b!106518 d!33576))

(declare-fun d!33578 () Bool)

(assert (=> d!33578 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)) lt!158328) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305))) lt!158328))))

(declare-fun bs!8196 () Bool)

(assert (= bs!8196 d!33578))

(declare-fun m!157149 () Bool)

(assert (=> bs!8196 m!157149))

(assert (=> b!106518 d!33578))

(declare-fun d!33580 () Bool)

(assert (=> d!33580 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158310) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308)))) lt!158310))))

(declare-fun bs!8197 () Bool)

(assert (= bs!8197 d!33580))

(declare-fun m!157151 () Bool)

(assert (=> bs!8197 m!157151))

(assert (=> b!106518 d!33580))

(declare-fun b!106624 () Bool)

(declare-fun res!87835 () Bool)

(declare-fun e!69797 () Bool)

(assert (=> b!106624 (=> (not res!87835) (not e!69797))))

(declare-fun lt!158630 () tuple2!8772)

(assert (=> b!106624 (= res!87835 (isPrefixOf!0 (_2!4643 lt!158630) (_2!4641 lt!158305)))))

(declare-fun d!33582 () Bool)

(assert (=> d!33582 e!69797))

(declare-fun res!87837 () Bool)

(assert (=> d!33582 (=> (not res!87837) (not e!69797))))

(assert (=> d!33582 (= res!87837 (isPrefixOf!0 (_1!4643 lt!158630) (_2!4643 lt!158630)))))

(declare-fun lt!158615 () BitStream!3944)

(assert (=> d!33582 (= lt!158630 (tuple2!8773 lt!158615 (_2!4641 lt!158305)))))

(declare-fun lt!158614 () Unit!6524)

(declare-fun lt!158619 () Unit!6524)

(assert (=> d!33582 (= lt!158614 lt!158619)))

(assert (=> d!33582 (isPrefixOf!0 lt!158615 (_2!4641 lt!158305))))

(assert (=> d!33582 (= lt!158619 (lemmaIsPrefixTransitive!0 lt!158615 (_2!4641 lt!158305) (_2!4641 lt!158305)))))

(declare-fun lt!158625 () Unit!6524)

(declare-fun lt!158627 () Unit!6524)

(assert (=> d!33582 (= lt!158625 lt!158627)))

(assert (=> d!33582 (isPrefixOf!0 lt!158615 (_2!4641 lt!158305))))

(assert (=> d!33582 (= lt!158627 (lemmaIsPrefixTransitive!0 lt!158615 thiss!1305 (_2!4641 lt!158305)))))

(declare-fun lt!158618 () Unit!6524)

(declare-fun e!69798 () Unit!6524)

(assert (=> d!33582 (= lt!158618 e!69798)))

(declare-fun c!6577 () Bool)

(assert (=> d!33582 (= c!6577 (not (= (size!2235 (buf!2614 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!158620 () Unit!6524)

(declare-fun lt!158612 () Unit!6524)

(assert (=> d!33582 (= lt!158620 lt!158612)))

(assert (=> d!33582 (isPrefixOf!0 (_2!4641 lt!158305) (_2!4641 lt!158305))))

(assert (=> d!33582 (= lt!158612 (lemmaIsPrefixRefl!0 (_2!4641 lt!158305)))))

(declare-fun lt!158628 () Unit!6524)

(declare-fun lt!158616 () Unit!6524)

(assert (=> d!33582 (= lt!158628 lt!158616)))

(assert (=> d!33582 (= lt!158616 (lemmaIsPrefixRefl!0 (_2!4641 lt!158305)))))

(declare-fun lt!158626 () Unit!6524)

(declare-fun lt!158631 () Unit!6524)

(assert (=> d!33582 (= lt!158626 lt!158631)))

(assert (=> d!33582 (isPrefixOf!0 lt!158615 lt!158615)))

(assert (=> d!33582 (= lt!158631 (lemmaIsPrefixRefl!0 lt!158615))))

(declare-fun lt!158617 () Unit!6524)

(declare-fun lt!158613 () Unit!6524)

(assert (=> d!33582 (= lt!158617 lt!158613)))

(assert (=> d!33582 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33582 (= lt!158613 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33582 (= lt!158615 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(assert (=> d!33582 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158305))))

(assert (=> d!33582 (= (reader!0 thiss!1305 (_2!4641 lt!158305)) lt!158630)))

(declare-fun b!106625 () Bool)

(declare-fun res!87836 () Bool)

(assert (=> b!106625 (=> (not res!87836) (not e!69797))))

(assert (=> b!106625 (= res!87836 (isPrefixOf!0 (_1!4643 lt!158630) thiss!1305))))

(declare-fun b!106626 () Bool)

(declare-fun lt!158623 () (_ BitVec 64))

(declare-fun lt!158621 () (_ BitVec 64))

(assert (=> b!106626 (= e!69797 (= (_1!4643 lt!158630) (withMovedBitIndex!0 (_2!4643 lt!158630) (bvsub lt!158621 lt!158623))))))

(assert (=> b!106626 (or (= (bvand lt!158621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158623 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158621 lt!158623) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106626 (= lt!158623 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158305))) (currentByte!5126 (_2!4641 lt!158305)) (currentBit!5121 (_2!4641 lt!158305))))))

(assert (=> b!106626 (= lt!158621 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(declare-fun b!106627 () Bool)

(declare-fun Unit!6535 () Unit!6524)

(assert (=> b!106627 (= e!69798 Unit!6535)))

(declare-fun b!106628 () Bool)

(declare-fun lt!158629 () Unit!6524)

(assert (=> b!106628 (= e!69798 lt!158629)))

(declare-fun lt!158622 () (_ BitVec 64))

(assert (=> b!106628 (= lt!158622 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!158624 () (_ BitVec 64))

(assert (=> b!106628 (= lt!158624 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(assert (=> b!106628 (= lt!158629 (arrayBitRangesEqSymmetric!0 (buf!2614 thiss!1305) (buf!2614 (_2!4641 lt!158305)) lt!158622 lt!158624))))

(assert (=> b!106628 (arrayBitRangesEq!0 (buf!2614 (_2!4641 lt!158305)) (buf!2614 thiss!1305) lt!158622 lt!158624)))

(assert (= (and d!33582 c!6577) b!106628))

(assert (= (and d!33582 (not c!6577)) b!106627))

(assert (= (and d!33582 res!87837) b!106625))

(assert (= (and b!106625 res!87836) b!106624))

(assert (= (and b!106624 res!87835) b!106626))

(declare-fun m!157153 () Bool)

(assert (=> b!106624 m!157153))

(assert (=> b!106628 m!156885))

(declare-fun m!157155 () Bool)

(assert (=> b!106628 m!157155))

(declare-fun m!157157 () Bool)

(assert (=> b!106628 m!157157))

(declare-fun m!157159 () Bool)

(assert (=> b!106625 m!157159))

(declare-fun m!157161 () Bool)

(assert (=> d!33582 m!157161))

(assert (=> d!33582 m!157097))

(declare-fun m!157163 () Bool)

(assert (=> d!33582 m!157163))

(declare-fun m!157165 () Bool)

(assert (=> d!33582 m!157165))

(declare-fun m!157167 () Bool)

(assert (=> d!33582 m!157167))

(declare-fun m!157169 () Bool)

(assert (=> d!33582 m!157169))

(assert (=> d!33582 m!156929))

(declare-fun m!157171 () Bool)

(assert (=> d!33582 m!157171))

(declare-fun m!157173 () Bool)

(assert (=> d!33582 m!157173))

(declare-fun m!157175 () Bool)

(assert (=> d!33582 m!157175))

(assert (=> d!33582 m!157115))

(declare-fun m!157177 () Bool)

(assert (=> b!106626 m!157177))

(assert (=> b!106626 m!156905))

(assert (=> b!106626 m!156885))

(assert (=> b!106518 d!33582))

(declare-fun d!33584 () Bool)

(declare-datatypes ((tuple2!8782 0))(
  ( (tuple2!8783 (_1!4648 Bool) (_2!4648 BitStream!3944)) )
))
(declare-fun lt!158634 () tuple2!8782)

(declare-fun readBit!0 (BitStream!3944) tuple2!8782)

(assert (=> d!33584 (= lt!158634 (readBit!0 lt!158323))))

(assert (=> d!33584 (= (readBitPure!0 lt!158323) (tuple2!8771 (_2!4648 lt!158634) (_1!4648 lt!158634)))))

(declare-fun bs!8198 () Bool)

(assert (= bs!8198 d!33584))

(declare-fun m!157179 () Bool)

(assert (=> bs!8198 m!157179))

(assert (=> b!106518 d!33584))

(declare-fun d!33586 () Bool)

(declare-fun e!69799 () Bool)

(assert (=> d!33586 e!69799))

(declare-fun res!87838 () Bool)

(assert (=> d!33586 (=> (not res!87838) (not e!69799))))

(declare-fun lt!158637 () (_ BitVec 64))

(declare-fun lt!158639 () (_ BitVec 64))

(declare-fun lt!158640 () (_ BitVec 64))

(assert (=> d!33586 (= res!87838 (= lt!158639 (bvsub lt!158640 lt!158637)))))

(assert (=> d!33586 (or (= (bvand lt!158640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158637 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158640 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158640 lt!158637) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33586 (= lt!158637 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158309)))) ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158309))) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158309)))))))

(declare-fun lt!158638 () (_ BitVec 64))

(declare-fun lt!158635 () (_ BitVec 64))

(assert (=> d!33586 (= lt!158640 (bvmul lt!158638 lt!158635))))

(assert (=> d!33586 (or (= lt!158638 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158635 (bvsdiv (bvmul lt!158638 lt!158635) lt!158638)))))

(assert (=> d!33586 (= lt!158635 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33586 (= lt!158638 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158309)))))))

(assert (=> d!33586 (= lt!158639 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158309))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158309)))))))

(assert (=> d!33586 (invariant!0 (currentBit!5121 (_1!4642 lt!158309)) (currentByte!5126 (_1!4642 lt!158309)) (size!2235 (buf!2614 (_1!4642 lt!158309))))))

(assert (=> d!33586 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158309))) (currentByte!5126 (_1!4642 lt!158309)) (currentBit!5121 (_1!4642 lt!158309))) lt!158639)))

(declare-fun b!106629 () Bool)

(declare-fun res!87839 () Bool)

(assert (=> b!106629 (=> (not res!87839) (not e!69799))))

(assert (=> b!106629 (= res!87839 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158639))))

(declare-fun b!106630 () Bool)

(declare-fun lt!158636 () (_ BitVec 64))

(assert (=> b!106630 (= e!69799 (bvsle lt!158639 (bvmul lt!158636 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106630 (or (= lt!158636 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158636 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158636)))))

(assert (=> b!106630 (= lt!158636 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158309)))))))

(assert (= (and d!33586 res!87838) b!106629))

(assert (= (and b!106629 res!87839) b!106630))

(declare-fun m!157181 () Bool)

(assert (=> d!33586 m!157181))

(declare-fun m!157183 () Bool)

(assert (=> d!33586 m!157183))

(assert (=> b!106518 d!33586))

(declare-fun d!33588 () Bool)

(declare-fun lt!158641 () tuple2!8782)

(assert (=> d!33588 (= lt!158641 (readBit!0 (_1!4643 lt!158321)))))

(assert (=> d!33588 (= (readBitPure!0 (_1!4643 lt!158321)) (tuple2!8771 (_2!4648 lt!158641) (_1!4648 lt!158641)))))

(declare-fun bs!8199 () Bool)

(assert (= bs!8199 d!33588))

(declare-fun m!157185 () Bool)

(assert (=> bs!8199 m!157185))

(assert (=> b!106518 d!33588))

(declare-fun d!33590 () Bool)

(declare-fun lt!158642 () tuple2!8782)

(assert (=> d!33590 (= lt!158642 (readBit!0 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))))))

(assert (=> d!33590 (= (readBitPure!0 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))) (tuple2!8771 (_2!4648 lt!158642) (_1!4648 lt!158642)))))

(declare-fun bs!8200 () Bool)

(assert (= bs!8200 d!33590))

(declare-fun m!157187 () Bool)

(assert (=> bs!8200 m!157187))

(assert (=> b!106518 d!33590))

(declare-fun d!33592 () Bool)

(declare-fun lt!158643 () tuple2!8780)

(assert (=> d!33592 (= lt!158643 (readNLeastSignificantBitsLoop!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324))))

(assert (=> d!33592 (= (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324) (tuple2!8775 (_2!4647 lt!158643) (_1!4647 lt!158643)))))

(declare-fun bs!8201 () Bool)

(assert (= bs!8201 d!33592))

(declare-fun m!157189 () Bool)

(assert (=> bs!8201 m!157189))

(assert (=> b!106518 d!33592))

(declare-fun d!33594 () Bool)

(assert (=> d!33594 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)) lt!158328)))

(declare-fun lt!158644 () Unit!6524)

(assert (=> d!33594 (= lt!158644 (choose!9 thiss!1305 (buf!2614 (_2!4641 lt!158305)) lt!158328 (BitStream!3945 (buf!2614 (_2!4641 lt!158305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))))))

(assert (=> d!33594 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2614 (_2!4641 lt!158305)) lt!158328) lt!158644)))

(declare-fun bs!8202 () Bool)

(assert (= bs!8202 d!33594))

(assert (=> bs!8202 m!156945))

(declare-fun m!157191 () Bool)

(assert (=> bs!8202 m!157191))

(assert (=> b!106518 d!33594))

(declare-fun d!33596 () Bool)

(assert (=> d!33596 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158305))))

(declare-fun lt!158647 () Unit!6524)

(declare-fun choose!30 (BitStream!3944 BitStream!3944 BitStream!3944) Unit!6524)

(assert (=> d!33596 (= lt!158647 (choose!30 thiss!1305 (_2!4641 lt!158308) (_2!4641 lt!158305)))))

(assert (=> d!33596 (isPrefixOf!0 thiss!1305 (_2!4641 lt!158308))))

(assert (=> d!33596 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4641 lt!158308) (_2!4641 lt!158305)) lt!158647)))

(declare-fun bs!8203 () Bool)

(assert (= bs!8203 d!33596))

(assert (=> bs!8203 m!156929))

(declare-fun m!157193 () Bool)

(assert (=> bs!8203 m!157193))

(assert (=> bs!8203 m!156953))

(assert (=> b!106518 d!33596))

(declare-fun b!106723 () Bool)

(declare-fun e!69853 () Bool)

(declare-fun lt!158928 () tuple2!8770)

(declare-fun lt!158918 () tuple2!8768)

(assert (=> b!106723 (= e!69853 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158928))) (currentByte!5126 (_1!4642 lt!158928)) (currentBit!5121 (_1!4642 lt!158928))) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158918))) (currentByte!5126 (_2!4641 lt!158918)) (currentBit!5121 (_2!4641 lt!158918)))))))

(declare-fun b!106724 () Bool)

(assert (=> b!106724 (= lt!158928 (readBitPure!0 (readerFrom!0 (_2!4641 lt!158918) (currentBit!5121 (_2!4641 lt!158308)) (currentByte!5126 (_2!4641 lt!158308)))))))

(declare-fun lt!158940 () Bool)

(declare-fun res!87912 () Bool)

(assert (=> b!106724 (= res!87912 (and (= (_2!4642 lt!158928) lt!158940) (= (_1!4642 lt!158928) (_2!4641 lt!158918))))))

(assert (=> b!106724 (=> (not res!87912) (not e!69853))))

(declare-fun e!69854 () Bool)

(assert (=> b!106724 (= e!69854 e!69853)))

(declare-fun b!106725 () Bool)

(declare-fun e!69855 () tuple2!8768)

(declare-fun lt!158949 () tuple2!8768)

(declare-fun Unit!6536 () Unit!6524)

(assert (=> b!106725 (= e!69855 (tuple2!8769 Unit!6536 (_2!4641 lt!158949)))))

(assert (=> b!106725 (= lt!158940 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106725 (= lt!158918 (appendBit!0 (_2!4641 lt!158308) lt!158940))))

(declare-fun res!87915 () Bool)

(assert (=> b!106725 (= res!87915 (= (size!2235 (buf!2614 (_2!4641 lt!158308))) (size!2235 (buf!2614 (_2!4641 lt!158918)))))))

(assert (=> b!106725 (=> (not res!87915) (not e!69854))))

(assert (=> b!106725 e!69854))

(declare-fun lt!158931 () tuple2!8768)

(assert (=> b!106725 (= lt!158931 lt!158918)))

(assert (=> b!106725 (= lt!158949 (appendNLeastSignificantBitsLoop!0 (_2!4641 lt!158931) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!158929 () Unit!6524)

(assert (=> b!106725 (= lt!158929 (lemmaIsPrefixTransitive!0 (_2!4641 lt!158308) (_2!4641 lt!158931) (_2!4641 lt!158949)))))

(declare-fun call!1347 () Bool)

(assert (=> b!106725 call!1347))

(declare-fun lt!158945 () Unit!6524)

(assert (=> b!106725 (= lt!158945 lt!158929)))

(assert (=> b!106725 (invariant!0 (currentBit!5121 (_2!4641 lt!158308)) (currentByte!5126 (_2!4641 lt!158308)) (size!2235 (buf!2614 (_2!4641 lt!158931))))))

(declare-fun lt!158947 () BitStream!3944)

(assert (=> b!106725 (= lt!158947 (BitStream!3945 (buf!2614 (_2!4641 lt!158931)) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(assert (=> b!106725 (invariant!0 (currentBit!5121 lt!158947) (currentByte!5126 lt!158947) (size!2235 (buf!2614 (_2!4641 lt!158949))))))

(declare-fun lt!158953 () BitStream!3944)

(assert (=> b!106725 (= lt!158953 (BitStream!3945 (buf!2614 (_2!4641 lt!158949)) (currentByte!5126 lt!158947) (currentBit!5121 lt!158947)))))

(declare-fun lt!158942 () tuple2!8770)

(assert (=> b!106725 (= lt!158942 (readBitPure!0 lt!158947))))

(declare-fun lt!158944 () tuple2!8770)

(assert (=> b!106725 (= lt!158944 (readBitPure!0 lt!158953))))

(declare-fun lt!158958 () Unit!6524)

(assert (=> b!106725 (= lt!158958 (readBitPrefixLemma!0 lt!158947 (_2!4641 lt!158949)))))

(declare-fun res!87917 () Bool)

(assert (=> b!106725 (= res!87917 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158942))) (currentByte!5126 (_1!4642 lt!158942)) (currentBit!5121 (_1!4642 lt!158942))) (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158944))) (currentByte!5126 (_1!4642 lt!158944)) (currentBit!5121 (_1!4642 lt!158944)))))))

(declare-fun e!69856 () Bool)

(assert (=> b!106725 (=> (not res!87917) (not e!69856))))

(assert (=> b!106725 e!69856))

(declare-fun lt!158946 () Unit!6524)

(assert (=> b!106725 (= lt!158946 lt!158958)))

(declare-fun lt!158948 () tuple2!8772)

(assert (=> b!106725 (= lt!158948 (reader!0 (_2!4641 lt!158308) (_2!4641 lt!158949)))))

(declare-fun lt!158950 () tuple2!8772)

(assert (=> b!106725 (= lt!158950 (reader!0 (_2!4641 lt!158931) (_2!4641 lt!158949)))))

(declare-fun lt!158925 () tuple2!8770)

(assert (=> b!106725 (= lt!158925 (readBitPure!0 (_1!4643 lt!158948)))))

(assert (=> b!106725 (= (_2!4642 lt!158925) lt!158940)))

(declare-fun lt!158933 () Unit!6524)

(declare-fun Unit!6537 () Unit!6524)

(assert (=> b!106725 (= lt!158933 Unit!6537)))

(declare-fun lt!158927 () (_ BitVec 64))

(assert (=> b!106725 (= lt!158927 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!158938 () (_ BitVec 64))

(assert (=> b!106725 (= lt!158938 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!158951 () Unit!6524)

(assert (=> b!106725 (= lt!158951 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4641 lt!158308) (buf!2614 (_2!4641 lt!158949)) lt!158938))))

(assert (=> b!106725 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158949)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158938)))

(declare-fun lt!158934 () Unit!6524)

(assert (=> b!106725 (= lt!158934 lt!158951)))

(declare-fun lt!158954 () tuple2!8774)

(assert (=> b!106725 (= lt!158954 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158948) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158927))))

(declare-fun lt!158960 () (_ BitVec 64))

(assert (=> b!106725 (= lt!158960 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!158956 () Unit!6524)

(assert (=> b!106725 (= lt!158956 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4641 lt!158931) (buf!2614 (_2!4641 lt!158949)) lt!158960))))

(assert (=> b!106725 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158949)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158931))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158931))) lt!158960)))

(declare-fun lt!158923 () Unit!6524)

(assert (=> b!106725 (= lt!158923 lt!158956)))

(declare-fun lt!158932 () tuple2!8774)

(assert (=> b!106725 (= lt!158932 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158950) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!158927 (ite (_2!4642 lt!158925) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!158937 () tuple2!8774)

(assert (=> b!106725 (= lt!158937 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158948) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158927))))

(declare-fun c!6589 () Bool)

(assert (=> b!106725 (= c!6589 (_2!4642 (readBitPure!0 (_1!4643 lt!158948))))))

(declare-fun lt!158926 () tuple2!8774)

(declare-fun e!69850 () (_ BitVec 64))

(assert (=> b!106725 (= lt!158926 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4643 lt!158948) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!158927 e!69850)))))

(declare-fun lt!158957 () Unit!6524)

(assert (=> b!106725 (= lt!158957 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4643 lt!158948) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158927))))

(assert (=> b!106725 (and (= (_2!4644 lt!158937) (_2!4644 lt!158926)) (= (_1!4644 lt!158937) (_1!4644 lt!158926)))))

(declare-fun lt!158919 () Unit!6524)

(assert (=> b!106725 (= lt!158919 lt!158957)))

(assert (=> b!106725 (= (_1!4643 lt!158948) (withMovedBitIndex!0 (_2!4643 lt!158948) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158949))) (currentByte!5126 (_2!4641 lt!158949)) (currentBit!5121 (_2!4641 lt!158949))))))))

(declare-fun lt!158921 () Unit!6524)

(declare-fun Unit!6538 () Unit!6524)

(assert (=> b!106725 (= lt!158921 Unit!6538)))

(assert (=> b!106725 (= (_1!4643 lt!158950) (withMovedBitIndex!0 (_2!4643 lt!158950) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158931))) (currentByte!5126 (_2!4641 lt!158931)) (currentBit!5121 (_2!4641 lt!158931))) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158949))) (currentByte!5126 (_2!4641 lt!158949)) (currentBit!5121 (_2!4641 lt!158949))))))))

(declare-fun lt!158959 () Unit!6524)

(declare-fun Unit!6539 () Unit!6524)

(assert (=> b!106725 (= lt!158959 Unit!6539)))

(assert (=> b!106725 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158931))) (currentByte!5126 (_2!4641 lt!158931)) (currentBit!5121 (_2!4641 lt!158931))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!158955 () Unit!6524)

(declare-fun Unit!6540 () Unit!6524)

(assert (=> b!106725 (= lt!158955 Unit!6540)))

(assert (=> b!106725 (= (_2!4644 lt!158954) (_2!4644 lt!158932))))

(declare-fun lt!158930 () Unit!6524)

(declare-fun Unit!6541 () Unit!6524)

(assert (=> b!106725 (= lt!158930 Unit!6541)))

(assert (=> b!106725 (= (_1!4644 lt!158954) (_2!4643 lt!158948))))

(declare-fun b!106726 () Bool)

(declare-fun res!87920 () Bool)

(assert (=> b!106726 (= res!87920 (isPrefixOf!0 (_2!4641 lt!158308) (_2!4641 lt!158918)))))

(assert (=> b!106726 (=> (not res!87920) (not e!69854))))

(declare-fun b!106727 () Bool)

(declare-fun res!87914 () Bool)

(assert (=> b!106727 (= res!87914 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158918))) (currentByte!5126 (_2!4641 lt!158918)) (currentBit!5121 (_2!4641 lt!158918))) (bvadd (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!106727 (=> (not res!87914) (not e!69854))))

(declare-fun b!106728 () Bool)

(assert (=> b!106728 (= e!69856 (= (_2!4642 lt!158942) (_2!4642 lt!158944)))))

(declare-fun b!106729 () Bool)

(assert (=> b!106729 (= e!69850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!106730 () Bool)

(declare-fun lt!158943 () Unit!6524)

(assert (=> b!106730 (= e!69855 (tuple2!8769 lt!158943 (_2!4641 lt!158308)))))

(declare-fun lt!158939 () BitStream!3944)

(assert (=> b!106730 (= lt!158939 (_2!4641 lt!158308))))

(assert (=> b!106730 (= lt!158943 (lemmaIsPrefixRefl!0 lt!158939))))

(assert (=> b!106730 call!1347))

(declare-fun b!106731 () Bool)

(declare-fun res!87919 () Bool)

(declare-fun e!69852 () Bool)

(assert (=> b!106731 (=> (not res!87919) (not e!69852))))

(declare-fun lt!158924 () tuple2!8768)

(assert (=> b!106731 (= res!87919 (isPrefixOf!0 (_2!4641 lt!158308) (_2!4641 lt!158924)))))

(declare-fun b!106732 () Bool)

(declare-fun res!87913 () Bool)

(assert (=> b!106732 (=> (not res!87913) (not e!69852))))

(declare-fun lt!158961 () (_ BitVec 64))

(declare-fun lt!158952 () (_ BitVec 64))

(assert (=> b!106732 (= res!87913 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158924))) (currentByte!5126 (_2!4641 lt!158924)) (currentBit!5121 (_2!4641 lt!158924))) (bvadd lt!158961 lt!158952)))))

(assert (=> b!106732 (or (not (= (bvand lt!158961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158952 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!158961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!158961 lt!158952) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106732 (= lt!158952 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106732 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106732 (= lt!158961 (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))))))

(declare-fun d!33598 () Bool)

(assert (=> d!33598 e!69852))

(declare-fun res!87916 () Bool)

(assert (=> d!33598 (=> (not res!87916) (not e!69852))))

(assert (=> d!33598 (= res!87916 (= (size!2235 (buf!2614 (_2!4641 lt!158308))) (size!2235 (buf!2614 (_2!4641 lt!158924)))))))

(assert (=> d!33598 (= lt!158924 e!69855)))

(declare-fun c!6588 () Bool)

(assert (=> d!33598 (= c!6588 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33598 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33598 (= (appendNLeastSignificantBitsLoop!0 (_2!4641 lt!158308) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!158924)))

(declare-fun lt!158920 () tuple2!8772)

(declare-fun lt!158935 () tuple2!8774)

(declare-fun b!106733 () Bool)

(assert (=> b!106733 (= e!69852 (and (= (_2!4644 lt!158935) v!199) (= (_1!4644 lt!158935) (_2!4643 lt!158920))))))

(declare-fun lt!158941 () (_ BitVec 64))

(assert (=> b!106733 (= lt!158935 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158920) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158941))))

(declare-fun lt!158922 () Unit!6524)

(declare-fun lt!158962 () Unit!6524)

(assert (=> b!106733 (= lt!158922 lt!158962)))

(declare-fun lt!158936 () (_ BitVec 64))

(assert (=> b!106733 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158924)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158936)))

(assert (=> b!106733 (= lt!158962 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4641 lt!158308) (buf!2614 (_2!4641 lt!158924)) lt!158936))))

(declare-fun e!69851 () Bool)

(assert (=> b!106733 e!69851))

(declare-fun res!87918 () Bool)

(assert (=> b!106733 (=> (not res!87918) (not e!69851))))

(assert (=> b!106733 (= res!87918 (and (= (size!2235 (buf!2614 (_2!4641 lt!158308))) (size!2235 (buf!2614 (_2!4641 lt!158924)))) (bvsge lt!158936 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!106733 (= lt!158936 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!106733 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106733 (= lt!158941 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!106733 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!106733 (= lt!158920 (reader!0 (_2!4641 lt!158308) (_2!4641 lt!158924)))))

(declare-fun b!106734 () Bool)

(assert (=> b!106734 (= e!69850 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!106735 () Bool)

(assert (=> b!106735 (= e!69851 (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158308)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308))) lt!158936))))

(declare-fun bm!1344 () Bool)

(assert (=> bm!1344 (= call!1347 (isPrefixOf!0 (ite c!6588 (_2!4641 lt!158308) lt!158939) (ite c!6588 (_2!4641 lt!158949) lt!158939)))))

(assert (= (and d!33598 c!6588) b!106725))

(assert (= (and d!33598 (not c!6588)) b!106730))

(assert (= (and b!106725 res!87915) b!106727))

(assert (= (and b!106727 res!87914) b!106726))

(assert (= (and b!106726 res!87920) b!106724))

(assert (= (and b!106724 res!87912) b!106723))

(assert (= (and b!106725 res!87917) b!106728))

(assert (= (and b!106725 c!6589) b!106734))

(assert (= (and b!106725 (not c!6589)) b!106729))

(assert (= (or b!106725 b!106730) bm!1344))

(assert (= (and d!33598 res!87916) b!106732))

(assert (= (and b!106732 res!87913) b!106731))

(assert (= (and b!106731 res!87919) b!106733))

(assert (= (and b!106733 res!87918) b!106735))

(declare-fun m!157317 () Bool)

(assert (=> b!106727 m!157317))

(assert (=> b!106727 m!156883))

(declare-fun m!157319 () Bool)

(assert (=> b!106733 m!157319))

(declare-fun m!157321 () Bool)

(assert (=> b!106733 m!157321))

(declare-fun m!157323 () Bool)

(assert (=> b!106733 m!157323))

(declare-fun m!157325 () Bool)

(assert (=> b!106733 m!157325))

(declare-fun m!157327 () Bool)

(assert (=> b!106733 m!157327))

(declare-fun m!157329 () Bool)

(assert (=> b!106725 m!157329))

(declare-fun m!157331 () Bool)

(assert (=> b!106725 m!157331))

(declare-fun m!157333 () Bool)

(assert (=> b!106725 m!157333))

(declare-fun m!157335 () Bool)

(assert (=> b!106725 m!157335))

(declare-fun m!157337 () Bool)

(assert (=> b!106725 m!157337))

(declare-fun m!157339 () Bool)

(assert (=> b!106725 m!157339))

(declare-fun m!157341 () Bool)

(assert (=> b!106725 m!157341))

(declare-fun m!157343 () Bool)

(assert (=> b!106725 m!157343))

(assert (=> b!106725 m!157321))

(declare-fun m!157345 () Bool)

(assert (=> b!106725 m!157345))

(declare-fun m!157347 () Bool)

(assert (=> b!106725 m!157347))

(declare-fun m!157349 () Bool)

(assert (=> b!106725 m!157349))

(declare-fun m!157351 () Bool)

(assert (=> b!106725 m!157351))

(declare-fun m!157353 () Bool)

(assert (=> b!106725 m!157353))

(declare-fun m!157355 () Bool)

(assert (=> b!106725 m!157355))

(assert (=> b!106725 m!156883))

(declare-fun m!157357 () Bool)

(assert (=> b!106725 m!157357))

(assert (=> b!106725 m!157337))

(declare-fun m!157359 () Bool)

(assert (=> b!106725 m!157359))

(declare-fun m!157361 () Bool)

(assert (=> b!106725 m!157361))

(declare-fun m!157363 () Bool)

(assert (=> b!106725 m!157363))

(declare-fun m!157365 () Bool)

(assert (=> b!106725 m!157365))

(declare-fun m!157367 () Bool)

(assert (=> b!106725 m!157367))

(declare-fun m!157369 () Bool)

(assert (=> b!106725 m!157369))

(declare-fun m!157371 () Bool)

(assert (=> b!106725 m!157371))

(declare-fun m!157373 () Bool)

(assert (=> b!106725 m!157373))

(declare-fun m!157375 () Bool)

(assert (=> b!106725 m!157375))

(declare-fun m!157377 () Bool)

(assert (=> b!106725 m!157377))

(declare-fun m!157379 () Bool)

(assert (=> b!106725 m!157379))

(declare-fun m!157381 () Bool)

(assert (=> b!106723 m!157381))

(assert (=> b!106723 m!157317))

(declare-fun m!157383 () Bool)

(assert (=> b!106731 m!157383))

(declare-fun m!157385 () Bool)

(assert (=> b!106726 m!157385))

(declare-fun m!157387 () Bool)

(assert (=> b!106732 m!157387))

(assert (=> b!106732 m!156883))

(declare-fun m!157389 () Bool)

(assert (=> bm!1344 m!157389))

(declare-fun m!157391 () Bool)

(assert (=> b!106735 m!157391))

(declare-fun m!157393 () Bool)

(assert (=> b!106724 m!157393))

(assert (=> b!106724 m!157393))

(declare-fun m!157395 () Bool)

(assert (=> b!106724 m!157395))

(declare-fun m!157397 () Bool)

(assert (=> b!106730 m!157397))

(assert (=> b!106518 d!33598))

(declare-fun d!33640 () Bool)

(declare-fun res!87921 () Bool)

(declare-fun e!69858 () Bool)

(assert (=> d!33640 (=> (not res!87921) (not e!69858))))

(assert (=> d!33640 (= res!87921 (= (size!2235 (buf!2614 thiss!1305)) (size!2235 (buf!2614 (_2!4641 lt!158305)))))))

(assert (=> d!33640 (= (isPrefixOf!0 thiss!1305 (_2!4641 lt!158305)) e!69858)))

(declare-fun b!106736 () Bool)

(declare-fun res!87922 () Bool)

(assert (=> b!106736 (=> (not res!87922) (not e!69858))))

(assert (=> b!106736 (= res!87922 (bvsle (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)) (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158305))) (currentByte!5126 (_2!4641 lt!158305)) (currentBit!5121 (_2!4641 lt!158305)))))))

(declare-fun b!106737 () Bool)

(declare-fun e!69857 () Bool)

(assert (=> b!106737 (= e!69858 e!69857)))

(declare-fun res!87923 () Bool)

(assert (=> b!106737 (=> res!87923 e!69857)))

(assert (=> b!106737 (= res!87923 (= (size!2235 (buf!2614 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!106738 () Bool)

(assert (=> b!106738 (= e!69857 (arrayBitRangesEq!0 (buf!2614 thiss!1305) (buf!2614 (_2!4641 lt!158305)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305))))))

(assert (= (and d!33640 res!87921) b!106736))

(assert (= (and b!106736 res!87922) b!106737))

(assert (= (and b!106737 (not res!87923)) b!106738))

(assert (=> b!106736 m!156885))

(assert (=> b!106736 m!156905))

(assert (=> b!106738 m!156885))

(assert (=> b!106738 m!156885))

(declare-fun m!157399 () Bool)

(assert (=> b!106738 m!157399))

(assert (=> b!106518 d!33640))

(declare-fun d!33642 () Bool)

(declare-fun e!69859 () Bool)

(assert (=> d!33642 e!69859))

(declare-fun res!87924 () Bool)

(assert (=> d!33642 (=> (not res!87924) (not e!69859))))

(declare-fun lt!158965 () (_ BitVec 64))

(declare-fun lt!158968 () (_ BitVec 64))

(declare-fun lt!158967 () (_ BitVec 64))

(assert (=> d!33642 (= res!87924 (= lt!158967 (bvsub lt!158968 lt!158965)))))

(assert (=> d!33642 (or (= (bvand lt!158968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158968 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158968 lt!158965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33642 (= lt!158965 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158322)))) ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158322))) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158322)))))))

(declare-fun lt!158966 () (_ BitVec 64))

(declare-fun lt!158963 () (_ BitVec 64))

(assert (=> d!33642 (= lt!158968 (bvmul lt!158966 lt!158963))))

(assert (=> d!33642 (or (= lt!158966 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158963 (bvsdiv (bvmul lt!158966 lt!158963) lt!158966)))))

(assert (=> d!33642 (= lt!158963 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33642 (= lt!158966 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158322)))))))

(assert (=> d!33642 (= lt!158967 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 (_1!4642 lt!158322))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 (_1!4642 lt!158322)))))))

(assert (=> d!33642 (invariant!0 (currentBit!5121 (_1!4642 lt!158322)) (currentByte!5126 (_1!4642 lt!158322)) (size!2235 (buf!2614 (_1!4642 lt!158322))))))

(assert (=> d!33642 (= (bitIndex!0 (size!2235 (buf!2614 (_1!4642 lt!158322))) (currentByte!5126 (_1!4642 lt!158322)) (currentBit!5121 (_1!4642 lt!158322))) lt!158967)))

(declare-fun b!106739 () Bool)

(declare-fun res!87925 () Bool)

(assert (=> b!106739 (=> (not res!87925) (not e!69859))))

(assert (=> b!106739 (= res!87925 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158967))))

(declare-fun b!106740 () Bool)

(declare-fun lt!158964 () (_ BitVec 64))

(assert (=> b!106740 (= e!69859 (bvsle lt!158967 (bvmul lt!158964 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106740 (or (= lt!158964 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158964 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158964)))))

(assert (=> b!106740 (= lt!158964 ((_ sign_extend 32) (size!2235 (buf!2614 (_1!4642 lt!158322)))))))

(assert (= (and d!33642 res!87924) b!106739))

(assert (= (and b!106739 res!87925) b!106740))

(declare-fun m!157401 () Bool)

(assert (=> d!33642 m!157401))

(declare-fun m!157403 () Bool)

(assert (=> d!33642 m!157403))

(assert (=> b!106516 d!33642))

(declare-fun d!33644 () Bool)

(assert (=> d!33644 (= (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158305)))) (and (bvsge (currentBit!5121 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5121 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5126 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158305)))) (and (= (currentBit!5121 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158305))))))))))

(assert (=> b!106515 d!33644))

(declare-fun d!33646 () Bool)

(assert (=> d!33646 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305)) lt!158328) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305))) lt!158328))))

(declare-fun bs!8213 () Bool)

(assert (= bs!8213 d!33646))

(declare-fun m!157405 () Bool)

(assert (=> bs!8213 m!157405))

(assert (=> b!106513 d!33646))

(declare-fun d!33648 () Bool)

(declare-fun e!69862 () Bool)

(assert (=> d!33648 e!69862))

(declare-fun res!87932 () Bool)

(assert (=> d!33648 (=> (not res!87932) (not e!69862))))

(declare-fun lt!158979 () (_ BitVec 64))

(declare-fun lt!158981 () (_ BitVec 64))

(declare-fun lt!158982 () (_ BitVec 64))

(assert (=> d!33648 (= res!87932 (= lt!158981 (bvsub lt!158982 lt!158979)))))

(assert (=> d!33648 (or (= (bvand lt!158982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158979 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158982 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158982 lt!158979) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33648 (= lt!158979 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158308)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308)))))))

(declare-fun lt!158980 () (_ BitVec 64))

(declare-fun lt!158977 () (_ BitVec 64))

(assert (=> d!33648 (= lt!158982 (bvmul lt!158980 lt!158977))))

(assert (=> d!33648 (or (= lt!158980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158977 (bvsdiv (bvmul lt!158980 lt!158977) lt!158980)))))

(assert (=> d!33648 (= lt!158977 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33648 (= lt!158980 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(assert (=> d!33648 (= lt!158981 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158308))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158308)))))))

(assert (=> d!33648 (invariant!0 (currentBit!5121 (_2!4641 lt!158308)) (currentByte!5126 (_2!4641 lt!158308)) (size!2235 (buf!2614 (_2!4641 lt!158308))))))

(assert (=> d!33648 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158981)))

(declare-fun b!106748 () Bool)

(declare-fun res!87933 () Bool)

(assert (=> b!106748 (=> (not res!87933) (not e!69862))))

(assert (=> b!106748 (= res!87933 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158981))))

(declare-fun b!106749 () Bool)

(declare-fun lt!158978 () (_ BitVec 64))

(assert (=> b!106749 (= e!69862 (bvsle lt!158981 (bvmul lt!158978 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106749 (or (= lt!158978 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158978 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158978)))))

(assert (=> b!106749 (= lt!158978 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(assert (= (and d!33648 res!87932) b!106748))

(assert (= (and b!106748 res!87933) b!106749))

(declare-fun m!157407 () Bool)

(assert (=> d!33648 m!157407))

(declare-fun m!157409 () Bool)

(assert (=> d!33648 m!157409))

(assert (=> b!106514 d!33648))

(declare-fun d!33650 () Bool)

(declare-fun e!69865 () Bool)

(assert (=> d!33650 e!69865))

(declare-fun res!87936 () Bool)

(assert (=> d!33650 (=> (not res!87936) (not e!69865))))

(declare-fun lt!158988 () (_ BitVec 64))

(declare-fun lt!158987 () (_ BitVec 64))

(declare-fun lt!158985 () (_ BitVec 64))

(assert (=> d!33650 (= res!87936 (= lt!158987 (bvsub lt!158988 lt!158985)))))

(assert (=> d!33650 (or (= (bvand lt!158988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!158985 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!158988 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158988 lt!158985) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33650 (= lt!158985 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))) ((_ sign_extend 32) (currentByte!5126 thiss!1305)) ((_ sign_extend 32) (currentBit!5121 thiss!1305))))))

(declare-fun lt!158986 () (_ BitVec 64))

(declare-fun lt!158983 () (_ BitVec 64))

(assert (=> d!33650 (= lt!158988 (bvmul lt!158986 lt!158983))))

(assert (=> d!33650 (or (= lt!158986 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!158983 (bvsdiv (bvmul lt!158986 lt!158983) lt!158986)))))

(assert (=> d!33650 (= lt!158983 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33650 (= lt!158986 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))))))

(assert (=> d!33650 (= lt!158987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 thiss!1305))))))

(assert (=> d!33650 (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 thiss!1305)))))

(assert (=> d!33650 (= (bitIndex!0 (size!2235 (buf!2614 thiss!1305)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)) lt!158987)))

(declare-fun b!106752 () Bool)

(declare-fun res!87937 () Bool)

(assert (=> b!106752 (=> (not res!87937) (not e!69865))))

(assert (=> b!106752 (= res!87937 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!158987))))

(declare-fun b!106753 () Bool)

(declare-fun lt!158984 () (_ BitVec 64))

(assert (=> b!106753 (= e!69865 (bvsle lt!158987 (bvmul lt!158984 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106753 (or (= lt!158984 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!158984 #b0000000000000000000000000000000000000000000000000000000000001000) lt!158984)))))

(assert (=> b!106753 (= lt!158984 ((_ sign_extend 32) (size!2235 (buf!2614 thiss!1305))))))

(assert (= (and d!33650 res!87936) b!106752))

(assert (= (and b!106752 res!87937) b!106753))

(assert (=> d!33650 m!157405))

(assert (=> d!33650 m!156997))

(assert (=> b!106514 d!33650))

(declare-fun d!33652 () Bool)

(assert (=> d!33652 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!106512 d!33652))

(declare-fun d!33654 () Bool)

(declare-fun lt!158989 () tuple2!8782)

(assert (=> d!33654 (= lt!158989 (readBit!0 (readerFrom!0 (_2!4641 lt!158308) (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305))))))

(assert (=> d!33654 (= (readBitPure!0 (readerFrom!0 (_2!4641 lt!158308) (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305))) (tuple2!8771 (_2!4648 lt!158989) (_1!4648 lt!158989)))))

(declare-fun bs!8214 () Bool)

(assert (= bs!8214 d!33654))

(assert (=> bs!8214 m!156897))

(declare-fun m!157411 () Bool)

(assert (=> bs!8214 m!157411))

(assert (=> b!106523 d!33654))

(declare-fun d!33656 () Bool)

(declare-fun e!69870 () Bool)

(assert (=> d!33656 e!69870))

(declare-fun res!87945 () Bool)

(assert (=> d!33656 (=> (not res!87945) (not e!69870))))

(assert (=> d!33656 (= res!87945 (invariant!0 (currentBit!5121 (_2!4641 lt!158308)) (currentByte!5126 (_2!4641 lt!158308)) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(assert (=> d!33656 (= (readerFrom!0 (_2!4641 lt!158308) (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305)) (BitStream!3945 (buf!2614 (_2!4641 lt!158308)) (currentByte!5126 thiss!1305) (currentBit!5121 thiss!1305)))))

(declare-fun b!106760 () Bool)

(assert (=> b!106760 (= e!69870 (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158308)))))))

(assert (= (and d!33656 res!87945) b!106760))

(assert (=> d!33656 m!157409))

(assert (=> b!106760 m!156889))

(assert (=> b!106523 d!33656))

(declare-fun d!33660 () Bool)

(assert (=> d!33660 (= (invariant!0 (currentBit!5121 thiss!1305) (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158308)))) (and (bvsge (currentBit!5121 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5121 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5126 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158308)))) (and (= (currentBit!5121 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5126 thiss!1305) (size!2235 (buf!2614 (_2!4641 lt!158308))))))))))

(assert (=> b!106521 d!33660))

(declare-fun d!33662 () Bool)

(assert (=> d!33662 (= (array_inv!2037 (buf!2614 thiss!1305)) (bvsge (size!2235 (buf!2614 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!106511 d!33662))

(declare-fun d!33666 () Bool)

(declare-fun e!69874 () Bool)

(assert (=> d!33666 e!69874))

(declare-fun res!87950 () Bool)

(assert (=> d!33666 (=> (not res!87950) (not e!69874))))

(declare-fun lt!159008 () (_ BitVec 64))

(declare-fun lt!159007 () BitStream!3944)

(assert (=> d!33666 (= res!87950 (= (bvadd lt!159008 (bvsub lt!158303 lt!158306)) (bitIndex!0 (size!2235 (buf!2614 lt!159007)) (currentByte!5126 lt!159007) (currentBit!5121 lt!159007))))))

(assert (=> d!33666 (or (not (= (bvand lt!159008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!158303 lt!158306) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159008 (bvsub lt!158303 lt!158306)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33666 (= lt!159008 (bitIndex!0 (size!2235 (buf!2614 (_2!4643 lt!158321))) (currentByte!5126 (_2!4643 lt!158321)) (currentBit!5121 (_2!4643 lt!158321))))))

(declare-fun moveBitIndex!0 (BitStream!3944 (_ BitVec 64)) tuple2!8768)

(assert (=> d!33666 (= lt!159007 (_2!4641 (moveBitIndex!0 (_2!4643 lt!158321) (bvsub lt!158303 lt!158306))))))

(assert (=> d!33666 (moveBitIndexPrecond!0 (_2!4643 lt!158321) (bvsub lt!158303 lt!158306))))

(assert (=> d!33666 (= (withMovedBitIndex!0 (_2!4643 lt!158321) (bvsub lt!158303 lt!158306)) lt!159007)))

(declare-fun b!106765 () Bool)

(assert (=> b!106765 (= e!69874 (= (size!2235 (buf!2614 (_2!4643 lt!158321))) (size!2235 (buf!2614 lt!159007))))))

(assert (= (and d!33666 res!87950) b!106765))

(declare-fun m!157433 () Bool)

(assert (=> d!33666 m!157433))

(declare-fun m!157435 () Bool)

(assert (=> d!33666 m!157435))

(declare-fun m!157437 () Bool)

(assert (=> d!33666 m!157437))

(declare-fun m!157439 () Bool)

(assert (=> d!33666 m!157439))

(assert (=> b!106522 d!33666))

(assert (=> b!106522 d!33648))

(declare-fun d!33670 () Bool)

(declare-fun e!69875 () Bool)

(assert (=> d!33670 e!69875))

(declare-fun res!87951 () Bool)

(assert (=> d!33670 (=> (not res!87951) (not e!69875))))

(declare-fun lt!159011 () (_ BitVec 64))

(declare-fun lt!159014 () (_ BitVec 64))

(declare-fun lt!159013 () (_ BitVec 64))

(assert (=> d!33670 (= res!87951 (= lt!159013 (bvsub lt!159014 lt!159011)))))

(assert (=> d!33670 (or (= (bvand lt!159014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!159011 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!159014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!159014 lt!159011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33670 (= lt!159011 (remainingBits!0 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))) ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158305))) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158305)))))))

(declare-fun lt!159012 () (_ BitVec 64))

(declare-fun lt!159009 () (_ BitVec 64))

(assert (=> d!33670 (= lt!159014 (bvmul lt!159012 lt!159009))))

(assert (=> d!33670 (or (= lt!159012 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!159009 (bvsdiv (bvmul lt!159012 lt!159009) lt!159012)))))

(assert (=> d!33670 (= lt!159009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33670 (= lt!159012 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))))))

(assert (=> d!33670 (= lt!159013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5126 (_2!4641 lt!158305))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5121 (_2!4641 lt!158305)))))))

(assert (=> d!33670 (invariant!0 (currentBit!5121 (_2!4641 lt!158305)) (currentByte!5126 (_2!4641 lt!158305)) (size!2235 (buf!2614 (_2!4641 lt!158305))))))

(assert (=> d!33670 (= (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158305))) (currentByte!5126 (_2!4641 lt!158305)) (currentBit!5121 (_2!4641 lt!158305))) lt!159013)))

(declare-fun b!106766 () Bool)

(declare-fun res!87952 () Bool)

(assert (=> b!106766 (=> (not res!87952) (not e!69875))))

(assert (=> b!106766 (= res!87952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159013))))

(declare-fun b!106767 () Bool)

(declare-fun lt!159010 () (_ BitVec 64))

(assert (=> b!106767 (= e!69875 (bvsle lt!159013 (bvmul lt!159010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!106767 (or (= lt!159010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!159010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!159010)))))

(assert (=> b!106767 (= lt!159010 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4641 lt!158305)))))))

(assert (= (and d!33670 res!87951) b!106766))

(assert (= (and b!106766 res!87952) b!106767))

(declare-fun m!157441 () Bool)

(assert (=> d!33670 m!157441))

(declare-fun m!157443 () Bool)

(assert (=> d!33670 m!157443))

(assert (=> b!106522 d!33670))

(assert (=> b!106522 d!33650))

(declare-fun d!33672 () Bool)

(declare-fun e!69876 () Bool)

(assert (=> d!33672 e!69876))

(declare-fun res!87953 () Bool)

(assert (=> d!33672 (=> (not res!87953) (not e!69876))))

(declare-fun lt!159016 () (_ BitVec 64))

(declare-fun lt!159015 () BitStream!3944)

(assert (=> d!33672 (= res!87953 (= (bvadd lt!159016 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2235 (buf!2614 lt!159015)) (currentByte!5126 lt!159015) (currentBit!5121 lt!159015))))))

(assert (=> d!33672 (or (not (= (bvand lt!159016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!159016 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!159016 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33672 (= lt!159016 (bitIndex!0 (size!2235 (buf!2614 (_1!4643 lt!158321))) (currentByte!5126 (_1!4643 lt!158321)) (currentBit!5121 (_1!4643 lt!158321))))))

(assert (=> d!33672 (= lt!159015 (_2!4641 (moveBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33672 (moveBitIndexPrecond!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33672 (= (withMovedBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001) lt!159015)))

(declare-fun b!106768 () Bool)

(assert (=> b!106768 (= e!69876 (= (size!2235 (buf!2614 (_1!4643 lt!158321))) (size!2235 (buf!2614 lt!159015))))))

(assert (= (and d!33672 res!87953) b!106768))

(declare-fun m!157445 () Bool)

(assert (=> d!33672 m!157445))

(declare-fun m!157447 () Bool)

(assert (=> d!33672 m!157447))

(declare-fun m!157449 () Bool)

(assert (=> d!33672 m!157449))

(declare-fun m!157451 () Bool)

(assert (=> d!33672 m!157451))

(assert (=> b!106522 d!33672))

(declare-fun d!33674 () Bool)

(declare-fun lt!159030 () tuple2!8774)

(declare-fun lt!159033 () tuple2!8774)

(assert (=> d!33674 (and (= (_2!4644 lt!159030) (_2!4644 lt!159033)) (= (_1!4644 lt!159030) (_1!4644 lt!159033)))))

(declare-fun lt!159032 () BitStream!3944)

(declare-fun lt!159031 () Unit!6524)

(declare-fun lt!159034 () Bool)

(declare-fun lt!159029 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!3944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8774 tuple2!8774 BitStream!3944 (_ BitVec 64) Bool BitStream!3944 (_ BitVec 64) tuple2!8774 tuple2!8774 BitStream!3944 (_ BitVec 64)) Unit!6524)

(assert (=> d!33674 (= lt!159031 (choose!45 (_1!4643 lt!158321) nBits!396 i!615 lt!158324 lt!159030 (tuple2!8775 (_1!4644 lt!159030) (_2!4644 lt!159030)) (_1!4644 lt!159030) (_2!4644 lt!159030) lt!159034 lt!159032 lt!159029 lt!159033 (tuple2!8775 (_1!4644 lt!159033) (_2!4644 lt!159033)) (_1!4644 lt!159033) (_2!4644 lt!159033)))))

(assert (=> d!33674 (= lt!159033 (readNLeastSignificantBitsLoopPure!0 lt!159032 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!159029))))

(assert (=> d!33674 (= lt!159029 (bvor lt!158324 (ite lt!159034 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33674 (= lt!159032 (withMovedBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33674 (= lt!159034 (_2!4642 (readBitPure!0 (_1!4643 lt!158321))))))

(assert (=> d!33674 (= lt!159030 (readNLeastSignificantBitsLoopPure!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324))))

(assert (=> d!33674 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4643 lt!158321) nBits!396 i!615 lt!158324) lt!159031)))

(declare-fun bs!8217 () Bool)

(assert (= bs!8217 d!33674))

(declare-fun m!157453 () Bool)

(assert (=> bs!8217 m!157453))

(declare-fun m!157455 () Bool)

(assert (=> bs!8217 m!157455))

(assert (=> bs!8217 m!156901))

(assert (=> bs!8217 m!156915))

(assert (=> bs!8217 m!156927))

(assert (=> b!106522 d!33674))

(declare-fun d!33676 () Bool)

(declare-fun res!87956 () Bool)

(declare-fun e!69879 () Bool)

(assert (=> d!33676 (=> (not res!87956) (not e!69879))))

(assert (=> d!33676 (= res!87956 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4643 lt!158317))))) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158306)) (bvsle (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158306) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4643 lt!158317))))))))))

(assert (=> d!33676 (= (moveBitIndexPrecond!0 (_2!4643 lt!158317) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158306)) e!69879)))

(declare-fun b!106772 () Bool)

(declare-fun lt!159037 () (_ BitVec 64))

(assert (=> b!106772 (= e!69879 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!159037) (bvsle lt!159037 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2235 (buf!2614 (_2!4643 lt!158317))))))))))

(assert (=> b!106772 (= lt!159037 (bvadd (bitIndex!0 (size!2235 (buf!2614 (_2!4643 lt!158317))) (currentByte!5126 (_2!4643 lt!158317)) (currentBit!5121 (_2!4643 lt!158317))) (bvsub (bitIndex!0 (size!2235 (buf!2614 (_2!4641 lt!158308))) (currentByte!5126 (_2!4641 lt!158308)) (currentBit!5121 (_2!4641 lt!158308))) lt!158306)))))

(assert (= (and d!33676 res!87956) b!106772))

(declare-fun m!157457 () Bool)

(assert (=> b!106772 m!157457))

(assert (=> b!106522 d!33676))

(declare-fun d!33678 () Bool)

(declare-fun lt!159038 () tuple2!8780)

(assert (=> d!33678 (= lt!159038 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315))))

(assert (=> d!33678 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4643 lt!158321) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!158315) (tuple2!8775 (_2!4647 lt!159038) (_1!4647 lt!159038)))))

(declare-fun bs!8218 () Bool)

(assert (= bs!8218 d!33678))

(assert (=> bs!8218 m!156901))

(declare-fun m!157459 () Bool)

(assert (=> bs!8218 m!157459))

(assert (=> b!106522 d!33678))

(push 1)

(assert (not d!33578))

(assert (not d!33648))

(assert (not b!106738))

(assert (not d!33540))

(assert (not d!33588))

(assert (not d!33654))

(assert (not d!33674))

(assert (not b!106601))

(assert (not b!106567))

(assert (not d!33642))

(assert (not d!33592))

(assert (not d!33580))

(assert (not d!33572))

(assert (not d!33666))

(assert (not b!106569))

(assert (not b!106731))

(assert (not b!106735))

(assert (not d!33574))

(assert (not b!106615))

(assert (not b!106614))

(assert (not d!33594))

(assert (not b!106626))

(assert (not b!106730))

(assert (not b!106598))

(assert (not b!106624))

(assert (not b!106732))

(assert (not d!33672))

(assert (not b!106625))

(assert (not d!33586))

(assert (not b!106727))

(assert (not d!33646))

(assert (not b!106617))

(assert (not d!33582))

(assert (not b!106726))

(assert (not d!33670))

(assert (not b!106725))

(assert (not d!33576))

(assert (not d!33584))

(assert (not d!33650))

(assert (not b!106724))

(assert (not d!33570))

(assert (not bm!1344))

(assert (not d!33656))

(assert (not b!106772))

(assert (not b!106723))

(assert (not d!33546))

(assert (not d!33596))

(assert (not b!106597))

(assert (not b!106616))

(assert (not d!33590))

(assert (not b!106628))

(assert (not b!106736))

(assert (not d!33678))

(assert (not b!106760))

(assert (not b!106733))

(assert (not d!33548))

(assert (not b!106599))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

