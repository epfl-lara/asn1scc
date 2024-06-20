; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29328 () Bool)

(assert start!29328)

(declare-fun b!152028 () Bool)

(declare-fun e!101642 () Bool)

(declare-datatypes ((array!6787 0))(
  ( (array!6788 (arr!3888 (Array (_ BitVec 32) (_ BitVec 8))) (size!3071 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5400 0))(
  ( (BitStream!5401 (buf!3568 array!6787) (currentByte!6500 (_ BitVec 32)) (currentBit!6495 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5400)

(declare-fun array_inv!2860 (array!6787) Bool)

(assert (=> b!152028 (= e!101642 (array_inv!2860 (buf!3568 thiss!1634)))))

(declare-fun res!127480 () Bool)

(declare-fun e!101641 () Bool)

(assert (=> start!29328 (=> (not res!127480) (not e!101641))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!6787)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!29328 (= res!127480 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3071 arr!237))))))

(assert (=> start!29328 e!101641))

(assert (=> start!29328 true))

(assert (=> start!29328 (array_inv!2860 arr!237)))

(declare-fun inv!12 (BitStream!5400) Bool)

(assert (=> start!29328 (and (inv!12 thiss!1634) e!101642)))

(declare-fun b!152029 () Bool)

(declare-fun e!101643 () Bool)

(assert (=> b!152029 (= e!101641 (not e!101643))))

(declare-fun res!127481 () Bool)

(assert (=> b!152029 (=> res!127481 e!101643)))

(declare-fun lt!238033 () (_ BitVec 64))

(declare-fun lt!238031 () (_ BitVec 64))

(assert (=> b!152029 (= res!127481 (not (= lt!238033 (bvadd lt!238033 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!238031)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152029 (= lt!238033 (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)))))

(assert (=> b!152029 (= lt!238031 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun isPrefixOf!0 (BitStream!5400 BitStream!5400) Bool)

(assert (=> b!152029 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9654 0))(
  ( (Unit!9655) )
))
(declare-fun lt!238032 () Unit!9654)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5400) Unit!9654)

(assert (=> b!152029 (= lt!238032 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun b!152030 () Bool)

(declare-fun res!127478 () Bool)

(assert (=> b!152030 (=> (not res!127478) (not e!101641))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!152030 (= res!127478 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!152031 () Bool)

(declare-fun res!127482 () Bool)

(assert (=> b!152031 (=> (not res!127482) (not e!101641))))

(assert (=> b!152031 (= res!127482 (bvsge from!447 to!404))))

(declare-fun b!152032 () Bool)

(declare-fun e!101640 () Bool)

(assert (=> b!152032 (= e!101643 e!101640)))

(declare-fun res!127479 () Bool)

(assert (=> b!152032 (=> res!127479 e!101640)))

(assert (=> b!152032 (= res!127479 (bvslt lt!238031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!13536 0))(
  ( (tuple2!13537 (_1!7143 BitStream!5400) (_2!7143 BitStream!5400)) )
))
(declare-fun lt!238030 () tuple2!13536)

(declare-fun reader!0 (BitStream!5400 BitStream!5400) tuple2!13536)

(assert (=> b!152032 (= lt!238030 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!152033 () Bool)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152033 (= e!101640 (validate_offset_bits!1 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634)) lt!238031))))

(assert (= (and start!29328 res!127480) b!152030))

(assert (= (and b!152030 res!127478) b!152031))

(assert (= (and b!152031 res!127482) b!152029))

(assert (= (and b!152029 (not res!127481)) b!152032))

(assert (= (and b!152032 (not res!127479)) b!152033))

(assert (= start!29328 b!152028))

(declare-fun m!237745 () Bool)

(assert (=> b!152029 m!237745))

(declare-fun m!237747 () Bool)

(assert (=> b!152029 m!237747))

(declare-fun m!237749 () Bool)

(assert (=> b!152029 m!237749))

(declare-fun m!237751 () Bool)

(assert (=> b!152032 m!237751))

(declare-fun m!237753 () Bool)

(assert (=> b!152028 m!237753))

(declare-fun m!237755 () Bool)

(assert (=> b!152033 m!237755))

(declare-fun m!237757 () Bool)

(assert (=> b!152030 m!237757))

(declare-fun m!237759 () Bool)

(assert (=> start!29328 m!237759))

(declare-fun m!237761 () Bool)

(assert (=> start!29328 m!237761))

(check-sat (not b!152032) (not start!29328) (not b!152033) (not b!152028) (not b!152029) (not b!152030))
(check-sat)
(get-model)

(declare-fun d!49872 () Bool)

(assert (=> d!49872 (= (array_inv!2860 (buf!3568 thiss!1634)) (bvsge (size!3071 (buf!3568 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!152028 d!49872))

(declare-fun d!49874 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49874 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634)) lt!238031) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634))) lt!238031))))

(declare-fun bs!12192 () Bool)

(assert (= bs!12192 d!49874))

(declare-fun m!237837 () Bool)

(assert (=> bs!12192 m!237837))

(assert (=> b!152033 d!49874))

(declare-fun b!152122 () Bool)

(declare-fun e!101696 () Unit!9654)

(declare-fun lt!238256 () Unit!9654)

(assert (=> b!152122 (= e!101696 lt!238256)))

(declare-fun lt!238253 () (_ BitVec 64))

(assert (=> b!152122 (= lt!238253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!238254 () (_ BitVec 64))

(assert (=> b!152122 (= lt!238254 (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6787 array!6787 (_ BitVec 64) (_ BitVec 64)) Unit!9654)

(assert (=> b!152122 (= lt!238256 (arrayBitRangesEqSymmetric!0 (buf!3568 thiss!1634) (buf!3568 thiss!1634) lt!238253 lt!238254))))

(declare-fun arrayBitRangesEq!0 (array!6787 array!6787 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!152122 (arrayBitRangesEq!0 (buf!3568 thiss!1634) (buf!3568 thiss!1634) lt!238253 lt!238254)))

(declare-fun b!152123 () Bool)

(declare-fun e!101697 () Bool)

(declare-fun lt!238265 () tuple2!13536)

(declare-fun lt!238258 () (_ BitVec 64))

(declare-fun lt!238251 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5400 (_ BitVec 64)) BitStream!5400)

(assert (=> b!152123 (= e!101697 (= (_1!7143 lt!238265) (withMovedBitIndex!0 (_2!7143 lt!238265) (bvsub lt!238258 lt!238251))))))

(assert (=> b!152123 (or (= (bvand lt!238258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238251 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238258 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238258 lt!238251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!152123 (= lt!238251 (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)))))

(assert (=> b!152123 (= lt!238258 (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)))))

(declare-fun d!49876 () Bool)

(assert (=> d!49876 e!101697))

(declare-fun res!127553 () Bool)

(assert (=> d!49876 (=> (not res!127553) (not e!101697))))

(assert (=> d!49876 (= res!127553 (isPrefixOf!0 (_1!7143 lt!238265) (_2!7143 lt!238265)))))

(declare-fun lt!238267 () BitStream!5400)

(assert (=> d!49876 (= lt!238265 (tuple2!13537 lt!238267 thiss!1634))))

(declare-fun lt!238266 () Unit!9654)

(declare-fun lt!238257 () Unit!9654)

(assert (=> d!49876 (= lt!238266 lt!238257)))

(assert (=> d!49876 (isPrefixOf!0 lt!238267 thiss!1634)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5400 BitStream!5400 BitStream!5400) Unit!9654)

(assert (=> d!49876 (= lt!238257 (lemmaIsPrefixTransitive!0 lt!238267 thiss!1634 thiss!1634))))

(declare-fun lt!238261 () Unit!9654)

(declare-fun lt!238250 () Unit!9654)

(assert (=> d!49876 (= lt!238261 lt!238250)))

(assert (=> d!49876 (isPrefixOf!0 lt!238267 thiss!1634)))

(assert (=> d!49876 (= lt!238250 (lemmaIsPrefixTransitive!0 lt!238267 thiss!1634 thiss!1634))))

(declare-fun lt!238249 () Unit!9654)

(assert (=> d!49876 (= lt!238249 e!101696)))

(declare-fun c!8127 () Bool)

(assert (=> d!49876 (= c!8127 (not (= (size!3071 (buf!3568 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!238263 () Unit!9654)

(declare-fun lt!238255 () Unit!9654)

(assert (=> d!49876 (= lt!238263 lt!238255)))

(assert (=> d!49876 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49876 (= lt!238255 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238260 () Unit!9654)

(declare-fun lt!238259 () Unit!9654)

(assert (=> d!49876 (= lt!238260 lt!238259)))

(assert (=> d!49876 (= lt!238259 (lemmaIsPrefixRefl!0 thiss!1634))))

(declare-fun lt!238264 () Unit!9654)

(declare-fun lt!238248 () Unit!9654)

(assert (=> d!49876 (= lt!238264 lt!238248)))

(assert (=> d!49876 (isPrefixOf!0 lt!238267 lt!238267)))

(assert (=> d!49876 (= lt!238248 (lemmaIsPrefixRefl!0 lt!238267))))

(declare-fun lt!238262 () Unit!9654)

(declare-fun lt!238252 () Unit!9654)

(assert (=> d!49876 (= lt!238262 lt!238252)))

(assert (=> d!49876 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49876 (= lt!238252 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49876 (= lt!238267 (BitStream!5401 (buf!3568 thiss!1634) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)))))

(assert (=> d!49876 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49876 (= (reader!0 thiss!1634 thiss!1634) lt!238265)))

(declare-fun b!152124 () Bool)

(declare-fun res!127552 () Bool)

(assert (=> b!152124 (=> (not res!127552) (not e!101697))))

(assert (=> b!152124 (= res!127552 (isPrefixOf!0 (_2!7143 lt!238265) thiss!1634))))

(declare-fun b!152125 () Bool)

(declare-fun res!127554 () Bool)

(assert (=> b!152125 (=> (not res!127554) (not e!101697))))

(assert (=> b!152125 (= res!127554 (isPrefixOf!0 (_1!7143 lt!238265) thiss!1634))))

(declare-fun b!152126 () Bool)

(declare-fun Unit!9660 () Unit!9654)

(assert (=> b!152126 (= e!101696 Unit!9660)))

(assert (= (and d!49876 c!8127) b!152122))

(assert (= (and d!49876 (not c!8127)) b!152126))

(assert (= (and d!49876 res!127553) b!152125))

(assert (= (and b!152125 res!127554) b!152124))

(assert (= (and b!152124 res!127552) b!152123))

(declare-fun m!237839 () Bool)

(assert (=> b!152124 m!237839))

(declare-fun m!237841 () Bool)

(assert (=> d!49876 m!237841))

(assert (=> d!49876 m!237747))

(assert (=> d!49876 m!237749))

(declare-fun m!237843 () Bool)

(assert (=> d!49876 m!237843))

(assert (=> d!49876 m!237749))

(assert (=> d!49876 m!237747))

(declare-fun m!237845 () Bool)

(assert (=> d!49876 m!237845))

(assert (=> d!49876 m!237747))

(assert (=> d!49876 m!237845))

(declare-fun m!237847 () Bool)

(assert (=> d!49876 m!237847))

(declare-fun m!237849 () Bool)

(assert (=> d!49876 m!237849))

(assert (=> b!152122 m!237745))

(declare-fun m!237851 () Bool)

(assert (=> b!152122 m!237851))

(declare-fun m!237853 () Bool)

(assert (=> b!152122 m!237853))

(declare-fun m!237855 () Bool)

(assert (=> b!152123 m!237855))

(assert (=> b!152123 m!237745))

(assert (=> b!152123 m!237745))

(declare-fun m!237857 () Bool)

(assert (=> b!152125 m!237857))

(assert (=> b!152032 d!49876))

(declare-fun d!49878 () Bool)

(assert (=> d!49878 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12193 () Bool)

(assert (= bs!12193 d!49878))

(assert (=> bs!12193 m!237837))

(assert (=> b!152030 d!49878))

(declare-fun d!49880 () Bool)

(assert (=> d!49880 (= (array_inv!2860 arr!237) (bvsge (size!3071 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29328 d!49880))

(declare-fun d!49882 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!49882 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6495 thiss!1634) (currentByte!6500 thiss!1634) (size!3071 (buf!3568 thiss!1634))))))

(declare-fun bs!12194 () Bool)

(assert (= bs!12194 d!49882))

(declare-fun m!237859 () Bool)

(assert (=> bs!12194 m!237859))

(assert (=> start!29328 d!49882))

(declare-fun d!49884 () Bool)

(declare-fun e!101700 () Bool)

(assert (=> d!49884 e!101700))

(declare-fun res!127559 () Bool)

(assert (=> d!49884 (=> (not res!127559) (not e!101700))))

(declare-fun lt!238285 () (_ BitVec 64))

(declare-fun lt!238280 () (_ BitVec 64))

(declare-fun lt!238282 () (_ BitVec 64))

(assert (=> d!49884 (= res!127559 (= lt!238282 (bvsub lt!238285 lt!238280)))))

(assert (=> d!49884 (or (= (bvand lt!238285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!238280 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!238285 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!238285 lt!238280) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49884 (= lt!238280 (remainingBits!0 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))) ((_ sign_extend 32) (currentByte!6500 thiss!1634)) ((_ sign_extend 32) (currentBit!6495 thiss!1634))))))

(declare-fun lt!238283 () (_ BitVec 64))

(declare-fun lt!238281 () (_ BitVec 64))

(assert (=> d!49884 (= lt!238285 (bvmul lt!238283 lt!238281))))

(assert (=> d!49884 (or (= lt!238283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!238281 (bvsdiv (bvmul lt!238283 lt!238281) lt!238283)))))

(assert (=> d!49884 (= lt!238281 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49884 (= lt!238283 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))))))

(assert (=> d!49884 (= lt!238282 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6500 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6495 thiss!1634))))))

(assert (=> d!49884 (invariant!0 (currentBit!6495 thiss!1634) (currentByte!6500 thiss!1634) (size!3071 (buf!3568 thiss!1634)))))

(assert (=> d!49884 (= (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)) lt!238282)))

(declare-fun b!152131 () Bool)

(declare-fun res!127560 () Bool)

(assert (=> b!152131 (=> (not res!127560) (not e!101700))))

(assert (=> b!152131 (= res!127560 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!238282))))

(declare-fun b!152132 () Bool)

(declare-fun lt!238284 () (_ BitVec 64))

(assert (=> b!152132 (= e!101700 (bvsle lt!238282 (bvmul lt!238284 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!152132 (or (= lt!238284 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!238284 #b0000000000000000000000000000000000000000000000000000000000001000) lt!238284)))))

(assert (=> b!152132 (= lt!238284 ((_ sign_extend 32) (size!3071 (buf!3568 thiss!1634))))))

(assert (= (and d!49884 res!127559) b!152131))

(assert (= (and b!152131 res!127560) b!152132))

(assert (=> d!49884 m!237837))

(assert (=> d!49884 m!237859))

(assert (=> b!152029 d!49884))

(declare-fun d!49886 () Bool)

(declare-fun res!127567 () Bool)

(declare-fun e!101706 () Bool)

(assert (=> d!49886 (=> (not res!127567) (not e!101706))))

(assert (=> d!49886 (= res!127567 (= (size!3071 (buf!3568 thiss!1634)) (size!3071 (buf!3568 thiss!1634))))))

(assert (=> d!49886 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!101706)))

(declare-fun b!152139 () Bool)

(declare-fun res!127569 () Bool)

(assert (=> b!152139 (=> (not res!127569) (not e!101706))))

(assert (=> b!152139 (= res!127569 (bvsle (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634)) (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634))))))

(declare-fun b!152140 () Bool)

(declare-fun e!101705 () Bool)

(assert (=> b!152140 (= e!101706 e!101705)))

(declare-fun res!127568 () Bool)

(assert (=> b!152140 (=> res!127568 e!101705)))

(assert (=> b!152140 (= res!127568 (= (size!3071 (buf!3568 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!152141 () Bool)

(assert (=> b!152141 (= e!101705 (arrayBitRangesEq!0 (buf!3568 thiss!1634) (buf!3568 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3071 (buf!3568 thiss!1634)) (currentByte!6500 thiss!1634) (currentBit!6495 thiss!1634))))))

(assert (= (and d!49886 res!127567) b!152139))

(assert (= (and b!152139 res!127569) b!152140))

(assert (= (and b!152140 (not res!127568)) b!152141))

(assert (=> b!152139 m!237745))

(assert (=> b!152139 m!237745))

(assert (=> b!152141 m!237745))

(assert (=> b!152141 m!237745))

(declare-fun m!237861 () Bool)

(assert (=> b!152141 m!237861))

(assert (=> b!152029 d!49886))

(declare-fun d!49888 () Bool)

(assert (=> d!49888 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!238288 () Unit!9654)

(declare-fun choose!11 (BitStream!5400) Unit!9654)

(assert (=> d!49888 (= lt!238288 (choose!11 thiss!1634))))

(assert (=> d!49888 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!238288)))

(declare-fun bs!12196 () Bool)

(assert (= bs!12196 d!49888))

(assert (=> bs!12196 m!237747))

(declare-fun m!237863 () Bool)

(assert (=> bs!12196 m!237863))

(assert (=> b!152029 d!49888))

(check-sat (not b!152123) (not b!152139) (not d!49888) (not d!49876) (not b!152122) (not b!152141) (not d!49884) (not d!49882) (not d!49874) (not b!152125) (not d!49878) (not b!152124))
(check-sat)
