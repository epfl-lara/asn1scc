; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57650 () Bool)

(assert start!57650)

(declare-fun b!264518 () Bool)

(declare-datatypes ((Unit!18842 0))(
  ( (Unit!18843) )
))
(declare-fun e!184647 () Unit!18842)

(declare-fun lt!405786 () Unit!18842)

(assert (=> b!264518 (= e!184647 lt!405786)))

(declare-fun lt!405791 () (_ BitVec 64))

(declare-datatypes ((array!14752 0))(
  ( (array!14753 (arr!7424 (Array (_ BitVec 32) (_ BitVec 8))) (size!6437 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11688 0))(
  ( (BitStream!11689 (buf!6905 array!14752) (currentByte!12775 (_ BitVec 32)) (currentBit!12770 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11688)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264518 (= lt!405791 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)))))

(declare-fun w2!580 () BitStream!11688)

(declare-fun arrayBitRangesEqSymmetric!0 (array!14752 array!14752 (_ BitVec 64) (_ BitVec 64)) Unit!18842)

(assert (=> b!264518 (= lt!405786 (arrayBitRangesEqSymmetric!0 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791))))

(declare-fun arrayBitRangesEq!0 (array!14752 array!14752 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!264518 (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791)))

(declare-fun b!264519 () Bool)

(declare-fun e!184649 () Bool)

(declare-fun e!184648 () Bool)

(assert (=> b!264519 (= e!184649 (not e!184648))))

(declare-fun res!221128 () Bool)

(assert (=> b!264519 (=> res!221128 e!184648)))

(declare-fun e!184653 () Bool)

(assert (=> b!264519 (= res!221128 e!184653)))

(declare-fun res!221125 () Bool)

(assert (=> b!264519 (=> (not res!221125) (not e!184653))))

(assert (=> b!264519 (= res!221125 (not (= (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun isPrefixOf!0 (BitStream!11688 BitStream!11688) Bool)

(assert (=> b!264519 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405784 () Unit!18842)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11688) Unit!18842)

(assert (=> b!264519 (= lt!405784 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405783 () BitStream!11688)

(assert (=> b!264519 (isPrefixOf!0 lt!405783 lt!405783)))

(declare-fun lt!405785 () Unit!18842)

(assert (=> b!264519 (= lt!405785 (lemmaIsPrefixRefl!0 lt!405783))))

(assert (=> b!264519 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405782 () Unit!18842)

(assert (=> b!264519 (= lt!405782 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264519 (= lt!405783 (BitStream!11689 (buf!6905 w2!580) (currentByte!12775 w1!584) (currentBit!12770 w1!584)))))

(declare-fun b!264520 () Bool)

(declare-fun e!184645 () Bool)

(declare-fun array_inv!6161 (array!14752) Bool)

(assert (=> b!264520 (= e!184645 (array_inv!6161 (buf!6905 w1!584)))))

(declare-fun b!264521 () Bool)

(declare-fun e!184644 () Bool)

(assert (=> b!264521 (= e!184644 (not (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)))))))

(declare-fun res!221127 () Bool)

(assert (=> start!57650 (=> (not res!221127) (not e!184649))))

(assert (=> start!57650 (= res!221127 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57650 e!184649))

(declare-fun inv!12 (BitStream!11688) Bool)

(assert (=> start!57650 (and (inv!12 w1!584) e!184645)))

(declare-fun e!184650 () Bool)

(assert (=> start!57650 (and (inv!12 w2!580) e!184650)))

(declare-fun b!264522 () Bool)

(declare-fun e!184646 () Bool)

(assert (=> b!264522 (= e!184648 e!184646)))

(declare-fun res!221126 () Bool)

(assert (=> b!264522 (=> res!221126 e!184646)))

(assert (=> b!264522 (= res!221126 e!184644)))

(declare-fun res!221124 () Bool)

(assert (=> b!264522 (=> (not res!221124) (not e!184644))))

(assert (=> b!264522 (= res!221124 (not (= (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun lt!405790 () Unit!18842)

(assert (=> b!264522 (= lt!405790 e!184647)))

(declare-fun c!12132 () Bool)

(assert (=> b!264522 (= c!12132 (not (= (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264523 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264523 (= e!184646 (invariant!0 (currentBit!12770 w2!580) (currentByte!12775 w2!580) (size!6437 (buf!6905 w2!580))))))

(declare-fun lt!405787 () (_ BitVec 64))

(assert (=> b!264523 (= lt!405787 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)))))

(declare-fun lt!405788 () Unit!18842)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11688 BitStream!11688 BitStream!11688) Unit!18842)

(assert (=> b!264523 (= lt!405788 (lemmaIsPrefixTransitive!0 lt!405783 w2!580 w2!580))))

(assert (=> b!264523 (isPrefixOf!0 lt!405783 w2!580)))

(declare-fun lt!405789 () Unit!18842)

(assert (=> b!264523 (= lt!405789 (lemmaIsPrefixTransitive!0 lt!405783 w1!584 w2!580))))

(declare-fun b!264524 () Bool)

(assert (=> b!264524 (= e!184650 (array_inv!6161 (buf!6905 w2!580)))))

(declare-fun b!264525 () Bool)

(assert (=> b!264525 (= e!184653 (not (arrayBitRangesEq!0 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)))))))

(declare-fun b!264526 () Bool)

(declare-fun Unit!18844 () Unit!18842)

(assert (=> b!264526 (= e!184647 Unit!18844)))

(declare-fun b!264527 () Bool)

(declare-fun res!221123 () Bool)

(assert (=> b!264527 (=> res!221123 e!184646)))

(assert (=> b!264527 (= res!221123 (not (isPrefixOf!0 lt!405783 w1!584)))))

(assert (= (and start!57650 res!221127) b!264519))

(assert (= (and b!264519 res!221125) b!264525))

(assert (= (and b!264519 (not res!221128)) b!264522))

(assert (= (and b!264522 c!12132) b!264518))

(assert (= (and b!264522 (not c!12132)) b!264526))

(assert (= (and b!264522 res!221124) b!264521))

(assert (= (and b!264522 (not res!221126)) b!264527))

(assert (= (and b!264527 (not res!221123)) b!264523))

(assert (= start!57650 b!264520))

(assert (= start!57650 b!264524))

(declare-fun m!395033 () Bool)

(assert (=> b!264521 m!395033))

(assert (=> b!264521 m!395033))

(declare-fun m!395035 () Bool)

(assert (=> b!264521 m!395035))

(declare-fun m!395037 () Bool)

(assert (=> start!57650 m!395037))

(declare-fun m!395039 () Bool)

(assert (=> start!57650 m!395039))

(declare-fun m!395041 () Bool)

(assert (=> start!57650 m!395041))

(declare-fun m!395043 () Bool)

(assert (=> b!264520 m!395043))

(declare-fun m!395045 () Bool)

(assert (=> b!264527 m!395045))

(assert (=> b!264518 m!395033))

(declare-fun m!395047 () Bool)

(assert (=> b!264518 m!395047))

(declare-fun m!395049 () Bool)

(assert (=> b!264518 m!395049))

(assert (=> b!264525 m!395033))

(assert (=> b!264525 m!395033))

(declare-fun m!395051 () Bool)

(assert (=> b!264525 m!395051))

(declare-fun m!395053 () Bool)

(assert (=> b!264519 m!395053))

(declare-fun m!395055 () Bool)

(assert (=> b!264519 m!395055))

(declare-fun m!395057 () Bool)

(assert (=> b!264519 m!395057))

(declare-fun m!395059 () Bool)

(assert (=> b!264519 m!395059))

(declare-fun m!395061 () Bool)

(assert (=> b!264519 m!395061))

(declare-fun m!395063 () Bool)

(assert (=> b!264519 m!395063))

(declare-fun m!395065 () Bool)

(assert (=> b!264524 m!395065))

(assert (=> b!264523 m!395033))

(declare-fun m!395067 () Bool)

(assert (=> b!264523 m!395067))

(declare-fun m!395069 () Bool)

(assert (=> b!264523 m!395069))

(declare-fun m!395071 () Bool)

(assert (=> b!264523 m!395071))

(declare-fun m!395073 () Bool)

(assert (=> b!264523 m!395073))

(check-sat (not b!264518) (not start!57650) (not b!264525) (not b!264527) (not b!264523) (not b!264524) (not b!264520) (not b!264519) (not b!264521))
(check-sat)
(get-model)

(declare-fun d!89214 () Bool)

(declare-fun e!184686 () Bool)

(assert (=> d!89214 e!184686))

(declare-fun res!221151 () Bool)

(assert (=> d!89214 (=> (not res!221151) (not e!184686))))

(declare-fun lt!405838 () (_ BitVec 64))

(declare-fun lt!405837 () (_ BitVec 64))

(declare-fun lt!405834 () (_ BitVec 64))

(assert (=> d!89214 (= res!221151 (= lt!405838 (bvsub lt!405834 lt!405837)))))

(assert (=> d!89214 (or (= (bvand lt!405834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405837 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405834 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405834 lt!405837) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89214 (= lt!405837 (remainingBits!0 ((_ sign_extend 32) (size!6437 (buf!6905 w1!584))) ((_ sign_extend 32) (currentByte!12775 w1!584)) ((_ sign_extend 32) (currentBit!12770 w1!584))))))

(declare-fun lt!405835 () (_ BitVec 64))

(declare-fun lt!405836 () (_ BitVec 64))

(assert (=> d!89214 (= lt!405834 (bvmul lt!405835 lt!405836))))

(assert (=> d!89214 (or (= lt!405835 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405836 (bvsdiv (bvmul lt!405835 lt!405836) lt!405835)))))

(assert (=> d!89214 (= lt!405836 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89214 (= lt!405835 ((_ sign_extend 32) (size!6437 (buf!6905 w1!584))))))

(assert (=> d!89214 (= lt!405838 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12775 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12770 w1!584))))))

(assert (=> d!89214 (invariant!0 (currentBit!12770 w1!584) (currentByte!12775 w1!584) (size!6437 (buf!6905 w1!584)))))

(assert (=> d!89214 (= (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)) lt!405838)))

(declare-fun b!264562 () Bool)

(declare-fun res!221152 () Bool)

(assert (=> b!264562 (=> (not res!221152) (not e!184686))))

(assert (=> b!264562 (= res!221152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405838))))

(declare-fun b!264563 () Bool)

(declare-fun lt!405839 () (_ BitVec 64))

(assert (=> b!264563 (= e!184686 (bvsle lt!405838 (bvmul lt!405839 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264563 (or (= lt!405839 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405839 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405839)))))

(assert (=> b!264563 (= lt!405839 ((_ sign_extend 32) (size!6437 (buf!6905 w1!584))))))

(assert (= (and d!89214 res!221151) b!264562))

(assert (= (and b!264562 res!221152) b!264563))

(declare-fun m!395117 () Bool)

(assert (=> d!89214 m!395117))

(declare-fun m!395119 () Bool)

(assert (=> d!89214 m!395119))

(assert (=> b!264518 d!89214))

(declare-fun d!89220 () Bool)

(assert (=> d!89220 (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791)))

(declare-fun lt!405842 () Unit!18842)

(declare-fun choose!8 (array!14752 array!14752 (_ BitVec 64) (_ BitVec 64)) Unit!18842)

(assert (=> d!89220 (= lt!405842 (choose!8 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791))))

(assert (=> d!89220 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791))))

(assert (=> d!89220 (= (arrayBitRangesEqSymmetric!0 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791) lt!405842)))

(declare-fun bs!22647 () Bool)

(assert (= bs!22647 d!89220))

(assert (=> bs!22647 m!395049))

(declare-fun m!395121 () Bool)

(assert (=> bs!22647 m!395121))

(assert (=> b!264518 d!89220))

(declare-datatypes ((tuple4!348 0))(
  ( (tuple4!349 (_1!12154 (_ BitVec 32)) (_2!12154 (_ BitVec 32)) (_3!954 (_ BitVec 32)) (_4!174 (_ BitVec 32))) )
))
(declare-fun lt!405881 () tuple4!348)

(declare-fun e!184725 () Bool)

(declare-fun b!264605 () Bool)

(declare-fun arrayRangesEq!1010 (array!14752 array!14752 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264605 (= e!184725 (arrayRangesEq!1010 (buf!6905 w2!580) (buf!6905 w1!584) (_1!12154 lt!405881) (_2!12154 lt!405881)))))

(declare-fun b!264606 () Bool)

(declare-fun e!184721 () Bool)

(declare-fun call!4091 () Bool)

(assert (=> b!264606 (= e!184721 call!4091)))

(declare-fun b!264608 () Bool)

(declare-fun e!184722 () Bool)

(assert (=> b!264608 (= e!184722 e!184721)))

(declare-fun c!12141 () Bool)

(assert (=> b!264608 (= c!12141 (= (_3!954 lt!405881) (_4!174 lt!405881)))))

(declare-fun b!264609 () Bool)

(declare-fun res!221188 () Bool)

(declare-fun lt!405879 () (_ BitVec 32))

(assert (=> b!264609 (= res!221188 (= lt!405879 #b00000000000000000000000000000000))))

(declare-fun e!184724 () Bool)

(assert (=> b!264609 (=> res!221188 e!184724)))

(declare-fun e!184723 () Bool)

(assert (=> b!264609 (= e!184723 e!184724)))

(declare-fun b!264610 () Bool)

(declare-fun e!184720 () Bool)

(assert (=> b!264610 (= e!184720 e!184722)))

(declare-fun res!221185 () Bool)

(assert (=> b!264610 (=> (not res!221185) (not e!184722))))

(assert (=> b!264610 (= res!221185 e!184725)))

(declare-fun res!221187 () Bool)

(assert (=> b!264610 (=> res!221187 e!184725)))

(assert (=> b!264610 (= res!221187 (bvsge (_1!12154 lt!405881) (_2!12154 lt!405881)))))

(assert (=> b!264610 (= lt!405879 ((_ extract 31 0) (bvsrem lt!405791 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405880 () (_ BitVec 32))

(assert (=> b!264610 (= lt!405880 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!348)

(assert (=> b!264610 (= lt!405881 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791))))

(declare-fun b!264607 () Bool)

(assert (=> b!264607 (= e!184721 e!184723)))

(declare-fun res!221184 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264607 (= res!221184 (byteRangesEq!0 (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405881)) (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405881)) lt!405880 #b00000000000000000000000000001000))))

(assert (=> b!264607 (=> (not res!221184) (not e!184723))))

(declare-fun d!89222 () Bool)

(declare-fun res!221186 () Bool)

(assert (=> d!89222 (=> res!221186 e!184720)))

(assert (=> d!89222 (= res!221186 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791))))

(assert (=> d!89222 (= (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405791) e!184720)))

(declare-fun bm!4088 () Bool)

(assert (=> bm!4088 (= call!4091 (byteRangesEq!0 (ite c!12141 (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405881)) (select (arr!7424 (buf!6905 w2!580)) (_4!174 lt!405881))) (ite c!12141 (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405881)) (select (arr!7424 (buf!6905 w1!584)) (_4!174 lt!405881))) (ite c!12141 lt!405880 #b00000000000000000000000000000000) lt!405879))))

(declare-fun b!264611 () Bool)

(assert (=> b!264611 (= e!184724 call!4091)))

(assert (= (and d!89222 (not res!221186)) b!264610))

(assert (= (and b!264610 (not res!221187)) b!264605))

(assert (= (and b!264610 res!221185) b!264608))

(assert (= (and b!264608 c!12141) b!264606))

(assert (= (and b!264608 (not c!12141)) b!264607))

(assert (= (and b!264607 res!221184) b!264609))

(assert (= (and b!264609 (not res!221188)) b!264611))

(assert (= (or b!264606 b!264611) bm!4088))

(declare-fun m!395145 () Bool)

(assert (=> b!264605 m!395145))

(declare-fun m!395147 () Bool)

(assert (=> b!264610 m!395147))

(declare-fun m!395149 () Bool)

(assert (=> b!264607 m!395149))

(declare-fun m!395151 () Bool)

(assert (=> b!264607 m!395151))

(assert (=> b!264607 m!395149))

(assert (=> b!264607 m!395151))

(declare-fun m!395153 () Bool)

(assert (=> b!264607 m!395153))

(assert (=> bm!4088 m!395151))

(declare-fun m!395155 () Bool)

(assert (=> bm!4088 m!395155))

(declare-fun m!395157 () Bool)

(assert (=> bm!4088 m!395157))

(declare-fun m!395159 () Bool)

(assert (=> bm!4088 m!395159))

(assert (=> bm!4088 m!395149))

(assert (=> b!264518 d!89222))

(declare-fun d!89230 () Bool)

(assert (=> d!89230 (= (invariant!0 (currentBit!12770 w2!580) (currentByte!12775 w2!580) (size!6437 (buf!6905 w2!580))) (and (bvsge (currentBit!12770 w2!580) #b00000000000000000000000000000000) (bvslt (currentBit!12770 w2!580) #b00000000000000000000000000001000) (bvsge (currentByte!12775 w2!580) #b00000000000000000000000000000000) (or (bvslt (currentByte!12775 w2!580) (size!6437 (buf!6905 w2!580))) (and (= (currentBit!12770 w2!580) #b00000000000000000000000000000000) (= (currentByte!12775 w2!580) (size!6437 (buf!6905 w2!580)))))))))

(assert (=> b!264523 d!89230))

(declare-fun d!89232 () Bool)

(assert (=> d!89232 (isPrefixOf!0 lt!405783 w2!580)))

(declare-fun lt!405896 () Unit!18842)

(declare-fun choose!30 (BitStream!11688 BitStream!11688 BitStream!11688) Unit!18842)

(assert (=> d!89232 (= lt!405896 (choose!30 lt!405783 w1!584 w2!580))))

(assert (=> d!89232 (isPrefixOf!0 lt!405783 w1!584)))

(assert (=> d!89232 (= (lemmaIsPrefixTransitive!0 lt!405783 w1!584 w2!580) lt!405896)))

(declare-fun bs!22649 () Bool)

(assert (= bs!22649 d!89232))

(assert (=> bs!22649 m!395069))

(declare-fun m!395161 () Bool)

(assert (=> bs!22649 m!395161))

(assert (=> bs!22649 m!395045))

(assert (=> b!264523 d!89232))

(declare-fun d!89234 () Bool)

(assert (=> d!89234 (isPrefixOf!0 lt!405783 w2!580)))

(declare-fun lt!405903 () Unit!18842)

(assert (=> d!89234 (= lt!405903 (choose!30 lt!405783 w2!580 w2!580))))

(assert (=> d!89234 (isPrefixOf!0 lt!405783 w2!580)))

(assert (=> d!89234 (= (lemmaIsPrefixTransitive!0 lt!405783 w2!580 w2!580) lt!405903)))

(declare-fun bs!22650 () Bool)

(assert (= bs!22650 d!89234))

(assert (=> bs!22650 m!395069))

(declare-fun m!395163 () Bool)

(assert (=> bs!22650 m!395163))

(assert (=> bs!22650 m!395069))

(assert (=> b!264523 d!89234))

(assert (=> b!264523 d!89214))

(declare-fun d!89236 () Bool)

(declare-fun res!221209 () Bool)

(declare-fun e!184740 () Bool)

(assert (=> d!89236 (=> (not res!221209) (not e!184740))))

(assert (=> d!89236 (= res!221209 (= (size!6437 (buf!6905 lt!405783)) (size!6437 (buf!6905 w2!580))))))

(assert (=> d!89236 (= (isPrefixOf!0 lt!405783 w2!580) e!184740)))

(declare-fun b!264632 () Bool)

(declare-fun res!221211 () Bool)

(assert (=> b!264632 (=> (not res!221211) (not e!184740))))

(assert (=> b!264632 (= res!221211 (bvsle (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783)) (bitIndex!0 (size!6437 (buf!6905 w2!580)) (currentByte!12775 w2!580) (currentBit!12770 w2!580))))))

(declare-fun b!264633 () Bool)

(declare-fun e!184739 () Bool)

(assert (=> b!264633 (= e!184740 e!184739)))

(declare-fun res!221210 () Bool)

(assert (=> b!264633 (=> res!221210 e!184739)))

(assert (=> b!264633 (= res!221210 (= (size!6437 (buf!6905 lt!405783)) #b00000000000000000000000000000000))))

(declare-fun b!264634 () Bool)

(assert (=> b!264634 (= e!184739 (arrayBitRangesEq!0 (buf!6905 lt!405783) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783))))))

(assert (= (and d!89236 res!221209) b!264632))

(assert (= (and b!264632 res!221211) b!264633))

(assert (= (and b!264633 (not res!221210)) b!264634))

(declare-fun m!395169 () Bool)

(assert (=> b!264632 m!395169))

(declare-fun m!395171 () Bool)

(assert (=> b!264632 m!395171))

(assert (=> b!264634 m!395169))

(assert (=> b!264634 m!395169))

(declare-fun m!395173 () Bool)

(assert (=> b!264634 m!395173))

(assert (=> b!264523 d!89236))

(declare-fun d!89240 () Bool)

(assert (=> d!89240 (= (array_inv!6161 (buf!6905 w2!580)) (bvsge (size!6437 (buf!6905 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264524 d!89240))

(declare-fun d!89244 () Bool)

(assert (=> d!89244 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405912 () Unit!18842)

(declare-fun choose!11 (BitStream!11688) Unit!18842)

(assert (=> d!89244 (= lt!405912 (choose!11 w2!580))))

(assert (=> d!89244 (= (lemmaIsPrefixRefl!0 w2!580) lt!405912)))

(declare-fun bs!22654 () Bool)

(assert (= bs!22654 d!89244))

(assert (=> bs!22654 m!395057))

(declare-fun m!395181 () Bool)

(assert (=> bs!22654 m!395181))

(assert (=> b!264519 d!89244))

(declare-fun d!89252 () Bool)

(assert (=> d!89252 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405913 () Unit!18842)

(assert (=> d!89252 (= lt!405913 (choose!11 w1!584))))

(assert (=> d!89252 (= (lemmaIsPrefixRefl!0 w1!584) lt!405913)))

(declare-fun bs!22655 () Bool)

(assert (= bs!22655 d!89252))

(assert (=> bs!22655 m!395055))

(declare-fun m!395183 () Bool)

(assert (=> bs!22655 m!395183))

(assert (=> b!264519 d!89252))

(declare-fun d!89254 () Bool)

(assert (=> d!89254 (isPrefixOf!0 lt!405783 lt!405783)))

(declare-fun lt!405914 () Unit!18842)

(assert (=> d!89254 (= lt!405914 (choose!11 lt!405783))))

(assert (=> d!89254 (= (lemmaIsPrefixRefl!0 lt!405783) lt!405914)))

(declare-fun bs!22656 () Bool)

(assert (= bs!22656 d!89254))

(assert (=> bs!22656 m!395053))

(declare-fun m!395185 () Bool)

(assert (=> bs!22656 m!395185))

(assert (=> b!264519 d!89254))

(declare-fun d!89256 () Bool)

(declare-fun res!221226 () Bool)

(declare-fun e!184756 () Bool)

(assert (=> d!89256 (=> (not res!221226) (not e!184756))))

(assert (=> d!89256 (= res!221226 (= (size!6437 (buf!6905 lt!405783)) (size!6437 (buf!6905 lt!405783))))))

(assert (=> d!89256 (= (isPrefixOf!0 lt!405783 lt!405783) e!184756)))

(declare-fun b!264653 () Bool)

(declare-fun res!221228 () Bool)

(assert (=> b!264653 (=> (not res!221228) (not e!184756))))

(assert (=> b!264653 (= res!221228 (bvsle (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783)) (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783))))))

(declare-fun b!264654 () Bool)

(declare-fun e!184755 () Bool)

(assert (=> b!264654 (= e!184756 e!184755)))

(declare-fun res!221227 () Bool)

(assert (=> b!264654 (=> res!221227 e!184755)))

(assert (=> b!264654 (= res!221227 (= (size!6437 (buf!6905 lt!405783)) #b00000000000000000000000000000000))))

(declare-fun b!264655 () Bool)

(assert (=> b!264655 (= e!184755 (arrayBitRangesEq!0 (buf!6905 lt!405783) (buf!6905 lt!405783) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783))))))

(assert (= (and d!89256 res!221226) b!264653))

(assert (= (and b!264653 res!221228) b!264654))

(assert (= (and b!264654 (not res!221227)) b!264655))

(assert (=> b!264653 m!395169))

(assert (=> b!264653 m!395169))

(assert (=> b!264655 m!395169))

(assert (=> b!264655 m!395169))

(declare-fun m!395187 () Bool)

(assert (=> b!264655 m!395187))

(assert (=> b!264519 d!89256))

(declare-fun d!89258 () Bool)

(declare-fun res!221229 () Bool)

(declare-fun e!184758 () Bool)

(assert (=> d!89258 (=> (not res!221229) (not e!184758))))

(assert (=> d!89258 (= res!221229 (= (size!6437 (buf!6905 w1!584)) (size!6437 (buf!6905 w1!584))))))

(assert (=> d!89258 (= (isPrefixOf!0 w1!584 w1!584) e!184758)))

(declare-fun b!264656 () Bool)

(declare-fun res!221231 () Bool)

(assert (=> b!264656 (=> (not res!221231) (not e!184758))))

(assert (=> b!264656 (= res!221231 (bvsle (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)) (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(declare-fun b!264657 () Bool)

(declare-fun e!184757 () Bool)

(assert (=> b!264657 (= e!184758 e!184757)))

(declare-fun res!221230 () Bool)

(assert (=> b!264657 (=> res!221230 e!184757)))

(assert (=> b!264657 (= res!221230 (= (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264658 () Bool)

(assert (=> b!264658 (= e!184757 (arrayBitRangesEq!0 (buf!6905 w1!584) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(assert (= (and d!89258 res!221229) b!264656))

(assert (= (and b!264656 res!221231) b!264657))

(assert (= (and b!264657 (not res!221230)) b!264658))

(assert (=> b!264656 m!395033))

(assert (=> b!264656 m!395033))

(assert (=> b!264658 m!395033))

(assert (=> b!264658 m!395033))

(declare-fun m!395189 () Bool)

(assert (=> b!264658 m!395189))

(assert (=> b!264519 d!89258))

(declare-fun d!89260 () Bool)

(declare-fun res!221232 () Bool)

(declare-fun e!184760 () Bool)

(assert (=> d!89260 (=> (not res!221232) (not e!184760))))

(assert (=> d!89260 (= res!221232 (= (size!6437 (buf!6905 w2!580)) (size!6437 (buf!6905 w2!580))))))

(assert (=> d!89260 (= (isPrefixOf!0 w2!580 w2!580) e!184760)))

(declare-fun b!264659 () Bool)

(declare-fun res!221234 () Bool)

(assert (=> b!264659 (=> (not res!221234) (not e!184760))))

(assert (=> b!264659 (= res!221234 (bvsle (bitIndex!0 (size!6437 (buf!6905 w2!580)) (currentByte!12775 w2!580) (currentBit!12770 w2!580)) (bitIndex!0 (size!6437 (buf!6905 w2!580)) (currentByte!12775 w2!580) (currentBit!12770 w2!580))))))

(declare-fun b!264660 () Bool)

(declare-fun e!184759 () Bool)

(assert (=> b!264660 (= e!184760 e!184759)))

(declare-fun res!221233 () Bool)

(assert (=> b!264660 (=> res!221233 e!184759)))

(assert (=> b!264660 (= res!221233 (= (size!6437 (buf!6905 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264661 () Bool)

(assert (=> b!264661 (= e!184759 (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w2!580)) (currentByte!12775 w2!580) (currentBit!12770 w2!580))))))

(assert (= (and d!89260 res!221232) b!264659))

(assert (= (and b!264659 res!221234) b!264660))

(assert (= (and b!264660 (not res!221233)) b!264661))

(assert (=> b!264659 m!395171))

(assert (=> b!264659 m!395171))

(assert (=> b!264661 m!395171))

(assert (=> b!264661 m!395171))

(declare-fun m!395193 () Bool)

(assert (=> b!264661 m!395193))

(assert (=> b!264519 d!89260))

(declare-fun d!89264 () Bool)

(assert (=> d!89264 (= (array_inv!6161 (buf!6905 w1!584)) (bvsge (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264520 d!89264))

(declare-fun b!264665 () Bool)

(declare-fun lt!405920 () tuple4!348)

(declare-fun e!184768 () Bool)

(assert (=> b!264665 (= e!184768 (arrayRangesEq!1010 (buf!6905 w1!584) (buf!6905 w2!580) (_1!12154 lt!405920) (_2!12154 lt!405920)))))

(declare-fun b!264666 () Bool)

(declare-fun e!184764 () Bool)

(declare-fun call!4094 () Bool)

(assert (=> b!264666 (= e!184764 call!4094)))

(declare-fun b!264668 () Bool)

(declare-fun e!184765 () Bool)

(assert (=> b!264668 (= e!184765 e!184764)))

(declare-fun c!12144 () Bool)

(assert (=> b!264668 (= c!12144 (= (_3!954 lt!405920) (_4!174 lt!405920)))))

(declare-fun b!264669 () Bool)

(declare-fun res!221242 () Bool)

(declare-fun lt!405918 () (_ BitVec 32))

(assert (=> b!264669 (= res!221242 (= lt!405918 #b00000000000000000000000000000000))))

(declare-fun e!184767 () Bool)

(assert (=> b!264669 (=> res!221242 e!184767)))

(declare-fun e!184766 () Bool)

(assert (=> b!264669 (= e!184766 e!184767)))

(declare-fun b!264670 () Bool)

(declare-fun e!184763 () Bool)

(assert (=> b!264670 (= e!184763 e!184765)))

(declare-fun res!221239 () Bool)

(assert (=> b!264670 (=> (not res!221239) (not e!184765))))

(assert (=> b!264670 (= res!221239 e!184768)))

(declare-fun res!221241 () Bool)

(assert (=> b!264670 (=> res!221241 e!184768)))

(assert (=> b!264670 (= res!221241 (bvsge (_1!12154 lt!405920) (_2!12154 lt!405920)))))

(assert (=> b!264670 (= lt!405918 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405919 () (_ BitVec 32))

(assert (=> b!264670 (= lt!405919 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264670 (= lt!405920 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(declare-fun b!264667 () Bool)

(assert (=> b!264667 (= e!184764 e!184766)))

(declare-fun res!221238 () Bool)

(assert (=> b!264667 (= res!221238 (byteRangesEq!0 (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405920)) (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405920)) lt!405919 #b00000000000000000000000000001000))))

(assert (=> b!264667 (=> (not res!221238) (not e!184766))))

(declare-fun d!89266 () Bool)

(declare-fun res!221240 () Bool)

(assert (=> d!89266 (=> res!221240 e!184763)))

(assert (=> d!89266 (= res!221240 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(assert (=> d!89266 (= (arrayBitRangesEq!0 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))) e!184763)))

(declare-fun bm!4091 () Bool)

(assert (=> bm!4091 (= call!4094 (byteRangesEq!0 (ite c!12144 (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405920)) (select (arr!7424 (buf!6905 w1!584)) (_4!174 lt!405920))) (ite c!12144 (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405920)) (select (arr!7424 (buf!6905 w2!580)) (_4!174 lt!405920))) (ite c!12144 lt!405919 #b00000000000000000000000000000000) lt!405918))))

(declare-fun b!264671 () Bool)

(assert (=> b!264671 (= e!184767 call!4094)))

(assert (= (and d!89266 (not res!221240)) b!264670))

(assert (= (and b!264670 (not res!221241)) b!264665))

(assert (= (and b!264670 res!221239) b!264668))

(assert (= (and b!264668 c!12144) b!264666))

(assert (= (and b!264668 (not c!12144)) b!264667))

(assert (= (and b!264667 res!221238) b!264669))

(assert (= (and b!264669 (not res!221242)) b!264671))

(assert (= (or b!264666 b!264671) bm!4091))

(declare-fun m!395199 () Bool)

(assert (=> b!264665 m!395199))

(assert (=> b!264670 m!395033))

(declare-fun m!395201 () Bool)

(assert (=> b!264670 m!395201))

(declare-fun m!395203 () Bool)

(assert (=> b!264667 m!395203))

(declare-fun m!395205 () Bool)

(assert (=> b!264667 m!395205))

(assert (=> b!264667 m!395203))

(assert (=> b!264667 m!395205))

(declare-fun m!395207 () Bool)

(assert (=> b!264667 m!395207))

(assert (=> bm!4091 m!395205))

(declare-fun m!395210 () Bool)

(assert (=> bm!4091 m!395210))

(declare-fun m!395217 () Bool)

(assert (=> bm!4091 m!395217))

(declare-fun m!395221 () Bool)

(assert (=> bm!4091 m!395221))

(assert (=> bm!4091 m!395203))

(assert (=> b!264525 d!89266))

(assert (=> b!264525 d!89214))

(declare-fun b!264679 () Bool)

(declare-fun e!184780 () Bool)

(declare-fun lt!405927 () tuple4!348)

(assert (=> b!264679 (= e!184780 (arrayRangesEq!1010 (buf!6905 w2!580) (buf!6905 w1!584) (_1!12154 lt!405927) (_2!12154 lt!405927)))))

(declare-fun b!264680 () Bool)

(declare-fun e!184776 () Bool)

(declare-fun call!4096 () Bool)

(assert (=> b!264680 (= e!184776 call!4096)))

(declare-fun b!264682 () Bool)

(declare-fun e!184777 () Bool)

(assert (=> b!264682 (= e!184777 e!184776)))

(declare-fun c!12146 () Bool)

(assert (=> b!264682 (= c!12146 (= (_3!954 lt!405927) (_4!174 lt!405927)))))

(declare-fun b!264683 () Bool)

(declare-fun res!221252 () Bool)

(declare-fun lt!405925 () (_ BitVec 32))

(assert (=> b!264683 (= res!221252 (= lt!405925 #b00000000000000000000000000000000))))

(declare-fun e!184779 () Bool)

(assert (=> b!264683 (=> res!221252 e!184779)))

(declare-fun e!184778 () Bool)

(assert (=> b!264683 (= e!184778 e!184779)))

(declare-fun b!264684 () Bool)

(declare-fun e!184775 () Bool)

(assert (=> b!264684 (= e!184775 e!184777)))

(declare-fun res!221249 () Bool)

(assert (=> b!264684 (=> (not res!221249) (not e!184777))))

(assert (=> b!264684 (= res!221249 e!184780)))

(declare-fun res!221251 () Bool)

(assert (=> b!264684 (=> res!221251 e!184780)))

(assert (=> b!264684 (= res!221251 (bvsge (_1!12154 lt!405927) (_2!12154 lt!405927)))))

(assert (=> b!264684 (= lt!405925 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405926 () (_ BitVec 32))

(assert (=> b!264684 (= lt!405926 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264684 (= lt!405927 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(declare-fun b!264681 () Bool)

(assert (=> b!264681 (= e!184776 e!184778)))

(declare-fun res!221248 () Bool)

(assert (=> b!264681 (= res!221248 (byteRangesEq!0 (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405927)) (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405927)) lt!405926 #b00000000000000000000000000001000))))

(assert (=> b!264681 (=> (not res!221248) (not e!184778))))

(declare-fun d!89272 () Bool)

(declare-fun res!221250 () Bool)

(assert (=> d!89272 (=> res!221250 e!184775)))

(assert (=> d!89272 (= res!221250 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(assert (=> d!89272 (= (arrayBitRangesEq!0 (buf!6905 w2!580) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))) e!184775)))

(declare-fun bm!4093 () Bool)

(assert (=> bm!4093 (= call!4096 (byteRangesEq!0 (ite c!12146 (select (arr!7424 (buf!6905 w2!580)) (_3!954 lt!405927)) (select (arr!7424 (buf!6905 w2!580)) (_4!174 lt!405927))) (ite c!12146 (select (arr!7424 (buf!6905 w1!584)) (_3!954 lt!405927)) (select (arr!7424 (buf!6905 w1!584)) (_4!174 lt!405927))) (ite c!12146 lt!405926 #b00000000000000000000000000000000) lt!405925))))

(declare-fun b!264685 () Bool)

(assert (=> b!264685 (= e!184779 call!4096)))

(assert (= (and d!89272 (not res!221250)) b!264684))

(assert (= (and b!264684 (not res!221251)) b!264679))

(assert (= (and b!264684 res!221249) b!264682))

(assert (= (and b!264682 c!12146) b!264680))

(assert (= (and b!264682 (not c!12146)) b!264681))

(assert (= (and b!264681 res!221248) b!264683))

(assert (= (and b!264683 (not res!221252)) b!264685))

(assert (= (or b!264680 b!264685) bm!4093))

(declare-fun m!395231 () Bool)

(assert (=> b!264679 m!395231))

(assert (=> b!264684 m!395033))

(assert (=> b!264684 m!395201))

(declare-fun m!395233 () Bool)

(assert (=> b!264681 m!395233))

(declare-fun m!395235 () Bool)

(assert (=> b!264681 m!395235))

(assert (=> b!264681 m!395233))

(assert (=> b!264681 m!395235))

(declare-fun m!395237 () Bool)

(assert (=> b!264681 m!395237))

(assert (=> bm!4093 m!395235))

(declare-fun m!395239 () Bool)

(assert (=> bm!4093 m!395239))

(declare-fun m!395241 () Bool)

(assert (=> bm!4093 m!395241))

(declare-fun m!395243 () Bool)

(assert (=> bm!4093 m!395243))

(assert (=> bm!4093 m!395233))

(assert (=> b!264521 d!89272))

(assert (=> b!264521 d!89214))

(declare-fun d!89280 () Bool)

(declare-fun res!221258 () Bool)

(declare-fun e!184788 () Bool)

(assert (=> d!89280 (=> (not res!221258) (not e!184788))))

(assert (=> d!89280 (= res!221258 (= (size!6437 (buf!6905 lt!405783)) (size!6437 (buf!6905 w1!584))))))

(assert (=> d!89280 (= (isPrefixOf!0 lt!405783 w1!584) e!184788)))

(declare-fun b!264693 () Bool)

(declare-fun res!221260 () Bool)

(assert (=> b!264693 (=> (not res!221260) (not e!184788))))

(assert (=> b!264693 (= res!221260 (bvsle (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783)) (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(declare-fun b!264694 () Bool)

(declare-fun e!184787 () Bool)

(assert (=> b!264694 (= e!184788 e!184787)))

(declare-fun res!221259 () Bool)

(assert (=> b!264694 (=> res!221259 e!184787)))

(assert (=> b!264694 (= res!221259 (= (size!6437 (buf!6905 lt!405783)) #b00000000000000000000000000000000))))

(declare-fun b!264695 () Bool)

(assert (=> b!264695 (= e!184787 (arrayBitRangesEq!0 (buf!6905 lt!405783) (buf!6905 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 lt!405783)) (currentByte!12775 lt!405783) (currentBit!12770 lt!405783))))))

(assert (= (and d!89280 res!221258) b!264693))

(assert (= (and b!264693 res!221260) b!264694))

(assert (= (and b!264694 (not res!221259)) b!264695))

(assert (=> b!264693 m!395169))

(assert (=> b!264693 m!395033))

(assert (=> b!264695 m!395169))

(assert (=> b!264695 m!395169))

(declare-fun m!395245 () Bool)

(assert (=> b!264695 m!395245))

(assert (=> b!264527 d!89280))

(declare-fun d!89282 () Bool)

(declare-fun res!221261 () Bool)

(declare-fun e!184790 () Bool)

(assert (=> d!89282 (=> (not res!221261) (not e!184790))))

(assert (=> d!89282 (= res!221261 (= (size!6437 (buf!6905 w1!584)) (size!6437 (buf!6905 w2!580))))))

(assert (=> d!89282 (= (isPrefixOf!0 w1!584 w2!580) e!184790)))

(declare-fun b!264696 () Bool)

(declare-fun res!221263 () Bool)

(assert (=> b!264696 (=> (not res!221263) (not e!184790))))

(assert (=> b!264696 (= res!221263 (bvsle (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584)) (bitIndex!0 (size!6437 (buf!6905 w2!580)) (currentByte!12775 w2!580) (currentBit!12770 w2!580))))))

(declare-fun b!264697 () Bool)

(declare-fun e!184789 () Bool)

(assert (=> b!264697 (= e!184790 e!184789)))

(declare-fun res!221262 () Bool)

(assert (=> b!264697 (=> res!221262 e!184789)))

(assert (=> b!264697 (= res!221262 (= (size!6437 (buf!6905 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264698 () Bool)

(assert (=> b!264698 (= e!184789 (arrayBitRangesEq!0 (buf!6905 w1!584) (buf!6905 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6437 (buf!6905 w1!584)) (currentByte!12775 w1!584) (currentBit!12770 w1!584))))))

(assert (= (and d!89282 res!221261) b!264696))

(assert (= (and b!264696 res!221263) b!264697))

(assert (= (and b!264697 (not res!221262)) b!264698))

(assert (=> b!264696 m!395033))

(assert (=> b!264696 m!395171))

(assert (=> b!264698 m!395033))

(assert (=> b!264698 m!395033))

(assert (=> b!264698 m!395051))

(assert (=> start!57650 d!89282))

(declare-fun d!89284 () Bool)

(assert (=> d!89284 (= (inv!12 w1!584) (invariant!0 (currentBit!12770 w1!584) (currentByte!12775 w1!584) (size!6437 (buf!6905 w1!584))))))

(declare-fun bs!22663 () Bool)

(assert (= bs!22663 d!89284))

(assert (=> bs!22663 m!395119))

(assert (=> start!57650 d!89284))

(declare-fun d!89294 () Bool)

(assert (=> d!89294 (= (inv!12 w2!580) (invariant!0 (currentBit!12770 w2!580) (currentByte!12775 w2!580) (size!6437 (buf!6905 w2!580))))))

(declare-fun bs!22664 () Bool)

(assert (= bs!22664 d!89294))

(assert (=> bs!22664 m!395067))

(assert (=> start!57650 d!89294))

(check-sat (not b!264684) (not b!264679) (not b!264665) (not b!264670) (not b!264681) (not b!264655) (not d!89254) (not b!264698) (not d!89244) (not bm!4091) (not d!89214) (not d!89232) (not b!264659) (not b!264656) (not b!264693) (not d!89234) (not b!264667) (not b!264658) (not d!89284) (not bm!4093) (not bm!4088) (not b!264695) (not b!264605) (not b!264610) (not d!89220) (not b!264653) (not b!264632) (not b!264634) (not d!89252) (not d!89294) (not b!264696) (not b!264607) (not b!264661))
