; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62758 () Bool)

(assert start!62758)

(declare-fun b!281017 () Bool)

(declare-datatypes ((tuple4!778 0))(
  ( (tuple4!779 (_1!12464 (_ BitVec 32)) (_2!12464 (_ BitVec 32)) (_3!1169 (_ BitVec 32)) (_4!389 (_ BitVec 32))) )
))
(declare-fun lt!417135 () tuple4!778)

(declare-fun to!789 () (_ BitVec 64))

(declare-datatypes ((array!16232 0))(
  ( (array!16233 (arr!8010 (Array (_ BitVec 32) (_ BitVec 8))) (size!7014 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16232)

(declare-fun e!200586 () Bool)

(assert (=> b!281017 (= e!200586 (not (or (= ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (and (bvsge (_4!389 lt!417135) #b00000000000000000000000000000000) (bvslt (_4!389 lt!417135) (size!7014 a1!699))))))))

(declare-fun e!200582 () Bool)

(assert (=> b!281017 e!200582))

(declare-fun res!233195 () Bool)

(assert (=> b!281017 (=> (not res!233195) (not e!200582))))

(declare-fun lt!417134 () (_ BitVec 32))

(declare-fun a2!699 () array!16232)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281017 (= res!233195 (byteRangesEq!0 (select (arr!8010 a1!699) (_3!1169 lt!417135)) (select (arr!8010 a2!699) (_3!1169 lt!417135)) lt!417134 #b00000000000000000000000000001000))))

(declare-fun b!281018 () Bool)

(declare-fun res!233198 () Bool)

(declare-fun e!200584 () Bool)

(assert (=> b!281018 (=> (not res!233198) (not e!200584))))

(declare-fun from!822 () (_ BitVec 64))

(declare-fun arrayBitRangesEq!0 (array!16232 array!16232 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!281018 (= res!233198 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!281020 () Bool)

(assert (=> b!281020 (= e!200582 (byteRangesEq!0 (select (arr!8010 a2!699) (_3!1169 lt!417135)) (select (arr!8010 a1!699) (_3!1169 lt!417135)) lt!417134 #b00000000000000000000000000001000))))

(declare-fun b!281021 () Bool)

(declare-datatypes ((Unit!19721 0))(
  ( (Unit!19722) )
))
(declare-fun e!200585 () Unit!19721)

(declare-fun Unit!19723 () Unit!19721)

(assert (=> b!281021 (= e!200585 Unit!19723)))

(declare-fun arrayRangesEq!1282 (array!16232 array!16232 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!281021 (arrayRangesEq!1282 a1!699 a2!699 (_1!12464 lt!417135) (_2!12464 lt!417135))))

(declare-fun lt!417133 () Unit!19721)

(declare-fun arrayRangesEqSymmetricLemma!189 (array!16232 array!16232 (_ BitVec 32) (_ BitVec 32)) Unit!19721)

(assert (=> b!281021 (= lt!417133 (arrayRangesEqSymmetricLemma!189 a1!699 a2!699 (_1!12464 lt!417135) (_2!12464 lt!417135)))))

(assert (=> b!281021 (arrayRangesEq!1282 a2!699 a1!699 (_1!12464 lt!417135) (_2!12464 lt!417135))))

(declare-fun b!281022 () Bool)

(declare-fun Unit!19724 () Unit!19721)

(assert (=> b!281022 (= e!200585 Unit!19724)))

(declare-fun b!281023 () Bool)

(assert (=> b!281023 (= e!200584 e!200586)))

(declare-fun res!233196 () Bool)

(assert (=> b!281023 (=> (not res!233196) (not e!200586))))

(assert (=> b!281023 (= res!233196 (not (= (_3!1169 lt!417135) (_4!389 lt!417135))))))

(declare-fun lt!417132 () Unit!19721)

(assert (=> b!281023 (= lt!417132 e!200585)))

(declare-fun c!13083 () Bool)

(assert (=> b!281023 (= c!13083 (bvslt (_1!12464 lt!417135) (_2!12464 lt!417135)))))

(assert (=> b!281023 (= lt!417134 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!778)

(assert (=> b!281023 (= lt!417135 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281019 () Bool)

(declare-fun res!233197 () Bool)

(assert (=> b!281019 (=> (not res!233197) (not e!200584))))

(assert (=> b!281019 (= res!233197 (bvslt from!822 to!789))))

(declare-fun res!233194 () Bool)

(assert (=> start!62758 (=> (not res!233194) (not e!200584))))

(assert (=> start!62758 (= res!233194 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!7014 a1!699) (size!7014 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7014 a1!699))))))))

(assert (=> start!62758 e!200584))

(assert (=> start!62758 true))

(declare-fun array_inv!6738 (array!16232) Bool)

(assert (=> start!62758 (array_inv!6738 a1!699)))

(assert (=> start!62758 (array_inv!6738 a2!699)))

(assert (= (and start!62758 res!233194) b!281018))

(assert (= (and b!281018 res!233198) b!281019))

(assert (= (and b!281019 res!233197) b!281023))

(assert (= (and b!281023 c!13083) b!281021))

(assert (= (and b!281023 (not c!13083)) b!281022))

(assert (= (and b!281023 res!233196) b!281017))

(assert (= (and b!281017 res!233195) b!281020))

(declare-fun m!414041 () Bool)

(assert (=> b!281018 m!414041))

(declare-fun m!414043 () Bool)

(assert (=> b!281023 m!414043))

(declare-fun m!414045 () Bool)

(assert (=> b!281017 m!414045))

(declare-fun m!414047 () Bool)

(assert (=> b!281017 m!414047))

(assert (=> b!281017 m!414045))

(assert (=> b!281017 m!414047))

(declare-fun m!414049 () Bool)

(assert (=> b!281017 m!414049))

(assert (=> b!281020 m!414047))

(assert (=> b!281020 m!414045))

(assert (=> b!281020 m!414047))

(assert (=> b!281020 m!414045))

(declare-fun m!414051 () Bool)

(assert (=> b!281020 m!414051))

(declare-fun m!414053 () Bool)

(assert (=> start!62758 m!414053))

(declare-fun m!414055 () Bool)

(assert (=> start!62758 m!414055))

(declare-fun m!414057 () Bool)

(assert (=> b!281021 m!414057))

(declare-fun m!414059 () Bool)

(assert (=> b!281021 m!414059))

(declare-fun m!414061 () Bool)

(assert (=> b!281021 m!414061))

(push 1)

(assert (not b!281020))

(assert (not b!281017))

(assert (not start!62758))

(assert (not b!281018))

(assert (not b!281021))

(assert (not b!281023))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!281096 () Bool)

(declare-fun e!200656 () Bool)

(declare-fun lt!417168 () tuple4!778)

(assert (=> b!281096 (= e!200656 (arrayRangesEq!1282 a1!699 a2!699 (_1!12464 lt!417168) (_2!12464 lt!417168)))))

(declare-fun b!281097 () Bool)

(declare-fun e!200651 () Bool)

(declare-fun e!200655 () Bool)

(assert (=> b!281097 (= e!200651 e!200655)))

(declare-fun c!13092 () Bool)

(assert (=> b!281097 (= c!13092 (= (_3!1169 lt!417168) (_4!389 lt!417168)))))

(declare-fun b!281098 () Bool)

(declare-fun e!200653 () Bool)

(assert (=> b!281098 (= e!200653 e!200651)))

(declare-fun res!233259 () Bool)

(assert (=> b!281098 (=> (not res!233259) (not e!200651))))

(assert (=> b!281098 (= res!233259 e!200656)))

(declare-fun res!233256 () Bool)

(assert (=> b!281098 (=> res!233256 e!200656)))

(assert (=> b!281098 (= res!233256 (bvsge (_1!12464 lt!417168) (_2!12464 lt!417168)))))

(declare-fun lt!417167 () (_ BitVec 32))

(assert (=> b!281098 (= lt!417167 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!417166 () (_ BitVec 32))

(assert (=> b!281098 (= lt!417166 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!281098 (= lt!417168 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!281099 () Bool)

(declare-fun e!200654 () Bool)

(assert (=> b!281099 (= e!200655 e!200654)))

(declare-fun res!233257 () Bool)

(declare-fun call!4673 () Bool)

(assert (=> b!281099 (= res!233257 call!4673)))

(assert (=> b!281099 (=> (not res!233257) (not e!200654))))

(declare-fun b!281100 () Bool)

(assert (=> b!281100 (= e!200655 call!4673)))

(declare-fun b!281101 () Bool)

(declare-fun res!233255 () Bool)

(assert (=> b!281101 (= res!233255 (= lt!417167 #b00000000000000000000000000000000))))

(declare-fun e!200652 () Bool)

(assert (=> b!281101 (=> res!233255 e!200652)))

(assert (=> b!281101 (= e!200654 e!200652)))

(declare-fun d!96686 () Bool)

(declare-fun res!233258 () Bool)

(assert (=> d!96686 (=> res!233258 e!200653)))

(assert (=> d!96686 (= res!233258 (bvsge from!822 to!789))))

(assert (=> d!96686 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!200653)))

(declare-fun bm!4670 () Bool)

(assert (=> bm!4670 (= call!4673 (byteRangesEq!0 (select (arr!8010 a1!699) (_3!1169 lt!417168)) (select (arr!8010 a2!699) (_3!1169 lt!417168)) lt!417166 (ite c!13092 lt!417167 #b00000000000000000000000000001000)))))

(declare-fun b!281102 () Bool)

(assert (=> b!281102 (= e!200652 (byteRangesEq!0 (select (arr!8010 a1!699) (_4!389 lt!417168)) (select (arr!8010 a2!699) (_4!389 lt!417168)) #b00000000000000000000000000000000 lt!417167))))

(assert (= (and d!96686 (not res!233258)) b!281098))

(assert (= (and b!281098 (not res!233256)) b!281096))

(assert (= (and b!281098 res!233259) b!281097))

(assert (= (and b!281097 c!13092) b!281100))

(assert (= (and b!281097 (not c!13092)) b!281099))

(assert (= (and b!281099 res!233257) b!281101))

(assert (= (and b!281101 (not res!233255)) b!281102))

(assert (= (or b!281100 b!281099) bm!4670))

(declare-fun m!414119 () Bool)

(assert (=> b!281096 m!414119))

(assert (=> b!281098 m!414043))

(declare-fun m!414121 () Bool)

(assert (=> bm!4670 m!414121))

(declare-fun m!414123 () Bool)

(assert (=> bm!4670 m!414123))

(assert (=> bm!4670 m!414121))

(assert (=> bm!4670 m!414123))

(declare-fun m!414125 () Bool)

(assert (=> bm!4670 m!414125))

(declare-fun m!414127 () Bool)

(assert (=> b!281102 m!414127))

(declare-fun m!414129 () Bool)

(assert (=> b!281102 m!414129))

(assert (=> b!281102 m!414127))

(assert (=> b!281102 m!414129))

(declare-fun m!414131 () Bool)

(assert (=> b!281102 m!414131))

(assert (=> b!281018 d!96686))

(declare-fun d!96688 () Bool)

(assert (=> d!96688 (= (array_inv!6738 a1!699) (bvsge (size!7014 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62758 d!96688))

(declare-fun d!96690 () Bool)

(assert (=> d!96690 (= (array_inv!6738 a2!699) (bvsge (size!7014 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62758 d!96690))

(declare-fun d!96692 () Bool)

(assert (=> d!96692 (= (arrayBitIndices!0 from!822 to!789) (tuple4!779 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!281023 d!96692))

(declare-fun d!96694 () Bool)

