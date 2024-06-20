; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66988 () Bool)

(assert start!66988)

(declare-fun b!299673 () Bool)

(declare-datatypes ((Unit!20941 0))(
  ( (Unit!20942) )
))
(declare-fun e!215163 () Unit!20941)

(declare-fun Unit!20943 () Unit!20941)

(assert (=> b!299673 (= e!215163 Unit!20943)))

(declare-fun b!299674 () Bool)

(declare-fun res!247259 () Bool)

(declare-fun lt!435457 () (_ BitVec 32))

(assert (=> b!299674 (= res!247259 (= lt!435457 #b00000000000000000000000000000000))))

(declare-fun e!215166 () Bool)

(assert (=> b!299674 (=> res!247259 e!215166)))

(declare-fun e!215165 () Bool)

(assert (=> b!299674 (= e!215165 e!215166)))

(declare-fun b!299675 () Bool)

(declare-fun e!215160 () Bool)

(assert (=> b!299675 (= e!215160 e!215165)))

(declare-fun res!247264 () Bool)

(declare-fun call!5324 () Bool)

(assert (=> b!299675 (= res!247264 call!5324)))

(assert (=> b!299675 (=> (not res!247264) (not e!215165))))

(declare-datatypes ((tuple4!1002 0))(
  ( (tuple4!1003 (_1!13156 (_ BitVec 32)) (_2!13156 (_ BitVec 32)) (_3!1458 (_ BitVec 32)) (_4!501 (_ BitVec 32))) )
))
(declare-fun lt!435454 () tuple4!1002)

(declare-fun lt!435461 () (_ BitVec 32))

(declare-datatypes ((array!18188 0))(
  ( (array!18189 (arr!8980 (Array (_ BitVec 32) (_ BitVec 8))) (size!7897 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18188)

(declare-fun c!13791 () Bool)

(declare-fun a2!948 () array!18188)

(declare-fun bm!5321 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5321 (= call!5324 (byteRangesEq!0 (select (arr!8980 a1!948) (_3!1458 lt!435454)) (select (arr!8980 a2!948) (_3!1458 lt!435454)) lt!435461 (ite c!13791 lt!435457 #b00000000000000000000000000000111)))))

(declare-fun b!299676 () Bool)

(declare-fun e!215162 () Bool)

(assert (=> b!299676 (= e!215162 false)))

(declare-fun lt!435459 () Unit!20941)

(assert (=> b!299676 (= lt!435459 e!215163)))

(declare-fun c!13789 () Bool)

(declare-fun lt!435455 () tuple4!1002)

(assert (=> b!299676 (= c!13789 (and (bvslt (_3!1458 lt!435454) (_3!1458 lt!435455)) (bvslt (_3!1458 lt!435455) (_4!501 lt!435454))))))

(declare-fun b!299677 () Bool)

(assert (=> b!299677 (= e!215166 (byteRangesEq!0 (select (arr!8980 a1!948) (_4!501 lt!435454)) (select (arr!8980 a2!948) (_4!501 lt!435454)) #b00000000000000000000000000000000 lt!435457))))

(declare-fun b!299678 () Bool)

(assert (=> b!299678 (= e!215160 call!5324)))

(declare-fun b!299680 () Bool)

(declare-fun e!215161 () Unit!20941)

(declare-fun Unit!20944 () Unit!20941)

(assert (=> b!299680 (= e!215161 Unit!20944)))

(declare-fun b!299681 () Bool)

(declare-fun e!215164 () Bool)

(assert (=> b!299681 (= e!215164 e!215162)))

(declare-fun res!247262 () Bool)

(assert (=> b!299681 (=> (not res!247262) (not e!215162))))

(assert (=> b!299681 (= res!247262 e!215160)))

(assert (=> b!299681 (= c!13791 (= (_3!1458 lt!435454) (_4!501 lt!435454)))))

(declare-fun lt!435458 () Unit!20941)

(assert (=> b!299681 (= lt!435458 e!215161)))

(declare-fun c!13790 () Bool)

(assert (=> b!299681 (= c!13790 (bvslt (_1!13156 lt!435455) (_2!13156 lt!435455)))))

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1002)

(assert (=> b!299681 (= lt!435455 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(declare-fun toBit!258 () (_ BitVec 64))

(assert (=> b!299681 (= lt!435457 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun fromBit!258 () (_ BitVec 64))

(assert (=> b!299681 (= lt!435461 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!299681 (= lt!435454 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!299682 () Bool)

(declare-fun res!247260 () Bool)

(assert (=> b!299682 (=> (not res!247260) (not e!215164))))

(declare-fun arrayBitRangesEq!0 (array!18188 array!18188 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!299682 (= res!247260 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!299683 () Bool)

(declare-fun res!247265 () Bool)

(assert (=> b!299683 (=> (not res!247265) (not e!215164))))

(declare-fun lt!435460 () (_ BitVec 64))

(assert (=> b!299683 (= res!247265 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!435460) (not (= fromSlice!52 toSlice!52))))))

(declare-fun res!247263 () Bool)

(declare-fun e!215167 () Bool)

(assert (=> start!66988 (=> (not res!247263) (not e!215167))))

(assert (=> start!66988 (= res!247263 (and (bvsle (size!7897 a1!948) (size!7897 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!66988 e!215167))

(assert (=> start!66988 true))

(declare-fun array_inv!7509 (array!18188) Bool)

(assert (=> start!66988 (array_inv!7509 a1!948)))

(assert (=> start!66988 (array_inv!7509 a2!948)))

(declare-fun b!299679 () Bool)

(declare-fun lt!435456 () Unit!20941)

(assert (=> b!299679 (= e!215161 lt!435456)))

(declare-fun arrayRangesEqSlicedLemma!169 (array!18188 array!18188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20941)

(assert (=> b!299679 (= lt!435456 (arrayRangesEqSlicedLemma!169 a1!948 a2!948 (_1!13156 lt!435454) (_2!13156 lt!435454) (_1!13156 lt!435455) (_2!13156 lt!435455)))))

(declare-fun arrayRangesEq!1559 (array!18188 array!18188 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!299679 (arrayRangesEq!1559 a1!948 a2!948 (_1!13156 lt!435455) (_2!13156 lt!435455))))

(declare-fun b!299684 () Bool)

(assert (=> b!299684 (= e!215167 e!215164)))

(declare-fun res!247261 () Bool)

(assert (=> b!299684 (=> (not res!247261) (not e!215164))))

(assert (=> b!299684 (= res!247261 (and (bvsle toBit!258 lt!435460) (bvsle fromBit!258 lt!435460)))))

(assert (=> b!299684 (= lt!435460 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7897 a1!948))))))

(declare-fun b!299685 () Bool)

(declare-fun lt!435462 () Unit!20941)

(assert (=> b!299685 (= e!215163 lt!435462)))

(declare-fun arrayRangesEqImpliesEq!214 (array!18188 array!18188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20941)

(assert (=> b!299685 (= lt!435462 (arrayRangesEqImpliesEq!214 a1!948 a2!948 (_1!13156 lt!435454) (_3!1458 lt!435455) (_2!13156 lt!435454)))))

(assert (=> b!299685 (= (select (arr!8980 a1!948) (_3!1458 lt!435455)) (select (arr!8980 a2!948) (_3!1458 lt!435455)))))

(assert (= (and start!66988 res!247263) b!299684))

(assert (= (and b!299684 res!247261) b!299682))

(assert (= (and b!299682 res!247260) b!299683))

(assert (= (and b!299683 res!247265) b!299681))

(assert (= (and b!299681 c!13790) b!299679))

(assert (= (and b!299681 (not c!13790)) b!299680))

(assert (= (and b!299681 c!13791) b!299678))

(assert (= (and b!299681 (not c!13791)) b!299675))

(assert (= (and b!299675 res!247264) b!299674))

(assert (= (and b!299674 (not res!247259)) b!299677))

(assert (= (or b!299678 b!299675) bm!5321))

(assert (= (and b!299681 res!247262) b!299676))

(assert (= (and b!299676 c!13789) b!299685))

(assert (= (and b!299676 (not c!13789)) b!299673))

(declare-fun m!438775 () Bool)

(assert (=> b!299685 m!438775))

(declare-fun m!438777 () Bool)

(assert (=> b!299685 m!438777))

(declare-fun m!438779 () Bool)

(assert (=> b!299685 m!438779))

(declare-fun m!438781 () Bool)

(assert (=> start!66988 m!438781))

(declare-fun m!438783 () Bool)

(assert (=> start!66988 m!438783))

(declare-fun m!438785 () Bool)

(assert (=> b!299681 m!438785))

(declare-fun m!438787 () Bool)

(assert (=> b!299681 m!438787))

(declare-fun m!438789 () Bool)

(assert (=> b!299679 m!438789))

(declare-fun m!438791 () Bool)

(assert (=> b!299679 m!438791))

(declare-fun m!438793 () Bool)

(assert (=> b!299682 m!438793))

(declare-fun m!438795 () Bool)

(assert (=> bm!5321 m!438795))

(declare-fun m!438797 () Bool)

(assert (=> bm!5321 m!438797))

(assert (=> bm!5321 m!438795))

(assert (=> bm!5321 m!438797))

(declare-fun m!438799 () Bool)

(assert (=> bm!5321 m!438799))

(declare-fun m!438801 () Bool)

(assert (=> b!299677 m!438801))

(declare-fun m!438803 () Bool)

(assert (=> b!299677 m!438803))

(assert (=> b!299677 m!438801))

(assert (=> b!299677 m!438803))

(declare-fun m!438805 () Bool)

(assert (=> b!299677 m!438805))

(push 1)

(assert (not start!66988))

(assert (not b!299682))

(assert (not b!299681))

(assert (not bm!5321))

(assert (not b!299677))

(assert (not b!299685))

(assert (not b!299679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

