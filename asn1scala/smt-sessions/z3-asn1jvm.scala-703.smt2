; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19700 () Bool)

(assert start!19700)

(declare-fun b!98421 () Bool)

(declare-fun res!80743 () Bool)

(declare-fun e!64384 () Bool)

(assert (=> b!98421 (=> (not res!80743) (not e!64384))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98421 (= res!80743 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun e!64383 () Bool)

(declare-datatypes ((array!4620 0))(
  ( (array!4621 (arr!2704 (Array (_ BitVec 32) (_ BitVec 8))) (size!2111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3696 0))(
  ( (BitStream!3697 (buf!2462 array!4620) (currentByte!4892 (_ BitVec 32)) (currentBit!4887 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7942 0))(
  ( (tuple2!7943 (_1!4223 BitStream!3696) (_2!4223 BitStream!3696)) )
))
(declare-fun lt!142600 () tuple2!7942)

(declare-fun b!98422 () Bool)

(declare-datatypes ((tuple2!7944 0))(
  ( (tuple2!7945 (_1!4224 BitStream!3696) (_2!4224 (_ BitVec 64))) )
))
(declare-fun lt!142602 () tuple2!7944)

(assert (=> b!98422 (= e!64383 (or (not (= (_2!4224 lt!142602) v!196)) (not (= (_1!4224 lt!142602) (_2!4223 lt!142600)))))))

(declare-fun readNLeastSignificantBitsPure!0 (BitStream!3696 (_ BitVec 32)) tuple2!7944)

(assert (=> b!98422 (= lt!142602 (readNLeastSignificantBitsPure!0 (_1!4223 lt!142600) nBits!388))))

(declare-datatypes ((Unit!6031 0))(
  ( (Unit!6032) )
))
(declare-datatypes ((tuple2!7946 0))(
  ( (tuple2!7947 (_1!4225 Unit!6031) (_2!4225 BitStream!3696)) )
))
(declare-fun lt!142601 () tuple2!7946)

(declare-fun thiss!1288 () BitStream!3696)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98422 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142603 () Unit!6031)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3696 array!4620 (_ BitVec 64)) Unit!6031)

(assert (=> b!98422 (= lt!142603 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!142601)) ((_ sign_extend 32) nBits!388)))))

(declare-fun reader!0 (BitStream!3696 BitStream!3696) tuple2!7942)

(assert (=> b!98422 (= lt!142600 (reader!0 thiss!1288 (_2!4225 lt!142601)))))

(declare-fun res!80744 () Bool)

(assert (=> start!19700 (=> (not res!80744) (not e!64384))))

(assert (=> start!19700 (= res!80744 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19700 e!64384))

(assert (=> start!19700 true))

(declare-fun e!64385 () Bool)

(declare-fun inv!12 (BitStream!3696) Bool)

(assert (=> start!19700 (and (inv!12 thiss!1288) e!64385)))

(declare-fun b!98420 () Bool)

(declare-fun res!80741 () Bool)

(assert (=> b!98420 (=> res!80741 e!64383)))

(declare-fun isPrefixOf!0 (BitStream!3696 BitStream!3696) Bool)

(assert (=> b!98420 (= res!80741 (not (isPrefixOf!0 thiss!1288 (_2!4225 lt!142601))))))

(declare-fun b!98423 () Bool)

(assert (=> b!98423 (= e!64384 e!64383)))

(declare-fun res!80740 () Bool)

(assert (=> b!98423 (=> res!80740 e!64383)))

(assert (=> b!98423 (= res!80740 (not (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!142601))))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3696 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7946)

(assert (=> b!98423 (= lt!142601 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!98424 () Bool)

(declare-fun array_inv!1913 (array!4620) Bool)

(assert (=> b!98424 (= e!64385 (array_inv!1913 (buf!2462 thiss!1288)))))

(declare-fun b!98425 () Bool)

(declare-fun res!80739 () Bool)

(assert (=> b!98425 (=> (not res!80739) (not e!64384))))

(assert (=> b!98425 (= res!80739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!98426 () Bool)

(declare-fun res!80742 () Bool)

(assert (=> b!98426 (=> res!80742 e!64383)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!98426 (= res!80742 (not (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601))) (bvadd (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388)))))))

(assert (= (and start!19700 res!80744) b!98425))

(assert (= (and b!98425 res!80739) b!98421))

(assert (= (and b!98421 res!80743) b!98423))

(assert (= (and b!98423 (not res!80740)) b!98426))

(assert (= (and b!98426 (not res!80742)) b!98420))

(assert (= (and b!98420 (not res!80741)) b!98422))

(assert (= start!19700 b!98424))

(declare-fun m!142945 () Bool)

(assert (=> b!98422 m!142945))

(declare-fun m!142947 () Bool)

(assert (=> b!98422 m!142947))

(declare-fun m!142949 () Bool)

(assert (=> b!98422 m!142949))

(declare-fun m!142951 () Bool)

(assert (=> b!98422 m!142951))

(declare-fun m!142953 () Bool)

(assert (=> b!98423 m!142953))

(declare-fun m!142955 () Bool)

(assert (=> b!98426 m!142955))

(declare-fun m!142957 () Bool)

(assert (=> b!98426 m!142957))

(declare-fun m!142959 () Bool)

(assert (=> b!98424 m!142959))

(declare-fun m!142961 () Bool)

(assert (=> b!98425 m!142961))

(declare-fun m!142963 () Bool)

(assert (=> b!98421 m!142963))

(declare-fun m!142965 () Bool)

(assert (=> start!19700 m!142965))

(declare-fun m!142967 () Bool)

(assert (=> b!98420 m!142967))

(check-sat (not b!98422) (not start!19700) (not b!98425) (not b!98420) (not b!98424) (not b!98423) (not b!98421) (not b!98426))
(check-sat)
(get-model)

(declare-fun d!30794 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!30794 (= (inv!12 thiss!1288) (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 thiss!1288))))))

(declare-fun bs!7547 () Bool)

(assert (= bs!7547 d!30794))

(declare-fun m!142993 () Bool)

(assert (=> bs!7547 m!142993))

(assert (=> start!19700 d!30794))

(declare-fun d!30796 () Bool)

(declare-datatypes ((tuple2!7958 0))(
  ( (tuple2!7959 (_1!4231 (_ BitVec 64)) (_2!4231 BitStream!3696)) )
))
(declare-fun lt!142618 () tuple2!7958)

(declare-fun readNLeastSignificantBits!0 (BitStream!3696 (_ BitVec 32)) tuple2!7958)

(assert (=> d!30796 (= lt!142618 (readNLeastSignificantBits!0 (_1!4223 lt!142600) nBits!388))))

(assert (=> d!30796 (= (readNLeastSignificantBitsPure!0 (_1!4223 lt!142600) nBits!388) (tuple2!7945 (_2!4231 lt!142618) (_1!4231 lt!142618)))))

(declare-fun bs!7548 () Bool)

(assert (= bs!7548 d!30796))

(declare-fun m!142995 () Bool)

(assert (=> bs!7548 m!142995))

(assert (=> b!98422 d!30796))

(declare-fun d!30798 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!30798 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7549 () Bool)

(assert (= bs!7549 d!30798))

(declare-fun m!142997 () Bool)

(assert (=> bs!7549 m!142997))

(assert (=> b!98422 d!30798))

(declare-fun d!30800 () Bool)

(assert (=> d!30800 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(declare-fun lt!142621 () Unit!6031)

(declare-fun choose!9 (BitStream!3696 array!4620 (_ BitVec 64) BitStream!3696) Unit!6031)

(assert (=> d!30800 (= lt!142621 (choose!9 thiss!1288 (buf!2462 (_2!4225 lt!142601)) ((_ sign_extend 32) nBits!388) (BitStream!3697 (buf!2462 (_2!4225 lt!142601)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (=> d!30800 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!142601)) ((_ sign_extend 32) nBits!388)) lt!142621)))

(declare-fun bs!7550 () Bool)

(assert (= bs!7550 d!30800))

(assert (=> bs!7550 m!142947))

(declare-fun m!142999 () Bool)

(assert (=> bs!7550 m!142999))

(assert (=> b!98422 d!30800))

(declare-fun b!98458 () Bool)

(declare-fun e!64404 () Unit!6031)

(declare-fun lt!142679 () Unit!6031)

(assert (=> b!98458 (= e!64404 lt!142679)))

(declare-fun lt!142672 () (_ BitVec 64))

(assert (=> b!98458 (= lt!142672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!142671 () (_ BitVec 64))

(assert (=> b!98458 (= lt!142671 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4620 array!4620 (_ BitVec 64) (_ BitVec 64)) Unit!6031)

(assert (=> b!98458 (= lt!142679 (arrayBitRangesEqSymmetric!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) lt!142672 lt!142671))))

(declare-fun arrayBitRangesEq!0 (array!4620 array!4620 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!98458 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!142601)) (buf!2462 thiss!1288) lt!142672 lt!142671)))

(declare-fun b!98459 () Bool)

(declare-fun Unit!6047 () Unit!6031)

(assert (=> b!98459 (= e!64404 Unit!6047)))

(declare-fun b!98460 () Bool)

(declare-fun res!80769 () Bool)

(declare-fun e!64403 () Bool)

(assert (=> b!98460 (=> (not res!80769) (not e!64403))))

(declare-fun lt!142674 () tuple2!7942)

(assert (=> b!98460 (= res!80769 (isPrefixOf!0 (_2!4223 lt!142674) (_2!4225 lt!142601)))))

(declare-fun b!98461 () Bool)

(declare-fun res!80770 () Bool)

(assert (=> b!98461 (=> (not res!80770) (not e!64403))))

(assert (=> b!98461 (= res!80770 (isPrefixOf!0 (_1!4223 lt!142674) thiss!1288))))

(declare-fun b!98462 () Bool)

(declare-fun lt!142667 () (_ BitVec 64))

(declare-fun lt!142662 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3696 (_ BitVec 64)) BitStream!3696)

(assert (=> b!98462 (= e!64403 (= (_1!4223 lt!142674) (withMovedBitIndex!0 (_2!4223 lt!142674) (bvsub lt!142662 lt!142667))))))

(assert (=> b!98462 (or (= (bvand lt!142662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!142667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!142662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142662 lt!142667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98462 (= lt!142667 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601))))))

(assert (=> b!98462 (= lt!142662 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun d!30806 () Bool)

(assert (=> d!30806 e!64403))

(declare-fun res!80771 () Bool)

(assert (=> d!30806 (=> (not res!80771) (not e!64403))))

(assert (=> d!30806 (= res!80771 (isPrefixOf!0 (_1!4223 lt!142674) (_2!4223 lt!142674)))))

(declare-fun lt!142673 () BitStream!3696)

(assert (=> d!30806 (= lt!142674 (tuple2!7943 lt!142673 (_2!4225 lt!142601)))))

(declare-fun lt!142666 () Unit!6031)

(declare-fun lt!142681 () Unit!6031)

(assert (=> d!30806 (= lt!142666 lt!142681)))

(assert (=> d!30806 (isPrefixOf!0 lt!142673 (_2!4225 lt!142601))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3696 BitStream!3696 BitStream!3696) Unit!6031)

(assert (=> d!30806 (= lt!142681 (lemmaIsPrefixTransitive!0 lt!142673 (_2!4225 lt!142601) (_2!4225 lt!142601)))))

(declare-fun lt!142676 () Unit!6031)

(declare-fun lt!142677 () Unit!6031)

(assert (=> d!30806 (= lt!142676 lt!142677)))

(assert (=> d!30806 (isPrefixOf!0 lt!142673 (_2!4225 lt!142601))))

(assert (=> d!30806 (= lt!142677 (lemmaIsPrefixTransitive!0 lt!142673 thiss!1288 (_2!4225 lt!142601)))))

(declare-fun lt!142670 () Unit!6031)

(assert (=> d!30806 (= lt!142670 e!64404)))

(declare-fun c!6218 () Bool)

(assert (=> d!30806 (= c!6218 (not (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!142664 () Unit!6031)

(declare-fun lt!142680 () Unit!6031)

(assert (=> d!30806 (= lt!142664 lt!142680)))

(assert (=> d!30806 (isPrefixOf!0 (_2!4225 lt!142601) (_2!4225 lt!142601))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3696) Unit!6031)

(assert (=> d!30806 (= lt!142680 (lemmaIsPrefixRefl!0 (_2!4225 lt!142601)))))

(declare-fun lt!142669 () Unit!6031)

(declare-fun lt!142675 () Unit!6031)

(assert (=> d!30806 (= lt!142669 lt!142675)))

(assert (=> d!30806 (= lt!142675 (lemmaIsPrefixRefl!0 (_2!4225 lt!142601)))))

(declare-fun lt!142665 () Unit!6031)

(declare-fun lt!142668 () Unit!6031)

(assert (=> d!30806 (= lt!142665 lt!142668)))

(assert (=> d!30806 (isPrefixOf!0 lt!142673 lt!142673)))

(assert (=> d!30806 (= lt!142668 (lemmaIsPrefixRefl!0 lt!142673))))

(declare-fun lt!142678 () Unit!6031)

(declare-fun lt!142663 () Unit!6031)

(assert (=> d!30806 (= lt!142678 lt!142663)))

(assert (=> d!30806 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!30806 (= lt!142663 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!30806 (= lt!142673 (BitStream!3697 (buf!2462 (_2!4225 lt!142601)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> d!30806 (isPrefixOf!0 thiss!1288 (_2!4225 lt!142601))))

(assert (=> d!30806 (= (reader!0 thiss!1288 (_2!4225 lt!142601)) lt!142674)))

(assert (= (and d!30806 c!6218) b!98458))

(assert (= (and d!30806 (not c!6218)) b!98459))

(assert (= (and d!30806 res!80771) b!98461))

(assert (= (and b!98461 res!80770) b!98460))

(assert (= (and b!98460 res!80769) b!98462))

(declare-fun m!143003 () Bool)

(assert (=> b!98460 m!143003))

(declare-fun m!143005 () Bool)

(assert (=> b!98462 m!143005))

(assert (=> b!98462 m!142955))

(assert (=> b!98462 m!142957))

(declare-fun m!143007 () Bool)

(assert (=> d!30806 m!143007))

(declare-fun m!143009 () Bool)

(assert (=> d!30806 m!143009))

(declare-fun m!143011 () Bool)

(assert (=> d!30806 m!143011))

(declare-fun m!143013 () Bool)

(assert (=> d!30806 m!143013))

(declare-fun m!143015 () Bool)

(assert (=> d!30806 m!143015))

(declare-fun m!143017 () Bool)

(assert (=> d!30806 m!143017))

(declare-fun m!143019 () Bool)

(assert (=> d!30806 m!143019))

(declare-fun m!143021 () Bool)

(assert (=> d!30806 m!143021))

(declare-fun m!143023 () Bool)

(assert (=> d!30806 m!143023))

(assert (=> d!30806 m!142967))

(declare-fun m!143025 () Bool)

(assert (=> d!30806 m!143025))

(assert (=> b!98458 m!142957))

(declare-fun m!143027 () Bool)

(assert (=> b!98458 m!143027))

(declare-fun m!143029 () Bool)

(assert (=> b!98458 m!143029))

(declare-fun m!143031 () Bool)

(assert (=> b!98461 m!143031))

(assert (=> b!98422 d!30806))

(declare-fun d!30812 () Bool)

(assert (=> d!30812 (= (array_inv!1913 (buf!2462 thiss!1288)) (bvsge (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000))))

(assert (=> b!98424 d!30812))

(declare-fun b!98631 () Bool)

(declare-fun res!80904 () Bool)

(declare-fun call!1231 () Bool)

(assert (=> b!98631 (= res!80904 call!1231)))

(declare-fun e!64493 () Bool)

(assert (=> b!98631 (=> (not res!80904) (not e!64493))))

(declare-fun d!30814 () Bool)

(declare-fun e!64494 () Bool)

(assert (=> d!30814 e!64494))

(declare-fun res!80898 () Bool)

(assert (=> d!30814 (=> (not res!80898) (not e!64494))))

(declare-fun lt!143253 () tuple2!7946)

(assert (=> d!30814 (= res!80898 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!143253)))))))

(declare-fun e!64497 () tuple2!7946)

(assert (=> d!30814 (= lt!143253 e!64497)))

(declare-fun c!6242 () Bool)

(assert (=> d!30814 (= c!6242 (bvslt #b00000000000000000000000000000000 nBits!388))))

(assert (=> d!30814 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!30814 (= (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000) lt!143253)))

(declare-fun b!98632 () Bool)

(declare-fun res!80896 () Bool)

(assert (=> b!98632 (=> (not res!80896) (not e!64494))))

(declare-fun lt!143223 () (_ BitVec 64))

(declare-fun lt!143226 () (_ BitVec 64))

(assert (=> b!98632 (= res!80896 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143253))) (currentByte!4892 (_2!4225 lt!143253)) (currentBit!4887 (_2!4225 lt!143253))) (bvadd lt!143226 lt!143223)))))

(assert (=> b!98632 (or (not (= (bvand lt!143226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143223 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143226 lt!143223) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98632 (= lt!143223 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98632 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98632 (= lt!143226 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun lt!143242 () BitStream!3696)

(declare-fun bm!1228 () Bool)

(declare-fun lt!143244 () tuple2!7946)

(assert (=> bm!1228 (= call!1231 (isPrefixOf!0 (ite c!6242 thiss!1288 lt!143242) (ite c!6242 (_2!4225 lt!143244) lt!143242)))))

(declare-fun b!98633 () Bool)

(declare-fun res!80901 () Bool)

(assert (=> b!98633 (= res!80901 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143244))) (currentByte!4892 (_2!4225 lt!143244)) (currentBit!4887 (_2!4225 lt!143244))) (bvadd (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98633 (=> (not res!80901) (not e!64493))))

(declare-fun b!98634 () Bool)

(declare-fun e!64498 () Bool)

(declare-datatypes ((tuple2!7962 0))(
  ( (tuple2!7963 (_1!4233 BitStream!3696) (_2!4233 Bool)) )
))
(declare-fun lt!143239 () tuple2!7962)

(assert (=> b!98634 (= e!64498 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143239))) (currentByte!4892 (_1!4233 lt!143239)) (currentBit!4887 (_1!4233 lt!143239))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143244))) (currentByte!4892 (_2!4225 lt!143244)) (currentBit!4887 (_2!4225 lt!143244)))))))

(declare-fun b!98635 () Bool)

(declare-fun e!64495 () (_ BitVec 64))

(assert (=> b!98635 (= e!64495 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!98636 () Bool)

(declare-fun e!64499 () Bool)

(declare-fun lt!143222 () (_ BitVec 64))

(assert (=> b!98636 (= e!64499 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143222))))

(declare-fun b!98637 () Bool)

(declare-fun res!80900 () Bool)

(assert (=> b!98637 (=> (not res!80900) (not e!64494))))

(assert (=> b!98637 (= res!80900 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143253)))))

(declare-fun b!98638 () Bool)

(declare-fun lt!143260 () Unit!6031)

(assert (=> b!98638 (= e!64497 (tuple2!7947 lt!143260 thiss!1288))))

(assert (=> b!98638 (= lt!143242 thiss!1288)))

(assert (=> b!98638 (= lt!143260 (lemmaIsPrefixRefl!0 lt!143242))))

(assert (=> b!98638 call!1231))

(declare-fun b!98639 () Bool)

(declare-fun e!64496 () Bool)

(declare-fun lt!143247 () tuple2!7962)

(declare-fun lt!143261 () tuple2!7962)

(assert (=> b!98639 (= e!64496 (= (_2!4233 lt!143247) (_2!4233 lt!143261)))))

(declare-fun b!98640 () Bool)

(declare-fun lt!143266 () tuple2!7944)

(declare-fun lt!143232 () tuple2!7942)

(assert (=> b!98640 (= e!64494 (and (= (_2!4224 lt!143266) v!196) (= (_1!4224 lt!143266) (_2!4223 lt!143232))))))

(declare-fun lt!143228 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7944)

(assert (=> b!98640 (= lt!143266 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143232) nBits!388 #b00000000000000000000000000000000 lt!143228))))

(declare-fun lt!143231 () Unit!6031)

(declare-fun lt!143230 () Unit!6031)

(assert (=> b!98640 (= lt!143231 lt!143230)))

(assert (=> b!98640 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143222)))

(assert (=> b!98640 (= lt!143230 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!143253)) lt!143222))))

(assert (=> b!98640 e!64499))

(declare-fun res!80897 () Bool)

(assert (=> b!98640 (=> (not res!80897) (not e!64499))))

(assert (=> b!98640 (= res!80897 (and (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!143253)))) (bvsge lt!143222 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98640 (= lt!143222 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(assert (=> b!98640 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98640 (= lt!143228 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98640 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!98640 (= lt!143232 (reader!0 thiss!1288 (_2!4225 lt!143253)))))

(declare-fun b!98641 () Bool)

(declare-fun readBitPure!0 (BitStream!3696) tuple2!7962)

(declare-fun readerFrom!0 (BitStream!3696 (_ BitVec 32) (_ BitVec 32)) BitStream!3696)

(assert (=> b!98641 (= lt!143239 (readBitPure!0 (readerFrom!0 (_2!4225 lt!143244) (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288))))))

(declare-fun lt!143225 () Bool)

(declare-fun res!80902 () Bool)

(assert (=> b!98641 (= res!80902 (and (= (_2!4233 lt!143239) lt!143225) (= (_1!4233 lt!143239) (_2!4225 lt!143244))))))

(assert (=> b!98641 (=> (not res!80902) (not e!64498))))

(assert (=> b!98641 (= e!64493 e!64498)))

(declare-fun b!98642 () Bool)

(assert (=> b!98642 (= e!64495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98643 () Bool)

(declare-fun lt!143257 () tuple2!7946)

(declare-fun Unit!6049 () Unit!6031)

(assert (=> b!98643 (= e!64497 (tuple2!7947 Unit!6049 (_2!4225 lt!143257)))))

(assert (=> b!98643 (= lt!143225 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun appendBit!0 (BitStream!3696 Bool) tuple2!7946)

(assert (=> b!98643 (= lt!143244 (appendBit!0 thiss!1288 lt!143225))))

(declare-fun res!80903 () Bool)

(assert (=> b!98643 (= res!80903 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!143244)))))))

(assert (=> b!98643 (=> (not res!80903) (not e!64493))))

(assert (=> b!98643 e!64493))

(declare-fun lt!143263 () tuple2!7946)

(assert (=> b!98643 (= lt!143263 lt!143244)))

(assert (=> b!98643 (= lt!143257 (appendNLeastSignificantBitsLoop!0 (_2!4225 lt!143263) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!143235 () Unit!6031)

(assert (=> b!98643 (= lt!143235 (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4225 lt!143263) (_2!4225 lt!143257)))))

(assert (=> b!98643 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143257))))

(declare-fun lt!143227 () Unit!6031)

(assert (=> b!98643 (= lt!143227 lt!143235)))

(assert (=> b!98643 (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 (_2!4225 lt!143263))))))

(declare-fun lt!143243 () BitStream!3696)

(assert (=> b!98643 (= lt!143243 (BitStream!3697 (buf!2462 (_2!4225 lt!143263)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> b!98643 (invariant!0 (currentBit!4887 lt!143243) (currentByte!4892 lt!143243) (size!2111 (buf!2462 (_2!4225 lt!143257))))))

(declare-fun lt!143234 () BitStream!3696)

(assert (=> b!98643 (= lt!143234 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 lt!143243) (currentBit!4887 lt!143243)))))

(assert (=> b!98643 (= lt!143247 (readBitPure!0 lt!143243))))

(assert (=> b!98643 (= lt!143261 (readBitPure!0 lt!143234))))

(declare-fun lt!143252 () Unit!6031)

(declare-fun readBitPrefixLemma!0 (BitStream!3696 BitStream!3696) Unit!6031)

(assert (=> b!98643 (= lt!143252 (readBitPrefixLemma!0 lt!143243 (_2!4225 lt!143257)))))

(declare-fun res!80899 () Bool)

(assert (=> b!98643 (= res!80899 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143247))) (currentByte!4892 (_1!4233 lt!143247)) (currentBit!4887 (_1!4233 lt!143247))) (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143261))) (currentByte!4892 (_1!4233 lt!143261)) (currentBit!4887 (_1!4233 lt!143261)))))))

(assert (=> b!98643 (=> (not res!80899) (not e!64496))))

(assert (=> b!98643 e!64496))

(declare-fun lt!143262 () Unit!6031)

(assert (=> b!98643 (= lt!143262 lt!143252)))

(declare-fun lt!143238 () tuple2!7942)

(assert (=> b!98643 (= lt!143238 (reader!0 thiss!1288 (_2!4225 lt!143257)))))

(declare-fun lt!143254 () tuple2!7942)

(assert (=> b!98643 (= lt!143254 (reader!0 (_2!4225 lt!143263) (_2!4225 lt!143257)))))

(declare-fun lt!143256 () tuple2!7962)

(assert (=> b!98643 (= lt!143256 (readBitPure!0 (_1!4223 lt!143238)))))

(assert (=> b!98643 (= (_2!4233 lt!143256) lt!143225)))

(declare-fun lt!143265 () Unit!6031)

(declare-fun Unit!6050 () Unit!6031)

(assert (=> b!98643 (= lt!143265 Unit!6050)))

(declare-fun lt!143259 () (_ BitVec 64))

(assert (=> b!98643 (= lt!143259 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(declare-fun lt!143233 () (_ BitVec 64))

(assert (=> b!98643 (= lt!143233 ((_ sign_extend 32) (bvsub nBits!388 #b00000000000000000000000000000000)))))

(declare-fun lt!143224 () Unit!6031)

(assert (=> b!98643 (= lt!143224 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!143257)) lt!143233))))

(assert (=> b!98643 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143233)))

(declare-fun lt!143249 () Unit!6031)

(assert (=> b!98643 (= lt!143249 lt!143224)))

(declare-fun lt!143255 () tuple2!7944)

(assert (=> b!98643 (= lt!143255 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259))))

(declare-fun lt!143250 () (_ BitVec 64))

(assert (=> b!98643 (= lt!143250 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000000) #b00000000000000000000000000000001)))))

(declare-fun lt!143248 () Unit!6031)

(assert (=> b!98643 (= lt!143248 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4225 lt!143263) (buf!2462 (_2!4225 lt!143257)) lt!143250))))

(assert (=> b!98643 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143250)))

(declare-fun lt!143241 () Unit!6031)

(assert (=> b!98643 (= lt!143241 lt!143248)))

(declare-fun lt!143258 () tuple2!7944)

(assert (=> b!98643 (= lt!143258 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143254) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 (ite (_2!4233 lt!143256) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!143246 () tuple2!7944)

(assert (=> b!98643 (= lt!143246 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259))))

(declare-fun c!6241 () Bool)

(assert (=> b!98643 (= c!6241 (_2!4233 (readBitPure!0 (_1!4223 lt!143238))))))

(declare-fun lt!143236 () tuple2!7944)

(assert (=> b!98643 (= lt!143236 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 e!64495)))))

(declare-fun lt!143237 () Unit!6031)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6031)

(assert (=> b!98643 (= lt!143237 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259))))

(assert (=> b!98643 (and (= (_2!4224 lt!143246) (_2!4224 lt!143236)) (= (_1!4224 lt!143246) (_1!4224 lt!143236)))))

(declare-fun lt!143240 () Unit!6031)

(assert (=> b!98643 (= lt!143240 lt!143237)))

(assert (=> b!98643 (= (_1!4223 lt!143238) (withMovedBitIndex!0 (_2!4223 lt!143238) (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))))))

(declare-fun lt!143229 () Unit!6031)

(declare-fun Unit!6051 () Unit!6031)

(assert (=> b!98643 (= lt!143229 Unit!6051)))

(assert (=> b!98643 (= (_1!4223 lt!143254) (withMovedBitIndex!0 (_2!4223 lt!143254) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))))))

(declare-fun lt!143264 () Unit!6031)

(declare-fun Unit!6052 () Unit!6031)

(assert (=> b!98643 (= lt!143264 Unit!6052)))

(assert (=> b!98643 (= (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!143245 () Unit!6031)

(declare-fun Unit!6053 () Unit!6031)

(assert (=> b!98643 (= lt!143245 Unit!6053)))

(assert (=> b!98643 (= (_2!4224 lt!143255) (_2!4224 lt!143258))))

(declare-fun lt!143251 () Unit!6031)

(declare-fun Unit!6054 () Unit!6031)

(assert (=> b!98643 (= lt!143251 Unit!6054)))

(assert (=> b!98643 (= (_1!4224 lt!143255) (_2!4223 lt!143238))))

(assert (= (and d!30814 c!6242) b!98643))

(assert (= (and d!30814 (not c!6242)) b!98638))

(assert (= (and b!98643 res!80903) b!98633))

(assert (= (and b!98633 res!80901) b!98631))

(assert (= (and b!98631 res!80904) b!98641))

(assert (= (and b!98641 res!80902) b!98634))

(assert (= (and b!98643 res!80899) b!98639))

(assert (= (and b!98643 c!6241) b!98635))

(assert (= (and b!98643 (not c!6241)) b!98642))

(assert (= (or b!98631 b!98638) bm!1228))

(assert (= (and d!30814 res!80898) b!98632))

(assert (= (and b!98632 res!80896) b!98637))

(assert (= (and b!98637 res!80900) b!98640))

(assert (= (and b!98640 res!80897) b!98636))

(declare-fun m!143287 () Bool)

(assert (=> b!98638 m!143287))

(declare-fun m!143289 () Bool)

(assert (=> b!98637 m!143289))

(declare-fun m!143291 () Bool)

(assert (=> b!98633 m!143291))

(assert (=> b!98633 m!142957))

(declare-fun m!143293 () Bool)

(assert (=> bm!1228 m!143293))

(declare-fun m!143295 () Bool)

(assert (=> b!98634 m!143295))

(assert (=> b!98634 m!143291))

(declare-fun m!143297 () Bool)

(assert (=> b!98632 m!143297))

(assert (=> b!98632 m!142957))

(declare-fun m!143299 () Bool)

(assert (=> b!98640 m!143299))

(declare-fun m!143301 () Bool)

(assert (=> b!98640 m!143301))

(declare-fun m!143303 () Bool)

(assert (=> b!98640 m!143303))

(declare-fun m!143305 () Bool)

(assert (=> b!98640 m!143305))

(declare-fun m!143307 () Bool)

(assert (=> b!98640 m!143307))

(declare-fun m!143309 () Bool)

(assert (=> b!98641 m!143309))

(assert (=> b!98641 m!143309))

(declare-fun m!143311 () Bool)

(assert (=> b!98641 m!143311))

(declare-fun m!143313 () Bool)

(assert (=> b!98643 m!143313))

(declare-fun m!143315 () Bool)

(assert (=> b!98643 m!143315))

(declare-fun m!143317 () Bool)

(assert (=> b!98643 m!143317))

(declare-fun m!143319 () Bool)

(assert (=> b!98643 m!143319))

(declare-fun m!143321 () Bool)

(assert (=> b!98643 m!143321))

(declare-fun m!143323 () Bool)

(assert (=> b!98643 m!143323))

(declare-fun m!143325 () Bool)

(assert (=> b!98643 m!143325))

(declare-fun m!143327 () Bool)

(assert (=> b!98643 m!143327))

(declare-fun m!143329 () Bool)

(assert (=> b!98643 m!143329))

(assert (=> b!98643 m!143303))

(declare-fun m!143331 () Bool)

(assert (=> b!98643 m!143331))

(declare-fun m!143333 () Bool)

(assert (=> b!98643 m!143333))

(declare-fun m!143335 () Bool)

(assert (=> b!98643 m!143335))

(declare-fun m!143337 () Bool)

(assert (=> b!98643 m!143337))

(declare-fun m!143339 () Bool)

(assert (=> b!98643 m!143339))

(declare-fun m!143341 () Bool)

(assert (=> b!98643 m!143341))

(declare-fun m!143343 () Bool)

(assert (=> b!98643 m!143343))

(declare-fun m!143345 () Bool)

(assert (=> b!98643 m!143345))

(declare-fun m!143347 () Bool)

(assert (=> b!98643 m!143347))

(declare-fun m!143349 () Bool)

(assert (=> b!98643 m!143349))

(declare-fun m!143351 () Bool)

(assert (=> b!98643 m!143351))

(declare-fun m!143353 () Bool)

(assert (=> b!98643 m!143353))

(declare-fun m!143355 () Bool)

(assert (=> b!98643 m!143355))

(declare-fun m!143357 () Bool)

(assert (=> b!98643 m!143357))

(assert (=> b!98643 m!143345))

(declare-fun m!143359 () Bool)

(assert (=> b!98643 m!143359))

(assert (=> b!98643 m!142957))

(declare-fun m!143361 () Bool)

(assert (=> b!98643 m!143361))

(declare-fun m!143363 () Bool)

(assert (=> b!98643 m!143363))

(declare-fun m!143365 () Bool)

(assert (=> b!98643 m!143365))

(declare-fun m!143367 () Bool)

(assert (=> b!98636 m!143367))

(assert (=> b!98423 d!30814))

(declare-fun d!30856 () Bool)

(assert (=> d!30856 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) ((_ sign_extend 32) nBits!388)))))

(declare-fun bs!7561 () Bool)

(assert (= bs!7561 d!30856))

(declare-fun m!143369 () Bool)

(assert (=> bs!7561 m!143369))

(assert (=> b!98425 d!30856))

(declare-fun d!30858 () Bool)

(declare-fun res!80913 () Bool)

(declare-fun e!64504 () Bool)

(assert (=> d!30858 (=> (not res!80913) (not e!64504))))

(assert (=> d!30858 (= res!80913 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (=> d!30858 (= (isPrefixOf!0 thiss!1288 (_2!4225 lt!142601)) e!64504)))

(declare-fun b!98650 () Bool)

(declare-fun res!80911 () Bool)

(assert (=> b!98650 (=> (not res!80911) (not e!64504))))

(assert (=> b!98650 (= res!80911 (bvsle (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601)))))))

(declare-fun b!98651 () Bool)

(declare-fun e!64505 () Bool)

(assert (=> b!98651 (= e!64504 e!64505)))

(declare-fun res!80912 () Bool)

(assert (=> b!98651 (=> res!80912 e!64505)))

(assert (=> b!98651 (= res!80912 (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98652 () Bool)

(assert (=> b!98652 (= e!64505 (arrayBitRangesEq!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (= (and d!30858 res!80913) b!98650))

(assert (= (and b!98650 res!80911) b!98651))

(assert (= (and b!98651 (not res!80912)) b!98652))

(assert (=> b!98650 m!142957))

(assert (=> b!98650 m!142955))

(assert (=> b!98652 m!142957))

(assert (=> b!98652 m!142957))

(declare-fun m!143371 () Bool)

(assert (=> b!98652 m!143371))

(assert (=> b!98420 d!30858))

(declare-fun d!30860 () Bool)

(assert (=> d!30860 (= (onesLSBLong!0 nBits!388) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!388))))))

(assert (=> b!98421 d!30860))

(declare-fun d!30862 () Bool)

(declare-fun e!64508 () Bool)

(assert (=> d!30862 e!64508))

(declare-fun res!80919 () Bool)

(assert (=> d!30862 (=> (not res!80919) (not e!64508))))

(declare-fun lt!143280 () (_ BitVec 64))

(declare-fun lt!143279 () (_ BitVec 64))

(declare-fun lt!143283 () (_ BitVec 64))

(assert (=> d!30862 (= res!80919 (= lt!143283 (bvsub lt!143280 lt!143279)))))

(assert (=> d!30862 (or (= (bvand lt!143280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143279 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143280 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143280 lt!143279) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30862 (= lt!143279 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!142601))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!142601)))))))

(declare-fun lt!143281 () (_ BitVec 64))

(declare-fun lt!143284 () (_ BitVec 64))

(assert (=> d!30862 (= lt!143280 (bvmul lt!143281 lt!143284))))

(assert (=> d!30862 (or (= lt!143281 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143284 (bvsdiv (bvmul lt!143281 lt!143284) lt!143281)))))

(assert (=> d!30862 (= lt!143284 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30862 (= lt!143281 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (=> d!30862 (= lt!143283 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!142601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!142601)))))))

(assert (=> d!30862 (invariant!0 (currentBit!4887 (_2!4225 lt!142601)) (currentByte!4892 (_2!4225 lt!142601)) (size!2111 (buf!2462 (_2!4225 lt!142601))))))

(assert (=> d!30862 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601))) lt!143283)))

(declare-fun b!98657 () Bool)

(declare-fun res!80918 () Bool)

(assert (=> b!98657 (=> (not res!80918) (not e!64508))))

(assert (=> b!98657 (= res!80918 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143283))))

(declare-fun b!98658 () Bool)

(declare-fun lt!143282 () (_ BitVec 64))

(assert (=> b!98658 (= e!64508 (bvsle lt!143283 (bvmul lt!143282 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98658 (or (= lt!143282 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143282 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143282)))))

(assert (=> b!98658 (= lt!143282 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (= (and d!30862 res!80919) b!98657))

(assert (= (and b!98657 res!80918) b!98658))

(declare-fun m!143373 () Bool)

(assert (=> d!30862 m!143373))

(declare-fun m!143375 () Bool)

(assert (=> d!30862 m!143375))

(assert (=> b!98426 d!30862))

(declare-fun d!30864 () Bool)

(declare-fun e!64509 () Bool)

(assert (=> d!30864 e!64509))

(declare-fun res!80921 () Bool)

(assert (=> d!30864 (=> (not res!80921) (not e!64509))))

(declare-fun lt!143285 () (_ BitVec 64))

(declare-fun lt!143289 () (_ BitVec 64))

(declare-fun lt!143286 () (_ BitVec 64))

(assert (=> d!30864 (= res!80921 (= lt!143289 (bvsub lt!143286 lt!143285)))))

(assert (=> d!30864 (or (= (bvand lt!143286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143285 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143286 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143286 lt!143285) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!30864 (= lt!143285 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))))))

(declare-fun lt!143287 () (_ BitVec 64))

(declare-fun lt!143290 () (_ BitVec 64))

(assert (=> d!30864 (= lt!143286 (bvmul lt!143287 lt!143290))))

(assert (=> d!30864 (or (= lt!143287 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143290 (bvsdiv (bvmul lt!143287 lt!143290) lt!143287)))))

(assert (=> d!30864 (= lt!143290 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!30864 (= lt!143287 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))))))

(assert (=> d!30864 (= lt!143289 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 thiss!1288))))))

(assert (=> d!30864 (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 thiss!1288)))))

(assert (=> d!30864 (= (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) lt!143289)))

(declare-fun b!98659 () Bool)

(declare-fun res!80920 () Bool)

(assert (=> b!98659 (=> (not res!80920) (not e!64509))))

(assert (=> b!98659 (= res!80920 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143289))))

(declare-fun b!98660 () Bool)

(declare-fun lt!143288 () (_ BitVec 64))

(assert (=> b!98660 (= e!64509 (bvsle lt!143289 (bvmul lt!143288 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98660 (or (= lt!143288 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143288 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143288)))))

(assert (=> b!98660 (= lt!143288 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))))))

(assert (= (and d!30864 res!80921) b!98659))

(assert (= (and b!98659 res!80920) b!98660))

(assert (=> d!30864 m!143369))

(assert (=> d!30864 m!142993))

(assert (=> b!98426 d!30864))

(check-sat (not d!30806) (not b!98652) (not b!98462) (not b!98643) (not b!98458) (not d!30794) (not b!98638) (not b!98636) (not bm!1228) (not b!98460) (not b!98640) (not b!98641) (not b!98632) (not b!98637) (not d!30862) (not d!30796) (not b!98634) (not d!30864) (not d!30856) (not d!30798) (not d!30800) (not b!98461) (not b!98650) (not b!98633))
(check-sat)
(get-model)

(declare-fun d!31122 () Bool)

(assert (=> d!31122 (isPrefixOf!0 lt!143242 lt!143242)))

(declare-fun lt!143801 () Unit!6031)

(declare-fun choose!11 (BitStream!3696) Unit!6031)

(assert (=> d!31122 (= lt!143801 (choose!11 lt!143242))))

(assert (=> d!31122 (= (lemmaIsPrefixRefl!0 lt!143242) lt!143801)))

(declare-fun bs!7617 () Bool)

(assert (= bs!7617 d!31122))

(declare-fun m!144111 () Bool)

(assert (=> bs!7617 m!144111))

(declare-fun m!144113 () Bool)

(assert (=> bs!7617 m!144113))

(assert (=> b!98638 d!31122))

(assert (=> b!98458 d!30864))

(declare-fun d!31124 () Bool)

(assert (=> d!31124 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!142601)) (buf!2462 thiss!1288) lt!142672 lt!142671)))

(declare-fun lt!143804 () Unit!6031)

(declare-fun choose!8 (array!4620 array!4620 (_ BitVec 64) (_ BitVec 64)) Unit!6031)

(assert (=> d!31124 (= lt!143804 (choose!8 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) lt!142672 lt!142671))))

(assert (=> d!31124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!142672) (bvsle lt!142672 lt!142671))))

(assert (=> d!31124 (= (arrayBitRangesEqSymmetric!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) lt!142672 lt!142671) lt!143804)))

(declare-fun bs!7618 () Bool)

(assert (= bs!7618 d!31124))

(assert (=> bs!7618 m!143029))

(declare-fun m!144115 () Bool)

(assert (=> bs!7618 m!144115))

(assert (=> b!98458 d!31124))

(declare-fun d!31126 () Bool)

(declare-fun res!81154 () Bool)

(declare-fun e!64693 () Bool)

(assert (=> d!31126 (=> res!81154 e!64693)))

(assert (=> d!31126 (= res!81154 (bvsge lt!142672 lt!142671))))

(assert (=> d!31126 (= (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!142601)) (buf!2462 thiss!1288) lt!142672 lt!142671) e!64693)))

(declare-fun e!64696 () Bool)

(declare-datatypes ((tuple4!66 0))(
  ( (tuple4!67 (_1!4239 (_ BitVec 32)) (_2!4239 (_ BitVec 32)) (_3!254 (_ BitVec 32)) (_4!33 (_ BitVec 32))) )
))
(declare-fun lt!143813 () tuple4!66)

(declare-fun b!98931 () Bool)

(declare-fun arrayRangesEq!34 (array!4620 array!4620 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!98931 (= e!64696 (arrayRangesEq!34 (buf!2462 (_2!4225 lt!142601)) (buf!2462 thiss!1288) (_1!4239 lt!143813) (_2!4239 lt!143813)))))

(declare-fun b!98932 () Bool)

(declare-fun e!64697 () Bool)

(declare-fun e!64694 () Bool)

(assert (=> b!98932 (= e!64697 e!64694)))

(declare-fun res!81152 () Bool)

(declare-fun lt!143811 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!98932 (= res!81152 (byteRangesEq!0 (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_3!254 lt!143813)) (select (arr!2704 (buf!2462 thiss!1288)) (_3!254 lt!143813)) lt!143811 #b00000000000000000000000000001000))))

(assert (=> b!98932 (=> (not res!81152) (not e!64694))))

(declare-fun b!98933 () Bool)

(declare-fun e!64695 () Bool)

(assert (=> b!98933 (= e!64693 e!64695)))

(declare-fun res!81153 () Bool)

(assert (=> b!98933 (=> (not res!81153) (not e!64695))))

(assert (=> b!98933 (= res!81153 e!64696)))

(declare-fun res!81155 () Bool)

(assert (=> b!98933 (=> res!81155 e!64696)))

(assert (=> b!98933 (= res!81155 (bvsge (_1!4239 lt!143813) (_2!4239 lt!143813)))))

(declare-fun lt!143812 () (_ BitVec 32))

(assert (=> b!98933 (= lt!143812 ((_ extract 31 0) (bvsrem lt!142671 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98933 (= lt!143811 ((_ extract 31 0) (bvsrem lt!142672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!66)

(assert (=> b!98933 (= lt!143813 (arrayBitIndices!0 lt!142672 lt!142671))))

(declare-fun b!98934 () Bool)

(declare-fun res!81156 () Bool)

(assert (=> b!98934 (= res!81156 (= lt!143812 #b00000000000000000000000000000000))))

(declare-fun e!64692 () Bool)

(assert (=> b!98934 (=> res!81156 e!64692)))

(assert (=> b!98934 (= e!64694 e!64692)))

(declare-fun b!98935 () Bool)

(assert (=> b!98935 (= e!64695 e!64697)))

(declare-fun c!6263 () Bool)

(assert (=> b!98935 (= c!6263 (= (_3!254 lt!143813) (_4!33 lt!143813)))))

(declare-fun b!98936 () Bool)

(declare-fun call!1244 () Bool)

(assert (=> b!98936 (= e!64697 call!1244)))

(declare-fun b!98937 () Bool)

(assert (=> b!98937 (= e!64692 call!1244)))

(declare-fun bm!1241 () Bool)

(assert (=> bm!1241 (= call!1244 (byteRangesEq!0 (ite c!6263 (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_3!254 lt!143813)) (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_4!33 lt!143813))) (ite c!6263 (select (arr!2704 (buf!2462 thiss!1288)) (_3!254 lt!143813)) (select (arr!2704 (buf!2462 thiss!1288)) (_4!33 lt!143813))) (ite c!6263 lt!143811 #b00000000000000000000000000000000) lt!143812))))

(assert (= (and d!31126 (not res!81154)) b!98933))

(assert (= (and b!98933 (not res!81155)) b!98931))

(assert (= (and b!98933 res!81153) b!98935))

(assert (= (and b!98935 c!6263) b!98936))

(assert (= (and b!98935 (not c!6263)) b!98932))

(assert (= (and b!98932 res!81152) b!98934))

(assert (= (and b!98934 (not res!81156)) b!98937))

(assert (= (or b!98936 b!98937) bm!1241))

(declare-fun m!144117 () Bool)

(assert (=> b!98931 m!144117))

(declare-fun m!144119 () Bool)

(assert (=> b!98932 m!144119))

(declare-fun m!144121 () Bool)

(assert (=> b!98932 m!144121))

(assert (=> b!98932 m!144119))

(assert (=> b!98932 m!144121))

(declare-fun m!144123 () Bool)

(assert (=> b!98932 m!144123))

(declare-fun m!144125 () Bool)

(assert (=> b!98933 m!144125))

(declare-fun m!144127 () Bool)

(assert (=> bm!1241 m!144127))

(declare-fun m!144129 () Bool)

(assert (=> bm!1241 m!144129))

(assert (=> bm!1241 m!144121))

(assert (=> bm!1241 m!144119))

(declare-fun m!144131 () Bool)

(assert (=> bm!1241 m!144131))

(assert (=> b!98458 d!31126))

(declare-fun d!31128 () Bool)

(declare-fun lt!143816 () tuple2!7958)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!7958)

(assert (=> d!31128 (= lt!143816 (readNLeastSignificantBitsLoop!0 (_1!4223 lt!143232) nBits!388 #b00000000000000000000000000000000 lt!143228))))

(assert (=> d!31128 (= (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143232) nBits!388 #b00000000000000000000000000000000 lt!143228) (tuple2!7945 (_2!4231 lt!143816) (_1!4231 lt!143816)))))

(declare-fun bs!7619 () Bool)

(assert (= bs!7619 d!31128))

(declare-fun m!144133 () Bool)

(assert (=> bs!7619 m!144133))

(assert (=> b!98640 d!31128))

(declare-fun d!31130 () Bool)

(assert (=> d!31130 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143222)))

(declare-fun lt!143817 () Unit!6031)

(assert (=> d!31130 (= lt!143817 (choose!9 thiss!1288 (buf!2462 (_2!4225 lt!143253)) lt!143222 (BitStream!3697 (buf!2462 (_2!4225 lt!143253)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (=> d!31130 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!143253)) lt!143222) lt!143817)))

(declare-fun bs!7620 () Bool)

(assert (= bs!7620 d!31130))

(assert (=> bs!7620 m!143299))

(declare-fun m!144135 () Bool)

(assert (=> bs!7620 m!144135))

(assert (=> b!98640 d!31130))

(declare-fun d!31132 () Bool)

(assert (=> d!31132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143222) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) lt!143222))))

(declare-fun bs!7621 () Bool)

(assert (= bs!7621 d!31132))

(declare-fun m!144137 () Bool)

(assert (=> bs!7621 m!144137))

(assert (=> b!98640 d!31132))

(declare-fun b!98938 () Bool)

(declare-fun e!64699 () Unit!6031)

(declare-fun lt!143835 () Unit!6031)

(assert (=> b!98938 (= e!64699 lt!143835)))

(declare-fun lt!143828 () (_ BitVec 64))

(assert (=> b!98938 (= lt!143828 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143827 () (_ BitVec 64))

(assert (=> b!98938 (= lt!143827 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> b!98938 (= lt!143835 (arrayBitRangesEqSymmetric!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!143253)) lt!143828 lt!143827))))

(assert (=> b!98938 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!143253)) (buf!2462 thiss!1288) lt!143828 lt!143827)))

(declare-fun b!98939 () Bool)

(declare-fun Unit!6074 () Unit!6031)

(assert (=> b!98939 (= e!64699 Unit!6074)))

(declare-fun b!98940 () Bool)

(declare-fun res!81157 () Bool)

(declare-fun e!64698 () Bool)

(assert (=> b!98940 (=> (not res!81157) (not e!64698))))

(declare-fun lt!143830 () tuple2!7942)

(assert (=> b!98940 (= res!81157 (isPrefixOf!0 (_2!4223 lt!143830) (_2!4225 lt!143253)))))

(declare-fun b!98941 () Bool)

(declare-fun res!81158 () Bool)

(assert (=> b!98941 (=> (not res!81158) (not e!64698))))

(assert (=> b!98941 (= res!81158 (isPrefixOf!0 (_1!4223 lt!143830) thiss!1288))))

(declare-fun b!98942 () Bool)

(declare-fun lt!143823 () (_ BitVec 64))

(declare-fun lt!143818 () (_ BitVec 64))

(assert (=> b!98942 (= e!64698 (= (_1!4223 lt!143830) (withMovedBitIndex!0 (_2!4223 lt!143830) (bvsub lt!143818 lt!143823))))))

(assert (=> b!98942 (or (= (bvand lt!143818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143823 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143818 lt!143823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98942 (= lt!143823 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143253))) (currentByte!4892 (_2!4225 lt!143253)) (currentBit!4887 (_2!4225 lt!143253))))))

(assert (=> b!98942 (= lt!143818 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun d!31134 () Bool)

(assert (=> d!31134 e!64698))

(declare-fun res!81159 () Bool)

(assert (=> d!31134 (=> (not res!81159) (not e!64698))))

(assert (=> d!31134 (= res!81159 (isPrefixOf!0 (_1!4223 lt!143830) (_2!4223 lt!143830)))))

(declare-fun lt!143829 () BitStream!3696)

(assert (=> d!31134 (= lt!143830 (tuple2!7943 lt!143829 (_2!4225 lt!143253)))))

(declare-fun lt!143822 () Unit!6031)

(declare-fun lt!143837 () Unit!6031)

(assert (=> d!31134 (= lt!143822 lt!143837)))

(assert (=> d!31134 (isPrefixOf!0 lt!143829 (_2!4225 lt!143253))))

(assert (=> d!31134 (= lt!143837 (lemmaIsPrefixTransitive!0 lt!143829 (_2!4225 lt!143253) (_2!4225 lt!143253)))))

(declare-fun lt!143832 () Unit!6031)

(declare-fun lt!143833 () Unit!6031)

(assert (=> d!31134 (= lt!143832 lt!143833)))

(assert (=> d!31134 (isPrefixOf!0 lt!143829 (_2!4225 lt!143253))))

(assert (=> d!31134 (= lt!143833 (lemmaIsPrefixTransitive!0 lt!143829 thiss!1288 (_2!4225 lt!143253)))))

(declare-fun lt!143826 () Unit!6031)

(assert (=> d!31134 (= lt!143826 e!64699)))

(declare-fun c!6264 () Bool)

(assert (=> d!31134 (= c!6264 (not (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143820 () Unit!6031)

(declare-fun lt!143836 () Unit!6031)

(assert (=> d!31134 (= lt!143820 lt!143836)))

(assert (=> d!31134 (isPrefixOf!0 (_2!4225 lt!143253) (_2!4225 lt!143253))))

(assert (=> d!31134 (= lt!143836 (lemmaIsPrefixRefl!0 (_2!4225 lt!143253)))))

(declare-fun lt!143825 () Unit!6031)

(declare-fun lt!143831 () Unit!6031)

(assert (=> d!31134 (= lt!143825 lt!143831)))

(assert (=> d!31134 (= lt!143831 (lemmaIsPrefixRefl!0 (_2!4225 lt!143253)))))

(declare-fun lt!143821 () Unit!6031)

(declare-fun lt!143824 () Unit!6031)

(assert (=> d!31134 (= lt!143821 lt!143824)))

(assert (=> d!31134 (isPrefixOf!0 lt!143829 lt!143829)))

(assert (=> d!31134 (= lt!143824 (lemmaIsPrefixRefl!0 lt!143829))))

(declare-fun lt!143834 () Unit!6031)

(declare-fun lt!143819 () Unit!6031)

(assert (=> d!31134 (= lt!143834 lt!143819)))

(assert (=> d!31134 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!31134 (= lt!143819 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!31134 (= lt!143829 (BitStream!3697 (buf!2462 (_2!4225 lt!143253)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> d!31134 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143253))))

(assert (=> d!31134 (= (reader!0 thiss!1288 (_2!4225 lt!143253)) lt!143830)))

(assert (= (and d!31134 c!6264) b!98938))

(assert (= (and d!31134 (not c!6264)) b!98939))

(assert (= (and d!31134 res!81159) b!98941))

(assert (= (and b!98941 res!81158) b!98940))

(assert (= (and b!98940 res!81157) b!98942))

(declare-fun m!144139 () Bool)

(assert (=> b!98940 m!144139))

(declare-fun m!144141 () Bool)

(assert (=> b!98942 m!144141))

(assert (=> b!98942 m!143297))

(assert (=> b!98942 m!142957))

(assert (=> d!31134 m!143007))

(declare-fun m!144143 () Bool)

(assert (=> d!31134 m!144143))

(declare-fun m!144145 () Bool)

(assert (=> d!31134 m!144145))

(declare-fun m!144147 () Bool)

(assert (=> d!31134 m!144147))

(declare-fun m!144149 () Bool)

(assert (=> d!31134 m!144149))

(declare-fun m!144151 () Bool)

(assert (=> d!31134 m!144151))

(declare-fun m!144153 () Bool)

(assert (=> d!31134 m!144153))

(assert (=> d!31134 m!143021))

(declare-fun m!144155 () Bool)

(assert (=> d!31134 m!144155))

(assert (=> d!31134 m!143289))

(declare-fun m!144157 () Bool)

(assert (=> d!31134 m!144157))

(assert (=> b!98938 m!142957))

(declare-fun m!144159 () Bool)

(assert (=> b!98938 m!144159))

(declare-fun m!144161 () Bool)

(assert (=> b!98938 m!144161))

(declare-fun m!144163 () Bool)

(assert (=> b!98941 m!144163))

(assert (=> b!98640 d!31134))

(declare-fun d!31136 () Bool)

(assert (=> d!31136 (= (onesLSBLong!0 (bvsub nBits!388 #b00000000000000000000000000000000)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!388 #b00000000000000000000000000000000)))))))

(assert (=> b!98640 d!31136))

(assert (=> b!98650 d!30864))

(assert (=> b!98650 d!30862))

(declare-fun d!31138 () Bool)

(assert (=> d!31138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143222) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) lt!143222))))

(declare-fun bs!7622 () Bool)

(assert (= bs!7622 d!31138))

(assert (=> bs!7622 m!143369))

(assert (=> b!98636 d!31138))

(declare-fun d!31140 () Bool)

(declare-fun res!81162 () Bool)

(declare-fun e!64701 () Bool)

(assert (=> d!31140 (=> res!81162 e!64701)))

(assert (=> d!31140 (= res!81162 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (=> d!31140 (= (arrayBitRangesEq!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))) e!64701)))

(declare-fun b!98943 () Bool)

(declare-fun e!64704 () Bool)

(declare-fun lt!143840 () tuple4!66)

(assert (=> b!98943 (= e!64704 (arrayRangesEq!34 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!142601)) (_1!4239 lt!143840) (_2!4239 lt!143840)))))

(declare-fun b!98944 () Bool)

(declare-fun e!64705 () Bool)

(declare-fun e!64702 () Bool)

(assert (=> b!98944 (= e!64705 e!64702)))

(declare-fun res!81160 () Bool)

(declare-fun lt!143838 () (_ BitVec 32))

(assert (=> b!98944 (= res!81160 (byteRangesEq!0 (select (arr!2704 (buf!2462 thiss!1288)) (_3!254 lt!143840)) (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_3!254 lt!143840)) lt!143838 #b00000000000000000000000000001000))))

(assert (=> b!98944 (=> (not res!81160) (not e!64702))))

(declare-fun b!98945 () Bool)

(declare-fun e!64703 () Bool)

(assert (=> b!98945 (= e!64701 e!64703)))

(declare-fun res!81161 () Bool)

(assert (=> b!98945 (=> (not res!81161) (not e!64703))))

(assert (=> b!98945 (= res!81161 e!64704)))

(declare-fun res!81163 () Bool)

(assert (=> b!98945 (=> res!81163 e!64704)))

(assert (=> b!98945 (= res!81163 (bvsge (_1!4239 lt!143840) (_2!4239 lt!143840)))))

(declare-fun lt!143839 () (_ BitVec 32))

(assert (=> b!98945 (= lt!143839 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98945 (= lt!143838 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98945 (= lt!143840 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(declare-fun b!98946 () Bool)

(declare-fun res!81164 () Bool)

(assert (=> b!98946 (= res!81164 (= lt!143839 #b00000000000000000000000000000000))))

(declare-fun e!64700 () Bool)

(assert (=> b!98946 (=> res!81164 e!64700)))

(assert (=> b!98946 (= e!64702 e!64700)))

(declare-fun b!98947 () Bool)

(assert (=> b!98947 (= e!64703 e!64705)))

(declare-fun c!6265 () Bool)

(assert (=> b!98947 (= c!6265 (= (_3!254 lt!143840) (_4!33 lt!143840)))))

(declare-fun b!98948 () Bool)

(declare-fun call!1245 () Bool)

(assert (=> b!98948 (= e!64705 call!1245)))

(declare-fun b!98949 () Bool)

(assert (=> b!98949 (= e!64700 call!1245)))

(declare-fun bm!1242 () Bool)

(assert (=> bm!1242 (= call!1245 (byteRangesEq!0 (ite c!6265 (select (arr!2704 (buf!2462 thiss!1288)) (_3!254 lt!143840)) (select (arr!2704 (buf!2462 thiss!1288)) (_4!33 lt!143840))) (ite c!6265 (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_3!254 lt!143840)) (select (arr!2704 (buf!2462 (_2!4225 lt!142601))) (_4!33 lt!143840))) (ite c!6265 lt!143838 #b00000000000000000000000000000000) lt!143839))))

(assert (= (and d!31140 (not res!81162)) b!98945))

(assert (= (and b!98945 (not res!81163)) b!98943))

(assert (= (and b!98945 res!81161) b!98947))

(assert (= (and b!98947 c!6265) b!98948))

(assert (= (and b!98947 (not c!6265)) b!98944))

(assert (= (and b!98944 res!81160) b!98946))

(assert (= (and b!98946 (not res!81164)) b!98949))

(assert (= (or b!98948 b!98949) bm!1242))

(declare-fun m!144165 () Bool)

(assert (=> b!98943 m!144165))

(declare-fun m!144167 () Bool)

(assert (=> b!98944 m!144167))

(declare-fun m!144169 () Bool)

(assert (=> b!98944 m!144169))

(assert (=> b!98944 m!144167))

(assert (=> b!98944 m!144169))

(declare-fun m!144171 () Bool)

(assert (=> b!98944 m!144171))

(assert (=> b!98945 m!142957))

(declare-fun m!144173 () Bool)

(assert (=> b!98945 m!144173))

(declare-fun m!144175 () Bool)

(assert (=> bm!1242 m!144175))

(declare-fun m!144177 () Bool)

(assert (=> bm!1242 m!144177))

(assert (=> bm!1242 m!144169))

(assert (=> bm!1242 m!144167))

(declare-fun m!144179 () Bool)

(assert (=> bm!1242 m!144179))

(assert (=> b!98652 d!31140))

(assert (=> b!98652 d!30864))

(declare-fun d!31142 () Bool)

(declare-fun res!81167 () Bool)

(declare-fun e!64706 () Bool)

(assert (=> d!31142 (=> (not res!81167) (not e!64706))))

(assert (=> d!31142 (= res!81167 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!143253)))))))

(assert (=> d!31142 (= (isPrefixOf!0 thiss!1288 (_2!4225 lt!143253)) e!64706)))

(declare-fun b!98950 () Bool)

(declare-fun res!81165 () Bool)

(assert (=> b!98950 (=> (not res!81165) (not e!64706))))

(assert (=> b!98950 (= res!81165 (bvsle (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143253))) (currentByte!4892 (_2!4225 lt!143253)) (currentBit!4887 (_2!4225 lt!143253)))))))

(declare-fun b!98951 () Bool)

(declare-fun e!64707 () Bool)

(assert (=> b!98951 (= e!64706 e!64707)))

(declare-fun res!81166 () Bool)

(assert (=> b!98951 (=> res!81166 e!64707)))

(assert (=> b!98951 (= res!81166 (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98952 () Bool)

(assert (=> b!98952 (= e!64707 (arrayBitRangesEq!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!143253)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (= (and d!31142 res!81167) b!98950))

(assert (= (and b!98950 res!81165) b!98951))

(assert (= (and b!98951 (not res!81166)) b!98952))

(assert (=> b!98950 m!142957))

(assert (=> b!98950 m!143297))

(assert (=> b!98952 m!142957))

(assert (=> b!98952 m!142957))

(declare-fun m!144181 () Bool)

(assert (=> b!98952 m!144181))

(assert (=> b!98637 d!31142))

(declare-fun d!31144 () Bool)

(assert (=> d!31144 (= (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 thiss!1288)))))))

(assert (=> d!30798 d!31144))

(declare-fun d!31146 () Bool)

(declare-fun e!64708 () Bool)

(assert (=> d!31146 e!64708))

(declare-fun res!81169 () Bool)

(assert (=> d!31146 (=> (not res!81169) (not e!64708))))

(declare-fun lt!143845 () (_ BitVec 64))

(declare-fun lt!143842 () (_ BitVec 64))

(declare-fun lt!143841 () (_ BitVec 64))

(assert (=> d!31146 (= res!81169 (= lt!143845 (bvsub lt!143842 lt!143841)))))

(assert (=> d!31146 (or (= (bvand lt!143842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143842 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143842 lt!143841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31146 (= lt!143841 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143244)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143244))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143244)))))))

(declare-fun lt!143843 () (_ BitVec 64))

(declare-fun lt!143846 () (_ BitVec 64))

(assert (=> d!31146 (= lt!143842 (bvmul lt!143843 lt!143846))))

(assert (=> d!31146 (or (= lt!143843 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143846 (bvsdiv (bvmul lt!143843 lt!143846) lt!143843)))))

(assert (=> d!31146 (= lt!143846 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31146 (= lt!143843 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143244)))))))

(assert (=> d!31146 (= lt!143845 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143244))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143244)))))))

(assert (=> d!31146 (invariant!0 (currentBit!4887 (_2!4225 lt!143244)) (currentByte!4892 (_2!4225 lt!143244)) (size!2111 (buf!2462 (_2!4225 lt!143244))))))

(assert (=> d!31146 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143244))) (currentByte!4892 (_2!4225 lt!143244)) (currentBit!4887 (_2!4225 lt!143244))) lt!143845)))

(declare-fun b!98953 () Bool)

(declare-fun res!81168 () Bool)

(assert (=> b!98953 (=> (not res!81168) (not e!64708))))

(assert (=> b!98953 (= res!81168 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143845))))

(declare-fun b!98954 () Bool)

(declare-fun lt!143844 () (_ BitVec 64))

(assert (=> b!98954 (= e!64708 (bvsle lt!143845 (bvmul lt!143844 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98954 (or (= lt!143844 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143844 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143844)))))

(assert (=> b!98954 (= lt!143844 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143244)))))))

(assert (= (and d!31146 res!81169) b!98953))

(assert (= (and b!98953 res!81168) b!98954))

(declare-fun m!144183 () Bool)

(assert (=> d!31146 m!144183))

(declare-fun m!144185 () Bool)

(assert (=> d!31146 m!144185))

(assert (=> b!98633 d!31146))

(assert (=> b!98633 d!30864))

(declare-fun d!31148 () Bool)

(assert (=> d!31148 (= (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 thiss!1288))) (and (bvsge (currentBit!4887 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4887 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4892 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4892 thiss!1288) (size!2111 (buf!2462 thiss!1288))) (and (= (currentBit!4887 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4892 thiss!1288) (size!2111 (buf!2462 thiss!1288)))))))))

(assert (=> d!30794 d!31148))

(declare-fun d!31150 () Bool)

(declare-fun e!64709 () Bool)

(assert (=> d!31150 e!64709))

(declare-fun res!81171 () Bool)

(assert (=> d!31150 (=> (not res!81171) (not e!64709))))

(declare-fun lt!143847 () (_ BitVec 64))

(declare-fun lt!143848 () (_ BitVec 64))

(declare-fun lt!143851 () (_ BitVec 64))

(assert (=> d!31150 (= res!81171 (= lt!143851 (bvsub lt!143848 lt!143847)))))

(assert (=> d!31150 (or (= (bvand lt!143848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143847 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143848 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143848 lt!143847) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31150 (= lt!143847 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143239)))) ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143239))) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143239)))))))

(declare-fun lt!143849 () (_ BitVec 64))

(declare-fun lt!143852 () (_ BitVec 64))

(assert (=> d!31150 (= lt!143848 (bvmul lt!143849 lt!143852))))

(assert (=> d!31150 (or (= lt!143849 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143852 (bvsdiv (bvmul lt!143849 lt!143852) lt!143849)))))

(assert (=> d!31150 (= lt!143852 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31150 (= lt!143849 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143239)))))))

(assert (=> d!31150 (= lt!143851 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143239))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143239)))))))

(assert (=> d!31150 (invariant!0 (currentBit!4887 (_1!4233 lt!143239)) (currentByte!4892 (_1!4233 lt!143239)) (size!2111 (buf!2462 (_1!4233 lt!143239))))))

(assert (=> d!31150 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143239))) (currentByte!4892 (_1!4233 lt!143239)) (currentBit!4887 (_1!4233 lt!143239))) lt!143851)))

(declare-fun b!98955 () Bool)

(declare-fun res!81170 () Bool)

(assert (=> b!98955 (=> (not res!81170) (not e!64709))))

(assert (=> b!98955 (= res!81170 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143851))))

(declare-fun b!98956 () Bool)

(declare-fun lt!143850 () (_ BitVec 64))

(assert (=> b!98956 (= e!64709 (bvsle lt!143851 (bvmul lt!143850 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98956 (or (= lt!143850 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143850 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143850)))))

(assert (=> b!98956 (= lt!143850 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143239)))))))

(assert (= (and d!31150 res!81171) b!98955))

(assert (= (and b!98955 res!81170) b!98956))

(declare-fun m!144187 () Bool)

(assert (=> d!31150 m!144187))

(declare-fun m!144189 () Bool)

(assert (=> d!31150 m!144189))

(assert (=> b!98634 d!31150))

(assert (=> b!98634 d!31146))

(declare-fun d!31152 () Bool)

(declare-fun e!64710 () Bool)

(assert (=> d!31152 e!64710))

(declare-fun res!81173 () Bool)

(assert (=> d!31152 (=> (not res!81173) (not e!64710))))

(declare-fun lt!143853 () (_ BitVec 64))

(declare-fun lt!143854 () (_ BitVec 64))

(declare-fun lt!143857 () (_ BitVec 64))

(assert (=> d!31152 (= res!81173 (= lt!143857 (bvsub lt!143854 lt!143853)))))

(assert (=> d!31152 (or (= (bvand lt!143854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143854 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143854 lt!143853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31152 (= lt!143853 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143253))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143253)))))))

(declare-fun lt!143855 () (_ BitVec 64))

(declare-fun lt!143858 () (_ BitVec 64))

(assert (=> d!31152 (= lt!143854 (bvmul lt!143855 lt!143858))))

(assert (=> d!31152 (or (= lt!143855 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143858 (bvsdiv (bvmul lt!143855 lt!143858) lt!143855)))))

(assert (=> d!31152 (= lt!143858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31152 (= lt!143855 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))))))

(assert (=> d!31152 (= lt!143857 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143253))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143253)))))))

(assert (=> d!31152 (invariant!0 (currentBit!4887 (_2!4225 lt!143253)) (currentByte!4892 (_2!4225 lt!143253)) (size!2111 (buf!2462 (_2!4225 lt!143253))))))

(assert (=> d!31152 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143253))) (currentByte!4892 (_2!4225 lt!143253)) (currentBit!4887 (_2!4225 lt!143253))) lt!143857)))

(declare-fun b!98957 () Bool)

(declare-fun res!81172 () Bool)

(assert (=> b!98957 (=> (not res!81172) (not e!64710))))

(assert (=> b!98957 (= res!81172 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143857))))

(declare-fun b!98958 () Bool)

(declare-fun lt!143856 () (_ BitVec 64))

(assert (=> b!98958 (= e!64710 (bvsle lt!143857 (bvmul lt!143856 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98958 (or (= lt!143856 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143856 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143856)))))

(assert (=> b!98958 (= lt!143856 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143253)))))))

(assert (= (and d!31152 res!81173) b!98957))

(assert (= (and b!98957 res!81172) b!98958))

(declare-fun m!144191 () Bool)

(assert (=> d!31152 m!144191))

(declare-fun m!144193 () Bool)

(assert (=> d!31152 m!144193))

(assert (=> b!98632 d!31152))

(assert (=> b!98632 d!30864))

(declare-fun d!31154 () Bool)

(declare-fun res!81176 () Bool)

(declare-fun e!64711 () Bool)

(assert (=> d!31154 (=> (not res!81176) (not e!64711))))

(assert (=> d!31154 (= res!81176 (= (size!2111 (buf!2462 (ite c!6242 thiss!1288 lt!143242))) (size!2111 (buf!2462 (ite c!6242 (_2!4225 lt!143244) lt!143242)))))))

(assert (=> d!31154 (= (isPrefixOf!0 (ite c!6242 thiss!1288 lt!143242) (ite c!6242 (_2!4225 lt!143244) lt!143242)) e!64711)))

(declare-fun b!98959 () Bool)

(declare-fun res!81174 () Bool)

(assert (=> b!98959 (=> (not res!81174) (not e!64711))))

(assert (=> b!98959 (= res!81174 (bvsle (bitIndex!0 (size!2111 (buf!2462 (ite c!6242 thiss!1288 lt!143242))) (currentByte!4892 (ite c!6242 thiss!1288 lt!143242)) (currentBit!4887 (ite c!6242 thiss!1288 lt!143242))) (bitIndex!0 (size!2111 (buf!2462 (ite c!6242 (_2!4225 lt!143244) lt!143242))) (currentByte!4892 (ite c!6242 (_2!4225 lt!143244) lt!143242)) (currentBit!4887 (ite c!6242 (_2!4225 lt!143244) lt!143242)))))))

(declare-fun b!98960 () Bool)

(declare-fun e!64712 () Bool)

(assert (=> b!98960 (= e!64711 e!64712)))

(declare-fun res!81175 () Bool)

(assert (=> b!98960 (=> res!81175 e!64712)))

(assert (=> b!98960 (= res!81175 (= (size!2111 (buf!2462 (ite c!6242 thiss!1288 lt!143242))) #b00000000000000000000000000000000))))

(declare-fun b!98961 () Bool)

(assert (=> b!98961 (= e!64712 (arrayBitRangesEq!0 (buf!2462 (ite c!6242 thiss!1288 lt!143242)) (buf!2462 (ite c!6242 (_2!4225 lt!143244) lt!143242)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 (ite c!6242 thiss!1288 lt!143242))) (currentByte!4892 (ite c!6242 thiss!1288 lt!143242)) (currentBit!4887 (ite c!6242 thiss!1288 lt!143242)))))))

(assert (= (and d!31154 res!81176) b!98959))

(assert (= (and b!98959 res!81174) b!98960))

(assert (= (and b!98960 (not res!81175)) b!98961))

(declare-fun m!144195 () Bool)

(assert (=> b!98959 m!144195))

(declare-fun m!144197 () Bool)

(assert (=> b!98959 m!144197))

(assert (=> b!98961 m!144195))

(assert (=> b!98961 m!144195))

(declare-fun m!144199 () Bool)

(assert (=> b!98961 m!144199))

(assert (=> bm!1228 d!31154))

(declare-fun d!31156 () Bool)

(assert (=> d!31156 (= (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) (bvsub (bvmul ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 thiss!1288)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 thiss!1288)))))))

(assert (=> d!30864 d!31156))

(assert (=> d!30864 d!31148))

(declare-fun d!31158 () Bool)

(assert (=> d!31158 (= (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!142601))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!142601)))) (bvsub (bvmul ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!142601))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!142601))))))))

(assert (=> d!30862 d!31158))

(declare-fun d!31160 () Bool)

(assert (=> d!31160 (= (invariant!0 (currentBit!4887 (_2!4225 lt!142601)) (currentByte!4892 (_2!4225 lt!142601)) (size!2111 (buf!2462 (_2!4225 lt!142601)))) (and (bvsge (currentBit!4887 (_2!4225 lt!142601)) #b00000000000000000000000000000000) (bvslt (currentBit!4887 (_2!4225 lt!142601)) #b00000000000000000000000000001000) (bvsge (currentByte!4892 (_2!4225 lt!142601)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4892 (_2!4225 lt!142601)) (size!2111 (buf!2462 (_2!4225 lt!142601)))) (and (= (currentBit!4887 (_2!4225 lt!142601)) #b00000000000000000000000000000000) (= (currentByte!4892 (_2!4225 lt!142601)) (size!2111 (buf!2462 (_2!4225 lt!142601))))))))))

(assert (=> d!30862 d!31160))

(assert (=> d!30856 d!31156))

(declare-fun d!31162 () Bool)

(declare-fun res!81179 () Bool)

(declare-fun e!64713 () Bool)

(assert (=> d!31162 (=> (not res!81179) (not e!64713))))

(assert (=> d!31162 (= res!81179 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!143257)))))))

(assert (=> d!31162 (= (isPrefixOf!0 thiss!1288 (_2!4225 lt!143257)) e!64713)))

(declare-fun b!98962 () Bool)

(declare-fun res!81177 () Bool)

(assert (=> b!98962 (=> (not res!81177) (not e!64713))))

(assert (=> b!98962 (= res!81177 (bvsle (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))))))

(declare-fun b!98963 () Bool)

(declare-fun e!64714 () Bool)

(assert (=> b!98963 (= e!64713 e!64714)))

(declare-fun res!81178 () Bool)

(assert (=> b!98963 (=> res!81178 e!64714)))

(assert (=> b!98963 (= res!81178 (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!98964 () Bool)

(assert (=> b!98964 (= e!64714 (arrayBitRangesEq!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!143257)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (= (and d!31162 res!81179) b!98962))

(assert (= (and b!98962 res!81177) b!98963))

(assert (= (and b!98963 (not res!81178)) b!98964))

(assert (=> b!98962 m!142957))

(assert (=> b!98962 m!143353))

(assert (=> b!98964 m!142957))

(assert (=> b!98964 m!142957))

(declare-fun m!144201 () Bool)

(assert (=> b!98964 m!144201))

(assert (=> b!98643 d!31162))

(declare-fun d!31164 () Bool)

(declare-fun e!64717 () Bool)

(assert (=> d!31164 e!64717))

(declare-fun res!81182 () Bool)

(assert (=> d!31164 (=> (not res!81182) (not e!64717))))

(declare-fun lt!143864 () (_ BitVec 64))

(declare-fun lt!143863 () BitStream!3696)

(assert (=> d!31164 (= res!81182 (= (bvadd lt!143864 (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) (bitIndex!0 (size!2111 (buf!2462 lt!143863)) (currentByte!4892 lt!143863) (currentBit!4887 lt!143863))))))

(assert (=> d!31164 (or (not (= (bvand lt!143864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143864 (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31164 (= lt!143864 (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!143238))) (currentByte!4892 (_2!4223 lt!143238)) (currentBit!4887 (_2!4223 lt!143238))))))

(declare-fun moveBitIndex!0 (BitStream!3696 (_ BitVec 64)) tuple2!7946)

(assert (=> d!31164 (= lt!143863 (_2!4225 (moveBitIndex!0 (_2!4223 lt!143238) (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!3696 (_ BitVec 64)) Bool)

(assert (=> d!31164 (moveBitIndexPrecond!0 (_2!4223 lt!143238) (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))))))

(assert (=> d!31164 (= (withMovedBitIndex!0 (_2!4223 lt!143238) (bvsub (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) lt!143863)))

(declare-fun b!98967 () Bool)

(assert (=> b!98967 (= e!64717 (= (size!2111 (buf!2462 (_2!4223 lt!143238))) (size!2111 (buf!2462 lt!143863))))))

(assert (= (and d!31164 res!81182) b!98967))

(declare-fun m!144203 () Bool)

(assert (=> d!31164 m!144203))

(declare-fun m!144205 () Bool)

(assert (=> d!31164 m!144205))

(declare-fun m!144207 () Bool)

(assert (=> d!31164 m!144207))

(declare-fun m!144209 () Bool)

(assert (=> d!31164 m!144209))

(assert (=> b!98643 d!31164))

(declare-fun b!98968 () Bool)

(declare-fun res!81191 () Bool)

(declare-fun call!1246 () Bool)

(assert (=> b!98968 (= res!81191 call!1246)))

(declare-fun e!64718 () Bool)

(assert (=> b!98968 (=> (not res!81191) (not e!64718))))

(declare-fun d!31166 () Bool)

(declare-fun e!64719 () Bool)

(assert (=> d!31166 e!64719))

(declare-fun res!81185 () Bool)

(assert (=> d!31166 (=> (not res!81185) (not e!64719))))

(declare-fun lt!143896 () tuple2!7946)

(assert (=> d!31166 (= res!81185 (= (size!2111 (buf!2462 (_2!4225 lt!143263))) (size!2111 (buf!2462 (_2!4225 lt!143896)))))))

(declare-fun e!64722 () tuple2!7946)

(assert (=> d!31166 (= lt!143896 e!64722)))

(declare-fun c!6267 () Bool)

(assert (=> d!31166 (= c!6267 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388))))

(assert (=> d!31166 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) nBits!388) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!31166 (= (appendNLeastSignificantBitsLoop!0 (_2!4225 lt!143263) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!143896)))

(declare-fun b!98969 () Bool)

(declare-fun res!81183 () Bool)

(assert (=> b!98969 (=> (not res!81183) (not e!64719))))

(declare-fun lt!143866 () (_ BitVec 64))

(declare-fun lt!143869 () (_ BitVec 64))

(assert (=> b!98969 (= res!81183 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143896))) (currentByte!4892 (_2!4225 lt!143896)) (currentBit!4887 (_2!4225 lt!143896))) (bvadd lt!143869 lt!143866)))))

(assert (=> b!98969 (or (not (= (bvand lt!143869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143866 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143869 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143869 lt!143866) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98969 (= lt!143866 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98969 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98969 (= lt!143869 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))))))

(declare-fun bm!1243 () Bool)

(declare-fun lt!143887 () tuple2!7946)

(declare-fun lt!143885 () BitStream!3696)

(assert (=> bm!1243 (= call!1246 (isPrefixOf!0 (ite c!6267 (_2!4225 lt!143263) lt!143885) (ite c!6267 (_2!4225 lt!143887) lt!143885)))))

(declare-fun b!98970 () Bool)

(declare-fun res!81188 () Bool)

(assert (=> b!98970 (= res!81188 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143887))) (currentByte!4892 (_2!4225 lt!143887)) (currentBit!4887 (_2!4225 lt!143887))) (bvadd (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!98970 (=> (not res!81188) (not e!64718))))

(declare-fun b!98971 () Bool)

(declare-fun e!64723 () Bool)

(declare-fun lt!143882 () tuple2!7962)

(assert (=> b!98971 (= e!64723 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143882))) (currentByte!4892 (_1!4233 lt!143882)) (currentBit!4887 (_1!4233 lt!143882))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143887))) (currentByte!4892 (_2!4225 lt!143887)) (currentBit!4887 (_2!4225 lt!143887)))))))

(declare-fun b!98972 () Bool)

(declare-fun e!64720 () (_ BitVec 64))

(assert (=> b!98972 (= e!64720 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun b!98973 () Bool)

(declare-fun e!64724 () Bool)

(declare-fun lt!143865 () (_ BitVec 64))

(assert (=> b!98973 (= e!64724 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143263)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143865))))

(declare-fun b!98974 () Bool)

(declare-fun res!81187 () Bool)

(assert (=> b!98974 (=> (not res!81187) (not e!64719))))

(assert (=> b!98974 (= res!81187 (isPrefixOf!0 (_2!4225 lt!143263) (_2!4225 lt!143896)))))

(declare-fun b!98975 () Bool)

(declare-fun lt!143903 () Unit!6031)

(assert (=> b!98975 (= e!64722 (tuple2!7947 lt!143903 (_2!4225 lt!143263)))))

(assert (=> b!98975 (= lt!143885 (_2!4225 lt!143263))))

(assert (=> b!98975 (= lt!143903 (lemmaIsPrefixRefl!0 lt!143885))))

(assert (=> b!98975 call!1246))

(declare-fun b!98976 () Bool)

(declare-fun e!64721 () Bool)

(declare-fun lt!143890 () tuple2!7962)

(declare-fun lt!143904 () tuple2!7962)

(assert (=> b!98976 (= e!64721 (= (_2!4233 lt!143890) (_2!4233 lt!143904)))))

(declare-fun lt!143875 () tuple2!7942)

(declare-fun b!98977 () Bool)

(declare-fun lt!143909 () tuple2!7944)

(assert (=> b!98977 (= e!64719 (and (= (_2!4224 lt!143909) v!196) (= (_1!4224 lt!143909) (_2!4223 lt!143875))))))

(declare-fun lt!143871 () (_ BitVec 64))

(assert (=> b!98977 (= lt!143909 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143875) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143871))))

(declare-fun lt!143874 () Unit!6031)

(declare-fun lt!143873 () Unit!6031)

(assert (=> b!98977 (= lt!143874 lt!143873)))

(assert (=> b!98977 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143896)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143865)))

(assert (=> b!98977 (= lt!143873 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4225 lt!143263) (buf!2462 (_2!4225 lt!143896)) lt!143865))))

(assert (=> b!98977 e!64724))

(declare-fun res!81184 () Bool)

(assert (=> b!98977 (=> (not res!81184) (not e!64724))))

(assert (=> b!98977 (= res!81184 (and (= (size!2111 (buf!2462 (_2!4225 lt!143263))) (size!2111 (buf!2462 (_2!4225 lt!143896)))) (bvsge lt!143865 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98977 (= lt!143865 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!98977 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98977 (= lt!143871 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(assert (=> b!98977 (or (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!388 #b10000000000000000000000000000000) (bvand (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!98977 (= lt!143875 (reader!0 (_2!4225 lt!143263) (_2!4225 lt!143896)))))

(declare-fun b!98978 () Bool)

(assert (=> b!98978 (= lt!143882 (readBitPure!0 (readerFrom!0 (_2!4225 lt!143887) (currentBit!4887 (_2!4225 lt!143263)) (currentByte!4892 (_2!4225 lt!143263)))))))

(declare-fun res!81189 () Bool)

(declare-fun lt!143868 () Bool)

(assert (=> b!98978 (= res!81189 (and (= (_2!4233 lt!143882) lt!143868) (= (_1!4233 lt!143882) (_2!4225 lt!143887))))))

(assert (=> b!98978 (=> (not res!81189) (not e!64723))))

(assert (=> b!98978 (= e!64718 e!64723)))

(declare-fun b!98979 () Bool)

(assert (=> b!98979 (= e!64720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!98980 () Bool)

(declare-fun lt!143900 () tuple2!7946)

(declare-fun Unit!6075 () Unit!6031)

(assert (=> b!98980 (= e!64722 (tuple2!7947 Unit!6075 (_2!4225 lt!143900)))))

(assert (=> b!98980 (= lt!143868 (not (= (bvand v!196 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98980 (= lt!143887 (appendBit!0 (_2!4225 lt!143263) lt!143868))))

(declare-fun res!81190 () Bool)

(assert (=> b!98980 (= res!81190 (= (size!2111 (buf!2462 (_2!4225 lt!143263))) (size!2111 (buf!2462 (_2!4225 lt!143887)))))))

(assert (=> b!98980 (=> (not res!81190) (not e!64718))))

(assert (=> b!98980 e!64718))

(declare-fun lt!143906 () tuple2!7946)

(assert (=> b!98980 (= lt!143906 lt!143887)))

(assert (=> b!98980 (= lt!143900 (appendNLeastSignificantBitsLoop!0 (_2!4225 lt!143906) v!196 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!143878 () Unit!6031)

(assert (=> b!98980 (= lt!143878 (lemmaIsPrefixTransitive!0 (_2!4225 lt!143263) (_2!4225 lt!143906) (_2!4225 lt!143900)))))

(assert (=> b!98980 (isPrefixOf!0 (_2!4225 lt!143263) (_2!4225 lt!143900))))

(declare-fun lt!143870 () Unit!6031)

(assert (=> b!98980 (= lt!143870 lt!143878)))

(assert (=> b!98980 (invariant!0 (currentBit!4887 (_2!4225 lt!143263)) (currentByte!4892 (_2!4225 lt!143263)) (size!2111 (buf!2462 (_2!4225 lt!143906))))))

(declare-fun lt!143886 () BitStream!3696)

(assert (=> b!98980 (= lt!143886 (BitStream!3697 (buf!2462 (_2!4225 lt!143906)) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))))))

(assert (=> b!98980 (invariant!0 (currentBit!4887 lt!143886) (currentByte!4892 lt!143886) (size!2111 (buf!2462 (_2!4225 lt!143900))))))

(declare-fun lt!143877 () BitStream!3696)

(assert (=> b!98980 (= lt!143877 (BitStream!3697 (buf!2462 (_2!4225 lt!143900)) (currentByte!4892 lt!143886) (currentBit!4887 lt!143886)))))

(assert (=> b!98980 (= lt!143890 (readBitPure!0 lt!143886))))

(assert (=> b!98980 (= lt!143904 (readBitPure!0 lt!143877))))

(declare-fun lt!143895 () Unit!6031)

(assert (=> b!98980 (= lt!143895 (readBitPrefixLemma!0 lt!143886 (_2!4225 lt!143900)))))

(declare-fun res!81186 () Bool)

(assert (=> b!98980 (= res!81186 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143890))) (currentByte!4892 (_1!4233 lt!143890)) (currentBit!4887 (_1!4233 lt!143890))) (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143904))) (currentByte!4892 (_1!4233 lt!143904)) (currentBit!4887 (_1!4233 lt!143904)))))))

(assert (=> b!98980 (=> (not res!81186) (not e!64721))))

(assert (=> b!98980 e!64721))

(declare-fun lt!143905 () Unit!6031)

(assert (=> b!98980 (= lt!143905 lt!143895)))

(declare-fun lt!143881 () tuple2!7942)

(assert (=> b!98980 (= lt!143881 (reader!0 (_2!4225 lt!143263) (_2!4225 lt!143900)))))

(declare-fun lt!143897 () tuple2!7942)

(assert (=> b!98980 (= lt!143897 (reader!0 (_2!4225 lt!143906) (_2!4225 lt!143900)))))

(declare-fun lt!143899 () tuple2!7962)

(assert (=> b!98980 (= lt!143899 (readBitPure!0 (_1!4223 lt!143881)))))

(assert (=> b!98980 (= (_2!4233 lt!143899) lt!143868)))

(declare-fun lt!143908 () Unit!6031)

(declare-fun Unit!6076 () Unit!6031)

(assert (=> b!98980 (= lt!143908 Unit!6076)))

(declare-fun lt!143902 () (_ BitVec 64))

(assert (=> b!98980 (= lt!143902 (bvand v!196 (bvnot (onesLSBLong!0 (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))))

(declare-fun lt!143876 () (_ BitVec 64))

(assert (=> b!98980 (= lt!143876 ((_ sign_extend 32) (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun lt!143867 () Unit!6031)

(assert (=> b!98980 (= lt!143867 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4225 lt!143263) (buf!2462 (_2!4225 lt!143900)) lt!143876))))

(assert (=> b!98980 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143900)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143876)))

(declare-fun lt!143892 () Unit!6031)

(assert (=> b!98980 (= lt!143892 lt!143867)))

(declare-fun lt!143898 () tuple2!7944)

(assert (=> b!98980 (= lt!143898 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143881) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143902))))

(declare-fun lt!143893 () (_ BitVec 64))

(assert (=> b!98980 (= lt!143893 ((_ sign_extend 32) (bvsub (bvsub nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(declare-fun lt!143891 () Unit!6031)

(assert (=> b!98980 (= lt!143891 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4225 lt!143906) (buf!2462 (_2!4225 lt!143900)) lt!143893))))

(assert (=> b!98980 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143900)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143906))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143906))) lt!143893)))

(declare-fun lt!143884 () Unit!6031)

(assert (=> b!98980 (= lt!143884 lt!143891)))

(declare-fun lt!143901 () tuple2!7944)

(assert (=> b!98980 (= lt!143901 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143897) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143902 (ite (_2!4233 lt!143899) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!143889 () tuple2!7944)

(assert (=> b!98980 (= lt!143889 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143881) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143902))))

(declare-fun c!6266 () Bool)

(assert (=> b!98980 (= c!6266 (_2!4233 (readBitPure!0 (_1!4223 lt!143881))))))

(declare-fun lt!143879 () tuple2!7944)

(assert (=> b!98980 (= lt!143879 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4223 lt!143881) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor lt!143902 e!64720)))))

(declare-fun lt!143880 () Unit!6031)

(assert (=> b!98980 (= lt!143880 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4223 lt!143881) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!143902))))

(assert (=> b!98980 (and (= (_2!4224 lt!143889) (_2!4224 lt!143879)) (= (_1!4224 lt!143889) (_1!4224 lt!143879)))))

(declare-fun lt!143883 () Unit!6031)

(assert (=> b!98980 (= lt!143883 lt!143880)))

(assert (=> b!98980 (= (_1!4223 lt!143881) (withMovedBitIndex!0 (_2!4223 lt!143881) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143900))) (currentByte!4892 (_2!4225 lt!143900)) (currentBit!4887 (_2!4225 lt!143900))))))))

(declare-fun lt!143872 () Unit!6031)

(declare-fun Unit!6077 () Unit!6031)

(assert (=> b!98980 (= lt!143872 Unit!6077)))

(assert (=> b!98980 (= (_1!4223 lt!143897) (withMovedBitIndex!0 (_2!4223 lt!143897) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143906))) (currentByte!4892 (_2!4225 lt!143906)) (currentBit!4887 (_2!4225 lt!143906))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143900))) (currentByte!4892 (_2!4225 lt!143900)) (currentBit!4887 (_2!4225 lt!143900))))))))

(declare-fun lt!143907 () Unit!6031)

(declare-fun Unit!6078 () Unit!6031)

(assert (=> b!98980 (= lt!143907 Unit!6078)))

(assert (=> b!98980 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143906))) (currentByte!4892 (_2!4225 lt!143906)) (currentBit!4887 (_2!4225 lt!143906))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!143888 () Unit!6031)

(declare-fun Unit!6079 () Unit!6031)

(assert (=> b!98980 (= lt!143888 Unit!6079)))

(assert (=> b!98980 (= (_2!4224 lt!143898) (_2!4224 lt!143901))))

(declare-fun lt!143894 () Unit!6031)

(declare-fun Unit!6080 () Unit!6031)

(assert (=> b!98980 (= lt!143894 Unit!6080)))

(assert (=> b!98980 (= (_1!4224 lt!143898) (_2!4223 lt!143881))))

(assert (= (and d!31166 c!6267) b!98980))

(assert (= (and d!31166 (not c!6267)) b!98975))

(assert (= (and b!98980 res!81190) b!98970))

(assert (= (and b!98970 res!81188) b!98968))

(assert (= (and b!98968 res!81191) b!98978))

(assert (= (and b!98978 res!81189) b!98971))

(assert (= (and b!98980 res!81186) b!98976))

(assert (= (and b!98980 c!6266) b!98972))

(assert (= (and b!98980 (not c!6266)) b!98979))

(assert (= (or b!98968 b!98975) bm!1243))

(assert (= (and d!31166 res!81185) b!98969))

(assert (= (and b!98969 res!81183) b!98974))

(assert (= (and b!98974 res!81187) b!98977))

(assert (= (and b!98977 res!81184) b!98973))

(declare-fun m!144211 () Bool)

(assert (=> b!98975 m!144211))

(declare-fun m!144213 () Bool)

(assert (=> b!98974 m!144213))

(declare-fun m!144215 () Bool)

(assert (=> b!98970 m!144215))

(assert (=> b!98970 m!143349))

(declare-fun m!144217 () Bool)

(assert (=> bm!1243 m!144217))

(declare-fun m!144219 () Bool)

(assert (=> b!98971 m!144219))

(assert (=> b!98971 m!144215))

(declare-fun m!144221 () Bool)

(assert (=> b!98969 m!144221))

(assert (=> b!98969 m!143349))

(declare-fun m!144223 () Bool)

(assert (=> b!98977 m!144223))

(declare-fun m!144225 () Bool)

(assert (=> b!98977 m!144225))

(declare-fun m!144227 () Bool)

(assert (=> b!98977 m!144227))

(declare-fun m!144229 () Bool)

(assert (=> b!98977 m!144229))

(declare-fun m!144231 () Bool)

(assert (=> b!98977 m!144231))

(declare-fun m!144233 () Bool)

(assert (=> b!98978 m!144233))

(assert (=> b!98978 m!144233))

(declare-fun m!144235 () Bool)

(assert (=> b!98978 m!144235))

(declare-fun m!144237 () Bool)

(assert (=> b!98980 m!144237))

(declare-fun m!144239 () Bool)

(assert (=> b!98980 m!144239))

(declare-fun m!144241 () Bool)

(assert (=> b!98980 m!144241))

(declare-fun m!144243 () Bool)

(assert (=> b!98980 m!144243))

(declare-fun m!144245 () Bool)

(assert (=> b!98980 m!144245))

(declare-fun m!144247 () Bool)

(assert (=> b!98980 m!144247))

(declare-fun m!144249 () Bool)

(assert (=> b!98980 m!144249))

(declare-fun m!144251 () Bool)

(assert (=> b!98980 m!144251))

(declare-fun m!144253 () Bool)

(assert (=> b!98980 m!144253))

(assert (=> b!98980 m!144227))

(declare-fun m!144255 () Bool)

(assert (=> b!98980 m!144255))

(declare-fun m!144257 () Bool)

(assert (=> b!98980 m!144257))

(declare-fun m!144259 () Bool)

(assert (=> b!98980 m!144259))

(declare-fun m!144261 () Bool)

(assert (=> b!98980 m!144261))

(declare-fun m!144263 () Bool)

(assert (=> b!98980 m!144263))

(declare-fun m!144265 () Bool)

(assert (=> b!98980 m!144265))

(declare-fun m!144267 () Bool)

(assert (=> b!98980 m!144267))

(declare-fun m!144269 () Bool)

(assert (=> b!98980 m!144269))

(declare-fun m!144271 () Bool)

(assert (=> b!98980 m!144271))

(declare-fun m!144273 () Bool)

(assert (=> b!98980 m!144273))

(declare-fun m!144275 () Bool)

(assert (=> b!98980 m!144275))

(declare-fun m!144277 () Bool)

(assert (=> b!98980 m!144277))

(declare-fun m!144279 () Bool)

(assert (=> b!98980 m!144279))

(declare-fun m!144281 () Bool)

(assert (=> b!98980 m!144281))

(assert (=> b!98980 m!144269))

(declare-fun m!144283 () Bool)

(assert (=> b!98980 m!144283))

(assert (=> b!98980 m!143349))

(declare-fun m!144285 () Bool)

(assert (=> b!98980 m!144285))

(declare-fun m!144287 () Bool)

(assert (=> b!98980 m!144287))

(declare-fun m!144289 () Bool)

(assert (=> b!98980 m!144289))

(declare-fun m!144291 () Bool)

(assert (=> b!98973 m!144291))

(assert (=> b!98643 d!31166))

(declare-fun d!31168 () Bool)

(declare-datatypes ((tuple2!7970 0))(
  ( (tuple2!7971 (_1!4240 Bool) (_2!4240 BitStream!3696)) )
))
(declare-fun lt!143912 () tuple2!7970)

(declare-fun readBit!0 (BitStream!3696) tuple2!7970)

(assert (=> d!31168 (= lt!143912 (readBit!0 (_1!4223 lt!143238)))))

(assert (=> d!31168 (= (readBitPure!0 (_1!4223 lt!143238)) (tuple2!7963 (_2!4240 lt!143912) (_1!4240 lt!143912)))))

(declare-fun bs!7623 () Bool)

(assert (= bs!7623 d!31168))

(declare-fun m!144293 () Bool)

(assert (=> bs!7623 m!144293))

(assert (=> b!98643 d!31168))

(declare-fun d!31170 () Bool)

(assert (=> d!31170 (= (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 (_2!4225 lt!143263)))) (and (bvsge (currentBit!4887 thiss!1288) #b00000000000000000000000000000000) (bvslt (currentBit!4887 thiss!1288) #b00000000000000000000000000001000) (bvsge (currentByte!4892 thiss!1288) #b00000000000000000000000000000000) (or (bvslt (currentByte!4892 thiss!1288) (size!2111 (buf!2462 (_2!4225 lt!143263)))) (and (= (currentBit!4887 thiss!1288) #b00000000000000000000000000000000) (= (currentByte!4892 thiss!1288) (size!2111 (buf!2462 (_2!4225 lt!143263))))))))))

(assert (=> b!98643 d!31170))

(declare-fun d!31172 () Bool)

(declare-fun e!64725 () Bool)

(assert (=> d!31172 e!64725))

(declare-fun res!81193 () Bool)

(assert (=> d!31172 (=> (not res!81193) (not e!64725))))

(declare-fun lt!143917 () (_ BitVec 64))

(declare-fun lt!143914 () (_ BitVec 64))

(declare-fun lt!143913 () (_ BitVec 64))

(assert (=> d!31172 (= res!81193 (= lt!143917 (bvsub lt!143914 lt!143913)))))

(assert (=> d!31172 (or (= (bvand lt!143914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143913 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143914 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143914 lt!143913) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31172 (= lt!143913 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143247)))) ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143247))) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143247)))))))

(declare-fun lt!143915 () (_ BitVec 64))

(declare-fun lt!143918 () (_ BitVec 64))

(assert (=> d!31172 (= lt!143914 (bvmul lt!143915 lt!143918))))

(assert (=> d!31172 (or (= lt!143915 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143918 (bvsdiv (bvmul lt!143915 lt!143918) lt!143915)))))

(assert (=> d!31172 (= lt!143918 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31172 (= lt!143915 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143247)))))))

(assert (=> d!31172 (= lt!143917 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143247))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143247)))))))

(assert (=> d!31172 (invariant!0 (currentBit!4887 (_1!4233 lt!143247)) (currentByte!4892 (_1!4233 lt!143247)) (size!2111 (buf!2462 (_1!4233 lt!143247))))))

(assert (=> d!31172 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143247))) (currentByte!4892 (_1!4233 lt!143247)) (currentBit!4887 (_1!4233 lt!143247))) lt!143917)))

(declare-fun b!98981 () Bool)

(declare-fun res!81192 () Bool)

(assert (=> b!98981 (=> (not res!81192) (not e!64725))))

(assert (=> b!98981 (= res!81192 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143917))))

(declare-fun b!98982 () Bool)

(declare-fun lt!143916 () (_ BitVec 64))

(assert (=> b!98982 (= e!64725 (bvsle lt!143917 (bvmul lt!143916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98982 (or (= lt!143916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143916)))))

(assert (=> b!98982 (= lt!143916 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143247)))))))

(assert (= (and d!31172 res!81193) b!98981))

(assert (= (and b!98981 res!81192) b!98982))

(declare-fun m!144295 () Bool)

(assert (=> d!31172 m!144295))

(declare-fun m!144297 () Bool)

(assert (=> d!31172 m!144297))

(assert (=> b!98643 d!31172))

(declare-fun d!31174 () Bool)

(assert (=> d!31174 (= (invariant!0 (currentBit!4887 lt!143243) (currentByte!4892 lt!143243) (size!2111 (buf!2462 (_2!4225 lt!143257)))) (and (bvsge (currentBit!4887 lt!143243) #b00000000000000000000000000000000) (bvslt (currentBit!4887 lt!143243) #b00000000000000000000000000001000) (bvsge (currentByte!4892 lt!143243) #b00000000000000000000000000000000) (or (bvslt (currentByte!4892 lt!143243) (size!2111 (buf!2462 (_2!4225 lt!143257)))) (and (= (currentBit!4887 lt!143243) #b00000000000000000000000000000000) (= (currentByte!4892 lt!143243) (size!2111 (buf!2462 (_2!4225 lt!143257))))))))))

(assert (=> b!98643 d!31174))

(declare-fun d!31176 () Bool)

(assert (=> d!31176 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143233) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288))) lt!143233))))

(declare-fun bs!7624 () Bool)

(assert (= bs!7624 d!31176))

(declare-fun m!144299 () Bool)

(assert (=> bs!7624 m!144299))

(assert (=> b!98643 d!31176))

(declare-fun d!31178 () Bool)

(declare-fun e!64726 () Bool)

(assert (=> d!31178 e!64726))

(declare-fun res!81195 () Bool)

(assert (=> d!31178 (=> (not res!81195) (not e!64726))))

(declare-fun lt!143919 () (_ BitVec 64))

(declare-fun lt!143920 () (_ BitVec 64))

(declare-fun lt!143923 () (_ BitVec 64))

(assert (=> d!31178 (= res!81195 (= lt!143923 (bvsub lt!143920 lt!143919)))))

(assert (=> d!31178 (or (= (bvand lt!143920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143919 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143920 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143920 lt!143919) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31178 (= lt!143919 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143263)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263)))))))

(declare-fun lt!143921 () (_ BitVec 64))

(declare-fun lt!143924 () (_ BitVec 64))

(assert (=> d!31178 (= lt!143920 (bvmul lt!143921 lt!143924))))

(assert (=> d!31178 (or (= lt!143921 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143924 (bvsdiv (bvmul lt!143921 lt!143924) lt!143921)))))

(assert (=> d!31178 (= lt!143924 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31178 (= lt!143921 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143263)))))))

(assert (=> d!31178 (= lt!143923 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263)))))))

(assert (=> d!31178 (invariant!0 (currentBit!4887 (_2!4225 lt!143263)) (currentByte!4892 (_2!4225 lt!143263)) (size!2111 (buf!2462 (_2!4225 lt!143263))))))

(assert (=> d!31178 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) lt!143923)))

(declare-fun b!98983 () Bool)

(declare-fun res!81194 () Bool)

(assert (=> b!98983 (=> (not res!81194) (not e!64726))))

(assert (=> b!98983 (= res!81194 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143923))))

(declare-fun b!98984 () Bool)

(declare-fun lt!143922 () (_ BitVec 64))

(assert (=> b!98984 (= e!64726 (bvsle lt!143923 (bvmul lt!143922 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98984 (or (= lt!143922 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143922 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143922)))))

(assert (=> b!98984 (= lt!143922 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143263)))))))

(assert (= (and d!31178 res!81195) b!98983))

(assert (= (and b!98983 res!81194) b!98984))

(declare-fun m!144301 () Bool)

(assert (=> d!31178 m!144301))

(declare-fun m!144303 () Bool)

(assert (=> d!31178 m!144303))

(assert (=> b!98643 d!31178))

(declare-fun d!31180 () Bool)

(assert (=> d!31180 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143257))))

(declare-fun lt!143927 () Unit!6031)

(declare-fun choose!30 (BitStream!3696 BitStream!3696 BitStream!3696) Unit!6031)

(assert (=> d!31180 (= lt!143927 (choose!30 thiss!1288 (_2!4225 lt!143263) (_2!4225 lt!143257)))))

(assert (=> d!31180 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143263))))

(assert (=> d!31180 (= (lemmaIsPrefixTransitive!0 thiss!1288 (_2!4225 lt!143263) (_2!4225 lt!143257)) lt!143927)))

(declare-fun bs!7625 () Bool)

(assert (= bs!7625 d!31180))

(assert (=> bs!7625 m!143361))

(declare-fun m!144305 () Bool)

(assert (=> bs!7625 m!144305))

(declare-fun m!144307 () Bool)

(assert (=> bs!7625 m!144307))

(assert (=> b!98643 d!31180))

(assert (=> b!98643 d!31136))

(declare-fun d!31182 () Bool)

(assert (=> d!31182 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) lt!143233)))

(declare-fun lt!143928 () Unit!6031)

(assert (=> d!31182 (= lt!143928 (choose!9 thiss!1288 (buf!2462 (_2!4225 lt!143257)) lt!143233 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (=> d!31182 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1288 (buf!2462 (_2!4225 lt!143257)) lt!143233) lt!143928)))

(declare-fun bs!7626 () Bool)

(assert (= bs!7626 d!31182))

(assert (=> bs!7626 m!143323))

(declare-fun m!144309 () Bool)

(assert (=> bs!7626 m!144309))

(assert (=> b!98643 d!31182))

(declare-fun d!31184 () Bool)

(declare-fun lt!143929 () tuple2!7970)

(assert (=> d!31184 (= lt!143929 (readBit!0 lt!143234))))

(assert (=> d!31184 (= (readBitPure!0 lt!143234) (tuple2!7963 (_2!4240 lt!143929) (_1!4240 lt!143929)))))

(declare-fun bs!7627 () Bool)

(assert (= bs!7627 d!31184))

(declare-fun m!144311 () Bool)

(assert (=> bs!7627 m!144311))

(assert (=> b!98643 d!31184))

(declare-fun d!31186 () Bool)

(declare-fun e!64727 () Bool)

(assert (=> d!31186 e!64727))

(declare-fun res!81196 () Bool)

(assert (=> d!31186 (=> (not res!81196) (not e!64727))))

(declare-fun lt!143930 () BitStream!3696)

(declare-fun lt!143931 () (_ BitVec 64))

(assert (=> d!31186 (= res!81196 (= (bvadd lt!143931 (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) (bitIndex!0 (size!2111 (buf!2462 lt!143930)) (currentByte!4892 lt!143930) (currentBit!4887 lt!143930))))))

(assert (=> d!31186 (or (not (= (bvand lt!143931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143931 (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31186 (= lt!143931 (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!143254))) (currentByte!4892 (_2!4223 lt!143254)) (currentBit!4887 (_2!4223 lt!143254))))))

(assert (=> d!31186 (= lt!143930 (_2!4225 (moveBitIndex!0 (_2!4223 lt!143254) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))))))))

(assert (=> d!31186 (moveBitIndexPrecond!0 (_2!4223 lt!143254) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257)))))))

(assert (=> d!31186 (= (withMovedBitIndex!0 (_2!4223 lt!143254) (bvsub (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))) lt!143930)))

(declare-fun b!98985 () Bool)

(assert (=> b!98985 (= e!64727 (= (size!2111 (buf!2462 (_2!4223 lt!143254))) (size!2111 (buf!2462 lt!143930))))))

(assert (= (and d!31186 res!81196) b!98985))

(declare-fun m!144313 () Bool)

(assert (=> d!31186 m!144313))

(declare-fun m!144315 () Bool)

(assert (=> d!31186 m!144315))

(declare-fun m!144317 () Bool)

(assert (=> d!31186 m!144317))

(declare-fun m!144319 () Bool)

(assert (=> d!31186 m!144319))

(assert (=> b!98643 d!31186))

(declare-fun d!31188 () Bool)

(declare-fun e!64728 () Bool)

(assert (=> d!31188 e!64728))

(declare-fun res!81197 () Bool)

(assert (=> d!31188 (=> (not res!81197) (not e!64728))))

(declare-fun lt!143933 () (_ BitVec 64))

(declare-fun lt!143932 () BitStream!3696)

(assert (=> d!31188 (= res!81197 (= (bvadd lt!143933 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2111 (buf!2462 lt!143932)) (currentByte!4892 lt!143932) (currentBit!4887 lt!143932))))))

(assert (=> d!31188 (or (not (= (bvand lt!143933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!143933 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!143933 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31188 (= lt!143933 (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!143238))) (currentByte!4892 (_1!4223 lt!143238)) (currentBit!4887 (_1!4223 lt!143238))))))

(assert (=> d!31188 (= lt!143932 (_2!4225 (moveBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!31188 (moveBitIndexPrecond!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!31188 (= (withMovedBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001) lt!143932)))

(declare-fun b!98986 () Bool)

(assert (=> b!98986 (= e!64728 (= (size!2111 (buf!2462 (_1!4223 lt!143238))) (size!2111 (buf!2462 lt!143932))))))

(assert (= (and d!31188 res!81197) b!98986))

(declare-fun m!144321 () Bool)

(assert (=> d!31188 m!144321))

(declare-fun m!144323 () Bool)

(assert (=> d!31188 m!144323))

(declare-fun m!144325 () Bool)

(assert (=> d!31188 m!144325))

(declare-fun m!144327 () Bool)

(assert (=> d!31188 m!144327))

(assert (=> b!98643 d!31188))

(declare-fun b!98987 () Bool)

(declare-fun e!64730 () Unit!6031)

(declare-fun lt!143951 () Unit!6031)

(assert (=> b!98987 (= e!64730 lt!143951)))

(declare-fun lt!143944 () (_ BitVec 64))

(assert (=> b!98987 (= lt!143944 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143943 () (_ BitVec 64))

(assert (=> b!98987 (= lt!143943 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> b!98987 (= lt!143951 (arrayBitRangesEqSymmetric!0 (buf!2462 thiss!1288) (buf!2462 (_2!4225 lt!143257)) lt!143944 lt!143943))))

(assert (=> b!98987 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!143257)) (buf!2462 thiss!1288) lt!143944 lt!143943)))

(declare-fun b!98988 () Bool)

(declare-fun Unit!6081 () Unit!6031)

(assert (=> b!98988 (= e!64730 Unit!6081)))

(declare-fun b!98989 () Bool)

(declare-fun res!81198 () Bool)

(declare-fun e!64729 () Bool)

(assert (=> b!98989 (=> (not res!81198) (not e!64729))))

(declare-fun lt!143946 () tuple2!7942)

(assert (=> b!98989 (= res!81198 (isPrefixOf!0 (_2!4223 lt!143946) (_2!4225 lt!143257)))))

(declare-fun b!98990 () Bool)

(declare-fun res!81199 () Bool)

(assert (=> b!98990 (=> (not res!81199) (not e!64729))))

(assert (=> b!98990 (= res!81199 (isPrefixOf!0 (_1!4223 lt!143946) thiss!1288))))

(declare-fun lt!143934 () (_ BitVec 64))

(declare-fun lt!143939 () (_ BitVec 64))

(declare-fun b!98991 () Bool)

(assert (=> b!98991 (= e!64729 (= (_1!4223 lt!143946) (withMovedBitIndex!0 (_2!4223 lt!143946) (bvsub lt!143934 lt!143939))))))

(assert (=> b!98991 (or (= (bvand lt!143934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143939 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143934 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143934 lt!143939) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98991 (= lt!143939 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))))

(assert (=> b!98991 (= lt!143934 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun d!31190 () Bool)

(assert (=> d!31190 e!64729))

(declare-fun res!81200 () Bool)

(assert (=> d!31190 (=> (not res!81200) (not e!64729))))

(assert (=> d!31190 (= res!81200 (isPrefixOf!0 (_1!4223 lt!143946) (_2!4223 lt!143946)))))

(declare-fun lt!143945 () BitStream!3696)

(assert (=> d!31190 (= lt!143946 (tuple2!7943 lt!143945 (_2!4225 lt!143257)))))

(declare-fun lt!143938 () Unit!6031)

(declare-fun lt!143953 () Unit!6031)

(assert (=> d!31190 (= lt!143938 lt!143953)))

(assert (=> d!31190 (isPrefixOf!0 lt!143945 (_2!4225 lt!143257))))

(assert (=> d!31190 (= lt!143953 (lemmaIsPrefixTransitive!0 lt!143945 (_2!4225 lt!143257) (_2!4225 lt!143257)))))

(declare-fun lt!143948 () Unit!6031)

(declare-fun lt!143949 () Unit!6031)

(assert (=> d!31190 (= lt!143948 lt!143949)))

(assert (=> d!31190 (isPrefixOf!0 lt!143945 (_2!4225 lt!143257))))

(assert (=> d!31190 (= lt!143949 (lemmaIsPrefixTransitive!0 lt!143945 thiss!1288 (_2!4225 lt!143257)))))

(declare-fun lt!143942 () Unit!6031)

(assert (=> d!31190 (= lt!143942 e!64730)))

(declare-fun c!6268 () Bool)

(assert (=> d!31190 (= c!6268 (not (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000)))))

(declare-fun lt!143936 () Unit!6031)

(declare-fun lt!143952 () Unit!6031)

(assert (=> d!31190 (= lt!143936 lt!143952)))

(assert (=> d!31190 (isPrefixOf!0 (_2!4225 lt!143257) (_2!4225 lt!143257))))

(assert (=> d!31190 (= lt!143952 (lemmaIsPrefixRefl!0 (_2!4225 lt!143257)))))

(declare-fun lt!143941 () Unit!6031)

(declare-fun lt!143947 () Unit!6031)

(assert (=> d!31190 (= lt!143941 lt!143947)))

(assert (=> d!31190 (= lt!143947 (lemmaIsPrefixRefl!0 (_2!4225 lt!143257)))))

(declare-fun lt!143937 () Unit!6031)

(declare-fun lt!143940 () Unit!6031)

(assert (=> d!31190 (= lt!143937 lt!143940)))

(assert (=> d!31190 (isPrefixOf!0 lt!143945 lt!143945)))

(assert (=> d!31190 (= lt!143940 (lemmaIsPrefixRefl!0 lt!143945))))

(declare-fun lt!143950 () Unit!6031)

(declare-fun lt!143935 () Unit!6031)

(assert (=> d!31190 (= lt!143950 lt!143935)))

(assert (=> d!31190 (isPrefixOf!0 thiss!1288 thiss!1288)))

(assert (=> d!31190 (= lt!143935 (lemmaIsPrefixRefl!0 thiss!1288))))

(assert (=> d!31190 (= lt!143945 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(assert (=> d!31190 (isPrefixOf!0 thiss!1288 (_2!4225 lt!143257))))

(assert (=> d!31190 (= (reader!0 thiss!1288 (_2!4225 lt!143257)) lt!143946)))

(assert (= (and d!31190 c!6268) b!98987))

(assert (= (and d!31190 (not c!6268)) b!98988))

(assert (= (and d!31190 res!81200) b!98990))

(assert (= (and b!98990 res!81199) b!98989))

(assert (= (and b!98989 res!81198) b!98991))

(declare-fun m!144329 () Bool)

(assert (=> b!98989 m!144329))

(declare-fun m!144331 () Bool)

(assert (=> b!98991 m!144331))

(assert (=> b!98991 m!143353))

(assert (=> b!98991 m!142957))

(assert (=> d!31190 m!143007))

(declare-fun m!144333 () Bool)

(assert (=> d!31190 m!144333))

(declare-fun m!144335 () Bool)

(assert (=> d!31190 m!144335))

(declare-fun m!144337 () Bool)

(assert (=> d!31190 m!144337))

(declare-fun m!144339 () Bool)

(assert (=> d!31190 m!144339))

(declare-fun m!144341 () Bool)

(assert (=> d!31190 m!144341))

(declare-fun m!144343 () Bool)

(assert (=> d!31190 m!144343))

(assert (=> d!31190 m!143021))

(declare-fun m!144345 () Bool)

(assert (=> d!31190 m!144345))

(assert (=> d!31190 m!143361))

(declare-fun m!144347 () Bool)

(assert (=> d!31190 m!144347))

(assert (=> b!98987 m!142957))

(declare-fun m!144349 () Bool)

(assert (=> b!98987 m!144349))

(declare-fun m!144351 () Bool)

(assert (=> b!98987 m!144351))

(declare-fun m!144353 () Bool)

(assert (=> b!98990 m!144353))

(assert (=> b!98643 d!31190))

(declare-fun lt!143954 () tuple2!7958)

(declare-fun d!31192 () Bool)

(assert (=> d!31192 (= lt!143954 (readNLeastSignificantBitsLoop!0 (_1!4223 lt!143254) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 (ite (_2!4233 lt!143256) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!31192 (= (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143254) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 (ite (_2!4233 lt!143256) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!7945 (_2!4231 lt!143954) (_1!4231 lt!143954)))))

(declare-fun bs!7628 () Bool)

(assert (= bs!7628 d!31192))

(declare-fun m!144355 () Bool)

(assert (=> bs!7628 m!144355))

(assert (=> b!98643 d!31192))

(assert (=> b!98643 d!30864))

(declare-fun b!98992 () Bool)

(declare-fun e!64732 () Unit!6031)

(declare-fun lt!143972 () Unit!6031)

(assert (=> b!98992 (= e!64732 lt!143972)))

(declare-fun lt!143965 () (_ BitVec 64))

(assert (=> b!98992 (= lt!143965 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!143964 () (_ BitVec 64))

(assert (=> b!98992 (= lt!143964 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))))))

(assert (=> b!98992 (= lt!143972 (arrayBitRangesEqSymmetric!0 (buf!2462 (_2!4225 lt!143263)) (buf!2462 (_2!4225 lt!143257)) lt!143965 lt!143964))))

(assert (=> b!98992 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!143257)) (buf!2462 (_2!4225 lt!143263)) lt!143965 lt!143964)))

(declare-fun b!98993 () Bool)

(declare-fun Unit!6082 () Unit!6031)

(assert (=> b!98993 (= e!64732 Unit!6082)))

(declare-fun b!98994 () Bool)

(declare-fun res!81201 () Bool)

(declare-fun e!64731 () Bool)

(assert (=> b!98994 (=> (not res!81201) (not e!64731))))

(declare-fun lt!143967 () tuple2!7942)

(assert (=> b!98994 (= res!81201 (isPrefixOf!0 (_2!4223 lt!143967) (_2!4225 lt!143257)))))

(declare-fun b!98995 () Bool)

(declare-fun res!81202 () Bool)

(assert (=> b!98995 (=> (not res!81202) (not e!64731))))

(assert (=> b!98995 (= res!81202 (isPrefixOf!0 (_1!4223 lt!143967) (_2!4225 lt!143263)))))

(declare-fun lt!143955 () (_ BitVec 64))

(declare-fun lt!143960 () (_ BitVec 64))

(declare-fun b!98996 () Bool)

(assert (=> b!98996 (= e!64731 (= (_1!4223 lt!143967) (withMovedBitIndex!0 (_2!4223 lt!143967) (bvsub lt!143955 lt!143960))))))

(assert (=> b!98996 (or (= (bvand lt!143955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143960 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143955 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143955 lt!143960) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!98996 (= lt!143960 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))))))

(assert (=> b!98996 (= lt!143955 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143263))) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))))))

(declare-fun d!31194 () Bool)

(assert (=> d!31194 e!64731))

(declare-fun res!81203 () Bool)

(assert (=> d!31194 (=> (not res!81203) (not e!64731))))

(assert (=> d!31194 (= res!81203 (isPrefixOf!0 (_1!4223 lt!143967) (_2!4223 lt!143967)))))

(declare-fun lt!143966 () BitStream!3696)

(assert (=> d!31194 (= lt!143967 (tuple2!7943 lt!143966 (_2!4225 lt!143257)))))

(declare-fun lt!143959 () Unit!6031)

(declare-fun lt!143974 () Unit!6031)

(assert (=> d!31194 (= lt!143959 lt!143974)))

(assert (=> d!31194 (isPrefixOf!0 lt!143966 (_2!4225 lt!143257))))

(assert (=> d!31194 (= lt!143974 (lemmaIsPrefixTransitive!0 lt!143966 (_2!4225 lt!143257) (_2!4225 lt!143257)))))

(declare-fun lt!143969 () Unit!6031)

(declare-fun lt!143970 () Unit!6031)

(assert (=> d!31194 (= lt!143969 lt!143970)))

(assert (=> d!31194 (isPrefixOf!0 lt!143966 (_2!4225 lt!143257))))

(assert (=> d!31194 (= lt!143970 (lemmaIsPrefixTransitive!0 lt!143966 (_2!4225 lt!143263) (_2!4225 lt!143257)))))

(declare-fun lt!143963 () Unit!6031)

(assert (=> d!31194 (= lt!143963 e!64732)))

(declare-fun c!6269 () Bool)

(assert (=> d!31194 (= c!6269 (not (= (size!2111 (buf!2462 (_2!4225 lt!143263))) #b00000000000000000000000000000000)))))

(declare-fun lt!143957 () Unit!6031)

(declare-fun lt!143973 () Unit!6031)

(assert (=> d!31194 (= lt!143957 lt!143973)))

(assert (=> d!31194 (isPrefixOf!0 (_2!4225 lt!143257) (_2!4225 lt!143257))))

(assert (=> d!31194 (= lt!143973 (lemmaIsPrefixRefl!0 (_2!4225 lt!143257)))))

(declare-fun lt!143962 () Unit!6031)

(declare-fun lt!143968 () Unit!6031)

(assert (=> d!31194 (= lt!143962 lt!143968)))

(assert (=> d!31194 (= lt!143968 (lemmaIsPrefixRefl!0 (_2!4225 lt!143257)))))

(declare-fun lt!143958 () Unit!6031)

(declare-fun lt!143961 () Unit!6031)

(assert (=> d!31194 (= lt!143958 lt!143961)))

(assert (=> d!31194 (isPrefixOf!0 lt!143966 lt!143966)))

(assert (=> d!31194 (= lt!143961 (lemmaIsPrefixRefl!0 lt!143966))))

(declare-fun lt!143971 () Unit!6031)

(declare-fun lt!143956 () Unit!6031)

(assert (=> d!31194 (= lt!143971 lt!143956)))

(assert (=> d!31194 (isPrefixOf!0 (_2!4225 lt!143263) (_2!4225 lt!143263))))

(assert (=> d!31194 (= lt!143956 (lemmaIsPrefixRefl!0 (_2!4225 lt!143263)))))

(assert (=> d!31194 (= lt!143966 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263))))))

(assert (=> d!31194 (isPrefixOf!0 (_2!4225 lt!143263) (_2!4225 lt!143257))))

(assert (=> d!31194 (= (reader!0 (_2!4225 lt!143263) (_2!4225 lt!143257)) lt!143967)))

(assert (= (and d!31194 c!6269) b!98992))

(assert (= (and d!31194 (not c!6269)) b!98993))

(assert (= (and d!31194 res!81203) b!98995))

(assert (= (and b!98995 res!81202) b!98994))

(assert (= (and b!98994 res!81201) b!98996))

(declare-fun m!144357 () Bool)

(assert (=> b!98994 m!144357))

(declare-fun m!144359 () Bool)

(assert (=> b!98996 m!144359))

(assert (=> b!98996 m!143353))

(assert (=> b!98996 m!143349))

(declare-fun m!144361 () Bool)

(assert (=> d!31194 m!144361))

(assert (=> d!31194 m!144333))

(declare-fun m!144363 () Bool)

(assert (=> d!31194 m!144363))

(declare-fun m!144365 () Bool)

(assert (=> d!31194 m!144365))

(assert (=> d!31194 m!144339))

(declare-fun m!144367 () Bool)

(assert (=> d!31194 m!144367))

(declare-fun m!144369 () Bool)

(assert (=> d!31194 m!144369))

(declare-fun m!144371 () Bool)

(assert (=> d!31194 m!144371))

(declare-fun m!144373 () Bool)

(assert (=> d!31194 m!144373))

(declare-fun m!144375 () Bool)

(assert (=> d!31194 m!144375))

(declare-fun m!144377 () Bool)

(assert (=> d!31194 m!144377))

(assert (=> b!98992 m!143349))

(declare-fun m!144379 () Bool)

(assert (=> b!98992 m!144379))

(declare-fun m!144381 () Bool)

(assert (=> b!98992 m!144381))

(declare-fun m!144383 () Bool)

(assert (=> b!98995 m!144383))

(assert (=> b!98643 d!31194))

(declare-fun d!31196 () Bool)

(declare-fun lt!143975 () tuple2!7970)

(assert (=> d!31196 (= lt!143975 (readBit!0 lt!143243))))

(assert (=> d!31196 (= (readBitPure!0 lt!143243) (tuple2!7963 (_2!4240 lt!143975) (_1!4240 lt!143975)))))

(declare-fun bs!7629 () Bool)

(assert (= bs!7629 d!31196))

(declare-fun m!144385 () Bool)

(assert (=> bs!7629 m!144385))

(assert (=> b!98643 d!31196))

(declare-fun d!31198 () Bool)

(declare-fun lt!143976 () tuple2!7958)

(assert (=> d!31198 (= lt!143976 (readNLeastSignificantBitsLoop!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259))))

(assert (=> d!31198 (= (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259) (tuple2!7945 (_2!4231 lt!143976) (_1!4231 lt!143976)))))

(declare-fun bs!7630 () Bool)

(assert (= bs!7630 d!31198))

(declare-fun m!144387 () Bool)

(assert (=> bs!7630 m!144387))

(assert (=> b!98643 d!31198))

(declare-fun d!31200 () Bool)

(declare-fun e!64733 () Bool)

(assert (=> d!31200 e!64733))

(declare-fun res!81205 () Bool)

(assert (=> d!31200 (=> (not res!81205) (not e!64733))))

(declare-fun lt!143981 () (_ BitVec 64))

(declare-fun lt!143978 () (_ BitVec 64))

(declare-fun lt!143977 () (_ BitVec 64))

(assert (=> d!31200 (= res!81205 (= lt!143981 (bvsub lt!143978 lt!143977)))))

(assert (=> d!31200 (or (= (bvand lt!143978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143977 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143978 lt!143977) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31200 (= lt!143977 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143257))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143257)))))))

(declare-fun lt!143979 () (_ BitVec 64))

(declare-fun lt!143982 () (_ BitVec 64))

(assert (=> d!31200 (= lt!143978 (bvmul lt!143979 lt!143982))))

(assert (=> d!31200 (or (= lt!143979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143982 (bvsdiv (bvmul lt!143979 lt!143982) lt!143979)))))

(assert (=> d!31200 (= lt!143982 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31200 (= lt!143979 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))))))

(assert (=> d!31200 (= lt!143981 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143257))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143257)))))))

(assert (=> d!31200 (invariant!0 (currentBit!4887 (_2!4225 lt!143257)) (currentByte!4892 (_2!4225 lt!143257)) (size!2111 (buf!2462 (_2!4225 lt!143257))))))

(assert (=> d!31200 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!143257))) (currentByte!4892 (_2!4225 lt!143257)) (currentBit!4887 (_2!4225 lt!143257))) lt!143981)))

(declare-fun b!98997 () Bool)

(declare-fun res!81204 () Bool)

(assert (=> b!98997 (=> (not res!81204) (not e!64733))))

(assert (=> b!98997 (= res!81204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143981))))

(declare-fun b!98998 () Bool)

(declare-fun lt!143980 () (_ BitVec 64))

(assert (=> b!98998 (= e!64733 (bvsle lt!143981 (bvmul lt!143980 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!98998 (or (= lt!143980 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143980 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143980)))))

(assert (=> b!98998 (= lt!143980 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))))))

(assert (= (and d!31200 res!81205) b!98997))

(assert (= (and b!98997 res!81204) b!98998))

(declare-fun m!144389 () Bool)

(assert (=> d!31200 m!144389))

(declare-fun m!144391 () Bool)

(assert (=> d!31200 m!144391))

(assert (=> b!98643 d!31200))

(declare-fun d!31202 () Bool)

(declare-fun e!64734 () Bool)

(assert (=> d!31202 e!64734))

(declare-fun res!81207 () Bool)

(assert (=> d!31202 (=> (not res!81207) (not e!64734))))

(declare-fun lt!143987 () (_ BitVec 64))

(declare-fun lt!143984 () (_ BitVec 64))

(declare-fun lt!143983 () (_ BitVec 64))

(assert (=> d!31202 (= res!81207 (= lt!143987 (bvsub lt!143984 lt!143983)))))

(assert (=> d!31202 (or (= (bvand lt!143984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!143983 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!143984 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!143984 lt!143983) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31202 (= lt!143983 (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143261)))) ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143261))) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143261)))))))

(declare-fun lt!143985 () (_ BitVec 64))

(declare-fun lt!143988 () (_ BitVec 64))

(assert (=> d!31202 (= lt!143984 (bvmul lt!143985 lt!143988))))

(assert (=> d!31202 (or (= lt!143985 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!143988 (bvsdiv (bvmul lt!143985 lt!143988) lt!143985)))))

(assert (=> d!31202 (= lt!143988 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31202 (= lt!143985 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143261)))))))

(assert (=> d!31202 (= lt!143987 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4892 (_1!4233 lt!143261))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4887 (_1!4233 lt!143261)))))))

(assert (=> d!31202 (invariant!0 (currentBit!4887 (_1!4233 lt!143261)) (currentByte!4892 (_1!4233 lt!143261)) (size!2111 (buf!2462 (_1!4233 lt!143261))))))

(assert (=> d!31202 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!143261))) (currentByte!4892 (_1!4233 lt!143261)) (currentBit!4887 (_1!4233 lt!143261))) lt!143987)))

(declare-fun b!98999 () Bool)

(declare-fun res!81206 () Bool)

(assert (=> b!98999 (=> (not res!81206) (not e!64734))))

(assert (=> b!98999 (= res!81206 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!143987))))

(declare-fun b!99000 () Bool)

(declare-fun lt!143986 () (_ BitVec 64))

(assert (=> b!99000 (= e!64734 (bvsle lt!143987 (bvmul lt!143986 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!99000 (or (= lt!143986 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!143986 #b0000000000000000000000000000000000000000000000000000000000001000) lt!143986)))))

(assert (=> b!99000 (= lt!143986 ((_ sign_extend 32) (size!2111 (buf!2462 (_1!4233 lt!143261)))))))

(assert (= (and d!31202 res!81207) b!98999))

(assert (= (and b!98999 res!81206) b!99000))

(declare-fun m!144393 () Bool)

(assert (=> d!31202 m!144393))

(declare-fun m!144395 () Bool)

(assert (=> d!31202 m!144395))

(assert (=> b!98643 d!31202))

(declare-fun d!31204 () Bool)

(assert (=> d!31204 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143250)))

(declare-fun lt!143989 () Unit!6031)

(assert (=> d!31204 (= lt!143989 (choose!9 (_2!4225 lt!143263) (buf!2462 (_2!4225 lt!143257)) lt!143250 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 (_2!4225 lt!143263)) (currentBit!4887 (_2!4225 lt!143263)))))))

(assert (=> d!31204 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4225 lt!143263) (buf!2462 (_2!4225 lt!143257)) lt!143250) lt!143989)))

(declare-fun bs!7631 () Bool)

(assert (= bs!7631 d!31204))

(assert (=> bs!7631 m!143341))

(declare-fun m!144397 () Bool)

(assert (=> bs!7631 m!144397))

(assert (=> b!98643 d!31204))

(declare-fun d!31206 () Bool)

(declare-fun e!64737 () Bool)

(assert (=> d!31206 e!64737))

(declare-fun res!81210 () Bool)

(assert (=> d!31206 (=> (not res!81210) (not e!64737))))

(declare-fun lt!144000 () tuple2!7962)

(declare-fun lt!144001 () tuple2!7962)

(assert (=> d!31206 (= res!81210 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!144000))) (currentByte!4892 (_1!4233 lt!144000)) (currentBit!4887 (_1!4233 lt!144000))) (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!144001))) (currentByte!4892 (_1!4233 lt!144001)) (currentBit!4887 (_1!4233 lt!144001)))))))

(declare-fun lt!143998 () BitStream!3696)

(declare-fun lt!143999 () Unit!6031)

(declare-fun choose!50 (BitStream!3696 BitStream!3696 BitStream!3696 tuple2!7962 tuple2!7962 BitStream!3696 Bool tuple2!7962 tuple2!7962 BitStream!3696 Bool) Unit!6031)

(assert (=> d!31206 (= lt!143999 (choose!50 lt!143243 (_2!4225 lt!143257) lt!143998 lt!144000 (tuple2!7963 (_1!4233 lt!144000) (_2!4233 lt!144000)) (_1!4233 lt!144000) (_2!4233 lt!144000) lt!144001 (tuple2!7963 (_1!4233 lt!144001) (_2!4233 lt!144001)) (_1!4233 lt!144001) (_2!4233 lt!144001)))))

(assert (=> d!31206 (= lt!144001 (readBitPure!0 lt!143998))))

(assert (=> d!31206 (= lt!144000 (readBitPure!0 lt!143243))))

(assert (=> d!31206 (= lt!143998 (BitStream!3697 (buf!2462 (_2!4225 lt!143257)) (currentByte!4892 lt!143243) (currentBit!4887 lt!143243)))))

(assert (=> d!31206 (invariant!0 (currentBit!4887 lt!143243) (currentByte!4892 lt!143243) (size!2111 (buf!2462 (_2!4225 lt!143257))))))

(assert (=> d!31206 (= (readBitPrefixLemma!0 lt!143243 (_2!4225 lt!143257)) lt!143999)))

(declare-fun b!99003 () Bool)

(assert (=> b!99003 (= e!64737 (= (_2!4233 lt!144000) (_2!4233 lt!144001)))))

(assert (= (and d!31206 res!81210) b!99003))

(declare-fun m!144399 () Bool)

(assert (=> d!31206 m!144399))

(declare-fun m!144401 () Bool)

(assert (=> d!31206 m!144401))

(assert (=> d!31206 m!143333))

(assert (=> d!31206 m!143313))

(declare-fun m!144403 () Bool)

(assert (=> d!31206 m!144403))

(declare-fun m!144405 () Bool)

(assert (=> d!31206 m!144405))

(assert (=> b!98643 d!31206))

(declare-fun d!31208 () Bool)

(assert (=> d!31208 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263))) lt!143250) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!143257)))) ((_ sign_extend 32) (currentByte!4892 (_2!4225 lt!143263))) ((_ sign_extend 32) (currentBit!4887 (_2!4225 lt!143263)))) lt!143250))))

(declare-fun bs!7632 () Bool)

(assert (= bs!7632 d!31208))

(declare-fun m!144407 () Bool)

(assert (=> bs!7632 m!144407))

(assert (=> b!98643 d!31208))

(declare-fun d!31210 () Bool)

(declare-fun e!64743 () Bool)

(assert (=> d!31210 e!64743))

(declare-fun res!81222 () Bool)

(assert (=> d!31210 (=> (not res!81222) (not e!64743))))

(declare-fun lt!144010 () tuple2!7946)

(assert (=> d!31210 (= res!81222 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 (_2!4225 lt!144010)))))))

(declare-fun choose!16 (BitStream!3696 Bool) tuple2!7946)

(assert (=> d!31210 (= lt!144010 (choose!16 thiss!1288 lt!143225))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31210 (validate_offset_bit!0 ((_ sign_extend 32) (size!2111 (buf!2462 thiss!1288))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)))))

(assert (=> d!31210 (= (appendBit!0 thiss!1288 lt!143225) lt!144010)))

(declare-fun b!99013 () Bool)

(declare-fun res!81221 () Bool)

(assert (=> b!99013 (=> (not res!81221) (not e!64743))))

(declare-fun lt!144013 () (_ BitVec 64))

(declare-fun lt!144011 () (_ BitVec 64))

(assert (=> b!99013 (= res!81221 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!144010))) (currentByte!4892 (_2!4225 lt!144010)) (currentBit!4887 (_2!4225 lt!144010))) (bvadd lt!144013 lt!144011)))))

(assert (=> b!99013 (or (not (= (bvand lt!144013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144011 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144013 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144013 lt!144011) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!99013 (= lt!144011 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!99013 (= lt!144013 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun b!99015 () Bool)

(declare-fun e!64742 () Bool)

(assert (=> b!99015 (= e!64743 e!64742)))

(declare-fun res!81220 () Bool)

(assert (=> b!99015 (=> (not res!81220) (not e!64742))))

(declare-fun lt!144012 () tuple2!7962)

(assert (=> b!99015 (= res!81220 (and (= (_2!4233 lt!144012) lt!143225) (= (_1!4233 lt!144012) (_2!4225 lt!144010))))))

(assert (=> b!99015 (= lt!144012 (readBitPure!0 (readerFrom!0 (_2!4225 lt!144010) (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288))))))

(declare-fun b!99014 () Bool)

(declare-fun res!81219 () Bool)

(assert (=> b!99014 (=> (not res!81219) (not e!64743))))

(assert (=> b!99014 (= res!81219 (isPrefixOf!0 thiss!1288 (_2!4225 lt!144010)))))

(declare-fun b!99016 () Bool)

(assert (=> b!99016 (= e!64742 (= (bitIndex!0 (size!2111 (buf!2462 (_1!4233 lt!144012))) (currentByte!4892 (_1!4233 lt!144012)) (currentBit!4887 (_1!4233 lt!144012))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!144010))) (currentByte!4892 (_2!4225 lt!144010)) (currentBit!4887 (_2!4225 lt!144010)))))))

(assert (= (and d!31210 res!81222) b!99013))

(assert (= (and b!99013 res!81221) b!99014))

(assert (= (and b!99014 res!81219) b!99015))

(assert (= (and b!99015 res!81220) b!99016))

(declare-fun m!144409 () Bool)

(assert (=> d!31210 m!144409))

(declare-fun m!144411 () Bool)

(assert (=> d!31210 m!144411))

(declare-fun m!144413 () Bool)

(assert (=> b!99016 m!144413))

(declare-fun m!144415 () Bool)

(assert (=> b!99016 m!144415))

(assert (=> b!99013 m!144415))

(assert (=> b!99013 m!142957))

(declare-fun m!144417 () Bool)

(assert (=> b!99014 m!144417))

(declare-fun m!144419 () Bool)

(assert (=> b!99015 m!144419))

(assert (=> b!99015 m!144419))

(declare-fun m!144421 () Bool)

(assert (=> b!99015 m!144421))

(assert (=> b!98643 d!31210))

(declare-fun d!31212 () Bool)

(declare-fun lt!144014 () tuple2!7958)

(assert (=> d!31212 (= lt!144014 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 e!64495)))))

(assert (=> d!31212 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvor lt!143259 e!64495)) (tuple2!7945 (_2!4231 lt!144014) (_1!4231 lt!144014)))))

(declare-fun bs!7633 () Bool)

(assert (= bs!7633 d!31212))

(assert (=> bs!7633 m!143345))

(declare-fun m!144423 () Bool)

(assert (=> bs!7633 m!144423))

(assert (=> b!98643 d!31212))

(declare-fun d!31214 () Bool)

(declare-fun lt!144027 () tuple2!7944)

(declare-fun lt!144031 () tuple2!7944)

(assert (=> d!31214 (and (= (_2!4224 lt!144027) (_2!4224 lt!144031)) (= (_1!4224 lt!144027) (_1!4224 lt!144031)))))

(declare-fun lt!144032 () (_ BitVec 64))

(declare-fun lt!144029 () Unit!6031)

(declare-fun lt!144028 () BitStream!3696)

(declare-fun lt!144030 () Bool)

(declare-fun choose!45 (BitStream!3696 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!7944 tuple2!7944 BitStream!3696 (_ BitVec 64) Bool BitStream!3696 (_ BitVec 64) tuple2!7944 tuple2!7944 BitStream!3696 (_ BitVec 64)) Unit!6031)

(assert (=> d!31214 (= lt!144029 (choose!45 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259 lt!144027 (tuple2!7945 (_1!4224 lt!144027) (_2!4224 lt!144027)) (_1!4224 lt!144027) (_2!4224 lt!144027) lt!144030 lt!144028 lt!144032 lt!144031 (tuple2!7945 (_1!4224 lt!144031) (_2!4224 lt!144031)) (_1!4224 lt!144031) (_2!4224 lt!144031)))))

(assert (=> d!31214 (= lt!144031 (readNLeastSignificantBitsLoopPure!0 lt!144028 nBits!388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!144032))))

(assert (=> d!31214 (= lt!144032 (bvor lt!143259 (ite lt!144030 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!388 #b00000000000000000000000000000001) #b00000000000000000000000000000000))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31214 (= lt!144028 (withMovedBitIndex!0 (_1!4223 lt!143238) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!31214 (= lt!144030 (_2!4233 (readBitPure!0 (_1!4223 lt!143238))))))

(assert (=> d!31214 (= lt!144027 (readNLeastSignificantBitsLoopPure!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259))))

(assert (=> d!31214 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4223 lt!143238) nBits!388 #b00000000000000000000000000000000 lt!143259) lt!144029)))

(declare-fun bs!7635 () Bool)

(assert (= bs!7635 d!31214))

(declare-fun m!144425 () Bool)

(assert (=> bs!7635 m!144425))

(assert (=> bs!7635 m!143365))

(declare-fun m!144427 () Bool)

(assert (=> bs!7635 m!144427))

(assert (=> bs!7635 m!143345))

(assert (=> bs!7635 m!143325))

(assert (=> b!98643 d!31214))

(assert (=> d!30800 d!30798))

(declare-fun d!31216 () Bool)

(assert (=> d!31216 (validate_offset_bits!1 ((_ sign_extend 32) (size!2111 (buf!2462 (_2!4225 lt!142601)))) ((_ sign_extend 32) (currentByte!4892 thiss!1288)) ((_ sign_extend 32) (currentBit!4887 thiss!1288)) ((_ sign_extend 32) nBits!388))))

(assert (=> d!31216 true))

(declare-fun _$6!225 () Unit!6031)

(assert (=> d!31216 (= (choose!9 thiss!1288 (buf!2462 (_2!4225 lt!142601)) ((_ sign_extend 32) nBits!388) (BitStream!3697 (buf!2462 (_2!4225 lt!142601)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))) _$6!225)))

(declare-fun bs!7636 () Bool)

(assert (= bs!7636 d!31216))

(assert (=> bs!7636 m!142947))

(assert (=> d!30800 d!31216))

(declare-fun d!31218 () Bool)

(declare-fun e!64744 () Bool)

(assert (=> d!31218 e!64744))

(declare-fun res!81223 () Bool)

(assert (=> d!31218 (=> (not res!81223) (not e!64744))))

(declare-fun lt!144033 () BitStream!3696)

(declare-fun lt!144034 () (_ BitVec 64))

(assert (=> d!31218 (= res!81223 (= (bvadd lt!144034 (bvsub lt!142662 lt!142667)) (bitIndex!0 (size!2111 (buf!2462 lt!144033)) (currentByte!4892 lt!144033) (currentBit!4887 lt!144033))))))

(assert (=> d!31218 (or (not (= (bvand lt!144034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!142662 lt!142667) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144034 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144034 (bvsub lt!142662 lt!142667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31218 (= lt!144034 (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!142674))) (currentByte!4892 (_2!4223 lt!142674)) (currentBit!4887 (_2!4223 lt!142674))))))

(assert (=> d!31218 (= lt!144033 (_2!4225 (moveBitIndex!0 (_2!4223 lt!142674) (bvsub lt!142662 lt!142667))))))

(assert (=> d!31218 (moveBitIndexPrecond!0 (_2!4223 lt!142674) (bvsub lt!142662 lt!142667))))

(assert (=> d!31218 (= (withMovedBitIndex!0 (_2!4223 lt!142674) (bvsub lt!142662 lt!142667)) lt!144033)))

(declare-fun b!99017 () Bool)

(assert (=> b!99017 (= e!64744 (= (size!2111 (buf!2462 (_2!4223 lt!142674))) (size!2111 (buf!2462 lt!144033))))))

(assert (= (and d!31218 res!81223) b!99017))

(declare-fun m!144429 () Bool)

(assert (=> d!31218 m!144429))

(declare-fun m!144431 () Bool)

(assert (=> d!31218 m!144431))

(declare-fun m!144433 () Bool)

(assert (=> d!31218 m!144433))

(declare-fun m!144435 () Bool)

(assert (=> d!31218 m!144435))

(assert (=> b!98462 d!31218))

(assert (=> b!98462 d!30862))

(assert (=> b!98462 d!30864))

(declare-fun d!31220 () Bool)

(declare-fun res!81226 () Bool)

(declare-fun e!64745 () Bool)

(assert (=> d!31220 (=> (not res!81226) (not e!64745))))

(assert (=> d!31220 (= res!81226 (= (size!2111 (buf!2462 (_2!4223 lt!142674))) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (=> d!31220 (= (isPrefixOf!0 (_2!4223 lt!142674) (_2!4225 lt!142601)) e!64745)))

(declare-fun b!99018 () Bool)

(declare-fun res!81224 () Bool)

(assert (=> b!99018 (=> (not res!81224) (not e!64745))))

(assert (=> b!99018 (= res!81224 (bvsle (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!142674))) (currentByte!4892 (_2!4223 lt!142674)) (currentBit!4887 (_2!4223 lt!142674))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601)))))))

(declare-fun b!99019 () Bool)

(declare-fun e!64746 () Bool)

(assert (=> b!99019 (= e!64745 e!64746)))

(declare-fun res!81225 () Bool)

(assert (=> b!99019 (=> res!81225 e!64746)))

(assert (=> b!99019 (= res!81225 (= (size!2111 (buf!2462 (_2!4223 lt!142674))) #b00000000000000000000000000000000))))

(declare-fun b!99020 () Bool)

(assert (=> b!99020 (= e!64746 (arrayBitRangesEq!0 (buf!2462 (_2!4223 lt!142674)) (buf!2462 (_2!4225 lt!142601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!142674))) (currentByte!4892 (_2!4223 lt!142674)) (currentBit!4887 (_2!4223 lt!142674)))))))

(assert (= (and d!31220 res!81226) b!99018))

(assert (= (and b!99018 res!81224) b!99019))

(assert (= (and b!99019 (not res!81225)) b!99020))

(assert (=> b!99018 m!144431))

(assert (=> b!99018 m!142955))

(assert (=> b!99020 m!144431))

(assert (=> b!99020 m!144431))

(declare-fun m!144437 () Bool)

(assert (=> b!99020 m!144437))

(assert (=> b!98460 d!31220))

(declare-fun d!31222 () Bool)

(declare-fun lt!144035 () tuple2!7970)

(assert (=> d!31222 (= lt!144035 (readBit!0 (readerFrom!0 (_2!4225 lt!143244) (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288))))))

(assert (=> d!31222 (= (readBitPure!0 (readerFrom!0 (_2!4225 lt!143244) (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288))) (tuple2!7963 (_2!4240 lt!144035) (_1!4240 lt!144035)))))

(declare-fun bs!7637 () Bool)

(assert (= bs!7637 d!31222))

(assert (=> bs!7637 m!143309))

(declare-fun m!144439 () Bool)

(assert (=> bs!7637 m!144439))

(assert (=> b!98641 d!31222))

(declare-fun d!31224 () Bool)

(declare-fun e!64749 () Bool)

(assert (=> d!31224 e!64749))

(declare-fun res!81230 () Bool)

(assert (=> d!31224 (=> (not res!81230) (not e!64749))))

(assert (=> d!31224 (= res!81230 (invariant!0 (currentBit!4887 (_2!4225 lt!143244)) (currentByte!4892 (_2!4225 lt!143244)) (size!2111 (buf!2462 (_2!4225 lt!143244)))))))

(assert (=> d!31224 (= (readerFrom!0 (_2!4225 lt!143244) (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288)) (BitStream!3697 (buf!2462 (_2!4225 lt!143244)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)))))

(declare-fun b!99023 () Bool)

(assert (=> b!99023 (= e!64749 (invariant!0 (currentBit!4887 thiss!1288) (currentByte!4892 thiss!1288) (size!2111 (buf!2462 (_2!4225 lt!143244)))))))

(assert (= (and d!31224 res!81230) b!99023))

(assert (=> d!31224 m!144185))

(declare-fun m!144441 () Bool)

(assert (=> b!99023 m!144441))

(assert (=> b!98641 d!31224))

(declare-fun d!31226 () Bool)

(declare-fun e!64752 () Bool)

(assert (=> d!31226 e!64752))

(declare-fun res!81233 () Bool)

(assert (=> d!31226 (=> (not res!81233) (not e!64752))))

(declare-fun lt!144046 () tuple2!7958)

(assert (=> d!31226 (= res!81233 (= (buf!2462 (_2!4231 lt!144046)) (buf!2462 (_1!4223 lt!142600))))))

(declare-fun lt!144044 () tuple2!7958)

(assert (=> d!31226 (= lt!144046 (tuple2!7959 (_1!4231 lt!144044) (_2!4231 lt!144044)))))

(assert (=> d!31226 (= lt!144044 (readNLeastSignificantBitsLoop!0 (_1!4223 lt!142600) nBits!388 #b00000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!31226 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000))))

(assert (=> d!31226 (= (readNLeastSignificantBits!0 (_1!4223 lt!142600) nBits!388) lt!144046)))

(declare-fun lt!144045 () (_ BitVec 64))

(declare-fun b!99026 () Bool)

(declare-fun lt!144047 () (_ BitVec 64))

(assert (=> b!99026 (= e!64752 (= (bitIndex!0 (size!2111 (buf!2462 (_2!4231 lt!144046))) (currentByte!4892 (_2!4231 lt!144046)) (currentBit!4887 (_2!4231 lt!144046))) (bvadd lt!144045 lt!144047)))))

(assert (=> b!99026 (or (not (= (bvand lt!144045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144047 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144045 lt!144047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!99026 (= lt!144047 ((_ sign_extend 32) nBits!388))))

(assert (=> b!99026 (= lt!144045 (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!142600))) (currentByte!4892 (_1!4223 lt!142600)) (currentBit!4887 (_1!4223 lt!142600))))))

(assert (= (and d!31226 res!81233) b!99026))

(declare-fun m!144443 () Bool)

(assert (=> d!31226 m!144443))

(declare-fun m!144445 () Bool)

(assert (=> b!99026 m!144445))

(declare-fun m!144447 () Bool)

(assert (=> b!99026 m!144447))

(assert (=> d!30796 d!31226))

(declare-fun d!31228 () Bool)

(declare-fun res!81236 () Bool)

(declare-fun e!64753 () Bool)

(assert (=> d!31228 (=> (not res!81236) (not e!64753))))

(assert (=> d!31228 (= res!81236 (= (size!2111 (buf!2462 (_1!4223 lt!142674))) (size!2111 (buf!2462 (_2!4223 lt!142674)))))))

(assert (=> d!31228 (= (isPrefixOf!0 (_1!4223 lt!142674) (_2!4223 lt!142674)) e!64753)))

(declare-fun b!99027 () Bool)

(declare-fun res!81234 () Bool)

(assert (=> b!99027 (=> (not res!81234) (not e!64753))))

(assert (=> b!99027 (= res!81234 (bvsle (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!142674))) (currentByte!4892 (_1!4223 lt!142674)) (currentBit!4887 (_1!4223 lt!142674))) (bitIndex!0 (size!2111 (buf!2462 (_2!4223 lt!142674))) (currentByte!4892 (_2!4223 lt!142674)) (currentBit!4887 (_2!4223 lt!142674)))))))

(declare-fun b!99028 () Bool)

(declare-fun e!64754 () Bool)

(assert (=> b!99028 (= e!64753 e!64754)))

(declare-fun res!81235 () Bool)

(assert (=> b!99028 (=> res!81235 e!64754)))

(assert (=> b!99028 (= res!81235 (= (size!2111 (buf!2462 (_1!4223 lt!142674))) #b00000000000000000000000000000000))))

(declare-fun b!99029 () Bool)

(assert (=> b!99029 (= e!64754 (arrayBitRangesEq!0 (buf!2462 (_1!4223 lt!142674)) (buf!2462 (_2!4223 lt!142674)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!142674))) (currentByte!4892 (_1!4223 lt!142674)) (currentBit!4887 (_1!4223 lt!142674)))))))

(assert (= (and d!31228 res!81236) b!99027))

(assert (= (and b!99027 res!81234) b!99028))

(assert (= (and b!99028 (not res!81235)) b!99029))

(declare-fun m!144449 () Bool)

(assert (=> b!99027 m!144449))

(assert (=> b!99027 m!144431))

(assert (=> b!99029 m!144449))

(assert (=> b!99029 m!144449))

(declare-fun m!144451 () Bool)

(assert (=> b!99029 m!144451))

(assert (=> d!30806 d!31228))

(declare-fun d!31230 () Bool)

(assert (=> d!31230 (isPrefixOf!0 (_2!4225 lt!142601) (_2!4225 lt!142601))))

(declare-fun lt!144048 () Unit!6031)

(assert (=> d!31230 (= lt!144048 (choose!11 (_2!4225 lt!142601)))))

(assert (=> d!31230 (= (lemmaIsPrefixRefl!0 (_2!4225 lt!142601)) lt!144048)))

(declare-fun bs!7638 () Bool)

(assert (= bs!7638 d!31230))

(assert (=> bs!7638 m!143015))

(declare-fun m!144453 () Bool)

(assert (=> bs!7638 m!144453))

(assert (=> d!30806 d!31230))

(declare-fun d!31232 () Bool)

(declare-fun res!81239 () Bool)

(declare-fun e!64755 () Bool)

(assert (=> d!31232 (=> (not res!81239) (not e!64755))))

(assert (=> d!31232 (= res!81239 (= (size!2111 (buf!2462 thiss!1288)) (size!2111 (buf!2462 thiss!1288))))))

(assert (=> d!31232 (= (isPrefixOf!0 thiss!1288 thiss!1288) e!64755)))

(declare-fun b!99030 () Bool)

(declare-fun res!81237 () Bool)

(assert (=> b!99030 (=> (not res!81237) (not e!64755))))

(assert (=> b!99030 (= res!81237 (bvsle (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288)) (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(declare-fun b!99031 () Bool)

(declare-fun e!64756 () Bool)

(assert (=> b!99031 (= e!64755 e!64756)))

(declare-fun res!81238 () Bool)

(assert (=> b!99031 (=> res!81238 e!64756)))

(assert (=> b!99031 (= res!81238 (= (size!2111 (buf!2462 thiss!1288)) #b00000000000000000000000000000000))))

(declare-fun b!99032 () Bool)

(assert (=> b!99032 (= e!64756 (arrayBitRangesEq!0 (buf!2462 thiss!1288) (buf!2462 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(assert (= (and d!31232 res!81239) b!99030))

(assert (= (and b!99030 res!81237) b!99031))

(assert (= (and b!99031 (not res!81238)) b!99032))

(assert (=> b!99030 m!142957))

(assert (=> b!99030 m!142957))

(assert (=> b!99032 m!142957))

(assert (=> b!99032 m!142957))

(declare-fun m!144455 () Bool)

(assert (=> b!99032 m!144455))

(assert (=> d!30806 d!31232))

(declare-fun d!31234 () Bool)

(declare-fun res!81242 () Bool)

(declare-fun e!64757 () Bool)

(assert (=> d!31234 (=> (not res!81242) (not e!64757))))

(assert (=> d!31234 (= res!81242 (= (size!2111 (buf!2462 lt!142673)) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (=> d!31234 (= (isPrefixOf!0 lt!142673 (_2!4225 lt!142601)) e!64757)))

(declare-fun b!99033 () Bool)

(declare-fun res!81240 () Bool)

(assert (=> b!99033 (=> (not res!81240) (not e!64757))))

(assert (=> b!99033 (= res!81240 (bvsle (bitIndex!0 (size!2111 (buf!2462 lt!142673)) (currentByte!4892 lt!142673) (currentBit!4887 lt!142673)) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601)))))))

(declare-fun b!99034 () Bool)

(declare-fun e!64758 () Bool)

(assert (=> b!99034 (= e!64757 e!64758)))

(declare-fun res!81241 () Bool)

(assert (=> b!99034 (=> res!81241 e!64758)))

(assert (=> b!99034 (= res!81241 (= (size!2111 (buf!2462 lt!142673)) #b00000000000000000000000000000000))))

(declare-fun b!99035 () Bool)

(assert (=> b!99035 (= e!64758 (arrayBitRangesEq!0 (buf!2462 lt!142673) (buf!2462 (_2!4225 lt!142601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 lt!142673)) (currentByte!4892 lt!142673) (currentBit!4887 lt!142673))))))

(assert (= (and d!31234 res!81242) b!99033))

(assert (= (and b!99033 res!81240) b!99034))

(assert (= (and b!99034 (not res!81241)) b!99035))

(declare-fun m!144457 () Bool)

(assert (=> b!99033 m!144457))

(assert (=> b!99033 m!142955))

(assert (=> b!99035 m!144457))

(assert (=> b!99035 m!144457))

(declare-fun m!144459 () Bool)

(assert (=> b!99035 m!144459))

(assert (=> d!30806 d!31234))

(declare-fun d!31236 () Bool)

(assert (=> d!31236 (isPrefixOf!0 thiss!1288 thiss!1288)))

(declare-fun lt!144049 () Unit!6031)

(assert (=> d!31236 (= lt!144049 (choose!11 thiss!1288))))

(assert (=> d!31236 (= (lemmaIsPrefixRefl!0 thiss!1288) lt!144049)))

(declare-fun bs!7639 () Bool)

(assert (= bs!7639 d!31236))

(assert (=> bs!7639 m!143007))

(declare-fun m!144461 () Bool)

(assert (=> bs!7639 m!144461))

(assert (=> d!30806 d!31236))

(declare-fun d!31238 () Bool)

(declare-fun res!81245 () Bool)

(declare-fun e!64759 () Bool)

(assert (=> d!31238 (=> (not res!81245) (not e!64759))))

(assert (=> d!31238 (= res!81245 (= (size!2111 (buf!2462 lt!142673)) (size!2111 (buf!2462 lt!142673))))))

(assert (=> d!31238 (= (isPrefixOf!0 lt!142673 lt!142673) e!64759)))

(declare-fun b!99036 () Bool)

(declare-fun res!81243 () Bool)

(assert (=> b!99036 (=> (not res!81243) (not e!64759))))

(assert (=> b!99036 (= res!81243 (bvsle (bitIndex!0 (size!2111 (buf!2462 lt!142673)) (currentByte!4892 lt!142673) (currentBit!4887 lt!142673)) (bitIndex!0 (size!2111 (buf!2462 lt!142673)) (currentByte!4892 lt!142673) (currentBit!4887 lt!142673))))))

(declare-fun b!99037 () Bool)

(declare-fun e!64760 () Bool)

(assert (=> b!99037 (= e!64759 e!64760)))

(declare-fun res!81244 () Bool)

(assert (=> b!99037 (=> res!81244 e!64760)))

(assert (=> b!99037 (= res!81244 (= (size!2111 (buf!2462 lt!142673)) #b00000000000000000000000000000000))))

(declare-fun b!99038 () Bool)

(assert (=> b!99038 (= e!64760 (arrayBitRangesEq!0 (buf!2462 lt!142673) (buf!2462 lt!142673) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 lt!142673)) (currentByte!4892 lt!142673) (currentBit!4887 lt!142673))))))

(assert (= (and d!31238 res!81245) b!99036))

(assert (= (and b!99036 res!81243) b!99037))

(assert (= (and b!99037 (not res!81244)) b!99038))

(assert (=> b!99036 m!144457))

(assert (=> b!99036 m!144457))

(assert (=> b!99038 m!144457))

(assert (=> b!99038 m!144457))

(declare-fun m!144463 () Bool)

(assert (=> b!99038 m!144463))

(assert (=> d!30806 d!31238))

(declare-fun d!31240 () Bool)

(assert (=> d!31240 (isPrefixOf!0 lt!142673 (_2!4225 lt!142601))))

(declare-fun lt!144050 () Unit!6031)

(assert (=> d!31240 (= lt!144050 (choose!30 lt!142673 thiss!1288 (_2!4225 lt!142601)))))

(assert (=> d!31240 (isPrefixOf!0 lt!142673 thiss!1288)))

(assert (=> d!31240 (= (lemmaIsPrefixTransitive!0 lt!142673 thiss!1288 (_2!4225 lt!142601)) lt!144050)))

(declare-fun bs!7640 () Bool)

(assert (= bs!7640 d!31240))

(assert (=> bs!7640 m!143025))

(declare-fun m!144465 () Bool)

(assert (=> bs!7640 m!144465))

(declare-fun m!144467 () Bool)

(assert (=> bs!7640 m!144467))

(assert (=> d!30806 d!31240))

(assert (=> d!30806 d!30858))

(declare-fun d!31242 () Bool)

(assert (=> d!31242 (isPrefixOf!0 lt!142673 (_2!4225 lt!142601))))

(declare-fun lt!144051 () Unit!6031)

(assert (=> d!31242 (= lt!144051 (choose!30 lt!142673 (_2!4225 lt!142601) (_2!4225 lt!142601)))))

(assert (=> d!31242 (isPrefixOf!0 lt!142673 (_2!4225 lt!142601))))

(assert (=> d!31242 (= (lemmaIsPrefixTransitive!0 lt!142673 (_2!4225 lt!142601) (_2!4225 lt!142601)) lt!144051)))

(declare-fun bs!7641 () Bool)

(assert (= bs!7641 d!31242))

(assert (=> bs!7641 m!143025))

(declare-fun m!144469 () Bool)

(assert (=> bs!7641 m!144469))

(assert (=> bs!7641 m!143025))

(assert (=> d!30806 d!31242))

(declare-fun d!31244 () Bool)

(assert (=> d!31244 (isPrefixOf!0 lt!142673 lt!142673)))

(declare-fun lt!144052 () Unit!6031)

(assert (=> d!31244 (= lt!144052 (choose!11 lt!142673))))

(assert (=> d!31244 (= (lemmaIsPrefixRefl!0 lt!142673) lt!144052)))

(declare-fun bs!7642 () Bool)

(assert (= bs!7642 d!31244))

(assert (=> bs!7642 m!143017))

(declare-fun m!144471 () Bool)

(assert (=> bs!7642 m!144471))

(assert (=> d!30806 d!31244))

(declare-fun d!31246 () Bool)

(declare-fun res!81248 () Bool)

(declare-fun e!64761 () Bool)

(assert (=> d!31246 (=> (not res!81248) (not e!64761))))

(assert (=> d!31246 (= res!81248 (= (size!2111 (buf!2462 (_2!4225 lt!142601))) (size!2111 (buf!2462 (_2!4225 lt!142601)))))))

(assert (=> d!31246 (= (isPrefixOf!0 (_2!4225 lt!142601) (_2!4225 lt!142601)) e!64761)))

(declare-fun b!99039 () Bool)

(declare-fun res!81246 () Bool)

(assert (=> b!99039 (=> (not res!81246) (not e!64761))))

(assert (=> b!99039 (= res!81246 (bvsle (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601))) (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601)))))))

(declare-fun b!99040 () Bool)

(declare-fun e!64762 () Bool)

(assert (=> b!99040 (= e!64761 e!64762)))

(declare-fun res!81247 () Bool)

(assert (=> b!99040 (=> res!81247 e!64762)))

(assert (=> b!99040 (= res!81247 (= (size!2111 (buf!2462 (_2!4225 lt!142601))) #b00000000000000000000000000000000))))

(declare-fun b!99041 () Bool)

(assert (=> b!99041 (= e!64762 (arrayBitRangesEq!0 (buf!2462 (_2!4225 lt!142601)) (buf!2462 (_2!4225 lt!142601)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 (_2!4225 lt!142601))) (currentByte!4892 (_2!4225 lt!142601)) (currentBit!4887 (_2!4225 lt!142601)))))))

(assert (= (and d!31246 res!81248) b!99039))

(assert (= (and b!99039 res!81246) b!99040))

(assert (= (and b!99040 (not res!81247)) b!99041))

(assert (=> b!99039 m!142955))

(assert (=> b!99039 m!142955))

(assert (=> b!99041 m!142955))

(assert (=> b!99041 m!142955))

(declare-fun m!144473 () Bool)

(assert (=> b!99041 m!144473))

(assert (=> d!30806 d!31246))

(declare-fun d!31248 () Bool)

(declare-fun res!81251 () Bool)

(declare-fun e!64763 () Bool)

(assert (=> d!31248 (=> (not res!81251) (not e!64763))))

(assert (=> d!31248 (= res!81251 (= (size!2111 (buf!2462 (_1!4223 lt!142674))) (size!2111 (buf!2462 thiss!1288))))))

(assert (=> d!31248 (= (isPrefixOf!0 (_1!4223 lt!142674) thiss!1288) e!64763)))

(declare-fun b!99042 () Bool)

(declare-fun res!81249 () Bool)

(assert (=> b!99042 (=> (not res!81249) (not e!64763))))

(assert (=> b!99042 (= res!81249 (bvsle (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!142674))) (currentByte!4892 (_1!4223 lt!142674)) (currentBit!4887 (_1!4223 lt!142674))) (bitIndex!0 (size!2111 (buf!2462 thiss!1288)) (currentByte!4892 thiss!1288) (currentBit!4887 thiss!1288))))))

(declare-fun b!99043 () Bool)

(declare-fun e!64764 () Bool)

(assert (=> b!99043 (= e!64763 e!64764)))

(declare-fun res!81250 () Bool)

(assert (=> b!99043 (=> res!81250 e!64764)))

(assert (=> b!99043 (= res!81250 (= (size!2111 (buf!2462 (_1!4223 lt!142674))) #b00000000000000000000000000000000))))

(declare-fun b!99044 () Bool)

(assert (=> b!99044 (= e!64764 (arrayBitRangesEq!0 (buf!2462 (_1!4223 lt!142674)) (buf!2462 thiss!1288) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2111 (buf!2462 (_1!4223 lt!142674))) (currentByte!4892 (_1!4223 lt!142674)) (currentBit!4887 (_1!4223 lt!142674)))))))

(assert (= (and d!31248 res!81251) b!99042))

(assert (= (and b!99042 res!81249) b!99043))

(assert (= (and b!99043 (not res!81250)) b!99044))

(assert (=> b!99042 m!144449))

(assert (=> b!99042 m!142957))

(assert (=> b!99044 m!144449))

(assert (=> b!99044 m!144449))

(declare-fun m!144475 () Bool)

(assert (=> b!99044 m!144475))

(assert (=> b!98461 d!31248))

(check-sat (not d!31240) (not d!31218) (not b!98969) (not b!98992) (not b!99018) (not b!98952) (not b!98945) (not b!98943) (not d!31122) (not b!99013) (not d!31184) (not b!98994) (not b!98940) (not d!31226) (not b!99032) (not b!98980) (not d!31132) (not b!99029) (not b!99020) (not b!99033) (not d!31164) (not d!31134) (not b!98987) (not d!31128) (not d!31190) (not b!98944) (not b!99036) (not d!31188) (not d!31222) (not b!99015) (not d!31194) (not d!31150) (not b!98950) (not b!98995) (not b!99023) (not d!31200) (not d!31152) (not d!31196) (not b!98973) (not d!31146) (not d!31180) (not d!31124) (not b!99016) (not b!99041) (not d!31192) (not d!31208) (not b!98931) (not d!31212) (not b!99030) (not d!31230) (not d!31224) (not d!31210) (not d!31214) (not b!98974) (not b!98977) (not d!31244) (not d!31242) (not d!31216) (not b!99039) (not b!98961) (not b!98978) (not b!98970) (not b!99014) (not d!31204) (not d!31172) (not b!99027) (not bm!1243) (not b!98933) (not bm!1241) (not b!98996) (not b!98938) (not d!31138) (not d!31186) (not b!98991) (not d!31206) (not b!99044) (not bm!1242) (not d!31168) (not d!31182) (not b!98941) (not b!98962) (not b!98964) (not b!98932) (not b!98990) (not d!31198) (not d!31202) (not b!98959) (not d!31130) (not b!99038) (not d!31236) (not b!99026) (not d!31176) (not b!98989) (not b!98975) (not b!98971) (not b!98942) (not b!99042) (not b!99035) (not d!31178))
(check-sat)
