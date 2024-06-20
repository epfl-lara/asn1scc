; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3580 () Bool)

(assert start!3580)

(declare-fun b!15573 () Bool)

(declare-fun res!14484 () Bool)

(declare-fun e!9731 () Bool)

(assert (=> b!15573 (=> (not res!14484) (not e!9731))))

(declare-datatypes ((array!936 0))(
  ( (array!937 (arr!826 (Array (_ BitVec 32) (_ BitVec 8))) (size!397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!754 0))(
  ( (BitStream!755 (buf!757 array!936) (currentByte!1923 (_ BitVec 32)) (currentBit!1918 (_ BitVec 32))) )
))
(declare-fun thiss!1073 () BitStream!754)

(declare-fun nBits!313 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15573 (= res!14484 (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313))))

(declare-fun lt!23712 () (_ BitVec 64))

(declare-fun b!15574 () Bool)

(declare-fun lt!23711 () (_ BitVec 64))

(assert (=> b!15574 (= e!9731 (not (or (not (= lt!23711 (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!23711 (bvand (bvadd lt!23712 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!15574 (= lt!23711 (bvand lt!23712 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!15574 (= lt!23712 (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)))))

(declare-fun e!9729 () Bool)

(assert (=> b!15574 e!9729))

(declare-fun res!14482 () Bool)

(assert (=> b!15574 (=> (not res!14482) (not e!9729))))

(declare-datatypes ((Unit!1285 0))(
  ( (Unit!1286) )
))
(declare-datatypes ((tuple2!1862 0))(
  ( (tuple2!1863 (_1!992 Unit!1285) (_2!992 BitStream!754)) )
))
(declare-fun lt!23716 () tuple2!1862)

(assert (=> b!15574 (= res!14482 (= (size!397 (buf!757 thiss!1073)) (size!397 (buf!757 (_2!992 lt!23716)))))))

(declare-fun appendNBits!0 (BitStream!754 (_ BitVec 64) Bool) tuple2!1862)

(assert (=> b!15574 (= lt!23716 (appendNBits!0 thiss!1073 nBits!313 true))))

(declare-fun res!14486 () Bool)

(assert (=> start!3580 (=> (not res!14486) (not e!9731))))

(assert (=> start!3580 (= res!14486 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!3580 e!9731))

(assert (=> start!3580 true))

(declare-fun e!9732 () Bool)

(declare-fun inv!12 (BitStream!754) Bool)

(assert (=> start!3580 (and (inv!12 thiss!1073) e!9732)))

(declare-fun b!15575 () Bool)

(declare-fun array_inv!386 (array!936) Bool)

(assert (=> b!15575 (= e!9732 (array_inv!386 (buf!757 thiss!1073)))))

(declare-fun b!15576 () Bool)

(declare-datatypes ((tuple2!1864 0))(
  ( (tuple2!1865 (_1!993 BitStream!754) (_2!993 Bool)) )
))
(declare-fun lt!23714 () tuple2!1864)

(declare-datatypes ((tuple2!1866 0))(
  ( (tuple2!1867 (_1!994 BitStream!754) (_2!994 BitStream!754)) )
))
(declare-fun lt!23715 () tuple2!1866)

(assert (=> b!15576 (= e!9729 (not (or (not (_2!993 lt!23714)) (not (= (_1!993 lt!23714) (_2!994 lt!23715))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!754 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1864)

(assert (=> b!15576 (= lt!23714 (checkBitsLoopPure!0 (_1!994 lt!23715) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!15576 (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313)))

(declare-fun lt!23713 () Unit!1285)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!754 array!936 (_ BitVec 64)) Unit!1285)

(assert (=> b!15576 (= lt!23713 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!757 (_2!992 lt!23716)) nBits!313))))

(declare-fun reader!0 (BitStream!754 BitStream!754) tuple2!1866)

(assert (=> b!15576 (= lt!23715 (reader!0 thiss!1073 (_2!992 lt!23716)))))

(declare-fun b!15577 () Bool)

(declare-fun res!14485 () Bool)

(assert (=> b!15577 (=> (not res!14485) (not e!9729))))

(declare-fun isPrefixOf!0 (BitStream!754 BitStream!754) Bool)

(assert (=> b!15577 (= res!14485 (isPrefixOf!0 thiss!1073 (_2!992 lt!23716)))))

(declare-fun b!15578 () Bool)

(declare-fun res!14483 () Bool)

(assert (=> b!15578 (=> (not res!14483) (not e!9729))))

(assert (=> b!15578 (= res!14483 (= (bitIndex!0 (size!397 (buf!757 (_2!992 lt!23716))) (currentByte!1923 (_2!992 lt!23716)) (currentBit!1918 (_2!992 lt!23716))) (bvadd (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)) nBits!313)))))

(assert (= (and start!3580 res!14486) b!15573))

(assert (= (and b!15573 res!14484) b!15574))

(assert (= (and b!15574 res!14482) b!15578))

(assert (= (and b!15578 res!14483) b!15577))

(assert (= (and b!15577 res!14485) b!15576))

(assert (= start!3580 b!15575))

(declare-fun m!22275 () Bool)

(assert (=> b!15578 m!22275))

(declare-fun m!22277 () Bool)

(assert (=> b!15578 m!22277))

(declare-fun m!22279 () Bool)

(assert (=> b!15577 m!22279))

(declare-fun m!22281 () Bool)

(assert (=> b!15573 m!22281))

(declare-fun m!22283 () Bool)

(assert (=> b!15576 m!22283))

(declare-fun m!22285 () Bool)

(assert (=> b!15576 m!22285))

(declare-fun m!22287 () Bool)

(assert (=> b!15576 m!22287))

(declare-fun m!22289 () Bool)

(assert (=> b!15576 m!22289))

(declare-fun m!22291 () Bool)

(assert (=> start!3580 m!22291))

(declare-fun m!22293 () Bool)

(assert (=> b!15575 m!22293))

(assert (=> b!15574 m!22277))

(declare-fun m!22295 () Bool)

(assert (=> b!15574 m!22295))

(push 1)

(assert (not b!15575))

(assert (not b!15576))

(assert (not b!15573))

(assert (not b!15578))

(assert (not b!15574))

(assert (not b!15577))

(assert (not start!3580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5080 () Bool)

(declare-datatypes ((tuple2!1880 0))(
  ( (tuple2!1881 (_1!1001 Bool) (_2!1001 BitStream!754)) )
))
(declare-fun lt!23755 () tuple2!1880)

(declare-fun checkBitsLoop!0 (BitStream!754 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!1880)

(assert (=> d!5080 (= lt!23755 (checkBitsLoop!0 (_1!994 lt!23715) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!5080 (= (checkBitsLoopPure!0 (_1!994 lt!23715) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!1865 (_2!1001 lt!23755) (_1!1001 lt!23755)))))

(declare-fun bs!1416 () Bool)

(assert (= bs!1416 d!5080))

(declare-fun m!22341 () Bool)

(assert (=> bs!1416 m!22341))

(assert (=> b!15576 d!5080))

(declare-fun d!5082 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5082 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073))) nBits!313))))

(declare-fun bs!1417 () Bool)

(assert (= bs!1417 d!5082))

(declare-fun m!22343 () Bool)

(assert (=> bs!1417 m!22343))

(assert (=> b!15576 d!5082))

(declare-fun d!5086 () Bool)

(assert (=> d!5086 (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313)))

(declare-fun lt!23758 () Unit!1285)

(declare-fun choose!9 (BitStream!754 array!936 (_ BitVec 64) BitStream!754) Unit!1285)

(assert (=> d!5086 (= lt!23758 (choose!9 thiss!1073 (buf!757 (_2!992 lt!23716)) nBits!313 (BitStream!755 (buf!757 (_2!992 lt!23716)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073))))))

(assert (=> d!5086 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!757 (_2!992 lt!23716)) nBits!313) lt!23758)))

(declare-fun bs!1419 () Bool)

(assert (= bs!1419 d!5086))

(assert (=> bs!1419 m!22285))

(declare-fun m!22347 () Bool)

(assert (=> bs!1419 m!22347))

(assert (=> b!15576 d!5086))

(declare-fun b!15642 () Bool)

(declare-fun e!9772 () Unit!1285)

(declare-fun lt!23832 () Unit!1285)

(assert (=> b!15642 (= e!9772 lt!23832)))

(declare-fun lt!23829 () (_ BitVec 64))

(assert (=> b!15642 (= lt!23829 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!23846 () (_ BitVec 64))

(assert (=> b!15642 (= lt!23846 (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!936 array!936 (_ BitVec 64) (_ BitVec 64)) Unit!1285)

(assert (=> b!15642 (= lt!23832 (arrayBitRangesEqSymmetric!0 (buf!757 thiss!1073) (buf!757 (_2!992 lt!23716)) lt!23829 lt!23846))))

(declare-fun arrayBitRangesEq!0 (array!936 array!936 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!15642 (arrayBitRangesEq!0 (buf!757 (_2!992 lt!23716)) (buf!757 thiss!1073) lt!23829 lt!23846)))

(declare-fun b!15643 () Bool)

(declare-fun res!14541 () Bool)

(declare-fun e!9771 () Bool)

(assert (=> b!15643 (=> (not res!14541) (not e!9771))))

(declare-fun lt!23843 () tuple2!1866)

(assert (=> b!15643 (= res!14541 (isPrefixOf!0 (_1!994 lt!23843) thiss!1073))))

(declare-fun b!15644 () Bool)

(declare-fun Unit!1291 () Unit!1285)

(assert (=> b!15644 (= e!9772 Unit!1291)))

(declare-fun lt!23844 () (_ BitVec 64))

(declare-fun lt!23830 () (_ BitVec 64))

(declare-fun b!15646 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!754 (_ BitVec 64)) BitStream!754)

(assert (=> b!15646 (= e!9771 (= (_1!994 lt!23843) (withMovedBitIndex!0 (_2!994 lt!23843) (bvsub lt!23844 lt!23830))))))

(assert (=> b!15646 (or (= (bvand lt!23844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23830 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23844 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23844 lt!23830) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15646 (= lt!23830 (bitIndex!0 (size!397 (buf!757 (_2!992 lt!23716))) (currentByte!1923 (_2!992 lt!23716)) (currentBit!1918 (_2!992 lt!23716))))))

(assert (=> b!15646 (= lt!23844 (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)))))

(declare-fun d!5092 () Bool)

(assert (=> d!5092 e!9771))

(declare-fun res!14540 () Bool)

(assert (=> d!5092 (=> (not res!14540) (not e!9771))))

(assert (=> d!5092 (= res!14540 (isPrefixOf!0 (_1!994 lt!23843) (_2!994 lt!23843)))))

(declare-fun lt!23835 () BitStream!754)

(assert (=> d!5092 (= lt!23843 (tuple2!1867 lt!23835 (_2!992 lt!23716)))))

(declare-fun lt!23842 () Unit!1285)

(declare-fun lt!23840 () Unit!1285)

(assert (=> d!5092 (= lt!23842 lt!23840)))

(assert (=> d!5092 (isPrefixOf!0 lt!23835 (_2!992 lt!23716))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!754 BitStream!754 BitStream!754) Unit!1285)

(assert (=> d!5092 (= lt!23840 (lemmaIsPrefixTransitive!0 lt!23835 (_2!992 lt!23716) (_2!992 lt!23716)))))

(declare-fun lt!23834 () Unit!1285)

(declare-fun lt!23836 () Unit!1285)

(assert (=> d!5092 (= lt!23834 lt!23836)))

(assert (=> d!5092 (isPrefixOf!0 lt!23835 (_2!992 lt!23716))))

(assert (=> d!5092 (= lt!23836 (lemmaIsPrefixTransitive!0 lt!23835 thiss!1073 (_2!992 lt!23716)))))

(declare-fun lt!23845 () Unit!1285)

(assert (=> d!5092 (= lt!23845 e!9772)))

(declare-fun c!1051 () Bool)

(assert (=> d!5092 (= c!1051 (not (= (size!397 (buf!757 thiss!1073)) #b00000000000000000000000000000000)))))

(declare-fun lt!23841 () Unit!1285)

(declare-fun lt!23831 () Unit!1285)

(assert (=> d!5092 (= lt!23841 lt!23831)))

(assert (=> d!5092 (isPrefixOf!0 (_2!992 lt!23716) (_2!992 lt!23716))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!754) Unit!1285)

(assert (=> d!5092 (= lt!23831 (lemmaIsPrefixRefl!0 (_2!992 lt!23716)))))

(declare-fun lt!23847 () Unit!1285)

(declare-fun lt!23837 () Unit!1285)

(assert (=> d!5092 (= lt!23847 lt!23837)))

(assert (=> d!5092 (= lt!23837 (lemmaIsPrefixRefl!0 (_2!992 lt!23716)))))

(declare-fun lt!23848 () Unit!1285)

(declare-fun lt!23833 () Unit!1285)

(assert (=> d!5092 (= lt!23848 lt!23833)))

(assert (=> d!5092 (isPrefixOf!0 lt!23835 lt!23835)))

(assert (=> d!5092 (= lt!23833 (lemmaIsPrefixRefl!0 lt!23835))))

(declare-fun lt!23838 () Unit!1285)

(declare-fun lt!23839 () Unit!1285)

(assert (=> d!5092 (= lt!23838 lt!23839)))

(assert (=> d!5092 (isPrefixOf!0 thiss!1073 thiss!1073)))

(assert (=> d!5092 (= lt!23839 (lemmaIsPrefixRefl!0 thiss!1073))))

(assert (=> d!5092 (= lt!23835 (BitStream!755 (buf!757 (_2!992 lt!23716)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)))))

(assert (=> d!5092 (isPrefixOf!0 thiss!1073 (_2!992 lt!23716))))

(assert (=> d!5092 (= (reader!0 thiss!1073 (_2!992 lt!23716)) lt!23843)))

(declare-fun b!15645 () Bool)

(declare-fun res!14542 () Bool)

(assert (=> b!15645 (=> (not res!14542) (not e!9771))))

(assert (=> b!15645 (= res!14542 (isPrefixOf!0 (_2!994 lt!23843) (_2!992 lt!23716)))))

(assert (= (and d!5092 c!1051) b!15642))

(assert (= (and d!5092 (not c!1051)) b!15644))

(assert (= (and d!5092 res!14540) b!15643))

(assert (= (and b!15643 res!14541) b!15645))

(assert (= (and b!15645 res!14542) b!15646))

(declare-fun m!22363 () Bool)

(assert (=> d!5092 m!22363))

(declare-fun m!22365 () Bool)

(assert (=> d!5092 m!22365))

(assert (=> d!5092 m!22279))

(declare-fun m!22367 () Bool)

(assert (=> d!5092 m!22367))

(declare-fun m!22369 () Bool)

(assert (=> d!5092 m!22369))

(declare-fun m!22371 () Bool)

(assert (=> d!5092 m!22371))

(declare-fun m!22373 () Bool)

(assert (=> d!5092 m!22373))

(declare-fun m!22375 () Bool)

(assert (=> d!5092 m!22375))

(declare-fun m!22377 () Bool)

(assert (=> d!5092 m!22377))

(declare-fun m!22379 () Bool)

(assert (=> d!5092 m!22379))

(declare-fun m!22381 () Bool)

(assert (=> d!5092 m!22381))

(assert (=> b!15642 m!22277))

(declare-fun m!22383 () Bool)

(assert (=> b!15642 m!22383))

(declare-fun m!22385 () Bool)

(assert (=> b!15642 m!22385))

(declare-fun m!22387 () Bool)

(assert (=> b!15643 m!22387))

(declare-fun m!22389 () Bool)

(assert (=> b!15646 m!22389))

(assert (=> b!15646 m!22275))

(assert (=> b!15646 m!22277))

(declare-fun m!22391 () Bool)

(assert (=> b!15645 m!22391))

(assert (=> b!15576 d!5092))

(declare-fun d!5106 () Bool)

(assert (=> d!5106 (= (array_inv!386 (buf!757 thiss!1073)) (bvsge (size!397 (buf!757 thiss!1073)) #b00000000000000000000000000000000))))

(assert (=> b!15575 d!5106))

(declare-fun d!5108 () Bool)

(declare-fun e!9775 () Bool)

(assert (=> d!5108 e!9775))

(declare-fun res!14548 () Bool)

(assert (=> d!5108 (=> (not res!14548) (not e!9775))))

(declare-fun lt!23862 () (_ BitVec 64))

(declare-fun lt!23866 () (_ BitVec 64))

(declare-fun lt!23863 () (_ BitVec 64))

(assert (=> d!5108 (= res!14548 (= lt!23866 (bvsub lt!23863 lt!23862)))))

(assert (=> d!5108 (or (= (bvand lt!23863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23862 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23863 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23863 lt!23862) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5108 (= lt!23862 (remainingBits!0 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073))))))

(declare-fun lt!23865 () (_ BitVec 64))

(declare-fun lt!23864 () (_ BitVec 64))

(assert (=> d!5108 (= lt!23863 (bvmul lt!23865 lt!23864))))

(assert (=> d!5108 (or (= lt!23865 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23864 (bvsdiv (bvmul lt!23865 lt!23864) lt!23865)))))

(assert (=> d!5108 (= lt!23864 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5108 (= lt!23865 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))))))

(assert (=> d!5108 (= lt!23866 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1923 thiss!1073)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1918 thiss!1073))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!5108 (invariant!0 (currentBit!1918 thiss!1073) (currentByte!1923 thiss!1073) (size!397 (buf!757 thiss!1073)))))

(assert (=> d!5108 (= (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)) lt!23866)))

(declare-fun b!15651 () Bool)

(declare-fun res!14547 () Bool)

(assert (=> b!15651 (=> (not res!14547) (not e!9775))))

(assert (=> b!15651 (= res!14547 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23866))))

(declare-fun b!15652 () Bool)

(declare-fun lt!23861 () (_ BitVec 64))

(assert (=> b!15652 (= e!9775 (bvsle lt!23866 (bvmul lt!23861 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15652 (or (= lt!23861 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23861 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23861)))))

(assert (=> b!15652 (= lt!23861 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))))))

(assert (= (and d!5108 res!14548) b!15651))

(assert (= (and b!15651 res!14547) b!15652))

(declare-fun m!22393 () Bool)

(assert (=> d!5108 m!22393))

(declare-fun m!22395 () Bool)

(assert (=> d!5108 m!22395))

(assert (=> b!15574 d!5108))

(declare-fun b!15694 () Bool)

(declare-fun res!14584 () Bool)

(declare-fun e!9796 () Bool)

(assert (=> b!15694 (=> (not res!14584) (not e!9796))))

(declare-fun lt!23963 () tuple2!1862)

(assert (=> b!15694 (= res!14584 (isPrefixOf!0 thiss!1073 (_2!992 lt!23963)))))

(declare-fun b!15693 () Bool)

(declare-fun res!14583 () Bool)

(assert (=> b!15693 (=> (not res!14583) (not e!9796))))

(declare-fun lt!23965 () (_ BitVec 64))

(assert (=> b!15693 (= res!14583 (= (bitIndex!0 (size!397 (buf!757 (_2!992 lt!23963))) (currentByte!1923 (_2!992 lt!23963)) (currentBit!1918 (_2!992 lt!23963))) (bvadd lt!23965 nBits!313)))))

(assert (=> b!15693 (or (not (= (bvand lt!23965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!313 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!23965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!23965 nBits!313) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15693 (= lt!23965 (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)))))

(declare-fun d!5110 () Bool)

(assert (=> d!5110 e!9796))

(declare-fun res!14586 () Bool)

(assert (=> d!5110 (=> (not res!14586) (not e!9796))))

(assert (=> d!5110 (= res!14586 (= (size!397 (buf!757 thiss!1073)) (size!397 (buf!757 (_2!992 lt!23963)))))))

(declare-fun choose!36 (BitStream!754 (_ BitVec 64) Bool) tuple2!1862)

(assert (=> d!5110 (= lt!23963 (choose!36 thiss!1073 nBits!313 true))))

(assert (=> d!5110 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!313) (bvsle nBits!313 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5110 (= (appendNBits!0 thiss!1073 nBits!313 true) lt!23963)))

(declare-fun b!15695 () Bool)

(declare-fun lt!23966 () tuple2!1864)

(declare-fun lt!23964 () tuple2!1866)

(assert (=> b!15695 (= e!9796 (and (_2!993 lt!23966) (= (_1!993 lt!23966) (_2!994 lt!23964))))))

(assert (=> b!15695 (= lt!23966 (checkBitsLoopPure!0 (_1!994 lt!23964) nBits!313 true #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!23968 () Unit!1285)

(declare-fun lt!23967 () Unit!1285)

(assert (=> b!15695 (= lt!23968 lt!23967)))

(assert (=> b!15695 (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23963)))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313)))

(assert (=> b!15695 (= lt!23967 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1073 (buf!757 (_2!992 lt!23963)) nBits!313))))

(declare-fun e!9797 () Bool)

(assert (=> b!15695 e!9797))

(declare-fun res!14585 () Bool)

(assert (=> b!15695 (=> (not res!14585) (not e!9797))))

(assert (=> b!15695 (= res!14585 (and (= (size!397 (buf!757 thiss!1073)) (size!397 (buf!757 (_2!992 lt!23963)))) (bvsge nBits!313 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!15695 (= lt!23964 (reader!0 thiss!1073 (_2!992 lt!23963)))))

(declare-fun b!15696 () Bool)

(assert (=> b!15696 (= e!9797 (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313))))

(assert (= (and d!5110 res!14586) b!15693))

(assert (= (and b!15693 res!14583) b!15694))

(assert (= (and b!15694 res!14584) b!15695))

(assert (= (and b!15695 res!14585) b!15696))

(declare-fun m!22437 () Bool)

(assert (=> b!15694 m!22437))

(assert (=> b!15696 m!22281))

(declare-fun m!22439 () Bool)

(assert (=> d!5110 m!22439))

(declare-fun m!22441 () Bool)

(assert (=> b!15695 m!22441))

(declare-fun m!22443 () Bool)

(assert (=> b!15695 m!22443))

(declare-fun m!22445 () Bool)

(assert (=> b!15695 m!22445))

(declare-fun m!22447 () Bool)

(assert (=> b!15695 m!22447))

(declare-fun m!22449 () Bool)

(assert (=> b!15693 m!22449))

(assert (=> b!15693 m!22277))

(assert (=> b!15574 d!5110))

(declare-fun d!5128 () Bool)

(assert (=> d!5128 (= (inv!12 thiss!1073) (invariant!0 (currentBit!1918 thiss!1073) (currentByte!1923 thiss!1073) (size!397 (buf!757 thiss!1073))))))

(declare-fun bs!1426 () Bool)

(assert (= bs!1426 d!5128))

(assert (=> bs!1426 m!22395))

(assert (=> start!3580 d!5128))

(declare-fun d!5132 () Bool)

(assert (=> d!5132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073)) nBits!313) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!397 (buf!757 thiss!1073))) ((_ sign_extend 32) (currentByte!1923 thiss!1073)) ((_ sign_extend 32) (currentBit!1918 thiss!1073))) nBits!313))))

(declare-fun bs!1427 () Bool)

(assert (= bs!1427 d!5132))

(assert (=> bs!1427 m!22393))

(assert (=> b!15573 d!5132))

(declare-fun d!5134 () Bool)

(declare-fun e!9798 () Bool)

(assert (=> d!5134 e!9798))

(declare-fun res!14588 () Bool)

(assert (=> d!5134 (=> (not res!14588) (not e!9798))))

(declare-fun lt!23971 () (_ BitVec 64))

(declare-fun lt!23974 () (_ BitVec 64))

(declare-fun lt!23970 () (_ BitVec 64))

(assert (=> d!5134 (= res!14588 (= lt!23974 (bvsub lt!23971 lt!23970)))))

(assert (=> d!5134 (or (= (bvand lt!23971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!23970 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!23971 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!23971 lt!23970) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!5134 (= lt!23970 (remainingBits!0 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))) ((_ sign_extend 32) (currentByte!1923 (_2!992 lt!23716))) ((_ sign_extend 32) (currentBit!1918 (_2!992 lt!23716)))))))

(declare-fun lt!23973 () (_ BitVec 64))

(declare-fun lt!23972 () (_ BitVec 64))

(assert (=> d!5134 (= lt!23971 (bvmul lt!23973 lt!23972))))

(assert (=> d!5134 (or (= lt!23973 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!23972 (bvsdiv (bvmul lt!23973 lt!23972) lt!23973)))))

(assert (=> d!5134 (= lt!23972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!5134 (= lt!23973 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))))))

(assert (=> d!5134 (= lt!23974 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1923 (_2!992 lt!23716))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1918 (_2!992 lt!23716)))))))

(assert (=> d!5134 (invariant!0 (currentBit!1918 (_2!992 lt!23716)) (currentByte!1923 (_2!992 lt!23716)) (size!397 (buf!757 (_2!992 lt!23716))))))

(assert (=> d!5134 (= (bitIndex!0 (size!397 (buf!757 (_2!992 lt!23716))) (currentByte!1923 (_2!992 lt!23716)) (currentBit!1918 (_2!992 lt!23716))) lt!23974)))

(declare-fun b!15697 () Bool)

(declare-fun res!14587 () Bool)

(assert (=> b!15697 (=> (not res!14587) (not e!9798))))

(assert (=> b!15697 (= res!14587 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!23974))))

(declare-fun b!15698 () Bool)

(declare-fun lt!23969 () (_ BitVec 64))

(assert (=> b!15698 (= e!9798 (bvsle lt!23974 (bvmul lt!23969 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!15698 (or (= lt!23969 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!23969 #b0000000000000000000000000000000000000000000000000000000000001000) lt!23969)))))

(assert (=> b!15698 (= lt!23969 ((_ sign_extend 32) (size!397 (buf!757 (_2!992 lt!23716)))))))

(assert (= (and d!5134 res!14588) b!15697))

(assert (= (and b!15697 res!14587) b!15698))

(declare-fun m!22451 () Bool)

(assert (=> d!5134 m!22451))

(declare-fun m!22453 () Bool)

(assert (=> d!5134 m!22453))

(assert (=> b!15578 d!5134))

(assert (=> b!15578 d!5108))

(declare-fun d!5136 () Bool)

(declare-fun res!14596 () Bool)

(declare-fun e!9804 () Bool)

(assert (=> d!5136 (=> (not res!14596) (not e!9804))))

(assert (=> d!5136 (= res!14596 (= (size!397 (buf!757 thiss!1073)) (size!397 (buf!757 (_2!992 lt!23716)))))))

(assert (=> d!5136 (= (isPrefixOf!0 thiss!1073 (_2!992 lt!23716)) e!9804)))

(declare-fun b!15705 () Bool)

(declare-fun res!14595 () Bool)

(assert (=> b!15705 (=> (not res!14595) (not e!9804))))

(assert (=> b!15705 (= res!14595 (bvsle (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073)) (bitIndex!0 (size!397 (buf!757 (_2!992 lt!23716))) (currentByte!1923 (_2!992 lt!23716)) (currentBit!1918 (_2!992 lt!23716)))))))

(declare-fun b!15706 () Bool)

(declare-fun e!9803 () Bool)

(assert (=> b!15706 (= e!9804 e!9803)))

(declare-fun res!14597 () Bool)

(assert (=> b!15706 (=> res!14597 e!9803)))

(assert (=> b!15706 (= res!14597 (= (size!397 (buf!757 thiss!1073)) #b00000000000000000000000000000000))))

(declare-fun b!15707 () Bool)

(assert (=> b!15707 (= e!9803 (arrayBitRangesEq!0 (buf!757 thiss!1073) (buf!757 (_2!992 lt!23716)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!397 (buf!757 thiss!1073)) (currentByte!1923 thiss!1073) (currentBit!1918 thiss!1073))))))

(assert (= (and d!5136 res!14596) b!15705))

(assert (= (and b!15705 res!14595) b!15706))

(assert (= (and b!15706 (not res!14597)) b!15707))

(assert (=> b!15705 m!22277))

(assert (=> b!15705 m!22275))

(assert (=> b!15707 m!22277))

(assert (=> b!15707 m!22277))

(declare-fun m!22455 () Bool)

(assert (=> b!15707 m!22455))

(assert (=> b!15577 d!5136))

(push 1)

(assert (not d!5134))

(assert (not b!15694))

(assert (not d!5086))

(assert (not d!5108))

(assert (not d!5080))

(assert (not d!5132))

(assert (not d!5110))

(assert (not b!15695))

(assert (not b!15705))

(assert (not b!15642))

(assert (not d!5082))

(assert (not b!15643))

(assert (not d!5092))

(assert (not d!5128))

(assert (not b!15693))

(assert (not b!15646))

(assert (not b!15696))

(assert (not b!15707))

(assert (not b!15645))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

