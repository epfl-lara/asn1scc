; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57648 () Bool)

(assert start!57648)

(declare-fun b!264488 () Bool)

(declare-fun e!184615 () Bool)

(declare-datatypes ((array!14750 0))(
  ( (array!14751 (arr!7423 (Array (_ BitVec 32) (_ BitVec 8))) (size!6436 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11686 0))(
  ( (BitStream!11687 (buf!6904 array!14750) (currentByte!12774 (_ BitVec 32)) (currentBit!12769 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11686)

(declare-fun w2!580 () BitStream!11686)

(declare-fun arrayBitRangesEq!0 (array!14750 array!14750 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!264488 (= e!184615 (not (arrayBitRangesEq!0 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)))))))

(declare-fun res!221110 () Bool)

(declare-fun e!184622 () Bool)

(assert (=> start!57648 (=> (not res!221110) (not e!184622))))

(declare-fun isPrefixOf!0 (BitStream!11686 BitStream!11686) Bool)

(assert (=> start!57648 (= res!221110 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57648 e!184622))

(declare-fun e!184623 () Bool)

(declare-fun inv!12 (BitStream!11686) Bool)

(assert (=> start!57648 (and (inv!12 w1!584) e!184623)))

(declare-fun e!184621 () Bool)

(assert (=> start!57648 (and (inv!12 w2!580) e!184621)))

(declare-fun b!264489 () Bool)

(declare-fun e!184619 () Bool)

(declare-fun e!184618 () Bool)

(assert (=> b!264489 (= e!184619 e!184618)))

(declare-fun res!221109 () Bool)

(assert (=> b!264489 (=> res!221109 e!184618)))

(declare-fun e!184616 () Bool)

(assert (=> b!264489 (= res!221109 e!184616)))

(declare-fun res!221107 () Bool)

(assert (=> b!264489 (=> (not res!221107) (not e!184616))))

(assert (=> b!264489 (= res!221107 (not (= (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!18839 0))(
  ( (Unit!18840) )
))
(declare-fun lt!405759 () Unit!18839)

(declare-fun e!184614 () Unit!18839)

(assert (=> b!264489 (= lt!405759 e!184614)))

(declare-fun c!12129 () Bool)

(assert (=> b!264489 (= c!12129 (not (= (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!264490 () Bool)

(declare-fun array_inv!6160 (array!14750) Bool)

(assert (=> b!264490 (= e!184623 (array_inv!6160 (buf!6904 w1!584)))))

(declare-fun b!264491 () Bool)

(assert (=> b!264491 (= e!184616 (not (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)))))))

(declare-fun b!264492 () Bool)

(declare-fun Unit!18841 () Unit!18839)

(assert (=> b!264492 (= e!184614 Unit!18841)))

(declare-fun b!264493 () Bool)

(declare-fun lt!405760 () Unit!18839)

(assert (=> b!264493 (= e!184614 lt!405760)))

(declare-fun lt!405758 () (_ BitVec 64))

(assert (=> b!264493 (= lt!405758 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14750 array!14750 (_ BitVec 64) (_ BitVec 64)) Unit!18839)

(assert (=> b!264493 (= lt!405760 (arrayBitRangesEqSymmetric!0 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758))))

(assert (=> b!264493 (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758)))

(declare-fun b!264494 () Bool)

(assert (=> b!264494 (= e!184622 (not e!184619))))

(declare-fun res!221108 () Bool)

(assert (=> b!264494 (=> res!221108 e!184619)))

(assert (=> b!264494 (= res!221108 e!184615)))

(declare-fun res!221105 () Bool)

(assert (=> b!264494 (=> (not res!221105) (not e!184615))))

(assert (=> b!264494 (= res!221105 (not (= (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!264494 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405752 () Unit!18839)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11686) Unit!18839)

(assert (=> b!264494 (= lt!405752 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405761 () BitStream!11686)

(assert (=> b!264494 (isPrefixOf!0 lt!405761 lt!405761)))

(declare-fun lt!405753 () Unit!18839)

(assert (=> b!264494 (= lt!405753 (lemmaIsPrefixRefl!0 lt!405761))))

(assert (=> b!264494 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405755 () Unit!18839)

(assert (=> b!264494 (= lt!405755 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!264494 (= lt!405761 (BitStream!11687 (buf!6904 w2!580) (currentByte!12774 w1!584) (currentBit!12769 w1!584)))))

(declare-fun b!264495 () Bool)

(assert (=> b!264495 (= e!184621 (array_inv!6160 (buf!6904 w2!580)))))

(declare-fun b!264496 () Bool)

(declare-fun res!221106 () Bool)

(assert (=> b!264496 (=> res!221106 e!184618)))

(assert (=> b!264496 (= res!221106 (not (isPrefixOf!0 lt!405761 w1!584)))))

(declare-fun b!264497 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264497 (= e!184618 (invariant!0 (currentBit!12769 w2!580) (currentByte!12774 w2!580) (size!6436 (buf!6904 w2!580))))))

(declare-fun lt!405756 () (_ BitVec 64))

(assert (=> b!264497 (= lt!405756 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)))))

(declare-fun lt!405757 () Unit!18839)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11686 BitStream!11686 BitStream!11686) Unit!18839)

(assert (=> b!264497 (= lt!405757 (lemmaIsPrefixTransitive!0 lt!405761 w2!580 w2!580))))

(assert (=> b!264497 (isPrefixOf!0 lt!405761 w2!580)))

(declare-fun lt!405754 () Unit!18839)

(assert (=> b!264497 (= lt!405754 (lemmaIsPrefixTransitive!0 lt!405761 w1!584 w2!580))))

(assert (= (and start!57648 res!221110) b!264494))

(assert (= (and b!264494 res!221105) b!264488))

(assert (= (and b!264494 (not res!221108)) b!264489))

(assert (= (and b!264489 c!12129) b!264493))

(assert (= (and b!264489 (not c!12129)) b!264492))

(assert (= (and b!264489 res!221107) b!264491))

(assert (= (and b!264489 (not res!221109)) b!264496))

(assert (= (and b!264496 (not res!221106)) b!264497))

(assert (= start!57648 b!264490))

(assert (= start!57648 b!264495))

(declare-fun m!394991 () Bool)

(assert (=> b!264493 m!394991))

(declare-fun m!394993 () Bool)

(assert (=> b!264493 m!394993))

(declare-fun m!394995 () Bool)

(assert (=> b!264493 m!394995))

(declare-fun m!394997 () Bool)

(assert (=> b!264496 m!394997))

(declare-fun m!394999 () Bool)

(assert (=> b!264495 m!394999))

(assert (=> b!264488 m!394991))

(assert (=> b!264488 m!394991))

(declare-fun m!395001 () Bool)

(assert (=> b!264488 m!395001))

(assert (=> b!264497 m!394991))

(declare-fun m!395003 () Bool)

(assert (=> b!264497 m!395003))

(declare-fun m!395005 () Bool)

(assert (=> b!264497 m!395005))

(declare-fun m!395007 () Bool)

(assert (=> b!264497 m!395007))

(declare-fun m!395009 () Bool)

(assert (=> b!264497 m!395009))

(declare-fun m!395011 () Bool)

(assert (=> start!57648 m!395011))

(declare-fun m!395013 () Bool)

(assert (=> start!57648 m!395013))

(declare-fun m!395015 () Bool)

(assert (=> start!57648 m!395015))

(declare-fun m!395017 () Bool)

(assert (=> b!264490 m!395017))

(assert (=> b!264491 m!394991))

(assert (=> b!264491 m!394991))

(declare-fun m!395019 () Bool)

(assert (=> b!264491 m!395019))

(declare-fun m!395021 () Bool)

(assert (=> b!264494 m!395021))

(declare-fun m!395023 () Bool)

(assert (=> b!264494 m!395023))

(declare-fun m!395025 () Bool)

(assert (=> b!264494 m!395025))

(declare-fun m!395027 () Bool)

(assert (=> b!264494 m!395027))

(declare-fun m!395029 () Bool)

(assert (=> b!264494 m!395029))

(declare-fun m!395031 () Bool)

(assert (=> b!264494 m!395031))

(push 1)

(assert (not b!264495))

(assert (not start!57648))

(assert (not b!264490))

(assert (not b!264488))

(assert (not b!264496))

(assert (not b!264493))

(assert (not b!264494))

(assert (not b!264491))

(assert (not b!264497))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!89218 () Bool)

(declare-fun res!221172 () Bool)

(declare-fun e!184707 () Bool)

(assert (=> d!89218 (=> res!221172 e!184707)))

(assert (=> d!89218 (= res!221172 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(assert (=> d!89218 (= (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))) e!184707)))

(declare-fun b!264584 () Bool)

(declare-fun e!184703 () Bool)

(assert (=> b!264584 (= e!184707 e!184703)))

(declare-fun res!221173 () Bool)

(assert (=> b!264584 (=> (not res!221173) (not e!184703))))

(declare-fun e!184702 () Bool)

(assert (=> b!264584 (= res!221173 e!184702)))

(declare-fun res!221171 () Bool)

(assert (=> b!264584 (=> res!221171 e!184702)))

(declare-datatypes ((tuple4!350 0))(
  ( (tuple4!351 (_1!12155 (_ BitVec 32)) (_2!12155 (_ BitVec 32)) (_3!955 (_ BitVec 32)) (_4!175 (_ BitVec 32))) )
))
(declare-fun lt!405869 () tuple4!350)

(assert (=> b!264584 (= res!221171 (bvsge (_1!12155 lt!405869) (_2!12155 lt!405869)))))

(declare-fun lt!405867 () (_ BitVec 32))

(assert (=> b!264584 (= lt!405867 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405868 () (_ BitVec 32))

(assert (=> b!264584 (= lt!405868 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!350)

(assert (=> b!264584 (= lt!405869 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(declare-fun call!4088 () Bool)

(declare-fun c!12138 () Bool)

(declare-fun bm!4085 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4085 (= call!4088 (byteRangesEq!0 (select (arr!7423 (buf!6904 w2!580)) (_3!955 lt!405869)) (select (arr!7423 (buf!6904 w1!584)) (_3!955 lt!405869)) lt!405868 (ite c!12138 lt!405867 #b00000000000000000000000000001000)))))

(declare-fun b!264585 () Bool)

(declare-fun e!184704 () Bool)

(assert (=> b!264585 (= e!184704 call!4088)))

(declare-fun b!264586 () Bool)

(declare-fun arrayRangesEq!1011 (array!14750 array!14750 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!264586 (= e!184702 (arrayRangesEq!1011 (buf!6904 w2!580) (buf!6904 w1!584) (_1!12155 lt!405869) (_2!12155 lt!405869)))))

(declare-fun b!264587 () Bool)

(declare-fun res!221169 () Bool)

(assert (=> b!264587 (= res!221169 (= lt!405867 #b00000000000000000000000000000000))))

(declare-fun e!184705 () Bool)

(assert (=> b!264587 (=> res!221169 e!184705)))

(declare-fun e!184706 () Bool)

(assert (=> b!264587 (= e!184706 e!184705)))

(declare-fun b!264588 () Bool)

(assert (=> b!264588 (= e!184703 e!184704)))

(assert (=> b!264588 (= c!12138 (= (_3!955 lt!405869) (_4!175 lt!405869)))))

(declare-fun b!264589 () Bool)

(assert (=> b!264589 (= e!184705 (byteRangesEq!0 (select (arr!7423 (buf!6904 w2!580)) (_4!175 lt!405869)) (select (arr!7423 (buf!6904 w1!584)) (_4!175 lt!405869)) #b00000000000000000000000000000000 lt!405867))))

(declare-fun b!264590 () Bool)

(assert (=> b!264590 (= e!184704 e!184706)))

(declare-fun res!221170 () Bool)

(assert (=> b!264590 (= res!221170 call!4088)))

(assert (=> b!264590 (=> (not res!221170) (not e!184706))))

(assert (= (and d!89218 (not res!221172)) b!264584))

(assert (= (and b!264584 (not res!221171)) b!264586))

(assert (= (and b!264584 res!221173) b!264588))

(assert (= (and b!264588 c!12138) b!264585))

(assert (= (and b!264588 (not c!12138)) b!264590))

(assert (= (and b!264590 res!221170) b!264587))

(assert (= (and b!264587 (not res!221169)) b!264589))

(assert (= (or b!264585 b!264590) bm!4085))

(assert (=> b!264584 m!394991))

(declare-fun m!395127 () Bool)

(assert (=> b!264584 m!395127))

(declare-fun m!395129 () Bool)

(assert (=> bm!4085 m!395129))

(declare-fun m!395131 () Bool)

(assert (=> bm!4085 m!395131))

(assert (=> bm!4085 m!395129))

(assert (=> bm!4085 m!395131))

(declare-fun m!395133 () Bool)

(assert (=> bm!4085 m!395133))

(declare-fun m!395135 () Bool)

(assert (=> b!264586 m!395135))

(declare-fun m!395137 () Bool)

(assert (=> b!264589 m!395137))

(declare-fun m!395139 () Bool)

(assert (=> b!264589 m!395139))

(assert (=> b!264589 m!395137))

(assert (=> b!264589 m!395139))

(declare-fun m!395141 () Bool)

(assert (=> b!264589 m!395141))

(assert (=> b!264491 d!89218))

(declare-fun d!89226 () Bool)

(declare-fun e!184728 () Bool)

(assert (=> d!89226 e!184728))

(declare-fun res!221193 () Bool)

(assert (=> d!89226 (=> (not res!221193) (not e!184728))))

(declare-fun lt!405897 () (_ BitVec 64))

(declare-fun lt!405898 () (_ BitVec 64))

(declare-fun lt!405900 () (_ BitVec 64))

(assert (=> d!89226 (= res!221193 (= lt!405898 (bvsub lt!405897 lt!405900)))))

(assert (=> d!89226 (or (= (bvand lt!405897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405900 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405897 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405897 lt!405900) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89226 (= lt!405900 (remainingBits!0 ((_ sign_extend 32) (size!6436 (buf!6904 w1!584))) ((_ sign_extend 32) (currentByte!12774 w1!584)) ((_ sign_extend 32) (currentBit!12769 w1!584))))))

(declare-fun lt!405902 () (_ BitVec 64))

(declare-fun lt!405899 () (_ BitVec 64))

(assert (=> d!89226 (= lt!405897 (bvmul lt!405902 lt!405899))))

(assert (=> d!89226 (or (= lt!405902 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405899 (bvsdiv (bvmul lt!405902 lt!405899) lt!405902)))))

(assert (=> d!89226 (= lt!405899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89226 (= lt!405902 ((_ sign_extend 32) (size!6436 (buf!6904 w1!584))))))

(assert (=> d!89226 (= lt!405898 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12774 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12769 w1!584))))))

(assert (=> d!89226 (invariant!0 (currentBit!12769 w1!584) (currentByte!12774 w1!584) (size!6436 (buf!6904 w1!584)))))

(assert (=> d!89226 (= (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)) lt!405898)))

(declare-fun b!264616 () Bool)

(declare-fun res!221194 () Bool)

(assert (=> b!264616 (=> (not res!221194) (not e!184728))))

(assert (=> b!264616 (= res!221194 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405898))))

(declare-fun b!264617 () Bool)

(declare-fun lt!405901 () (_ BitVec 64))

(assert (=> b!264617 (= e!184728 (bvsle lt!405898 (bvmul lt!405901 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264617 (or (= lt!405901 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405901 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405901)))))

(assert (=> b!264617 (= lt!405901 ((_ sign_extend 32) (size!6436 (buf!6904 w1!584))))))

(assert (= (and d!89226 res!221193) b!264616))

(assert (= (and b!264616 res!221194) b!264617))

(declare-fun m!395165 () Bool)

(assert (=> d!89226 m!395165))

(declare-fun m!395167 () Bool)

(assert (=> d!89226 m!395167))

(assert (=> b!264491 d!89226))

(declare-fun d!89238 () Bool)

(declare-fun res!221214 () Bool)

(declare-fun e!184742 () Bool)

(assert (=> d!89238 (=> (not res!221214) (not e!184742))))

(assert (=> d!89238 (= res!221214 (= (size!6436 (buf!6904 lt!405761)) (size!6436 (buf!6904 w1!584))))))

(assert (=> d!89238 (= (isPrefixOf!0 lt!405761 w1!584) e!184742)))

(declare-fun b!264635 () Bool)

(declare-fun res!221213 () Bool)

(assert (=> b!264635 (=> (not res!221213) (not e!184742))))

(assert (=> b!264635 (= res!221213 (bvsle (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761)) (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(declare-fun b!264636 () Bool)

(declare-fun e!184741 () Bool)

(assert (=> b!264636 (= e!184742 e!184741)))

(declare-fun res!221212 () Bool)

(assert (=> b!264636 (=> res!221212 e!184741)))

(assert (=> b!264636 (= res!221212 (= (size!6436 (buf!6904 lt!405761)) #b00000000000000000000000000000000))))

(declare-fun b!264637 () Bool)

(assert (=> b!264637 (= e!184741 (arrayBitRangesEq!0 (buf!6904 lt!405761) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761))))))

(assert (= (and d!89238 res!221214) b!264635))

(assert (= (and b!264635 res!221213) b!264636))

(assert (= (and b!264636 (not res!221212)) b!264637))

(declare-fun m!395175 () Bool)

(assert (=> b!264635 m!395175))

(assert (=> b!264635 m!394991))

(assert (=> b!264637 m!395175))

(assert (=> b!264637 m!395175))

(declare-fun m!395177 () Bool)

(assert (=> b!264637 m!395177))

(assert (=> b!264496 d!89238))

(declare-fun d!89242 () Bool)

(declare-fun res!221221 () Bool)

(declare-fun e!184748 () Bool)

(assert (=> d!89242 (=> (not res!221221) (not e!184748))))

(assert (=> d!89242 (= res!221221 (= (size!6436 (buf!6904 w1!584)) (size!6436 (buf!6904 w2!580))))))

(assert (=> d!89242 (= (isPrefixOf!0 w1!584 w2!580) e!184748)))

(declare-fun b!264644 () Bool)

(declare-fun res!221220 () Bool)

(assert (=> b!264644 (=> (not res!221220) (not e!184748))))

(assert (=> b!264644 (= res!221220 (bvsle (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)) (bitIndex!0 (size!6436 (buf!6904 w2!580)) (currentByte!12774 w2!580) (currentBit!12769 w2!580))))))

(declare-fun b!264645 () Bool)

(declare-fun e!184747 () Bool)

(assert (=> b!264645 (= e!184748 e!184747)))

(declare-fun res!221219 () Bool)

(assert (=> b!264645 (=> res!221219 e!184747)))

(assert (=> b!264645 (= res!221219 (= (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264646 () Bool)

(assert (=> b!264646 (= e!184747 (arrayBitRangesEq!0 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(assert (= (and d!89242 res!221221) b!264644))

(assert (= (and b!264644 res!221220) b!264645))

(assert (= (and b!264645 (not res!221219)) b!264646))

(assert (=> b!264644 m!394991))

(declare-fun m!395179 () Bool)

(assert (=> b!264644 m!395179))

(assert (=> b!264646 m!394991))

(assert (=> b!264646 m!394991))

(assert (=> b!264646 m!395001))

(assert (=> start!57648 d!89242))

(declare-fun d!89246 () Bool)

(assert (=> d!89246 (= (inv!12 w1!584) (invariant!0 (currentBit!12769 w1!584) (currentByte!12774 w1!584) (size!6436 (buf!6904 w1!584))))))

(declare-fun bs!22651 () Bool)

(assert (= bs!22651 d!89246))

(assert (=> bs!22651 m!395167))

(assert (=> start!57648 d!89246))

(declare-fun d!89248 () Bool)

(assert (=> d!89248 (= (inv!12 w2!580) (invariant!0 (currentBit!12769 w2!580) (currentByte!12774 w2!580) (size!6436 (buf!6904 w2!580))))))

(declare-fun bs!22652 () Bool)

(assert (= bs!22652 d!89248))

(assert (=> bs!22652 m!395003))

(assert (=> start!57648 d!89248))

(declare-fun d!89250 () Bool)

(assert (=> d!89250 (isPrefixOf!0 lt!405761 w2!580)))

(declare-fun lt!405917 () Unit!18839)

(declare-fun choose!30 (BitStream!11686 BitStream!11686 BitStream!11686) Unit!18839)

(assert (=> d!89250 (= lt!405917 (choose!30 lt!405761 w1!584 w2!580))))

(assert (=> d!89250 (isPrefixOf!0 lt!405761 w1!584)))

(assert (=> d!89250 (= (lemmaIsPrefixTransitive!0 lt!405761 w1!584 w2!580) lt!405917)))

(declare-fun bs!22657 () Bool)

(assert (= bs!22657 d!89250))

(assert (=> bs!22657 m!395007))

(declare-fun m!395191 () Bool)

(assert (=> bs!22657 m!395191))

(assert (=> bs!22657 m!394997))

(assert (=> b!264497 d!89250))

(assert (=> b!264497 d!89226))

(declare-fun d!89262 () Bool)

(declare-fun res!221237 () Bool)

(declare-fun e!184762 () Bool)

(assert (=> d!89262 (=> (not res!221237) (not e!184762))))

(assert (=> d!89262 (= res!221237 (= (size!6436 (buf!6904 lt!405761)) (size!6436 (buf!6904 w2!580))))))

(assert (=> d!89262 (= (isPrefixOf!0 lt!405761 w2!580) e!184762)))

(declare-fun b!264662 () Bool)

(declare-fun res!221236 () Bool)

(assert (=> b!264662 (=> (not res!221236) (not e!184762))))

(assert (=> b!264662 (= res!221236 (bvsle (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761)) (bitIndex!0 (size!6436 (buf!6904 w2!580)) (currentByte!12774 w2!580) (currentBit!12769 w2!580))))))

(declare-fun b!264663 () Bool)

(declare-fun e!184761 () Bool)

(assert (=> b!264663 (= e!184762 e!184761)))

(declare-fun res!221235 () Bool)

(assert (=> b!264663 (=> res!221235 e!184761)))

(assert (=> b!264663 (= res!221235 (= (size!6436 (buf!6904 lt!405761)) #b00000000000000000000000000000000))))

(declare-fun b!264664 () Bool)

(assert (=> b!264664 (= e!184761 (arrayBitRangesEq!0 (buf!6904 lt!405761) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761))))))

(assert (= (and d!89262 res!221237) b!264662))

(assert (= (and b!264662 res!221236) b!264663))

(assert (= (and b!264663 (not res!221235)) b!264664))

(assert (=> b!264662 m!395175))

(assert (=> b!264662 m!395179))

(assert (=> b!264664 m!395175))

(assert (=> b!264664 m!395175))

(declare-fun m!395195 () Bool)

(assert (=> b!264664 m!395195))

(assert (=> b!264497 d!89262))

(declare-fun d!89268 () Bool)

(assert (=> d!89268 (isPrefixOf!0 lt!405761 w2!580)))

(declare-fun lt!405924 () Unit!18839)

(assert (=> d!89268 (= lt!405924 (choose!30 lt!405761 w2!580 w2!580))))

(assert (=> d!89268 (isPrefixOf!0 lt!405761 w2!580)))

(assert (=> d!89268 (= (lemmaIsPrefixTransitive!0 lt!405761 w2!580 w2!580) lt!405924)))

(declare-fun bs!22658 () Bool)

(assert (= bs!22658 d!89268))

(assert (=> bs!22658 m!395007))

(declare-fun m!395197 () Bool)

(assert (=> bs!22658 m!395197))

(assert (=> bs!22658 m!395007))

(assert (=> b!264497 d!89268))

(declare-fun d!89270 () Bool)

(assert (=> d!89270 (= (invariant!0 (currentBit!12769 w2!580) (currentByte!12774 w2!580) (size!6436 (buf!6904 w2!580))) (and (bvsge (currentBit!12769 w2!580) #b00000000000000000000000000000000) (bvslt (currentBit!12769 w2!580) #b00000000000000000000000000001000) (bvsge (currentByte!12774 w2!580) #b00000000000000000000000000000000) (or (bvslt (currentByte!12774 w2!580) (size!6436 (buf!6904 w2!580))) (and (= (currentBit!12769 w2!580) #b00000000000000000000000000000000) (= (currentByte!12774 w2!580) (size!6436 (buf!6904 w2!580)))))))))

(assert (=> b!264497 d!89270))

(declare-fun d!89276 () Bool)

(assert (=> d!89276 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405933 () Unit!18839)

(declare-fun choose!11 (BitStream!11686) Unit!18839)

(assert (=> d!89276 (= lt!405933 (choose!11 w2!580))))

(assert (=> d!89276 (= (lemmaIsPrefixRefl!0 w2!580) lt!405933)))

(declare-fun bs!22660 () Bool)

(assert (= bs!22660 d!89276))

(assert (=> bs!22660 m!395029))

(declare-fun m!395263 () Bool)

(assert (=> bs!22660 m!395263))

(assert (=> b!264494 d!89276))

(declare-fun d!89288 () Bool)

(assert (=> d!89288 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405934 () Unit!18839)

(assert (=> d!89288 (= lt!405934 (choose!11 w1!584))))

(assert (=> d!89288 (= (lemmaIsPrefixRefl!0 w1!584) lt!405934)))

(declare-fun bs!22661 () Bool)

(assert (= bs!22661 d!89288))

(assert (=> bs!22661 m!395027))

(declare-fun m!395265 () Bool)

(assert (=> bs!22661 m!395265))

(assert (=> b!264494 d!89288))

(declare-fun d!89290 () Bool)

(assert (=> d!89290 (isPrefixOf!0 lt!405761 lt!405761)))

(declare-fun lt!405935 () Unit!18839)

(assert (=> d!89290 (= lt!405935 (choose!11 lt!405761))))

(assert (=> d!89290 (= (lemmaIsPrefixRefl!0 lt!405761) lt!405935)))

(declare-fun bs!22662 () Bool)

(assert (= bs!22662 d!89290))

(assert (=> bs!22662 m!395023))

(declare-fun m!395267 () Bool)

(assert (=> bs!22662 m!395267))

(assert (=> b!264494 d!89290))

(declare-fun d!89292 () Bool)

(declare-fun res!221266 () Bool)

(declare-fun e!184792 () Bool)

(assert (=> d!89292 (=> (not res!221266) (not e!184792))))

(assert (=> d!89292 (= res!221266 (= (size!6436 (buf!6904 w1!584)) (size!6436 (buf!6904 w1!584))))))

(assert (=> d!89292 (= (isPrefixOf!0 w1!584 w1!584) e!184792)))

(declare-fun b!264699 () Bool)

(declare-fun res!221265 () Bool)

(assert (=> b!264699 (=> (not res!221265) (not e!184792))))

(assert (=> b!264699 (= res!221265 (bvsle (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)) (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(declare-fun b!264700 () Bool)

(declare-fun e!184791 () Bool)

(assert (=> b!264700 (= e!184792 e!184791)))

(declare-fun res!221264 () Bool)

(assert (=> b!264700 (=> res!221264 e!184791)))

(assert (=> b!264700 (= res!221264 (= (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!264701 () Bool)

(assert (=> b!264701 (= e!184791 (arrayBitRangesEq!0 (buf!6904 w1!584) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(assert (= (and d!89292 res!221266) b!264699))

(assert (= (and b!264699 res!221265) b!264700))

(assert (= (and b!264700 (not res!221264)) b!264701))

(assert (=> b!264699 m!394991))

(assert (=> b!264699 m!394991))

(assert (=> b!264701 m!394991))

(assert (=> b!264701 m!394991))

(declare-fun m!395269 () Bool)

(assert (=> b!264701 m!395269))

(assert (=> b!264494 d!89292))

(declare-fun d!89296 () Bool)

(declare-fun res!221269 () Bool)

(declare-fun e!184794 () Bool)

(assert (=> d!89296 (=> (not res!221269) (not e!184794))))

(assert (=> d!89296 (= res!221269 (= (size!6436 (buf!6904 lt!405761)) (size!6436 (buf!6904 lt!405761))))))

(assert (=> d!89296 (= (isPrefixOf!0 lt!405761 lt!405761) e!184794)))

(declare-fun b!264702 () Bool)

(declare-fun res!221268 () Bool)

(assert (=> b!264702 (=> (not res!221268) (not e!184794))))

(assert (=> b!264702 (= res!221268 (bvsle (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761)) (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761))))))

(declare-fun b!264703 () Bool)

(declare-fun e!184793 () Bool)

(assert (=> b!264703 (= e!184794 e!184793)))

(declare-fun res!221267 () Bool)

(assert (=> b!264703 (=> res!221267 e!184793)))

(assert (=> b!264703 (= res!221267 (= (size!6436 (buf!6904 lt!405761)) #b00000000000000000000000000000000))))

(declare-fun b!264704 () Bool)

(assert (=> b!264704 (= e!184793 (arrayBitRangesEq!0 (buf!6904 lt!405761) (buf!6904 lt!405761) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 lt!405761)) (currentByte!12774 lt!405761) (currentBit!12769 lt!405761))))))

(assert (= (and d!89296 res!221269) b!264702))

(assert (= (and b!264702 res!221268) b!264703))

(assert (= (and b!264703 (not res!221267)) b!264704))

(assert (=> b!264702 m!395175))

(assert (=> b!264702 m!395175))

(assert (=> b!264704 m!395175))

(assert (=> b!264704 m!395175))

(declare-fun m!395271 () Bool)

(assert (=> b!264704 m!395271))

(assert (=> b!264494 d!89296))

(declare-fun d!89298 () Bool)

(declare-fun res!221272 () Bool)

(declare-fun e!184796 () Bool)

(assert (=> d!89298 (=> (not res!221272) (not e!184796))))

(assert (=> d!89298 (= res!221272 (= (size!6436 (buf!6904 w2!580)) (size!6436 (buf!6904 w2!580))))))

(assert (=> d!89298 (= (isPrefixOf!0 w2!580 w2!580) e!184796)))

(declare-fun b!264705 () Bool)

(declare-fun res!221271 () Bool)

(assert (=> b!264705 (=> (not res!221271) (not e!184796))))

(assert (=> b!264705 (= res!221271 (bvsle (bitIndex!0 (size!6436 (buf!6904 w2!580)) (currentByte!12774 w2!580) (currentBit!12769 w2!580)) (bitIndex!0 (size!6436 (buf!6904 w2!580)) (currentByte!12774 w2!580) (currentBit!12769 w2!580))))))

(declare-fun b!264706 () Bool)

(declare-fun e!184795 () Bool)

(assert (=> b!264706 (= e!184796 e!184795)))

(declare-fun res!221270 () Bool)

(assert (=> b!264706 (=> res!221270 e!184795)))

(assert (=> b!264706 (= res!221270 (= (size!6436 (buf!6904 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!264707 () Bool)

(assert (=> b!264707 (= e!184795 (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w2!580)) (currentByte!12774 w2!580) (currentBit!12769 w2!580))))))

(assert (= (and d!89298 res!221272) b!264705))

(assert (= (and b!264705 res!221271) b!264706))

(assert (= (and b!264706 (not res!221270)) b!264707))

(assert (=> b!264705 m!395179))

(assert (=> b!264705 m!395179))

(assert (=> b!264707 m!395179))

(assert (=> b!264707 m!395179))

(declare-fun m!395273 () Bool)

(assert (=> b!264707 m!395273))

(assert (=> b!264494 d!89298))

(assert (=> b!264493 d!89226))

(declare-fun d!89300 () Bool)

(assert (=> d!89300 (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758)))

(declare-fun lt!405938 () Unit!18839)

(declare-fun choose!8 (array!14750 array!14750 (_ BitVec 64) (_ BitVec 64)) Unit!18839)

(assert (=> d!89300 (= lt!405938 (choose!8 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758))))

(assert (=> d!89300 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758))))

(assert (=> d!89300 (= (arrayBitRangesEqSymmetric!0 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758) lt!405938)))

(declare-fun bs!22665 () Bool)

(assert (= bs!22665 d!89300))

(assert (=> bs!22665 m!394995))

(declare-fun m!395275 () Bool)

(assert (=> bs!22665 m!395275))

(assert (=> b!264493 d!89300))

(declare-fun d!89302 () Bool)

(declare-fun res!221282 () Bool)

(declare-fun e!184806 () Bool)

(assert (=> d!89302 (=> res!221282 e!184806)))

(assert (=> d!89302 (= res!221282 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758))))

(assert (=> d!89302 (= (arrayBitRangesEq!0 (buf!6904 w2!580) (buf!6904 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758) e!184806)))

(declare-fun b!264714 () Bool)

(declare-fun e!184802 () Bool)

(assert (=> b!264714 (= e!184806 e!184802)))

(declare-fun res!221283 () Bool)

(assert (=> b!264714 (=> (not res!221283) (not e!184802))))

(declare-fun e!184801 () Bool)

(assert (=> b!264714 (= res!221283 e!184801)))

(declare-fun res!221281 () Bool)

(assert (=> b!264714 (=> res!221281 e!184801)))

(declare-fun lt!405941 () tuple4!350)

(assert (=> b!264714 (= res!221281 (bvsge (_1!12155 lt!405941) (_2!12155 lt!405941)))))

(declare-fun lt!405939 () (_ BitVec 32))

(assert (=> b!264714 (= lt!405939 ((_ extract 31 0) (bvsrem lt!405758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405940 () (_ BitVec 32))

(assert (=> b!264714 (= lt!405940 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264714 (= lt!405941 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405758))))

(declare-fun bm!4095 () Bool)

(declare-fun c!12148 () Bool)

(declare-fun call!4098 () Bool)

(assert (=> bm!4095 (= call!4098 (byteRangesEq!0 (select (arr!7423 (buf!6904 w2!580)) (_3!955 lt!405941)) (select (arr!7423 (buf!6904 w1!584)) (_3!955 lt!405941)) lt!405940 (ite c!12148 lt!405939 #b00000000000000000000000000001000)))))

(declare-fun b!264715 () Bool)

(declare-fun e!184803 () Bool)

(assert (=> b!264715 (= e!184803 call!4098)))

(declare-fun b!264716 () Bool)

(assert (=> b!264716 (= e!184801 (arrayRangesEq!1011 (buf!6904 w2!580) (buf!6904 w1!584) (_1!12155 lt!405941) (_2!12155 lt!405941)))))

(declare-fun b!264717 () Bool)

(declare-fun res!221279 () Bool)

(assert (=> b!264717 (= res!221279 (= lt!405939 #b00000000000000000000000000000000))))

(declare-fun e!184804 () Bool)

(assert (=> b!264717 (=> res!221279 e!184804)))

(declare-fun e!184805 () Bool)

(assert (=> b!264717 (= e!184805 e!184804)))

(declare-fun b!264718 () Bool)

(assert (=> b!264718 (= e!184802 e!184803)))

(assert (=> b!264718 (= c!12148 (= (_3!955 lt!405941) (_4!175 lt!405941)))))

(declare-fun b!264719 () Bool)

(assert (=> b!264719 (= e!184804 (byteRangesEq!0 (select (arr!7423 (buf!6904 w2!580)) (_4!175 lt!405941)) (select (arr!7423 (buf!6904 w1!584)) (_4!175 lt!405941)) #b00000000000000000000000000000000 lt!405939))))

(declare-fun b!264720 () Bool)

(assert (=> b!264720 (= e!184803 e!184805)))

(declare-fun res!221280 () Bool)

(assert (=> b!264720 (= res!221280 call!4098)))

(assert (=> b!264720 (=> (not res!221280) (not e!184805))))

(assert (= (and d!89302 (not res!221282)) b!264714))

(assert (= (and b!264714 (not res!221281)) b!264716))

(assert (= (and b!264714 res!221283) b!264718))

(assert (= (and b!264718 c!12148) b!264715))

(assert (= (and b!264718 (not c!12148)) b!264720))

(assert (= (and b!264720 res!221280) b!264717))

(assert (= (and b!264717 (not res!221279)) b!264719))

(assert (= (or b!264715 b!264720) bm!4095))

(declare-fun m!395277 () Bool)

(assert (=> b!264714 m!395277))

(declare-fun m!395279 () Bool)

(assert (=> bm!4095 m!395279))

(declare-fun m!395281 () Bool)

(assert (=> bm!4095 m!395281))

(assert (=> bm!4095 m!395279))

(assert (=> bm!4095 m!395281))

(declare-fun m!395283 () Bool)

(assert (=> bm!4095 m!395283))

(declare-fun m!395285 () Bool)

(assert (=> b!264716 m!395285))

(declare-fun m!395287 () Bool)

(assert (=> b!264719 m!395287))

(declare-fun m!395289 () Bool)

(assert (=> b!264719 m!395289))

(assert (=> b!264719 m!395287))

(assert (=> b!264719 m!395289))

(declare-fun m!395291 () Bool)

(assert (=> b!264719 m!395291))

(assert (=> b!264493 d!89302))

(declare-fun d!89304 () Bool)

(declare-fun res!221287 () Bool)

(declare-fun e!184812 () Bool)

(assert (=> d!89304 (=> res!221287 e!184812)))

(assert (=> d!89304 (= res!221287 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(assert (=> d!89304 (= (arrayBitRangesEq!0 (buf!6904 w1!584) (buf!6904 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))) e!184812)))

(declare-fun b!264721 () Bool)

(declare-fun e!184808 () Bool)

(assert (=> b!264721 (= e!184812 e!184808)))

(declare-fun res!221288 () Bool)

(assert (=> b!264721 (=> (not res!221288) (not e!184808))))

(declare-fun e!184807 () Bool)

(assert (=> b!264721 (= res!221288 e!184807)))

(declare-fun res!221286 () Bool)

(assert (=> b!264721 (=> res!221286 e!184807)))

(declare-fun lt!405944 () tuple4!350)

(assert (=> b!264721 (= res!221286 (bvsge (_1!12155 lt!405944) (_2!12155 lt!405944)))))

(declare-fun lt!405942 () (_ BitVec 32))

(assert (=> b!264721 (= lt!405942 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405943 () (_ BitVec 32))

(assert (=> b!264721 (= lt!405943 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!264721 (= lt!405944 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6436 (buf!6904 w1!584)) (currentByte!12774 w1!584) (currentBit!12769 w1!584))))))

(declare-fun bm!4096 () Bool)

(declare-fun call!4099 () Bool)

(declare-fun c!12149 () Bool)

(assert (=> bm!4096 (= call!4099 (byteRangesEq!0 (select (arr!7423 (buf!6904 w1!584)) (_3!955 lt!405944)) (select (arr!7423 (buf!6904 w2!580)) (_3!955 lt!405944)) lt!405943 (ite c!12149 lt!405942 #b00000000000000000000000000001000)))))

(declare-fun b!264722 () Bool)

(declare-fun e!184809 () Bool)

(assert (=> b!264722 (= e!184809 call!4099)))

(declare-fun b!264723 () Bool)

(assert (=> b!264723 (= e!184807 (arrayRangesEq!1011 (buf!6904 w1!584) (buf!6904 w2!580) (_1!12155 lt!405944) (_2!12155 lt!405944)))))

(declare-fun b!264724 () Bool)

(declare-fun res!221284 () Bool)

(assert (=> b!264724 (= res!221284 (= lt!405942 #b00000000000000000000000000000000))))

(declare-fun e!184810 () Bool)

(assert (=> b!264724 (=> res!221284 e!184810)))

(declare-fun e!184811 () Bool)

(assert (=> b!264724 (= e!184811 e!184810)))

(declare-fun b!264725 () Bool)

(assert (=> b!264725 (= e!184808 e!184809)))

(assert (=> b!264725 (= c!12149 (= (_3!955 lt!405944) (_4!175 lt!405944)))))

(declare-fun b!264726 () Bool)

(assert (=> b!264726 (= e!184810 (byteRangesEq!0 (select (arr!7423 (buf!6904 w1!584)) (_4!175 lt!405944)) (select (arr!7423 (buf!6904 w2!580)) (_4!175 lt!405944)) #b00000000000000000000000000000000 lt!405942))))

(declare-fun b!264727 () Bool)

(assert (=> b!264727 (= e!184809 e!184811)))

(declare-fun res!221285 () Bool)

(assert (=> b!264727 (= res!221285 call!4099)))

(assert (=> b!264727 (=> (not res!221285) (not e!184811))))

(assert (= (and d!89304 (not res!221287)) b!264721))

(assert (= (and b!264721 (not res!221286)) b!264723))

(assert (= (and b!264721 res!221288) b!264725))

(assert (= (and b!264725 c!12149) b!264722))

(assert (= (and b!264725 (not c!12149)) b!264727))

(assert (= (and b!264727 res!221285) b!264724))

(assert (= (and b!264724 (not res!221284)) b!264726))

(assert (= (or b!264722 b!264727) bm!4096))

(assert (=> b!264721 m!394991))

(assert (=> b!264721 m!395127))

(declare-fun m!395293 () Bool)

(assert (=> bm!4096 m!395293))

(declare-fun m!395295 () Bool)

(assert (=> bm!4096 m!395295))

(assert (=> bm!4096 m!395293))

(assert (=> bm!4096 m!395295))

(declare-fun m!395297 () Bool)

(assert (=> bm!4096 m!395297))

(declare-fun m!395299 () Bool)

(assert (=> b!264723 m!395299))

(declare-fun m!395301 () Bool)

(assert (=> b!264726 m!395301))

(declare-fun m!395303 () Bool)

(assert (=> b!264726 m!395303))

(assert (=> b!264726 m!395301))

(assert (=> b!264726 m!395303))

(declare-fun m!395305 () Bool)

(assert (=> b!264726 m!395305))

(assert (=> b!264488 d!89304))

(assert (=> b!264488 d!89226))

(declare-fun d!89306 () Bool)

(assert (=> d!89306 (= (array_inv!6160 (buf!6904 w2!580)) (bvsge (size!6436 (buf!6904 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!264495 d!89306))

(declare-fun d!89308 () Bool)

(assert (=> d!89308 (= (array_inv!6160 (buf!6904 w1!584)) (bvsge (size!6436 (buf!6904 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!264490 d!89308))

(push 1)

(assert (not b!264662))

(assert (not b!264646))

(assert (not d!89276))

(assert (not d!89250))

(assert (not b!264721))

(assert (not b!264644))

(assert (not b!264701))

(assert (not d!89288))

(assert (not b!264714))

(assert (not d!89248))

(assert (not d!89226))

(assert (not b!264726))

(assert (not bm!4096))

(assert (not bm!4085))

(assert (not b!264719))

(assert (not b!264704))

(assert (not b!264586))

(assert (not b!264699))

(assert (not b!264702))

(assert (not b!264716))

(assert (not d!89246))

(assert (not b!264664))

(assert (not b!264723))

(assert (not b!264635))

(assert (not b!264589))

(assert (not b!264707))

(assert (not d!89300))

(assert (not d!89268))

(assert (not d!89290))

(assert (not bm!4095))

(assert (not b!264584))

(assert (not b!264637))

(assert (not b!264705))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

