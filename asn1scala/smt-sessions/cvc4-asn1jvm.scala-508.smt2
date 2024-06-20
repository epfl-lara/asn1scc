; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14910 () Bool)

(assert start!14910)

(declare-fun b!76609 () Bool)

(declare-fun e!50290 () Bool)

(declare-datatypes ((array!3186 0))(
  ( (array!3187 (arr!2084 (Array (_ BitVec 32) (_ BitVec 8))) (size!1483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2540 0))(
  ( (BitStream!2541 (buf!1867 array!3186) (currentByte!3666 (_ BitVec 32)) (currentBit!3661 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!6668 0))(
  ( (tuple2!6669 (_1!3468 BitStream!2540) (_2!3468 Bool)) )
))
(declare-fun lt!122623 () tuple2!6668)

(declare-datatypes ((tuple2!6670 0))(
  ( (tuple2!6671 (_1!3469 BitStream!2540) (_2!3469 BitStream!2540)) )
))
(declare-fun lt!122625 () tuple2!6670)

(assert (=> b!76609 (= e!50290 (not (or (not (_2!3468 lt!122623)) (not (= (_1!3468 lt!122623) (_2!3469 lt!122625))))))))

(declare-fun nBits!322 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!2540 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6668)

(assert (=> b!76609 (= lt!122623 (checkBitsLoopPure!0 (_1!3469 lt!122625) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!5051 0))(
  ( (Unit!5052) )
))
(declare-datatypes ((tuple2!6672 0))(
  ( (tuple2!6673 (_1!3470 Unit!5051) (_2!3470 BitStream!2540)) )
))
(declare-fun lt!122624 () tuple2!6672)

(declare-fun thiss!1090 () BitStream!2540)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76609 (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322)))

(declare-fun lt!122622 () Unit!5051)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2540 array!3186 (_ BitVec 64)) Unit!5051)

(assert (=> b!76609 (= lt!122622 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1867 (_2!3470 lt!122624)) nBits!322))))

(declare-fun reader!0 (BitStream!2540 BitStream!2540) tuple2!6670)

(assert (=> b!76609 (= lt!122625 (reader!0 thiss!1090 (_2!3470 lt!122624)))))

(declare-fun b!76610 () Bool)

(declare-fun e!50292 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76610 (= e!50292 (not (invariant!0 (currentBit!3661 (_2!3470 lt!122624)) (currentByte!3666 (_2!3470 lt!122624)) (size!1483 (buf!1867 (_2!3470 lt!122624))))))))

(assert (=> b!76610 e!50290))

(declare-fun res!63288 () Bool)

(assert (=> b!76610 (=> (not res!63288) (not e!50290))))

(assert (=> b!76610 (= res!63288 (= (size!1483 (buf!1867 thiss!1090)) (size!1483 (buf!1867 (_2!3470 lt!122624)))))))

(declare-fun appendNBits!0 (BitStream!2540 (_ BitVec 64) Bool) tuple2!6672)

(assert (=> b!76610 (= lt!122624 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!76611 () Bool)

(declare-fun res!63289 () Bool)

(assert (=> b!76611 (=> (not res!63289) (not e!50290))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76611 (= res!63289 (= (bitIndex!0 (size!1483 (buf!1867 (_2!3470 lt!122624))) (currentByte!3666 (_2!3470 lt!122624)) (currentBit!3661 (_2!3470 lt!122624))) (bvadd (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)) nBits!322)))))

(declare-fun b!76613 () Bool)

(declare-fun res!63292 () Bool)

(assert (=> b!76613 (=> (not res!63292) (not e!50290))))

(declare-fun isPrefixOf!0 (BitStream!2540 BitStream!2540) Bool)

(assert (=> b!76613 (= res!63292 (isPrefixOf!0 thiss!1090 (_2!3470 lt!122624)))))

(declare-fun b!76614 () Bool)

(declare-fun res!63290 () Bool)

(assert (=> b!76614 (=> (not res!63290) (not e!50292))))

(assert (=> b!76614 (= res!63290 (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322))))

(declare-fun b!76612 () Bool)

(declare-fun e!50291 () Bool)

(declare-fun array_inv!1329 (array!3186) Bool)

(assert (=> b!76612 (= e!50291 (array_inv!1329 (buf!1867 thiss!1090)))))

(declare-fun res!63291 () Bool)

(assert (=> start!14910 (=> (not res!63291) (not e!50292))))

(assert (=> start!14910 (= res!63291 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!14910 e!50292))

(assert (=> start!14910 true))

(declare-fun inv!12 (BitStream!2540) Bool)

(assert (=> start!14910 (and (inv!12 thiss!1090) e!50291)))

(assert (= (and start!14910 res!63291) b!76614))

(assert (= (and b!76614 res!63290) b!76610))

(assert (= (and b!76610 res!63288) b!76611))

(assert (= (and b!76611 res!63289) b!76613))

(assert (= (and b!76613 res!63292) b!76609))

(assert (= start!14910 b!76612))

(declare-fun m!121859 () Bool)

(assert (=> start!14910 m!121859))

(declare-fun m!121861 () Bool)

(assert (=> b!76609 m!121861))

(declare-fun m!121863 () Bool)

(assert (=> b!76609 m!121863))

(declare-fun m!121865 () Bool)

(assert (=> b!76609 m!121865))

(declare-fun m!121867 () Bool)

(assert (=> b!76609 m!121867))

(declare-fun m!121869 () Bool)

(assert (=> b!76613 m!121869))

(declare-fun m!121871 () Bool)

(assert (=> b!76612 m!121871))

(declare-fun m!121873 () Bool)

(assert (=> b!76610 m!121873))

(declare-fun m!121875 () Bool)

(assert (=> b!76610 m!121875))

(declare-fun m!121877 () Bool)

(assert (=> b!76611 m!121877))

(declare-fun m!121879 () Bool)

(assert (=> b!76611 m!121879))

(declare-fun m!121881 () Bool)

(assert (=> b!76614 m!121881))

(push 1)

(assert (not b!76609))

(assert (not start!14910))

(assert (not b!76614))

(assert (not b!76612))

(assert (not b!76610))

(assert (not b!76611))

(assert (not b!76613))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24224 () Bool)

(assert (=> d!24224 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3661 thiss!1090) (currentByte!3666 thiss!1090) (size!1483 (buf!1867 thiss!1090))))))

(declare-fun bs!5849 () Bool)

(assert (= bs!5849 d!24224))

(declare-fun m!121885 () Bool)

(assert (=> bs!5849 m!121885))

(assert (=> start!14910 d!24224))

(declare-fun d!24228 () Bool)

(assert (=> d!24228 (= (invariant!0 (currentBit!3661 (_2!3470 lt!122624)) (currentByte!3666 (_2!3470 lt!122624)) (size!1483 (buf!1867 (_2!3470 lt!122624)))) (and (bvsge (currentBit!3661 (_2!3470 lt!122624)) #b00000000000000000000000000000000) (bvslt (currentBit!3661 (_2!3470 lt!122624)) #b00000000000000000000000000001000) (bvsge (currentByte!3666 (_2!3470 lt!122624)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3666 (_2!3470 lt!122624)) (size!1483 (buf!1867 (_2!3470 lt!122624)))) (and (= (currentBit!3661 (_2!3470 lt!122624)) #b00000000000000000000000000000000) (= (currentByte!3666 (_2!3470 lt!122624)) (size!1483 (buf!1867 (_2!3470 lt!122624))))))))))

(assert (=> b!76610 d!24228))

(declare-fun d!24234 () Bool)

(declare-fun e!50301 () Bool)

(assert (=> d!24234 e!50301))

(declare-fun res!63309 () Bool)

(assert (=> d!24234 (=> (not res!63309) (not e!50301))))

(declare-fun lt!122669 () tuple2!6672)

(assert (=> d!24234 (= res!63309 (= (size!1483 (buf!1867 thiss!1090)) (size!1483 (buf!1867 (_2!3470 lt!122669)))))))

(declare-fun choose!36 (BitStream!2540 (_ BitVec 64) Bool) tuple2!6672)

(assert (=> d!24234 (= lt!122669 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24234 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24234 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!122669)))

(declare-fun b!76631 () Bool)

(declare-fun res!63310 () Bool)

(assert (=> b!76631 (=> (not res!63310) (not e!50301))))

(declare-fun lt!122671 () (_ BitVec 64))

(assert (=> b!76631 (= res!63310 (= (bitIndex!0 (size!1483 (buf!1867 (_2!3470 lt!122669))) (currentByte!3666 (_2!3470 lt!122669)) (currentBit!3661 (_2!3470 lt!122669))) (bvadd lt!122671 nBits!322)))))

(assert (=> b!76631 (or (not (= (bvand lt!122671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!122671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!122671 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76631 (= lt!122671 (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)))))

(declare-fun b!76634 () Bool)

(declare-fun e!50302 () Bool)

(assert (=> b!76634 (= e!50302 (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322))))

(declare-fun b!76633 () Bool)

(declare-fun lt!122673 () tuple2!6668)

(declare-fun lt!122672 () tuple2!6670)

(assert (=> b!76633 (= e!50301 (and (_2!3468 lt!122673) (= (_1!3468 lt!122673) (_2!3469 lt!122672))))))

(assert (=> b!76633 (= lt!122673 (checkBitsLoopPure!0 (_1!3469 lt!122672) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!122668 () Unit!5051)

(declare-fun lt!122670 () Unit!5051)

(assert (=> b!76633 (= lt!122668 lt!122670)))

(assert (=> b!76633 (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122669)))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322)))

(assert (=> b!76633 (= lt!122670 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1867 (_2!3470 lt!122669)) nBits!322))))

(assert (=> b!76633 e!50302))

(declare-fun res!63311 () Bool)

(assert (=> b!76633 (=> (not res!63311) (not e!50302))))

(assert (=> b!76633 (= res!63311 (and (= (size!1483 (buf!1867 thiss!1090)) (size!1483 (buf!1867 (_2!3470 lt!122669)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76633 (= lt!122672 (reader!0 thiss!1090 (_2!3470 lt!122669)))))

(declare-fun b!76632 () Bool)

(declare-fun res!63312 () Bool)

(assert (=> b!76632 (=> (not res!63312) (not e!50301))))

(assert (=> b!76632 (= res!63312 (isPrefixOf!0 thiss!1090 (_2!3470 lt!122669)))))

(assert (= (and d!24234 res!63309) b!76631))

(assert (= (and b!76631 res!63310) b!76632))

(assert (= (and b!76632 res!63312) b!76633))

(assert (= (and b!76633 res!63311) b!76634))

(assert (=> b!76634 m!121881))

(declare-fun m!121897 () Bool)

(assert (=> d!24234 m!121897))

(declare-fun m!121899 () Bool)

(assert (=> b!76632 m!121899))

(declare-fun m!121901 () Bool)

(assert (=> b!76631 m!121901))

(assert (=> b!76631 m!121879))

(declare-fun m!121903 () Bool)

(assert (=> b!76633 m!121903))

(declare-fun m!121905 () Bool)

(assert (=> b!76633 m!121905))

(declare-fun m!121907 () Bool)

(assert (=> b!76633 m!121907))

(declare-fun m!121909 () Bool)

(assert (=> b!76633 m!121909))

(assert (=> b!76610 d!24234))

(declare-fun d!24246 () Bool)

(declare-datatypes ((tuple2!6674 0))(
  ( (tuple2!6675 (_1!3471 Bool) (_2!3471 BitStream!2540)) )
))
(declare-fun lt!122676 () tuple2!6674)

(declare-fun checkBitsLoop!0 (BitStream!2540 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6674)

(assert (=> d!24246 (= lt!122676 (checkBitsLoop!0 (_1!3469 lt!122625) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24246 (= (checkBitsLoopPure!0 (_1!3469 lt!122625) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6669 (_2!3471 lt!122676) (_1!3471 lt!122676)))))

(declare-fun bs!5854 () Bool)

(assert (= bs!5854 d!24246))

(declare-fun m!121911 () Bool)

(assert (=> bs!5854 m!121911))

(assert (=> b!76609 d!24246))

(declare-fun d!24248 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24248 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090))) nBits!322))))

(declare-fun bs!5855 () Bool)

(assert (= bs!5855 d!24248))

(declare-fun m!121913 () Bool)

(assert (=> bs!5855 m!121913))

(assert (=> b!76609 d!24248))

(declare-fun d!24250 () Bool)

(assert (=> d!24250 (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322)))

(declare-fun lt!122679 () Unit!5051)

(declare-fun choose!9 (BitStream!2540 array!3186 (_ BitVec 64) BitStream!2540) Unit!5051)

(assert (=> d!24250 (= lt!122679 (choose!9 thiss!1090 (buf!1867 (_2!3470 lt!122624)) nBits!322 (BitStream!2541 (buf!1867 (_2!3470 lt!122624)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090))))))

(assert (=> d!24250 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1867 (_2!3470 lt!122624)) nBits!322) lt!122679)))

(declare-fun bs!5856 () Bool)

(assert (= bs!5856 d!24250))

(assert (=> bs!5856 m!121863))

(declare-fun m!121915 () Bool)

(assert (=> bs!5856 m!121915))

(assert (=> b!76609 d!24250))

(declare-fun d!24252 () Bool)

(declare-fun e!50321 () Bool)

(assert (=> d!24252 e!50321))

(declare-fun res!63345 () Bool)

(assert (=> d!24252 (=> (not res!63345) (not e!50321))))

(declare-fun lt!122829 () tuple2!6670)

(assert (=> d!24252 (= res!63345 (isPrefixOf!0 (_1!3469 lt!122829) (_2!3469 lt!122829)))))

(declare-fun lt!122828 () BitStream!2540)

(assert (=> d!24252 (= lt!122829 (tuple2!6671 lt!122828 (_2!3470 lt!122624)))))

(declare-fun lt!122816 () Unit!5051)

(declare-fun lt!122821 () Unit!5051)

(assert (=> d!24252 (= lt!122816 lt!122821)))

(assert (=> d!24252 (isPrefixOf!0 lt!122828 (_2!3470 lt!122624))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2540 BitStream!2540 BitStream!2540) Unit!5051)

(assert (=> d!24252 (= lt!122821 (lemmaIsPrefixTransitive!0 lt!122828 (_2!3470 lt!122624) (_2!3470 lt!122624)))))

(declare-fun lt!122819 () Unit!5051)

(declare-fun lt!122820 () Unit!5051)

(assert (=> d!24252 (= lt!122819 lt!122820)))

(assert (=> d!24252 (isPrefixOf!0 lt!122828 (_2!3470 lt!122624))))

(assert (=> d!24252 (= lt!122820 (lemmaIsPrefixTransitive!0 lt!122828 thiss!1090 (_2!3470 lt!122624)))))

(declare-fun lt!122827 () Unit!5051)

(declare-fun e!50322 () Unit!5051)

(assert (=> d!24252 (= lt!122827 e!50322)))

(declare-fun c!5582 () Bool)

(assert (=> d!24252 (= c!5582 (not (= (size!1483 (buf!1867 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!122832 () Unit!5051)

(declare-fun lt!122825 () Unit!5051)

(assert (=> d!24252 (= lt!122832 lt!122825)))

(assert (=> d!24252 (isPrefixOf!0 (_2!3470 lt!122624) (_2!3470 lt!122624))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2540) Unit!5051)

(assert (=> d!24252 (= lt!122825 (lemmaIsPrefixRefl!0 (_2!3470 lt!122624)))))

(declare-fun lt!122823 () Unit!5051)

(declare-fun lt!122818 () Unit!5051)

(assert (=> d!24252 (= lt!122823 lt!122818)))

(assert (=> d!24252 (= lt!122818 (lemmaIsPrefixRefl!0 (_2!3470 lt!122624)))))

(declare-fun lt!122830 () Unit!5051)

(declare-fun lt!122826 () Unit!5051)

(assert (=> d!24252 (= lt!122830 lt!122826)))

(assert (=> d!24252 (isPrefixOf!0 lt!122828 lt!122828)))

(assert (=> d!24252 (= lt!122826 (lemmaIsPrefixRefl!0 lt!122828))))

(declare-fun lt!122833 () Unit!5051)

(declare-fun lt!122817 () Unit!5051)

(assert (=> d!24252 (= lt!122833 lt!122817)))

(assert (=> d!24252 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24252 (= lt!122817 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24252 (= lt!122828 (BitStream!2541 (buf!1867 (_2!3470 lt!122624)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)))))

(assert (=> d!24252 (isPrefixOf!0 thiss!1090 (_2!3470 lt!122624))))

(assert (=> d!24252 (= (reader!0 thiss!1090 (_2!3470 lt!122624)) lt!122829)))

(declare-fun lt!122835 () (_ BitVec 64))

(declare-fun lt!122831 () (_ BitVec 64))

(declare-fun b!76676 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2540 (_ BitVec 64)) BitStream!2540)

(assert (=> b!76676 (= e!50321 (= (_1!3469 lt!122829) (withMovedBitIndex!0 (_2!3469 lt!122829) (bvsub lt!122835 lt!122831))))))

(assert (=> b!76676 (or (= (bvand lt!122835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122831 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122835 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122835 lt!122831) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!76676 (= lt!122831 (bitIndex!0 (size!1483 (buf!1867 (_2!3470 lt!122624))) (currentByte!3666 (_2!3470 lt!122624)) (currentBit!3661 (_2!3470 lt!122624))))))

(assert (=> b!76676 (= lt!122835 (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)))))

(declare-fun b!76677 () Bool)

(declare-fun res!63346 () Bool)

(assert (=> b!76677 (=> (not res!63346) (not e!50321))))

(assert (=> b!76677 (= res!63346 (isPrefixOf!0 (_1!3469 lt!122829) thiss!1090))))

(declare-fun b!76678 () Bool)

(declare-fun lt!122834 () Unit!5051)

(assert (=> b!76678 (= e!50322 lt!122834)))

(declare-fun lt!122822 () (_ BitVec 64))

(assert (=> b!76678 (= lt!122822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122824 () (_ BitVec 64))

(assert (=> b!76678 (= lt!122824 (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3186 array!3186 (_ BitVec 64) (_ BitVec 64)) Unit!5051)

(assert (=> b!76678 (= lt!122834 (arrayBitRangesEqSymmetric!0 (buf!1867 thiss!1090) (buf!1867 (_2!3470 lt!122624)) lt!122822 lt!122824))))

(declare-fun arrayBitRangesEq!0 (array!3186 array!3186 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76678 (arrayBitRangesEq!0 (buf!1867 (_2!3470 lt!122624)) (buf!1867 thiss!1090) lt!122822 lt!122824)))

(declare-fun b!76679 () Bool)

(declare-fun res!63344 () Bool)

(assert (=> b!76679 (=> (not res!63344) (not e!50321))))

(assert (=> b!76679 (= res!63344 (isPrefixOf!0 (_2!3469 lt!122829) (_2!3470 lt!122624)))))

(declare-fun b!76680 () Bool)

(declare-fun Unit!5053 () Unit!5051)

(assert (=> b!76680 (= e!50322 Unit!5053)))

(assert (= (and d!24252 c!5582) b!76678))

(assert (= (and d!24252 (not c!5582)) b!76680))

(assert (= (and d!24252 res!63345) b!76677))

(assert (= (and b!76677 res!63346) b!76679))

(assert (= (and b!76679 res!63344) b!76676))

(declare-fun m!121953 () Bool)

(assert (=> b!76676 m!121953))

(assert (=> b!76676 m!121877))

(assert (=> b!76676 m!121879))

(declare-fun m!121955 () Bool)

(assert (=> d!24252 m!121955))

(declare-fun m!121957 () Bool)

(assert (=> d!24252 m!121957))

(declare-fun m!121959 () Bool)

(assert (=> d!24252 m!121959))

(declare-fun m!121961 () Bool)

(assert (=> d!24252 m!121961))

(declare-fun m!121963 () Bool)

(assert (=> d!24252 m!121963))

(declare-fun m!121965 () Bool)

(assert (=> d!24252 m!121965))

(declare-fun m!121967 () Bool)

(assert (=> d!24252 m!121967))

(declare-fun m!121969 () Bool)

(assert (=> d!24252 m!121969))

(assert (=> d!24252 m!121869))

(declare-fun m!121971 () Bool)

(assert (=> d!24252 m!121971))

(declare-fun m!121973 () Bool)

(assert (=> d!24252 m!121973))

(declare-fun m!121975 () Bool)

(assert (=> b!76677 m!121975))

(declare-fun m!121977 () Bool)

(assert (=> b!76679 m!121977))

(assert (=> b!76678 m!121879))

(declare-fun m!121979 () Bool)

(assert (=> b!76678 m!121979))

(declare-fun m!121981 () Bool)

(assert (=> b!76678 m!121981))

(assert (=> b!76609 d!24252))

(declare-fun d!24262 () Bool)

(assert (=> d!24262 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090))) nBits!322))))

(declare-fun bs!5858 () Bool)

(assert (= bs!5858 d!24262))

(declare-fun m!121983 () Bool)

(assert (=> bs!5858 m!121983))

(assert (=> b!76614 d!24262))

(declare-fun d!24264 () Bool)

(declare-fun res!63359 () Bool)

(declare-fun e!50329 () Bool)

(assert (=> d!24264 (=> (not res!63359) (not e!50329))))

(assert (=> d!24264 (= res!63359 (= (size!1483 (buf!1867 thiss!1090)) (size!1483 (buf!1867 (_2!3470 lt!122624)))))))

(assert (=> d!24264 (= (isPrefixOf!0 thiss!1090 (_2!3470 lt!122624)) e!50329)))

(declare-fun b!76691 () Bool)

(declare-fun res!63358 () Bool)

(assert (=> b!76691 (=> (not res!63358) (not e!50329))))

(assert (=> b!76691 (= res!63358 (bvsle (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)) (bitIndex!0 (size!1483 (buf!1867 (_2!3470 lt!122624))) (currentByte!3666 (_2!3470 lt!122624)) (currentBit!3661 (_2!3470 lt!122624)))))))

(declare-fun b!76692 () Bool)

(declare-fun e!50330 () Bool)

(assert (=> b!76692 (= e!50329 e!50330)))

(declare-fun res!63357 () Bool)

(assert (=> b!76692 (=> res!63357 e!50330)))

(assert (=> b!76692 (= res!63357 (= (size!1483 (buf!1867 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!76693 () Bool)

(assert (=> b!76693 (= e!50330 (arrayBitRangesEq!0 (buf!1867 thiss!1090) (buf!1867 (_2!3470 lt!122624)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090))))))

(assert (= (and d!24264 res!63359) b!76691))

(assert (= (and b!76691 res!63358) b!76692))

(assert (= (and b!76692 (not res!63357)) b!76693))

(assert (=> b!76691 m!121879))

(assert (=> b!76691 m!121877))

(assert (=> b!76693 m!121879))

(assert (=> b!76693 m!121879))

(declare-fun m!121987 () Bool)

(assert (=> b!76693 m!121987))

(assert (=> b!76613 d!24264))

(declare-fun d!24268 () Bool)

(assert (=> d!24268 (= (array_inv!1329 (buf!1867 thiss!1090)) (bvsge (size!1483 (buf!1867 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!76612 d!24268))

(declare-fun d!24272 () Bool)

(declare-fun e!50339 () Bool)

(assert (=> d!24272 e!50339))

(declare-fun res!63373 () Bool)

(assert (=> d!24272 (=> (not res!63373) (not e!50339))))

(declare-fun lt!122861 () (_ BitVec 64))

(declare-fun lt!122857 () (_ BitVec 64))

(declare-fun lt!122862 () (_ BitVec 64))

(assert (=> d!24272 (= res!63373 (= lt!122861 (bvsub lt!122862 lt!122857)))))

(assert (=> d!24272 (or (= (bvand lt!122862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122862 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122862 lt!122857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24272 (= lt!122857 (remainingBits!0 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))) ((_ sign_extend 32) (currentByte!3666 (_2!3470 lt!122624))) ((_ sign_extend 32) (currentBit!3661 (_2!3470 lt!122624)))))))

(declare-fun lt!122860 () (_ BitVec 64))

(declare-fun lt!122859 () (_ BitVec 64))

(assert (=> d!24272 (= lt!122862 (bvmul lt!122860 lt!122859))))

(assert (=> d!24272 (or (= lt!122860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122859 (bvsdiv (bvmul lt!122860 lt!122859) lt!122860)))))

(assert (=> d!24272 (= lt!122859 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24272 (= lt!122860 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))))))

(assert (=> d!24272 (= lt!122861 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3666 (_2!3470 lt!122624))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3661 (_2!3470 lt!122624)))))))

(assert (=> d!24272 (invariant!0 (currentBit!3661 (_2!3470 lt!122624)) (currentByte!3666 (_2!3470 lt!122624)) (size!1483 (buf!1867 (_2!3470 lt!122624))))))

(assert (=> d!24272 (= (bitIndex!0 (size!1483 (buf!1867 (_2!3470 lt!122624))) (currentByte!3666 (_2!3470 lt!122624)) (currentBit!3661 (_2!3470 lt!122624))) lt!122861)))

(declare-fun b!76707 () Bool)

(declare-fun res!63374 () Bool)

(assert (=> b!76707 (=> (not res!63374) (not e!50339))))

(assert (=> b!76707 (= res!63374 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122861))))

(declare-fun b!76708 () Bool)

(declare-fun lt!122858 () (_ BitVec 64))

(assert (=> b!76708 (= e!50339 (bvsle lt!122861 (bvmul lt!122858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76708 (or (= lt!122858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122858)))))

(assert (=> b!76708 (= lt!122858 ((_ sign_extend 32) (size!1483 (buf!1867 (_2!3470 lt!122624)))))))

(assert (= (and d!24272 res!63373) b!76707))

(assert (= (and b!76707 res!63374) b!76708))

(declare-fun m!122007 () Bool)

(assert (=> d!24272 m!122007))

(assert (=> d!24272 m!121873))

(assert (=> b!76611 d!24272))

(declare-fun d!24280 () Bool)

(declare-fun e!50340 () Bool)

(assert (=> d!24280 e!50340))

(declare-fun res!63375 () Bool)

(assert (=> d!24280 (=> (not res!63375) (not e!50340))))

(declare-fun lt!122863 () (_ BitVec 64))

(declare-fun lt!122867 () (_ BitVec 64))

(declare-fun lt!122868 () (_ BitVec 64))

(assert (=> d!24280 (= res!63375 (= lt!122867 (bvsub lt!122868 lt!122863)))))

(assert (=> d!24280 (or (= (bvand lt!122868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!122863 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!122868 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!122868 lt!122863) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24280 (= lt!122863 (remainingBits!0 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))) ((_ sign_extend 32) (currentByte!3666 thiss!1090)) ((_ sign_extend 32) (currentBit!3661 thiss!1090))))))

(declare-fun lt!122866 () (_ BitVec 64))

(declare-fun lt!122865 () (_ BitVec 64))

(assert (=> d!24280 (= lt!122868 (bvmul lt!122866 lt!122865))))

(assert (=> d!24280 (or (= lt!122866 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!122865 (bvsdiv (bvmul lt!122866 lt!122865) lt!122866)))))

(assert (=> d!24280 (= lt!122865 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24280 (= lt!122866 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))))))

(assert (=> d!24280 (= lt!122867 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3666 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3661 thiss!1090))))))

(assert (=> d!24280 (invariant!0 (currentBit!3661 thiss!1090) (currentByte!3666 thiss!1090) (size!1483 (buf!1867 thiss!1090)))))

(assert (=> d!24280 (= (bitIndex!0 (size!1483 (buf!1867 thiss!1090)) (currentByte!3666 thiss!1090) (currentBit!3661 thiss!1090)) lt!122867)))

(declare-fun b!76709 () Bool)

(declare-fun res!63376 () Bool)

(assert (=> b!76709 (=> (not res!63376) (not e!50340))))

(assert (=> b!76709 (= res!63376 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!122867))))

(declare-fun b!76710 () Bool)

(declare-fun lt!122864 () (_ BitVec 64))

(assert (=> b!76710 (= e!50340 (bvsle lt!122867 (bvmul lt!122864 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!76710 (or (= lt!122864 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!122864 #b0000000000000000000000000000000000000000000000000000000000001000) lt!122864)))))

(assert (=> b!76710 (= lt!122864 ((_ sign_extend 32) (size!1483 (buf!1867 thiss!1090))))))

(assert (= (and d!24280 res!63375) b!76709))

(assert (= (and b!76709 res!63376) b!76710))

(assert (=> d!24280 m!121983))

(assert (=> d!24280 m!121885))

(assert (=> b!76611 d!24280))

(push 1)

(assert (not b!76676))

(assert (not b!76679))

(assert (not b!76633))

(assert (not d!24280))

(assert (not b!76632))

(assert (not d!24248))

(assert (not b!76634))

(assert (not d!24246))

(assert (not d!24224))

(assert (not b!76693))

(assert (not b!76631))

(assert (not d!24262))

(assert (not d!24252))

(assert (not d!24272))

(assert (not d!24250))

(assert (not b!76691))

(assert (not d!24234))

(assert (not b!76677))

(assert (not b!76678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

