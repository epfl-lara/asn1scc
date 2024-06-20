; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67074 () Bool)

(assert start!67074)

(declare-fun b!300668 () Bool)

(declare-fun e!215924 () Bool)

(declare-fun e!215927 () Bool)

(assert (=> b!300668 (= e!215924 e!215927)))

(declare-fun res!247794 () Bool)

(assert (=> b!300668 (=> (not res!247794) (not e!215927))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-fun lt!436165 () (_ BitVec 64))

(assert (=> b!300668 (= res!247794 (and (bvsle toBit!258 lt!436165) (bvsle fromBit!258 lt!436165)))))

(declare-datatypes ((array!18235 0))(
  ( (array!18236 (arr!9002 (Array (_ BitVec 32) (_ BitVec 8))) (size!7919 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18235)

(assert (=> b!300668 (= lt!436165 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7919 a1!948))))))

(declare-fun b!300669 () Bool)

(declare-fun e!215930 () Bool)

(declare-fun e!215929 () Bool)

(assert (=> b!300669 (= e!215930 e!215929)))

(declare-fun res!247796 () Bool)

(assert (=> b!300669 (=> (not res!247796) (not e!215929))))

(declare-datatypes ((tuple4!1046 0))(
  ( (tuple4!1047 (_1!13178 (_ BitVec 32)) (_2!13178 (_ BitVec 32)) (_3!1480 (_ BitVec 32)) (_4!523 (_ BitVec 32))) )
))
(declare-fun lt!436169 () tuple4!1046)

(assert (=> b!300669 (= res!247796 (= (_3!1480 lt!436169) (_4!523 lt!436169)))))

(declare-datatypes ((Unit!21036 0))(
  ( (Unit!21037) )
))
(declare-fun lt!436163 () Unit!21036)

(declare-fun e!215926 () Unit!21036)

(assert (=> b!300669 (= lt!436163 e!215926)))

(declare-fun c!14019 () Bool)

(declare-fun lt!436161 () tuple4!1046)

(assert (=> b!300669 (= c!14019 (and (bvslt (_4!523 lt!436169) (_4!523 lt!436161)) (bvslt (_3!1480 lt!436161) (_4!523 lt!436169))))))

(declare-fun lt!436164 () Unit!21036)

(declare-fun e!215925 () Unit!21036)

(assert (=> b!300669 (= lt!436164 e!215925)))

(declare-fun c!14021 () Bool)

(assert (=> b!300669 (= c!14021 (and (bvslt (_3!1480 lt!436161) (_3!1480 lt!436169)) (bvslt (_3!1480 lt!436169) (_4!523 lt!436161))))))

(declare-fun b!300670 () Bool)

(declare-fun res!247799 () Bool)

(declare-fun lt!436168 () (_ BitVec 32))

(assert (=> b!300670 (= res!247799 (= lt!436168 #b00000000000000000000000000000000))))

(declare-fun e!215921 () Bool)

(assert (=> b!300670 (=> res!247799 e!215921)))

(declare-fun e!215922 () Bool)

(assert (=> b!300670 (= e!215922 e!215921)))

(declare-fun b!300671 () Bool)

(declare-fun res!247798 () Bool)

(assert (=> b!300671 (=> (not res!247798) (not e!215927))))

(declare-fun a2!948 () array!18235)

(declare-fun arrayBitRangesEq!0 (array!18235 array!18235 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!300671 (= res!247798 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!300672 () Bool)

(declare-fun Unit!21038 () Unit!21036)

(assert (=> b!300672 (= e!215925 Unit!21038)))

(declare-fun b!300673 () Bool)

(declare-fun res!247802 () Bool)

(assert (=> b!300673 (=> (not res!247802) (not e!215927))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun fromSlice!52 () (_ BitVec 64))

(assert (=> b!300673 (= res!247802 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436165) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!300674 () Bool)

(declare-fun e!215928 () Bool)

(declare-fun call!5399 () Bool)

(assert (=> b!300674 (= e!215928 call!5399)))

(declare-fun b!300675 () Bool)

(declare-fun lt!436162 () Unit!21036)

(assert (=> b!300675 (= e!215925 lt!436162)))

(declare-fun arrayRangesEqImpliesEq!236 (array!18235 array!18235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21036)

(assert (=> b!300675 (= lt!436162 (arrayRangesEqImpliesEq!236 a1!948 a2!948 (_1!13178 lt!436161) (_3!1480 lt!436169) (_2!13178 lt!436161)))))

(assert (=> b!300675 (= (select (arr!9002 a1!948) (_3!1480 lt!436169)) (select (arr!9002 a2!948) (_3!1480 lt!436169)))))

(declare-fun b!300676 () Bool)

(declare-fun res!247797 () Bool)

(assert (=> b!300676 (=> (not res!247797) (not e!215929))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300676 (= res!247797 (byteRangesEq!0 (select (arr!9002 a1!948) (_3!1480 lt!436169)) (select (arr!9002 a2!948) (_3!1480 lt!436169)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsrem toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun c!14020 () Bool)

(declare-fun bm!5396 () Bool)

(declare-fun lt!436160 () (_ BitVec 32))

(assert (=> bm!5396 (= call!5399 (byteRangesEq!0 (select (arr!9002 a1!948) (_3!1480 lt!436161)) (select (arr!9002 a2!948) (_3!1480 lt!436161)) lt!436160 (ite c!14020 lt!436168 #b00000000000000000000000000000111)))))

(declare-fun b!300678 () Bool)

(assert (=> b!300678 (= e!215929 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 fromSlice!52) (bvsgt toSlice!52 lt!436165)))))

(declare-fun b!300679 () Bool)

(declare-fun lt!436170 () Unit!21036)

(assert (=> b!300679 (= e!215926 lt!436170)))

(assert (=> b!300679 (= lt!436170 (arrayRangesEqImpliesEq!236 a1!948 a2!948 (_1!13178 lt!436161) (_4!523 lt!436169) (_2!13178 lt!436161)))))

(assert (=> b!300679 (= (select (arr!9002 a1!948) (_4!523 lt!436169)) (select (arr!9002 a2!948) (_4!523 lt!436169)))))

(declare-fun b!300680 () Bool)

(assert (=> b!300680 (= e!215927 e!215930)))

(declare-fun res!247795 () Bool)

(assert (=> b!300680 (=> (not res!247795) (not e!215930))))

(assert (=> b!300680 (= res!247795 e!215928)))

(assert (=> b!300680 (= c!14020 (= (_3!1480 lt!436161) (_4!523 lt!436161)))))

(declare-fun lt!436167 () Unit!21036)

(declare-fun e!215923 () Unit!21036)

(assert (=> b!300680 (= lt!436167 e!215923)))

(declare-fun c!14022 () Bool)

(assert (=> b!300680 (= c!14022 (bvslt (_1!13178 lt!436169) (_2!13178 lt!436169)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1046)

(assert (=> b!300680 (= lt!436169 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!300680 (= lt!436168 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300680 (= lt!436160 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!300680 (= lt!436161 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!300681 () Bool)

(assert (=> b!300681 (= e!215928 e!215922)))

(declare-fun res!247801 () Bool)

(assert (=> b!300681 (= res!247801 call!5399)))

(assert (=> b!300681 (=> (not res!247801) (not e!215922))))

(declare-fun b!300682 () Bool)

(declare-fun Unit!21039 () Unit!21036)

(assert (=> b!300682 (= e!215923 Unit!21039)))

(declare-fun b!300683 () Bool)

(declare-fun lt!436166 () Unit!21036)

(assert (=> b!300683 (= e!215923 lt!436166)))

(declare-fun arrayRangesEqSlicedLemma!191 (array!18235 array!18235 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21036)

(assert (=> b!300683 (= lt!436166 (arrayRangesEqSlicedLemma!191 a1!948 a2!948 (_1!13178 lt!436161) (_2!13178 lt!436161) (_1!13178 lt!436169) (_2!13178 lt!436169)))))

(declare-fun arrayRangesEq!1581 (array!18235 array!18235 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!300683 (arrayRangesEq!1581 a1!948 a2!948 (_1!13178 lt!436169) (_2!13178 lt!436169))))

(declare-fun b!300684 () Bool)

(declare-fun Unit!21040 () Unit!21036)

(assert (=> b!300684 (= e!215926 Unit!21040)))

(declare-fun b!300677 () Bool)

(assert (=> b!300677 (= e!215921 (byteRangesEq!0 (select (arr!9002 a1!948) (_4!523 lt!436161)) (select (arr!9002 a2!948) (_4!523 lt!436161)) #b00000000000000000000000000000000 lt!436168))))

(declare-fun res!247800 () Bool)

(assert (=> start!67074 (=> (not res!247800) (not e!215924))))

(assert (=> start!67074 (= res!247800 (and (bvsle (size!7919 a1!948) (size!7919 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67074 e!215924))

(assert (=> start!67074 true))

(declare-fun array_inv!7531 (array!18235) Bool)

(assert (=> start!67074 (array_inv!7531 a1!948)))

(assert (=> start!67074 (array_inv!7531 a2!948)))

(assert (= (and start!67074 res!247800) b!300668))

(assert (= (and b!300668 res!247794) b!300671))

(assert (= (and b!300671 res!247798) b!300673))

(assert (= (and b!300673 res!247802) b!300680))

(assert (= (and b!300680 c!14022) b!300683))

(assert (= (and b!300680 (not c!14022)) b!300682))

(assert (= (and b!300680 c!14020) b!300674))

(assert (= (and b!300680 (not c!14020)) b!300681))

(assert (= (and b!300681 res!247801) b!300670))

(assert (= (and b!300670 (not res!247799)) b!300677))

(assert (= (or b!300674 b!300681) bm!5396))

(assert (= (and b!300680 res!247795) b!300669))

(assert (= (and b!300669 c!14021) b!300675))

(assert (= (and b!300669 (not c!14021)) b!300672))

(assert (= (and b!300669 c!14019) b!300679))

(assert (= (and b!300669 (not c!14019)) b!300684))

(assert (= (and b!300669 res!247796) b!300676))

(assert (= (and b!300676 res!247797) b!300678))

(declare-fun m!439625 () Bool)

(assert (=> b!300676 m!439625))

(declare-fun m!439627 () Bool)

(assert (=> b!300676 m!439627))

(assert (=> b!300676 m!439625))

(assert (=> b!300676 m!439627))

(declare-fun m!439629 () Bool)

(assert (=> b!300676 m!439629))

(declare-fun m!439631 () Bool)

(assert (=> b!300679 m!439631))

(declare-fun m!439633 () Bool)

(assert (=> b!300679 m!439633))

(declare-fun m!439635 () Bool)

(assert (=> b!300679 m!439635))

(declare-fun m!439637 () Bool)

(assert (=> b!300671 m!439637))

(declare-fun m!439639 () Bool)

(assert (=> start!67074 m!439639))

(declare-fun m!439641 () Bool)

(assert (=> start!67074 m!439641))

(declare-fun m!439643 () Bool)

(assert (=> b!300675 m!439643))

(assert (=> b!300675 m!439625))

(assert (=> b!300675 m!439627))

(declare-fun m!439645 () Bool)

(assert (=> b!300680 m!439645))

(declare-fun m!439647 () Bool)

(assert (=> b!300680 m!439647))

(declare-fun m!439649 () Bool)

(assert (=> b!300677 m!439649))

(declare-fun m!439651 () Bool)

(assert (=> b!300677 m!439651))

(assert (=> b!300677 m!439649))

(assert (=> b!300677 m!439651))

(declare-fun m!439653 () Bool)

(assert (=> b!300677 m!439653))

(declare-fun m!439655 () Bool)

(assert (=> b!300683 m!439655))

(declare-fun m!439657 () Bool)

(assert (=> b!300683 m!439657))

(declare-fun m!439659 () Bool)

(assert (=> bm!5396 m!439659))

(declare-fun m!439661 () Bool)

(assert (=> bm!5396 m!439661))

(assert (=> bm!5396 m!439659))

(assert (=> bm!5396 m!439661))

(declare-fun m!439663 () Bool)

(assert (=> bm!5396 m!439663))

(check-sat (not start!67074) (not b!300671) (not b!300675) (not b!300679) (not b!300676) (not b!300683) (not b!300677) (not bm!5396) (not b!300680))
(check-sat)
